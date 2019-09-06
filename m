Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0856EABAB9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 16:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033736E2CE;
	Fri,  6 Sep 2019 14:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA6C6E2CE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 14:21:19 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id t50so6482747edd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2019 07:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=iKAyeuqnWUf5/lc5Xnv5ztwulelUcUvRxsrGOgbOCMk=;
 b=fRJhjeqDhSvTRghTXzL6O0hPXhVfefjTuLcHfDTeznijk3uhJpgO53FGoLW8ILn9Kz
 ++8MxzikRqK6GvQypTrsygx4WL10TMUTfQvCJiWMLE+0T/2pelez2ZWsskxrR7VcQr7u
 DdUOf5Tq6x5y7BsuwEJoI/+IUeU55nDxSuR7W8WCWX2Ug56Hfm8xAv0NjWuc9yiDFey3
 V3vCZ07L9pbci3qZ5QtgiSy/SiI7q/mMG96vDyt2ijhpJ2SVyxwc7Lt2aijU7KzOA0s+
 dVrWMUDB3xAYP3ooUJ75jMgiLvyaVqJ1NuQvcKEv8J1ozHThiLFC70jz8iNBRN0kyEau
 MObA==
X-Gm-Message-State: APjAAAWFFtUA1J2tO/LIQbVIBnS0HywC96V3/FYhWu8rC6VoAGNqLX0X
 ZCacck4RPexhgjrBJHf3Y0rUkg==
X-Google-Smtp-Source: APXvYqy7xlFkCBE3AzKuFGzkQ+ECWPG04SU2qyWYbVagbv/KgJh6g/Tbz+PEBXSoKyoaA13cjqeURw==
X-Received: by 2002:aa7:db05:: with SMTP id t5mr10047698eds.242.1567779677980; 
 Fri, 06 Sep 2019 07:21:17 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id g6sm968601edk.40.2019.09.06.07.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 07:21:17 -0700 (PDT)
Date: Fri, 6 Sep 2019 16:21:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH] drm: Use EOPNOTSUPP, not ENOTSUPP
Message-ID: <20190906142115.GE3958@phenom.ffwll.local>
References: <20190904143942.31756-1-daniel.vetter@ffwll.ch>
 <9713c3f86aac16d7f75a1a9a76de4c4dfd03a6c4.camel@intel.com>
 <CAKMK7uHyi5zM=Yao+5V_yJ4yofiOs0qorz+yTtMe7mgErNKoig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHyi5zM=Yao+5V_yJ4yofiOs0qorz+yTtMe7mgErNKoig@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=iKAyeuqnWUf5/lc5Xnv5ztwulelUcUvRxsrGOgbOCMk=;
 b=M0jk182Ns/ctt56k252CE9z6YIYi6lHDucoxSUH8tRzS9Y0tI4sEg008WRx1iMLvz6
 oskEtTtlQN4RbH+EAtFgKh6FwSeLWKtM2O0p82BUGk6PKPuyXMfmZaA9IwXUSksOET7w
 xVGmeK8M90isEoDSgpsxW8lXYmoatb6RiE07w=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "sean@poorly.run" <sean@poorly.run>,
 "andresx7@gmail.com" <andresx7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMTA6MDU6MDlQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIFNlcCA0LCAyMDE5IGF0IDk6NTggUE0gU291emEsIEpvc2UgPGpvc2Uu
c291emFAaW50ZWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIDIwMTktMDktMDQgYXQgMTY6
MzkgKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+IC0gaXQncyB3aGF0IHdlIHJlY29t
bWVuZCBpbiBvdXIgZG9jczoKPiA+ID4KPiA+ID4gaHR0cHM6Ly9kcmkuZnJlZWRlc2t0b3Aub3Jn
L2RvY3MvZHJtL2dwdS9kcm0tdWFwaS5odG1sI3JlY29tbWVuZGVkLWlvY3RsLXJldHVybi12YWx1
ZXMKPiA+ID4KPiA+ID4gLSBpdCdzIHRoZSBvdmVyd2hlbG1pbmdseSB1c2VkIGVycm9yIGNvZGUg
Zm9yICJvcGVyYXRpb24gbm90Cj4gPiA+ICAgc3VwcG9ydGVkIiwgYXQgbGVhc3QgaW4gZHJtIGNv
cmUgKHNsaWdodGx5IGxlc3Mgc28gaW4gZHJpdmVycyk6Cj4gPiA+Cj4gPiA+ICQgZ2l0IGdyZXAg
RU9QTk9UU1VQIC0tIGRyaXZlcnMvZ3B1L2RybS8qYyB8IHdjIC1sCj4gPiA+IDgzCj4gPiA+ICQg
Z2l0IGdyZXAgRU5PVFNVUCAtLSBkcml2ZXJzL2dwdS9kcm0vKmMgfCB3YyAtbAo+ID4gPiA1Cj4g
PiA+Cj4gPiA+IC0gaW5jbHVkZS9saW51eC9lcnJuby5oIG1ha2VzIGl0IGZhaXJseSBjbGVhciB0
aGF0IHRoZXNlIGFyZSBmb3IKPiA+ID4gbmZzdjMKPiA+ID4gICAocGx1cyB0aGV5IGFsc28gaGF2
ZSBlcnJvciBjb2RlcyBhYm92ZSA1MTIsIHdoaWNoIGlzIHRoZSBibG9jayB3aXRoCj4gPiA+ICAg
c29tZSBzcGVjaWFsIGJlaGF2aW91ciAuLi4pCj4gPiA+Cj4gPiA+IC8qIERlZmluZWQgZm9yIHRo
ZSBORlN2MyBwcm90b2NvbCAqLwo+ID4gPgo+ID4gPiBJZiB0aGUgYWJvdmUgaXNuJ3QgcmVmbGVj
dGluZyBjdXJyZW50IHByYWN0aWNlLCB0aGVuIEkgZ3Vlc3Mgd2UKPiA+ID4gc2hvdWxkCj4gPiA+
IGF0IGxlYXN0IHVwZGF0ZSB0aGUgZG9jcy4KPiA+Cj4gPiBIb3BlZnVsbHkgdGhpcyB3aWxsIG5v
dCBicmVhayBhbnkgdXNlcnNwYWNlCj4gCj4gTm9uZSBvZiB0aGUgZnVuY3Rpb25zIGluIGRybV9l
ZGlkLmMgYWZmZWN0ZWQgYnkgdGhpcyByZWFjaCB1c2Vyc3BhY2UsCj4gaXQncyBhbGwgZHJpdmVy
IGludGVybmFsLgo+IAo+IFNhbWUgZm9yIHRoZSBtaXBpIGZ1bmN0aW9uLCB0aGF0IGVycm9yIGNv
ZGUgc2hvdWxkIGJlIGhhbmRsZWQgYnkKPiBkcml2ZXJzLiBEcml2ZXJzIGFyZSBzdXBwb3NlZCB0
byByZW1hcCAidGhlIGh3IGlzIG9uIGZpcmUiIHRvIEVJTyB3aGVuCj4gcmVwb3J0aW5nIHVwIHRv
IHVzZXJzcGFjZSwgYnV0IEkgdGhpbmsgaWYgYSBkcml2ZXIgc2VlcyB0aGlzIGl0IHdvdWxkCj4g
YmUgYSBkcml2ZXIgYnVnLgo+IAo+IFNvIG5vIHdheSB0aGlzIGdvZXMgb3V0IHRvIHVzZXJzcGFj
ZSwgSSByZWFsbHkgb25seSBkaWQgdGhpcyB0byBoYXZlCj4gdGhlIGRybSBjb3JlL2hlbHBlcnMg
YmUgMTAwJSBjb25zaXN0ZW50IHdpdGggb3VyIGRvY3VtZW50ZWQKPiByZWNvbW1lbmRhdGlvbnMg
aGVyZS4KPiAKPiBJJ2xsIHN1bW1hcml6ZSB0aGUgYWJvdmUgaW4gdGhlIGNvbW1pdCBtZXNzYWdl
IHdoZW4gSSBtZXJnZSB0aGUgcGF0Y2guCj4gCj4gPiBSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0
byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Cj4gCj4gVGhhbmtzLCBEYW5pZWwKCkFw
cGxpZWQgbm93LgotRGFuaWVsCgo+IAo+ID4KPiA+ID4KPiA+ID4gQ2M6IEpvc8OpIFJvYmVydG8g
ZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgo+ID4gPiBDYzogTWFhcnRlbiBMYW5raG9y
c3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiA+ID4gQ2M6IE1heGltZSBS
aXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiA+ID4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29y
bHkucnVuPgo+ID4gPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
Pgo+ID4gPiBDYzogQW5kcmVzIFJvZHJpZ3VleiA8YW5kcmVzeDdAZ21haWwuY29tPgo+ID4gPiBD
YzogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+
ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jICAgICB8IDYgKysrLS0tCj4gPiA+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMgfCAyICstCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMK
PiA+ID4gaW5kZXggODJhNGNlZWQzZmNmLi4xMmM3ODNmNGQ5NTYgMTAwNjQ0Cj4gPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZWRpZC5jCj4gPiA+IEBAIC0zNzE5LDcgKzM3MTksNyBAQCBjZWFfZGJfb2Zmc2V0cyhjb25z
dCB1OCAqY2VhLCBpbnQgKnN0YXJ0LCBpbnQKPiA+ID4gKmVuZCkKPiA+ID4gICAgICAgICAgICAg
ICBpZiAoKmVuZCA8IDQgfHwgKmVuZCA+IDEyNykKPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiAtRVJBTkdFOwo+ID4gPiAgICAgICB9IGVsc2Ugewo+ID4gPiAtICAgICAgICAgICAg
IHJldHVybiAtRU5PVFNVUFA7Cj4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQ
Owo+ID4gPiAgICAgICB9Cj4gPiA+Cj4gPiA+ICAgICAgIHJldHVybiAwOwo+ID4gPiBAQCAtNDE4
OCw3ICs0MTg4LDcgQEAgaW50IGRybV9lZGlkX3RvX3NhZChzdHJ1Y3QgZWRpZCAqZWRpZCwgc3Ry
dWN0Cj4gPiA+IGNlYV9zYWQgKipzYWRzKQo+ID4gPgo+ID4gPiAgICAgICBpZiAoY2VhX3Jldmlz
aW9uKGNlYSkgPCAzKSB7Cj4gPiA+ICAgICAgICAgICAgICAgRFJNX0RFQlVHX0tNUygiU0FEOiB3
cm9uZyBDRUEgcmV2aXNpb25cbiIpOwo+ID4gPiAtICAgICAgICAgICAgIHJldHVybiAtRU5PVFNV
UFA7Cj4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4gPiAgICAgICB9
Cj4gPiA+Cj4gPiA+ICAgICAgIGlmIChjZWFfZGJfb2Zmc2V0cyhjZWEsICZzdGFydCwgJmVuZCkp
IHsKPiA+ID4gQEAgLTQyNDksNyArNDI0OSw3IEBAIGludCBkcm1fZWRpZF90b19zcGVha2VyX2Fs
bG9jYXRpb24oc3RydWN0IGVkaWQKPiA+ID4gKmVkaWQsIHU4ICoqc2FkYikKPiA+ID4KPiA+ID4g
ICAgICAgaWYgKGNlYV9yZXZpc2lvbihjZWEpIDwgMykgewo+ID4gPiAgICAgICAgICAgICAgIERS
TV9ERUJVR19LTVMoIlNBRDogd3JvbmcgQ0VBIHJldmlzaW9uXG4iKTsKPiA+ID4gLSAgICAgICAg
ICAgICByZXR1cm4gLUVOT1RTVVBQOwo+ID4gPiArICAgICAgICAgICAgIHJldHVybiAtRU9QTk9U
U1VQUDsKPiA+ID4gICAgICAgfQo+ID4gPgo+ID4gPiAgICAgICBpZiAoY2VhX2RiX29mZnNldHMo
Y2VhLCAmc3RhcnQsICZlbmQpKSB7Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX21pcGlfZGJpLmMKPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMKPiA+
ID4gaW5kZXggYzRlZTI3MDlhNmYzLi5mODE1NDMxNmEzYjAgMTAwNjQ0Cj4gPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX21pcGlfZGJpLmMKPiA+ID4gQEAgLTk1NSw3ICs5NTUsNyBAQCBzdGF0aWMgaW50IG1pcGlf
ZGJpX3R5cGVjMV9jb21tYW5kKHN0cnVjdAo+ID4gPiBtaXBpX2RiaSAqZGJpLCB1OCAqY21kLAo+
ID4gPiAgICAgICBpbnQgcmV0Owo+ID4gPgo+ID4gPiAgICAgICBpZiAobWlwaV9kYmlfY29tbWFu
ZF9pc19yZWFkKGRiaSwgKmNtZCkpCj4gPiA+IC0gICAgICAgICAgICAgcmV0dXJuIC1FTk9UU1VQ
UDsKPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPiA+Cj4gPiA+ICAg
ICAgIE1JUElfREJJX0RFQlVHX0NPTU1BTkQoKmNtZCwgcGFyYW1ldGVycywgbnVtKTsKPiA+ID4K
PiAKPiAKPiAKPiAtLSAKPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCj4gKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5j
aAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==

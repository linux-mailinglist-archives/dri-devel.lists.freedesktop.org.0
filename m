Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F65FE5477
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 21:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588746EB85;
	Fri, 25 Oct 2019 19:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582FE6EB85
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 19:40:34 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q13so3606581wrs.12
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 12:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=2Gj222psC+ydWsaF5gMlny1BmmWIVdou0S6Ni7ju44k=;
 b=ZvhuwQarDwC1jtlmhljULlANvROoWV3cHXCjll7G2oReobYoAjoK41HB8Ofw8Y9wxh
 l52DMRjNtUPcNIyo6UQEHauu93ZZuVUjnUsCRgzurNbPj5M5YgX6IOWBF4FXBrUg8tXI
 cJrR7KjDH/2DeOi1jov8M+h8ztQib+XVAOIlpTOeP685UaJvMKAdBPqFFwOYHkcOEjmc
 sxO63Lv68GZHpPaOspaoKEDMffE7LEGIITsHFuzztLDdqU9FyMkxK+bWDdt0Hm15yl3Z
 sHd7P7lhQ8UrHzEt/W9rcbBr2aZwSe3xbhjM9fsyhFDmMALFmcSqTWsGc53p/5fMiQc9
 +ysg==
X-Gm-Message-State: APjAAAVSgh/V45poLpUWNhJPlF+8EAg6YMdogMZqdoAmgZuphoUPV400
 a2zoBiUKlxfx6noeDYecTNmw/w==
X-Google-Smtp-Source: APXvYqxxJig4xVfD7GpZ084avKsgHqDpYcderhQdMAjUkkO5TbzG8sIK5Jy5u4TdOHceXtEdNV6Mvw==
X-Received: by 2002:a05:6000:351:: with SMTP id
 e17mr4260765wre.96.1572032432883; 
 Fri, 25 Oct 2019 12:40:32 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id r65sm3210045wmr.9.2019.10.25.12.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 12:40:31 -0700 (PDT)
Date: Fri, 25 Oct 2019 21:40:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [Outreachy kernel] [Outreachy][PATCH] drm: use DIV_ROUND_UP
 helper macro for calculations
Message-ID: <20191025194029.GU11828@phenom.ffwll.local>
Mail-Followup-To: Julia Lawall <julia.lawall@lip6.fr>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
References: <20191025094907.3582-1-wambui.karugax@gmail.com>
 <alpine.DEB.2.21.1910251212070.3307@hadrien>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1910251212070.3307@hadrien>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=2Gj222psC+ydWsaF5gMlny1BmmWIVdou0S6Ni7ju44k=;
 b=SlrAb0VpRC2LidQiFdSzxi13PPngSwAVFMlhwTS3HufxE9huKhmIAgqmIR//798lPx
 bOQ2RR/GU0hW0KqsOP8l98Ar1lQDKXoQA/L6z9fLQxb/D/WZFmMR+SdgcBbZtxTMxGLx
 RFNjhh0n5RhjmOQPhAXid/4PH1covWIixTMlc=
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 sean@poorly.run, Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMTI6MTI6MjNQTSArMDIwMCwgSnVsaWEgTGF3YWxsIHdy
b3RlOgo+IAo+IAo+IE9uIEZyaSwgMjUgT2N0IDIwMTksIFdhbWJ1aSBLYXJ1Z2Egd3JvdGU6Cj4g
Cj4gPiBSZXBsYWNlIG9wZW4gY29kZWQgZGl2aXNvciBjYWxjdWxhdGlvbnMgd2l0aCB0aGUgRElW
X1JPVU5EX1VQIGtlcm5lbAo+ID4gbWFjcm8gZm9yIGJldHRlciByZWFkYWJpbGl0eS4KPiA+IElz
c3VlIGZvdW5kIHVzaW5nIGNvY2NpbmVsbGU6Cj4gPiBAQAo+ID4gZXhwcmVzc2lvbiBuLGQ7Cj4g
PiBAQAo+ID4gKAo+ID4gLSAoKG4gKyBkIC0gMSkgLyBkKQo+ID4gKyBESVZfUk9VTkRfVVAobixk
KQo+ID4gfAo+ID4gLSAoKG4gKyAoZCAtIDEpKSAvIGQpCj4gPiArIERJVl9ST1VORF9VUChuLGQp
Cj4gPiApCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogV2FtYnVpIEthcnVnYSA8d2FtYnVpLmthcnVn
YXhAZ21haWwuY29tPgo+IAo+IEFja2VkLWJ5OiBKdWxpYSBMYXdhbGwgPGp1bGlhLmxhd2FsbEBs
aXA2LmZyPgoKQXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LCB0aGFua3MgZm9yIHlvdXIgcGF0Y2gu
Ci1EYW5pZWwKCj4gCj4gCj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2FncHN1cHBv
cnQuYyB8IDQgKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYWdwc3Vw
cG9ydC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hZ3BzdXBwb3J0LmMKPiA+IGluZGV4IDZlMDlm
MjdmZDlkNi4uNGM3YWQ0NmZkZDIxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9hZ3BzdXBwb3J0LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYWdwc3VwcG9ydC5j
Cj4gPiBAQCAtMjEyLDcgKzIxMiw3IEBAIGludCBkcm1fYWdwX2FsbG9jKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIHN0cnVjdCBkcm1fYWdwX2J1ZmZlciAqcmVxdWVzdCkKPiA+ICAJaWYgKCFlbnRy
eSkKPiA+ICAJCXJldHVybiAtRU5PTUVNOwo+ID4KPiA+IC0JcGFnZXMgPSAocmVxdWVzdC0+c2l6
ZSArIFBBR0VfU0laRSAtIDEpIC8gUEFHRV9TSVpFOwo+ID4gKwlwYWdlcyA9IERJVl9ST1VORF9V
UChyZXF1ZXN0LT5zaXplLCBQQUdFX1NJWkUpOwo+ID4gIAl0eXBlID0gKHUzMikgcmVxdWVzdC0+
dHlwZTsKPiA+ICAJbWVtb3J5ID0gYWdwX2FsbG9jYXRlX21lbW9yeShkZXYtPmFncC0+YnJpZGdl
LCBwYWdlcywgdHlwZSk7Cj4gPiAgCWlmICghbWVtb3J5KSB7Cj4gPiBAQCAtMzI1LDcgKzMyNSw3
IEBAIGludCBkcm1fYWdwX2JpbmQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9h
Z3BfYmluZGluZyAqcmVxdWVzdCkKPiA+ICAJZW50cnkgPSBkcm1fYWdwX2xvb2t1cF9lbnRyeShk
ZXYsIHJlcXVlc3QtPmhhbmRsZSk7Cj4gPiAgCWlmICghZW50cnkgfHwgZW50cnktPmJvdW5kKQo+
ID4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gPiAtCXBhZ2UgPSAocmVxdWVzdC0+b2Zmc2V0ICsgUEFH
RV9TSVpFIC0gMSkgLyBQQUdFX1NJWkU7Cj4gPiArCXBhZ2UgPSBESVZfUk9VTkRfVVAocmVxdWVz
dC0+b2Zmc2V0LCBQQUdFX1NJWkUpOwo+ID4gIAlyZXRjb2RlID0gZHJtX2JpbmRfYWdwKGVudHJ5
LT5tZW1vcnksIHBhZ2UpOwo+ID4gIAlpZiAocmV0Y29kZSkKPiA+ICAJCXJldHVybiByZXRjb2Rl
Owo+ID4gLS0KPiA+IDIuMjMuMAo+ID4KPiA+IC0tCj4gPiBZb3UgcmVjZWl2ZWQgdGhpcyBtZXNz
YWdlIGJlY2F1c2UgeW91IGFyZSBzdWJzY3JpYmVkIHRvIHRoZSBHb29nbGUgR3JvdXBzICJvdXRy
ZWFjaHkta2VybmVsIiBncm91cC4KPiA+IFRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBh
bmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQgYW4gZW1haWwgdG8gb3V0cmVh
Y2h5LWtlcm5lbCt1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tLgo+ID4gVG8gdmlldyB0aGlz
IGRpc2N1c3Npb24gb24gdGhlIHdlYiB2aXNpdCBodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2Qv
bXNnaWQvb3V0cmVhY2h5LWtlcm5lbC8yMDE5MTAyNTA5NDkwNy4zNTgyLTEtd2FtYnVpLmthcnVn
YXglNDBnbWFpbC5jb20uCj4gPgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1371AA6C9F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 17:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBC98930F;
	Tue,  3 Sep 2019 15:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D83890EE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 15:12:55 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id f19so4902008eds.12
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 08:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=yKP9+ivBiH1sw4eee6URddpzOtbPKdq9Qfu2yu3aBow=;
 b=kA77X1VBCVlu/ax48Zpf/w+lbfcTY3zZsyyowhpdW3n+iPhuuYW+6mYWMvu7V7HDoX
 Xd0h5814ggy7615sNnIX9Ir6KpsmDclJ2lXYbKjsxTT0NueIwienW3gewPKLdT/lFqiE
 w5cwbCsIDjUnBHLYAG5KOSEmOP2zKs11tk2HClVYE4NlYV2sImzcHshBhPOfsVh4P18m
 o7bGrLhjUiUAJg16BpS+FAlIoE7o7ESGIRCFBrUXMpX94mogs3+qUZUyw6Aq58F6WL0B
 HdjrWQvEH8MNTuAldrkGpd9MovMnUxIoUdDtmRWdOYyxHUJbrDe+5irZJDKycFpSncau
 +AVg==
X-Gm-Message-State: APjAAAUx5trAYnvDrlbrST/jzDFp+pIKfPp+A6J3qBh27hIsNVI7VtJ5
 SvIlUsvaPAHa42x9qU6hEjynhA==
X-Google-Smtp-Source: APXvYqzaQSarLXBEMaIqJv2KVA3oJPGZYejwCg1Waoata9pwT8l+ageik0Y5XuGZocGhxqA6wKAP6w==
X-Received: by 2002:a17:906:318d:: with SMTP id
 13mr28666082ejy.281.1567523573304; 
 Tue, 03 Sep 2019 08:12:53 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id x42sm3549360ede.24.2019.09.03.08.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 08:12:52 -0700 (PDT)
Date: Tue, 3 Sep 2019 17:12:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: Re: [PATCH 2/3] drm/vkms: Use wait_for_flip_done
Message-ID: <20190903151250.GZ2112@phenom.ffwll.local>
References: <20190719152314.7706-1-daniel.vetter@ffwll.ch>
 <20190719152314.7706-2-daniel.vetter@ffwll.ch>
 <20190903124906.sytisd2swa77zh4h@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903124906.sytisd2swa77zh4h@smtp.gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yKP9+ivBiH1sw4eee6URddpzOtbPKdq9Qfu2yu3aBow=;
 b=IT0ISKEsQvN/PDvrFtnCJg2bx5zaaCCMyJZpu0sDcwKChGD2j74BEJBIAf2DR5Rb9h
 VojL6XCew22MF9zdMpEIsFII2CtZgtn88wgvfBU4gil8F328Vo/Pm/GJ2ufhCeBWz6yB
 lNBZZkDwJUDhXTH3ceG72vn9ge/Q8SBuPO3Zs=
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDg6NDk6MDZBTSAtMDQwMCwgUm9kcmlnbyBTaXF1ZWly
YSB3cm90ZToKPiBPbiAwNy8xOSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IEl0J3MgdGhlIHJl
Y29tbWVuZGVkIHZlcnNpb24sIHdhaXRfZm9yX3ZibGFua3MgaXMgYSBiaXQgYSBoYWNreQo+ID4g
aW50ZXJpbSB0aGluZyB0aGF0IHByZWRhdGVzIGFsbCB0aGUgZmxpcF9kb25lIHRyYWNraW5nLiBJ
dCdzCj4gPiB1bmZvcnR1bmF0ZWx5IHN0aWxsIHRoZSBkZWZhdWx0IC4uLgo+IAo+IEp1c3Qgb25l
IHF1ZXN0aW9uLCBpcyBpdCBzYWZlIHRvIHJlcGxhY2UgZHJtX2F0b21pY19oZWxwZXJfd2FpdF9m
b3JfdmJsYW5rcyBieQo+IGRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX2ZsaXBfZG9uZT8gSSBu
b3RpY2VkIHRoYXQgb25seSBzaXggZHJpdmVycyB1c2UgdGhlc2UKPiBmdW5jdGlvbnM7IHRoZXkg
YXJlOgo+IAo+ICogYXRtZWwtaGxjZGMKPiAqIG1lZGlhdGVrCj4gKiBtc20KPiAqIHRlZ3JhCj4g
KiB0aWxjZGMKPiAqIHZpcnRpbwo+IAo+IElmIHdlIGNoYW5nZSB0aGVzZSBkcml2ZXJzLCBjYW4g
d2UgZHJvcCB0aGUgaGVscGVyCj4gZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfdmJsYW5rcz8K
ClllcywgYnV0IHRoZXJlIG1pZ2h0IGJlIGEgdGlueSBiZWhhdmlvdXIgY2hhbmdlLCB0aGF0J3Mg
d2h5IEkgaGF2ZW4ndCBqdXN0Cm1hZGUgaXQgdGhlIGRlZmF1bHQuCgpBbHNvIG5vdGUgdGhhdCB3
YWl0X2Zvcl92YmxhbmtzIGlzIHN0aWxsIHRoZSBkZWZhdWx0IGluIHRoZQphdG9taWNfY29tbWl0
X3RhaWwgKHNlZWUgZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3RhaWwpLCBzbyB0aGVyZSdzIGEg
cGlsZQptb3JlIGRyaXZlcnMgdXNpbmcgdGhpcyBpbXBsaWNpdGx5LgoKQnV0IHllYWggd291bGQg
YmUgcmVhbGx5IGdyZWF0IHRvIGZpeCB0aGF0IGFsbCB1cCwgc2luY2UgSSB0aGluawp3YWl0X2Zv
cl9mbGlwX2RvbmUgaXMgdGhlIGJldHRlciBmdW5jdGlvbi4gTWF5YmUgYSB0b2RvLnJzdD8gT3Ig
cGVyaGFwcyB3ZQpzaG91bGQgYXQgbGVhc3QgZG8gaXQgZm9yIGF0b21pYyBoZWxwZXJzLCBhbmQg
anVzdCBzZWUgd2hhdCBicmVha3M/IEFzIGEKc3RhcnQgZm9yIHRoaXMgY29udmVyc2lvbi4KCj4g
UmV2aWV3ZWQtYnk6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21haWwu
Y29tPgoKVGhhbmtzLCBEYW5pZWwKCj4gCj4gVGhhbmtzCj4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiA+IENjOiBSb2RyaWdvIFNp
cXVlaXJhIDxyb2RyaWdvc2lxdWVpcmFtZWxvQGdtYWlsLmNvbT4KPiA+IENjOiBIYW5lZW4gTW9o
YW1tZWQgPGhhbW9oYW1tZWQuc2FAZ21haWwuY29tPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2
LmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5j
IGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuYwo+ID4gaW5kZXggNDRhYjlmOGVmOGJl
Li44MDUyNGEyMjQxMmEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21z
X2Rydi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5jCj4gPiBAQCAt
ODMsNyArODMsNyBAQCBzdGF0aWMgdm9pZCB2a21zX2F0b21pY19jb21taXRfdGFpbChzdHJ1Y3Qg
ZHJtX2F0b21pY19zdGF0ZSAqb2xkX3N0YXRlKQo+ID4gIAo+ID4gIAlkcm1fYXRvbWljX2hlbHBl
cl9jb21taXRfaHdfZG9uZShvbGRfc3RhdGUpOwo+ID4gIAo+ID4gLQlkcm1fYXRvbWljX2hlbHBl
cl93YWl0X2Zvcl92YmxhbmtzKGRldiwgb2xkX3N0YXRlKTsKPiA+ICsJZHJtX2F0b21pY19oZWxw
ZXJfd2FpdF9mb3JfZmxpcF9kb25lKGRldiwgb2xkX3N0YXRlKTsKPiA+ICAKPiA+ICAJZm9yX2Vh
Y2hfb2xkX2NydGNfaW5fc3RhdGUob2xkX3N0YXRlLCBjcnRjLCBvbGRfY3J0Y19zdGF0ZSwgaSkg
ewo+ID4gIAkJc3RydWN0IHZrbXNfY3J0Y19zdGF0ZSAqdmttc19zdGF0ZSA9Cj4gPiAtLSAKPiA+
IDIuMjIuMAo+ID4gCj4gCj4gLS0gCj4gUm9kcmlnbyBTaXF1ZWlyYQo+IFNvZnR3YXJlIEVuZ2lu
ZWVyLCBBZHZhbmNlZCBNaWNybyBEZXZpY2VzIChBTUQpCj4gaHR0cHM6Ly9zaXF1ZWlyYS50ZWNo
CgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=

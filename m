Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ACF9D288
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 17:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9786E1B1;
	Mon, 26 Aug 2019 15:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C9A6E1B1;
 Mon, 26 Aug 2019 15:18:35 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id d16so16260834wme.2;
 Mon, 26 Aug 2019 08:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MJqE4e1y1WxXXZ8DFg+jhsnKJrwmmhLs+9XOzxV26SU=;
 b=ZiEA460X6bff9mwD2RWNN+RELesvOCPS5/NEMerJvsNm8DpdKGbb4peWywdnu3pXqN
 MPAJ8CCbB9x7u+GSlWL5bIflvLJIwIMO1f2miiBUgjZn4L7h3OZ3ZEvntxoeEviuTj/G
 +bl0y2NZ24jnixllrzEWWmHtxg9twyMWyZUyqOZKRKwpXk7ZXaB7hmE/0MRNPXNacXTM
 eP5fukrVxCWM5jAyQVjwWYfzpiwkCGNw66MSQHD+sFn1/3MjJfOm54weCw6tFEJma/nT
 L/QdEddVHFwS2FS+KeyAz/aooymFbzpfcfYKqHWE8vukkyWW3Px3cd3F1iiSNM+NRI3S
 P7WQ==
X-Gm-Message-State: APjAAAWNqadVEbkQcbaSmYBGj8LsJxPuxN67QgFgFo96nqOZ/6agDjUi
 w9y20cD7WgZ26rr+9Ex6Zlq+LKgaXA+mMEHldKY=
X-Google-Smtp-Source: APXvYqyNb/6xrJ9fWSJ6ROzQi/4V9Sg49C3QASNejc6eEG8PQt6mE/AzgkYX44UEwm3Io3giXr6Ongh6bMh322OAAj0=
X-Received: by 2002:a1c:750f:: with SMTP id o15mr9960829wmc.67.1566832714319; 
 Mon, 26 Aug 2019 08:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190826085707.12504-1-yuehaibing@huawei.com>
 <c324866d-855a-b259-4511-c69491a82c88@amd.com>
In-Reply-To: <c324866d-855a-b259-4511-c69491a82c88@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Aug 2019 11:18:22 -0400
Message-ID: <CADnq5_OgDuFm_Huofu6S2O2dyzO42UdZm=cYgRKwH7f4gTCyvg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu/display: fix build error without
 CONFIG_DRM_AMD_DC_DSC_SUPPORT
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MJqE4e1y1WxXXZ8DFg+jhsnKJrwmmhLs+9XOzxV26SU=;
 b=N2HLiYvaM4PdUNOO2PtoZPCA6NElehowjRX0j5KIM468l9V2xXANYh5UlnYOU1zOWm
 LsbN0/D8d8+X879QeHvrtF8UjpDYT5lFnVduz3l2dyQ+ESSSKk1/RiFFl1D7nDBDZqed
 +1fGV84WqW0Xngi+syiQ9G4Y04eJn1eVKJsmCPqDY9zPEZDdl62X/a0yAL8C2NyqRWFO
 d78juY3fLRnAxxU5e4FTiXvkG2L0RGE5s+jy4y/nCTKWvKlHqNQ5n3ReNlseSv+qVSZ8
 iDeR+teCc/0naAMS5u8KveRSqA6MbQOxGbys+mM6H7NHnxYJP4kNcBmMoj5zQN0sARBc
 WO6w==
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
Cc: "Aberback, Joshua" <Joshua.Aberback@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, YueHaibing <yuehaibing@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Liu,
 Wenjing" <Wenjing.Liu@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "Laktyushkin, Dmytro" <Dmytro.Laktyushkin@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Leung,
 Martin" <Martin.Leung@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Liu, Charlene" <Charlene.Liu@amd.com>,
 "Lei, Jun" <Jun.Lei@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgOToyMiBBTSBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5A
YW1kLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMjAxOS0wOC0yNiA0OjU3IGEubS4sIFl1ZUhhaWJp
bmcgd3JvdGU6Cj4gPiBJZiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVCBpcyBub3Qgc2V0
LCBidWlsZCBmYWlsczoKPiA+Cj4gPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmM6IEluIGZ1bmN0aW9uIGRjbjIwX2h3X3NlcXVlbmNl
cl9jb25zdHJ1Y3Q6Cj4gPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX2h3c2VxLmM6MjA5OToyODoKPiA+ICBlcnJvcjogZGNuMjBfZHNjX3BnX2Nv
bnRyb2wgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1l
YW4gZGNuMjBfZHBwX3BnX2NvbnRyb2w/Cj4gPiAgIGRjLT5od3NzLmRzY19wZ19jb250cm9sID0g
ZGNuMjBfZHNjX3BnX2NvbnRyb2w7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+fn5+fn4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkY24yMF9k
cHBfcGdfY29udHJvbAo+ID4KPiA+IFVzZSBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVCB0
byBndWFyZCB0aGlzLgo+ID4KPiA+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVh
d2VpLmNvbT4KPiA+IEZpeGVzOiA4YTMxODIwYjEyMTggKCJkcm0vYW1kL2Rpc3BsYXk6IE1ha2Ug
aW5pdF9odyBhbmQgaW5pdF9waXBlcyBnZW5lcmljIGZvciBzZWFtbGVzcyBib290IikKPiA+IFNp
Z25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPgo+IFJldmll
d2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPgoKQXBwbGll
ZC4gIFRoYW5rcywKCkFsZXgKCj4gSGFycnkKPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgfCA0ICsrKysKPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKPiA+IGluZGV4IGUxNDZkMWQuLjU0
ZDY3ZjYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfaHdzZXEuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX2h3c2VxLmMKPiA+IEBAIC0yMDkyLDcgKzIwOTIsMTEgQEAgdm9pZCBkY24y
MF9od19zZXF1ZW5jZXJfY29uc3RydWN0KHN0cnVjdCBkYyAqZGMpCj4gPiAgICAgICBkYy0+aHdz
cy5lbmFibGVfcG93ZXJfZ2F0aW5nX3BsYW5lID0gZGNuMjBfZW5hYmxlX3Bvd2VyX2dhdGluZ19w
bGFuZTsKPiA+ICAgICAgIGRjLT5od3NzLmRwcF9wZ19jb250cm9sID0gZGNuMjBfZHBwX3BnX2Nv
bnRyb2w7Cj4gPiAgICAgICBkYy0+aHdzcy5odWJwX3BnX2NvbnRyb2wgPSBkY24yMF9odWJwX3Bn
X2NvbnRyb2w7Cj4gPiArI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCj4gPiAg
ICAgICBkYy0+aHdzcy5kc2NfcGdfY29udHJvbCA9IGRjbjIwX2RzY19wZ19jb250cm9sOwo+ID4g
KyNlbHNlCj4gPiArICAgICBkYy0+aHdzcy5kc2NfcGdfY29udHJvbCA9IE5VTEw7Cj4gPiArI2Vu
ZGlmCj4gPiAgICAgICBkYy0+aHdzcy5kaXNhYmxlX3ZnYSA9IGRjbjIwX2Rpc2FibGVfdmdhOwo+
ID4KPiA+ICAgICAgIGlmIChJU19GUEdBX01BWElNVVNfREMoZGMtPmN0eC0+ZGNlX2Vudmlyb25t
ZW50KSkgewo+ID4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

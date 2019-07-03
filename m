Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3532D5DE80
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B419D6E0DF;
	Wed,  3 Jul 2019 07:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EE26E0CD
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 04:08:47 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 196so481548pgc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 21:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BOHEn0gshPaD156fAbU+LPgYeovu+KLC6H+rqvqrtq4=;
 b=Kkg3na/uUL3zGS7R2meYayIo0lFzMYwo5YRCqKl7FMJJtYZP3ZHmYzwdV5LoGgL1tb
 GY74cIGtWN/8NB6ZmRl52iMQsIn7edbDwHgfIW7cuuKYZEX/6Y50CMESCKrNn/cRa+bi
 Rz/Aggxchor798CKOq1uHXFalcsrFT/cYAaxlgjjDtdKO71vHGsWaV+7FHddsEMNU/QR
 3R9Byg5IrvTWdxanNH5lgXgIp+RaGSoaQdDu0hVXeqLGljHrYYq2g6SD404R/zFlR7Wn
 MTBxyIslPWXc58BJ012m49xNGnwH3rzfmaDlJgVc+5cAE8Vxjf4kSqBAUMnlC8M9PSFL
 1Y2Q==
X-Gm-Message-State: APjAAAVb5N5AmN6pcuc+WTUTnVC/wcJSq6JbTWYC+obSdbHUgk3VENMU
 kLzrOyo45093Ak/MgDzSzt/DgQ==
X-Google-Smtp-Source: APXvYqxQq8cU5yTVEx60W1ue5LxeoHrpQ3mjFnp+R6PN/s26w0eINwgwrUDi2TCCpBgj2P6m9+w4ig==
X-Received: by 2002:a65:44c8:: with SMTP id g8mr34199417pgs.443.1562126926314; 
 Tue, 02 Jul 2019 21:08:46 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id f2sm563251pgs.83.2019.07.02.21.08.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 02 Jul 2019 21:08:45 -0700 (PDT)
Date: Tue, 2 Jul 2019 21:08:43 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Use drm_device for creating gem address
 space
Message-ID: <20190703040843.GA27383@builder>
References: <20190701173907.15494-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701173907.15494-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BOHEn0gshPaD156fAbU+LPgYeovu+KLC6H+rqvqrtq4=;
 b=thNW3ICbdgjo5v4OnrHC8HngYpGdmRrbNHaD/DbS92CXxHGPR59WaqhuwSzFyBYThW
 eeip6X5FJ/8DmwPxp53o5qXeCuYst0A/0fKVm9p/ZJJgreL8Mnl7RsLZssD700+4Lgnx
 BFm4LqDqLsjM7uO/1d7j0A/0n4CcW2Uy8o1oVQgj8vwuTyZDvN/IuUWC2a90f4NZkUIX
 5gV5QvPA6NVOeNYPJ107ElYM3bm60jG6d9vecux/YZBBMJeS9ixnOJ6J/qa4DnT9MOgK
 lWlLiZfrNmxIZZb/zvT7kyuNBfFtZqeFaXtcsCkZtrZy1wxGxLBMb2p6cPC4Y+wikg4x
 bM9w==
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uIDAxIEp1bCAxMDozOSBQRFQgMjAxOSwgSmVmZnJleSBIdWdvIHdyb3RlOgoKPiBDcmVh
dGluZyB0aGUgbXNtIGdlbSBhZGRyZXNzIHNwYWNlIHJlcXVpcmVzIGEgcmVmZXJlbmNlIHRvIHRo
ZSBkZXYgd2hlcmUKPiB0aGUgaW9tbXUgaXMgbG9jYXRlZC4gIFRoZSBkcml2ZXIgY3VycmVudGx5
IGFzc3VtZXMgdGhpcyBpcyB0aGUgc2FtZSBhcwo+IHRoZSBwbGF0Zm9ybSBkZXZpY2UsIHdoaWNo
IGJyZWFrcyB3aGVuIHRoZSBpb21tdSBpcyBvdXRzaWRlIG9mIHRoZQo+IHBsYXRmb3JtIGRldmlj
ZS4gIFVzZSB0aGUgZHJtX2RldmljZSBpbnN0ZWFkLCB3aGljaCBoYXBwZW5zIHRvIGFsd2F5cyBo
YXZlCj4gYSByZWZlcmVuY2UgdG8gdGhlIHByb3BlciBkZXZpY2UuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSmVmZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+CgpTb3JyeSwgYnV0IG9u
IGRiODIwYyB0aGlzIHBhdGNoIHJlc3VsdHMgaW46CgpbICAgNjQuODAzMjYzXSBtc21fbWRwIDkw
MTAwMC5tZHA6IFtkcm06bWRwNV9rbXNfaW5pdCBbbXNtXV0gKkVSUk9SKiBmYWlsZWQgdG8gYXR0
YWNoIGlvbW11OiAtMTkKCkZvbGxvd2VkIGJ5IDMgb29wc2VzIGFzIHdlJ3JlIHRyeWluZyB0byBm
YWlsIHRoZSBpbml0aWFsaXphdGlvbi4KClJlZ2FyZHMsCkJqb3JuCgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9tZHA1L21kcDVfa21zLmMKPiBpbmRleCA0YTYwZjVmY2E2YjAuLjEzNDdhNTIyMzkxOCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYwo+IEBAIC03MDIs
NyArNzAyLDcgQEAgc3RydWN0IG1zbV9rbXMgKm1kcDVfa21zX2luaXQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldikKPiAgCW1kZWxheSgxNik7Cj4gIAo+ICAJaWYgKGNvbmZpZy0+cGxhdGZvcm0uaW9t
bXUpIHsKPiAtCQlhc3BhY2UgPSBtc21fZ2VtX2FkZHJlc3Nfc3BhY2VfY3JlYXRlKCZwZGV2LT5k
ZXYsCj4gKwkJYXNwYWNlID0gbXNtX2dlbV9hZGRyZXNzX3NwYWNlX2NyZWF0ZShkZXYtPmRldiwK
PiAgCQkJCWNvbmZpZy0+cGxhdGZvcm0uaW9tbXUsICJtZHA1Iik7Cj4gIAkJaWYgKElTX0VSUihh
c3BhY2UpKSB7Cj4gIAkJCXJldCA9IFBUUl9FUlIoYXNwYWNlKTsKPiAtLSAKPiAyLjE3LjEKPiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 151501B0D5F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 15:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDED6E584;
	Mon, 20 Apr 2020 13:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B60B6E584
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 13:51:04 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g13so10228725wrb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=xL0eDIXpQBxMEh1rpP/FONQ6psNDwPofEEjDAjgV9+E=;
 b=g9N4Prb+W/MZeBAamiu3mzs0P1/HfnhajHbNf6Z+BFG6AESZOAaf9tIdcTxFockEwT
 EKWaFlouUpD/6fVZbNK0UTx2Jequz1Oq9PHEye186schaM/btM9eBXfEyafUFocZ4uoG
 9pltSmbf6ROp/xZA9nnA49VLvIueiVYem97NDOVi92BD00TMnnEYBZ1zmUTNSjkm0Z31
 VdcX8+PNRUSm0vWV05sEJ5T8GMqxfwe1n/O6bOaDggc/c8v7DZG/1gRKS6fRBhbxQKe3
 Jw1jtrmpyMbhSiH1+qiF5nHqdAbioZLiViL9DeqUIgcbbxhwd3dFKn8Nl13HJkeUL/8l
 VmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xL0eDIXpQBxMEh1rpP/FONQ6psNDwPofEEjDAjgV9+E=;
 b=WVoCj3YL7rOnb6GRgENtOBemZ9ayRdY9VQjoxjcI5HgqJkiqzejQDoM9KagZK5bXqi
 jIPn0wD/DnIEBU4D2btleH6PugfKpp22VMWzJrdqg3Bl1AIPeqIsbd4CSYXwU8UucGmI
 JCuNswyxAgvGyPE7bjUOwI48XDFnVqll0LiHrIvDmxo1IDuFJCl7T1bhhMtgkc8Vapfs
 H1sqf8RDHs8pni7kk/kAvO3zV3MimOuK9V82nJvl4gylK7zJfOwMVCVdNHKoQ4V7Grtm
 lCdfVoVYZnlv1b3oKEs0Wf9KsbnBEywYTzhOMl7eBcbk1LomoRWKJjgAG6FLE1XfOpEx
 7C3Q==
X-Gm-Message-State: AGi0PuYSRrSRdgQDD2mpUQzfRl1Iqw7OTTXZkGJX0Y+xddHOz5HCanAD
 OZ2nkXflfI0qYrYXVOFFbkOhDg==
X-Google-Smtp-Source: APiQypIkD9tDuLBwdY9svyS889RVUDhlwihT/636a3FV3sGGLOwXPv1ushYYNwKn2DXvjpEovZY5Zg==
X-Received: by 2002:adf:decb:: with SMTP id i11mr18098981wrn.140.1587390663057; 
 Mon, 20 Apr 2020 06:51:03 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id b85sm1502032wmb.21.2020.04.20.06.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 06:51:02 -0700 (PDT)
Date: Mon, 20 Apr 2020 14:51:00 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] backlight: lms501kf03: remove unused 'seq_sleep_in' and
 'seq_up_dn'
Message-ID: <20200420135100.lhwcdkl33jzomy6p@holly.lan>
References: <20200417092257.13694-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417092257.13694-1-yanaijie@huawei.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hulk Robot <hulkci@huawei.com>, lee.jones@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMDU6MjI6NTdQTSArMDgwMCwgSmFzb24gWWFuIHdyb3Rl
Ogo+IEZpeCB0aGUgZm9sbG93aW5nIGdjYyB3YXJuaW5nOgo+IAo+IGRyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L2xtczUwMWtmMDMuYzo5NjoyODogd2FybmluZzog4oCYc2VxX3NsZWVwX2lu4oCZCj4g
ZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgc3RhdGlj
IGNvbnN0IHVuc2lnbmVkIGNoYXIgc2VxX3NsZWVwX2luW10gPSB7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fgo+IGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtczUw
MWtmMDMuYzo5MjoyODogd2FybmluZzog4oCYc2VxX3VwX2Ru4oCZIGRlZmluZWQKPiBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgc3RhdGljIGNvbnN0IHVuc2lnbmVk
IGNoYXIgc2VxX3VwX2RuW10gPSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+
fn5+fgo+IAo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBKYXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+CgpSZXZpZXdlZC1i
eTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KCgo+IC0tLQo+
ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbXM1MDFrZjAzLmMgfCA4IC0tLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9sbXM1MDFrZjAzLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbXM1
MDFrZjAzLmMKPiBpbmRleCA4YWUzMmUzNTczYzEuLmMxYmQwMmJiOGIyZSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbXM1MDFrZjAzLmMKPiArKysgYi9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9sbXM1MDFrZjAzLmMKPiBAQCAtODksMTQgKzg5LDYgQEAgc3RhdGljIGNv
bnN0IHVuc2lnbmVkIGNoYXIgc2VxX3JnYl9nYW1tYVtdID0gewo+ICAJMHgwMCwgMHgwMCwgMHgw
MCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwKPiAgfTsKPiAgCj4gLXN0YXRpYyBjb25z
dCB1bnNpZ25lZCBjaGFyIHNlcV91cF9kbltdID0gewo+IC0JMHgzNiwgMHgxMCwKPiAtfTsKPiAt
Cj4gLXN0YXRpYyBjb25zdCB1bnNpZ25lZCBjaGFyIHNlcV9zbGVlcF9pbltdID0gewo+IC0JMHgx
MCwKPiAtfTsKPiAtCj4gIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBjaGFyIHNlcV9zbGVlcF9vdXRb
XSA9IHsKPiAgCTB4MTEsCj4gIH07Cj4gLS0gCj4gMi4yMS4xCj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

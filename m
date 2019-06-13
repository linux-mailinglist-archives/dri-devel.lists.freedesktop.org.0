Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D00D54323B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 04:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9F089135;
	Thu, 13 Jun 2019 02:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CF689031;
 Thu, 13 Jun 2019 02:35:40 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x4so16306863wrt.6;
 Wed, 12 Jun 2019 19:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=we9sh7P+rBLFyIttjf4foHa+0vXHWpg6iX0TxKiCCM8=;
 b=Ra9kmQZZqzwKWMbmL9I68+vgg8ctfnu9A7uhZ0oT5cQNPBkwq4l+No97zGtUC5rC1Y
 XC6mECjflzlMqlHNucVd+D4NonHiGuIJN7wm/sU84EABKM6yEpQ7PgYRdJYrfzs3pkTG
 0yKHviUoyQ9+HvsmhsPeYr4opZDXgQaefq1UOcfp2Pky/VZnMnSMzLXFMJlIZIDH+zGE
 h6pHdKdGu4Bs0rsx9fzvKxqInbT05amMz8DODKVO5kM2ffxk+uAi1ASwmhYDiWrvycdo
 D3Uf9ope0y5BcqP+wt9rRa5Ih+ITTzuaP/JaoUWWcr/OCnjY7zDMSWP4Q6+DswLmn1G0
 s5EA==
X-Gm-Message-State: APjAAAUAvhKXd71ZLH2bEbgexwCtOoJsj8c05ZlK/lUVvTc4bAojQGyA
 kmxp7iCJtYgCY360Jym01cJGdA401uAQZWAwS8g=
X-Google-Smtp-Source: APXvYqyOqcdP9Kv4ZKhMjHXfzyr/AAP5oi+GWxEfBRGeT4Z6j06FZuVkW7kC+wTYqDB2JxxCglMYK31I0LVL4sFV3gA=
X-Received: by 2002:adf:f041:: with SMTP id t1mr12583636wro.74.1560393338674; 
 Wed, 12 Jun 2019 19:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190613023208.GA29690@hari-Inspiron-1545>
In-Reply-To: <20190613023208.GA29690@hari-Inspiron-1545>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 12 Jun 2019 22:35:26 -0400
Message-ID: <CADnq5_PU_jvOskC-=+oRQdvYXZvu_n26ogoWTxLRxnW+ke4wDw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix compilation error
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=we9sh7P+rBLFyIttjf4foHa+0vXHWpg6iX0TxKiCCM8=;
 b=kLu12g1wHuVKOsOjxGBZ6/v3jo91LVLr+nrtgEydtGzmDqbPSqolPf6gsyNNXDJP8U
 IeA3G4WvSI4xUbrcoEg/uTcEICs2FfMb0D1D3yJJ195lPHSnj9e2xz/BE8BDc4kCZzu/
 aEcpmbU+bxqwql9FEoOkIXyNRNWC5+vBGLrZN3ygNDwi9QZ+QMc++vne4eyBsbI8fnyA
 hmS3OW6BF0M4fGV71nnepzFLpYg3q4ZkCZWU9xtiMkIApLVr+d08Sntld0D8YPEgras1
 xZbiwmgO6gj+UnDuXrajSADkJWRPpo7Yt2juXW91b1Htt6NiB72sm2oZRnUIUNuIRMbn
 AoPQ==
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
Cc: LKML <linux-kernel@vger.kernel.org>, Yongqiang Sun <yongqiang.sun@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Gloria Li <geling.li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Tony Cheng <tony.cheng@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTA6MzQgUE0gSGFyaXByYXNhZCBLZWxhbQo8aGFyaXBy
YXNhZC5rZWxhbUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gdGhpcyBwYXRjaCBmaXhlcyBiZWxvdyBj
b21waWxhdGlvbiBlcnJvcgo+Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxh
eS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYzogSW4KPiBmdW5jdGlvbiDigJhkY24xMF9h
cHBseV9jdHhfZm9yX3N1cmZhY2XigJk6Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
ZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYzoyMzc4OjM6Cj4gZXJyb3I6IGlt
cGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHVkZWxheeKAmQo+IFstV2Vycm9yPWlt
cGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgIHVkZWxheSh1bmRlcmZsb3dfY2hlY2tf
ZGVsYXlfdXMpOwo+Cj4gU2lnbmVkLW9mZi1ieTogSGFyaXByYXNhZCBLZWxhbSA8aGFyaXByYXNh
ZC5rZWxhbUBnbWFpbC5jb20+CgpXaGF0IGJyYW5jaCBpcyB0aGlzIHBhdGNoIGJhc2VkIG9uPwoK
QWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEw
X2h3X3NlcXVlbmNlci5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24x
MF9od19zZXF1ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9k
Y24xMF9od19zZXF1ZW5jZXIuYwo+IGluZGV4IGQyMzUyOTQ5Li4xYWM5YTRmIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5j
ZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9o
d19zZXF1ZW5jZXIuYwo+IEBAIC0yMyw2ICsyMyw3IEBACj4gICAqCj4gICAqLwo+Cj4gKyNpbmNs
dWRlIDxsaW51eC9kZWxheS5oPgo+ICAjaW5jbHVkZSAiZG1fc2VydmljZXMuaCIKPiAgI2luY2x1
ZGUgImNvcmVfdHlwZXMuaCIKPiAgI2luY2x1ZGUgInJlc291cmNlLmgiCj4gLS0KPiAyLjcuNAo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQt
Z2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

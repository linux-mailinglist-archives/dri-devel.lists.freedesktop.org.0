Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BAB1BD69B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 09:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3862E6ED40;
	Wed, 29 Apr 2020 07:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BF86ED40
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 07:52:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j1so1305347wrt.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 00:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fiu3UhSmYFAOHYAS0W7ewPc8oLZCctLlSbTv8V9Nd7Q=;
 b=jhKPO7vSs7hK/gv/JXeiceK2v0s5PAPCCiMtctu4OPLfGkgcKSbOzCOwkh14SxDgaR
 bx0JEj5Q+aU/BGhxnuKKgWqUO5Cx4CcipNk3eRpZLe5y0vJwYUtAwWwiv4goeowj/PIq
 h3nJICPVsEtod++WPdTO+WiA5n9e2LH39hSCNdifXmI5pEo6LNk4MpxT4OVKMe4xNRX+
 i3iwbGphswZwVMRTDWxkj+Zw0Awr20zB5MF73Oax3Hy5tZIe/XZa6r4oeqy+euxOmi1t
 MYFjUZWRVTCoK51i6cDctWpZu5nXrvnXhAnb0/EPeZwAj6MBbmZKg8vy637gM0D4K6yf
 1qJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fiu3UhSmYFAOHYAS0W7ewPc8oLZCctLlSbTv8V9Nd7Q=;
 b=jhpILmZo67dsvXK51IG9VcrK+NtWz3JGY1kfkG3XGCs5Y38xr/aufeYYKDYF4kYIAE
 fvsidBU7pMBQnqzVj8onHG0GxBo1LyzTe1iYXRgJmwzwVX6d9HD2It6GGupTTgroy15Z
 4rH4oESCY2WyrT2ow1REixSPNevgHuRf94lJ+38pmWw5KKL5K8qUWT4EbtOQfWpToOZl
 1s6GC6dupkZ5SP05/hja9KMjfc6KW+0aXRPYm5sBv6T65onifS7xUVcnkd2M/XA+pHwQ
 cP4vpccUKvBlrUetJ6LzK2gZgrmgVAqH6mkPTOHUz5/x/WP5NlghhfHY9lPtaNKwOitH
 kRPg==
X-Gm-Message-State: AGi0Pua71TGAfFDmCT9IULVnIXK2PXo+ZfX6ZpChIAsV2TIm7shgvzw3
 VfmtjkRyWGUFUBbUMGXaBipo1g==
X-Google-Smtp-Source: APiQypJFUc2pe7o1FtD24DtjEwr4uarJmiqWJRO6VzpHWoW6d38Zd5z8+sgIgiempkuFdUpUNrSsDA==
X-Received: by 2002:adf:f986:: with SMTP id f6mr37077576wrr.221.1588146759487; 
 Wed, 29 Apr 2020 00:52:39 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id n25sm6542213wmk.9.2020.04.29.00.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 00:52:38 -0700 (PDT)
Date: Wed, 29 Apr 2020 08:52:36 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: l4f00242t03: Convert to GPIO descriptors
Message-ID: <20200429075236.GZ3559@dell>
References: <20200415121449.111043-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415121449.111043-1-linus.walleij@linaro.org>
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
Cc: Alberto Panizzo <maramaopercheseimorto@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Anson Huang <Anson.Huang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxNSBBcHIgMjAyMCwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhpcyBjb252ZXJ0
cyB0aGUgbDRmMDAyNDJ0MDMgYmFja2xpZ2h0IGRyaXZlciB0byB1c2UgR1BJTwo+IGRlc2NyaXB0
b3JzIGFuZCBzd2l0Y2hlcyB0aGUgdHdvIEZyZWVzY2FsZSBpLk1YIGJvYXJkcyBvdmVyCj4gdG8g
cGFzc2luZyBkZXNjcmlwdG9ycyBpbnN0ZWFkIG9mIGdsb2JhbCBHUElPIG51bWJlcnMuCj4gCj4g
V2UgdXNlIHRoZSB0eXBpY2FsIG5hbWVzICJlbmFibGUiIGFuZCAicmVzZXQiIGFzIGZvdW5kIGlu
Cj4gdGhlIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciBwYW5lbCBHUElPcy4KPiAKPiBUaGlzIHNh
dmVzIGEgbG90IG9mIGNvZGUgaW4gdGhlIGRyaXZlciBhbmQgbWFrZXMgaXQgcG9zc2libGUKPiB0
byBnZXQgcmlkIG9mIHRoZSBwbGF0Zm9ybSBkYXRhIGhlYWRlciBhbHRvZ2V0aGVyLgo+IAo+IENj
OiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IEFuc29uIEh1YW5n
IDxBbnNvbi5IdWFuZ0BueHAuY29tPgo+IENjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5v
cmc+Cj4gQ2M6IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+
Cj4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KPiBDYzogTlhQIExpbnV4
IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPgo+IENjOiBBbGJlcnRvIFBhbml6em8gPG1hcmFtYW9w
ZXJjaGVzZWltb3J0b0BnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+IC0tLQo+IGkuTVggZm9sa3M6IHBsZWFzZSB0ZXN0
IGlmIHlvdSBjYW4gb3IgYXQgbGVhc3QgQUNLIHNvIExlZQo+IGtub3dzIGlmIHRoaXMgaXMgT0sg
Zm9yIHlvdS4KPiAtLS0KPiAgYXJjaC9hcm0vbWFjaC1pbXgvbWFjaC1teDI3XzNkcy5jICAgICB8
IDIxICsrKysrKysrKy0tLS0KPiAgYXJjaC9hcm0vbWFjaC1pbXgvbWFjaC1teDMxXzNkcy5jICAg
ICB8IDI0ICsrKysrKysrKysrLS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2w0ZjAwMjQy
dDAzLmMgfCA0NSArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiAgaW5jbHVkZS9saW51eC9z
cGkvbDRmMDAyNDJ0MDMuaCAgICAgICB8IDE3IC0tLS0tLS0tLS0KPiAgNCBmaWxlcyBjaGFuZ2Vk
LCA1MiBpbnNlcnRpb25zKCspLCA1NSBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0
IGluY2x1ZGUvbGludXgvc3BpL2w0ZjAwMjQydDAzLmgKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApM
ZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJv
OiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC201CD1F8
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 08:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C546E1BA;
	Mon, 11 May 2020 06:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD086E1BE
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 06:40:20 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l11so3472883wru.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 23:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=b+54X+TX5kZJ9qRshyticlnYndABBvz6OtR/q492GBo=;
 b=M8EYmyHmTRjm+HdQp+lpCdON/vaMWQpsLthw3YYDANF7NHrHoYvnkT+xgs7I2yegeT
 CndpjBqZ9xaZCJY9kbyDMbvAZHpBdREoRk5PY6Va4ohQa2f4BzAFgSwmC1jJl54zK8Sg
 LK5xF/1zdvab2IqMpowmR3TyvXedv5cKu2yzjZTa9bhOqTYOfHJ/IHJtxTqhURlUjD24
 MKAwgay/5VFJkHkRvtGIjzqshHIZo5Fz567i+B6uir3abJMVwXLIB5Cr0RSrMSxhnew3
 AjkhNADh/Ss5sTc2oCUCtXtfq5h3fUx/VLxtT/rJtg6OPcyHI6h9jRtw/r1dUlBbumb2
 eGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=b+54X+TX5kZJ9qRshyticlnYndABBvz6OtR/q492GBo=;
 b=SVI0nC2opA+xT8nUnlfqwWSPZnWTBNi8yiNxhZsbi8FAiZ1kIMl3V4413Ng47J4Uhs
 Fece/Bw2e6lNVZ2IgSzM7tSBHWSm86+iQFjrFPDiKhASB1ppTRCriO8KiQtOKQ/L2y3t
 RtydNqC60jn/mbVoM9H5G5X+KkbqY1D1z/OvE8Ys0UyCwl4Ii/VzBvA6rLBAaBUNtQty
 /O1XVquKH3hVMNA00sOxQq2BW4doqFhxdPd0q5RyTaZvyNvChiHa2hOl6IUqYJ3mCbi2
 hj+iT8qpuUQcxCdY2hs4U3Oc+RfKb3UpFd2QQDU9c4M0NE89ZAJ/+rD6+l1DpIuoOcPL
 5v4g==
X-Gm-Message-State: AGi0Pub53mzHh4QuXmKCgLNUdTlaHaK2K0vrqlItjalOHnAVlOgpXX6W
 xOPYIo60v6F+p+kFWcYPfxfVcg==
X-Google-Smtp-Source: APiQypLNFMVwgMOtwQds6QCltWYpc6Vs3EChos/FuLb+gpdk79SDqJOL0Xi3mG5TizXzQAknF4MLTA==
X-Received: by 2002:adf:f00e:: with SMTP id j14mr10520253wro.252.1589179219073; 
 Sun, 10 May 2020 23:40:19 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id w9sm17109112wrc.27.2020.05.10.23.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 23:40:18 -0700 (PDT)
Date: Mon, 11 May 2020 07:40:16 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 01/10] backlight: Add backlight_device_get_by_name()
Message-ID: <20200511064016.GJ823950@dell>
References: <20200509141619.32970-1-noralf@tronnes.org>
 <20200509141619.32970-2-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200509141619.32970-2-noralf@tronnes.org>
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
Cc: jingoohan1@gmail.com, daniel.thompson@linaro.org, linux-usb@vger.kernel.org,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAwOSBNYXkgMjAyMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgoKPiBBZGQgYSB3YXkg
dG8gbG9va3VwIGEgYmFja2xpZ2h0IGRldmljZSBiYXNlZCBvbiBpdHMgbmFtZS4KPiBXaWxsIGJl
IHVzZWQgYnkgYSBVU0IgZGlzcGxheSBnYWRnZXQgZ2V0dGluZyB0aGUgbmFtZSBmcm9tIGNvbmZp
Z2ZzLgo+IAo+IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IENjOiBEYW5p
ZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IENjOiBKaW5nb28gSGFu
IDxqaW5nb29oYW4xQGdtYWlsLmNvbT4KPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9t
cHNvbkBsaW5hcm8ub3JnPgo+IEFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgo+IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3Jn
Pgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9iYWNrbGlnaHQuYyB8IDIxICsrKysr
KysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L2JhY2tsaWdodC5oICAgICAgICAgICB8
ICAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpBcHBsaWVkLCB0aGFu
a3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwg
TGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9s
bG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

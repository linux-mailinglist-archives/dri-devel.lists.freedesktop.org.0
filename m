Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB018D275
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 13:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B714489BB2;
	Wed, 14 Aug 2019 11:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314CF89BB2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:46:29 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id e27so9352829ljb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 04:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HVIUs4ZIQVm7b7SR1n38pcFhXz6C3M2CIhWpAxdt8LQ=;
 b=Hq4P5u/OclI3nK3dNocnFbBMUMnOIe1JLRZdMSudUtJjSt6sIcAGeEIdvhjTEcxVOL
 J1wUfOq14yn752d/TXxF/p7peqNI4AgZFmIMlM7pjvtN/CbuSJczGdcR/elim80KCZ5o
 fCd025N+AIs/TpETiTTKt5giaqUcP7dhvKIFH6pUUeBG6f8wA/EMR+CBKTVZFvcLTxTs
 NFWwSni+OHqaHrvwpLJUlexVzarhHmz8gEE5PgOFFX7BlxpdzcUrTDOyXFG4Gvh+LB3y
 BwWzDAq1U2mhVCAk45hHASYAcmxORiBPrWzUe4z+tgb4YCDspw588YSjmeTq1exv+7lE
 upIw==
X-Gm-Message-State: APjAAAWNDH7gBl7pA7ROfiVhxX4vX/SVdUXtPUdrl7hneTL5YnnJkq7W
 1SUvKNu64plMN1buCDiy+ZnQecuj7eFueNBrur5Meg==
X-Google-Smtp-Source: APXvYqx8H8wf2cUfndKRitBxUVt4PunZZn7bV5z50HzDJV5mvhAjxp+vVMjixTxwiL4xvtZ+Nynqmt1s1BQ2RX367ts=
X-Received: by 2002:a2e:b4e6:: with SMTP id s6mr11087965ljm.169.1565783187372; 
 Wed, 14 Aug 2019 04:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
 <1565779731-1300-7-git-send-email-robert.chiras@nxp.com>
In-Reply-To: <1565779731-1300-7-git-send-email-robert.chiras@nxp.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 14 Aug 2019 12:44:34 +0100
Message-ID: <CAPj87rMFG=RGmfVnawbE7qX4zU7vdYxLJB__K4E3B8jcJ764KQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/15] drm/mxsfb: Update mxsfb with additional pixel
 formats
To: Robert Chiras <robert.chiras@nxp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HVIUs4ZIQVm7b7SR1n38pcFhXz6C3M2CIhWpAxdt8LQ=;
 b=OV6v4RpJEGTSaeN9WjacjemHo7ZUtwknpaHLLy+MEre+zyB39wCwfeJtTg+FZ8IZ+B
 OcJGOV/93rJokdOIQwig6ROI8s46ddhjgNFjuNQIRHDFv0ccHr12uxB9mmYTVVx67gy1
 s8hLywCYXHwDkDbFXcF0V4TeSFIfT3tVWiVJTVB7XNHhkoelxy83LEM1tJcaxshNsR7G
 nbvYUYuPB2OPUjvHesf9PtA8fp6EqjxvwKx+GijgH5csPsIWsi1CddxxpdnawisyZMAF
 G1GvqKTt8QXGUkeS0wAZzBsBRXx6kryesDbVbLTprqrHNM3bOGm2jgMnuynRAAZzCWXS
 SI9Q==
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
Cc: Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LAoKT24gV2VkLCAxNCBBdWcgMjAxOSBhdCAxMTo0OSwgUm9iZXJ0IENoaXJhcyA8
cm9iZXJ0LmNoaXJhc0BueHAuY29tPiB3cm90ZToKPiArICAgICAgIGNhc2UgRFJNX0ZPUk1BVF9C
R1I1NjU6IC8qIEJHMTYgKi8KPiArICAgICAgICAgICAgICAgaWYgKG14c2ZiLT5kZXZkYXRhLT5p
cHZlcnNpb24gPCA0KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+ICsgICAg
ICAgICAgICAgICB3cml0ZWwoQ1RSTDJfT0REX0xJTkVfUEFUVEVSTihDVFJMMl9MSU5FX1BBVFRF
Uk5fQkdSKSB8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgQ1RSTDJfRVZFTl9MSU5FX1BBVFRF
Uk4oQ1RSTDJfTElORV9QQVRURVJOX0JHUiksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgbXhz
ZmItPmJhc2UgKyBMQ0RDX1Y0X0NUUkwyICsgUkVHX1NFVCk7Cj4gKyAgICAgICAgICAgICAgIC8q
IEZhbGwgdGhyb3VnaCAqLwo+ICsgICAgICAgY2FzZSBEUk1fRk9STUFUX1JHQjU2NTogLyogUkcx
NiAqLwo+ICsgICAgICAgICAgICAgICBjdHJsIHw9IENUUkxfU0VUX1dPUkRfTEVOR1RIKDApOwo+
ICsgICAgICAgICAgICAgICBjdHJsICY9IH5DVFJMX0RGMTY7Cj4gKyAgICAgICAgICAgICAgIGN0
cmwxIHw9IENUUkwxX1NFVF9CWVRFX1BBQ0tBR0lORygweGYpOwo+ICsgICAgICAgICAgICAgICBi
cmVhazsKCkZvciBub24tQkdSIGZvcm1hdHMsIGRvIHlvdSBuZWVkIHRvIHdyaXRlIFJHQiBsaW5l
LXBhdHRlcm4gYmFjayB0byB0aGUKQ1RSTDIgcmVnaXN0ZXI/IE90aGVyd2lzZSwgaWYgeW91IHN0
YXJ0IHdpdGggQkdSNTY1IHRoZW4gc3dpdGNoIGJhY2sKdG8gUkdCNTY1LCBwcmVzdW1hYmx5IENU
UkwyIHdvdWxkIHN0aWxsIGJlIHByb2dyYW1tZWQgZm9yIEJHUiBzbyB5b3UKd291bGQgZGlzcGxh
eSBpbnZlcnRlZCBjaGFubmVscy4KClNhbWUgZ29lcyBmb3IgYWxsIHRoZSBvdGhlciBCR1IvUkdC
IGZvcm1hdCBwYWlycyBiZWxvdy4KCkNoZWVycywKRGFuaWVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

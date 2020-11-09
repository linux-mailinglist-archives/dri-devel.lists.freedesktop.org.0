Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CB62AD100
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05EB898CC;
	Tue, 10 Nov 2020 08:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D69896C7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:21:03 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id v4so8325782edi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 03:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hU4WYD1KmzG04cSTRa81VB9nMC6JMAr9+qywRmieORQ=;
 b=ivffncbNBnvqFvOVxqcWbV0hPq/Ltibmf3GHl94bopcm/216grQ+BQGVZlOIbgv5Pf
 xRNJDqDwIXSwamLbX/p1iygsqawMVvm49RJRIt4tNEMYHQhPpV2SHeOUzuPYfilWXW2T
 pXypFoju2q10dY4x8VsUNVYWKxHAG9MXjfu3yRhrULwAAouCksLlQxBPC7WijFUkOd8M
 9rKkcE0TzPGW+Qms+6P/Fg+rjYuLtH/qjYB9Y1dHamslXZILFUGfnOVA2vHYW7hhV+gv
 tCS0061lKBfO0r7PmZ7sDLio7MMRqxS8zSw/E9vOQXqVzyolJ3sIV+5Qu+KLzXO5iK0O
 FyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hU4WYD1KmzG04cSTRa81VB9nMC6JMAr9+qywRmieORQ=;
 b=A1w5tdHAcoy9Myt8h0L9L5uVkSEehAttsDxKdJWc7e+eC69QobdHpcg7xGlX5favNR
 lNs7bfakIvuya/DZIrSQs1wVyP2Jrzeeazj9pkAmRbMUFp9Kahh8ze4+8OiOLzzz/dO1
 9T5NeDYCuoHQiAzaltQs+VGCz6I0q0xJbaMNnEBPZuSTxYmILOeaF9KR0ZEFGgAlwCMJ
 BSTgq+aYkVv8qnNH4NsISQdJG46euNMTb9QThm+s3NZljZkHzCSigDo6TqJ9tEDeRfWr
 ofBmjZuGNLlsiEdQHXHxUA13OkL90GCEqtfXHgblm3+/n/1dgQtaKShuMDgiRmB3vLhJ
 3gKA==
X-Gm-Message-State: AOAM530KP2PM5bSBYQZoj+CpFAh5KrXnYha9mgRWs8LjeXJHfk7QUALE
 9y0ehfc8kmZMCP079mCyIsW+Y5kYhh2D8zG/Psc=
X-Google-Smtp-Source: ABdhPJxAkJymNqSjR/UljeVLidNDy9Sfi8sdqcClNPJ1jY4tyCrPXVk2ZYZfzUyF8oKh+J89CmDSjJgzBHin8AZGsnU=
X-Received: by 2002:a50:ef1a:: with SMTP id m26mr5734314eds.144.1604920861806; 
 Mon, 09 Nov 2020 03:21:01 -0800 (PST)
MIME-Version: 1.0
References: <6fa54ce6-d5ae-d04f-7c77-b62c148d92b7@gmail.com>
 <20201106061513.uyys7njcqcdlah67@vireshk-i7>
 <a6926456-8bce-a438-bfaa-be334208f004@gmail.com>
 <CAEExFWsp0DWw1yO84e3vzr_YZkqkd+pyPfQQR3J2W6n3wTX4Jw@mail.gmail.com>
 <20201109050010.g47zojh6wafvwqva@vireshk-i7>
 <c584b301-e052-7f01-335d-8f9160865198@gmail.com>
 <20201109051014.oa6bt4g3ctm2hnuy@vireshk-i7>
 <4476fed9-a356-b7f1-32ee-935343e23038@gmail.com>
 <20201109053546.xupmmsx5qccn46tr@vireshk-i7>
 <33a7ad95-a8cf-7b88-0f78-09086c1a4adf@gmail.com>
 <20201109055320.5y5gf2whwast2mi4@vireshk-i7>
In-Reply-To: <20201109055320.5y5gf2whwast2mi4@vireshk-i7>
From: Frank Lee <tiny.windzz@gmail.com>
Date: Mon, 9 Nov 2020 19:20:50 +0800
Message-ID: <CAEExFWuF82B3bPn8T8_vkHODNwP89MDrNOqu-MhObzqTfiYODw@mail.gmail.com>
Subject: Re: [PATCH v1 17/30] mmc: sdhci-tegra: Support OPP and core voltage
 scaling
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Mailman-Approved-At: Tue, 10 Nov 2020 08:16:57 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 DTML <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 driver-dev <devel@driverdev.osuosl.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "open list:SECURE DIGITAL HO..." <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgOSwgMjAyMCBhdCAxOjUzIFBNIFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1bWFy
QGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gMDktMTEtMjAsIDA4OjQ0LCBEbWl0cnkgT3NpcGVu
a28gd3JvdGU6Cj4gPiAwOS4xMS4yMDIwIDA4OjM1LCBWaXJlc2ggS3VtYXIg0L/QuNGI0LXRgjoK
PiA+ID4gT24gMDktMTEtMjAsIDA4OjE5LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gPiA+PiBU
aGFua3MsIEkgbWFkZSBpdCBpbiBhIGRpZmZlcmVudCB3YXkgYnkgc2ltcGx5IGFkZGluZyBoZWxw
ZXJzIHRvIHRoZQo+ID4gPj4gcG1fb3BwLmggd2hpY2ggdXNlIGRldm1fYWRkX2FjdGlvbl9vcl9y
ZXNldCgpLiBUaGlzIGRvZXNuJ3QgcmVxdWlyZSB0bwo+ID4gPj4gYWRkIG5ldyBrZXJuZWwgc3lt
Ym9scy4KPiA+ID4KPiA+ID4gSSB3aWxsIHByZWZlciB0byBhZGQgaXQgaW4gY29yZS5jIGl0c2Vs
ZiwgYW5kIHllcwo+ID4gPiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKSBsb29rcyBiZXR0ZXIu
IEJ1dCBJIGFtIHN0aWxsIG5vdCBzdXJlIGZvcgo+ID4gPiB3aGljaCBoZWxwZXJzIGRvIHdlIG5l
ZWQgdGhlIGRldm1fKigpIHZhcmlhbnRzLCBhcyB0aGlzIGlzIG9ubHkgdXNlZnVsCj4gPiA+IGZv
ciBub24tQ1BVIGRldmljZXMuIEJ1dCBpZiB3ZSBoYXZlIHVzZXJzIHRoYXQgd2UgY2FuIGFkZCBy
aWdodCBub3csCj4gPiA+IHdoeSBub3QuCj4gPgo+ID4gQWxsIGN1cnJlbnQgbm9uLUNQVSBkcml2
ZXJzIChkZXZmcmVxLCBtbWMsIG1lbW9yeSwgZXRjKSBjYW4gYmVuZWZpdCBmcm9tIGl0Lgo+ID4K
PiA+IEZvciBUZWdyYSBkcml2ZXJzIHdlIG5lZWQgdGhlc2UgdmFyaWFudHM6Cj4gPgo+ID4gZGV2
bV9wbV9vcHBfc2V0X3N1cHBvcnRlZF9odygpCj4gPiBkZXZtX3BtX29wcF9zZXRfcmVndWxhdG9y
cygpIFtpZiB3ZSB3b24ndCB1c2UgR0VOUERdCj4gPiBkZXZtX3BtX29wcF9zZXRfY2xrbmFtZSgp
Cj4gPiBkZXZtX3BtX29wcF9vZl9hZGRfdGFibGUoKQo+Cj4gSSB0cmllZCB0byBsb29rIGVhcmxp
ZXIgZm9yIHRoZSBzdHVmZiBhbHJlYWR5IG1lcmdlZCBpbiBhbmQgZGlkbid0Cj4gZmluZCBhIGxv
dCBvZiBzdHVmZiB3aGVyZSB0aGUgZGV2bV8qIGNvdWxkIGJlIHVzZWQsIG1heWJlIEkgbWlzc2Vk
Cj4gc29tZSBvZiBpdC4KPgo+IEZyYW5rLCB3b3VsZCB5b3UgbGlrZSB0byByZWZyZXNoIHlvdXIg
c2VyaWVzIGJhc2VkIG9uIHN1Z2dlc3Rpb25zIGZyb20KPiBEbWl0cnkgYW5kIG1ha2Ugb3RoZXIg
ZHJpdmVycyBhZGFwdCB0byB0aGUgbmV3IEFQSXMgPwoKSSBhbSBnbGFkIHRvIGRvIHRoaXMu77ya
77yJCgpZYW5ndGFvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=

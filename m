Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBA68E6B6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670EC6E911;
	Thu, 15 Aug 2019 08:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED286E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 08:44:34 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p17so106955055wrf.11
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 01:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SDJwnQjuv8+cFv70gCeD4pPzDeWrNoPVh3U04PT4UTo=;
 b=HXecF0HL+dVHCixop7ViGHdUQXPrxEOlGySTxQKkVVyuF+Q17PSy5r3aPrSIwrr4sm
 xFWdlXZmty34HajAPpUPj2/f1FWQYwLNBctMZF30dgtDMAV5MjCUcAiH+Ve3enKdjsKc
 ACcehjHnWlsi93yQPUOJoe94yK261YnwBkacDOPPQ4P8Gl1rXucOmeOWpNWjhjncEhQ9
 bDXNBIP/1aDluTrza9zmMrFIdg5XXbvNher9Xaa0W7/HjL2VOyUzyz/1iAhMN17jiSEr
 3i7T9RKetZcCuAFrcQGTY1YTKPSvvjbJTn4kOY+KiZGSsPosTB0aOGgZSnCMnWlAIthr
 vb1A==
X-Gm-Message-State: APjAAAWl3/VZkB5nbsiIDp+X5ZypZHcyGjBAyqk7JeTALVwQs9ELtE7F
 cMhoAAPToxzDAePUtLOsxvw=
X-Google-Smtp-Source: APXvYqyh5cs0zBfsrQ9/9b4GlmZJ4f1O1rnDXbQI6CpyecdaWis32Z7KfISDGKCOzITPkf4SiQ85Zg==
X-Received: by 2002:adf:dd88:: with SMTP id x8mr37133406wrl.331.1565685873196; 
 Tue, 13 Aug 2019 01:44:33 -0700 (PDT)
Received: from [192.168.1.35] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id k124sm1896121wmk.47.2019.08.13.01.44.31
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 01:44:32 -0700 (PDT)
Subject: Re: [PATCH 10/11] mfd: Drop obsolete JZ4740 driver
To: Lee Jones <lee.jones@linaro.org>, Paul Cercueil <paul@crapouillou.net>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-11-paul@crapouillou.net> <20190812081640.GA26727@dell>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <4b48e597-951e-45fd-dfb2-4a1292a8b067@amsat.org>
Date: Tue, 13 Aug 2019 10:44:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190812081640.GA26727@dell>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:openpgp:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SDJwnQjuv8+cFv70gCeD4pPzDeWrNoPVh3U04PT4UTo=;
 b=fJtewxdPG91j4ntA6IRwYWaehG/C7ZE1FeBUd+Yf8PiTqWCE2rhuklmiys/EBFkqtX
 UqVrHjsFgRF88ZLDIxUk/PtD8H7MfvWr6RdgPNBa2i/lky+2NeHlvfriIinGYsgEt588
 eypIYoXICelKldnhDzyEy7o9xnhErO0tlhl+sY2DM24LHAkI/3Y0yYvurZP+fb6ZwRLq
 xpYDqMaw37Sa4I4ikaPkNuh7dD+Rv6OpRWPO0T8Jcc+lu9jo80gfzkLQjoseIxIURVNt
 19KxsxM3vXIu5ge12T8A+3/8etiRG2Mux4y6Gw66OTRwTsxgjc648d/VYitBFBZd45T+
 GLBg==
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, James Hogan <jhogan@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dmaengine@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGVlLAoKT24gOC8xMi8xOSAxMDoxNiBBTSwgTGVlIEpvbmVzIHdyb3RlOgo+IE9uIFRodSwg
MjUgSnVsIDIwMTksIFBhdWwgQ2VyY3VlaWwgd3JvdGU6Cj4gCj4+IEl0IGhhcyBiZWVuIHJlcGxh
Y2VkIHdpdGggdGhlIGluZ2VuaWMtaWlvIGRyaXZlciBmb3IgdGhlIEFEQy4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4+IFRlc3RlZC1i
eTogQXJ0dXIgUm9qZWsgPGNvbnRhY3RAYXJ0dXItcm9qZWsuZXU+Cj4+IC0tLQo+PiAgZHJpdmVy
cy9tZmQvS2NvbmZpZyAgICAgIHwgICA5IC0tCj4+ICBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAg
fCAgIDEgLQo+PiAgZHJpdmVycy9tZmQvano0NzQwLWFkYy5jIHwgMzI0IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCAzMzQgZGVsZXRp
b25zKC0pCj4+ICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZmQvano0NzQwLWFkYy5jCj4g
Cj4gQXBwbGllZCwgdGhhbmtzLgoKSXQgc2VlbXMgdGhlIHJlcGxhY2VtZW50IGlzIGRvbmUgaW4g
Ik1JUFM6IHFpX2xiNjA6IE1pZ3JhdGUgdG8KZGV2aWNldHJlZSIgd2hpY2ggaXMgbm90IHlldCBt
ZXJnZWQuCgpQcm9iYWJseSBlYXNpZXIgaWYgdGhpcyBwYXRjaCBnb2VzIHRocnUgdGhlIE1JUFMg
dHJlZSBhcyBwYXJ0IG9mIHRoZQoiSlo0NzQwIFNvQyBjbGVhbnVwIiBzZXJpZXMuCgpSZWdhcmRz
LAoKUGhpbC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

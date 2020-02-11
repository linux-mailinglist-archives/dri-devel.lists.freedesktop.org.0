Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4B515A347
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13A96F48B;
	Wed, 12 Feb 2020 08:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54DC6E26C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 20:48:32 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q8so13127218ljj.11
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 12:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LqjAANVr3QUa9/jn5BxY1hlvgQhyJJrq1+NtVKHCduM=;
 b=nZzuIR3P/P33cQ7XHVWp+ufjdXODTG3MtJzSO+ScRXg4S39DMRBCQDNsXJYQElGdzm
 ouIpbn8tkV777xxbILSIJIZF6oKC3I2Si6MwizHxW4aWRfElhhY9X7dWXFdiV30DPesA
 1GNKe0dc6C9lmgr0F7fobbFzgGGVfLGxHD641Oigb/F9laDgG+vmMzcduEN8wahKLTnH
 5bPGYUt8+lVfdT1xzNP1Jau4odY8wAsRLFHNiBtyuidHzkqwt2zwqnqsPtfysLzpNrTN
 lR1TR3goVHtpssWR2h78bQFyQerGdERIYnoz0ngcnt2Z6dcZrYi5nNurGeF7SXk0pAuJ
 n4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LqjAANVr3QUa9/jn5BxY1hlvgQhyJJrq1+NtVKHCduM=;
 b=l7CyxqZaBstaiWaJoAs8UXimVEtBsqgRSZzIWZCFb2bUR2BCx9DKdhIzQCcgQ2+bsF
 LkvazmVxXX87bc4X+4kSdgVb6lllrfMgL7/4PIWuY8V74bs7rnRarNyFeBSYpuuBRBhO
 XzmqfF97da3VKxrxV2qa4KnR/8XpEAmHSuHtTjqlr6kovCsnT2kozorrh5nUcTmK5F6U
 +V8gWDX2zgubzi7I5zP6fpvs4ifIcPEdHfsebTE4eWWk4UF5Os6GOEw0tnFkNPEBkZyg
 6y/aJU1v4BvRTBEx0njRsBqVDQebVjqDoLGJMUwTvIe+SVFh80X/rhMom9zSV4y9KmiC
 J8dg==
X-Gm-Message-State: APjAAAV7m3n/vFA78b0aXYzqscovhPPCl+hrP4LI/5Lx510xlkZHboFZ
 ewucbUvTtmh6G0DkhQEQMUA=
X-Google-Smtp-Source: APXvYqxQouPBSnzMQ60Fpg/1V/YGZaJ3zNNtUQbG94tj5k7NHsupGdwEO3PyBcAojadIFe8aR4KdbQ==
X-Received: by 2002:a2e:85ce:: with SMTP id h14mr5365962ljj.41.1581454111246; 
 Tue, 11 Feb 2020 12:48:31 -0800 (PST)
Received: from kedthinkpad ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id r20sm2354515lfi.91.2020.02.11.12.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 12:48:30 -0800 (PST)
Date: Tue, 11 Feb 2020 22:48:28 +0200
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/1] Support LVDS output on Allwinner A20
Message-ID: <20200211204828.GA4361@kedthinkpad>
References: <20200210195633.GA21832@kedthinkpad>
 <20200211072004.46tbqixn5ftilxae@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211072004.46tbqixn5ftilxae@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 12 Feb 2020 08:25:13 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime, thanks for your comments. I'll update the patch, but meanwhile,
I have some remarks/questions, see below.

On Tue, Feb 11, 2020 at 08:20:04AM +0100, Maxime Ripard wrote:
> > +	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA1_REG,
> > +			   SUN4I_TCON0_LVDS_ANA1_UPDATE,
> > +			   SUN4I_TCON0_LVDS_ANA1_UPDATE);
> 
> You refer to U-Boot in your commit log, but the sequence is not quite
> the same, why did you change it?

I actually had two reference implementations at my hand. One was u-boot
and another - an old (abandoned) branch of Priit Laes [1] (I took the
split-up of u-boot SUNXI_LCDC_LVDS_ANA0 constant from there).

This is an attempt to simplify the sequence, since I noticed that the
same bit was being set to the same register twice [2] and removing that
duplication didn't produce any observable regression. Priit
implementation didn't have that bit set in the end of the sequence
either, so I omitted it. That said, I agree that it could've been a bit
naive on my side, and I can get it back to match u-boot version, if you
feel that might be important.

For the reference the U-Boot code is here: [3]

[1] https://github.com/plaes/linux/commit/cc8c8bab2f2f2752ba6b11632dcd0f41bac249bc#diff-014a76a5007005a7a240825a972b8c7fR127
[2] setbits_le32(&lcdc->lvds_ana0, SUNXI_LCDC_LVDS_ANA0_UPDATE);
[3] https://github.com/ARM-software/u-boot/blob/master/drivers/video/sunxi/lcdc.c#L60

> > +#define SUN4I_TCON0_LVDS_ANA1_REG		0x224
> > +#define SUN4I_TCON0_LVDS_ANA1_INIT			(0x1f << 26 | 0x1f << 10)
> > +#define SUN4I_TCON0_LVDS_ANA1_UPDATE			(0x1f << 16 | 0x1f << 00)
> 
> Having proper defines for those fields would be great too.

If by "proper" you mean "split them up to individual bits", I would
agree, but I can't find any actual hardware reference documentation that
would mention the meaning of these registers.

In both places (u-boot and Priit) these constants are defined the same way. 

I took the liberty to rename ANA1_INIT1 to ANA1_INIT and ANA1_INIT2 to
ANA1_UPDATE to match Priit naming rather than u-boot, as I felt it was
more descriptive. I have no strong opinion here though. 

> Side question, this will need some DT changes too, right?

Hm, I agree. I think it would be reasonable to include LVDS0/1 pins and
sample (but disabled) lvds panel, connected to tcon to
arch/arm/boot/dts/sun7i-a20.dtsi. Does that make sense to you? Would you
expect dts changes in the same patch or separate?

P.S. This is my first patch to the linux kernel, please forgive me my
inexperience.

-- 
Andrey Lebedev aka -.- . -.. -.. . .-.
Software engineer
Homepage: http://lebedev.lt/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

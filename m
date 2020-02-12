Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF7715BA93
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 09:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C53E89190;
	Thu, 13 Feb 2020 08:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A081B6E125
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 22:46:57 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x14so4248500ljd.13
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 14:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jrYNxcmAESHKexGAddHOv9wtAKXJzgWh89e239PGRQo=;
 b=PFFtJaHKIrNlUKS6NsRZWetgbbjhBlkI0g7tnl2WGU5kaUqi+zNun/iNdoK/DEDDiS
 HNkQw6hvXdwZihxbQefigPoLmceiAnmLwudOExlfolrXpKRtXYlySM+UthcT1qsmvcW/
 zbuCIaL+5o+Ap8LUBQHJ5+Xp+LEU2psM35r/B68UVaY+CMkXphIpRo3a3FgszEnO2dsf
 yWVpHOk5hKgOE+XnVzmh4Bv26YqiKa6cn6T0wDFLu6ZUnh5lg9aVjSNs/Ic7RI4Mpj9I
 Izlj168dzT7UUt+SpupM16uiM260AIE494w59HZJZTa6fTgWRVmatKFAYvMqLwd/2GKr
 duBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jrYNxcmAESHKexGAddHOv9wtAKXJzgWh89e239PGRQo=;
 b=sYImI+RB8dQ0WS0UQkKiaQdnaTJd8CWbfvhvZIJQr/mSoQhe8Gpr5e8mvk3ePrp6uU
 3+F8s5qVx26ACMGYQ01rAAfdMTjcfga6qQLT8rFDbnm0azse47aHM6eBfg/E+1cQAM0I
 rNlWSLQvPuDHkkuAifqt2SLukpAnTPkwzQ1ADh4XL7LMfd9rrFX53xrNGwZqlpT6vt6o
 JnO3SW+nmJ4TviQxBggmTSARA53u3bmvyVHu9gwimdT8NWRnEuwHIiN4BneprjgcqtP/
 bx318+R+Yk3JQbE6WcLLwJaEweJyvofl7XJ9DKmoiiO74fp0gYU8uIgL2PLHgoLynj7E
 nhqg==
X-Gm-Message-State: APjAAAWa+/S37Y6MARGl3M4YkmToiNlLgKRpn0vL/CNDcvT7Pt7LlQAU
 N0m5lA6vVGfMS+mQn571C+c=
X-Google-Smtp-Source: APXvYqybqDLRJg2IrAK1fX24sksSPwXxUp90d3598YjdvkPi0K1jiArVzSr4wzrM3vq8gpEnprObzw==
X-Received: by 2002:a2e:7818:: with SMTP id t24mr8865749ljc.195.1581547615958; 
 Wed, 12 Feb 2020 14:46:55 -0800 (PST)
Received: from kedthinkpad ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id v7sm257086ljd.12.2020.02.12.14.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 14:46:55 -0800 (PST)
Date: Thu, 13 Feb 2020 00:46:53 +0200
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/1] Support LVDS output on Allwinner A20
Message-ID: <20200212224653.GA19494@kedthinkpad>
References: <20200210195633.GA21832@kedthinkpad>
 <20200211072004.46tbqixn5ftilxae@gilmour.lan>
 <20200211204828.GA4361@kedthinkpad>
 <20200212125345.j6e3txfjqekuxh2s@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212125345.j6e3txfjqekuxh2s@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 13 Feb 2020 08:12:52 +0000
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

On Wed, Feb 12, 2020 at 01:53:45PM +0100, Maxime Ripard wrote:
> > > Side question, this will need some DT changes too, right?
> >
> > Hm, I agree. I think it would be reasonable to include LVDS0/1 pins
> 
> That, but most importantly, the reset and clocks for the LVDS
> block. Also from looking at it, I'm not entirely sure that the TCON1
> has a LVDS output

I also have impression that LVDS is only supported on TCON0, but that's
mostly from this comment in sun4i_lvds.c:

	/* The LVDS encoder can only work with the TCON channel 0 */

> do you have a board when you have been able to test it?

Yes, I have the hardware (Cubieboard 2) at hand, but I cannot change the
any physical connections on it. FWIW, it is https://openvario.org, the
device we are (painfully) trying to upgrade from old kernel-3.4 with
proprietary mali drivers to contemporary software.

> > and sample (but disabled) lvds panel,
> 
> That's good for the sake of the example, but it shouldn't be in the
> same patch, it won't be merged.

I jave just submitted version 2 of the patches - set of 2 patches this
time. Addressed your comments, please take a look.


-- 
Andrey Lebedev aka -.- . -.. -.. . .-.
Software engineer
Homepage: http://lebedev.lt/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65254292509
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 11:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D346E8FB;
	Mon, 19 Oct 2020 09:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997946E900
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 09:56:05 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id d23so4719571pll.7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 02:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DQpTimuAzlDszY/84TRziF9dlZoz9pu8dPHqAyzWiC0=;
 b=aP7DWCBSkCGEQpiV7lINj+OlwLMXmBFhs/Wk/5sbR3y/Hjg2LVFGUZbHZiC30JdoaY
 CwCNSwBEpHUBJJT3/aYOT2iKuByfg9gMrMnJWxmSlGKhJJ3+HXfGV07D1bK6j9jyQxFt
 Y2EhO4037v/3glXJcDPGiDeLRBk7mz695vGQVtTGVslJSuNVFe4ggZHbS9I12tFRNmdL
 Tzg6oNZURMD0aueG2V9CC/vB9l8zV0GW4rAfM8GJYV2Tn9/gM5PSb26RbzGK1Od6na1M
 q7uR5vxPbn61CSJHwY2EvoSco/wv2vgGWkeeDqmBxMA2efvnE3GqAfGZuWmGHti2my7Z
 9giA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DQpTimuAzlDszY/84TRziF9dlZoz9pu8dPHqAyzWiC0=;
 b=l+KxAfPpDsSjDw4EbjVw52HOIudQILzLS5TmhZ9po5CZp8AoAHSIOMWSgAv7gjYXhb
 HrIKZkGMpI5szyGFpkjxdMzSX7tpyrK+LlfuKQk0e50GuXLwb7SKqwzXpG00OI7MAFpn
 Xrs7znGAaaqn1sgjM5oGFFq3IbMzt7dbooNIcN8oSrGyrV7DdnxOx660JASUcnM4kgev
 FJwQTgrQo8FnIynMIPzU5bQWC2bTzeBH6KgksPwSAzAF+CZ94TEBRQ78/7UAxfpX5lrO
 FLQk5MEEsAhuwgctsShAHqyWSSuoS8APu47v1HjN6NqCWJkuK84FX+umgBc6smLktnLz
 6UjA==
X-Gm-Message-State: AOAM533t6yosB/JJlKj4sLDTZpEOP+IKuwvD+beTT2jkQYDiOzrQVtQy
 BkDAjyZB70Q8gkcdNchRAA==
X-Google-Smtp-Source: ABdhPJyGyYH9MTCeR5rG3OoYXSgt0G+X5ge3qXoDmm42aLzcfzs8qR32UB2f4T0EJpvvUr5jV9mn8Q==
X-Received: by 2002:a17:90a:f685:: with SMTP id
 cl5mr16490738pjb.210.1603101365246; 
 Mon, 19 Oct 2020 02:56:05 -0700 (PDT)
Received: from PWN ([161.117.41.183])
 by smtp.gmail.com with ESMTPSA id t19sm1111202pji.18.2020.10.19.02.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 02:56:04 -0700 (PDT)
Date: Mon, 19 Oct 2020 05:55:56 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] Fonts: Support FONT_EXTRA_WORDS macros for font_6x8
Message-ID: <20201019095556.GA702017@PWN>
References: <20200820082137.5907-1-s.hauer@pengutronix.de>
 <926453876c92caac34cba8545716a491754d04d5.1603037079.git.yepeilin.cs@gmail.com>
 <CAKMK7uF9E24P=vzKt28=1_iaFTYD7obHs+tEPwwZPNMhh7DBrg@mail.gmail.com>
 <20201018201811.GA697615@PWN>
 <CAKMK7uFEmNnBdpoHYqvCUYS=nxh99gKs6P1-1pgp-ouvTSioGw@mail.gmail.com>
 <20201018204456.GA697766@PWN>
 <CAKMK7uEoCqaPifM7CiaNwtSe8uZ9V-7joJfXSYLjy5pedAcjOg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEoCqaPifM7CiaNwtSe8uZ9V-7joJfXSYLjy5pedAcjOg@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sven Schneider <s.schneider@arkona-technologies.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 18, 2020 at 11:51:19PM +0200, Daniel Vetter wrote:
> On Sun, Oct 18, 2020 at 10:45 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > I'm confused, I see it on LKML in the link above. Sure I'll resend soon.
> 
> My brain didn't work, sorry about the confusion.
> 
> I'll pick up the patches tomorrow, probably not a good idea I do
> anything more today :-)

Ah, no worries, thanks!

Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

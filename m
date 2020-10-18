Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B7291FF7
	for <lists+dri-devel@lfdr.de>; Sun, 18 Oct 2020 22:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF99A6E8A4;
	Sun, 18 Oct 2020 20:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153B16E8A4
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 20:45:06 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id g16so4185103pjv.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 13:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=knFTAfIPNfK0zMG6Crewi1ksambWz4eNn+ixDl4AQuk=;
 b=K+O1SkRwxCl1CIvmSz86ET2rIzrCAAEEw3mxrHscAYc/V3UDUtFL0ZG3UZ+X1D8O+U
 FpHqvbDS8cpKWnCryE0nSxtw9jToBsLQX2pvHR1T1SG75TKAP3YfnjZblbf+qN4lyfN9
 ek2RBUIdceP7nSyBBX0vsbafvg2JvmP8neUPQFdgVB5bJyGkRGX7q7EAULP+khK0n7fo
 besSDZbrVdffWplXDW2T0/RzXsWHMHqILfhI0bYDhLOGQPM1+gVa6Krue3QPLjV5zdRf
 YQAJSi5NMjJdjpF3eN5eKAEy+K5sSv8MC8GH0k1Hxnlqe4iIFPcGHUVYdYLkXKuZGsEK
 MaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=knFTAfIPNfK0zMG6Crewi1ksambWz4eNn+ixDl4AQuk=;
 b=Rp9uiir/rN/ihVJR76io/cx6iDP8ICG9VvWsEZXkOtk1PqGt8daycHQD4asB/22AAT
 7OFsXEgfKmkLqFamqVxS5i2p5mM9i6kTEUiJRjOS8Pw/QhiGuIboBdZ7JJ7ioNelTUE8
 +ZismkXvBZ2AEx6cM4RQucYOyRiOHqsv1fAnUILp8vfKN/zn1jShwRvWAYscpCabHs+2
 JP0+2i3XZyhshFB4MwkhZ4DU+1xXqWKnSOFcO9e+Y5mUMH3DLxgTed3IMFsWpt+LygAc
 ElM/FJtokTONUbyYe1zQFbLodBVgqVjBNSlP/j7f10xfTxlOerRZFWOAA4p10ma6OYxb
 udFQ==
X-Gm-Message-State: AOAM533Wk0fREl0yqZSxAwQ1xm9lIihCpuPwbGq9lxDDq4/7gFwjj9w9
 +HdT/H9pujXot5+TaJZSKDTH3x8JpiEY3Dg=
X-Google-Smtp-Source: ABdhPJwko5Q7XjO6YbrUJ+jWW0NWV3X1Jtv2FRCBiG7hzcQpdIYwm3jPq1Yk6OTo6LcyC22+U5oNRw==
X-Received: by 2002:a17:902:6b07:b029:d3:ebaa:d028 with SMTP id
 o7-20020a1709026b07b02900d3ebaad028mr14299830plk.11.1603053905596; 
 Sun, 18 Oct 2020 13:45:05 -0700 (PDT)
Received: from PWN ([161.117.80.159])
 by smtp.gmail.com with ESMTPSA id gd14sm9656624pjb.31.2020.10.18.13.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 13:45:04 -0700 (PDT)
Date: Sun, 18 Oct 2020 16:44:56 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] Fonts: Support FONT_EXTRA_WORDS macros for font_6x8
Message-ID: <20201018204456.GA697766@PWN>
References: <20200820082137.5907-1-s.hauer@pengutronix.de>
 <926453876c92caac34cba8545716a491754d04d5.1603037079.git.yepeilin.cs@gmail.com>
 <CAKMK7uF9E24P=vzKt28=1_iaFTYD7obHs+tEPwwZPNMhh7DBrg@mail.gmail.com>
 <20201018201811.GA697615@PWN>
 <CAKMK7uFEmNnBdpoHYqvCUYS=nxh99gKs6P1-1pgp-ouvTSioGw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFEmNnBdpoHYqvCUYS=nxh99gKs6P1-1pgp-ouvTSioGw@mail.gmail.com>
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

On Sun, Oct 18, 2020 at 10:33:11PM +0200, Daniel Vetter wrote:
> On Sun, Oct 18, 2020 at 10:18 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > 2/2 is just updating the fb documentation:
> >
> > [PATCH 2/2] docs: fb: Add font_6x8 to available built-in fonts
> > https://lore.kernel.org/lkml/717bb41dda8e2ed615f3faadfbc3e215de726d38.1603037079.git.yepeilin.cs@gmail.com/
> >
> > I did `git format-patch -2 --thread=deep`, did I do something wrong when
> > sending it?
> 
> No idea, it just didn't arrive anywhere I could find. And I did get
> your previous patch series. Maybe just try again with dri-devel
> included and hope it works then?

I'm confused, I see it on LKML in the link above. Sure I'll resend soon.

Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

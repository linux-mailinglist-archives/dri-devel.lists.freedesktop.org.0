Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90854456AA3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 08:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8E66EAD6;
	Fri, 19 Nov 2021 07:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6A26EAD6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 07:07:52 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id w15so9339944ill.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 23:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XEh/s7tEdVrId7D7QdtgSAFRrftVLOXkLbJ19XutxWo=;
 b=kByWC2nB/lrIOImrNRp9613Bx2cw61Zwb+qRj+mIkfc5aFTVXtREYDEVOho75m/Qfs
 NmNdzqNDpb1H1FxxAp3y0rgQu5ubFs6vuVmF/vV6Sa68cTZ0OaWJXk0hd8U3wMz/J1R0
 i2JA3UJPajx7bYz4IeLNJ85+dctJNiy8xfL9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XEh/s7tEdVrId7D7QdtgSAFRrftVLOXkLbJ19XutxWo=;
 b=CMLEvUg8lsdq89yLsU4YW+VdpYs9cDArXOnwHTsDrnzBTuFtkspoWEnTuAyd3pARX0
 LVev2SGjBNLQ2gb05NMuu6XWH3vghGWFoPw9A9kUfeK7pdLENKtroPFrme64IjByXqrE
 2SiWicMeup5/QYdVVEHjAwbRw+94eCdFRq3OErGYhSWdyYWprhzEULhF12FuE3GeKbOa
 VVOCH7ciEvxRRfGaMu1VAOpQIGfqmBvEWz2gX0BfhzAJoWNjj/y+qhgFlP8DN7Mn+9U6
 EfIZ2fHJlhlcMmdeXP7Jlx2LjH4sz/46rAaAMO5WWNWlshVzINSVU89F7Fol4W37hNvt
 u/fg==
X-Gm-Message-State: AOAM533zUDqGtvQHL2DTkUXg1JVKa6GS2e5SO0PW0yY0cKCbLSbhNNFR
 NnDRgUjaTYarXDZHzkTX49SnMV9mNCB/QC07VB4=
X-Google-Smtp-Source: ABdhPJz0WkViNZyZZO//jSY64Wq1P9G8AX4O2vABPNOb5F+G0JSY4iPJkhSB0KQvvTxC1uLkIBnxUzZkYqP+UhzhX44=
X-Received: by 2002:a05:6e02:15c7:: with SMTP id
 q7mr3309423ilu.196.1637305672050; 
 Thu, 18 Nov 2021 23:07:52 -0800 (PST)
MIME-Version: 1.0
References: <20211117010145.297253-1-joel@jms.id.au>
 <483e616cb69c780f6102ae058a26704a0443d38f.camel@codeconstruct.com.au>
In-Reply-To: <483e616cb69c780f6102ae058a26704a0443d38f.camel@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 19 Nov 2021 07:07:39 +0000
Message-ID: <CACPK8XeKqpLdNQp8Em1ZSPPcJA111SyCSb_NhoKNER209toLCQ@mail.gmail.com>
Subject: Re: [PATCH] drm/aspeed: Fix vga_pw sysfs output
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Oskar Senft <osk@google.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David, Daniel,

On Fri, 19 Nov 2021 at 06:54, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Hi Joel,
>
> > Before the drm driver had support for this file there was a driver
> > that exposed the contents of the vga password register to userspace.
> > It would present the entire register instead of interpreting it.
> >
> > The drm implementation chose to mask of the lower bit, without
> > explaining why. This breaks the existing userspace, which is looking
> > for 0xa8 in the lower byte.
> >
> > Change our implementation to expose the entire register.
>
> As a userspace consumer of this:
>
> Reviewed-by: Jeremy Kerr <jk@codeconstruct.com.au>

Am I okay to apply this to drm-misc-fixes? I've not applied a patch to
the fixes tree before, so I wanted to check if there is some process
I've missed.

Cheers,

Joel

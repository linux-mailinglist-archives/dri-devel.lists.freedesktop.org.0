Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DB7312480
	for <lists+dri-devel@lfdr.de>; Sun,  7 Feb 2021 14:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A7B6E15E;
	Sun,  7 Feb 2021 13:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478B26E15E;
 Sun,  7 Feb 2021 13:11:45 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id z6so13804483wrq.10;
 Sun, 07 Feb 2021 05:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QKECbsWCMXV3jdws0/56aBoSaNa9rnsRvH773f+Ajxs=;
 b=J9mKA6jAoyc+ndFvGXTJbR7opS6yIPhigLhA5yw0KXqdR+KY5kcxzuovEDVQVj7ttE
 Yaj2fuIxchsknU84aXiwgbq1o189RPKd6hS00mG/emXrQDZSm7wXiTMGuuz769SW8Dpd
 r7Yl4MnxeNL8ygHBf0y6iXtwhG5k2jYST8mOdp5PtKQmDfYOYdhYeIr4my62HJDhdUdr
 GDUn3VPScc4ZZeYKaVC+bZn61gMRkIWL551IO/5BGgDpvw/5vnAp0Ixr3BZQ18DIEcF/
 0N6dQ3oSDJx4/hSwiCLolDou/L7WxIKv+MhBy2ov7lv5/GhA4+AxdVMt3SG2uNa/WZ0O
 1e1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QKECbsWCMXV3jdws0/56aBoSaNa9rnsRvH773f+Ajxs=;
 b=jzdUn/5gd7SoWyO2K7Y5LMHO4AhpCnbyJZS5upMXnOn+TE6LAIQq/7ZNlDPHoLFZPC
 NUelPS4OqsWMj6f7WGxoT9ugQRhcDw9RcGCI018WedpBRHNkTRGtDFRoiaLVl4pldWOb
 L10czka6ixmuiTeQ7kjq0ZlVgM1L9YCXdJByjOtXjcaqEwJizXyqnxuftEa6ok3j4YAx
 m+X8167Gm6V0YdxqFkG5cVFsHeR762RvTZSnnWshJTqj6utmZLyxUtfHewcv3Jb2D++f
 I0uBdmRQ5H+mHnRDmGb8waq8IibCiemLF69YhqRVdQO5B1e8miA2IE5EJ3ehXq4Y2Ex7
 pTWg==
X-Gm-Message-State: AOAM530gsMIWbE5iqeC8xerTzuPddWINcepXn2z4dvYR+QHeeFB0WtIt
 wNZjWlBGgLzTzhRH0rpCnz114sYu0+VhVmmlzxA=
X-Google-Smtp-Source: ABdhPJyeGR8kZfLzFpYv0bD6bYcy2h0AO7MffReuc+RgGV+SwVun4EOnTj+f6/OPtZPdbP55fN6tAjXbaNICE28lTvc=
X-Received: by 2002:a5d:4b8e:: with SMTP id b14mr14532579wrt.130.1612703503805; 
 Sun, 07 Feb 2021 05:11:43 -0800 (PST)
MIME-Version: 1.0
References: <20210127194047.21462-1-christianshewitt@gmail.com>
 <CAKGbVbtaDHmukvfF=sfSmWHVdAYoF6-i4RTzsPQ6zfsjHcGNCw@mail.gmail.com>
 <2c8d2b9e-c1cc-1157-19de-409957ecf9da@arm.com>
 <CAKGbVbuLRvZaZNfU-pi=7vqJZO2zOHAkrjTo6vs9BKLrV21O8g@mail.gmail.com>
In-Reply-To: <CAKGbVbuLRvZaZNfU-pi=7vqJZO2zOHAkrjTo6vs9BKLrV21O8g@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Sun, 7 Feb 2021 21:11:32 +0800
Message-ID: <CAKGbVbu-BJMxpwbC4XoP3rzt_hYtoSVHr1zjA5OXSy8YQmEXag@mail.gmail.com>
Subject: Re: [PATCH v2] drm/lima: add governor data with pre-defined thresholds
To: Lukasz Luba <lukasz.luba@arm.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.

Regards,
Qiang

On Tue, Feb 2, 2021 at 9:04 AM Qiang Yu <yuq825@gmail.com> wrote:
>
> OK, I see. Patch is also:
> Reviewed-by: Qiang Yu <yuq825@gmail.com>
>
> Regards,
> Qiang
>
> On Mon, Feb 1, 2021 at 5:59 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
> >
> >
> >
> > On 1/30/21 1:57 PM, Qiang Yu wrote:
> > > This patch gets minor improvement on glmark2 (160->162).
> >
> > It has bigger impact when the load is changing and the frequency
> > is stuck to min w/o this patch.
> >
> > >
> > > Seems there's no way for user to change this value, do we?
> > > Or there's work pending to expose it to sysfs?
> >
> > True there is no user sysfs. I've proposed a patch to export these via
> > sysfs. Chanwoo is going to work on it. When it will land mainline, it's
> > probably a few months. So for now, the fix makes sense.
> >
> > Regards,
> > Lukasz
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

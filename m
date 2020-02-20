Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFCD167BC8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272386F40C;
	Fri, 21 Feb 2020 11:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF9B6ED0B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 09:44:14 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id t26so3908877ioi.13
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 01:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QT/bClfWBC0w+NUxOHZIftb3rGcPtYQdlmIKe6O0uis=;
 b=T2mze/9rr0qw8y10sXtQt5GIwP0JUitC+0q73XiYA0459VrkFjIrveX7AmBOsXZqwD
 pt5298wgoJgIcE0mbA9M0IJRFC1mPCXYHWHNirGepJZsoEl+rgIlCtYB1wMjMABj7guI
 6dzxO5kigNVc0rzJ4SGajLHf2Ef5y8u14FMNuPSnmaVAsMHcGuNoE9dCrcoJFfIpCetQ
 2vzLouv7+7mDnme9illrjqtCUeFHVCLfcYq0jybqM2fuNmllXZ2VvBysIvJSaLr1ySF+
 sc4bi3gurxpSBhALGTuwVMu7vR8jkhUy6IzmW015moUQfMTbnO8NZ9aLnms9Au2uNTI7
 fQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QT/bClfWBC0w+NUxOHZIftb3rGcPtYQdlmIKe6O0uis=;
 b=PeYQv1XWqD0yH+n8A6TBgJoFzBUMZgYVFZCs+W/5+s7267l9eqiIIsOvpfNO34f07Z
 aN/XEs+U9lTWZqzy50cIEEapAVEcgqP4hLIv67FTRSJILrUF74JZEKxKoye3+OtDffVd
 Q4Fmoweutwask6NrloN2k+JtrKq70/rRqsjNSBr0vu3K+C/nVdBJzPk70f7eYGIN5FP8
 45XkIVTcaJJmMgRVAQwttdmyDE4GtMyegdK7mZ/okEFYunLZUvd+9t4T1tOHcHEmo0bI
 prJw3DLLErYPHeWgUjBNuyPkNiETTFYVy3uyuufaMzLRRg7oZJodyhhXOJ+JOIbx7fXc
 Ivug==
X-Gm-Message-State: APjAAAWAbjqtYc2Wnag4Bzoxxr3wcBO73dI1D6FymK6DOLbJRTnuo2Bx
 g9mVhQ2c+sXbxKh8M1AmDs0Yi+dqWtFPDqdshN46qg==
X-Google-Smtp-Source: APXvYqyeZ+JcrsXVpk+krPugyvcFamgoxUfJp7kz2mYgdin5zSv7hnhMtyQ8RfsgupCcLMHS5HNLbrCzFQwf9Pisjbs=
X-Received: by 2002:a05:6602:1483:: with SMTP id
 a3mr23929934iow.229.1582191854151; 
 Thu, 20 Feb 2020 01:44:14 -0800 (PST)
MIME-Version: 1.0
References: <20200217153145.13780-1-james.hughes@raspberrypi.com>
 <CADaigPXfS4o-QQVPsp1axNz+hAATJqA-vzupC0VRWceJNEZNEg@mail.gmail.com>
In-Reply-To: <CADaigPXfS4o-QQVPsp1axNz+hAATJqA-vzupC0VRWceJNEZNEg@mail.gmail.com>
From: James Hughes <james.hughes@raspberrypi.com>
Date: Thu, 20 Feb 2020 09:44:03 +0000
Message-ID: <CAJ+9seGY3owufzm4WZwTQXQA9BonyamCCWCrazA3bukEkGixug@mail.gmail.com>
Subject: Re: [PATCH] GPU: DRM: VC4/V3D Replace wait_for macros in to remove
 use of msleep
To: Eric Anholt <eric@anholt.net>
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:24 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Feb 2020 at 22:51, Eric Anholt <eric@anholt.net> wrote:
>
> On Mon, Feb 17, 2020 at 7:41 AM James Hughes
> <james.hughes@raspberrypi.com> wrote:
> >
> > The wait_for macro's for Broadcom VC4 and V3D drivers used msleep
> > which is inappropriate due to its inaccuracy at low values (minimum
> > wait time is about 30ms on the Raspberry Pi).
> >
> > This patch replaces the macro with the one from the Intel i915 version
> > which uses usleep_range to provide more accurate waits.
> >
> > Signed-off-by: James Hughes <james.hughes@raspberrypi.com>
>
> To apply this, we're going to want to split the patch up between v3d
> (with a fixes tag to the introduction of the driver, since it's a
> pretty critical fix) and vc4 (where it's used in KMS, and we're pretty
> sure we want it but changing timing like this in KMS paths is risky so
> we don't want to backport to stable).  And adjust the commit messages
> to have consistent prefixes to the rest of the commits to those
> drivers.
>
> I've been fighting with the drm maintainer tools today to try to apply
> the patch, with no luck.   I'll keep trying, and if I succeed, I'll
> push it.

Hi Eric,

unclear whether you want me to do the split or whether you are going
to (your last paragraph). Also I'm a bit unclear on the exact
requirements for the prefixes etc.

James
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AABE20A3E3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 19:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C9F6E2EC;
	Thu, 25 Jun 2020 17:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988CC6E2EC;
 Thu, 25 Jun 2020 17:23:08 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id o18so2271611eje.7;
 Thu, 25 Jun 2020 10:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZBtrIEKCE3E3b9RfEMbE2hSdZwvWHKvD0A4vAHDUD10=;
 b=kTp2zd62dEuGfCcTT7WrPqZBwnXZ1iJzUi7JQxz+7yCPew7Fg7FHigdUKW+jDRg6Lg
 aftnNiusSGEuqDIKYV9FQKn4vi5n41W5QT074Z7gfrNcGzf52f3f38qt9jOMRHzQCqu/
 zvyqQ+ZKNuyqny8TnAeonRCDD6yMr0xQ2bVp2k+McclbpE82a+SoiGmCP4Mu0dC2v0r5
 D7WFNBxTFuo+pxIoLea99mh6dqcZPTfcPew3IAJdPbgMNxRZGCAigL2zdtiE/l8F+Gne
 ck9TphrBq0Arp6dyRX/RJx5iJL/ep1HC2w9tIfCdTwJtlTKt4dQOhzmCM0dFvEXCLPr+
 zeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZBtrIEKCE3E3b9RfEMbE2hSdZwvWHKvD0A4vAHDUD10=;
 b=sgzbwtm/ARDz0Fs/omYMORvpDpvux8779zJT9XrvULgdhcCLDngIfNujSJC1ovFx49
 BqO2oiaX29enrUZhIju7Tb3e+ryxJ3mbGE4AfiEANakc1ZhE9ORZBeK2XFD1+Xwt8Gce
 BZ7TofveJa+xrkrMdHJYunOEeJHhe9zBSUR8xjvgV9ec11dQxTFMJHgtNXJIuDqWZRiT
 NA1ykGT3EPWOoJwxB5q7CAEj5QFcfkt4wtOV1q3qU6cyjyLX8W/02OVvMdHzXVPrcIni
 zFv83VriYMHtAuDjde4LdzAdajANc0lJYWxcreL7qFA/1c67q9upFPYk3MQkFjPFlIdL
 UJGA==
X-Gm-Message-State: AOAM533CuaszwgYiGaU6adQb38ZKSPSfsigpk3MntruJ8DvoA8X2kGca
 Y1QQWpo6srYC2pSqntO39KqSu+mWyfNJa+oV+X4=
X-Google-Smtp-Source: ABdhPJxRAf4iIWRLlL148oUYdzDWkDZIg8cJuPp+HZBIcQVphTilHZz3bpz9kFmFTB82yiQN/M4DoikVuOA5TApxsTQ=
X-Received: by 2002:a17:906:4086:: with SMTP id
 u6mr14320048ejj.9.1593105787155; 
 Thu, 25 Jun 2020 10:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200507153600.314454-1-jason@jlekstrand.net>
 <158886626795.20858.1870213936656066157@build.alporthouse.com>
 <CAPM=9tyhj+KNDFdw1nk0GASwfY5dwq2kAcxQ4oSHMt2BNyycVw@mail.gmail.com>
 <158891748855.5249.8585589207741654136@jlahtine-desk.ger.corp.intel.com>
In-Reply-To: <158891748855.5249.8585589207741654136@jlahtine-desk.ger.corp.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 26 Jun 2020 03:22:55 +1000
Message-ID: <CAPM=9twKHxG6L35UQpWEiVXQSLKgH1BepE6uhxb+RjUh3UpAKw@mail.gmail.com>
Subject: Re: [PATCH] RFC: i915: Drop relocation support on Gen12+
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 May 2020 at 15:58, Joonas Lahtinen
<joonas.lahtinen@linux.intel.com> wrote:
>
> Quoting Dave Airlie (2020-05-07 21:27:27)
> > On Fri, 8 May 2020 at 01:44, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > >
> > > Quoting Jason Ekstrand (2020-05-07 16:36:00)
> > > > The Vulkan driver in Mesa for Intel hardware never uses relocations if
> > > > it's running on a version of i915 that supports at least softpin which
> > > > all versions of i915 supporting Gen12 do.  On the OpenGL side, Gen12 is
> > > > only supported by iris which never uses relocations.  The older i965
> > > > driver in Mesa does use relocations but it only supports Intel hardware
> > > > through Gen11 and has been deprecated for all hardware Gen9+. The entire
> > > > relocation UAPI and related infrastructure, therefore, doesn't have any
> > > > open-source userspace consumer starting with Gen12.
> > > >
> > > > Rejecting relocations starting with Gen12 has the benefit that we don't
> > > > have to bother supporting it on platforms with local memory.  Given how
> > > > much CPU touching of memory is required for relocations, not having to
> > > > do so on platforms where not all memory is directly CPU-accessible
> > > > carries significant advantages.
> > >
> > > You are not supplying them, the kernel is not checking them [as they
> > > don't exist], so there is no material benefit. The only question is
> > > maintainability.
> > >
> > > How confident are you that you will never use them and rewrite the
> > > media-driver? The code exists, will be tested, and can just as easily
> > > expire with the rest of execbuffer2.
> >
> > From an upstream POV I say hell yes, if the hw isn't generally available yet,
> > and the media-driver/intel-compute-runtime people are warned in advance,
> >
> > I'm all in on ripping it out for new GENs.
>
> There have been discussions with our media driver team about eliminating
> any relocations, but today they are still being used. They have started
> partially using soft-pinning, which is a great first step to that
> direction.
>
> The compute driver does not rely on relocations, they use soft-pinning
> everywhere and explicitly manage the address space.
>
> Be assured that I'm also in favor of eliminating relocations (just like
> execbuffer2, userptr and couple other things), just that we still need
> to have a functional stack before they can be dropped for new hardware.
>
> Like Chris mentioned, enough optimization have been put in the code so
> that there is zero impact from the relocations to the exclusively
> soft-pinning drivers. So the sole benefit would be being able to drop
> the relocations code in the future when the Gen11 hardware has gone
> exctinct and that is a worthy goal, too.
>
> But for now the feature is still needed for Gen12, so forcefully
> disabling it is untimely.
>

I'm going to ask that this be revisited for DG1.

DG1 is a discrete GPU,a brand new thing that in no way requires
relocations. If relocations are required for legacy software, that
software is being updated to add local memory support, relocations
should be removed at the same time.

The main reason for this is I believe a lot of effort is being put
into making relocations faster and better that is impacting all over
the i915 driver. instead of just fixing userspace to not require them
anymore moving forward.

I'd rather DG1 support gets upstream in a sane fashion without having
to worry about how super-optimised the relocation paths are for some
corner case userspace code that if it was part of the mesa project
would have been updated by now.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

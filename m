Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EE64D4CBC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 16:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD8010E9FE;
	Thu, 10 Mar 2022 15:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA5210E9FE;
 Thu, 10 Mar 2022 15:24:03 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id q20so3464114wmq.1;
 Thu, 10 Mar 2022 07:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NcqpZAK52YRW1B5Vb/UA7KX5wJ5gMzXmN5Ay1W8Zrx4=;
 b=CnurBbDC35UizOqzP0qHe+RufF9Q+RLZM8+/J5xfCFyVzGs+TX5PgbrjpUql0ne9kT
 uyUbmXyWq0ATMDY2GZzS7gI1hpzhc1UHKOU1VFK9HA8FbceCdep3BiRQw6z3mBDPc1DF
 URMbR38YxPNlPjvCmiAhnTEFDTG1H/4/fm6xvXKi1pGNByxB/im6h6tjP7K4GD8SOP9d
 njoBhXEvJSohEiuAU5AScXpOYBmu9mpNjy4PKUezkGLZfWkPraSS9CiAfZ3S42in8HkV
 9PSR43exfXWQIbEaM/WtX8OMDOljlsQ1xatPlNgsA8El3n+19OgSWX5l5mCCLeBlGIk3
 VMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NcqpZAK52YRW1B5Vb/UA7KX5wJ5gMzXmN5Ay1W8Zrx4=;
 b=G7EIollzOvQk06iNdD3+7kGB5E1ZXF06I0fFc0Ne53v9PAP7a2qjjiAw0gpCkbdj2r
 fV7ims+gOftEkZLRrHTv0FatqjaUgS/pH0br79Q178im/UyMShdb9s/yC9Yp/X9ysHaV
 6zkcNzExY7fR1p+1vpglshvSXyPk5hPisWyH8GKIbY1PvN5Po/IxSyyzADRWSPsbBvei
 Ifr+fWQSwFgLyEZV1TMpTWDJjQ0gTV8erlAQ2bE6bjnUiHi6gnilnTOKysNQqllNczBW
 AapHNRfO+VStgXTJsfXJ6GPipG3Rlg5dqT2epZ9MiKnTXdYuBkkzmsdovhk8EJf3eWHr
 5kaA==
X-Gm-Message-State: AOAM533BH/agxAZw2P15JVOzTCxTwhe0929dvjxVbOCHwwtpiG8b/Kbn
 7ESoh4Nqq6k+rm93u9AGWJyRNp2tn+pkxZX4Uxw=
X-Google-Smtp-Source: ABdhPJyZp/SDFgbcTePvhgh/zCCusez2Csf4BcfRvU87UtZpj10D7eMw0uyKTYP1jWKU7QXUahN0wyZ81LwCeO1g7CE=
X-Received: by 2002:a05:600c:6d7:b0:389:7336:29e6 with SMTP id
 b23-20020a05600c06d700b00389733629e6mr12206052wmn.26.1646925841711; Thu, 10
 Mar 2022 07:24:01 -0800 (PST)
MIME-Version: 1.0
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
In-Reply-To: <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 10 Mar 2022 07:24:40 -0800
Message-ID: <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 10, 2022 at 1:55 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
>
>
> Am 09.03.22 um 19:12 schrieb Rob Clark:
> > On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
> > <contactshashanksharma@gmail.com> wrote:
> >> From: Shashank Sharma <shashank.sharma@amd.com>
> >>
> >> This patch adds a new sysfs event, which will indicate
> >> the userland about a GPU reset, and can also provide
> >> some information like:
> >> - process ID of the process involved with the GPU reset
> >> - process name of the involved process
> >> - the GPU status info (using flags)
> >>
> >> This patch also introduces the first flag of the flags
> >> bitmap, which can be appended as and when required.
> > Why invent something new, rather than using the already existing devcor=
edump?
>
> Yeah, that's a really valid question.
>
> > I don't think we need (or should encourage/allow) something drm
> > specific when there is already an existing solution used by both drm
> > and non-drm drivers.  Userspace should not have to learn to support
> > yet another mechanism to do the same thing.
>
> Question is how is userspace notified about new available core dumps?

I haven't looked into it too closely, as the CrOS userspace
crash-reporter already had support for devcoredump, so it "just
worked" out of the box[1].  I believe a udev event is what triggers
the crash-reporter to go read the devcore dump out of sysfs.

BR,
-R

[1] One small change to allow-list the drm/msm devcore dumps was
needed after a privacy review/audit of what is contained in the GPU
devcored to ensure it does not contain any PII .. for CrOS on amd
devices I'd be happy to walk whoever deals with amd CrOS devices
through the process offline.

> Regards,
> Christian.
>
> >
> > BR,
> > -R
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B09B4DB500
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 16:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1768C10E6A2;
	Wed, 16 Mar 2022 15:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A5910E6A2;
 Wed, 16 Mar 2022 15:35:32 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a1so2136287wrh.10;
 Wed, 16 Mar 2022 08:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rG7jz6KiWOqjxvNzWFswkHAG9dTV+EU2glZGi4QpldQ=;
 b=TAKW1cHJ7lyZNtN4ZieQHQk4H7BS0AlHN8RaKxEbr9L2wtI2xfrvPhXYoO8MCL+HkV
 zkbeamzVpoYCVlFy2e0zcQrW5GVZ9ftxbqacJYumX4zO0iGyH5YfyooLO7KAucASd6zJ
 0D639sZxKz2Jk/cw/kGddRye5fNkyb7AtMYSqU2HIuAorb3mNsW9GgjT2ttUXQ+tx2yN
 4ABZh0tlrbeH8+sbKLYHyCBnHDdf9u+WmKjylBQZ/89h9Ic1NQe+9ZPie6hkk96ungHw
 r+m5HMSLk2fN+/rbyGezUyvqxFjDLNtqOyfbMWnYZuG7DWM4s6XVZmm5j49osOBS4V5v
 hxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rG7jz6KiWOqjxvNzWFswkHAG9dTV+EU2glZGi4QpldQ=;
 b=cNKgBjYGO99igoOYT3YsPdcIfjkPCuLgBl12A9qY0qNo5Au8Rg/x2NfwVoGVLIb+ts
 humTAbjYe8wLzhnfzb77GX3UeoP22gDholMDlOBTComTyNgObS3EjwmBZ94rZ9U5CbWT
 gDn5XHbf2KlYaMW+LDbH/na2TcaDHsD8Pp1VEVtBfTT/kon2769wxAJemDM0pmj2EgiI
 qRYE15E/ii5Zf3UBoPie1qEUTQvMkk+EO5lVBSlu9G/7mfKoxekU633lE1kEle95nXUR
 qixuYa9GQsu6AH2FV28OaoK2SBxDASVPHnZZ+EbbWkayIZM0EMQPys4WesIPGM1TIXyU
 mCFQ==
X-Gm-Message-State: AOAM530nDcoAkdFv6f+3Gw52sG7IveJIH8fd9Cp8fofR2SEM4IVTimUM
 T5Uiawe8ixsIeBPSEnNXAkEyr0gFiOGdrHk6LzM=
X-Google-Smtp-Source: ABdhPJz7KHihKSjJjguHibP04cUyErv8faNvu9+dEXTm3C8+urSU0qXx+H2CQH7na8jI1sGOK6ZS+cmV4T0Wbvn8KGE=
X-Received: by 2002:adf:914f:0:b0:1ed:bb92:d0cc with SMTP id
 j73-20020adf914f000000b001edbb92d0ccmr381369wrj.297.1647444931191; Wed, 16
 Mar 2022 08:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
 <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
 <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
 <CAF6AEGvvskobh6YOUx55_4rtXJJjPO0PxWY8+EKiVqntT3k+ug@mail.gmail.com>
 <6b400b8b-1b5c-a339-2345-f317f197b4a6@amd.com>
 <CAF6AEGt0XhqzkyEhbNcNVQO_A_Lo4qcsPRZRL6QqYn+NWAfv9A@mail.gmail.com>
 <bf6922f0-da8e-eef6-8217-26c1f50f3c48@quicinc.com>
 <2980e6a0-624e-2b80-c5d0-c40dfce76fb8@amd.com>
 <CAF6AEGvC=k4xLA-0iTSf660X2o04E+ivjnThZA-=WANKzLSvpA@mail.gmail.com>
 <cda15a47-f469-2a7e-87b6-adf00e631ef0@amd.com>
 <CAF6AEGv3Wv+p1j2B-t22eeK+8rx-qrQHCGoXeV1-XPYp2Om7zg@mail.gmail.com>
 <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <20220314172647.223658d2@eldfell>
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
 <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
In-Reply-To: <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 16 Mar 2022 08:36:13 -0700
Message-ID: <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 16, 2022 at 7:12 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Mar 16, 2022 at 4:48 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
[snip]
> > With new UAPI comes the demand of userspace proof, not hand-waving. You
> > would not be proposing this new interface if you didn't have use cases
> > in mind, even just one. You have to document what you imagine the new
> > thing to be used for, so that the appropriateness can be evaluated. If
> > the use case is deemed inappropriate for the proposed UAPI, you need to
> > find another use case to justify adding the new UAPI. If there is no
> > use for the UAPI, it shouldn't be added, right? Adding UAPI and hoping
> > someone finds use for it seems backwards to me.
>
> We do have a use case.  It's what I described originally.  There is a
> user space daemon (could be a compositor, could be something else)
> that runs and listens for GPU reset notifications.  When it receives a
> notification, it takes action and kills the guilty app and restarts
> the compositer and gathers any relevant data related to the GPU hang
> (if possible).  We can revisit this discussion once we have the whole
> implementation complete.  Other drivers seem to do similar things
> already today via different means (msm using devcoredump, i915 seems
> to have its own GPU reset notification mechanism, etc.).  It just
> seemed like there was value in having a generic drm GPU reset
> notification, but maybe not yet.

just one point of clarification.. in the msm and i915 case it is
purely for debugging and telemetry (ie. sending crash logs back to
distro for analysis if user has crash reporting enabled).. it isn't
used for triggering any action like killing app or compositor.

I would however *strongly* recommend devcoredump support in other GPU
drivers (i915's thing pre-dates devcoredump by a lot).. I've used it
to debug and fix a couple obscure issues that I was not able to
reproduce by myself.

BR,
-R

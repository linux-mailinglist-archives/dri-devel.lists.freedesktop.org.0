Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4C27F182E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 17:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E218810E087;
	Mon, 20 Nov 2023 16:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B5C10E07C;
 Mon, 20 Nov 2023 16:09:07 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1f93d0cd2ddso580215fac.1; 
 Mon, 20 Nov 2023 08:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700496546; x=1701101346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2oEbSauGOHvjZGkANky2osMy3LrJnK1DvMlgtxNIqU=;
 b=XvRW5li653GZGJJ9mHLV81wI883L19dicU5sTOiDOzg92qmN8gx1hztl6rZ+0JF6pV
 TA52cj3/bT4Lx0kf3x1huqvjMNievLgQ9XnyatPPCH2pMQfgMxrPtKZAUz+5tIwoIuEf
 Arl7m2AITysR20U0Rb2V4hhjBhDYt02d5VcUivYg4KcM0djv/PhDiiQyVZcjP575XSkG
 b3Di9QRRv/eUSFevOAOGXcZ32sQOUZqHbNJcQeF0Ey0qsDY8Te46ziOprvi5OKb+qlH9
 BpVS/caeVTGKWNw27fCqFaWOC8Ggzeivvz5wdD5HellyhUcHMwqsarOyvtWyHWqb83Ov
 UXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700496546; x=1701101346;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M2oEbSauGOHvjZGkANky2osMy3LrJnK1DvMlgtxNIqU=;
 b=rbQHgcZPfjMd3oH/dsDikzn12mblAdPQ6snoeI6HCvCZ/SiaPCg4toSpmlWHZFBc0K
 AvbxDJSrytGsHNAzcKCnJFM9NOgi422I5i2VeuGLpCpDQzSrsKb+C6JNCv45rFoy4npa
 3KNEp0vHHTVQmqluqr+Uswg7qBu8UVIJ8XAU8IQOwal0c9qOo3SjLSGWh+wnDzzSXatZ
 Q/qzYwj7VmNPNB1P0NKSPHUEufJvJbL9TZzV/s2xKB2/BJka+f8R9A91+0/xO37ugGuN
 C4q9PJxiWMZg8JGQuHaUxi4nZjLrgMmIyDLimGRoaZCnAE/htt1xiKGa/84LfXveF45U
 9nhA==
X-Gm-Message-State: AOJu0YxIybscCW35tT20+WnVZLR+VXVucW6/g/pa4WTmxZ1bF0BNYhWq
 CEsUL1FBceuZVcTnHX7JQTBn8bEnv0/NGudKufk=
X-Google-Smtp-Source: AGHT+IEvbqXG00KL7aQO3Yc9jfLXnQj4XWLXSx/JaniG8N/Ocl9GUeaAS9Sx0btCzaUWmAP3MwcAMlhcoTbsFJ35TUM=
X-Received: by 2002:a05:6870:7987:b0:1f9:34b3:7ae9 with SMTP id
 he7-20020a056870798700b001f934b37ae9mr4808940oab.17.1700496546587; Mon, 20
 Nov 2023 08:09:06 -0800 (PST)
MIME-Version: 1.0
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
In-Reply-To: <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 Nov 2023 11:08:55 -0500
Message-ID: <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Phillip Susi <phill@thesusis.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 20, 2023 at 10:57=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 19.11.23 um 07:47 schrieb Dave Airlie:
> >> On 12.11.23 01:46, Phillip Susi wrote:
> >>> I had been testing some things on a post 6.6-rc5 kernel for a week or
> >>> two and then when I pulled to a post 6.6 release kernel, I found that
> >>> system suspend was broken.  It seems that the radeon driver failed to
> >>> suspend, leaving the display dead, the wayland display server hung, a=
nd
> >>> the system still running.  I have been trying to bisect it for the la=
st
> >>> few days and have only been able to narrow it down to the following 3
> >>> commits:
> >>>
> >>> There are only 'skip'ped commits left to test.
> >>> The first bad commit could be any of:
> >>> 56e449603f0ac580700621a356d35d5716a62ce5
> >>> c07bf1636f0005f9eb7956404490672286ea59d3
> >>> b70438004a14f4d0f9890b3297cd66248728546c
> >>> We cannot bisect more!
> >> Hmm, not a single reply from the amdgpu folks. Wondering how we can
> >> encourage them to look into this.
> >>
> >> Phillip, reporting issues by mail should still work, but you might hav=
e
> >> more luck here, as that's where the amdgpu afaics prefer to track bugs=
:
> >> https://gitlab.freedesktop.org/drm/amd/-/issues
> >>
> >> When you file an issue there, please mention it here.
> >>
> >> Furthermore it might help if you could verify if 6.7-rc1 (or rc2, whic=
h
> >> comes out later today) or 6.6.2-rc1 improve things.
> > It would also be good to test if reverting any of these is possible or =
not.
>
> Well none of the commits mentioned can affect radeon in any way. Radeon
> simply doesn't use the scheduler.
>
> My suspicion is that the user is actually using amdgpu instead of
> radeon. The switch potentially occurred accidentally, for example by
> compiling amdgpu support for SI/CIK.
>
> Those amdgpu problems for older ASIC have already been worked on and
> should be fixed by now.

In this case it's a navi23 (so radeon in the marketing sense).

Alex

>
> Regards,
> Christian.
>
> >
> > File the gitlab issue and we should poke amd a but more to take a look.
> >
> > Dave.
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7285BA352FB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 01:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD0F10EBC4;
	Fri, 14 Feb 2025 00:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KhU/qJmq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC78510EB5F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:35:53 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-309191eec90so2828821fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 09:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739468152; x=1740072952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7qAMpVDOhtGjLWY8rXJglFjJtR265JZ5195CB8+cKFo=;
 b=KhU/qJmqE7cyBTgFKWrh1bH94M9+pGuAL1p7/TjlL6fxJItWLKkt0TyE5d3OKY4AdQ
 oJQUTKFsSeQ6MzHlKjg95U6sTlSB3zabJmxtGPLCcdqLDz2TCMFK0YFL+iMjpZykRxDT
 OD8MqP/vOfJCQVdq3lHIzN39E40yxCgMe3cfRtUzImATPQ48dp0bXjiO6W9vfo8A2IG5
 gFkg6AqNgrjUv2HUs8WMNwMB9nZYMxZPmgCeYVt0sIpH63PQj766vKpMh0my0dwQQKfo
 Q6I1rr21/5e1vJNkMaMdwoYxmee3yoq5Ro0lEc06/9Q3WfmAnymXDGFTZfAp8B4gFPqP
 Kq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739468152; x=1740072952;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7qAMpVDOhtGjLWY8rXJglFjJtR265JZ5195CB8+cKFo=;
 b=i9zcruW+XLUED1c2Ge+Rh9VDyPvFiPjYG1yA/rKuXYYuPTHH9aBnHlY6Co4QQoeNa+
 87rbTYCjxux5FR54dzR9Q917RPsqUaCRCQyWmqPkzJM1SANupllSp1j4jn2OeutfmOTu
 IXZygoocLPM7vrtuBJFf5EurcyDuysNmZcQXWaua1c+6Jvj7NPxO5K7/oMEVV8QSECMu
 hhxrNH60ygWukJd3lgn1wKX+ynbaTypaXqGy/g7Z14NnCD0OOdxVAUs1e+yBd9/7OJjq
 wyD+Bib7cGTD0wSfA1/kbCKpNQ8xWJ5sz8Hti7Y9zc6GqMG1hZ2uDFmfsUAtFH+4J4hR
 D/cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOEf8Q75Iekj4rxEYg3hSvEu5OwYJN+brUI9xT/gElKfz2p0BIcK+0sL32/P667nQG36U25EwH1pQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJtXL4XAkP3/znJ4LUso8h//2fbu/rOa1HTvTH38acLDhd/3Y0
 PQyfcfmgxY5cAt3JcpwtepbhREDukDOhd7kwqTiOeeuS/PmEY2KKGFLlzoMwgQuFxLFVVLWnsH3
 sp5qpG50cHdjB/UpGGGS9futEgNs=
X-Gm-Gg: ASbGnctAURuSN0v7U87CNJvN5FPVeFUrlrcKvZuc5kcF1lIex35DSuDIqom/ZhS91rn
 4mFPSB6L5MrnnKceIBjrYitVFKRzv5z9xk15566TuV0jSNPrSvcxcS100nJH2olOT4x0xL0n3Mq
 84Ebfr3V+ZiPyxzqnF8R9+MKx3517/RQ==
X-Google-Smtp-Source: AGHT+IGY0srE7wji4W9bLp26kLxH0QGCdWUi5EwnHnmRRB8roSRmEHIwTufI5RAZRQ0k86nA9jKtQdN81/gcY/A+yK8=
X-Received: by 2002:a2e:a913:0:b0:308:f6cf:3611 with SMTP id
 38308e7fff4ca-3090dd06b8cmr17279501fa.10.1739468151884; Thu, 13 Feb 2025
 09:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20250207165325.3998-1-pranav.tyagi03@gmail.com>
 <Z6bKR9K16-oYMLFl@archie.me>
 <CAH4c4jKe7Q-E1LhA0KxOxEjK-gn=JY7e=2GN13X=yutaO8k3Pw@mail.gmail.com>
In-Reply-To: <CAH4c4jKe7Q-E1LhA0KxOxEjK-gn=JY7e=2GN13X=yutaO8k3Pw@mail.gmail.com>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Thu, 13 Feb 2025 23:05:39 +0530
X-Gm-Features: AWEUYZn6qEdgw-FWu9wGm9trUEcco7CIRDetR6lShyMK3GR9NJoIyLrnadYOLAI
Message-ID: <CAH4c4j+kOYMfzO5QOBg+hGe2zt4kN4f7v+mrri-2GMLzYtCPrw@mail.gmail.com>
Subject: Re: [PATCH] vgaarbiter: documentation grammar correction
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Documentation <linux-doc@vger.kernel.org>, 
 Linux DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees@lists.linux.dev, 
 skhan@linuxfoundation.org, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 14 Feb 2025 00:33:52 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Just a gentle follow-up on this patch. It has been reviewed but hasn't
been applied yet.

Regards
Pranav Tyagi


On Thu, Feb 13, 2025 at 10:54=E2=80=AFPM Pranav Tyagi <pranav.tyagi03@gmail=
.com> wrote:
>
> Hi,
>
> Just a gentle follow-up on this patch. It has been reviewed by Bagas Sanj=
aya but hasn't been applied yet.
>
> Regards,
>
> Pranav Tyagi
>
>
> On Sat, Feb 8, 2025 at 8:36=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
>>
>> On Fri, Feb 07, 2025 at 10:23:25PM +0530, Pranav Tyagi wrote:
>> > Corrects the following grammatical issues in the VGA Arbiter documenta=
tion:
>> > - Fixes subject-verb agreement by changing "co-exists" to "co-exist"
>> > - Corrects pluralization by changing "server" to "servers"
>> > - Improves sentence structure for clarity
>> >
>>
>> +Cc: DRM folks.
>>
>> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
>> > ---
>> >  Documentation/gpu/vgaarbiter.rst | 6 +++---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaa=
rbiter.rst
>> > index bde3c0afb059..d1e953712cc2 100644
>> > --- a/Documentation/gpu/vgaarbiter.rst
>> > +++ b/Documentation/gpu/vgaarbiter.rst
>> > @@ -11,9 +11,9 @@ Section 7, Legacy Devices.
>> >
>> >  The Resource Access Control (RAC) module inside the X server [0] exis=
ted for
>> >  the legacy VGA arbitration task (besides other bus management tasks) =
when more
>> > -than one legacy device co-exists on the same machine. But the problem=
 happens
>> > +than one legacy device co-exist on the same machine. But the problem =
happens
>> >  when these devices are trying to be accessed by different userspace c=
lients
>> > -(e.g. two server in parallel). Their address assignments conflict. Mo=
reover,
>> > +(e.g. two servers in parallel). Their address assignments conflict. M=
oreover,
>> >  ideally, being a userspace application, it is not the role of the X s=
erver to
>> >  control bus resources. Therefore an arbitration scheme outside of the=
 X server
>> >  is needed to control the sharing of these resources. This document in=
troduces
>> > @@ -106,7 +106,7 @@ In-kernel interface
>> >  libpciaccess
>> >  ------------
>> >
>> > -To use the vga arbiter char device it was implemented an API inside t=
he
>> > +To use the vga arbiter char device, an API was implemented inside the
>> >  libpciaccess library. One field was added to struct pci_device (each =
device
>> >  on the system)::
>> >
>>
>> The diff looks OK.
>>
>> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>>
>> --
>> An old man doll... just what I always wanted! - Clara

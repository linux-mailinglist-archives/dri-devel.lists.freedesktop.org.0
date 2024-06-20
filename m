Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219289104F4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 15:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D743B10E997;
	Thu, 20 Jun 2024 13:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iBiDgUfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D514E10E98C;
 Thu, 20 Jun 2024 13:00:35 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-6e7e23b42c3so541712a12.1; 
 Thu, 20 Jun 2024 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718888435; x=1719493235; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vo56YfkzAdoTyNp8vVJoVwGhrq9JVENLESkm+nuUbCs=;
 b=iBiDgUfYwIGpkh8a31qsoPtwA/ATWgHSbuIMAy5Irzu7d0H8ACC4ae8CQajUrW9CAD
 us8tVPmGEweIcgqDLVfMi6tNaVfF6bN5KTovbqUD8j60UHw24FPO+1sWwqEFst4y01pJ
 NuYJ8ojeb5Twj1WxAG88QFSCGm65V+odEYTerdViXyWiaUfvdHCCzteJDehTuV6b+C1Z
 k9y8S2eZczmujpiBlGQ6A50Z6PQXVUN++S1iY4fnnXbPQ4cHpXYoty4uL75vBw2XOXjb
 JUMPP+VjyhJmHltwNdi3rOcziDucouX+i03ii8EuU4WMnf6CfRq//yaYBqkPzMN7m88S
 IqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718888435; x=1719493235;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vo56YfkzAdoTyNp8vVJoVwGhrq9JVENLESkm+nuUbCs=;
 b=B+O/UzPQ0epdojX9fZOx4qYIBksfQXxA8G1xH7KPmyelUxksVl9C0Ht9xVl/geHBZd
 A16zyaQ0CFqahQTJ13/GqXl46i9o7MMwO37nRx417zRq9Jthck4Ljs2P83YsJW47kD56
 V1mQSJg2LEb8u7utlJyeUFqfWREiMaZmj5VzelbKnZZ7eF++4Fg+DqpzTt+xe9y/rIWB
 INJicv0e0FQiryLrmWX4rQXn5GZymfLONIEN4OyjUh+2OFtgBHrN5yj+DgPCxPL1UmCk
 ljuWUsyomikBb5ZSe7lgjmSXsd84TNVw2Jv8VGzmQIwB1mpJzNkWecH1HJMMDwCwhRUc
 oWDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6aw2fKRSCaiQosJ3ALGnuV1wuP3V1jQFN+yAfcJUn0UA4345MvVVGUXdQMupSxQQ0pxDCXpsMV1XQNePZmaQxhh3tqApEvwFOWt+01N2fBD5u/eNS5kjXRVhLhGcu5SA+tBoWDp0Ybvud8NLRJQ==
X-Gm-Message-State: AOJu0YyUO4EyIXby5rD4qnTkCiqiF+ZfeOV6cfOFUAesIpIMg3DgHlYL
 6Qeq/5xSQVK94Grb/AY34kdskoX1dyyqX5xqQiL5kKH2aGu3q0+kQMvqgi9o/fUshr53wYKutHQ
 it4uJyywgTKIv6fNTygQDz5q9W70=
X-Google-Smtp-Source: AGHT+IGIdcCe6buOTlAadQ7gua8XUNjpkK1EYJm9Gvkr0f8wJye9l9wm8XtUQH2rjUK609SCLx4/hleK+RT693usL0U=
X-Received: by 2002:a17:90b:3552:b0:2c3:11fa:41f with SMTP id
 98e67ed59e1d1-2c7b5daec84mr4671563a91.45.1718888435008; Thu, 20 Jun 2024
 06:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240612222435.3188234-1-dianders@chromium.org>
 <20240612152752.v2.8.I27914059cc822b52db9bf72b4013b525b60e06fd@changeid>
 <CADnq5_PbqE0E2pP26mGD94cdc=tLZZsF10e7ZZWeC5AU-LS8vw@mail.gmail.com>
 <CAD=FV=XJAiVGFn_Tqs_JNo1fQKFys3m=hH9MwmMot93gkdg=Qw@mail.gmail.com>
 <CADnq5_M+H_h1Me_O3u=R3q52PgYcCwwY9Mr8_R1eX0G7HvBp2w@mail.gmail.com>
 <CAD=FV=X=9PV+zbmd2S-TBBxq+yQZ2D+-cCHjFX-gm-f+DyXXiQ@mail.gmail.com>
 <CADnq5_OXUKj=bfK0NOAhOzmhYCSnQXbxHbwLOaBQ6wFX033Wgw@mail.gmail.com>
 <CADnq5_O1EGj-_xx7LuiXSVY7MSmfS7_1-hqShFk6Deu1wsBwOA@mail.gmail.com>
 <20240620-puzzling-hopping-griffin-e43ba6@houat>
In-Reply-To: <20240620-puzzling-hopping-griffin-e43ba6@houat>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 Jun 2024 09:00:23 -0400
Message-ID: <CADnq5_PwE0n39hPuEfasGLrwe+rzzzisaKfwz9a9bbpR+RDgqQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Call drm_atomic_helper_shutdown() at
 shutdown time
To: Maxime Ripard <mripard@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Candice Li <candice.li@amd.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Le Ma <le.ma@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Victor Lu <victorchengchi.lu@amd.com>, amd-gfx@lists.freedesktop.org, 
 chenxuebing <chenxb_99091@126.com>, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 20, 2024 at 3:10=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi,
>
> On Wed, Jun 19, 2024 at 09:53:12AM GMT, Alex Deucher wrote:
> > On Wed, Jun 19, 2024 at 9:50=E2=80=AFAM Alex Deucher <alexdeucher@gmail=
.com> wrote:
> > >
> > > On Tue, Jun 18, 2024 at 7:53=E2=80=AFPM Doug Anderson <dianders@chrom=
ium.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Tue, Jun 18, 2024 at 3:00=E2=80=AFPM Alex Deucher <alexdeucher@g=
mail.com> wrote:
> > > > >
> > > > > On Tue, Jun 18, 2024 at 5:40=E2=80=AFPM Doug Anderson <dianders@c=
hromium.org> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > >
> > > > > > On Mon, Jun 17, 2024 at 8:01=E2=80=AFAM Alex Deucher <alexdeuch=
er@gmail.com> wrote:
> > > > > > >
> > > > > > > On Wed, Jun 12, 2024 at 6:37=E2=80=AFPM Douglas Anderson <dia=
nders@chromium.org> wrote:
> > > > > > > >
> > > > > > > > Based on grepping through the source code this driver appea=
rs to be
> > > > > > > > missing a call to drm_atomic_helper_shutdown() at system sh=
utdown
> > > > > > > > time. Among other things, this means that if a panel is in =
use that it
> > > > > > > > won't be cleanly powered off at system shutdown time.
> > > > > > > >
> > > > > > > > The fact that we should call drm_atomic_helper_shutdown() i=
n the case
> > > > > > > > of OS shutdown/restart comes straight out of the kernel doc=
 "driver
> > > > > > > > instance overview" in drm_drv.c.
> > > > > > > >
> > > > > > > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > > > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > > > Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> > > > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > > > > ---
> > > > > > > > This commit is only compile-time tested.
> > > > > > > >
> > > > > > > > ...and further, I'd say that this patch is more of a plea f=
or help
> > > > > > > > than a patch I think is actually right. I'm _fairly_ certai=
n that
> > > > > > > > drm/amdgpu needs this call at shutdown time but the logic i=
s a bit
> > > > > > > > hard for me to follow. I'd appreciate if anyone who actuall=
y knows
> > > > > > > > what this should look like could illuminate me, or perhaps =
even just
> > > > > > > > post a patch themselves!
> > > > > > >
> > > > > > > I'm not sure this patch makes sense or not.  The driver doesn=
't really
> > > > > > > do a formal tear down in its shutdown routine, it just quiesc=
es the
> > > > > > > hardware.  What are the actual requirements of the shutdown f=
unction?
> > > > > > > In the past when we did a full driver tear down in shutdown, =
it
> > > > > > > delayed the shutdown sequence and users complained.
> > > > > >
> > > > > > The "inspiration" for this patch is to handle panels properly.
> > > > > > Specifically, panels often have several power/enable signals go=
ing to
> > > > > > them and often have requirements that these signals are powered=
 off in
> > > > > > the proper order with the proper delays between them. While we =
can't
> > > > > > always do so when the system crashes / reboots in an uncontroll=
ed way,
> > > > > > panel manufacturers / HW Engineers get upset if we don't power =
things
> > > > > > off properly during an orderly shutdown/reboot. When panels are
> > > > > > powered off badly it can cause garbage on the screen and, so I'=
ve been
> > > > > > told, can even cause long term damage to the panels over time.
> > > > > >
> > > > > > In Linux, some panel drivers have tried to ensure a proper powe=
roff of
> > > > > > the panel by handling the shutdown() call themselves. However, =
this is
> > > > > > ugly and panel maintainers want panel drivers to stop doing it.=
 We
> > > > > > have removed the code doing this from most panels now [1]. Inst=
ead the
> > > > > > assumption is that the DRM modeset drivers should be calling
> > > > > > drm_atomic_helper_shutdown() which will make sure panels get an
> > > > > > orderly shutdown.
> > > > > >
> > > > > > For a lot more details, see the cover letter [2] which then con=
tains
> > > > > > links to even more discussions about the topic.
> > > > > >
> > > > > > [1] https://lore.kernel.org/r/20240605002401.2848541-1-dianders=
@chromium.org
> > > > > > [2] https://lore.kernel.org/r/20240612222435.3188234-1-dianders=
@chromium.org
> > > > >
> > > > > I don't think it's an issue.  We quiesce the hardware as if we we=
re
> > > > > about to suspend the system (e.g., S3).  For the display hardware=
 we
> > > > > call drm_atomic_helper_suspend() as part of that sequence.
> > > >
> > > > OK. It's no skin off my teeth and we can drop this patch if you're
> > > > convinced it's not needed. From the point of view of someone who ha=
s
> > > > no experience with this driver it seems weird to me that it would u=
se
> > > > drm_atomic_helper_suspend() at shutdown time instead of the documen=
ted
> > > > drm_atomic_helper_shutdown(), but if it works for everyone then I'm
> > > > not gonna complain.
> > >
> > > I think the problem is that it is not clear exactly what the
> > > expectations are around the PCI shutdown callback.  The documentation
> > > says:
> > >
> > > "Hook into reboot_notifier_list (kernel/sys.c). Intended to stop any
> > > idling DMA operations. Useful for enabling wake-on-lan (NIC) or
> > > changing the power state of a device before reboot. e.g.
> > > drivers/net/e100.c."
> >
> > Arguably, there is no requirement to even touch the display hardware
> > at all.  In theory you could just leave the display hardware as is in
> > the current state.  The system will either be rebooting or powering
> > down anyway.
>
> I think it mostly boils down to a cultural mismatch :)
>
> Doug works on panel for ARM systems, where devices need (and need to
> handle) much more resources than what's typical on a system with an AMD
> GPU.
>
> So, for the kind of hardware Doug usually deals with, we definitely need
> the shutdown hook to make sure the regulators, GPIOs, etc. supplying the
> panel are properly shutdown.
>
> And panels usually tied to AMD GPUs probably don't need any of that.

Makes sense.  I think drm_atomic_helper_suspend() is a viable
alternative if drivers want to leverage their existing suspend code.
I could write up a doc patch unless there is reason to prefer the
shutdown variant.

Alex

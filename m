Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914FD87BF2B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 15:42:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A5910E2EC;
	Thu, 14 Mar 2024 14:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fl4DsOa2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B76710E07D;
 Thu, 14 Mar 2024 14:42:19 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-29a5f100c1aso676165a91.0; 
 Thu, 14 Mar 2024 07:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710427339; x=1711032139; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Za5iucYxSXOJJRA/mt5b8AE1A6QwDe4Iqg1yMlydUGA=;
 b=Fl4DsOa2U5hqqgo2EPnMZcGqeU0bqV0M3Lml7KhzaXbpwQ1Rx2FE9hJr6e8cWZbXfZ
 /lNKy8Sb9TAeO5EDBxNQnV77W73Bj1pyJYptwcRjy+wE9YN1JNc0CpMr7j9PINgM/FnI
 5Frc4a5jGjKQjqTixU55mTJ8koLqlbXWN/9Psre+aMH0uUJ+IbPQlbq9au5D1e0SqjIt
 NVnkTyQM7YRIXzcJu6Q2zZOQiFDFt1Wn3q6xEkEjN0ICgBM79g85iIIuZeJa8Ku9BSO+
 JmpWMBaBaEB1h847jwtbR5qc/mLD430DFJ19fKuhmqouWxsbrtn0jaHcGzmfl7h2Pxae
 NA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710427339; x=1711032139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Za5iucYxSXOJJRA/mt5b8AE1A6QwDe4Iqg1yMlydUGA=;
 b=qT4+mFUiL53iLUeQcwQ7VsZ5X8LU7w3rsr/bVoNiH60iFkvRhi4c4fd/E3C6NZYG1i
 3kns3cp8PqTwQkF1czeriWMEUHK1XJB/2NBHurXy8bCZ8ZKTzQDVBzx92Ajrb4ZVslwU
 iiAafKz3H6Dee2kQUyrPDGiGpyrFrCAHBWvc64Bu9abn4LF5xSXpZ/Q2Mr/0iIgXgWb5
 NkjTj9lqyx7wJssxEXf/ct1aFQf2JlxSuE+906Aq55jjNmCSpJVXNdGTggWJHGIiW7rx
 jeC2icb+OrffKJkE+CzoKVIu1ECyqood63brkSXOq/XDHXglVzOSNxDyKoJYfZoz1TwE
 cquw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW92IGrJFMn6jwXVWomkOaRRTyBJ/E94cvyOaov+uzy4FCH5iiAesNvX/07kN+4o1GwUzKm0xcocnUMuXZSDJp5x8a/ezUxVDJGUUzI5imI0+FdP5D4XV2fSuS8JRNQmxSuTATPMFhTJwX7GbHq9Q==
X-Gm-Message-State: AOJu0Yz7iBHpJNL1F1MmOJqOGmT6GwqxDidjWOtMniJAus8/O+DMhdKL
 YkN0HFE8KM667N6CMfrHoXhs5JaXiEcSgSAMFxbvFnHTaCa1qDSGWVoxzQyk7Aq8kNXb7ye+ivW
 hbJTgh7tdPg+LC4qYoV3oidt/mys=
X-Google-Smtp-Source: AGHT+IFDsGELtULQd8kAZwzF1azSs4E+MUi/jEgN69Py3hQjMsHBAvIku8XVK6gdRADILX2kdAyXmSUegd5Y0q2kbMw=
X-Received: by 2002:a17:90b:30c6:b0:299:1777:134c with SMTP id
 hi6-20020a17090b30c600b002991777134cmr1752577pjb.33.1710427338838; Thu, 14
 Mar 2024 07:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240312124148.257067-1-sunil.khatri@amd.com>
 <CADnq5_O-cyDkNLznZpvnZtz15Mi1_rkigirG80BmYJprP_udnw@mail.gmail.com>
 <59cf081e-5924-42b5-a3f1-de8b012f09d1@amd.com>
In-Reply-To: <59cf081e-5924-42b5-a3f1-de8b012f09d1@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Mar 2024 10:42:06 -0400
Message-ID: <CADnq5_N0H75UU2aFTAkqUrdGxKPxBQUnodsH-bcpS-ZUqgUb3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: add the IP information of the soc
To: "Khatri, Sunil" <sukhatri@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Mar 14, 2024 at 1:44=E2=80=AFAM Khatri, Sunil <sukhatri@amd.com> wr=
ote:
>
>
> On 3/14/2024 1:58 AM, Alex Deucher wrote:
> > On Tue, Mar 12, 2024 at 8:41=E2=80=AFAM Sunil Khatri <sunil.khatri@amd.=
com> wrote:
> >> Add all the IP's information on a SOC to the
> >> devcoredump.
> >>
> >> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 19 +++++++++++++++++++
> >>   1 file changed, 19 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_reset.c
> >> index a0dbccad2f53..611fdb90a1fc 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> >> @@ -196,6 +196,25 @@ amdgpu_devcoredump_read(char *buffer, loff_t offs=
et, size_t count,
> >>                             coredump->reset_task_info.process_name,
> >>                             coredump->reset_task_info.pid);
> >>
> >> +       /* GPU IP's information of the SOC */
> >> +       if (coredump->adev) {
> >> +               drm_printf(&p, "\nIP Information\n");
> >> +               drm_printf(&p, "SOC Family: %d\n", coredump->adev->fam=
ily);
> >> +               drm_printf(&p, "SOC Revision id: %d\n", coredump->adev=
->rev_id);
> >> +
> >> +               for (int i =3D 0; i < coredump->adev->num_ip_blocks; i=
++) {
> >> +                       struct amdgpu_ip_block *ip =3D
> >> +                               &coredump->adev->ip_blocks[i];
> >> +                       drm_printf(&p, "IP type: %d IP name: %s\n",
> >> +                                  ip->version->type,
> >> +                                  ip->version->funcs->name);
> >> +                       drm_printf(&p, "IP version: (%d,%d,%d)\n\n",
> >> +                                  ip->version->major,
> >> +                                  ip->version->minor,
> >> +                                  ip->version->rev);
> >> +               }
> >> +       }
> > I think the IP discovery table would be more useful.  Either walk the
> > adev->ip_versions structure, or just include the IP discovery binary.
>
> I did explore the adev->ip_versions and if i just go through the array
> it doesn't give any useful information directly.
> There are no ways to find directly from adev->ip_versions below things
> until i also reparse the discovery binary again like done the discovery
> amdgpu_discovery_reg_base_init and walk through the headers of various
> ips using discovery binary.
> a. Which IP is available on soc or not.
> b. How many instances are there
> Also i again have to change back to major, minor and rev convention for
> this information to be useful. I am exploring it more if i find some
> other information i will update.
>
> adev->ip_block[] is derived from ip discovery only for each block which
> is there on the SOC, so we are not reading information which isnt
> applicable for the soc. We have name , type and version no of the IPs
> available on the soc. If you want i could add no of instances of each IP
> too if you think that's useful information here. Could you share what
> information is missing in this approach so i can include that.

I was hoping to get the actual IP versions for the IPs from IP
discovery rather than the versions from the ip_block array.  The
latter are common so you can end up with the same version used across
a wide variety of chips (e.g., all gfx10.x based chips use the same
gfx 10 IP code even if the actual IP version is different for most of
the chips).

>
> For dumping the IP discovery binary, i dont understand how that
> information would be useful directly and needs to be decoded like we are
> doing in discovery init. Please correct me if my understanding is wrong
> here.

It's probably not a high priority, I was just thinking it might be
useful to have in case there ended up being some problem related to
the IP discovery table on some boards.  E.g., we'd know that all
boards with a certain harvest config seem to align with a reported
problem.  Similar for vbios.  It's more for telemetry.  E.g., all the
boards reporting some problem have a particular powerplay config or
whatever.

Alex


> > Alex
> >
> >> +
> >>          if (coredump->ring) {
> >>                  drm_printf(&p, "\nRing timed out details\n");
> >>                  drm_printf(&p, "IP Type: %d Ring Name: %s\n",
> >> --
> >> 2.34.1
> >>

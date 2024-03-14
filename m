Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC1C87C23F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 18:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5D510FC60;
	Thu, 14 Mar 2024 17:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cv4SXlOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D612510FC5E;
 Thu, 14 Mar 2024 17:51:55 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-29bd4dfbf56so956471a91.3; 
 Thu, 14 Mar 2024 10:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710438715; x=1711043515; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=83o/z763nISRcPT8Ce4hg/uxvl1Iug2mRWFmiJSQha0=;
 b=cv4SXlORGG8ziAQdUbUX2408E8LuFVjnvsqiJvZVJ5vHyQanwPrXXwPFafLjn9MELu
 Ius5TwS/6U/gY9+Jt8ROV5QgXvX62+0SvHkhX096bVnGrfyc2UUdNEX3ISiHT0/4jLpr
 hc0O/GDNJO6wRdfSEVUZMZh2Z6SQJIr71D04Y5hpApzmJ/HuUWy6NEkqRvLarCygWp/q
 vfEtPS2dBcouz/8IVue/Sgk+IQXZJAdJVbJ9CEpRx86kkc/jjsDM/+kWdsYTzm4Ku1K1
 QIOAaZSSQ/10/a2Hl4hSaN4MrAYh8Rkn5BtOVk0/pAbLoqaeUEj7wRraS2jeZi3Vhz05
 pZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710438715; x=1711043515;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=83o/z763nISRcPT8Ce4hg/uxvl1Iug2mRWFmiJSQha0=;
 b=N3Z2WzjvbzHrujoIlTTSG5gSZrpxbgI1oiX+MlEKp9IC/dv+cX3femimfAHd20ogWX
 iqs4FyU8rg5gRdE/VtT2Lh4Mndad0cgweOS/NO95YIUW7d3cGb7j+T+XhXHLF4NWZaTR
 fu35mVn5r6cN9jNqF96GPRyvM9uab1OJOGjgrvuPsjMGn1xO7bz58rwudo5QswXp+lv2
 0Bn6c0t0aojGdsG6kPb92dXSIkVF6M1DJw21u0K3YpWe/Mp5PdkF+YcJQlbmczYJEpxG
 lDn6Eb/uIzA77nnt7saYPFLAQVRAU0TloGdD94IugDvXnJCTo0iJFekdNBTbG4973jLx
 sECA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6K7kNwcarp7aSWl03vIFWBcyoH8zZu8bCJIhtmMcX2BtSuXvMZa3XZv/JMInXXJpinHHyjg1eAIhHgjWvacnaLrstOx2hA/8k9PfHxLQGP5N9FZ1fHK4svPXnPpmxAE1pFJyKVpeEKBhd7I8yxA==
X-Gm-Message-State: AOJu0Yy/LDhrobu9KVQTFlfBrEMBHW6F+GpehpZxxsp/kdinLAff3hOb
 Ne+O+N+woHFklBjDIM7MlotiXZGzdw6DIvkKwGpLQtE5wQmfsSySbftDb7SCbeZBdt8c5fz/b8M
 yqKQtF7tHXjQWaeplsCvizc+4WfU=
X-Google-Smtp-Source: AGHT+IGME2ZBAjfwN5W4buTyp4q6UKGQ3GqH2t3Nk3YFMv7LRHDx2QR5986+nNZie6GdhVNX/cqIqgT3EyzylKiQKAk=
X-Received: by 2002:a17:90a:6c06:b0:29b:4d0b:66ab with SMTP id
 x6-20020a17090a6c0600b0029b4d0b66abmr684578pjj.33.1710438715102; Thu, 14 Mar
 2024 10:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240312124148.257067-1-sunil.khatri@amd.com>
 <CADnq5_O-cyDkNLznZpvnZtz15Mi1_rkigirG80BmYJprP_udnw@mail.gmail.com>
 <59cf081e-5924-42b5-a3f1-de8b012f09d1@amd.com>
 <CADnq5_N0H75UU2aFTAkqUrdGxKPxBQUnodsH-bcpS-ZUqgUb3A@mail.gmail.com>
 <32aad098-9392-4899-9839-1beaedcac8b8@amd.com>
In-Reply-To: <32aad098-9392-4899-9839-1beaedcac8b8@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Mar 2024 13:51:42 -0400
Message-ID: <CADnq5_NvBsbmTteDKmzi1DZHPKGfoSMjW5TFfy2x60YDxydc=g@mail.gmail.com>
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

On Thu, Mar 14, 2024 at 12:16=E2=80=AFPM Khatri, Sunil <sukhatri@amd.com> w=
rote:
>
>
> On 3/14/2024 8:12 PM, Alex Deucher wrote:
> > On Thu, Mar 14, 2024 at 1:44=E2=80=AFAM Khatri, Sunil <sukhatri@amd.com=
> wrote:
> >>
> >> On 3/14/2024 1:58 AM, Alex Deucher wrote:
> >>> On Tue, Mar 12, 2024 at 8:41=E2=80=AFAM Sunil Khatri <sunil.khatri@am=
d.com> wrote:
> >>>> Add all the IP's information on a SOC to the
> >>>> devcoredump.
> >>>>
> >>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> >>>> ---
> >>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 19 ++++++++++++++++++=
+
> >>>>    1 file changed, 19 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_reset.c
> >>>> index a0dbccad2f53..611fdb90a1fc 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> >>>> @@ -196,6 +196,25 @@ amdgpu_devcoredump_read(char *buffer, loff_t of=
fset, size_t count,
> >>>>                              coredump->reset_task_info.process_name,
> >>>>                              coredump->reset_task_info.pid);
> >>>>
> >>>> +       /* GPU IP's information of the SOC */
> >>>> +       if (coredump->adev) {
> >>>> +               drm_printf(&p, "\nIP Information\n");
> >>>> +               drm_printf(&p, "SOC Family: %d\n", coredump->adev->f=
amily);
> >>>> +               drm_printf(&p, "SOC Revision id: %d\n", coredump->ad=
ev->rev_id);
> >>>> +
> >>>> +               for (int i =3D 0; i < coredump->adev->num_ip_blocks;=
 i++) {
> >>>> +                       struct amdgpu_ip_block *ip =3D
> >>>> +                               &coredump->adev->ip_blocks[i];
> >>>> +                       drm_printf(&p, "IP type: %d IP name: %s\n",
> >>>> +                                  ip->version->type,
> >>>> +                                  ip->version->funcs->name);
> >>>> +                       drm_printf(&p, "IP version: (%d,%d,%d)\n\n",
> >>>> +                                  ip->version->major,
> >>>> +                                  ip->version->minor,
> >>>> +                                  ip->version->rev);
> >>>> +               }
> >>>> +       }
> >>> I think the IP discovery table would be more useful.  Either walk the
> >>> adev->ip_versions structure, or just include the IP discovery binary.
> >> I did explore the adev->ip_versions and if i just go through the array
> >> it doesn't give any useful information directly.
> >> There are no ways to find directly from adev->ip_versions below things
> >> until i also reparse the discovery binary again like done the discover=
y
> >> amdgpu_discovery_reg_base_init and walk through the headers of various
> >> ips using discovery binary.
> >> a. Which IP is available on soc or not.
> >> b. How many instances are there
> >> Also i again have to change back to major, minor and rev convention fo=
r
> >> this information to be useful. I am exploring it more if i find some
> >> other information i will update.
> >>
> >> adev->ip_block[] is derived from ip discovery only for each block whic=
h
> >> is there on the SOC, so we are not reading information which isnt
> >> applicable for the soc. We have name , type and version no of the IPs
> >> available on the soc. If you want i could add no of instances of each =
IP
> >> too if you think that's useful information here. Could you share what
> >> information is missing in this approach so i can include that.
> > I was hoping to get the actual IP versions for the IPs from IP
> > discovery rather than the versions from the ip_block array.  The
> > latter are common so you can end up with the same version used across
> > a wide variety of chips (e.g., all gfx10.x based chips use the same
> > gfx 10 IP code even if the actual IP version is different for most of
> > the chips).
> Got it. let me check how to get it could be done rightly.
> >
> >> For dumping the IP discovery binary, i dont understand how that
> >> information would be useful directly and needs to be decoded like we a=
re
> >> doing in discovery init. Please correct me if my understanding is wron=
g
> >> here.
> > It's probably not a high priority, I was just thinking it might be
> > useful to have in case there ended up being some problem related to
> > the IP discovery table on some boards.  E.g., we'd know that all
> > boards with a certain harvest config seem to align with a reported
> > problem.  Similar for vbios.  It's more for telemetry.  E.g., all the
> > boards reporting some problem have a particular powerplay config or
> > whatever.
> I got it.
> But two points of contention here in my understanding. The dump works
> only where there is reset and not sure if it could be used very early in
> development of not. Second point is that devcoredump is 4096
> bytes/4Kbyte of memory where we are dumping all the information. Not
> sure if that could be increased but it might not be enough if we are
> planning to dump all to it.

ah, ok.  Let's skip the IP versions in that case, we can use the
family and rev_id and external_rev_id to look up the IP versions.

Alex

>
> Another point is since we have sysfs/debugfs/info ioctl etc information
> available. We should sort out what really is helpful in debugging GPU
> hang and that's added in devcore.
>
> Regards
> Sunil
>
> >
> > Alex
> >
> >
> >>> Alex
> >>>
> >>>> +
> >>>>           if (coredump->ring) {
> >>>>                   drm_printf(&p, "\nRing timed out details\n");
> >>>>                   drm_printf(&p, "IP Type: %d Ring Name: %s\n",
> >>>> --
> >>>> 2.34.1
> >>>>

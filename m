Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9F5B1E8B5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 14:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396DB10E1E3;
	Fri,  8 Aug 2025 12:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RCkibLnV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8456410E1DD;
 Fri,  8 Aug 2025 12:56:44 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-76bf9b25cbbso115874b3a.3; 
 Fri, 08 Aug 2025 05:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754657804; x=1755262604; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MZbNINpDtNwPAODLw/p25kVPu0hlXgpqeNAl0WAMF5Y=;
 b=RCkibLnVirp9920Ed3n0mhy5kkaclv8PlHwZQm0WyCxHJWegJgPRwT1nWaGnZoMqET
 oDONKAr4KvVbWQVqkR4G3ezWNRnRKEMDzY35DPY1/sgK9DZQZKUhWc/XSo5aZhZruKD6
 1v0FHc20hxYuQSIWfNcXaXCVeZifrthvNSE4x+lvZxRK35+jdsvKt8P1N2VUussKvIst
 w14G1LA18UWSxNuhp0hFic8sxOVZHAxz3CSTQCGglhcsxmX9RzU53btY2GJMyeYihmce
 7wv89ydi2Ut5MpxCdC4XnkeyrRK5+httFmDEx2bbR1OgCsjqYIufAUp7TXcJgiLSUFMZ
 EkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754657804; x=1755262604;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MZbNINpDtNwPAODLw/p25kVPu0hlXgpqeNAl0WAMF5Y=;
 b=ix9tPs54KqmrBQsKtVfzXlTpze1WJ0p8Fyxt0BqPTQjxvUgbdiMJr8F6X2imPT9Gqt
 mcXdVm6NeXDAAHD0/vpUv8HfYxA73W70M7XsFYFAA4yiddoD4qGIFKqEjEDDFPwxBXwo
 H38DD1ZDHC5HcQVGnrKnSsjcyCN5nWEYcKXcf2a8M9684JHFDC0iV9OMFwLQE3El8j7q
 HEeoXS4+YynQHpei5tTpztSZDCOAbZB//+iNNoVEwCCJGL4ETo0G0uZB3tHEDi+4gr7t
 xYXz9fX0up0msv7jlkTPLNfip0ndH2UXB8cKuwGmYkFLQ0giZ0DDkImL3lYlHtspTjFH
 FOIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7YmIH1iTfbbqAf31mLU2XoZqwlIZ66wy1ItwGKnF2MUBI8Jgrabd0Huvi1pFjHifpqxqyxXabYWCa@lists.freedesktop.org,
 AJvYcCWHmbuqS/udrVKx3quPN899Q8CB+ce3V7hvN+W2Totrwd0lrtnY99Rn27aDr674sH0S+kUpTr/A@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yznru1zR55aIC4mOUgMKriMPKU4JDMCsC6MgCijfT9RWL6NGF0b
 erKTzmK+uHji3qPEarOkhlr28rGRtS3J10OtfW7bbiR+LHWQQMjrEe/qFaPhaFcGnRDd4rlLWOr
 MXj4wQITyLD0n2DUyvxCsw1ODGgVBFXg=
X-Gm-Gg: ASbGncsAYWQ85mG8fz6LzhlEftLaxuKLT9uVHeLO9t3t3nlZ64Q/u5hoy6VJ4ERzd4n
 0CwSdlPV8+bBHyt7Q9Rx3lfjjVkMOJa/VZpKPGeDi/b7PR/h8eo5fADYweyZRfk1ntZt52iE6zr
 YPwkq1a/rwW4NO5Rbf1kd2zysWIsJmSyp5R1B5p4hjBd2edp8Fk895Bhv0QIsukVmymNUK1qWim
 uuUZdg=
X-Google-Smtp-Source: AGHT+IFlSvcxbL5GPPyPwmiE/DsA4FgAwXz1H3jaR/ZIQGjKmn+Ihg0nha5JLpTZM0CwWNa5eQTwI/sGz45V76qqNk8=
X-Received: by 2002:a17:902:d503:b0:240:58a7:892f with SMTP id
 d9443c01a7336-242c202c051mr19191455ad.5.1754657803805; Fri, 08 Aug 2025
 05:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <66083d23-e60c-4fce-bad0-81dbb9dcebde@kernel.org>
 <0B029DD9-085A-4AD2-B3A0-4C427A1540EA@xenosoft.de>
In-Reply-To: <0B029DD9-085A-4AD2-B3A0-4C427A1540EA@xenosoft.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Aug 2025 08:56:31 -0400
X-Gm-Features: Ac12FXwadau3sWLYns3mQnQjQQDJTmPDYbqhGMIZFHY0vTvoSi_qG5LusvZotvk
Message-ID: <CADnq5_PMu0tqCaGccdL2JDZuHqSb2Q2mgo12Cba-pDAL9bAmBw@mail.gmail.com>
Subject: Re: radeon_fbdev_river_fbdev: failed to initialize framebuffer and
 setup emulation
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Mario Limonciello <superm1@kernel.org>,
 mad skateman <madskateman@gmail.com>, 
 ville.syrjala@linux.intel.com, Jeff Johnson <quic_jjohnson@quicinc.com>, 
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>,
 amd-gfx@lists.freedesktop.org, 
 Alexander Deucher <Alexander.Deucher@amd.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, bhelgaas@google.com, 
 benato.denis96@gmail.com, Yijun_Shen@dell.com, 
 David Perry <David.Perry@amd.com>, rafael@kernel.org,
 dri-devel@lists.freedesktop.org
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

On Fri, Aug 8, 2025 at 7:48=E2=80=AFAM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
>
>
> > On 08 August 2025 um 01:23 pm, Mario Limonciello <superm1@kernel.org> w=
rote:
> >
> > =EF=BB=BF
> >
> >> On 8/8/25 2:36 AM, Christian Zigotzky wrote:
> >> On 07 August 2025 at 04:21 pm, Limonciello, Mario <Mario.Limonciello@a=
md.com> wrote:
> >> Does applying
> >> https://github.com/torvalds/linux/commit/907a7a2e5bf40c6a359b2f6cc53d6=
fdca04009e0
> >> help?
> >> - - -
> >> Hello Mario,
> >> Thanks a lot for your patch.
> >> I tested it today but unfortunately it doesn=E2=80=99t solve the issue=
 with the Radeon framebuffer.
> >> I have created two kernels with and without the drm-next-2025-07-30 up=
dates [1] because of the issue with the Radeon graphics framebuffer device =
#15. [2]
> >> Download and further information: https://github.com/chzigotzky/kernel=
s/releases/tag/v6.17.0-alpha5
> >> I have tested both kernels this week and I can definitely confirm, tha=
t the issue is somewhere in the commit drm-next-2025-07-30 updates [1].
> >> The Radeon graphics framebuffer doesn't work with the kernel with the =
drm-next-2025-07-30 updates [1]. Without these updates, the framebuffer wor=
ks.
> >> I bisected yesterday. [2]
> >> There are some other user reports:
> >> - https://forum.hyperion-entertainment.com/viewtopic.php?p=3D60606#p60=
606
> >> - https://forum.hyperion-entertainment.com/viewtopic.php?p=3D60595#p60=
595
> >> They use other Radeon graphics chips.
> >> @All
> >> Please check the drm-next-2025-07-30 updates [1]
> >> Thanks,
> >> Christian
> >> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git/commit/?id=3D260f6f4fda93c8485c8037865c941b42b9cba5d2
> >> [2] https://github.com/chzigotzky/kernels/issues/15
> >
> > I think there is a mistake in your bisect, which I notice from looking =
at your other user reports.
> >
> > The original commit you identified in your bisect and thus CC'ed me cam=
e in 6.16-rc1.
> >
> > =E2=9D=AF git describe --contains 4d4c10f763d7808fbade28d83d237411603bc=
a05
> > v6.16-rc1~50^2~19^2
> >
> > There absolutely was a regression for that was raised, but this was fix=
ed in 6.16-rc3.
> >
> > =E2=9D=AF git describe --contains 907a7a2e5bf40c6a359b2f6cc53d6fdca0400=
9e0
> > v6.16-rc3~13^2~1
> >
> > Users in your forums posts talk about 6.16 final working fine.  So I th=
ink that when you bisected you ran into multiple confounding issues and rep=
licated in a similar fashion.  You should check every single bisect step to=
 see if 4d4c10f763d7808fbade28d83d237411603bca05 is applied.  If it's appli=
ed but 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0 is not applied in that step=
 you should apply 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0.
> >
> > Hopefully that will get you down to the real cause.
>
> Thanks for the hint. Unfortunately I don=E2=80=99t have more time for fig=
uring out the issue.

Does this patch help?
https://patchwork.kernel.org/project/dri-devel/patch/20250805175752.690504-=
4-imre.deak@intel.com/

Alex

>
> Two facts:
>
> - The Radeon driver can no longer be used.
> The Radeon driver is broken for us.
>
> - The issue is somewhere in the commit drm-next-2025-07-30 updates [1].
>
> I cannot provide any more due to time constraints.
>
> I've already spent time that I didn't actually have.
>
> Thanks for your help.
>
> Christian
>
>

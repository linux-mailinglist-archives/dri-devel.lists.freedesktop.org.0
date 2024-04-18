Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7548A9C6A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF32113CD0;
	Thu, 18 Apr 2024 14:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f/4aFP1J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D9F113CCA;
 Thu, 18 Apr 2024 14:16:06 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-5c66b093b86so1465551a12.0; 
 Thu, 18 Apr 2024 07:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713449766; x=1714054566; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=moo2/Q0I4e+0pVWR8KV3lFeGCDDdXA9IltM3T9wFqic=;
 b=f/4aFP1Jskl0ao65PmP6cRqzT68zpr9wHYPjYPIwCDbmHrjE1X4/C8ge5AnxebEJQk
 sK8R3oTOu2mOq2l3WRyVkdEFJdCFus72tXhr27QwDmYYKxi3TegOfhXD0bCGXBIOIk0V
 aWZ8JB2eDs0pTJZSYc9OFW9+lvIiyqxsUV3A7a+FOBUTQi+FUDLLLH1M8h8dpwwmc9ZT
 Tm4AyFubRQUvHZ7+L8zLfSgR/cemM80BrTz3t1BZYDDKW2UK9PaoPxxmdhLXAMZ6maMJ
 AzquTnj1wHpq8GCEia/ULhUQ11+1z0O5vss/tKTNIRfO2smvuMqRHYUMzEfnPepsQKxu
 ayeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713449766; x=1714054566;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=moo2/Q0I4e+0pVWR8KV3lFeGCDDdXA9IltM3T9wFqic=;
 b=XvLEECZ7l5NO1xXQ3+C/ko7EdOlwAWZXlGP9Cjb396mndnRpScU0T0la04ypJTmc28
 6xFGhi2a7uzeiuXe+/55lT40FrQfNTFP5oF2osgwDz0/gcpQxUp0is+38GfqpAPfPMB7
 xW11JKAtgZEIY2UR0yT/JyAk+GRTX8+VsYZzN1a9zdIXlXuTvGs92Ro7T2pfsskO+lb0
 o099NbWrkG2oGVJ3BbN1osqbQIZ0QvtF8dcpN5ukp5USFbBoM+pMUYHsM3/YewZ2t2Ma
 L+g3GlRDL5aijTN8WDQk3EBHXJC3cUu8L9Bji4G7CGpJsdGxBme0Dq4b6LWoHL5dxhTj
 wrPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW374CaljkpaToIQ/2NXWqoDG41bt/Nsx7X4qcgBlJOqDzxpWUKTmK8suVBdpk5oTl18sN4alWShQBZWN1Cv1xHZUY8CFXIaN90xRtXO/603CTlMJqW8+9BAht9C/12mooDLgEuV2aAYic0mkkZkA==
X-Gm-Message-State: AOJu0Yz1lS7jUq2n4nhgVM13ymHRG3bLJTphufmE8tUBB08RB/XkL9mf
 Z83s87905MeDOv+ElbeAVWN0aUiQutpBIcl7QDe06RDXcOI/PnDqIVaHS8vfakPfKB6ApAsN0TG
 cRwn6PARZQChm/hxp5ctWLxU3YvU=
X-Google-Smtp-Source: AGHT+IEdyd0JATd51DcGbv6THoQN/0K3QOYQ7h6+Uta4jclpsLKEG8cNeixgOGO2GEKCzQBJTjF5GXxvDkfsBPD0c2s=
X-Received: by 2002:a17:90b:1090:b0:2aa:c389:c9f0 with SMTP id
 gj16-20020a17090b109000b002aac389c9f0mr3770698pjb.12.1713449766156; Thu, 18
 Apr 2024 07:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240416035240.2450127-1-wangzhu9@huawei.com>
 <2024041658-imagines-unlatch-a9b6@gregkh>
 <036c3371d3a64ef8881260197ce37dbc@huawei.com>
 <CADnq5_NML_BiqQx2UmwH86d3qv57D3tFRL--dro1qA99r0Qr5w@mail.gmail.com>
 <b9ab29ad37f94dfa81da3aa88c6456c2@huawei.com>
In-Reply-To: <b9ab29ad37f94dfa81da3aa88c6456c2@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 Apr 2024 10:15:53 -0400
Message-ID: <CADnq5_PF=hynw-Fdt6JGxULXjBSCh1bM8dOgSbpeR4nAjh1pUw@mail.gmail.com>
Subject: Re: [PATCH v6.6] drm/amd/display: Wake DMCUB before executing GPINT
 commands
To: wangzhu <wangzhu9@huawei.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>, 
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>, 
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>, 
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "qingqing.zhuo@amd.com" <qingqing.zhuo@amd.com>, 
 "stylon.wang@amd.com" <stylon.wang@amd.com>,
 "Josip.Pavic@amd.com" <Josip.Pavic@amd.com>, 
 "trix@redhat.com" <trix@redhat.com>,
 "cruise.hung@amd.com" <cruise.hung@amd.com>, 
 "Eric.Yang2@amd.com" <Eric.Yang2@amd.com>, 
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>,
 "alvin.lee2@amd.com" <alvin.lee2@amd.com>, 
 "jun.lei@amd.com" <jun.lei@amd.com>,
 "austin.zheng@amd.com" <austin.zheng@amd.com>, 
 "sunglee@amd.com" <sunglee@amd.com>, "paul.hsieh@amd.com" <paul.hsieh@amd.com>,
 "hanghong.ma@amd.com" <hanghong.ma@amd.com>,
 "JinZe.Xu@amd.com" <JinZe.Xu@amd.com>, 
 "lewis.huang@amd.com" <lewis.huang@amd.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, 
 "syed.hassan@amd.com" <syed.hassan@amd.com>,
 "wayne.lin@amd.com" <wayne.lin@amd.com>, 
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>, 
 "chiahsuan.chung@amd.com" <chiahsuan.chung@amd.com>, 
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>,
 "aric.cyr@amd.com" <aric.cyr@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Wed, Apr 17, 2024 at 11:14=E2=80=AFPM wangzhu <wangzhu9@huawei.com> wrot=
e:
>
> The CVE-2023-52624 is fixed in linux-6.7 stable, while it is not fixed in=
 6.6, this commit is presented to fix it in linux-6.6 stable.

Why is there a CVE in the first place?  Is this actually an issue you
have seen?  It seems like you just picked a random patch and opened a
CVE.

Alex


>
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Alex Deucher [mailto:alexdeucher@gmail.com]
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2024=E5=B9=B44=E6=9C=8818=E6=97=A5 =
9:58
> =E6=94=B6=E4=BB=B6=E4=BA=BA: wangzhu <wangzhu9@huawei.com>
> =E6=8A=84=E9=80=81: Greg KH <gregkh@linuxfoundation.org>; harry.wentland@=
amd.com; sunpeng.li@amd.com; Rodrigo.Siqueira@amd.com; alexander.deucher@am=
d.com; christian.koenig@amd.com; airlied@linux.ie; daniel@ffwll.ch; qingqin=
g.zhuo@amd.com; stylon.wang@amd.com; Josip.Pavic@amd.com; trix@redhat.com; =
cruise.hung@amd.com; Eric.Yang2@amd.com; mario.limonciello@amd.com; alvin.l=
ee2@amd.com; jun.lei@amd.com; austin.zheng@amd.com; sunglee@amd.com; paul.h=
sieh@amd.com; hanghong.ma@amd.com; JinZe.Xu@amd.com; lewis.huang@amd.com; Z=
hengzengkai <zhengzengkai@huawei.com>; alex.hung@amd.com; syed.hassan@amd.c=
om; wayne.lin@amd.com; nicholas.kazlauskas@amd.com; chiahsuan.chung@amd.com=
; aurabindo.pillai@amd.com; aric.cyr@amd.com; amd-gfx@lists.freedesktop.org=
; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
> =E4=B8=BB=E9=A2=98: Re: [PATCH v6.6] drm/amd/display: Wake DMCUB before e=
xecuting GPINT commands
>
> On Wed, Apr 17, 2024 at 9:51=E2=80=AFPM wangzhu <wangzhu9@huawei.com> wro=
te:
> >
> > Hi Greg, thanks for your reply. Since there is no patch to fix CVE-2023=
-52624 in linux-5.10, there is a patch in the linux-6.7 branch, its commit =
is 2ef98c6d753a744e333b7e34b9cf687040fba57d ("drm/amd/display: Wake DMCUB b=
efore executing GPINT commands"). When we apply this patch to linux-5.10, t=
here are lots of conflicts, and we found there are lots of dependent patche=
s, and lots of patches are not proposed to fix the cve, they are presented =
to add new functions of the kernel.
> >
>
> Why is there a CVE?  Have you uncovered some specific issue?
>
> Alex
>
> > My commit comes from nearly 20 patches. For each patch, not all of its =
content is meant to fix the cve, so I just get the part which is helpful to=
 fix. It is why I don't present the patches one by one instead of merging t=
hem into one big patch.
> >
> >
> > -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: Greg KH [mailto:gregkh@linuxfoundation.org=
]
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2024=E5=B9=B44=E6=9C=8816=E6=97=
=A5 12:54
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: wangzhu <wangzhu9@huawei.com>
> > =E6=8A=84=E9=80=81: harry.wentland@amd.com; sunpeng.li@amd.com;
> > Rodrigo.Siqueira@amd.com; alexander.deucher@amd.com;
> > christian.koenig@amd.com; airlied@linux.ie; daniel@ffwll.ch;
> > qingqing.zhuo@amd.com; stylon.wang@amd.com; Josip.Pavic@amd.com;
> > trix@redhat.com; cruise.hung@amd.com; Eric.Yang2@amd.com;
> > mario.limonciello@amd.com; alvin.lee2@amd.com; jun.lei@amd.com;
> > austin.zheng@amd.com; sunglee@amd.com; paul.hsieh@amd.com;
> > hanghong.ma@amd.com; JinZe.Xu@amd.com; lewis.huang@amd.com;
> > Zhengzengkai <zhengzengkai@huawei.com>; alex.hung@amd.com;
> > syed.hassan@amd.com; wayne.lin@amd.com; nicholas.kazlauskas@amd.com;
> > chiahsuan.chung@amd.com; aurabindo.pillai@amd.com; aric.cyr@amd.com;
> > amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> > linux-kernel@vger.kernel.org
> > =E4=B8=BB=E9=A2=98: Re: [PATCH v6.6] drm/amd/display: Wake DMCUB before=
 executing
> > GPINT commands
> >
> > On Tue, Apr 16, 2024 at 03:52:40AM +0000, Zhu Wang wrote:
> > > From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > >
> > > stable inclusion
> > > from stable-v6.7.3
> > > commit 2ef98c6d753a744e333b7e34b9cf687040fba57d
> > > category: bugfix
> > > bugzilla: https://gitee.com/src-openeuler/kernel/issues/I9BV4C
> > > CVE: CVE-2023-52624
> > >
> > > Reference:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c
> > > om mit/?id=3D2ef98c6d753a744e333b7e34b9cf687040fba57d
> > >
> > > --------------------------------
> > >
> > > [ Upstream commit e5ffd1263dd5b44929c676171802e7b6af483f21 ]
> > >
> > > [Why]
> > > DMCUB can be in idle when we attempt to interface with the HW
> > > through the GPINT mailbox resulting in a system hang.
> > >
> > > [How]
> > > Add dc_wake_and_execute_gpint() to wrap the wake, execute, sleep
> > > sequence.
> > >
> > > If the GPINT executes successfully then DMCUB will be put back into
> > > sleep after the optional response is returned.
> > >
> > > It functions similar to the inbox command interface.
> > >
> > > Cc: Mario Limonciello <mario.limonciello@amd.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: stable@vger.kernel.org
> > > Reviewed-by: Hansen Dsouza <hansen.dsouza@amd.com>
> > > Acked-by: Wayne Lin <wayne.lin@amd.com>
> > > Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > > Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
> > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > >
> > > This commit comes from following commits:
> > >
> > >  8774029f76b9 ("drm/amd/display: Add DCN35 CLK_MGR")  65138eb72e1f
> > > ("drm/amd/display: Add DCN35 DMUB")  dc01c4b79bfe ("drm/amd/display:
> > > Update driver and IPS interop")
> > >  820c3870c491 ("drm/amd/display: Refactor DMCUB enter/exit idle
> > > interface")  2ef98c6d753a ("drm/amd/display: Wake DMCUB before
> > > executing GPINT commands")
> >
> > Why are you putting multiple commits together and not just submitting t=
he individual ones?  And what is this for?
> >
> > confused,
> >
> > greg k-h

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBB98A90E5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 03:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4BC10EDC2;
	Thu, 18 Apr 2024 01:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ceQNNBji";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC1310EDC2;
 Thu, 18 Apr 2024 01:58:34 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1e2b1cd446fso3128235ad.3; 
 Wed, 17 Apr 2024 18:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713405513; x=1714010313; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0BQbZH8V6AkArNU8C8n3UT3FZgYZm8SuVNBisdoq2hc=;
 b=ceQNNBjiSWhhjopWDlcsXj9AmRIGxcY0iReXEppOkWOKh5gy6fC2B27HQnKAPdLrkb
 ReND37ZUKmM71jiNhzjLAPHsOEDpagrkJiFdhkroRS77j50lSnejdblP/JhPJKiqnEY6
 Ka1QuBX18y9t5Hh/kMxMPNt2J4COUzGQzCEWbWyhPtAXgEsIN0DLfA5LVnSHfkbD477k
 PaL5JGNlBoXrWw9m88Z05SSQfvcLkgeXQ7VnQpRinP2eXOeqM2p0XCKNfH2qGbTUsj3o
 FDb3D8GGoZD2k+mG3emXoiJ7i18/UAiLgj5J5OEF45l0tKKqR6QFFsnVTHs4nxjIbo4n
 XQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713405513; x=1714010313;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0BQbZH8V6AkArNU8C8n3UT3FZgYZm8SuVNBisdoq2hc=;
 b=lS/2Htb6/ROnsxXzbp/5fsH0syp3hDp18fOKeO53BXNNIFdoTIf0bwgKuABHhk5bG9
 eyQowVX6Fx1xbQDTxp71sDQhKlehr8sPIFRRqFf9VuJp+NiQlEkB6AlIQwfd/lyLep2L
 A5HddgiTFNredr6XXSysCynskqKPOyJogyXzfIMudkQNQdjWpkhDrVmXUSSh3zPJqoqv
 mlgX27k/27FtwWYkXWuFXmkVWzkam+Q2rzSYRRs0lYeaiFnoJ9BAzYPR8Pl4xOs05gfm
 0ixopIZ2rtOvqxZ/i+9qdZxHcMOTLF8X0CQYt5TCEy1qAR8V7b0g+C9idc1zvG9zfhNk
 egnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/Vfm8nBkwk8/c/5G5Z4r8j/tCXk/xQVglhtSAvP8QmxuDVBr5wyHfVjqxuRUbf/nz44sKn40L9dLYx2++qeldYiW5zE3bqWA5CgLP/jnqXx63pQFiqsVntbTCFHKbgWWTqP6ZuQ+MUzktNsJ2yQ==
X-Gm-Message-State: AOJu0Yw5exMbSj2gPytSPYP8VgOZihwpFoGUudEbgNF0BuVY/xPcw5up
 YELKfGnQyNfi+uMAI5jt65ra+WAQOArYkXgVefc6TwTR33DnqcOqJwQ1hqDVwYdbPBL7ceK0+7U
 F6qVIpC3ToTGAq1xGzs0EPDaOQ70=
X-Google-Smtp-Source: AGHT+IEc8km59dil+ryu0/tDjq9YKqCypfeAJvhe0wIcQMkHNXop508QC5grarMl1sc9xlttfoS7xQUePdznnHJVMSo=
X-Received: by 2002:a17:90a:f40f:b0:2a5:d0cf:43b with SMTP id
 ch15-20020a17090af40f00b002a5d0cf043bmr1286536pjb.21.1713405513517; Wed, 17
 Apr 2024 18:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240416035240.2450127-1-wangzhu9@huawei.com>
 <2024041658-imagines-unlatch-a9b6@gregkh>
 <036c3371d3a64ef8881260197ce37dbc@huawei.com>
In-Reply-To: <036c3371d3a64ef8881260197ce37dbc@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 Apr 2024 21:58:20 -0400
Message-ID: <CADnq5_NML_BiqQx2UmwH86d3qv57D3tFRL--dro1qA99r0Qr5w@mail.gmail.com>
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
 Zhengzengkai <zhengzengkai@huawei.com>, 
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

On Wed, Apr 17, 2024 at 9:51=E2=80=AFPM wangzhu <wangzhu9@huawei.com> wrote=
:
>
> Hi Greg, thanks for your reply. Since there is no patch to fix CVE-2023-5=
2624 in linux-5.10, there is a patch in the linux-6.7 branch, its commit is=
 2ef98c6d753a744e333b7e34b9cf687040fba57d ("drm/amd/display: Wake DMCUB bef=
ore executing GPINT commands"). When we apply this patch to linux-5.10, the=
re are lots of conflicts, and we found there are lots of dependent patches,=
 and lots of patches are not proposed to fix the cve, they are presented to=
 add new functions of the kernel.
>

Why is there a CVE?  Have you uncovered some specific issue?

Alex

> My commit comes from nearly 20 patches. For each patch, not all of its co=
ntent is meant to fix the cve, so I just get the part which is helpful to f=
ix. It is why I don't present the patches one by one instead of merging the=
m into one big patch.
>
>
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Greg KH [mailto:gregkh@linuxfoundation.org]
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2024=E5=B9=B44=E6=9C=8816=E6=97=A5 =
12:54
> =E6=94=B6=E4=BB=B6=E4=BA=BA: wangzhu <wangzhu9@huawei.com>
> =E6=8A=84=E9=80=81: harry.wentland@amd.com; sunpeng.li@amd.com; Rodrigo.S=
iqueira@amd.com; alexander.deucher@amd.com; christian.koenig@amd.com; airli=
ed@linux.ie; daniel@ffwll.ch; qingqing.zhuo@amd.com; stylon.wang@amd.com; J=
osip.Pavic@amd.com; trix@redhat.com; cruise.hung@amd.com; Eric.Yang2@amd.co=
m; mario.limonciello@amd.com; alvin.lee2@amd.com; jun.lei@amd.com; austin.z=
heng@amd.com; sunglee@amd.com; paul.hsieh@amd.com; hanghong.ma@amd.com; Jin=
Ze.Xu@amd.com; lewis.huang@amd.com; Zhengzengkai <zhengzengkai@huawei.com>;=
 alex.hung@amd.com; syed.hassan@amd.com; wayne.lin@amd.com; nicholas.kazlau=
skas@amd.com; chiahsuan.chung@amd.com; aurabindo.pillai@amd.com; aric.cyr@a=
md.com; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; lin=
ux-kernel@vger.kernel.org
> =E4=B8=BB=E9=A2=98: Re: [PATCH v6.6] drm/amd/display: Wake DMCUB before e=
xecuting GPINT commands
>
> On Tue, Apr 16, 2024 at 03:52:40AM +0000, Zhu Wang wrote:
> > From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> >
> > stable inclusion
> > from stable-v6.7.3
> > commit 2ef98c6d753a744e333b7e34b9cf687040fba57d
> > category: bugfix
> > bugzilla: https://gitee.com/src-openeuler/kernel/issues/I9BV4C
> > CVE: CVE-2023-52624
> >
> > Reference:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com
> > mit/?id=3D2ef98c6d753a744e333b7e34b9cf687040fba57d
> >
> > --------------------------------
> >
> > [ Upstream commit e5ffd1263dd5b44929c676171802e7b6af483f21 ]
> >
> > [Why]
> > DMCUB can be in idle when we attempt to interface with the HW through
> > the GPINT mailbox resulting in a system hang.
> >
> > [How]
> > Add dc_wake_and_execute_gpint() to wrap the wake, execute, sleep
> > sequence.
> >
> > If the GPINT executes successfully then DMCUB will be put back into
> > sleep after the optional response is returned.
> >
> > It functions similar to the inbox command interface.
> >
> > Cc: Mario Limonciello <mario.limonciello@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Hansen Dsouza <hansen.dsouza@amd.com>
> > Acked-by: Wayne Lin <wayne.lin@amd.com>
> > Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > This commit comes from following commits:
> >
> >  8774029f76b9 ("drm/amd/display: Add DCN35 CLK_MGR")  65138eb72e1f
> > ("drm/amd/display: Add DCN35 DMUB")  dc01c4b79bfe ("drm/amd/display:
> > Update driver and IPS interop")
> >  820c3870c491 ("drm/amd/display: Refactor DMCUB enter/exit idle
> > interface")  2ef98c6d753a ("drm/amd/display: Wake DMCUB before
> > executing GPINT commands")
>
> Why are you putting multiple commits together and not just submitting the=
 individual ones?  And what is this for?
>
> confused,
>
> greg k-h

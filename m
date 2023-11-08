Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0A17E5DC4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 20:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F8E10E81C;
	Wed,  8 Nov 2023 19:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6706710E827;
 Wed,  8 Nov 2023 19:00:32 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1ef36a04931so4162127fac.2; 
 Wed, 08 Nov 2023 11:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699470031; x=1700074831; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=otxnVkd8YgWVTzG3H7cvr+93qyokKFzdStJbXRE7UUc=;
 b=IfOxWUJAPjvX0Hp1jtRJQNEa2l+sDjS65S7p67ujgAB+VpW6J5LPZL/Ddy2SovRvC0
 zf83P1B9MQTRw3ioh/MfLXvkZPIFNqvDZWYhAIjfbFCPV0ebIJ7ImhCA41VK3lIPt7tZ
 ln9YLoaGBlQljX3nGNVjgQ8rtCR3UkuWVHKOP2fD7mryK8MHJ0bbcyLYLS113mcvRn6Y
 SS1GQ5PcGfnOVJVLS4vYZ5kTsJwvV/J1hSV4mX+kOBLUq7Vxjxl8Y+JDnfzdRmvnCbLY
 qaWywVurvFnEf4utpMtjsXcpgBXUjT6CCHDv1Ot/JmMo4gK75x5tEH9dD56J23Wdjgrk
 x30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699470031; x=1700074831;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=otxnVkd8YgWVTzG3H7cvr+93qyokKFzdStJbXRE7UUc=;
 b=F+cqD+uVahEub/8j3r3C7Ib47pGnRKth/iH5cPSZ8nOXYdi31C4DQsL3ngHJXKku6l
 C1jYf+x0Uu0d95hIuk6ZhIQUhfqVtMuFYtfBswn4UWKE6hGyGSgLTghl2sxrynxkZ4ti
 rLWChTgXeVqmIMb5A/jlQ9kixiWLVJPL7F+OkW+lqLmnttuU69+ywO33XJij4i9TOsyE
 4W2bZU5gke0oVRu5Y/ujT26+mRekmJt6CF5wM8evMPuLixylFkoSikAYKJYKLNiex8gl
 ikGYRgtdm0N0/junz6QFBXcm/kcEaIbLlje+ysuhZrO9S9ZXHsCrVWkO6/u0ZHJvoZHB
 ORwA==
X-Gm-Message-State: AOJu0Yx059FSBFwSYt+cv/MJ5dJoRd5Cvd7IgeR48PvMs7ewWcl15MZ0
 DkUb3JbZvCx0CMdz0fLysnH9E96n7wBekhyDyyM=
X-Google-Smtp-Source: AGHT+IHvpi3a4SBVR+ik6OpPcUARXpDbAmpBYewfy5UA+w+qqJFFTZ6OeD4JVSJcj/4uYdeGrClnwBQQdXADX431yUk=
X-Received: by 2002:a05:6870:470b:b0:1e9:d158:2465 with SMTP id
 b11-20020a056870470b00b001e9d1582465mr3028814oaq.17.1699470031642; Wed, 08
 Nov 2023 11:00:31 -0800 (PST)
MIME-Version: 1.0
References: <20231029093926.137766-1-jose.pekkarinen@foxhound.fi>
 <d56cd927-49fc-cb4e-8abd-abc539e4d276@amd.com>
 <e095fae915d44ccc186d5e5ee74ec119@foxhound.fi>
In-Reply-To: <e095fae915d44ccc186d5e5ee74ec119@foxhound.fi>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Nov 2023 14:00:19 -0500
Message-ID: <CADnq5_NjUnC_nsaDCgma8u=eBKv4qMb1L214QEY9S75tA=2vTA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove duplicated argument
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
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
Cc: sunpeng.li@amd.com, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 Zhongwei.Zhang@amd.com, alex.hung@amd.com,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 sunran001@208suo.com, skhan@linuxfoundation.org, alexander.deucher@amd.com,
 Jun.Lei@amd.com, linux-kernel-mentees@lists.linuxfoundation.org,
 Yao.Wang1@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Nov 8, 2023 at 3:52=E2=80=AFAM Jos=C3=A9 Pekkarinen
<jose.pekkarinen@foxhound.fi> wrote:
>
> On 2023-10-30 15:54, Aurabindo Pillai wrote:
> > On 10/29/2023 5:39 AM, Jos=C3=A9 Pekkarinen wrote:
> >> Spotted by coccicheck, there is a redundant check for
> >> v->SourcePixelFormat[k] !=3D dm_444_16. This patch will
> >> remove it. The corresponding output follows.
> >>
> >> drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c:5130:86=
-122:
> >> duplicated argument to && or ||
> >>
> >> Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@foxhound.fi>
> >> ---
> >>   drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c | 2
> >> +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git
> >> a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> >> b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> >> index ad741a723c0e..3686f1e7de3a 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> >> @@ -5128,7 +5128,7 @@ void
> >> dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib
> >> *mode_l
> >>                      ViewportExceedsSurface =3D true;
> >>              if (v->SourcePixelFormat[k] !=3D dm_444_64 &&
> >> v->SourcePixelFormat[k] !=3D dm_444_32 && v->SourcePixelFormat[k] !=3D
> >> dm_444_16
> >> -                            && v->SourcePixelFormat[k] !=3D dm_444_16=
 &&
> >> v->SourcePixelFormat[k] !=3D dm_444_8 && v->SourcePixelFormat[k] !=3D
> >> dm_rgbe) {
> >> +                            && v->SourcePixelFormat[k] !=3D dm_444_8 =
&& v->SourcePixelFormat[k]
> >> !=3D dm_rgbe) {
> >>                      if (v->ViewportWidthChroma[k] > v->SurfaceWidthC[=
k] ||
> >> v->ViewportHeightChroma[k] > v->SurfaceHeightC[k]) {
> >>                              ViewportExceedsSurface =3D true;
> >>                      }
> >
> > Thanks for catching.
> >
> > Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
>
>      Sorry to bring this up, I just wanted to check whether this
> has been applied in the following pulls or not.
>
>      Thanks!
>
>      Jos=C3=A9.

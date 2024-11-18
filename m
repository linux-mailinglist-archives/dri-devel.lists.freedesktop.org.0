Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4BF9D16D5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 18:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F3410E53B;
	Mon, 18 Nov 2024 17:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KMhVrO1z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B0D10E533;
 Mon, 18 Nov 2024 17:12:55 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2e9ed2dbfc8so564486a91.1; 
 Mon, 18 Nov 2024 09:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731949975; x=1732554775; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qk5H560rK5BsovvCCaxfw+KXgoD6fruFx09my3hn7vM=;
 b=KMhVrO1zzAoI3NyXAMzlwgnAuSAHaQC8YD07E4g9xHAI69nmN40hJfhfJboSrZ5W7X
 FsnIjBaTrFPDes5Omea9VfV6WlCnwb11jjcA2Z8UQaOsQozNeJ7rGsqzLGelSVFdn0Z/
 4U0Bn6+6XmmfpHoRrR3X8cz2xjG0aYplXhnxSm2TonXJHWJHHsF1XWS62BrdrQvPPDcP
 V67ccOwVHU3JncaVsl4zvYLYke7aYCXIHKbi2kBxDcvVfpQwp5LHZ8bHWH8kOJ7ke7sL
 pb7QNeNxVrctDsuFwcH+m0TUph4S/FSXpLfdWpeK/PuhX0jk+1EgZJVepX/EHmpeFtF2
 3lRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731949975; x=1732554775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qk5H560rK5BsovvCCaxfw+KXgoD6fruFx09my3hn7vM=;
 b=wFURS2u8nfAFD7QvEWvCAheXSHAzLzDWqncUKYrdX69BJGL2SXlny/faDC17g+g2ZV
 19XjZsevVbG4SD5yHSjvDKhwFJ2EVBIVFRbgDSxDpV+FlvJIS9pxcc1bXV4ULfOw7YMR
 9zCVQGp9EXY/KT8N3ibctm47PqH76I1hk248zE+o6oghY0ShCyHBDuklkGHg44pMxCK+
 zPwWCUDcN5JUlGR4Cnw909oIAMsGFeRnszmXF5Xe60Hwz+GBANKoofHZAJl3Zx1kF10r
 yCaOhApFK45AuE9sru2+fGH0i7jW/FWNVm1PufUp0Mh36dr9ddx7oCzYnjjhHwMj2nWf
 qiNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNJ5QQrEOX0ALm8C9OmBx9tAzdzjaPlUOrQhVUMvIn6DftXe47KlMkyt2ZSyX+/9g4J2RiT9Z7qP34@lists.freedesktop.org,
 AJvYcCVafyAw+not4sd0Wfms8WDK8N0MPZQANxdCLIVDWOWu9o20Ofs8APj/xHN1fRlIGznyjGnJ1MOd@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtHmA6g+EEs4d039Eh9eQa2G6qWLnDn6vB2xqf2oe0Yo/5zvVr
 7BBBqNdSaCwETGSB03ww3e85n2QTDqI9+hV9d9/m1QhyrZYuvY2gPEgRGAXx3utK4cFBr6fgVvb
 3+lhnjANGojO3NiR4bAzK86SCk2c=
X-Google-Smtp-Source: AGHT+IE6ngmFy7UPofNmRPhlwfyCxeZpvlmctz0UEvXL1nDdiPQr/jXLKOSqhpC+kaiXPnpU5HFHzkX9E93hubbTWBo=
X-Received: by 2002:a17:90b:2701:b0:2ea:2906:a6f6 with SMTP id
 98e67ed59e1d1-2ea2906a9bcmr5125705a91.1.1731949975016; Mon, 18 Nov 2024
 09:12:55 -0800 (PST)
MIME-Version: 1.0
References: <20241105140137.2465572-1-quzicheng@huawei.com>
 <20241105140137.2465572-3-quzicheng@huawei.com>
 <93788edc-541e-4f7e-afe1-02a2526be684@amd.com>
In-Reply-To: <93788edc-541e-4f7e-afe1-02a2526be684@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Nov 2024 12:12:42 -0500
Message-ID: <CADnq5_OC=m2A6RrsoFAKDF5Ntonsq9cXHie9vQF3TttQzrG80w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/display: Fix null check for
 pipe_ctx->plane_state in hwss_setup_dpp
To: "Chung, ChiaHsuan (Tom)" <chiahsuan.chung@amd.com>
Cc: Zicheng Qu <quzicheng@huawei.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, 
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com, 
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch, Dillon.Varone@amd.com, 
 Alvin.Lee2@amd.com, nicholas.kazlauskas@amd.com, alex.hung@amd.com, 
 aurabindo.pillai@amd.com, relja.vojvodic@amd.com, wenjing.liu@amd.com, 
 george.shen@amd.com, mwen@igalia.com, yi-lchen@amd.com, martin.leung@amd.com, 
 srinivasan.shanmugam@amd.com, stylon.wang@amd.com, jun.lei@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, tanghui20@huawei.com, zhangqiao22@huawei.com, 
 judy.chenhui@huawei.com
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

Applied both.

Thanks!

Alex

On Thu, Nov 14, 2024 at 3:29=E2=80=AFAM Chung, ChiaHsuan (Tom)
<chiahsuan.chung@amd.com> wrote:
>
> Reviewed-by: Tom Chung <chiahsuan.chung@amd.com>
>
> On 11/5/2024 10:01 PM, Zicheng Qu wrote:
> > This commit addresses a null pointer dereference issue in
> > hwss_setup_dpp(). The issue could occur when pipe_ctx->plane_state is
> > null. The fix adds a check to ensure `pipe_ctx->plane_state` is not nul=
l
> > before accessing. This prevents a null pointer dereference.
> >
> > Fixes: 0baae6246307 ("drm/amd/display: Refactor fast update to use new =
HWSS build sequence")
> > Signed-off-by: Zicheng Qu <quzicheng@huawei.com>
> > ---
> >   drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/dr=
ivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> > index 7ee2be8f82c4..bb766c2a7417 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> > @@ -881,6 +881,9 @@ void hwss_setup_dpp(union block_sequence_params *pa=
rams)
> >       struct dpp *dpp =3D pipe_ctx->plane_res.dpp;
> >       struct dc_plane_state *plane_state =3D pipe_ctx->plane_state;
> >
> > +     if (!plane_state)
> > +             return;
> > +
> >       if (dpp && dpp->funcs->dpp_setup) {
> >               // program the input csc
> >               dpp->funcs->dpp_setup(dpp,

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55504A3C90F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 20:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE95D10E4A2;
	Wed, 19 Feb 2025 19:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aap2AHju";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E7E10E4A2;
 Wed, 19 Feb 2025 19:49:22 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2fa8c788c74so39524a91.2; 
 Wed, 19 Feb 2025 11:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739994562; x=1740599362; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k1ko0K0VPns/1ufKOAk4rGj58/AaNo29DGGtkB+ahbw=;
 b=aap2AHjuT6uMpRYMG0fImstFVgfP/t9ArhUr9uwXeeeYujTYmt3KNZVQMpC7kksbfN
 LL4thtSBVV4zr06wvuWDWzjRvFgPBfSss1c0/AJiYkMLp3gp13EOSXVykGzlPqLZx9oV
 EPfkY9amTbWoFFfpg1Ef1MbztrWdU08rlOp5hJGzwxOmuKMRHRoGTxzGyPSptJyuYNo+
 uckN0fInQ57+RPVC89iPCJTbiMZdcarmD9AdvPvnF5qSKiagBuLt3HEcBUpbbrzWLCkj
 +rFZVapU+hut2+4QRMt5Pb5NIe5quUM3PFF2Ja3Np44vgS8FMwW5nosgCNkgPg86Zwh6
 4SHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739994562; x=1740599362;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k1ko0K0VPns/1ufKOAk4rGj58/AaNo29DGGtkB+ahbw=;
 b=Ve9dp0xDRpadJ+jWIOxb8/PIIq6MRTbMn+uykyrx9ixAFTwD/wy5nzGdbdphoP14hG
 JqbC97a7DOJWZvTF4j6dTulhg4pgDQTYS2PNgWqOK3V5Sw6rGRT9hlWfUjVPSIV5eFEv
 v+WxGy4rCH7DcJ7RIG6To/7YbTPz0olYF3VQp3sFH84PxRLXi/ShRtM0I6uuhpmqotvh
 BXyx1t7ly4SEabq9EiBS0B+5AoO0Z3VKLwty+a/2EXE3zoV6PTDfv7cezss/G8T1jgJi
 REFOACEywCGJk6VBhdCQG//u1j7L2ptD9FVnJ/2Gt8g5nQ704g269JfVJpbVKbkNIInJ
 bBGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6qMQCn2hPeMK6bv42z5qlOPb6FApV5S7562TGrdzE+A+a3GLhdswzVN4Js6gMWNhUEb2REs3hYQai@lists.freedesktop.org,
 AJvYcCXQiiWhJSSV3xQ75l0yu9GDRJimBQnWkqZKLt7jf0is9TaA1uNvjf1vEQXTdILOMwIXe0MFlejl@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+FgK7AbY9EmXO90Ud9gfjIXVWi/5fpC3rd1sJcXP5OpTr4mnh
 rj2Hb5qhsepCZWrWIl/XVnATHxnytuVBY0ZEOEtrSaZotZcjRqVdayGEWZ3oP8dlLV/UXDJfLtp
 zwc0mqq+V2yrhQEIoGS5PRbH/YEI=
X-Gm-Gg: ASbGncumqnTVOh2z07tP44ONt2ndKQgftCq+bvfmxCFJEb6sc43fieyaOjr3pX1Hd16
 M82Xz6XoZfCUC4IrGsu0zt5S0JxTwMVChTcK6Lx5/ksjNSkoSH9MVAE5CXcejpDdOXubsRXnB
X-Google-Smtp-Source: AGHT+IEXEswCU21IclzIqq8mn21mAzvoAwR5lDtLJnj3Ej+0CAuf35Wo7tg86K+SrwhvFhJRfg3O97rz5blqzCgBsSY=
X-Received: by 2002:a17:90b:3504:b0:2fc:f63:4b6a with SMTP id
 98e67ed59e1d1-2fc4078f0a1mr11700294a91.0.1739994562272; Wed, 19 Feb 2025
 11:49:22 -0800 (PST)
MIME-Version: 1.0
References: <Z7YomFgEdOZzIyun@gallifrey>
In-Reply-To: <Z7YomFgEdOZzIyun@gallifrey>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 Feb 2025 14:49:10 -0500
X-Gm-Features: AWEUYZliLQF8PlcHo6YBjl-yI8D0guWHgq-i8iUHAPM_9o6kIqmwAaDdPk6Y6wE
Message-ID: <CADnq5_NpxZLJxvP0dWwT_9MbyLUvuTSWHTt7j=cgqeQUsPiDwA@mail.gmail.com>
Subject: Re: missing wire up of nbif_v6_3_1_sriov_funcs ?
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: alexander.deucher@amd.com, Hawking.Zhang@amd.com, Likun.Gao@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Wed, Feb 19, 2025 at 2:04=E2=80=AFPM Dr. David Alan Gilbert
<linux@treblig.org> wrote:
>
> Hi All,
>   I think you may be misisng some wiring of nbif_v6_3_1_sriov_funcs.
>
>   My scripts noticed 'nbif_v6_3_1_sriov_funcs' was unused;
> It was added in:
>   Commit: 894c6d3522d1 ("drm/amdgpu: Add nbif v6_3_1 ip block support")
>
>
> and is:
> drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c:
>   const struct amdgpu_nbio_funcs nbif_v6_3_1_sriov_funcs =3D {
>
> but, it's not referenced, which makes me think it perhaps
> should be in:
> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>
> I see for 4.3.x there is:
>   case IP_VERSION(4, 3, 0):
>   case IP_VERSION(4, 3, 1):
>     if (amdgpu_sriov_vf(adev))
>       adev->nbio.funcs =3D &nbio_v4_3_sriov_funcs;
>     else
>       adev->nbio.funcs =3D &nbio_v4_3_funcs;
>     adev->nbio.hdp_flush_reg =3D &nbio_v4_3_hdp_flush_reg;
>     break;
>
> but for 6.3.1 we have:
>
>   case IP_VERSION(6, 3, 1):
>     adev->nbio.funcs =3D &nbif_v6_3_1_funcs;
>     adev->nbio.hdp_flush_reg =3D &nbif_v6_3_1_hdp_flush_reg;
>     break;
>
>
> so is that supposed to have something similar?

They can be dropped.  I think they were just copy and paste leftovers.

Alex

>
> Dave
>
> --
>  -----Open up your eyes, open up your mind, open up your code -------
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/

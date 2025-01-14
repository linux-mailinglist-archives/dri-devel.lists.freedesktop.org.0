Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15F3A10941
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F1A10E359;
	Tue, 14 Jan 2025 14:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nLJnpNDp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879B710E151;
 Tue, 14 Jan 2025 14:28:11 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2f2f5e91393so1177563a91.0; 
 Tue, 14 Jan 2025 06:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736864891; x=1737469691; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CG/xNl2Z4epFXNaU8D9vC9qN5aFhxLo8PdyZZURJRhY=;
 b=nLJnpNDp4ZMZ8m3lV/XGBnjNcF4OUPAw/1Nm8IyTiSYdApAnvcao0uhjIOYdvMghmj
 nU7kzFL9ZCfUms0eWBFkJs9C96M4a7vWyPcYdB4qH2+zafEnj5n1VGGpscMXDmewDTY4
 KlP/Lx6tHOza986rk9w53f4H+JcQct0tRRix+1LoP2edBdl6C1GXwRkNj64sX1luHkP/
 /pxh0O1/pIMXqm7fvG9KD8miSfybRDKqeiHeykYN7rKYReOyyuUyPmZ6EYD9i84LjOVS
 AG9WBPxF0jU7DkL+Z9o/FMDQxdX80EZZPfo8LgQnBTjdz7Mz/X5GSCUuWrkkX3+tgbDr
 ridQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736864891; x=1737469691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CG/xNl2Z4epFXNaU8D9vC9qN5aFhxLo8PdyZZURJRhY=;
 b=YThIB0qebq7/Fmx1w6uacstqsKxxvkgNu+43ccSQohIiZADAV2p7Vjk+mHUV0PjkwW
 BlNKACCcUatbwRA+iShz73AlsMnMQqTmPbqnTlf01aPPOk/tab/fwsD6jCoIQUAt4fw6
 c+w55v5fuycXskLcr56gltgspEeae0qYZntvK2dMhXDV8yn1ZN6FLdBb9mXGZQKI1MD/
 8zesc/qsBmygi7lfvF+nAmbmZYJ89pjaCbtcLCBb7ILeCgWFzJ3RoTAHXog66IDT3WrB
 dvwQFiwyHHdIokF2f5XbdElOd4kmsRJFIr4APy299ngTq/rimCH7IW/0NchHKQTfpxzW
 5N/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpwF+roLFmL+UAUXLnuXCmIdeK/9vMCao5D2+ygkQK7GRzEn4zIT/fRTCVGtblyD/L5Y/YcmJb@lists.freedesktop.org,
 AJvYcCXxz2d+QeAgWeAYD2zJhkY2ITN8Ygd5tmdZCQBe0Gz4y2xeVXHBNlUa6yRPkF37tjxXRXI7jhHLQAXe@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9CGxYwzGjzhNGsr3mftQhO360VdxDlSdXCHOi7MyeZislBtxL
 HUrNnDLW8mq5rageMB4NpnohBPEpDKcb+P6526/26/0T9ChZC29AEH1OGrKTa3w5EW4WGrhIoIt
 xqlTR3MFNIbJxuG1FDQEj9ExB+tQ=
X-Gm-Gg: ASbGncvLuFTNthgOODUn4m0RSPWoj3TgTOtEUltimr3ZGIh15QbcFdNKVyO503qswYI
 /Mr3tmaMC02O3ihzBL2VEONpCJQvFID2moL8FJw==
X-Google-Smtp-Source: AGHT+IGK+wHrTTbYov1lCaHhsKfIqhkDYrJCTh0/tpbQJZ8ZCuajlKt2a5miu35VbOkdceWOJ1KmqTXuVEpdzbAqZ/A=
X-Received: by 2002:a17:90a:da88:b0:2ee:f440:bb93 with SMTP id
 98e67ed59e1d1-2f548f2449fmr12900899a91.4.1736864890933; Tue, 14 Jan 2025
 06:28:10 -0800 (PST)
MIME-Version: 1.0
References: <20241217225811.2437150-2-mtodorovac69@gmail.com>
 <173685063900.121209.12260311689704122686.b4-ty@kernel.org>
In-Reply-To: <173685063900.121209.12260311689704122686.b4-ty@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Jan 2025 09:27:59 -0500
X-Gm-Features: AbW1kvZRoI9rzQB480vAVsFweEq2xRErf6W7c3Ns6vjuZnxILg2Nh15Mx5uaQeA
Message-ID: <CADnq5_PDSe3U=LWF_dBA=iSvX+4Cv3t66ELiNi=s3uh2W_q9Ww@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/admgpu: replace kmalloc() and memcpy() with
 kmemdup()
To: Carlos Maiolino <cem@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mirsad Todorovac <mtodorovac69@gmail.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Zhigang Luo <Zhigang.Luo@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Vignesh Chander <Vignesh.Chander@amd.com>,
 Danijel Slivka <danijel.slivka@amd.com>
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

On Tue, Jan 14, 2025 at 5:37=E2=80=AFAM Carlos Maiolino <cem@kernel.org> wr=
ote:
>
> On Tue, 17 Dec 2024 23:58:10 +0100, Mirsad Todorovac wrote:
> > The static analyser tool gave the following advice:
> >
> > ./drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1266:7-14: WARNING opportuni=
ty for kmemdup
> >
> >  =E2=86=92 1266         tmp =3D kmalloc(used_size, GFP_KERNEL);
> >    1267         if (!tmp)
> >    1268                 return -ENOMEM;
> >    1269
> >  =E2=86=92 1270         memcpy(tmp, &host_telemetry->body.error_count, =
used_size);
> >
> > [...]
>
> Applied to for-next, thanks!

FWIW, I already picked up the amdgpu patch for drm-next on Dec 18th.

Alex

>
> [1/3] drm/admgpu: replace kmalloc() and memcpy() with kmemdup()
>       (no commit info)
> [2/3] xfs/libxfs: replace kmalloc() and memcpy() with kmemdup()
>       commit: 9d9b72472631262b35157f1a650f066c0e11c2bb
> [3/3] btrfs: replace kmalloc() and memcpy() with kmemdup()
>       (no commit info)
>
> Best regards,
> --
> Carlos Maiolino <cem@kernel.org>
>

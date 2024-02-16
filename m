Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621C28582CF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 17:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8292C10EC31;
	Fri, 16 Feb 2024 16:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iHNw6f/0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86D310EC31;
 Fri, 16 Feb 2024 16:42:03 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-5dc20645871so1501255a12.1; 
 Fri, 16 Feb 2024 08:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708101723; x=1708706523; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5EMPafwLeq7MLqsVb1yw1pk0iPW8a/wDMfuJKhuYK68=;
 b=iHNw6f/0qnryrGLgP1SSp8kWwLTBdo3DzhoHBXJC1OAMzCZQZHNfwjR3tkStXBO+02
 TVmsSpSflsVoPraqkl9N3sQResN1MzOViVcf/13jZqLiEB0NKKEN3q/nfSyvhBUpBaYv
 rDYrc6Kx6GGWoUztSHsDCi5aaBHKCMHM7gEVWn66GF3f3JOAfyIkH6gdLNgVyjBtgniT
 9Bz6hGb5F3WeVz22yp8FnnkA1x+V/bUtH2zeRYJwQZ+Bg3nTNl5YUGF3DrK5upAPfOtJ
 IajaCwYPEKlnxF4+JBiX+sjH/O7Uyki9Yak5JeRh812WQH4YGDBdW+GuB7hR+XYIn7Lc
 QsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708101723; x=1708706523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5EMPafwLeq7MLqsVb1yw1pk0iPW8a/wDMfuJKhuYK68=;
 b=GIoJD5tYUehKgXkbRhufhdvjzot8njV4ORlTlhMR0ANJ8LfUc0/b14Gmvy23AHtd/Q
 oUjvEn4cZfYlyeIxm82Wc2pceyDw1xxBm85ucjZMWXqBFPmXCfG8rG4+h7OCgCVZnTLr
 onXxZwW9hhaRw2hNCMQUh+LuJ3DY9Css61pasRFnYDsR/W8JGqwmvAMJ9y1LdV8CPLxQ
 9TR5MUnfFR7TrHIQ5qduer+T1ayibJTgBnV1rOg01iSO9rAsguD2zOEWr4SWDuxgAIUc
 TkuY69Lx022yZmDubHLrrFbTIljZx1W+WhU0ur6zlzSxuvip//3DkBGfGk3EzohpBCGF
 ItrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjsayiIbwZNi3OkQrfxXshOoi+Wxzsb2ujfP1WfTcOy1FIBeQgoBeSVaS2zNSi31SQw/8SQdP2EBgUQzsgu5PXQQJJeFO/HgyPwIekpNTlwJvY8g4U3rxLLuOav0mzbO3i+/0zcJ4teOmSLdmR1Q==
X-Gm-Message-State: AOJu0YxmBxkGvFqbEcxoDqW9y7IDDQ9LFbOzC+U9E5IFjvAxImdMnMMO
 4o4WW9xtRVIRQDiM6eyZZdo7p6uxMYNUigD/63WGMgfaIax433+jYfFqxL+R2I7loF9d3Ter28d
 bIElyaqzDCkADleoaMXmImO/7Ycg=
X-Google-Smtp-Source: AGHT+IGRPzDc3QxFYqOR5Y9w47n2OGHklvOvGfX/0AMDI+/gqNwj6exnZjySb5lMxEb9AfRp3gBQ0K/wYsfTsTxAMIQ=
X-Received: by 2002:a17:90a:8b88:b0:296:edc5:fa44 with SMTP id
 z8-20020a17090a8b8800b00296edc5fa44mr11859447pjn.21.1708101723342; Fri, 16
 Feb 2024 08:42:03 -0800 (PST)
MIME-Version: 1.0
References: <20240213005050.4442-1-W_Armin@gmx.de>
In-Reply-To: <20240213005050.4442-1-W_Armin@gmx.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Feb 2024 11:41:50 -0500
Message-ID: <CADnq5_OYE8g77YOQvN=TKQJtT_JvCDCbWxejW05VsgyqTSHetA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix memory leak in dm_sw_fini()
To: Armin Wolf <W_Armin@gmx.de>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
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

Applied.  Thanks!

On Mon, Feb 12, 2024 at 8:08=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> After destroying dmub_srv, the memory associated with it is
> not freed, causing a memory leak:
>
> unreferenced object 0xffff896302b45800 (size 1024):
>   comm "(udev-worker)", pid 222, jiffies 4294894636
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace (crc 6265fd77):
>     [<ffffffff993495ed>] kmalloc_trace+0x29d/0x340
>     [<ffffffffc0ea4a94>] dm_dmub_sw_init+0xb4/0x450 [amdgpu]
>     [<ffffffffc0ea4e55>] dm_sw_init+0x15/0x2b0 [amdgpu]
>     [<ffffffffc0ba8557>] amdgpu_device_init+0x1417/0x24e0 [amdgpu]
>     [<ffffffffc0bab285>] amdgpu_driver_load_kms+0x15/0x190 [amdgpu]
>     [<ffffffffc0ba09c7>] amdgpu_pci_probe+0x187/0x4e0 [amdgpu]
>     [<ffffffff9968fd1e>] local_pci_probe+0x3e/0x90
>     [<ffffffff996918a3>] pci_device_probe+0xc3/0x230
>     [<ffffffff99805872>] really_probe+0xe2/0x480
>     [<ffffffff99805c98>] __driver_probe_device+0x78/0x160
>     [<ffffffff99805daf>] driver_probe_device+0x1f/0x90
>     [<ffffffff9980601e>] __driver_attach+0xce/0x1c0
>     [<ffffffff99803170>] bus_for_each_dev+0x70/0xc0
>     [<ffffffff99804822>] bus_add_driver+0x112/0x210
>     [<ffffffff99807245>] driver_register+0x55/0x100
>     [<ffffffff990012d1>] do_one_initcall+0x41/0x300
>
> Fix this by freeing dmub_srv after destroying it.
>
> Fixes: 743b9786b14a ("drm/amd/display: Hook up the DMUB service in DM")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 59d2eee72a32..9cbfc8d39dee 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2287,6 +2287,7 @@ static int dm_sw_fini(void *handle)
>
>         if (adev->dm.dmub_srv) {
>                 dmub_srv_destroy(adev->dm.dmub_srv);
> +               kfree(adev->dm.dmub_srv);
>                 adev->dm.dmub_srv =3D NULL;
>         }
>
> --
> 2.39.2
>

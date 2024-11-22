Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CBF9D58CF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 05:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA9C10E1C9;
	Fri, 22 Nov 2024 04:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="CmKxYYks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F43F10E1C9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 04:22:24 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e387afcb162so1753554276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 20:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1732249343; x=1732854143;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ur7LUbzOTQ7wFGUkc8B1qhT46GdAF7nnypGaB15QYJI=;
 b=CmKxYYksWJ05sFQ0/qp90C0R7+9Wtp5ZVThmUBayCQrriZbAtgMcWNKbRwBFDp0r8S
 yR4z1Me2mCK/cQd14eW53bXbUHfKz4ml5RfNaHyuXHUEJSNSlxt1npTgzcc+ZQks2G8s
 gSD6dBLWtCiobgmcUUOWwAwnimiPo/P2tOPLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732249343; x=1732854143;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ur7LUbzOTQ7wFGUkc8B1qhT46GdAF7nnypGaB15QYJI=;
 b=GKPNR+lvYTNtG6HnMDKFDQzrj6E32KjqBP9hwOTyYVrOpKPLVrTO6qhb+aT5xS5/+f
 T8n7heqwh2Ug+zmjyNNCkVojnh1CJbvzSjrco/qIIWuLoIvVSblMI8GW5uT+lpuxNo5Z
 n8qsTpXs+cSyl1BNfcZtXYdMCTQC5ZrGj5xeHtmroMficO6yvUrJnpLIH2HKkYDe8sjw
 Mgvpt7dBXFC1m8MzM0dEr0rQJ0+UI5U/pbfYJ6SwN7Jnr2U3N1Ok/bbJNhBAj0X8Cl4Q
 yVmjYIBl/FRtc+kIJDCHuVVczMVTv0PTvGD+nqzaW6VqTSIiN5Vqsjwsp0C+ID3BY4Gi
 A7Dg==
X-Gm-Message-State: AOJu0YwLVGf0xvb1PRhigi0k2KDMjjl4UU+GaeDJFd+usdhIp+Hhr+9b
 ZhB7LCLDlylM7PWA1KotGOAWxlEGQRp2YRPFy/dgD2JdtVpPlabnSAP9fdlZ01iQNa3vUiG4Jc9
 MgeTSLlQ39ZYq01I/WKWdGQpn3Apuyd7wiAhb
X-Gm-Gg: ASbGncv8JlwEnEpbo12QBL5Uzj028SQXrLEN4AkMgflYRmRGsPGvjQWt5muYDphCKpL
 mrgHFvvcmKX18m7Mx/7/UTWgHQorWaOio
X-Google-Smtp-Source: AGHT+IEDCq6vMgMVmc15f4XmNW85c3NDS84UQfuw/NZqXp5HXFJcnPvLCoFoWnD2wcRGwPaMJVJb8KLbSbSrsMeseas=
X-Received: by 2002:a05:6902:102c:b0:e38:1310:6da9 with SMTP id
 3f1490d57ef6-e38f8bcc073mr1436664276.36.1732249343610; Thu, 21 Nov 2024
 20:22:23 -0800 (PST)
MIME-Version: 1.0
References: <20241121102725.4195-1-christian.koenig@amd.com>
In-Reply-To: <20241121102725.4195-1-christian.koenig@amd.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 21 Nov 2024 23:22:13 -0500
Message-ID: <CABQX2QOgf3Ucv8KQ0rPa+g9_H17TLvAFUu08Pk9qWN=kVEtuJg@mail.gmail.com>
Subject: Re: Phase out ttm_exec
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org
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

On Thu, Nov 21, 2024 at 5:27=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Hey Zack,
>
> vmwgfx is the only driver left using this component.
>
> So I though I go ahead and complete switching over to drm_exec.
> The patches are only compile tested, but relatively staright forward.

Hi, Christian.

Thank you so much for tackling this! It's on our todo.

I just applied the patches and they break rather badly, i.e. I don't
see any command submission with the changes. I won't have the time to
look at it today, I'll try to carve out some time over the weekend to
debug this. Two other observations:
1) The patches break the build, I think they're missing:
diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kconfi=
g
index 6c3c2922ae8b..f7aff3fdfb1a 100644
--- a/drivers/gpu/drm/vmwgfx/Kconfig
+++ b/drivers/gpu/drm/vmwgfx/Kconfig
@@ -4,6 +4,7 @@ config DRM_VMWGFX
        depends on DRM && PCI && MMU
        depends on (X86 && HYPERVISOR_GUEST) || ARM64
        select DRM_CLIENT_SELECTION
+       select DRM_EXEC
        select DRM_TTM
        select DRM_TTM_HELPER
        select MAPPING_DIRTY_HELPERS
2) qxl would need to be patched as well. At least it uses
ttm_eu_reserve_buffers which you're removing.

z

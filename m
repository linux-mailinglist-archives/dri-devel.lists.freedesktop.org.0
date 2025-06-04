Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5439FACE0C0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 16:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1015B10E09E;
	Wed,  4 Jun 2025 14:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ko958D68";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA0410E730
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 14:51:45 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-31305ee3281so201167a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749048705; x=1749653505; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AVa8Qq+qX2ca3yq1SCHBs+6bwMYdjHXn9QCvwLrSQxQ=;
 b=Ko958D6874iY5EqbWvw+JxkvN0i7Pq+KSzOYincExZLU2PtOM5d2XmewaMSh905Rdf
 0KWA7B703UiBQ0vbm06PGxJg6i+BJAzbfvIYsxrNXhZMu0tIlnPZQnYgYlut9Rgob7zw
 hngcBejuzCOZVPTc+lC3L4drJ5fA1GyHUSaPrO8VaemHJgjnqkc/nuvMiJOMx179mvp9
 bapZw8aTiv/P84RKpE6pFNBNhjcBvRxyh5NxmcQQvm/4qszZt1+el0RBLbKkZsuc3WOJ
 Th6xGJ5+kD9FOov9uW+3B7k6f+iYqc9sUz1YrHQt5vZdQz42nGzs72HOVgxVA3t/7hlu
 lbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749048705; x=1749653505;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AVa8Qq+qX2ca3yq1SCHBs+6bwMYdjHXn9QCvwLrSQxQ=;
 b=aDmR98/gyK3KPyM6JkpXrLXV+TnC9n6VNQQiKvhIQwDZde9EOXtLe5FIC2V0baUd+Q
 pDy4HcVfPSZyD0kXLR3tkYEot001qi10zl9/55wMI0cN8CUp9XA/fWpoHLQ7WeioQAhk
 FPrI2vyOt8pvaziOWRYoJzZpeQN9Znowyf0n20RE2GaJ9TMasDe+XCEEV01bvElDp/e0
 2Lva4hnuVztPu3dPnbiVoexyEHuSgNThLLgn1kUpvJa2ER1WrHzFhkAVD1mBGo3u3KYz
 ctwO9oye53/U0AFjUyt2reKwaLldaqyOygCW3xsmARqloFyW3PATzaks+YJn6pCKuUYr
 uYaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8uJOqXamT999r5KqeecYdT+Ps7H7bzWdo+HBEmjXH4QdfKn1HsnXfRM49cc5RD+RdMhBPz95Wars=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+HOsWDPC9nefBeRmZblt+9XPTpVnHRre+k54STVGJDD97m5pF
 JpKtrcV7ozjrxZ67uyhdFMIQiXaJ/BUBw4/HMc88HF8yxEA/Oh86zT0tFjbJukmU+Lgj03l32y9
 hxQ3r77+Xq0vy5EdEnueTz3reJXT+tvA=
X-Gm-Gg: ASbGncumH2whV5xTHaKUXskzZPf/rGZZl0w4Madolx3a1KIBIP/jE8aoUF0zlnZW0F0
 NRROQkMjAakWXEC2fgDolSpHJ7Xd4HkBGCbzOwvUp6/WOSoYEjVKbrrehfw6CJ6sC2geswV8pwy
 LxXZ7fwfwO0guFEd7Z1LAsahHiAXJ7iUAWdA==
X-Google-Smtp-Source: AGHT+IEXhbBU5Ad6IMEuXf05cu8wNhInf6Dr5JPGtJC47oiJd4VMATt6Jx4PUI5odSmqlnX6gbZ4IHvUxsdlUZ55jno=
X-Received: by 2002:a17:90b:180c:b0:311:c939:c842 with SMTP id
 98e67ed59e1d1-3130cd7eab2mr1699539a91.7.1749048705130; Wed, 04 Jun 2025
 07:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250604143217.1386272-1-lizhi.hou@amd.com>
In-Reply-To: <20250604143217.1386272-1-lizhi.hou@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 Jun 2025 10:51:33 -0400
X-Gm-Features: AX0GCFuFLQhl24WQZAscJZ2gULKE1SWhCQ5ymXTk-y5XTHc0fhk0LJCRP8nA58U
Message-ID: <CADnq5_NMamTAd0whqwr+xcokFThCNX7T7qFBfX+u3vnS6oc=tA@mail.gmail.com>
Subject: Re: [PATCH V1] accel/amdxdna: Fix incorrect PSP firmware size
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: ogabbay@kernel.org, quic_jhugo@quicinc.com, 
 jacek.lawrynowicz@linux.intel.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, max.zhen@amd.com, min.ma@amd.com, 
 sonal.santan@amd.com, mario.limonciello@amd.com
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

On Wed, Jun 4, 2025 at 10:42=E2=80=AFAM Lizhi Hou <lizhi.hou@amd.com> wrote=
:
>
> The incorrect PSP firmware size is used for initializing. It may
> cause error for newer version firmware.
>
> Fixes: 8c9ff1b181ba ("accel/amdxdna: Add a new driver for AMD AI Engine")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>  drivers/accel/amdxdna/aie2_psp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/aie=
2_psp.c
> index dc3a072ce3b6..f28a060a8810 100644
> --- a/drivers/accel/amdxdna/aie2_psp.c
> +++ b/drivers/accel/amdxdna/aie2_psp.c
> @@ -126,8 +126,8 @@ struct psp_device *aie2m_psp_create(struct drm_device=
 *ddev, struct psp_config *
>         psp->ddev =3D ddev;
>         memcpy(psp->psp_regs, conf->psp_regs, sizeof(psp->psp_regs));
>
> -       psp->fw_buf_sz =3D ALIGN(conf->fw_size, PSP_FW_ALIGN) + PSP_FW_AL=
IGN;
> -       psp->fw_buffer =3D drmm_kmalloc(ddev, psp->fw_buf_sz, GFP_KERNEL)=
;
> +       psp->fw_buf_sz =3D ALIGN(conf->fw_size, PSP_FW_ALIGN);
> +       psp->fw_buffer =3D drmm_kmalloc(ddev, psp->fw_buf_sz + PSP_FW_ALI=
GN, GFP_KERNEL);

Why do you need the extra PSP_FW_ALIGN in the allocation?

Alex

>         if (!psp->fw_buffer) {
>                 drm_err(ddev, "no memory for fw buffer");
>                 return NULL;
> --
> 2.34.1
>

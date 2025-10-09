Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A868BC91E5
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 14:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C941510EA2A;
	Thu,  9 Oct 2025 12:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KBs2SXuY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C9010EA2A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 12:51:17 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-27c369f8986so8287215ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 05:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760014277; x=1760619077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MDMFuxtj7DOoK9vdG1w2+Ih86u05O/nr3t6ARiKVfns=;
 b=KBs2SXuYG3959W2dmGeV/CirJhE0YalSxjL4PymSJQP4BOwszW/g/Zv/6P58QEvtc/
 wWt4Imig8sqBWF/CuyOmnQqfm5sTdVeyj+Qf01pmyZ++jjOZlJyJVKydjFspJbhba0C+
 iV8gZX1e0QhwUnDeBMw+UdiISGqhQlfztU0ecxfixXfx8ZHLkwaSuobpg2fX0L8YVKPn
 FWU2qfWuLiBQYN7+gJyEPB3voqfMPlvLf6IFKMYc8aYp52tlg0tj/rdQjTvEkhBkNuyr
 U7GYydPiCcs0jruaJIhtLiTHSNqAeb44GHr8VXvjghA4hPJ8NRAAp3JcyKFtgeS3WwfJ
 VCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760014277; x=1760619077;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MDMFuxtj7DOoK9vdG1w2+Ih86u05O/nr3t6ARiKVfns=;
 b=QyOCCV1tEO5apDhiEyAg1GD93CrBcjPjqOqnrr95pCv2gmzvxQve9b9UWWsOU5dv2k
 2VJCy9ygEdwV+ZRvimTHQ7goWG1/Y394zL0GoZXv0pLrQhmFVW/2SdB8o6XpLG8PuvFd
 T72m4TVf2zRC85NPVWcgE7iRPrX5pbshaRIoWX5dKcCBJ7q+85D7BAeedQOe8EFBWXV+
 5oPu7PENLmqjdJIvTdzgQaGjb50uYzM26xVISDcssyMqTwUVGDx+W/J5rhttuarixdeG
 TeuegUxAqY44ZCA5CmhOWgqP/XKFzKCLiDe17LpZ7GqBrMZZdLNw8oaWfJ7IbSNvlotj
 HOiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8AO1aM2kfeSKV3u+MXcZ2WvD4H5PhT7zP6iUZhKqQi6UFpKOPqM7gxJMI0tTBSp5wiR2bkcV+U4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnV1DocdzPjO6OrwQesdnpmKdyto/aqo4SzAnVNbVlGyQR+2Qu
 McttKF00JBPGtKgpr2es/LCCLwYtpPbMxDf3MCkl8PGRYf7VFRi9lMAylqf6zODXWXjVZEKPd1V
 k11gsZJKJY6OJ1gz9B1PyhcyTm0kFFho=
X-Gm-Gg: ASbGncu+Z5kPU8CQD+5IWR8AYYiZymr4+GtUkhyFUVeQlowMR3x+ieDL/fTYfo6sqUz
 HNUFFlyMkVNM2jypcEo7bhJkKmTflKUYkqT9iE3z86yVgz5y35iNWb1umbmRwk7W/m9FJDfDkuI
 MNdrTUDLEK5YNPYiT2tvSIyo3pXUXW4UpZJgRimWw1CFx9TPQ8oo3RomsSs6hoX30E+xfja848B
 v2rhmU/qzXddk0oycMv71WZWiUnuBlurAnnVXMcohk+RYlya4GTV4/asMJQ
X-Google-Smtp-Source: AGHT+IEhAV1wqwmuEfqj9eDPRuTr5xhy6QzH+Fe4j6lHSFhQoyHt9bJp9C/EYN1+uc18PLR1t+1Bf7rHPlE1k2VNj6E=
X-Received: by 2002:a17:902:f608:b0:263:b8f:77dd with SMTP id
 d9443c01a7336-2902741d0a7mr98644915ad.57.1760014276668; Thu, 09 Oct 2025
 05:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 9 Oct 2025 15:53:34 +0300
X-Gm-Features: AS18NWAD-sPW--RGZUkk020BQr_wBUAqvEISI-DaoXi4Qt_J4rUCZMsA_rvkqkw
Message-ID: <CAEnQRZCFk=07=tDgEPJeXx_xDp_6LGXi+2o9GAADoP86mWYZ2A@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org
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

On Tue, Sep 23, 2025 at 8:30=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
>
> Add HDMI PAI driver on i.MX8MP to make HDMI audio function fully work.

Tested-by: Daniel Baluta <daniel.baluta@nxp.com>

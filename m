Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 146C1B0DF61
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 16:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B528510E6AF;
	Tue, 22 Jul 2025 14:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IN4OAZUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526B010E6AF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:49:02 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-23aeac7d77aso47264075ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753195742; x=1753800542;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=llvPSqwtXAU3BSB30Xc7oEbXQ8gj4nyoF+omK4Sqcbo=;
 b=IN4OAZUhSHqVxV/A8cuHLE9+2JxXP/gre9+ErJJEiX+lzeCdOjR9QpDIqNxHP4t8AI
 dSQJ1XLxlKPsyDbiBVYYw3j+g43RxyyoPJ+mYs6xRL1FPatjOMOaH2n+O1Biu0Y/OoZb
 6fw+n6tR8llkdjOVmk0Qdcm1Ugbpat3957mb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753195742; x=1753800542;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=llvPSqwtXAU3BSB30Xc7oEbXQ8gj4nyoF+omK4Sqcbo=;
 b=UgUs7Z3x3BAHIgMlcrNLBHPDU8kmcRaNXMXav5Xo+howzy83NWdQGD8aqt9PCFru1Y
 IF5sctCnsce3E1snSdKvSIocPCOnsbNHTXdGfDdbWp3vjcyW17MzDwcDO23d9BWIgi8y
 gE99aOV0bYaFYXd3wZt0RlAsQQf6Ny6L5c9l2C9v6o6BnDqFzMMIv0r7fZgTupj6OMA8
 LgRc5Km2R0c3+vAaEwvqaiHGNo24xztUMvxIyHAl9qpVI9Zxxr7629q40CeY0vs881yK
 AmpkufsqReOZfhx9GmfA1f7xl6oqr9L9nX4pIKt2qSkz/oT6AawymmHH9CknEmM0CIi3
 YchA==
X-Gm-Message-State: AOJu0YzplDYiYmYIf2mpDcOmNohWAWpnQHWScwhbgAMUUTKvu53ejr48
 e1Fevky/4L8u3Isly4Pm+gkX4SztUi3OI+trQy4QbhKhpKrx1sDrZpbD+AkFWKNMC6oQ8qEh3J3
 JOos=
X-Gm-Gg: ASbGnctFl+7VVFtPs9x3J0jMXlx9XIbtukBwRCutdGjsZhhZ8aRC4Vg3ZtZPKTwPFFe
 rH0x8TkkaxMIbCLZM5vX9Xb96gLzp3glNMoOV5D33gHZ9lMQV5YciwFwQmvzktN+jLWQAraksNE
 Jmx2LGsE3GycE+JR+5O6poHQEgS+FtUzBQzfu2ltEYJR25zK0jE/nzYgaw+xOh8bTXF0b73R72t
 lBjlg4vY2haQ+qqQgPSUSf+Ey25MCpo5neZQZ742Ejq2j8yS/AwLq9DP8+z+Ko4abcKoXtR3f7O
 UALTozmydKiRWRbVp7JTSRQ+Cy3f92FfzZXUmW33p8TI26FfpYI35cZyhP8f2No1zJsIBw8gHbC
 +Kunyl+dX4ORGzK8UtNMMi9TivAR8D5iZfdIUHicNN+AgmmK/PvA0ifq5ob2DOuKeWg==
X-Google-Smtp-Source: AGHT+IEzjzUYMmHl/6uvGAxridfJ6pDU8sRmhsraqfkaclU5LVG5nqTBGHL5uMBTZOt2t7UL1ew0xA==
X-Received: by 2002:a17:902:e78b:b0:234:88f5:c0d1 with SMTP id
 d9443c01a7336-23e24f36745mr368498875ad.10.1753195741894; 
 Tue, 22 Jul 2025 07:49:01 -0700 (PDT)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com.
 [209.85.215.169]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b4a93sm77818615ad.102.2025.07.22.07.49.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 07:49:01 -0700 (PDT)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b3bdab4bf19so4271943a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:49:01 -0700 (PDT)
X-Received: by 2002:a17:903:2290:b0:234:a139:1210 with SMTP id
 d9443c01a7336-23e250012ccmr396616705ad.53.1753195740688; Tue, 22 Jul 2025
 07:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250714130631.1.I1cfae3222e344a3b3c770d079ee6b6f7f3b5d636@changeid>
 <d1906219-f588-47f0-a43e-c2db4f9c3cae@ti.com>
In-Reply-To: <d1906219-f588-47f0-a43e-c2db4f9c3cae@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Jul 2025 07:48:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X-Y-8gP=0Pop8-idak7b_0ojuqbt5DmGmJM+j4_efFfQ@mail.gmail.com>
X-Gm-Features: Ac12FXxw3_BE6vtlQk9bYKnmlQBa0VzZeJXtxIUp_MKAHZ5KbrSQc3YwQeKZzjk
Message-ID: <CAD=FV=X-Y-8gP=0Pop8-idak7b_0ojuqbt5DmGmJM+j4_efFfQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Remove extra semicolon in
 ti_sn_bridge_probe()
To: Devarsh Thakkar <devarsht@ti.com>
Cc: dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
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

Hi,

On Tue, Jul 22, 2025 at 6:53=E2=80=AFAM Devarsh Thakkar <devarsht@ti.com> w=
rote:
>
> On 15/07/25 01:36, Douglas Anderson wrote:
> > As report by the kernel test robot, a recent patch introduced an
> > unnecessary semicolon. Remove it.
> >
> > Fixes: 55e8ff842051 ("drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort=
 connector type")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202506301704.0SBj6ply-lkp=
@intel.com/
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
>
> Regards
> Devarsh

Thanks! Pushed to drm-misc-fixes:

[1/1] drm/bridge: ti-sn65dsi86: Remove extra semicolon in ti_sn_bridge_prob=
e()
      commit: 15a7ca747d9538c2ad8b0c81dd4c1261e0736c82

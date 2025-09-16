Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB237B59A0C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 16:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3909F10E377;
	Tue, 16 Sep 2025 14:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JJF7B7ml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690C310E377
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 14:30:52 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-77b0a93e067so484456b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 07:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1758033051; x=1758637851;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TiffAS7cC9zkCAeD5hrwe++ErwkU044VbYitXleZroU=;
 b=JJF7B7mlXZY90DmBa+xjhpaYVqLCGnD1wYAuG65LCqh1OJEHTQlnu+rAZNoF7Ho/le
 5nMp21ki/Lq1u/Hh/KdY9IO2WRqT80i0C4TESbUk1R4ZrSqhUCOLvES1Gg66QCft9fK5
 RUITp3EVIUKP6ao8Y7n0E+LgOhIIZRItofu1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758033051; x=1758637851;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TiffAS7cC9zkCAeD5hrwe++ErwkU044VbYitXleZroU=;
 b=jakvlnWjm7elxp24HhOs4ip5qirkHCTYai5ShJN51AGLDag9huv/A4JiEIlAGTT6Ga
 JrYehDMvN8AnhkAuY1lJwq8tchWLig0VeF8fdkbJq3bBk/AX6XBX2Olnm/drfil1EMD9
 hX2JLUryWg+Qaxr/WkYg8Wl+eEOmqJeJ29EJ2uoirK/22lR50yG3evZDIfJysudYXtWh
 U3cQqFeHQAvc7iRDyjSFIKm19RZVAg/El2RrkRcvVdmCuH1w6/2J6uCVayg2+zFE1py5
 9akycBej/zWz/klkCaPWLP61xG6CEozKkVwW9C9nSFKY8qf1e7TOP79AkmLm+ACglczm
 AUgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdd9/dYawJQ6b2L6PtqK3YdeBMmZLhSZzGnjtPqArZaExo6ZDYsEIBulB/Hi339PahwREWOvBhjWA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5shaCyL7oLItwPHlPHB+/QCSS+6FGXuD5of3BPSPYXYGAKBFi
 XgcF/meFJ/+mOaVNnv3qwPSsgJ1lfhpO1m26u0gE89/51JYFq6x6wccvIT4CA5rLPGJMWfW6u0E
 AggE=
X-Gm-Gg: ASbGnculzyDWsFjzDLqOwvcbRagE4ioRmd3G30A81y8arxFV1GKbzN9ta+BYrWYPHaK
 oGtgBY0hLkhs4EQM56SuQoDrHzD2mhlp6XWuEcRCMYJ9VEVZNSYjKLBujqpwQzlOASIIbFFtvFl
 uF+vPCZr5bu9u9TKUjSwMz/sH3pGT3ftp1qG22L+qxSwkfUmsVxtLBRV1fYgaIOnGZzYDJJjWFk
 K4jFFCvNxsFq6+ZBrymnQfUFKx9b2YszB+lwevVdbxfntdh0Q0Gv69Zo91vyMC0WTBj+aqFUh4m
 mt3HGn6+HilagAI48npaNYuK1kGQLKYh74vh0ZBMAApiqNq0Mevhp2qRNPfE6ose7eXiJMKm+e5
 1OMIRiJq7wdUW0u9tLnPZndo8avYWKrEcX/byreVY9BDMXX0PuCUfSYxGVg8nxfuWAuMezw1+Jq
 EN
X-Google-Smtp-Source: AGHT+IFqcs+fskk8wK9Fr1u1WdgeCzVulA1FfMfAKYsMeWbBkR5aHTvYwYumA050msFGMUxhhMPemQ==
X-Received: by 2002:a05:6a00:4601:b0:772:4e7f:8106 with SMTP id
 d2e1a72fcca58-7761216375bmr16970726b3a.16.1758033049445; 
 Tue, 16 Sep 2025 07:30:49 -0700 (PDT)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com.
 [209.85.214.182]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607c48f22sm16632360b3a.92.2025.09.16.07.30.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 07:30:48 -0700 (PDT)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-26799bf6a2eso19328285ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 07:30:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVU81t5Z5Bg13GMWcVq9V/v0720K3qhGREoEyDL8FKJX3bxopztrZtZVWQvhW8ZjLs75BcDqYl7F0I=@lists.freedesktop.org
X-Received: by 2002:a17:903:3885:b0:267:fac6:f099 with SMTP id
 d9443c01a7336-267fac6f0bdmr882655ad.38.1758033047184; Tue, 16 Sep 2025
 07:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250910183353.2045339-1-john.ripple@keysight.com>
 <202509161344.FPfsjq01-lkp@intel.com>
In-Reply-To: <202509161344.FPfsjq01-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 Sep 2025 07:30:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZ8=o3D4iQ+hMFKup+8LuUh74BOyf7YLX-VHRkcU7TrA@mail.gmail.com>
X-Gm-Features: AS18NWDcO5yWc3JLU6eUzWEdoHiHgHWEJMNFpIAQ3YTFuxgHuOAPRPJlbYq6e8M
Message-ID: <CAD=FV=VZ8=o3D4iQ+hMFKup+8LuUh74BOyf7YLX-VHRkcU7TrA@mail.gmail.com>
Subject: Re: [PATCH V3] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
 mode with HPD
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, John Ripple <john.ripple@keysight.com>,
 lkp@intel.com, 
 oe-kbuild-all@lists.linux.dev, Laurent.pinchart@ideasonboard.com, 
 airlied@gmail.com, andrzej.hajda@intel.com, blake.vermeer@keysight.com, 
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 matt_laubhan@keysight.com, mripard@kernel.org, neil.armstrong@linaro.org, 
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
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

On Mon, Sep 15, 2025 at 10:46=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> Hi John,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20250911-02=
3707/John-Ripple/drm-bridge-ti-sn65dsi86-break-probe-dependency-loop/202508=
20-235209
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20250910183353.2045339-1-john.ri=
pple%40keysight.com
> patch subject: [PATCH V3] drm/bridge: ti-sn65dsi86: Add support for Displ=
ayPort mode with HPD
> config: x86_64-randconfig-161-20250916 (https://download.01.org/0day-ci/a=
rchive/20250916/202509161344.FPfsjq01-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202509161344.FPfsjq01-lkp@intel.com/
>
> smatch warnings:
> drivers/gpu/drm/bridge/ti-sn65dsi86.c:1385 ti_sn_bridge_interrupt() error=
: uninitialized symbol 'status'.
>
> vim +/status +1385 drivers/gpu/drm/bridge/ti-sn65dsi86.c
>
> b8670cf7e6a41b John Ripple  2025-09-10  1365  static irqreturn_t ti_sn_br=
idge_interrupt(int irq, void *private)
> b8670cf7e6a41b John Ripple  2025-09-10  1366  {
> b8670cf7e6a41b John Ripple  2025-09-10  1367    struct ti_sn65dsi86 *pdat=
a =3D private;
> b8670cf7e6a41b John Ripple  2025-09-10  1368    struct drm_device *dev =
=3D pdata->bridge.dev;
> b8670cf7e6a41b John Ripple  2025-09-10  1369    u8 status;
> b8670cf7e6a41b John Ripple  2025-09-10  1370    int ret;
> b8670cf7e6a41b John Ripple  2025-09-10  1371    bool hpd_event =3D false;
> b8670cf7e6a41b John Ripple  2025-09-10  1372
> b8670cf7e6a41b John Ripple  2025-09-10  1373    mutex_lock(&pdata->hpd_mu=
tex);
> b8670cf7e6a41b John Ripple  2025-09-10  1374    if (!pdata->hpd_enabled) =
{
> b8670cf7e6a41b John Ripple  2025-09-10  1375            mutex_unlock(&pda=
ta->hpd_mutex);
> b8670cf7e6a41b John Ripple  2025-09-10  1376            return IRQ_HANDLE=
D;
> b8670cf7e6a41b John Ripple  2025-09-10  1377    }
> b8670cf7e6a41b John Ripple  2025-09-10  1378
> b8670cf7e6a41b John Ripple  2025-09-10  1379    ret =3D ti_sn65dsi86_read=
_u8(pdata, SN_IRQ_STATUS_REG, &status);
> b8670cf7e6a41b John Ripple  2025-09-10  1380    if (ret)
> b8670cf7e6a41b John Ripple  2025-09-10  1381            pr_err("Failed to=
 read IRQ status: %d\n", ret);
>
> status isn't initialized on error.
>
> b8670cf7e6a41b John Ripple  2025-09-10  1382    else
> b8670cf7e6a41b John Ripple  2025-09-10  1383            hpd_event =3D sta=
tus & (HPD_REMOVAL_STATUS | HPD_INSERTION_STATUS);
> b8670cf7e6a41b John Ripple  2025-09-10  1384
> b8670cf7e6a41b John Ripple  2025-09-10 @1385    if (status) {
>                                                     ^^^^^^
> warning

It looks like the bot reported this on an old version. The newest is
v7 [1] and things should be OK there. Yell if I missed something. :-)

[1] https:/lore.kernel.org/r/20250915174543.2564994-1-john.ripple@keysight.=
com

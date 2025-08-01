Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF10CB18338
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 16:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4408A10E86F;
	Fri,  1 Aug 2025 14:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09F210E869;
 Fri,  1 Aug 2025 14:06:35 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-af922ab4849so254364366b.3; 
 Fri, 01 Aug 2025 07:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754057193; x=1754661993;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A0A5xi+3xpovbOffaEI0YAyQFVVclpkd8BxIERvxAbg=;
 b=fVAhnnWp9zZ4a9hkLmnTMiqTYIl7YTs1aQaU5MNF1hwms5q3Wfh8jigSDDjR9QwSfe
 HeIv9Bi7tAFDthnlEB3qy8YgAxQa7+DAuCOAFxTjqKBYhxtLYFvLMa6uEnhpz0zpILex
 jkCy3Agmcgh2N6nq1A4FABLM8P/2tU7HwqWz3UioAsznmkBH1+ZLTjbefYan/luOdWiO
 d8EvnoVLm0sqbFXzXng04MWn7Bc+KQji+8Do3vUnkRsLo0Etp5ysXCbKLXT/haIT6xVI
 JtUWI3i3IO5dL8PeLr1ck77KkvF1GRA9Ygnzjw8lfcaM+TJKc4zgpR0KIR/ehlLdTVzW
 /Enw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF2Pn8GaBH6zrucuv65oWIvynElKBymiaA/g8QJ2CDdlfaMha7rsn17ZT6bX4dY6Ee6N9s+zY4@lists.freedesktop.org,
 AJvYcCUTKTfYLlppozyK/ng0mVmYptoUE8lz6Gb6vfJTyudMVu0V4iisw9sephYoTQfi3buvljqUTBw9ZwoB@lists.freedesktop.org,
 AJvYcCVg/yX4P56ibo6b3PF/dTOVZqIcg7+jaOFqEKsNSj+JsCvr6beRWL3fDEK8Hc/eohQrFnWaEnuqbaeg@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4pubdWE1O49Fru16iE9ilePg7VcBMeqb4xp59yk1Kzi/ma9q3
 XNFdMEsdNCElGtiZ/agwsQ5K72gOicmzXo81EVwRTNa8u6QWNJHfGWsYJK8mhl5IY0A=
X-Gm-Gg: ASbGncvtlEdtPwbBEzgyb2wZJF0A7NTIdc4OVNKeRLfW5DHInQL2afBbZzeknqOvdNS
 TrsUkCHInk0xV/xfBNjpv1n/Sz+pGOoCCErw6aBZhTShiK0DwyqYzWMPI9n92SSvVwNpmVKOqfX
 2mLvvDsvFg/xSQrOT3GZhS5LlIfDX8/iLAvS9rRVcwoxbHlFPPiWLZwHCCaewVnGt2mV7ERMvy7
 xIwE7f01Jp43letPtaVqyU8Sx0AtF7bHXRjPN6VAoP2GH3dpvMZGkISgQgbJ/u2O67QM9TLqwP7
 syeore4eNQlxzW0zAXebFPEVJfbpX+bRuIcWMMzFQwUhONgKwnUhdCEvPaET0d2SV5kvspKp6CL
 LBc6RkZYBgh2P92lMfGdm03ZecR35vJtPPhq0aGnwALKFimbKnGqtMC1INFe8ngZ9XoQIpW8=
X-Google-Smtp-Source: AGHT+IF9O6P4/j4Zk2x8CleHxTXZA99WC1/fgwWkY8+gyU6BBMObEQIlufj1QeBI27OMXuLiBRyjIw==
X-Received: by 2002:a17:906:37da:b0:af9:3b4f:a536 with SMTP id
 a640c23a62f3a-af93b4fb5a6mr113834366b.45.1754057192609; 
 Fri, 01 Aug 2025 07:06:32 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com.
 [209.85.218.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e833dsm290953266b.64.2025.08.01.07.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 07:06:32 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-af922ab4849so254357966b.3; 
 Fri, 01 Aug 2025 07:06:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUG450r5zQYYk3EDvlwWURAEqucKufdyrSq9IawLtsyPkdZahU6o4k221mRf412dYr/ViQxcxq7XbFB@lists.freedesktop.org,
 AJvYcCUnfpohICGjiwP5EVUxLFVtKycU9DjC55W7nCOpPqK+aXNuf7d55QDZcsnAULMO7ByPBAB31zRz@lists.freedesktop.org,
 AJvYcCV6yrPiJcLuO/Jtz8UzgL6BovnSP4ryqtYzvGJ8VGJ6y2oHl9+QtNZOR0MRfv9w17e5Pj36QvZXAkRz@lists.freedesktop.org
X-Received: by 2002:a17:906:dc8c:b0:ae2:9291:9226 with SMTP id
 a640c23a62f3a-af931992ab9mr376411666b.59.1754057191885; Fri, 01 Aug 2025
 07:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-5-824646042f7d@oss.qualcomm.com>
In-Reply-To: <20250801-wb-drop-encoder-v1-5-824646042f7d@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Aug 2025 16:06:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUamdfu4VH8H9oyA_uhF8Jx8zDi2jfPmiy_-r2u-LU23g@mail.gmail.com>
X-Gm-Features: Ac12FXyqNVzOuQuexYljmDDN0_xmYa1ngs423zaCF76oVKZNARv5QvM4zwy2PHA
Message-ID: <CAMuHMdUamdfu4VH8H9oyA_uhF8Jx8zDi2jfPmiy_-r2u-LU23g@mail.gmail.com>
Subject: Re: [PATCH 5/8] drm/msm/dpu: use drmm_writeback_connector_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

s@msm/dpu@renesas/r-car@ in the Subject.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

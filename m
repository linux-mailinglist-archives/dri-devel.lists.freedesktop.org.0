Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A0AACF062
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 15:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A7210E81F;
	Thu,  5 Jun 2025 13:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sSfFlbor";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B4310E81F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 13:25:38 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-32918fe5334so9981541fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 06:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749129937; x=1749734737; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
 b=sSfFlborCGtNiLH3tRNxWYv+J/Ddb2cVeKBimWOgZmwAjtS3mHPmEWMFqbsoewHev7
 JDs3HkozuHCq9/9k413DrzjkX7eGmeEW5Qegqz+NbEEhu8PeCX7r4D7N4GpoL645Tjxz
 BErI0xJVXDmUqE0eQaCDHuOtc1+qq2uB2CUensk/swDqV/ZUAxmJYJ44Ps9mozgAV19K
 UbpKTfU3y5DNISxo9MAxmTtjuvevY0j+Mgj7l0DFaRZwxa2CJhJl+ggfe6fUW1efxwar
 vZQVPFqjmBHOXkG2usKxwiB+LiHllJ9y/VW3UEAUBGcnQFKmRDl4PnCaycctlnzXmptg
 eIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749129937; x=1749734737;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
 b=IIch7fRVBcyes5HpByJm8RwvnlzF+VEQE5g7duMZwPqd5tMin+rGQKwOqHAaSOyqxn
 xCiU2SFuaWfH0zDNmzQocLN/G8sRH1qH+Xdt9Ru5p6ybUw5y6TloAsFo0lyKiacLcKBs
 4iDKNBvR0UmNKLpG+uylGeNpgJxojzDRMJRvsNkkmhwXFZephxF0H7Rpm4RgsaVqazcV
 /bkcajHxNxsLktJIPahwA+151Eyfj/7czO8qN/wCUJDdcYwKm9HRtR6KRm3D+EPopBkr
 9BUFAywfMndEbcb8tccjOLIjycaCG2JSy4xu3dcu+Q/buzQL1aTfx2qMF+AqpPGnkyKL
 K/aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsdYFTd7vPRuUWHOGS73SLBHku4AQZL8bIyr3T9U9lnqPRxmk6CGVbQHs20YpmsbazxVyx7TsGpRk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzR+bY7Qqih2kJTMPGybQkCQucwMD6CyUS4nrvidfiqNRO2xSDM
 nTkHoNuTyvGel1AOWATJBiZiwPohMy0WaaWOdA3x55KwGf66i4AzD3EXvai9PhW405C+MqngRAt
 1C5SYZzGvE4GuZ2C+N61DnIQ/iBSZRPMpvdSmqPscIw==
X-Gm-Gg: ASbGncuPSmbCk1pXQ7EgBxQsp3DRD/fGbYUkutOOFYX58uZYxlFfBjYps4puDB24SRe
 Uq+0D81dcov5rgK5+dxoXi04jRollSJeB+57o9Ug1Qht6t9nobhIf64fBfqCqaItVi1UlgG09Pb
 IRQUFjcpic32DLDweHWctEN5FwGPK/YY6k
X-Google-Smtp-Source: AGHT+IEXDLuUxYBO7fxS8P8ms4WiU/xJFKvEp/hKMmovCR15hms9m/g0A6FghTW4kUyhFWDODOXMqMLjOLenFT8s9LA=
X-Received: by 2002:a05:651c:994:b0:30b:f283:5ef8 with SMTP id
 38308e7fff4ca-32ac71bfedfmr18601411fa.18.1749129936758; Thu, 05 Jun 2025
 06:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
 <20250529-b4-drm_panel_mass_driver_convert_part3-v2-36-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-36-5d75a3711e40@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:25:24 +0200
X-Gm-Features: AX0GCFsdE6ka4seBq476pc4kVds9Z70NwuFBL-Ad03eDGyeURiB9xBYNtFeP04Q
Message-ID: <CACRpkdbbwGOF6URoYtjci-muvBHUhT8pRu6JXR71n3LpicgSzQ@mail.gmail.com>
Subject: Re: [PATCH v2 36/46] panel/tpo-tpg110: Use refcounted allocation in
 place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Robert Chiras <robert.chiras@nxp.com>, Markuss Broks <markuss.broks@gmail.com>,
 Artur Weber <aweber.kernel@gmail.com>, Dzmitry Sankouski <dsankouski@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>, Michael Trimarchi <michael@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
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

On Fri, May 30, 2025 at 4:52=E2=80=AFAM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

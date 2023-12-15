Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2318140E7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 05:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D247610E02E;
	Fri, 15 Dec 2023 04:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E196910E02E;
 Fri, 15 Dec 2023 04:14:31 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50e1d61b657so231818e87.0; 
 Thu, 14 Dec 2023 20:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702613670; x=1703218470; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eZT5Clbd+TL1qy1Ok5aQ+R0ZiHvTh19qz+YLPiH5Yos=;
 b=BNLAh9v/QsJh8rLC9+IpK7DVh01M8zon727ZZLHaBeaBD9TdKrQrLAG6X5Et6ofJrB
 HUIGBWtzAxRNNh3/dhtmkjJl2RMuDsoYCpOFX/LMruIAKTOO9bhDFwJRK4vsAK8uh4+7
 zbO4J0FKjKsJvZT3eKZrrzJB+o1GJkiDIePy+1dlHmQwEYSrfy1JiC5SNlpM4wRD4ng6
 3ctJwArr8VQFAwitYXqFNvrhJDUXDOxY6JQYIqS8ywd9ZtOz4/oH4nZdkEsz8WQPJnJd
 p11KenzbfOQq/PxQRt+AJr3ejaEIKD9EwIkawsLC+qn46EIIlJnHyLkvhFTYnwlccKFw
 2tXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702613670; x=1703218470;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eZT5Clbd+TL1qy1Ok5aQ+R0ZiHvTh19qz+YLPiH5Yos=;
 b=Br9klMXxkEgIQG8pEum5bwQ3aWMP6wZiVIR4UVSthrEvuOvUxzzQFtOcdQAK35BOJy
 U730bTw5b2szKVWnMw9zjASgpk4rQn06lccTZ70GEtGketJ+JacyF6YUNA6L8Qh6rSki
 rY/i3qDVJMcECELrFrzEHKpgv1SNjyKBALm2i1cTht0+Y/uX/y5FHXip9hBfe1dMdRL5
 Dx5VeAjl5Sr9X8SgeuG7pC7yY6CfkzIzO1s/Iy8cm4QH5yOpecd1d4CG3YOePt97/U5O
 SBwht3xsPdrxpGxFyVF3+7vh4+orxQJuFgTbLWGL8ACChIRKV8KwHlWaSfOtyqImvE8C
 xe1g==
X-Gm-Message-State: AOJu0Yyrnww5Blh6ih978hpN7KrZB99V5aZIarGAoI78XCXFR+tN5k/8
 iFSeFLBLTgylzQZ8eRKIwmmO7lwi37zcg/GJ3UfTbImQ
X-Google-Smtp-Source: AGHT+IER+OaTyBjmvbwvNtLscaknwdV3+tfRSlB7WgGdkXEcj7c+05RcAmTRhJwsKFNmMGOk8UbUcc+DHHYMN/xgeMY=
X-Received: by 2002:a05:6512:55c:b0:50e:1ea8:f3f9 with SMTP id
 h28-20020a056512055c00b0050e1ea8f3f9mr94652lfl.107.1702613669734; Thu, 14 Dec
 2023 20:14:29 -0800 (PST)
MIME-Version: 1.0
References: <20231208104653.1917055-1-thierry.reding@gmail.com>
 <7887037c-9fe4-4121-9280-58b3cceaa3e8@nvidia.com>
In-Reply-To: <7887037c-9fe4-4121-9280-58b3cceaa3e8@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 15 Dec 2023 14:14:17 +1000
Message-ID: <CAPM=9tzWFt5QNDrLeLpUrPfOUQzq3iSfaFYH_Si7ycmTE_h79Q@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: Fixup gk20a instobj hierarchy
To: Jon Hunter <jonathanh@nvidia.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Dec 2023 at 19:26, Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
>
> On 08/12/2023 10:46, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Commit 12c9b05da918 ("drm/nouveau/imem: support allocations not
> > preserved across suspend") uses container_of() to cast from struct
> > nvkm_memory to struct nvkm_instobj, assuming that all instance objects
> > are derived from struct nvkm_instobj. For the gk20a family that's not
> > the case and they are derived from struct nvkm_memory instead. This
> > causes some subtle data corruption (nvkm_instobj.preserve ends up
> > mapping to gk20a_instobj.vaddr) that causes a NULL pointer dereference
> > in gk20a_instobj_acquire_iommu() (and possibly elsewhere) and also
> > prevents suspend/resume from working.
> >
> > Fix this by making struct gk20a_instobj derive from struct nvkm_instobj
> > instead.
> >
> > Fixes: 12c9b05da918 ("drm/nouveau/imem: support allocations not preserved across suspend")
> > Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>

I've applied this to drm-fixes.

Dave.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0E4890888
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 19:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E8210F3BB;
	Thu, 28 Mar 2024 18:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TEWUKN1K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7EC10F3BB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 18:47:24 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-515c50dc2afso1284453e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 11:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711651642; x=1712256442; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZcpotxQXgYZCgwQSFwHplGgALMDuSMOW4BVWfQ6+9A=;
 b=TEWUKN1KxZ1OLqwBboVw9D8Xz5ygfxbkOSS27EYYPcphQn4+K9antofl3qrTQbTXt9
 L1lAQPXVAPaQwbZDJzTCtz7ZlP2xGh3IXHzEQD8Y6Ec69FAs/LN51fd5EKu0uBmsJYMk
 JHBwpD+oMc4ZtgKMEFKiEmPa/9/Rm2W+XK1cj1GcWj8C26kT71X3XljVd+nDmaSIQmHE
 ZIkRI5G3uDpvJWVSOjKPcCi5g+OIiYrCsncHkdUaooqVWAlMtUAXEZaOp6uAzTWYZ0X+
 Akn6QxMef6XliTvrkBQ4zFRfnLADIiW3Iwsn0xFa24EUXS6PDKhCY8/0CVxNnDWQrwky
 HFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711651642; x=1712256442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hZcpotxQXgYZCgwQSFwHplGgALMDuSMOW4BVWfQ6+9A=;
 b=imTHP/J819MKe0NL3fUW27cYgXPCDlt11WGJQCkKnreahg3h55KJXGch9HROhYF10o
 XrUMEY1Tq8wRErIIPRdyxnyL2ymRa6rVVUwr/1YHsLtz1rSqPCL0Mlk0AQWIh+BXXfDn
 6/iJ8YJ79h8Gy4cWRRM8099yQ2/nSbJ69tVOJnyhLtb91wRntb+iAkGlALGqH8yEtNtR
 seGa0/efhovMRq5PHeyT7RNV1SbAaDV5bPc5/EPGQTHsyH5TLOe3vDYNm9y073agCnuZ
 jE5weVBgd9JH91X6EaL2Sw85HSwNrsFnmEmeM8AsR8O7+3wQ8RyfYxGoWkp9FyUyDa0r
 /dLw==
X-Gm-Message-State: AOJu0Yy6b0bGeC/kS4E8fJxlfEgPLvBM9Dza9VpmU52/1nYhhQk3OA7J
 b1bDae5OVPhyXrzJ6Ld5XvztXDVoXxW+KcJd9ZTvp1HZeoYLeYMCPTRQBvXfTpP6EuGE2F1h6ja
 wBSqbdPEuEp9QUP3wYO9GczFLaH4=
X-Google-Smtp-Source: AGHT+IGrUuWiVBRFGJLa2HHSOZSFA2vD/h9fV90E+9dmixoq6VsYE1/GCZtKZYQGR4OnS8a+gJ8E+4yj5f4ATtiXG7k=
X-Received: by 2002:a05:6512:48d1:b0:513:eac3:9f7d with SMTP id
 er17-20020a05651248d100b00513eac39f7dmr199474lfb.65.1711651642040; Thu, 28
 Mar 2024 11:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240322214801.319975-1-robdclark@gmail.com>
 <1Wwj_q3RYer6np0Orz0wJd9dlF82iBSX-PIVSlhCgJbpfVBMHF_CF04gHojkvqnvz9NXH6kACZGXQG9yXwtkbjIzLmdi-GNDkO5Nz2E-J9Y=@emersion.fr>
In-Reply-To: <1Wwj_q3RYer6np0Orz0wJd9dlF82iBSX-PIVSlhCgJbpfVBMHF_CF04gHojkvqnvz9NXH6kACZGXQG9yXwtkbjIzLmdi-GNDkO5Nz2E-J9Y=@emersion.fr>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 28 Mar 2024 11:47:09 -0700
Message-ID: <CAF6AEGvUsP7fjqFH9Co1vE0ZGRmMXmFBCrNc3hCQwxky3mME3A@mail.gmail.com>
Subject: Re: [PATCH] drm/prime: Unbreak virtgpu dma-buf export
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Dominik Behr <dbehr@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
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

On Tue, Mar 26, 2024 at 2:15=E2=80=AFAM Simon Ser <contact@emersion.fr> wro=
te:
>
> Makes sense to me!
>
> Reviewed-by: Simon Ser <contact@emersion.fr>

Thanks.. any chance I could talk you into pushing to drm-misc-fixes?

BR,
-R

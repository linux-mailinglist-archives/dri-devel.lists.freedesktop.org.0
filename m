Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1686AA89B77
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 13:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D15F10E732;
	Tue, 15 Apr 2025 11:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="MIN4erRH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A593B10E732
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 11:08:08 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-47692b9d059so68871161cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 04:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1744715287; x=1745320087;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oAG9YdmRy2spdhrSdR+PSo3J7c8KUkAozpqOr7XPBVA=;
 b=MIN4erRHn9A5VaAud+ZPshr5j4DyNhYmP9hS0cIvJmhd4r3rGFdEhbF7/IiwmXnQVP
 P1naQcBXGXtl0Qdf/s9AVE4gORmdrnVGEbq9i0lFumjOsqyEyGmIsoU3dTviddLQ3acb
 AcMvayevxkkWfQ6QkYPOCoU864jiiJcFvZfhExry5MgBq3zmfZKE7tmcRjysehCxiYkr
 b2HXCeYdrNrbbo7sDxv6Fv0cKiC2qhlG5iej9oUQk9UJzHKLXA2QjxSCzr83uD0MQ7Kr
 tP9MHN7VV2yvv69dOejR55Bq9iGa1x2d/55W+MgKQxNAtAmCOW2WXjm2zUPb9AT2s3aQ
 mhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744715287; x=1745320087;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oAG9YdmRy2spdhrSdR+PSo3J7c8KUkAozpqOr7XPBVA=;
 b=Yby571DTnhL+c0H+U4YoXRz8xVKHBSGSp9GZvnYOgBVECl1esuPUE3c7ph2/lPpL+2
 vnQazwdsONeVAp5LkeXOwoTDH5YUL2u0U8vz6QQyhTDhqFVo3FAxwVi2olyFMN/ZBEy+
 Vs5UHMLBJ3MZ8mibe+j19phthEqcr1dV9EiRF9ZfLnojs0yrNk35LFzKcMS8v2qWUxi1
 QDVLCeI+0HP185qxTXwLWtrEtS0J/yOLXyBRRW1NjDZPWjELdyDKe+wa3mOim21nh0Xr
 ILLn/twrU3RSO11V0iyHS/3a6QC5pzu87ero5/w+W80X06dECbuI3CyyFPaFka5L+9ms
 5fnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgP1OyH8PoAkdddX+TDv5kKsQ/Fs42hNhRyuvJ9StEmgxnxUEqaCdgndWoLdQSfI05o73VIC0bvWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+W6d9YblVHVZsC4maJT+ZYwrS/yhPHgjRGyfHrjvwTOxQF0AJ
 1a3pgIe5P6qPIy/79W/T/z+E9L4EtvddahpxgW4c+A7w6hMB0xKRdPZ098JeAJIz25IiyFpW+7k
 YkfzYDDBNqDgV4cJGShsqHgpxt9Do6l2JI/5DjQ==
X-Gm-Gg: ASbGnctZJB7bM0EJ+TvawEMnNhjjnvOvEqBYzFw4P2AqPVyTUvegVX7U5h0Rs2MTGsO
 earnFrV03kQS/rx47XAQiXscg+dX+9otVLKjupDNQugH435EoWsIZAlbb/j0Wf+dbRhjhQE9+ZM
 ufUPSe35NSBQQ3H6QmMeg=
X-Google-Smtp-Source: AGHT+IFh1vXSx5Rq5c8vZLzOiN4zABX47o5Z4Ug0aK3S4poCk694vjoyQA4QCi5vMCDm+1X/EKPDvHIQ3dGkD/YgQP0=
X-Received: by 2002:a05:622a:652:b0:476:a967:b247 with SMTP id
 d75a77b69052e-479775e95a4mr196800161cf.47.1744715287731; Tue, 15 Apr 2025
 04:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250411150357.3308921-1-adrian.larumbe@collabora.com>
 <20250411150357.3308921-3-adrian.larumbe@collabora.com>
In-Reply-To: <20250411150357.3308921-3-adrian.larumbe@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 15 Apr 2025 12:07:56 +0100
X-Gm-Features: ATxdqUFMfgk3LCHq6b_tQhtbniGbjNbES2JG54tU6ZFtUvvi9zS7dF0xh4LyD-U
Message-ID: <CAPj87rNiKyXTO-+2F71ZKU9rTjYfeLKvxxd2bGwZo7tZ=3tjvg@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] drm/panthor: Add driver IOCTL for setting BO labels
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: "To : Boris Brezillon" <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
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

Hi,

On Fri, 11 Apr 2025 at 16:05, Adri=C3=A1n Larumbe
<adrian.larumbe@collabora.com> wrote:
> +#define PANTHOR_BO_LABEL_MAXLEN        PAGE_SIZE

PAGE_SIZE can change between kernel builds with a config setting.

If the thinking here is '4KiB is big enough' (which I agree with),
then just define it to 4096.

Cheers,
Daniel

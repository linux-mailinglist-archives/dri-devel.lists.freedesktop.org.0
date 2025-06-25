Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD07BAE87FD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 17:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5355710E0B5;
	Wed, 25 Jun 2025 15:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="K4ak/GdR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C793F10E0B5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 15:26:21 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-234bfe37cccso469405ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750865181; x=1751469981;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gE8jHxo+PQ6FPeXXY1t5SkeB5q8vcyLGyWcRWobT2vU=;
 b=K4ak/GdRMCFp56TPEnpBx85L/hVekNwB2fLZjbI3V8ckL0Sbo5xdFw5fgxKC2ndgXZ
 NkeQZWzZzEpRTjxCdfIhczgpr74UpCuKo4GbrzhosZVNnPw+df5dBZ6J8Gyxjzry6T6K
 IxlPV96eWPn04wxuCvxfs2vpdcqNXYbjSIyR+p2I5xYNOnQkkfWlsvLtLl+IP4pKKMQk
 zzHBk8ZWSIUgr8HPFAEo2EvtQ6X/s/iVyb21Vk+J6UGuuTTYHm33DJKegdAKA8PDVKP1
 rcFM5WBnkTYBw9iWEzEzGys/6NKatkCg6ABGHTpVj5EtDshw/vovlqiBhD28LkLE6oj9
 y1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750865181; x=1751469981;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gE8jHxo+PQ6FPeXXY1t5SkeB5q8vcyLGyWcRWobT2vU=;
 b=WMRQqc2VaKPXj8ip6kNdwMsH96SNbZ8eAiBB6axZdyZjrO8YXQHEkfGr9ZNKL0zuDa
 D7FdWNSE8PHvztghHr3wio+AqOAcaT/ze1/Jn1l1bPsfMPz/05RF2Cxh4bILSnbdiDze
 CeRGEz1uBoFQO2pKOJMIQi+l7VsmuAR5kadk/zSSegKGbzM4sRKl2JQ9zWqkhsbRtg59
 HgaN7JzbbAo7jx83x1iC8isSN2o4xt1h4or2DhWVPs+vHpAzZQuxX1XDcHFNPmqaCsMK
 D5wLNvvfdXRr9gk9t9xVDt9jNAIQuur5DwXpieiWLyE+ezSD1Nha9hh1umNOgPkmAIXB
 U76w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSQz5Y5477kR5ueZ0WNitEehSlJ9xGpXIb2cGyL7hTz4sb+WZ1LrAYsptxmt3CQbmN2fpQUvIIPeU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoZxkmDVcqCdBaO86+Co6BCL4ztwUKvyfhvsYUYXi4LDLAdEGh
 ZSibFJVtRCndicpO/77BqABvb24TDzZ8JWmFOHiFYcRD7WVPZCHpzEbymVW0srz0/AU=
X-Gm-Gg: ASbGncsLypxpvO+9rM/mP6skRMfxj5EyeQXxkirg5kwkoy63VoOx2IiofVWp0PUd+wB
 9amZ6uxBT4h3IZQM9Eha4tuMMedmUSmAa9KeyY8e0B6ZdWttr4Zj2VhsTAR5tvxH0JYiaQkifPr
 OSkATQCs7Sezx634Hq2sHD9j5t/Kg9CC1qlqxjcQBstcBWcJ9OK7LuN3ySzWpawkJjMnRot8R/R
 TTNgsWp0dlGUYtu9FTNjIt6/s0g8wWf2e7ikJ+g31K8LLedJuYqmPTNuagzcUkopmdEAJMOdQAw
 RpWrgkn/SK7U0TPxRYy10IJPlbgYcZIkSTzAHdQEsVaP7RV+O0XcK1zbQncVIkCVC2GAGDnH8cg
 zLrky+gx9
X-Google-Smtp-Source: AGHT+IHrt+1gjc7s6rRerhB4Z7Hf4zvb7Zi6obxep/7tJ3hlo/78JEJ8gL2cW7XB4z6XD8DMAOJnew==
X-Received: by 2002:a17:902:f552:b0:235:655:11aa with SMTP id
 d9443c01a7336-238243620b9mr62700495ad.39.1750865180734; 
 Wed, 25 Jun 2025 08:26:20 -0700 (PDT)
Received: from x1 (97-120-252-192.ptld.qwest.net. [97.120.252.192])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d839354esm137239885ad.16.2025.06.25.08.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 08:26:20 -0700 (PDT)
Date: Wed, 25 Jun 2025 08:26:18 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 0/8] Add TH1520 GPU support with power sequencing
Message-ID: <aFwVGkAbRUm0j1hv@x1>
References: <CGME20250618102225eucas1p129b1172bf54521c1eb0f718cb31af468@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <aFNrRtbWzeRa7GmQ@x1>
 <12eed587-a8f3-4a67-8808-5e32617ded93@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12eed587-a8f3-4a67-8808-5e32617ded93@samsung.com>
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

On Mon, Jun 23, 2025 at 10:17:36AM +0200, Michal Wilczynski wrote:
> Hi,
> 
> Apologies for the late reply, it was a long weekend in Poland and I was
> away without access to e-mail.
> 
> This is the Imagination repository that hosts the firmware [1].
> Admittedly I'm not using the newest firmware blobs available, as per
> discussion here [2] I downloaded mine last year so haven't tested the
> new ones yet.
> 
> For my own testing, I  embed the firmware directly into the kernel to
> avoid issues with the initramfs. If you're compiling your own kernel,
> you can do this with the following configuration options:
> 
> CONFIG_EXTRA_FIRMWARE="powervr/rogue_36.52.104.182_v1.fw"
> CONFIG_EXTRA_FIRMWARE_DIR="/home/local_user"

Thank you, that worked.

[    1.041146] powervr ffef400000.gpu: [drm] loaded firmware powervr/rogue_36.52.104.182_v1.fw
[    1.049654] powervr ffef400000.gpu: [drm] FW version v1.0 (build 6734358 OS)
[    1.062024] [drm] Initialized powervr 1.0.0 for ffef400000.gpu on minor 0

-Drew

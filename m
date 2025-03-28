Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48397A74947
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 12:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9D610E9E1;
	Fri, 28 Mar 2025 11:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="XJ8lvoRl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C36910E9E1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 11:36:21 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4767e969b94so38494921cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 04:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1743161781; x=1743766581;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ET074EYL50HSsDeaXyGaU0mb+9S3ItW3P13lTFuLZfI=;
 b=XJ8lvoRlg3ONIpwuVmW8jJKi94zUqC1oHYIU+07vtOWVHu+sw5vWAwtsgloRcPD0+H
 +TIYYUTlbKCVAHT8yabUvB0C82hzzF+bXbdpbcxSn73ZAmQ4DZf1jzWc7Tr1uENtBZF/
 BMpgUyHZR+qnINp9K7zlP6jpFiyNJWZtwYUmDFbRbeVDjwU/gAW2/J93TlXl1FBc96Pl
 1sxjjFgIdeYFP9ncSt+x/Y1p3clRart2q2neQRtxlzUhbR2YH/7dJPl6X5VS+oSd8zvq
 KJHkbzwW/tnFt59yd1DbendTB9TczNd5ngp+K4yQfvi7Ijl9KM40tTGy1YgVIvFnfauN
 +zQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743161781; x=1743766581;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ET074EYL50HSsDeaXyGaU0mb+9S3ItW3P13lTFuLZfI=;
 b=w+pJhEDYYvSrTjCExzyTYtzhdDX2jGVDAV3j8bLjKMvZwus+SMJgSqESHx2sAooWtR
 QGRvyMQbrVOSwYC85tj0AwhJA7j0r0TvzsSjK866oEbzJ+7OHTByhxYWUV1hzhiEacGr
 BKuqVHZI4+3z1+SqTU0fhHxOQvOnJg22hJtxfcm1XIQRerQyXJkTcvnhcs82XQY3/gHL
 1IhKk/rFWaajusfgPUPoB7E4T2O05N3dfxTV0YoWXtuffqwKRtT6WkcI2qMJ+Vcz7cA3
 ic1XFA+1ZVTj3BsPWugjvq48nfnAjh0a/KqFlGSjSyqCTReTSJ47b7tI4r1Mf3T+LSYa
 E15Q==
X-Gm-Message-State: AOJu0YwP5M1AI+8r3w/tMEopqMiDuxzqsH9h6wl1zidyEYzAM08Dau6r
 NiwB6tj7J4UaVaAOaFbnEaDRwvJBq1cCg/oUueWSF9ne/swWwWrIvaS2FmihNtkDF3M9U00iknr
 09N3jKmEynypYBbTP7FWGU3aUCpZXrljdO+3fcg==
X-Gm-Gg: ASbGncv8gZYTh7ae3xpEf56D4R6s6vUIlNGrGrFh0nCkw3sFJ0p+1+IFk3N4dSz3KZb
 O5XAREc6TqO6XzwSbmJZqEJz6C/HpKXwIBQ0JkZ8EcmULAckKoOcvX9mFNKpNeCSCEWeX2tZcdL
 hwYrVdLSGBAK7bwMqvt38/lURG
X-Google-Smtp-Source: AGHT+IGgZ+mLJodz0D+guvTqMFLeD09dzf+lw+ubZeqocR8L/AGvkeOetdVLhIiwDUZf+RYpUNyNpa4RIYpozR4orO8=
X-Received: by 2002:a05:622a:2587:b0:477:e07:4c5d with SMTP id
 d75a77b69052e-4776e0b2338mr128707891cf.19.1743161780705; Fri, 28 Mar 2025
 04:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250328110239.993685-1-vignesh.raman@collabora.com>
 <20250328110239.993685-4-vignesh.raman@collabora.com>
In-Reply-To: <20250328110239.993685-4-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 28 Mar 2025 11:36:09 +0000
X-Gm-Features: AQ5f1JqmEJUT3tv3RAXr6WPZW7InZtdLNYmLZ4c8-tZqyom9CaQS986EPYo3Vgw
Message-ID: <CAPj87rOPHqLaFn3r4rkeMMrQ=OSRQUJ2LLrQ4ZDE6eA1S6zybw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] drm/ci: uprev mesa
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
 robdclark@gmail.com, guilherme.gallo@collabora.com, 
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 linux-kernel@vger.kernel.org
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

Hi Vignesh,

On Fri, 28 Mar 2025 at 11:03, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> The current s3cp implementation does not work anymore after the
> migration, and instead of fixing it and propagating the fix down to us,
> it's simpler to directly use curl. Uprev mesa [1][2] to adapt these
> changes. Also replace broken s3cp command with a curl wrapper call in
> drm-ci.

Thanks a lot for fixing this. Sorry the fallout has been so bad.

You can also upgrade ci-templates to get an s3cp which works again.

Cheers,
Daniel

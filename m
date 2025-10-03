Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9C7BB5B45
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 03:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605ED10E863;
	Fri,  3 Oct 2025 01:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yq4daADt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com
 [74.125.224.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA6B10E863
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 01:10:23 +0000 (UTC)
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-6352a77add0so2248852d50.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 18:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759453822; x=1760058622; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nzJCKHPM6QTtA9IBPdOyD8uwo14jSTrua8aQbb7Amgo=;
 b=Yq4daADtQ+FlCd9B616dzu2OtAZQPYaU9v+x4tGDyzolVrocFMkZ7kQkk+eWdZ1Xma
 57g/Fa1zeWJH3NJBo4zPY0vGm9dnYzSs+WWi7ikK+ghOk3lePn+yts5CngRD7F7hwTto
 U0E8aJLd6cQ3Nibn+BEhEL3vrcwVMPmc7qApI0/d3en0dQXpSTWXK2ryGlEBNsQfqMvr
 hMviVgpSRVuOvnyAt9XU52AYlH+N/6uTxe3tvc3ub+ZJoIrunV4SaM/joSKv+VaKUp5m
 3YmFR4DvjXqF01m+yIfah4NgZK3wyF5+aWwAh5BnttPirqqHmsCxzS4/hNc16c5uTmwV
 vang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759453822; x=1760058622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nzJCKHPM6QTtA9IBPdOyD8uwo14jSTrua8aQbb7Amgo=;
 b=oi2Ip5ptUWGaFVnBqcdI1sOOCIYDuhkEwyPfWvsvzVT1Jpn2plw19CVUqLTHltth7W
 Kmgf0bhc+XVlIonHCnD/2RymYZrkbnQc9QnuAY9OW4+YVxSitguaPzV0VctacCsauqco
 hNgTfP5xnYZ0scTyZGnUZj7tuHwExjOsZ0GtUWCJWBPZChxT/RKhcIl1WrBFvln4sJs/
 +wmdPrThgfOy5M9Rgx4PXbRY1g4BAXRc1U6i3r4LEfrQ901j4zHT5BgxYw/THBMXUEYD
 +wb/zoM7yHkzHx1ep+cLMBi5gDuglfUeT6PLgEnOzQJ3+Y/XN42b05C9fGhYz6t+J6uE
 tqWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUag58htx5HGFWX/Xiv6OBOay1uedT39fMpjKF14mOkr3MHJVYoxsbOHBk8ukxCBtfc8vUlmjjzt9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxG3Hh8HsqTrs2aocS87NTE0CR82ZgxLIqQyIKjtj2f0kzbrJU
 M95+qJ+mWOsH1zGE1vFrBiwR1fp4MPQH2TVm2VavClRUtThfJOQonQlf0sAniBuHNVJCquQpqyW
 oKJFLeZdd+wAqRtOAr2YweAoPynaaRis=
X-Gm-Gg: ASbGncv7m7fXK86o8Np3WPdwkCBMCGp/DB142uSjVghUB1qEAtqwf1dyltGr7nUV+1A
 5zPEQZWUV8wvSBhy7wjtVVD4du/rUCePACmF9kecz8S6BvhC5obvsabW2HhR56HMI/e+6ABtKZq
 ug9A2M6AunUK5TuM1ZL3khPbJ5R8JpWg8JIdJG/Yqh9iCsam2DM6huBuV/+YuS/S/o5EhP6UMCY
 u/JU/fTz4QQjwUHAA75yd1yoTifoX51+rDemPbWEWQJa8bqdXrPK6iQkyzpdQgO+VJfu+vF81EX
 Q8UALV/jQVgWC9cpcqRo
X-Google-Smtp-Source: AGHT+IGhFyNovFZudWbgyNTJM1cP5VEKsWyKGRAQ2seKmT9PyVKzUrv4X3nbOCtRIp6kxxbhaVatDZ1dKtcI2bVqXDQ=
X-Received: by 2002:a05:690e:1551:20b0:635:4ecf:bdcd with SMTP id
 956f58d0204a3-63b9a10b36cmr1224818d50.47.1759453822040; Thu, 02 Oct 2025
 18:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250916200751.3999354-1-olvaffe@gmail.com>
 <aNUF6IDneKxjTP5t@e129842.arm.com>
In-Reply-To: <aNUF6IDneKxjTP5t@e129842.arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 2 Oct 2025 18:10:11 -0700
X-Gm-Features: AS18NWCwW3b0IIzlnAbY5dyiwisgJdl6Z6vOCM3TjRgYksz9Lm0FP6Hc8sMWoLs
Message-ID: <CAPaKu7Qo1N4iw+JAd-Kcq0GdAw6u0F83iwPjH-u1u406yxAQTA@mail.gmail.com>
Subject: Re: [PATCH] drm/panthor: add query for calibrated timstamp info
To: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, nd@arm.com, 
 Lukas Zapolskas <lukas.zapolskas@arm.com>
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

On Thu, Sep 25, 2025 at 2:06=E2=80=AFAM Marcin =C5=9Alusarz <marcin.slusarz=
@arm.com> wrote:
>
> Hi Chia-I,
>
> On Tue, Sep 16, 2025 at 01:07:51PM -0700, Chia-I Wu wrote:
> > DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO provides a way to query
> > and calibrate CPU and GPU timestamps.
>
> I worked on a similar patch for Panthor, with a plan of submitting
> it upstream soon, but with slightly different requirements, so maybe
> we could merge both efforts in a single patch?
Yeah, that should be the best!

>
> The first requirement was that it should be possible to get both CPU
> and GPU timestamps, with the expectation that they should be taken as
> close as possible (within 50us).
>
> The second requirement was that it should be possible to also get
> the value of GPU_CYCLE_COUNT register.
>
> What I did is extend the existing DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO
> query in backward compatible manner with those new fields and obtaining
> gpu and cpu timestamps with preemption and local irqs disabled (more on
> that later).
>
> Backward compatibility was achieved by adding new fields at the end of
> struct drm_panthor_timestamp_info, and relying on the fact that if user
> space passes smaller object it will be silently truncated.
I chose a new query because userspace does not zero-initialize
drm_panthor_timestamp_info. We will get garbage if we add an input
field to the struct.

But this is a non-issue if we agree to do it this way, and make sure
userspace zero-initialize before it updates the uapi header.

>
> Obtaining all kind of timing information with a single syscall might
> be a bit too much, when user space might be interested only in some
> data and not the complete view, so I'd propose this as a solution:
>
> 1) Extend existing query in backward compatible manner, by adding new
> fields at the end.
> 2) Add flags, cpu timestamp, cycle count, and duration.
> 3) Flags would be:
> DRM_PANTHOR_TIMESTAMP_GPU (1<<0)
> DRM_PANTHOR_TIMESTAMP_CPU (1<<1)
> DRM_PANTHOR_TIMESTAMP_OFFSET (1<<2)
> DRM_PANTHOR_TIMESTAMP_FREQ (1<<3)
> DRM_PANTHOR_TIMESTAMP_DURATION (1<<4)
> DRM_PANTHOR_TIMESTAMP_SAME_TIME (1<<5)
>
> DRM_PANTHOR_TIMESTAMP_CPU_MONOTONIC (0<<8)
> DRM_PANTHOR_TIMESTAMP_CPU_MONOTONIC_RAW (1<<8)
> DRM_PANTHOR_TIMESTAMP_CPU_REALTIME (2<<8)
> DRM_PANTHOR_TIMESTAMP_CPU_BOOTTIME (3<<8)
> DRM_PANTHOR_TIMESTAMP_CPU_TAI (4<<8)
>
> and DRM_PANTHOR_TIMESTAMP_CPU_TYPE_MASK would be (7<<8).
>
> If flags is 0 it would become
> (DRM_PANTHOR_TIMESTAMP_GPU |
>  DRM_PANTHOR_TIMESTAMP_OFFSET |
>  DRM_PANTHOR_TIMESTAMP_FREQ)
It is more typical to have NO_GPU/NO_OFFSET/NO_FREQ, but I think
handling 0 specially can work too.

>
> For VK_KHR_calibrated_timestamps flags would be set as
> (DRM_PANTHOR_TIMESTAMP_GPU |
>  DRM_PANTHOR_TIMESTAMP_CPU |
>  DRM_PANTHOR_TIMESTAMP_DURATION |
>  DRM_PANTHOR_TIMESTAMP_SAME_TIME |
>  (raw ? DRM_PANTHOR_TIMESTAMP_CPU_MONOTONIC_RAW : DRM_PANTHOR_TIMESTAMP_C=
PU_MONOTONIC))
>
> 4) The core of the functionality would query all required timing
> information with preemption and irqs disabled iif SAME_TIME flag is set.
> Probably we should exclude OFFSET and FREQ from that.
>
> Why also interrupts disabled?
> Recently we discovered that unrelated devices can raise interrupts for
> so long that the assumption of timestamps being taken at the same time
> completely breaks down (they are hundreds of microseconds apart).
>
> What do you think?
I am happy to use your version. Do you plan to work on the userpsace
change as well? Otherwise, I can update my userspace change to use
your version as well.

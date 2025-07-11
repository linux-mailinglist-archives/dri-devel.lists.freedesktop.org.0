Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920D4B02230
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 18:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAFA10EAA4;
	Fri, 11 Jul 2025 16:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="lEy7QUm7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5D110EA9E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 16:52:14 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-234b440afa7so24001595ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 09:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1752252734;
 x=1752857534; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KVqtR2y37+fGKASYTrCFwyYcRTeea2/g0YbtiZzMR3k=;
 b=lEy7QUm7Z/yS4EYVs0fyGd+Rzi34cEx3fG7EG6oUNjlC+49H9t0sGBu9x5QpZKN/VU
 NfGRLSnKf47IhF9QBQqjxywx5RhkEPzBlZ/BS0gvQ0OOTqMottG0O3TqGmNONY3dYnw0
 lC3CehAwhI02Mb7hPWZWXsRSnMZ76JOYSy5NuZPFQ7n4ZUInfLY3K06F4Zukdb0R33HX
 G1yfZqsp3e+EihC21+wHjwgasd0ME1Cm4xN6OQAIjYsqzpbBMMOVvnC+oKz0YE+OeP4Y
 qGGBvKUMU1FxS+Hc8jc3Y9nJmmEipbcQD1EI87akWe/cac9Twt/eM4g286GfYbsEL6le
 6ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752252734; x=1752857534;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KVqtR2y37+fGKASYTrCFwyYcRTeea2/g0YbtiZzMR3k=;
 b=Dv3/TR16oX/No/RgMOqOghfRDvuhjcN+3l3PzKG+MqW75vQTtdXM2TCCZ92Mqsqgy3
 jjuytp8XwZBW7k1vvuQCZ7ghvdpprvgw1UT2HjNmgzBZV/sVsaIC9av2YGgxKsBGYhfN
 reeMXvwS/AKhSqsZnlvBhnR6GFRaY2TYHL4K4kU+W+QQTnouFDBwqaHjI469IxEPIwHz
 juOW1N1Eek85bGk01wALYE2Ciu1Ylpk9CyNTDuOSjxV9dkKOuNO/kQmIbFjFJvntzKCK
 5iufw1TMPgFDMR8TyYvokw60nVvcqce1jA9I4p5dARMfOC4+DWfBvV/+xMyfH5Wl52u8
 0fPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb8dZOlERWKEUjKj3VJ3m4ZXcq1FkadUv0KJ7n528CFAUo8nJfT9CrvoWFTmAElEAooq24DDmGbAI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yww1V7qY33+8NVyM21/wp1ZY+f+geY5zJrdoL8KvdQF154sZroY
 FBQIlOIt+x/nEiu9hlxiZKv5FxJ1HxQ3Pr/ixzsx3kg6LCt2cjOAua98kSaRko103g7022Bt0YW
 /7RIHoTpOOA==
X-Gm-Gg: ASbGncvMZmrGK170KSxb76ZcVRsD1ZNHzOgh4e07H+fSGjhlHkVKnqpryN1lHDzOIHz
 y0bO3G0LVinR3MVNcCzsKUm/MJMC5/3R3BmUAVrrVQB3Ii982MfDREvGfxoMPbFfRHHDW3MNXmx
 Co4NAc/doQZbghqTtvjC35nUKR65S96YB1EnJ03TyWvuIrMWzpogcmVU1dyMDqH+gRAFgJxrcnq
 tH0pWv0xfPctZcsX/VBTiemHhcqYqbFTGW6zBpMlqANs1t0xJSQsHwab5f7bTtVMex0HnCzIbfr
 pnLdC+wu2zSUvayEUvQm2qb8gmF6EMX4iOwOv2z3jliXmHuvUlFswXo1ods6BM0xASk8GmRMJCV
 hZJIGTWd9eXTfp+bIAPCeWKNukqnqzbA/JXhko3h5/GfSmSF0y15ecM9IG2NNdA==
X-Google-Smtp-Source: AGHT+IFEE9XlMRwKHBJYTL+OCkK/RCm+uamu5t9j2AYU1xqcUYxcs3NV8uTPTwgmK1SCkZXUNp0jRw==
X-Received: by 2002:a17:903:2f87:b0:235:e9fe:83c0 with SMTP id
 d9443c01a7336-23dede81d56mr67312185ad.27.1752252734294; 
 Fri, 11 Jul 2025 09:52:14 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com.
 [209.85.216.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4332b0csm49004445ad.149.2025.07.11.09.52.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 09:52:14 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-3138e64b42aso2742870a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 09:52:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVDUymLS7F1+qCCd95f9479k3RYY/fXQ3WXgWo2iAXvQlSZhoHBrTm+GjeIPuCnQChyjACIety4BC8=@lists.freedesktop.org
X-Received: by 2002:a05:690c:fc9:b0:711:406f:7735 with SMTP id
 00721157ae682-717d5d7b900mr75779167b3.13.1752252358549; Fri, 11 Jul 2025
 09:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-4-dc16cfe6fe4e@tomeuvizoso.net>
 <fcb3ca23-7ebd-4f48-92d2-969b24936b9b@arm.com>
 <CAAObsKBiSX0HcxJJjTNGgE4FD4eAYW5wvY=bROtdkZ1mqf_0VQ@mail.gmail.com>
 <a1a93c41-4c21-4b7a-a8b8-5d4e83d73931@arm.com>
In-Reply-To: <a1a93c41-4c21-4b7a-a8b8-5d4e83d73931@arm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 11 Jul 2025 18:45:46 +0200
X-Gmail-Original-Message-ID: <CAAObsKAgmDANvWop-GRAqE6eFRHeQiVHkF1nSwEqyWWY=mdRfg@mail.gmail.com>
X-Gm-Features: Ac12FXx7z145GnPjkDCiCeIztHHyJGSgIFJExInPlpkFTI1qLEtbnsvv5usQDuA
Message-ID: <CAAObsKAgmDANvWop-GRAqE6eFRHeQiVHkF1nSwEqyWWY=mdRfg@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] accel/rocket: Add job submission IOCTL
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
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

On Fri, Jul 11, 2025 at 6:40=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 11/07/2025 5:00 pm, Tomeu Vizoso wrote:
> > On Tue, Jun 24, 2025 at 3:50=E2=80=AFPM Robin Murphy <robin.murphy@arm.=
com> wrote:
> >>
> >> On 2025-06-06 7:28 am, Tomeu Vizoso wrote:
> >> [...]
> >>> diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/roc=
ket/rocket_device.h
> >>> index 10acfe8534f00a7985d40a93f4b2f7f69d43caee..50e46f0516bd1615b5f82=
6c5002a6c0ecbf9aed4 100644
> >>> --- a/drivers/accel/rocket/rocket_device.h
> >>> +++ b/drivers/accel/rocket/rocket_device.h
> >>> @@ -13,6 +13,8 @@
> >>>    struct rocket_device {
> >>>        struct drm_device ddev;
> >>>
> >>> +     struct mutex sched_lock;
> >>> +
> >>>        struct mutex iommu_lock;
> >>
> >> Just realised I missed this in the last patch, but iommu_lock appears =
to
> >> be completely unnecessary now.
> >>
> >>>        struct rocket_core *cores;
> >> [...]
> >>> +static void rocket_job_hw_submit(struct rocket_core *core, struct ro=
cket_job *job)
> >>> +{
> >>> +     struct rocket_task *task;
> >>> +     bool task_pp_en =3D 1;
> >>> +     bool task_count =3D 1;
> >>> +
> >>> +     /* GO ! */
> >>> +
> >>> +     /* Don't queue the job if a reset is in progress */
> >>> +     if (atomic_read(&core->reset.pending))
> >>> +             return;
> >>> +
> >>> +     task =3D &job->tasks[job->next_task_idx];
> >>> +     job->next_task_idx++;
> >>> +
> >>> +     rocket_pc_writel(core, BASE_ADDRESS, 0x1);
> >>> +
> >>> +     rocket_cna_writel(core, S_POINTER, 0xe + 0x10000000 * core->ind=
ex);
> >>> +     rocket_core_writel(core, S_POINTER, 0xe + 0x10000000 * core->in=
dex);
> >>
> >> Those really look like bitfield operations rather than actual arithmet=
ic
> >> to me.
> >>
> >>> +
> >>> +     rocket_pc_writel(core, BASE_ADDRESS, task->regcmd);
> >>
> >> I don't see how regcmd is created (I guess that's in userspace?), but
> >> given that it's explicitly u64 all the way through - and especially
> >> since you claim to support 40-bit DMA addresses - it definitely seems
> >> suspicious that the upper 32 bits never seem to be consumed anywhere :=
/
> >
> > Yeah, but there's no other register for BASE_ADDRESS address in the TRM=
.
>
> That only reaffirms the question then - if this value is only ever
> written verbatim to a 32-bit register, why is it 64-bit?

Ah, sure, it will be 32-bit in v8.

Thanks,

Tomeu

> Thanks,
> Robin.

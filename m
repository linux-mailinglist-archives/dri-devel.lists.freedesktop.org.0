Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5CEB22774
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 14:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1582B10E149;
	Tue, 12 Aug 2025 12:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="oW4rWXYR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BEF10E149
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 12:54:09 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7e806613af8so630173485a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1755003248; x=1755608048;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2WtksxPDLT/0y+3eZjc8hEFOkmY30/S+XOZ4ZbmRdMw=;
 b=oW4rWXYReanlPdDH+339XbD3t9AH4yWBQlO9KQLoAwgnSxVnA6+pnToi5S6wy4Rqyj
 Kbvh63YxdTFxGrMFKh0FzQ0/MGSWjN3QcTck/U9EQOVf6tVBRu5jbJ1pKLWuXVGrBP8b
 0thFUMDSaxWl8aS7DAuhn8bAnL12KP2Y63jLLBHZZ00UN9rx75ioFD2ohxKFp/kP2nOx
 mPFktb62hQF9aAV5xceIPGg5ubFb7+b1/tT701lNylYeBLr9hkCHdEe3tPnbLX+xh+MO
 WUtq/QXGZdvnyoQe5/tR91FEX3seVSg2CLowhaOx5djQi0rSL6MfizTyhA3sN2KoqD3A
 rd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755003248; x=1755608048;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2WtksxPDLT/0y+3eZjc8hEFOkmY30/S+XOZ4ZbmRdMw=;
 b=pf57c00pFElcNBTwuvDmde3ZRDnRYwu9e6bEDggtMm9uxWb0tyEHeO+KCVit5s0P4G
 QPqoa6znVZntmqgY0LhwPwkexJlyx6H8hhwTmpISjHqauzWTEX/Pkpf9if+vjoUf3xr3
 3FJ4XFuvvBcPoetSACNc2vCxeA0RZHCJOmri2xc7pPImeQ3zUaHfPL0SttjkLwPhKDPO
 O0KJOGrflAGxgzIqn/VR4pOT8mPMFElUjf7HankzsWRFty/FwOMYknuBGXj2whht4H4h
 KkOXe8ruOOsmM4RR2DXMZHA30+lsLA1E4XEAFkftjQC3g563QK09kuIuDLxchCpNn4Eq
 1GvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSrWia6TUr5slSv+ujy0KpVBZdAZYMc49IaIfMyPluzPaEq/L3+eobNBPPekfZvIdJ30Ia3vGCX+o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxudOPMUuRfQZ21SMz2pUH478p8qXDh/ZWwrgUlKGbELB3CIIk8
 Jypg0f9qrNOHuk+NjffT5upWlKQvSNnbi12nvux7HzH0oEsAnAigwGmWwmQD0t+SIIMLRsIETxa
 N7GHCcrpzH42ABXPBNDZ5z7+S8ZYav9BjEBsb94BFgw==
X-Gm-Gg: ASbGncsH+in6J97AuzLrlLlnar8ks0UALhFghEYQIEyWgwFKo/B/tgSMpLN8otccesD
 /PL5tiv+0W5xyr6DRt7AyqQ9Iu5is+CylebsoIZ2+0Gbm4LRj1ULYZkXvaQY+GoCc2zZbVq6TWW
 Xmvo6r6iuLwXp/MJW2TBEfz/KhBxWz52J6oets7MoQ2htFXXqZodS9QvzFCnuya9xsfjz/oMp9U
 ZXsjREX7T8jErlgT947gle2bBz9VfsG0RrYLIaWvg==
X-Google-Smtp-Source: AGHT+IEigi3eT3slvsaqaQxfpzA5/X/BpBps7n3zcMZvnFhGp0J3xR5YD/W1WjO/6HkGh5ZjKB8p2S+Mbi6DGKsspO8=
X-Received: by 2002:a05:620a:a117:b0:7e6:50f2:d62d with SMTP id
 af79cd13be357-7e82c616e28mr2406978785a.5.1755003248102; Tue, 12 Aug 2025
 05:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-ethos-v2-0-a219fc52a95b@kernel.org>
 <20250811-ethos-v2-2-a219fc52a95b@kernel.org>
In-Reply-To: <20250811-ethos-v2-2-a219fc52a95b@kernel.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 12 Aug 2025 13:53:56 +0100
X-Gm-Features: Ac12FXy89rNxCKeR5zfeZeSe2T50SLXSk1IHDgjCBDBFp3HnioWFlDD6e2e-kGA
Message-ID: <CAPj87rNG8gT-Wk+rQnFMsbCBqX6pL=qZY--_5=Z4XchLNsM5Ng@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] accel: Add Arm Ethos-U NPU driver
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
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

Hi Rob,

On Mon, 11 Aug 2025 at 22:05, Rob Herring (Arm) <robh@kernel.org> wrote:
> +static int ethos_ioctl_submit_job(struct drm_device *dev, struct drm_file *file,
> +                                  struct drm_ethos_job *job)
> +{
> +       [...]
> +       ejob->cmd_bo = drm_gem_object_lookup(file, job->cmd_bo);
> +       cmd_info = to_ethos_bo(ejob->cmd_bo)->info;
> +       if (!ejob->cmd_bo)
> +               goto out_cleanup_job;

NULL deref here if this points to a non-command BO. Which is better
than wild DMA, but hey.

> +       for (int i = 0; i < NPU_BASEP_REGION_MAX; i++) {
> +               struct drm_gem_object *gem;
> +
> +               if (job->region_bo_handles[i] == 0)
> +                       continue;
> +
> +               /* Don't allow a region to point to the cmd BO */
> +               if (job->region_bo_handles[i] == job->cmd_bo) {
> +                       ret = -EINVAL;
> +                       goto out_cleanup_job;
> +               }

And here I suppose you want to check if the BO's info pointer is
non-NULL, i.e. disallow use of _any_ command BO instead of only
disallowing this job's own command BO.

(There's also a NULL deref if an invalid GEM handle is specified.)

Cheers,
Daniel

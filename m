Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A004EC607
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 15:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7003D10E1B1;
	Wed, 30 Mar 2022 13:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38A610E1B1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 13:53:00 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so22131066fac.7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 06:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XEDH3Ron47cWidh3u3C0pLHbk/HOKW30GMSsA2rjs+A=;
 b=oMerYQDRJN3V+D/xHFp+NMo2jbct+fHyq+w9viD+TyFQr29dP+8zT/RLSWljtS/ab6
 OuX1aKsH/5H07aw88anf1Ng8Pxs27yEXfdCj+jadkXn9GuRtYfs+GCZIIsPOuwNCVf7J
 mrFvO28960CFSTLQq1PhUzItD43eKLujze+ECs+dz6Ou1cJOwyM7LH5fgDFqSwc8bV1m
 TI+SHeFTSK7Aansm1z/AyK+LVN4j49nZhPHboa/2VsdI8hcyt+9rEaaqX0DRKyhSV/0o
 mM5SLU/YVQDvDsztCmNhonDzzaTnTFzhpAkpLoCCUUZje+D+bVx0JE4dN/faBv/ZS2cc
 UZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XEDH3Ron47cWidh3u3C0pLHbk/HOKW30GMSsA2rjs+A=;
 b=QRL4HE16yITlYjzezHTgJvK31LxC1IoCCLz/zZEcqxsnS4pARSo3OQoUS7TFR3RMGi
 AmxRX6iLUxmZOoQK+dJ9cF/hx53pBLOp1UouQYoMPrhyVKm++KvEVhrzSeh6JZ8b76pz
 SBeugWypkTdEX9+1qdP0PZmvljYtIbV8OBcVoOvR/WSXfgZMS45p01HQ0wNJbVlI71mG
 VJ1+rK4VFLp929hryYQfirF3NohCBoJdvw2wD8k+u7IoqwLWhayFF3jt/nM3FHuogZu5
 Y6GH61uhLmm9JGg1aU7aXrqxONGFEbc2i450jOahLRRb1GeUo9w+iPbvtxMmhf5U8vbN
 P1mw==
X-Gm-Message-State: AOAM533Wk8QKEfF9pVRXsV1xwfCRRFiKxKpduw6+9UtY9t8jnsWVe+LR
 3LAPVJxXSty9cE60XZwomeWt1jEppeAIwu1wCBZyWecIOxU=
X-Google-Smtp-Source: ABdhPJyrvYU9uXbbPMRhJROwZpCKHTAFiCLNSyv4B5cUM3dmVDIqHcF+S+ePzVcp6jl43RcNrjshKc13dN74rTrWAuM=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr2219888oap.253.1648648380057; Wed, 30
 Mar 2022 06:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-3-tzimmermann@suse.de>
In-Reply-To: <20220322192743.14414-3-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 30 Mar 2022 09:52:49 -0400
Message-ID: <CADnq5_MHn70te2yGjF4CQsQb4kD36uQ1_wEeQ=+kLdTQwOT9yA@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm: Rename dp/ to display/
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 22, 2022 at 3:28 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Rename dp/ to display/ to account for additional display-related
> helpers, such as HDMI. Update all related include statements. No
> functional changes.
>
> Various drivers, such as i915 and amdgpu, use similar naming scheme
> by putting code for video-output standards into a local display/
> directory. The new directory's name is aligned with that policy.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

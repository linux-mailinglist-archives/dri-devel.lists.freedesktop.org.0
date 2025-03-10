Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3D0A58E0D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 09:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FBE10E1B2;
	Mon, 10 Mar 2025 08:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="Szc0BuY+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE14D10E1B2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 08:23:43 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6e8f43c1fa0so43966876d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 01:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1741595023; x=1742199823;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ivx/6EEyCTtnvCErNeMLytYw3JO2KfbbSfvqVn7RN1A=;
 b=Szc0BuY+h36P8nqGferUHNofAxcSbUUGZRbYa4rdpAvDdITEBmmDPGXxn9V/BetZj9
 WUFrNEwG2UTFm/xD7aWZfhTc37RhMikagptMq4p+14zIA8teGiJj1bl5tOlCrRZClVJC
 4TbOh6yRN7sgIFQ6YPkdymWhi74DdgG3IbPdyfzqJJRB/KeIsE7lV7jkMJ45rYGMmPE0
 dKidYLRuUfLlr6/HUiJJ1cPdgGuGGd7E0c/Ihkxefu8Lp4JGWwU9q+5hQ5cl2b0Pmw5q
 C5JdHkqJbPWd+DOMHX2DHwMjhx5OM/4rju+hEaFw2By2hYgD3wC6mZpcAUGHKhUPuZCP
 iSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741595023; x=1742199823;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ivx/6EEyCTtnvCErNeMLytYw3JO2KfbbSfvqVn7RN1A=;
 b=JZDOJPciI2vpvVEQV4XWpLY/fzqCIOta5PfdAKDirlO7YQhKdxwlLkZ3R8hddlFAKD
 6uMP3jMKOY4Zq5frAF+MGuDXVK0U4wQXUoloCmBsjtAD9mWa3HOnJQw+OuGegGzJ4v5o
 mlmzBS71f0gAMO58MwpZGLBgYw7W263PSSnBDhxU3lWQR/RtRO+1FffiigOsbIL/6b8e
 VKdM0qNUfTy40chc7De2uV9NZjtgkFIe+/MJhhhULB13c3Yzz1VAmJ+LSCBgDPTME2KM
 NrpWLEXDOShV9bnLLnsEtDp/iEOnzaJq9nmHDbTi0T4/EkKpKsbYrS87cVYn/EHBWWiX
 im5A==
X-Gm-Message-State: AOJu0YyKxZeAXYrSxbk+gZMXgEtM3jwuzDHX7WTSxEYfJveYgyxwRXCc
 XMfJf5dgalW/O2vEG9nuWunhdKcfbSuTICORJMVuncf7AmaycHpzdWPqDHDc+3vHlTjFPxCVVCL
 Aa36GH/yZye9hB+9eWYqC5Hv56FjyfQ3jkyr+5mrepB306rws7Ps=
X-Gm-Gg: ASbGncvT3eXJhNkpRZyinSs3B2dB0zRIpCyxFIWMR9/MS9QeOsj8dTkTCuTKrJH2hJ1
 Rqp77DYeam9Oa+K0STw6D1RYsmf/iKp5jHTcjF74sMrZtGcDZQwO9G5yHkjYpeXCZfOcC3cYgwD
 U5Q+UbCP8RiivNdFxaA+QGnx4o2HE=
X-Google-Smtp-Source: AGHT+IHX/ie+SCwilG9VkCigXT7dVOX7s13SM5HyamqcMyXKzLgr5BlSUTLW598RuV9I7TxHm+K7rOgy8bC/hIiXpus=
X-Received: by 2002:a05:6214:da9:b0:6d4:238e:35b0 with SMTP id
 6a1803df08f44-6e90060411amr182729926d6.17.1741595022743; Mon, 10 Mar 2025
 01:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250217053719.442644-1-vignesh.raman@collabora.com>
In-Reply-To: <20250217053719.442644-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 10 Mar 2025 08:23:31 +0000
X-Gm-Features: AQ5f1JppnRfUR_zOw553KNwUL6uzyjdZezy5exd4nob7qrMJgxJe74M-TX4Aplg
Message-ID: <CAPj87rNUMDMUtrfV=8c_+T5VQ0FykjpR5JW5dgO4grYXpabSdQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/ci: enable lockdep detection
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
 robdclark@gmail.com, guilherme.gallo@collabora.com, 
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
 jani.nikula@linux.intel.com, dmitry.baryshkov@linaro.org, mripard@kernel.org, 
 boqun.feng@gmail.com, linux-kernel@vger.kernel.org
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

On Mon, 17 Feb 2025 at 05:37, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> This patch series enables lockdep detection in drm-ci. Any lockdep
> failures will be shown as warnings in the pipeline. This series
> also enables CONFIG_DEBUG_WW_MUTEX_SLOWPATH for mutex slowpath
> debugging and refactors software-driver stage jobs.
>
> Test run with this series,
> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1366054

Series is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

Please merge at will.

Cheers,
Daniel

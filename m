Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4218EA58E18
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 09:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FBE10E039;
	Mon, 10 Mar 2025 08:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="Z/IbNpx5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3910F10E039
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 08:25:18 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6e8f06e13a4so42959706d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 01:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1741595117; x=1742199917;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WFCjD2pm91x2pAYsF6fwnsfs82FVkPEy9qzGMpxtJ6g=;
 b=Z/IbNpx5VMQjSAJ8zWLXvAgoJq4dSSyUiz0zwS1+hI7ByftrMmcUrfG6KYhjywbt7S
 sf6MgLP2MgDjJpp7FoXHhus683zoEhY34ZnSXqcwfv2TR+jV8tUXZbOgijyr9/kqZLhy
 L7IlQdDFa7S3G4zntxTr7wZZ7zzNvjuIPJFTCzcAFmJoYHTvcAVk5O4XpwIEEL3eTquj
 X5fr9zKGb7Uf/NoJQHpYJdFSsPzV72Q7iY2+I0MbVRejwZTV/PJ9MZPGeGrNF3rcKv4e
 /XMpal6rdk9K/XNi+VAeSErX/6P/CoOMG23ER80HnvOm+AKLZ8m/Y8tz2ksCo6a1Nohl
 3u8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741595117; x=1742199917;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WFCjD2pm91x2pAYsF6fwnsfs82FVkPEy9qzGMpxtJ6g=;
 b=oQp24eiZ0C3vBw0YyQliJIF9GKp8UwHQTXzrJ2o1BmqNmvu7uq7JCJrTr8ToMxXvb9
 Cy7+wxWCc0Dxv0/egtlg8/UzlPtUCqK0mitGM5V6k5rpWmZ6fMj2ENiWOVM3Zfc8Jr5Z
 FXNsRHkGUYIREJWjRNuvVYn6Y1Gxv0CDL/Z4DgUQys17nXsiPNbTfQFLg7WriOFXVkCl
 cUPwXdkkell2Bd7c7MbJHkfdVLag7hJkBN6KhdZOWrH3WEwY+WB0RFrPvBvLk04LG7F4
 Sm/n8vaG17HORpPJT9MNPGU00WwDfT34AqrFqnJV8cR5s9M4DpkyjUor8wZXP48BHdFl
 DilQ==
X-Gm-Message-State: AOJu0YzTfgy87+tndYdwfsmVy5I5gr3iIZ7E54a+jcce14KfHjlTr7NA
 WoUiX8KIWGIHjBZZcAjlg6tIibffkFsCMNMq8CPLLYvka0m1kv374ZTvOY1e0A2m5nxIvpQCVtt
 8/pcAMt54qfpt9hZi/I2byrK2ZkvbqxsfTjznCQ==
X-Gm-Gg: ASbGncuZogkSx7bshVx2N4YR2/LEyThojW/xYfLDEG8ilHhRfZ7a2C8ncsM0crGEGZR
 WriY6RqvGhX5N4SBLoYCjMytCbiZm/52rtq8ACyhUl6oNOCfeSSSaj4gODQdUMI2zheP/EWmsfv
 c0CKzaT7h2msY8I0mmXpDxYFUoBwY=
X-Google-Smtp-Source: AGHT+IHFjOxvl1xVryimBup4mUSkgrxpkGXnTbpi/hekfI6Ejselp1PBPQEXjo6x+XS6KiTsDhXEHPG5Wdrkd2vigQE=
X-Received: by 2002:a05:6214:c29:b0:6e4:4676:85c3 with SMTP id
 6a1803df08f44-6e907cda399mr121581226d6.11.1741595117305; Mon, 10 Mar 2025
 01:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250228132620.556079-1-vignesh.raman@collabora.com>
In-Reply-To: <20250228132620.556079-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 10 Mar 2025 08:25:06 +0000
X-Gm-Features: AQ5f1JpOKKkQYeVyyUZcg7jIKsetRzi1-yUgZnliBUsBYObogvANsBD9Fq2UZPw
Message-ID: <CAPj87rMqHWtovJy82WXuJ4ZsKg3PbD7Z4hX3kzOYpUyrrdxE2g@mail.gmail.com>
Subject: Re: [PATCH v3] drm/ci: fix merge request rules
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
 valentine.burley@collabora.com, linux-kernel@vger.kernel.org
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

On Fri, 28 Feb 2025 at 13:26, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Merge request pipelines were only created when changes
> were made to drivers/gpu/drm/ci/, causing MRs that
> didn't touch this path to break. Fix MR pipeline rules
> to trigger jobs for all changes.
>
> Run jobs automatically for marge-bot and scheduled
> pipelines, but in all other cases run manually. Also
> remove CI_PROJECT_NAMESPACE checks specific to mesa.

Thanks Vignesh, this is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

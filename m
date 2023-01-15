Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB4066B222
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jan 2023 16:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF5210E37E;
	Sun, 15 Jan 2023 15:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C97910E37D
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jan 2023 15:36:17 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 f5-20020a9d5f05000000b00684c0c2eb3fso5837596oti.10
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jan 2023 07:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pRCLnfO5D50aLUIqRH3Be5ElBGG7mevjFvkDgjByEkg=;
 b=ESYN/lgtsCJz1vk5hIWF8P0XT3zE4HOkfbCef61dEh9nfpUszGpqaILDdbRYwRpBaS
 Gq0n3cdms6iw0aRSFDJpioaByPmQbKCQP0DMmTGvyCsapfKPYKjs4KTwwNR87Zitspdn
 tniK5INo56zs/GSaaJc39/v4ceiIJC1pB59guwU6dk/ST7wHrW1GsjBxDt0fMLpUe9Og
 1v9Whb4AApgIKVhjQbVH2MHL30mD29abfoMS+VPtLoheVkY7LhOupZe8UcHafZllZEmR
 Q02XH5CuaiXHw9on84tyYVxbzt6ZWhdpxJ/RGI0Gk5dJ5RFTO2+nukuT+lKm/LaCi8GD
 Tvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pRCLnfO5D50aLUIqRH3Be5ElBGG7mevjFvkDgjByEkg=;
 b=KgJuEFmatd+d2iUaH5qOzBNtmEgRqZQmqVNu8HWbhIKafnTZC0U6WP6yri+mozxxFk
 HLtJdpEbi6KN3UuAtvFxWadQ/budS1eHPCkAyYRv72pqnMujUFiMvPHwBJ6Usj0ApYEN
 IOZXraDe06yXCSRaHrBfiL8CelN5xuVI+6HPvaQAfmtGSKXwnCVfLbnNmGQfyoJZNObO
 ta7S9mgYcK8mMjWTvUi5cxSQ+ryMT/gA7v2Q7xxOz/Qre+TwnpaTPM+r5eI26y6J/Pzl
 CrRGgoiRMtKMPri7SFhO+lWcvZIysy2Bn5xMgtU57N7zQZRcxlTM02gMhekBYUnaBrY6
 MqaQ==
X-Gm-Message-State: AFqh2kolgpOU2Bo3BZl7Ispce7afpoc2K+sjvKZDUMJ5cv3dcavFwxJf
 ACltXxx5kwTY2gF8BVuWkMllkKRBx5JVq/k74K0=
X-Google-Smtp-Source: AMrXdXu/zET195jKhsFTVp5xxmwIScKWmACgEKUi1QrBdrbk6v28T2qMy0jJBHOkkSBc+MnjFZnNZuARMBSt9P0VdRA=
X-Received: by 2002:a9d:489:0:b0:684:bedc:4f54 with SMTP id
 9-20020a9d0489000000b00684bedc4f54mr837621otm.233.1673796976794; Sun, 15 Jan
 2023 07:36:16 -0800 (PST)
MIME-Version: 1.0
References: <20230114194741.115855-1-sj@kernel.org>
 <20230114194741.115855-2-sj@kernel.org>
In-Reply-To: <20230114194741.115855-2-sj@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sun, 15 Jan 2023 10:35:57 -0500
Message-ID: <CADnq5_OUnkzoZcCdW0X-=gJsXSRgY=GLrbmfNj0geDCzL5a7eQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Docs: Add some missing SPDX license identifiers of
 subsystem docs
To: SeongJae Park <sj@kernel.org>
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
Cc: linux-hwmon@vger.kernel.org, alsa-devel@alsa-project.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Jean Delvare <jdelvare@suse.com>, linux-crypto@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, "David S. Miller" <davem@davemloft.net>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 14, 2023 at 2:48 PM SeongJae Park <sj@kernel.org> wrote:
>
> Some subsystem documents are missing SPDX license identifiers.  Add
> those.

It would be good to split this up per subsystem.

>
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  Documentation/crypto/index.rst     | 2 ++
>  Documentation/driver-api/index.rst | 2 ++
>  Documentation/gpu/index.rst        | 2 ++
>  Documentation/hwmon/index.rst      | 2 ++
>  Documentation/input/index.rst      | 2 ++
>  Documentation/mm/index.rst         | 2 ++
>  Documentation/scheduler/index.rst  | 2 ++
>  Documentation/sound/index.rst      | 2 ++
>  8 files changed, 16 insertions(+)
>
> diff --git a/Documentation/crypto/index.rst b/Documentation/crypto/index.rst
> index da5d5ad2bdf3..95b0870e09b8 100644
> --- a/Documentation/crypto/index.rst
> +++ b/Documentation/crypto/index.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
>  ==========
>  Crypto API
>  ==========
> diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
> index b208e0dac3a0..7a2584ab63c4 100644
> --- a/Documentation/driver-api/index.rst
> +++ b/Documentation/driver-api/index.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
>  ==============================
>  Driver implementer's API guide
>  ==============================
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index eee5996acf2c..ff06a6b12c5e 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0

Most of the DRM code is MIT.  I'd expect this would be MIT as well.

Alex

> +
>  ============================
>  GPU Driver Developer's Guide
>  ============================
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index c2b3c1a822dd..2186d732654f 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
>  ===================
>  Hardware Monitoring
>  ===================
> diff --git a/Documentation/input/index.rst b/Documentation/input/index.rst
> index 35581cd18e91..d60bf9cfe005 100644
> --- a/Documentation/input/index.rst
> +++ b/Documentation/input/index.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
>  ===================
>  Input Documentation
>  ===================
> diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
> index 5a94a921ea40..c4e9fbacaf38 100644
> --- a/Documentation/mm/index.rst
> +++ b/Documentation/mm/index.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
>  ===============================
>  Memory Management Documentation
>  ===============================
> diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
> index 1aac972a652f..ae0229f5a9cf 100644
> --- a/Documentation/scheduler/index.rst
> +++ b/Documentation/scheduler/index.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
>  =========
>  Scheduler
>  =========
> diff --git a/Documentation/sound/index.rst b/Documentation/sound/index.rst
> index 5abed5fc6485..7e67e12730d3 100644
> --- a/Documentation/sound/index.rst
> +++ b/Documentation/sound/index.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
>  =============================
>  Sound Subsystem Documentation
>  =============================
> --
> 2.25.1
>

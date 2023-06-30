Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCA5743557
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 08:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC8110E105;
	Fri, 30 Jun 2023 06:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4425C10E105
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 06:52:00 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b69f1570b2so24649511fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 23:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688107918; x=1690699918;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cBW2ODM2guWVZdVNnU/ZES/eGWsE5AoCM8ERdHN+G5k=;
 b=nc8+oxUWp5DFHwbTo0NYizKyGgQgFkvBhDxNPNUsX8fFlcDRgc0UjitbA/WmZT5gGt
 AQpS5FWCMK0OPMWi/7kJHZs/8o2YooPQP6kUMt/8T9wLWfZoRhawJhk6Vl9H+wPbanba
 90z5RH1PDVJZr190f6x7kcWYHbjz4Yp5G15QJe1ZYcylHcyuB0I23QmyQhYnKo+HqcNT
 fLUX0hFlqLU5O9M9YVGb95bdksWjo5UDmUoHS0CkDhSYf7LBQJnLrJjJarrcS/JQfmLL
 L7dMPM9wiKNu4234i+W6K2e/iSSiyLJ4qVIP4xLpW6liN0iH3A26PS/qRWaZ+yCmuKRm
 rs+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688107918; x=1690699918;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cBW2ODM2guWVZdVNnU/ZES/eGWsE5AoCM8ERdHN+G5k=;
 b=YRB+RKuwyIjUE3J2KGtIjxKX5EgsiZjPChqy5UhvZwr3urqehKbnev8rMR3IHHiP0a
 auPZaDYgNQMxUWojPCokucKN7blic54+EBlxSLLxdFANsve0ye6dF105ZSVtMV/qqeaE
 EazJHylcd1fLah8OattByn+OfjCLTnzffQG2lRGHjiuSpYrRx/jQb+f8D64oPCERwHF9
 z3sNlrPnRL7vvznWcRNzJNHMv8WS69srtYw9auoQcEms+9NyM7kzIALTjyk6U59RVeul
 JftiDif1+Qt9O+qCUMhRAfPzZz9KQcAsy0hdq+fnT7N5S3gg7iwete+EQRATcEz3LuXG
 8yrg==
X-Gm-Message-State: ABy/qLahLsoMsCRqhyaf2PvFRQ9cGgLmMGNR/tXoIsmwbDhD86SM1lUk
 0cqwVsnk8EddZF1A04C8DkYUySjyAUeY5jB7gezojQ==
X-Google-Smtp-Source: APBJJlHNp8Ainsp3NPDijOl5zudm1amCzUpI/b6OsWN0NSoMe20xSzSBReBYTUzp2a7lNP1NV1Z5kJiY4LeNW3XdO5k=
X-Received: by 2002:a2e:8e8d:0:b0:2b1:ad15:fe38 with SMTP id
 z13-20020a2e8e8d000000b002b1ad15fe38mr1273612ljk.3.1688107917676; Thu, 29 Jun
 2023 23:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <CABdmKX0A8mqz5cS4+CqjRgpQQKuSp=3SvE1KJ_di09VjJQVoGg@mail.gmail.com>
 <20230630045246.1674919-1-jstultz@google.com>
In-Reply-To: <20230630045246.1674919-1-jstultz@google.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 30 Jun 2023 12:21:46 +0530
Message-ID: <CAO_48GEtT_rG=7aDG8g7Eosu0RWqzuNqGwsW7ODdomwu=ekafg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add T.J. Mercier as reviewer for DMA-BUF
 HEAPS FRAMEWORK
To: John Stultz <jstultz@google.com>
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "T . J . Mercier" <tjmercier@google.com>, linaro-mm-sig@lists.linaro.org,
 kernel-team@android.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

On Fri, 30 Jun 2023 at 10:22, John Stultz <jstultz@google.com> wrote:
>
> T.J. has been responsible for dmab-buf items on the Android team
> for awhile now, so it would be great to have him on as a reviewer.
>
> Cc: T.J. Mercier <tjmercier@google.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: John Stultz <jstultz@google.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: kernel-team@android.com
> Signed-off-by: John Stultz <jstultz@google.com>

Thank you for the patch;
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

I'll push it to drm-misc along with the one removing Liam.

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cb075f52d97b..f4e92b968ed7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6184,6 +6184,7 @@ R:        Benjamin Gaignard <benjamin.gaignard@collabora.com>
>  R:     Laura Abbott <labbott@redhat.com>
>  R:     Brian Starkey <Brian.Starkey@arm.com>
>  R:     John Stultz <jstultz@google.com>
> +R:     T.J. Mercier <tjmercier@google.com>
>  L:     linux-media@vger.kernel.org
>  L:     dri-devel@lists.freedesktop.org
>  L:     linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
> --
> 2.41.0.255.g8b1d071c50-goog
>

Best,
Sumit.

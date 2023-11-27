Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E627FAC30
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 22:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E195710E30F;
	Mon, 27 Nov 2023 21:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936EC10E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 21:03:56 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1f0f160e293so2854382fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701119036; x=1701723836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5FpdA9y1oGjTW/vSBX6kHFKxLWeDXM0x25Dn1KtBKzY=;
 b=DYrw4fgy7SHEcqWlj9KI0jZPDUp2rvfHkFauYGV8/UkMA0MGg9OYyiGaCjxXxxdybf
 /flAfy5dDn3++CQsf4jn0bH0ExVZkmOauZnBOshedWoED53JGXkcqNDQO2IASTXvr3MC
 lfknASmEVwJ4AQWRf9oOdwRBOPUswQMcw3QtpRWDR8Vxr6cWBGrVTa4vouyylLXHYFaA
 5wPKSisO5/INpBjt4QxgLiG5BFWnqROPAbrpA4YiuvWlvMyEE5U/+o5WKZXKeFn1G21Z
 jkOHElHzLIdFWfUbwXT82irBO4Hhcgz+KB44Ccg8aeiIdd0RUzYns9jrFkw2aqDIkqsW
 EVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701119036; x=1701723836;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5FpdA9y1oGjTW/vSBX6kHFKxLWeDXM0x25Dn1KtBKzY=;
 b=ON/u22ojojkmNko3DjhZlQUm2jfOwjG4xqwDhCuJUNQXHPEGYOKn0boJrhBUFPpMkB
 uUeks5SfG5eIM4UGaEiVkwSIoRYgdk0QiQE2aQ2fMLje1+pUPyKoBCSaKBsUDHvULIZR
 zRNAOwEXAhvp1j1Ie0HBXEiT5S5bn6lKbZ0sdg0Kc9AhPMw3q4CpJqkpdw9I0Uyigm0R
 YoYp1y09hb/kZDMUXHOpyPpEkfodMzKdM6lRZsAHU2QfUArSoAM+ZYF6NxWLUdO+2bLw
 B0lb85l3KA1nYLIpQfcCXmJVEDje8hqAeCybzmvOtsTAWZ/yA0V0aHYdYgxYAcoMblyJ
 j8BA==
X-Gm-Message-State: AOJu0Yyko37Fmqj35rdrRg7EhtrETPiKqxgAQNWALFWnZPCm6mCXMnmO
 CSDalxlH1Yui62n58bXveqeWwsQI5avEu8CxaNI=
X-Google-Smtp-Source: AGHT+IHaDDlaTvkLDns0b/a9P5AXahWF4AyJB9lPR/qYNYn2sO/bLXinVSFE21uOQZevIW5uBB5awRqcybN+3iY9rpI=
X-Received: by 2002:a05:6870:6488:b0:1fa:1f05:6526 with SMTP id
 cz8-20020a056870648800b001fa1f056526mr12484003oab.44.1701119034244; Mon, 27
 Nov 2023 13:03:54 -0800 (PST)
MIME-Version: 1.0
References: <20231122122449.11588-1-tzimmermann@suse.de>
 <20231122122449.11588-6-tzimmermann@suse.de>
In-Reply-To: <20231122122449.11588-6-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Nov 2023 16:03:43 -0500
Message-ID: <CADnq5_NGnss7+687YFyyekUSi4aUKLuKL0-9U52ivW9CSZBaOg@mail.gmail.com>
Subject: Re: [PATCH 05/14] accel: Include <drm/drm_auth.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Oded Gabbay <ogabbay@kernel.org>, mripard@kernel.org, cai.huoqing@linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 7:25=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> One of the source files includes <drm/drm_auth.h> via <drm/drm_legacy.h>,
> which will be removed. Include drm_auth.h directly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Oded Gabbay <ogabbay@kernel.org>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/accel/drm_accel.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
> index 294b572a9c331..24cac4c0274bb 100644
> --- a/drivers/accel/drm_accel.c
> +++ b/drivers/accel/drm_accel.c
> @@ -11,6 +11,7 @@
>  #include <linux/idr.h>
>
>  #include <drm/drm_accel.h>
> +#include <drm/drm_auth.h>
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> --
> 2.42.1
>

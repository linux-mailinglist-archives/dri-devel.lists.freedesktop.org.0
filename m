Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F41E824003
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 11:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D150710E41E;
	Thu,  4 Jan 2024 10:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F1E10E41B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 10:59:29 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5f588ce1b6dso1108477b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 02:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704365968; x=1704970768; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OVJGNP4Jp69q00tCo9Lc2/psPuK12fZJNB4cs5fg6nw=;
 b=eu2GsaO2p7fOHjlsUBm3vBBlcVTL/es+tZ4JDp2qdqVeUCLrm5t/R6Ar6WU7BbSZBe
 DBdpRn2XmNtSuT1CdjPDvE9UYtpVZGqhHk3QcJ8816OuzBPHOx+5zutquv8D071zXt53
 FCcpKr0qyKrA4UhH+SUOdchkm2t8Nzj6j2qXFNDmPIj/IubbM0E5WUhvVIiuk4jqNJ9W
 zLBHY6S1AZ8jujmAb7maqMMVLYXgrlj/XVbrDpQjTE9fg1lwlxLaOTVLKoKkcJSQC4k4
 /qrNZQSkHN8B5wlaT6SaI1vfuqpwwpxeYJSs6u8WI6OgXdP6coVrglizu/15uPvKV8t0
 u55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704365968; x=1704970768;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OVJGNP4Jp69q00tCo9Lc2/psPuK12fZJNB4cs5fg6nw=;
 b=iEM5R5+8IilBzRJtNKc2Adacm6ww6BnhutNjvWgp82UXUmOH8i+9o3apy0x646yk5I
 Po/raqZktB965Bg86DSe/HNKxQv6m1mi0W7ptyifP6yAehTLo/LxXhj6OE2vgupDCkfc
 mdKrZhT6jkCNFcvrzPKwL519N8utCgJaLkC9uKvbIdEtE1TueSFSABLY2exTRTlTnuP5
 Aizp2wmVomzJ4o+gBDwzpvdHHjpD1cB7YQLcSXPtPi66Sp70GTzfL66PbjSlBmmT5S3w
 5BVSR2io7CV7g/R45MqK8gPb07vQuyqr9chuWXUKV/DKH3p3Kza4LCWB0ZVWRpSVdRK+
 BvEQ==
X-Gm-Message-State: AOJu0YxhtQ5OX0Q8JrPnrrrshaMSQUJxS43qt7wGbAsTZEMn8YSuCGrK
 7Gvos15gRiAO6P/v9FVDBmTapZxji2/PI0WS0DAn9HRwoGy1Hw==
X-Google-Smtp-Source: AGHT+IEexUhmDUV/7+/MCOvNoBMDbzFBOiFUouvsUK4veJeHj7idj8gnOEtbiw2fDQ6y3zkK25+ssxdi6bcY5DbV4vk=
X-Received: by 2002:a0d:cfc2:0:b0:5e7:9df1:218b with SMTP id
 r185-20020a0dcfc2000000b005e79df1218bmr138403ywd.16.1704365968497; Thu, 04
 Jan 2024 02:59:28 -0800 (PST)
MIME-Version: 1.0
References: <20240104104821.1822988-1-jouni.hogander@intel.com>
 <20240104104821.1822988-11-jouni.hogander@intel.com>
In-Reply-To: <20240104104821.1822988-11-jouni.hogander@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 4 Jan 2024 12:59:17 +0200
Message-ID: <CAA8EJppmcgAwk-TnBdf3EyPZsubJgnJOw2HVMopAfJrXdJKkFA@mail.gmail.com>
Subject: Re: [PATCH 10/12] drm/panelreplay: dpcd register definition for
 panelreplay SU
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Jan 2024 at 12:49, Jouni H=C3=B6gander <jouni.hogander@intel.com>=
 wrote:
>
> Add definitions for panel replay selective update
>
> Cc: dri-devel@lists.freedesktop.org
>

1) This CC should not be necessary. It is already a part of
maintainers entry for this file

2) It probably doesn't work as expected. It is separated with the
blank link from the rest of the trailers, so most of the tools will
skip it.

3) You have skipped the rest of the maintainers for this file. Please
use ./scripts/get_maintainers.pl and pass corresponding options to git
send-email.

> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> ---
>  include/drm/display/drm_dp.h | 6 ++++++
>  1 file changed, 6 insertions(+)

The patch itself looks good to me.

>
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 3731828825bd..6a59d30b7b25 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -548,6 +548,12 @@
>  # define DP_PANEL_REPLAY_SUPPORT            (1 << 0)
>  # define DP_PANEL_REPLAY_SU_SUPPORT         (1 << 1)
>
> +#define DP_PANEL_PANEL_REPLAY_CAPABILITY               0xb1
> +# define DP_PANEL_PANEL_REPLAY_SU_GRANULARITY_REQUIRED (1 << 5)
> +
> +#define DP_PANEL_PANEL_REPLAY_X_GRANULARITY            0xb2
> +#define DP_PANEL_PANEL_REPLAY_Y_GRANULARITY            0xb4
> +
>  /* Link Configuration */
>  #define        DP_LINK_BW_SET                      0x100
>  # define DP_LINK_RATE_TABLE                0x00    /* eDP 1.4 */
> --
> 2.34.1
>


--=20
With best wishes
Dmitry

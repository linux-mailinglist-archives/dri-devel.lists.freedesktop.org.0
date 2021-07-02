Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55C63B9C05
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 07:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE2F89AB5;
	Fri,  2 Jul 2021 05:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F122089AB5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 05:28:39 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id gt10so12876999ejc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jul 2021 22:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OfQHxzo83zLbcvyp3l11o4o45GcwyCdrdu5e4fL5CV8=;
 b=K87Fquje6odx6fh0t3Z3kpYJhDV8J5NCT85XefSxglrv0QoqZRDZccoQ85zy0pzZNV
 B/wZbrJxXr5FYzU0dFXIs0JgAj0xZiaOt25NyemcKRzCsFOnQShj9vL/OlwbZ/dt+w9N
 jVlqV5ShfYZPYWz9A7/M10w2QVXQAPPXgPQoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OfQHxzo83zLbcvyp3l11o4o45GcwyCdrdu5e4fL5CV8=;
 b=BBHA79c6yijjSXMkdF/rfmsfC1N6pWryt7+RTISIErY+YZgrB90wNQXtxlu69cbUr1
 3N7LtsfaoPSPJGihCsWB4/Sr6xmy3HDSktyBBoz/NOzQC1uMscnYFlGWIH/X9+Z1l3dS
 la5SizMOUvUrEVT1cPkONXZIAKki7vMelQ114t5AuZsnGFacJa7y7uRA1+wUM2zb4ueu
 T86gCezmxfxuQdFdAMUzS3Iyt3wqF9RMYF7vZKXly8NL8acyhzojmV7CJgNGSA+93s9d
 EY4chzTTNzXoOyPufqWwoE53DFJoF/Djp0l7qduCkiXqrHFDEi5F6qeAmweRV9ZvgWk2
 MpqA==
X-Gm-Message-State: AOAM532fKbHC49IdHzpPerBPq8l5xrnr/h5znb0GhZrgeaJL5/54kLtR
 hRIWpdUH33NldaWBlwUqJJPP6Wx8q1LjgR9NEOdQMw==
X-Google-Smtp-Source: ABdhPJxrQSQn3GKuokaclwYT7Jrsb5n9LGKVoAahBuBiqBm0o3+Ylpe4HxYzRq8EE3svqcIp7ocrjD9DUtCGbJpzYvw=
X-Received: by 2002:a17:907:1c9b:: with SMTP id
 nb27mr3596069ejc.336.1625203718480; 
 Thu, 01 Jul 2021 22:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210524184226.3064621-1-jagan@amarulasolutions.com>
In-Reply-To: <20210524184226.3064621-1-jagan@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 2 Jul 2021 10:58:27 +0530
Message-ID: <CAMty3ZDt8L70xHH5pMy0M-3ATt9jAXAy3VVeRV_iMkcoebn99w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: panel-simple: Fix proper bpc for
 ytc700tlag_05_201c
To: Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam and Thierry,

On Tue, May 25, 2021 at 12:12 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> ytc700tlag_05_201c panel support 8 bpc not 6 bpc as per
> recent testing in i.MX8MM platform.
>
> Fix it.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9be050ab372f..6f4151729fb7 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4164,7 +4164,7 @@ static const struct drm_display_mode yes_optoelectronics_ytc700tlag_05_201c_mode
>  static const struct panel_desc yes_optoelectronics_ytc700tlag_05_201c = {
>         .modes = &yes_optoelectronics_ytc700tlag_05_201c_mode,
>         .num_modes = 1,
> -       .bpc = 6,
> +       .bpc = 8,

Can you pick this, if all okay.

Jagan.

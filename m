Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 532C5624657
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 16:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845FB10E04B;
	Thu, 10 Nov 2022 15:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0F410E13F;
 Thu, 10 Nov 2022 15:51:27 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id v81so2218016oie.5;
 Thu, 10 Nov 2022 07:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9o/q02SgMUtKwCSGCp62SYqtX4KWBFvmJVY+jW/71qY=;
 b=gjVyVor+cEsWkvWUOGB7xjRTdZoU9NwM5TxlMvWV8xgI6+f1GF/x6yOniLLrKw+5Bh
 Tq3O+muwLKOkEbZvF9q/SQjhdTDwlw91rcYSsdF37sWMmlYzImmzmQgq+yTiewjlZmZZ
 IRP7dJ2mQuC+E6iuMcg2fBQWnLG685xFbt5uYlD2DCcH1WkKj2KmMUqrGBsnQ6JMRPWd
 pgtE3nKCM4sdrTXXbSnLgr7PMwiCo0qdVb4pcjJVr897D/xwnfOLkRyU6kJVXtXGitRz
 B47vqeHdCvTywOiK7FOaIpo2M493rWPWtQrAwQ4Kx+9gVm/9vxsww0TzKTX7HCEjB+fq
 xecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9o/q02SgMUtKwCSGCp62SYqtX4KWBFvmJVY+jW/71qY=;
 b=4aGq0lqq8vaB7ICLNy6E+rCt5CgxLes7wQI04j1ceDU66+CZDELSsDWZGJLjm42sGG
 MsYNVUd4YXV1MDFPIyi7Vwg5UcrxhigbZf/rKespYoFcLcT9ChUHogGRYaHT7Xg/neGX
 rs4yDYBLHteo26HCIukYdWGHfqGjmWUkwFQJS11GXuKhlSz6yTpKgP3C6oUXM+iTHJdc
 sx+ZNX8BIdJwRV19Figxs7uYoHPViwvh6Z6BnJkmWI+IkVxkXvtQN/GqPQ2AuHvln332
 Pnzk9AoPThBhF+zoH1UNDdrtx30QMKrjlRp6MYPyFNuE/UqwiZsDJMTAI7ZBX79saoh8
 kWIw==
X-Gm-Message-State: ACrzQf0O7flnow3TN5oh/foeKLAKKpGOvUzwkcmmiyC/0loXeVHuLbEF
 OuGBhTvCui5oagQjRaS619j1aGkZB9Xa44g5ZgerCOQD
X-Google-Smtp-Source: AMsMyM7UirTmV8hJcl+4Lyw1UKPy1lrw6dkr1YyynnQNsal87YgDDBrrEG4X7i/3GO1QM5iBZ0VzQKjxTuOl/3LzzGk=
X-Received: by 2002:a05:6808:7dc:b0:34f:97ea:14d with SMTP id
 f28-20020a05680807dc00b0034f97ea014dmr1575932oij.96.1668095486593; Thu, 10
 Nov 2022 07:51:26 -0800 (PST)
MIME-Version: 1.0
References: <20221110130925.26928-1-tiwai@suse.de>
In-Reply-To: <20221110130925.26928-1-tiwai@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 10 Nov 2022 10:51:15 -0500
Message-ID: <CADnq5_OH1A=uC7tg8JD9tvWb-+EEgze4Kwuo1F7p8fAOpvhvyg@mail.gmail.com>
Subject: Re: [PATCH] drm: radeon: Fix audio get_eld callback
To: Takashi Iwai <tiwai@suse.de>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 10, 2022 at 8:09 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> Check the availability of the audio capability and mode config before
> going to the loop for avoiding the access to an unusable state.  Also,
> change the loop iterations over encoder instead of connector in order
> to align with radeon_audio_enable().
>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2236
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>
> Note: this is the additional fix on top of the previously submitted
> audio component support for radeon.

Applied.  Thanks.  I'll squash this in with the other patches.

Alex


>
>  drivers/gpu/drm/radeon/radeon_audio.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
> index 71b67d4efe08..d6ccaf24ee0c 100644
> --- a/drivers/gpu/drm/radeon/radeon_audio.c
> +++ b/drivers/gpu/drm/radeon/radeon_audio.c
> @@ -747,6 +747,7 @@ static int radeon_audio_component_get_eld(struct device *kdev, int port,
>                                           unsigned char *buf, int max_bytes)
>  {
>         struct drm_device *dev = dev_get_drvdata(kdev);
> +       struct radeon_device *rdev = dev->dev_private;
>         struct drm_encoder *encoder;
>         struct radeon_encoder *radeon_encoder;
>         struct radeon_encoder_atom_dig *dig;
> @@ -754,19 +755,19 @@ static int radeon_audio_component_get_eld(struct device *kdev, int port,
>         int ret = 0;
>
>         *enabled = false;
> -       list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
> -               const struct drm_connector_helper_funcs *connector_funcs =
> -                       connector->helper_private;
> -               encoder = connector_funcs->best_encoder(connector);
> +       if (!rdev->audio.enabled || !rdev->mode_info.mode_config_initialized)
> +               return 0;
>
> -               if (!encoder)
> -                       continue;
> +       list_for_each_entry(encoder, &rdev->ddev->mode_config.encoder_list, head) {
>                 if (!radeon_encoder_is_digital(encoder))
>                         continue;
>                 radeon_encoder = to_radeon_encoder(encoder);
>                 dig = radeon_encoder->enc_priv;
>                 if (!dig->pin || dig->pin->id != port)
>                         continue;
> +               connector = radeon_get_connector_for_encoder(encoder);
> +               if (!connector)
> +                       continue;
>                 *enabled = true;
>                 ret = drm_eld_size(connector->eld);
>                 memcpy(buf, connector->eld, min(max_bytes, ret));
> --
> 2.35.3
>

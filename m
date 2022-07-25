Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E57E580521
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 22:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80BE8F058;
	Mon, 25 Jul 2022 20:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45B98DFC0;
 Mon, 25 Jul 2022 20:12:40 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id o13so450119edc.0;
 Mon, 25 Jul 2022 13:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DLNtAH4ZVUtmn0ECdu7iuFAaapi+HL9I7pXxXmdck8w=;
 b=PTUrc6t1ic0HYfkNp2akyzJG2VcZ5pnZ+lxvTG51h33EEWxLes5a5mcyzuh8GlXTEI
 yo8GZ686GVz6FZxlheDXTD00px2WiBzEGXUVc3fP6KKIUqx9hqzx3IX6+peazAI/VF53
 VpnjVMpwAj4GXuZELDmhxcU3DlbL+hukrIdgletKPl1HnOyHba4SnYgLJpJ7JIGgQomP
 4EUUie+QxeJGLSXfIioN1ZFDB5i5+4bmnpO5DJZPdnDSyq5Beulsc3QbOUx7GIjZcKs7
 kmCm7RkD/cVLlh7P3IGq5Wg8Q3lrB3PM2bRq/GAZTxi2RKXCLjCZjhSvl0tAW8bdHa4P
 zdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DLNtAH4ZVUtmn0ECdu7iuFAaapi+HL9I7pXxXmdck8w=;
 b=zVqfvodfk9Und2y7d1yYNUgz3u5quFRfK6MUZbSlksbXtjV8HNyiypBD+OJ+191dIg
 jLt5CId+kuCLgsjvLjQjUOy1acRLvCBWNAdbTdUPyAK8n6P1HESLEsPcWDwls73HLX1b
 sLg6HI9zvvAKOnxJyUY/1+7qaRGvRQJ4DcHXj6HQtkiMY1FvyTyoFaoWczoqsHYCdofk
 wfqC5g9dqeOHeMRIfldUfkfCjr0s91icbFVmb2vavkwFLQZVSz3Dk6SWnhl/mtNQN9of
 B3n9W1kcipKaxhOY7CRsh+Wlcy/h26+zyF2VnEmXEVv5TjzKtaTIq4t/1ccwVmLulO3o
 r1vQ==
X-Gm-Message-State: AJIora9zvDGc52hVJJczAPVrHFFlDE92DrSbJDhbvgsu2VvYq6dVF2OX
 8FF49eNvbRVWSBy52E5P+7b0ToctRSsOOnd2m8s=
X-Google-Smtp-Source: AGRyM1sHgpidV9VnWISJsHLqj+Bvg1fR0OozJDV3Q4VSZSDdCPqA8td9X6oFEhicq4HYQEhGBzhJRgnpRhXt5xv8eMo=
X-Received: by 2002:a05:6402:248d:b0:437:dd4c:e70e with SMTP id
 q13-20020a056402248d00b00437dd4ce70emr14751707eda.75.1658779959059; Mon, 25
 Jul 2022 13:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220724074150.17869-1-wangjianli@cdjrlc.com>
In-Reply-To: <20220724074150.17869-1-wangjianli@cdjrlc.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Jul 2022 16:12:27 -0400
Message-ID: <CADnq5_M0QnP+W83cSb-mpHNjrjnF9hS_e=PJ=QkEiof7Em=NPg@mail.gmail.com>
Subject: Re: [PATCH] dc/dce: fix repeated words in comments
To: wangjianli <wangjianli@cdjrlc.com>
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
Cc: airlied@linux.ie, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 25, 2022 at 3:23 AM wangjianli <wangjianli@cdjrlc.com> wrote:
>
>  Delete the redundant word 'in'.
>
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dce/dce_audio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c b/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
> index 70eaac017624..f0b585caa28f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
> @@ -322,7 +322,7 @@ static void set_video_latency(
>                 value);
>  }
>
> -/* set audio latency in in ms/2+1 */
> +/* set audio latency in ms/2+1 */
>  static void set_audio_latency(
>         struct audio *audio,
>         int latency_in_ms)
> --
> 2.36.1
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93208411878
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 17:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B786E158;
	Mon, 20 Sep 2021 15:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176F96E158;
 Mon, 20 Sep 2021 15:38:37 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 77-20020a9d0ed3000000b00546e10e6699so13009170otj.2; 
 Mon, 20 Sep 2021 08:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M1GmJpImkQw6oqUdA7Cxs3NXEIJfwV+W0nlaojmq7tY=;
 b=QPxf4kJ5Ecxw0ZhOqGUAdQ7Ax8ylYAiHGSWFEbcpIwwvziliONhZSZLTch3/pPVUmD
 7ft4TT1TUMptaxzyQ38U8PudQq8OwP7KhwuYxcpUbpe9/qmI0tqLCRmN+gz/syb7qh5G
 8MCM28jfgjU0s1B1oBuQOJyAHkBI4iYVwlRJcsauYwgo7/WsrLMbjhXP+csQchrPQqji
 +q54I/YaNTG2NqQAHiyC4z+ViRhZjdTmwIfzgmNKfu0IMvyB3dKjhmKZzHis2M4Ys24m
 epSXUmHZoLcAaf1lZ8HZzqb7YrKQvXROp6no8Ph7DxWS+vLqbAHh4n9NtJ3AtaK9KEZ+
 S4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M1GmJpImkQw6oqUdA7Cxs3NXEIJfwV+W0nlaojmq7tY=;
 b=cAWaU1PdF+a8USNHs7BQdvsyqKI9vi4QWmEIlrdTco36lqciS773OPnU/CRHc1cp/2
 BT50tsVXFU7uQf/gu6hybg8cRu+D0MWqPmZcM/56xNxkQ6PDwhT2g/2Z0iPvc+yM4pnu
 K+qfPo9+u4+9atHZKBtLh9QL4NSPcG+h6eYljRGEWDruxP/X1HFSyxqN8SGMhA1ypTPf
 E3fd7oHZJzi6xhr8ugp/FKALsFFoC5b8J8I2H0MYxnHPFxIMzRmhpGo7wbJT+KHncsru
 7Id4tvN+smIa+UIaIXpVZrlC25AtOo10++DsdCSFVavaXcAKuZNWLLzVV0ew03dXTGQ5
 zudg==
X-Gm-Message-State: AOAM53038XVKwGiY7fPOZ7EHAXvO/eRUckgVy1Z8Squ7Bfg6mMg8auKW
 zYa3Gbqcz3tUgIzwM2p998sMh1POMDQJ13pb7MY=
X-Google-Smtp-Source: ABdhPJy5kOwJ6xdBRJAAsXYaF0mSVvfdpNm+jirzOurESWCqJYxLKJqTU4BcWjJZbRoFRsAPBFY8QsdmMD5jok1+jq0=
X-Received: by 2002:a05:6830:214c:: with SMTP id
 r12mr21753938otd.200.1632152316355; 
 Mon, 20 Sep 2021 08:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210920121606.93700-1-arnd@kernel.org>
In-Reply-To: <20210920121606.93700-1-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 Sep 2021 11:38:23 -0400
Message-ID: <CADnq5_NDpx8HOgZKx2qx=fh-j-MYtcZifBR5LFMVWvzwhENKqw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix empty debug macros
To: Arnd Bergmann <arnd@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Zhan Liu <zhan.liu@amd.com>, Ashley Thomas <Ashley.Thomas2@amd.com>, 
 Anson Jacob <Anson.Jacob@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Jun Lei <Jun.Lei@amd.com>, 
 Wesley Chalmers <Wesley.Chalmers@amd.com>, Lee Jones <lee.jones@linaro.org>, 
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Wyatt Wood <wyatt.wood@amd.com>, 
 Jude Shih <shenshih@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

On Mon, Sep 20, 2021 at 8:16 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Using an empty macro expansion as a conditional expression
> produces a W=1 warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.c: In function 'dce_aux_transfer_with_retries':
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.c:775:156: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
>   775 |                                                                 "dce_aux_transfer_with_retries: AUX_RET_SUCCESS: AUX_TRANSACTION_REPLY_I2C_OVER_AUX_DEFER");
>       |                                                                                                                                                            ^
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.c:783:155: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
>   783 |                                                                 "dce_aux_transfer_with_retries: AUX_RET_SUCCESS: AUX_TRANSACTION_REPLY_I2C_OVER_AUX_NACK");
>       |                                                                                                                                                           ^
>
> Expand it to "do { } while (0)" instead to make the expression
> more robust and avoid the warning.
>
> Fixes: 56aca2309301 ("drm/amd/display: Add AUX I2C tracing.")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dce/dce_aux.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
> index e14f99b4b0c3..3c3347341103 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
> @@ -42,7 +42,7 @@
>  #define DC_LOGGER \
>         engine->ctx->logger
>
> -#define DC_TRACE_LEVEL_MESSAGE(...) /* do nothing */
> +#define DC_TRACE_LEVEL_MESSAGE(...) do { } while (0)
>  #define IS_DC_I2CAUX_LOGGING_ENABLED() (false)
>  #define LOG_FLAG_Error_I2cAux LOG_ERROR
>  #define LOG_FLAG_I2cAux_DceAux LOG_I2C_AUX
> @@ -76,7 +76,7 @@ enum {
>  #define DEFAULT_AUX_ENGINE_MULT   0
>  #define DEFAULT_AUX_ENGINE_LENGTH 69
>
> -#define DC_TRACE_LEVEL_MESSAGE(...) /* do nothing */
> +#define DC_TRACE_LEVEL_MESSAGE(...) do { } while (0)
>
>  static void release_engine(
>         struct dce_aux *engine)
> --
> 2.29.2
>

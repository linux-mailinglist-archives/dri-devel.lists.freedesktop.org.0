Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A40796833B6
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 18:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DEE10E14C;
	Tue, 31 Jan 2023 17:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BD210E14C;
 Tue, 31 Jan 2023 17:20:43 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1631b928691so20199284fac.11; 
 Tue, 31 Jan 2023 09:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a5eYX76zIAVB8c95dz15j8MnE/5jf22tihPTxYs5fCU=;
 b=O3ngQ/VkcLAuKvEdievGcuURl+oH+4IPZ4bQrAQgxM1UYmBKySfahajHio8W7xevPb
 QzufZQQgW5xc/4zNiljJWzk52yK/qtS93CQvcHe8RsgllYZLkjqjkJkZ78Me+kjCDY5n
 u9b3LjbzkpywoJT4kWqY3t7n1aJpcONUlFEzO1aYJPQJ6ny5m/uMVaxStOB/Ldd118I+
 jSQ02FuU/njJlsSoWBtEJ8HJcWTbGgsgTkNOyAUPJf8at53k8HeB2dLcdRkByuz42ePv
 nfKsUCMeu2VPnrPjmYYm78EqM8D41CtujqXkzXlxx0I/V/t6v7pa/NmgYRfnvpwsj/S0
 r1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a5eYX76zIAVB8c95dz15j8MnE/5jf22tihPTxYs5fCU=;
 b=usVkrbi/FptVApIjVjTHHUpUfENVMUyUihiNxMImwTSs7O0JNYgEoT1KJhadW16NO2
 aO8M0s0z4GXIQZVljiaxYxQRH2UBgW1NoMsOwYk4X7vmlBS36FHcDwhx1NCyh3bgfDPy
 ABd1l+sdz0Ih8CmGID221zh5IGyYYMKUwO3bbVgNFd+AtyvYxGE2cMnfJAx/Z9xVliof
 ZF4U+4+nvkUw6LjLYGvqzoUF7LLgPk0lmEdETpE6YbR1JaJnBx33o7+SF1IXqSo+1cKX
 W07fr+fLZYsxSA2qyXaVOgdUrYYYyeNK6vQkrwt3rmWk/U3WAkuSqyLaJDiI2KwwJTgu
 aHKw==
X-Gm-Message-State: AO0yUKUpWpYlR12wei79WBaVq3pEiXvLw+mBxduBQK8bt6bDufxmwBfD
 SkaZmxt2eyBMNfW7oaOgCK1ak5HNsnBT4FzAxKo=
X-Google-Smtp-Source: AK7set8grw5QUR1EUF7PjRLznxHD6+NW/n6GZEOFxILkd06E+DRdVlXMEF8HTULGdTUDD717b+hnU+ZJQJx1cOiy1rA=
X-Received: by 2002:a05:6870:b522:b0:163:8cc6:86a with SMTP id
 v34-20020a056870b52200b001638cc6086amr1617905oap.46.1675185642695; Tue, 31
 Jan 2023 09:20:42 -0800 (PST)
MIME-Version: 1.0
References: <20230127013823.832698-1-trix@redhat.com>
In-Reply-To: <20230127013823.832698-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 31 Jan 2023 12:20:31 -0500
Message-ID: <CADnq5_NpjoaU5+HThA5s5-KANfoYSgwr2Vj6pYuqWKqJrdXRkg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: reduce else-if to else in
 dcn10_blank_pixel_data()
To: Tom Rix <trix@redhat.com>
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
Cc: wenjing.liu@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Anthony.Koo@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, alex.hung@amd.com, aurabindo.pillai@amd.com,
 sivapiriyan.kumarasamy@amd.com, martin.tsai@amd.com, sunpeng.li@amd.com,
 mwen@igalia.com, Tony.Cheng@amd.com, Dillon.Varone@amd.com,
 dingchen.zhang@amd.com, Wesley.Chalmers@amd.com, Xinhui.Pan@amd.com,
 Roman.Li@amd.com, Max.Tseng@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Jan 26, 2023 at 8:38 PM Tom Rix <trix@redhat.com> wrote:
>
> checkpatch reports
> drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c:2902:13: style:
>   Expression is always true because 'else if' condition is opposite to previous condition at line 2895. [multiCondition]
>  } else if (blank) {
>             ^
> drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c:2895:6: note: first condition
>  if (!blank) {
>      ^
> drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c:2902:13: note: else if condition is opposite to first condition
>  } else if (blank) {
>
> It is not necessary to explicitly the check != condition, an else is simplier.
>
> Fixes: aa5a57773042 ("drm/amd/display: Vari-bright looks disabled near end of MM14")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> index bb155734ac93..f735ae5e045f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> @@ -2899,7 +2899,7 @@ void dcn10_blank_pixel_data(
>                         dc->hwss.set_pipe(pipe_ctx);
>                         stream_res->abm->funcs->set_abm_level(stream_res->abm, stream->abm_level);
>                 }
> -       } else if (blank) {
> +       } else {
>                 dc->hwss.set_abm_immediate_disable(pipe_ctx);
>                 if (stream_res->tg->funcs->set_blank) {
>                         stream_res->tg->funcs->wait_for_state(stream_res->tg, CRTC_STATE_VBLANK);
> --
> 2.26.3
>

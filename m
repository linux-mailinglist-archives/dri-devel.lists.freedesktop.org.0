Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1656833C1
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 18:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901CF10E158;
	Tue, 31 Jan 2023 17:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D06810E158;
 Tue, 31 Jan 2023 17:22:31 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-15085b8a2f7so20252395fac.2; 
 Tue, 31 Jan 2023 09:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jJ4ivKCSSjC/nsEprnt+8Zq1TU7NBjHqzheuppe5Hlc=;
 b=aubPHj9Bqdk7dreN5BitMQndcJvpdoL/53VtmiC4laWRWmkd1Yb7Bnxfw+uMEMJhJh
 9ADBdMjJKGhCV6HuPnQID9W4steAnGR8UVEq6U7ewy3gSnAvSAeUWACXvwI4oV2rJ5to
 S5sxFbTMLLw2ASIQDFRgwEi3pS1QZA0z9+yjp7KNZNURvy4lJGBxChLjLYRbl2StshA9
 tnVZplvBEGTSjJ7DglZc+sOkeAcwkMlULANmxMZzWjlWRdtW68WHxGcaQ2TCErxxwonX
 AE5m1o71AkIr47TRynvJ7W7KU91zvit13a6YYwB6L92aBzYyBu9arVX1mn8+MtjYtq4e
 qEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jJ4ivKCSSjC/nsEprnt+8Zq1TU7NBjHqzheuppe5Hlc=;
 b=LUGfykCyK1zPQfMRtzY8g8BH7IKUC6n3UWA8llledOaz+CrsvxRqY+AAT611+WgPgZ
 AwS8w/cOMZFPJzPziptOBcs+u85b2SvuwcYf5r3TNpHB9o/2bI2Kl3q55Fd2DydM7m4x
 BufUN1ihX3DH5NPICDABHU+nVa8z+kdsWTN5o7UpoX2b82CmpFejaqA6Fz6WDsilaZJ9
 LhHiGu7CI83iOqQe6/wf/MZppNCip4zmtTDLG885v6aVBIL1dP3ZUtZ4omrZrFfF/3L+
 7yznXBcuv8byaxayQ3zwBH/pyS1ceQ0gm90j/qIrTXaOg5Klaxv9AxpAjUbIrfEYzrnd
 TxSw==
X-Gm-Message-State: AO0yUKU2JIRWPHBR6H9bcgFYFUsrcpYHWUz7VnJ5YbRwEVQP4ZRYJqm7
 BMh6FbmHfT4gfAR5OJLKwM6iBlLIwXXzlz9t/pQquLVk
X-Google-Smtp-Source: AK7set/L5JhayGONTYLQxHrTfP9o0V2pHohgI/C0z5ya1GYvsguIk4c3xqh5rQSPnSuia4QPomH3wrYxML1a5IHYTQo=
X-Received: by 2002:a05:6870:b522:b0:163:8cc6:86a with SMTP id
 v34-20020a056870b52200b001638cc6086amr1618651oap.46.1675185750411; Tue, 31
 Jan 2023 09:22:30 -0800 (PST)
MIME-Version: 1.0
References: <20230126204935.819030-1-trix@redhat.com>
In-Reply-To: <20230126204935.819030-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 31 Jan 2023 12:22:18 -0500
Message-ID: <CADnq5_NKPO3gEST2oqp9bB77y2iFHtvnNzKnnT8dSVTAEzY=bw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: reduce else-if to else in
 dcn32_calculate_dlg_params()
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
Cc: Dillon.Varone@amd.com, rdunlap@infradead.org, amd-gfx@lists.freedesktop.org,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nevenko.Stupar@amd.com, Alvin.Lee2@amd.com, george.shen@amd.com,
 alexander.deucher@amd.com, David.Galiffi@amd.com, jun.lei@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jan 26, 2023 at 3:50 PM Tom Rix <trix@redhat.com> wrote:
>
> cppcheck reports
> drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c:1403:76: style:
>   Expression is always true because 'else if' condition is opposite to previous condition at line 1396. [multiCondition]
>    } else if (context->res_ctx.pipe_ctx[i].stream->mall_stream_config.type == SUBVP_PHANTOM) {
>                                                                            ^
> drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c:1396:69: note: first condition
>    if (context->res_ctx.pipe_ctx[i].stream->mall_stream_config.type != SUBVP_PHANTOM) {
>                                                                     ^
> drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c:1403:76: note: else if condition is opposite to first condition
>    } else if (context->res_ctx.pipe_ctx[i].stream->mall_stream_config.type == SUBVP_PHANTOM) {
>
> It is not necessary to explicitly the check != condition, an else is simplier.
>
> Fixes: 238debcaebe4 ("drm/amd/display: Use DML for MALL SS and Subvp allocation calculations")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
> index 0dc1a03999b6..c96cbd88e20d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
> @@ -1400,7 +1400,7 @@ static void dcn32_calculate_dlg_params(struct dc *dc, struct dc_state *context,
>                                         /* SS PSR On: all active surfaces part of streams not supporting PSR stored in MALL */
>                                         context->bw_ctx.bw.dcn.mall_ss_psr_active_size_bytes += context->res_ctx.pipe_ctx[i].surface_size_in_mall_bytes;
>                                 }
> -                       } else if (context->res_ctx.pipe_ctx[i].stream->mall_stream_config.type == SUBVP_PHANTOM) {
> +                       } else {
>                                 /* SUBVP: phantom surfaces only stored in MALL */
>                                 context->bw_ctx.bw.dcn.mall_subvp_size_bytes += context->res_ctx.pipe_ctx[i].surface_size_in_mall_bytes;
>                         }
> --
> 2.26.3
>

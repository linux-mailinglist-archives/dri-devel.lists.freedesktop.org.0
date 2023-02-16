Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB225698AE4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 04:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C55710E2D5;
	Thu, 16 Feb 2023 03:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7125910E12A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 03:02:44 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id x4so703489ybp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 19:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UmfoGNmoydQLu/4gLeD4ecXj20LBp85h/89oL/+L10E=;
 b=Q/KqDmrg1GbuXRaTxw0oDwkSDjBxP4Ae+nf6X7sbOxXNH0eD0wl8/M6FexUVCbi88W
 zG2CbhcfEHXgFgPZg1xntAm61fIipkbd5y2y4AHDcvd9/Q45+S0L4PrITYjwN5fnhWl9
 cluu0f9dhWYoit9BCQsz4c25kC13XVsv/ECcrJK/OBY0Yy9d+VjixjI7KeEI4+u6eutk
 I0KrrQcpfxCWG4OFz5ILWRHlI9KoYahrIvj9Uw57V9nsJIKSmS64zK7ELoqZyKttAlov
 HyzQgQtNBCkc0MbCzxDrMcSxmXsTrPWpMKI8PvVsVH6MwUBhhM5TLFdqDhJlsJp4Z2cU
 rvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UmfoGNmoydQLu/4gLeD4ecXj20LBp85h/89oL/+L10E=;
 b=KZqtiPFglrpVCxCqmvBxPWyS1eZIVL45n+o5MFSVLeVu6FFJ8JGUAFTUz9A3aRZqac
 my49DyHfdNGsAdUDi5Z1GvBIbnuu9R9kqeDVdJryxq2ic3NQlMG8RMCB3FzUOtTG6qoc
 oLBrwPaSM+zjAmeU9EaWZ4Ah1xdvwI4AV050mHGSEVEUVosWDlC0Q1EPn+CLjvvAoZZ4
 fP4pUTX9LExtM7HL0U+Ixg6MUjwBDeFB/yWK0/pd/qvAiBervncom0r9dkX50Jf6AMr6
 9A7PjBvt5hE5dkgRdiCNfvN55LHGj1KFNEchnN8blQxbkK3zPxrULRkw8ePra1aSqVaE
 SVqg==
X-Gm-Message-State: AO0yUKWjJfYPY6ufmIdptlkioUJSe9sIkZR0QYzp+SWkpdZ0jh2GFugv
 4l6IO5qRvQqo4vkxwEp93lwkn+3ypg43VuYNMfCejQ==
X-Google-Smtp-Source: AK7set+wevyweJgk6/FESwWZUqeOoq8hRyKir3CGjvMKeXHLg9TcJFZU8wMezt7btRCXjLKWkqQ2a5assUlQmuvevrQ=
X-Received: by 2002:a25:f50c:0:b0:90a:8ba9:3ac3 with SMTP id
 a12-20020a25f50c000000b0090a8ba93ac3mr509152ybe.333.1676516563474; Wed, 15
 Feb 2023 19:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org>
In-Reply-To: <20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Feb 2023 05:02:32 +0200
Message-ID: <CAA8EJpqL-Vsq7dbK7tfJAGgg2_nV463QYv5zgvRLx_8T2bsXxA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/msm/dpu: Initialize SSPP scaler version (from
 register read)
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org, Chandan Uddaraju <chandanu@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Feb 2023 at 01:02, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Random inspection of the SSPP code surfaced that the version field of
> dpu_scaler_blk was never assigned in the catalog, resulting in wrong
> codepaths to be taken within dpu_hw_setup_scaler3 based on a 0 version.
> Rectify this by reading an accurate value from a register (that is not
> equal to the values represented by DPU_SSPP_SCALER_QSEEDx enum
> variants) and deleting dead code around QSEED versioning.
>
> Future changes should likely get rid of the distinction between QSEED3
> and up, as these are now purely determined from the register value.
> Furthermore implementations could look at the scaler subblk .id field
> rather than the SSPP feature bits, which currently hold redundant
> information.
>
> ---
> Marijn Suijten (3):
>       drm/msm/dpu: Read previously-uninitialized SSPP scaler version from hw
>       drm/msm/dpu: Drop unused get_scaler_ver callback from SSPP
>       drm/msm/dpu: Drop unused qseed_type from catalog dpu_caps

The cleanup looks good. However as you are on it, maybe you can also
add patch 4, dropping DPU_SSPP_SCALER_QSEED3LITE and
DPU_SSPP_SCALER_QSEED4 in favour of using QSEED3 for all these
scalers? As we are going to use scaler_version to distinguish between
them, it would be logical not to duplicate that bit of information
(not to mention all the possible troubles if scaler_version disagrees
with the sblk->scaler_blk.id).

>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 12 ++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    |  9 +++------
>  4 files changed, 11 insertions(+), 26 deletions(-)
> ---
> base-commit: 9d9019bcea1aac7eed64a1a4966282b6b7b141c8
> change-id: 20230215-sspp-scaler-version-19f221585c5e
>
> Best regards,
> --
> Marijn Suijten <marijn.suijten@somainline.org>
>


-- 
With best wishes
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9BA5B519B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 00:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DE010E542;
	Sun, 11 Sep 2022 22:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A523B10E349
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 22:51:25 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 v2-20020a056830090200b006397457afecso4740929ott.13
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 15:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date;
 bh=yf6us0hpX9C+LQcsMl8TWkCbnYmsi9yU4+2aJofZWvw=;
 b=f/VeRCwZVsc2aBLVrdb5X6p45wFZ7LLVVBaei228qrJLXXEfigzM9sj4Gshg4vg1bb
 5rNUz6HxDgfuF0du+GtbgGRgi/3vOC+xwV8qIJ6IFIc4mP0McTqVEKs7vTBsaPKwUDvo
 XOFaF32qNe1Daqp7zvrTEG8FfH3ZBJmc0lkKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=yf6us0hpX9C+LQcsMl8TWkCbnYmsi9yU4+2aJofZWvw=;
 b=0SR4C4d0H1h4SkvJpDsjhadAfB6UgbnLU04uT9HgTrPBT89prI956XdDrQ7ozvlVOf
 MnJWWK08lkdRqLNTrRTM2WwmUm90VqmImb3etuIg7aPp3LQe1VXLszTOCY8Oy12IaD83
 ooEvKRiA9Pd/YiJoeqdA76swS0lLLDSyaKs70MGoF8GJmYMgtICh+sx/kVDA6bIZQnm3
 4do1GGS+D8DhfS+9ElRvBdWRy6r4oRgRR8firAnd5n6Cm2Nbk7yE5vm0mS3QJCkfHAEz
 cYvwGS8+EFKd/sT0Il2jSEcKaFGYbP6DzqypeOKWXHobjcQGHIsUHfhS84F+cfbZA0G0
 fPXg==
X-Gm-Message-State: ACgBeo0U0m0aLvmK5Nzwy4ZT4ipK53OgR2tAbo7DskWC8G8Q6bbfvYPM
 yXdjGn/1YPjkIkSdBrOoYsRie1YX7zxXHVZg2hu8EQ==
X-Google-Smtp-Source: AA6agR5dthMo/JycUE/0eQ7pE2kMS3cJLcSQDOaW/Qur0qtlVKXNbZbZ3G7tq0yONaPO7sO0TX9z8zeHVfIBJtcrz2w=
X-Received: by 2002:a9d:738c:0:b0:638:9962:8cb6 with SMTP id
 j12-20020a9d738c000000b0063899628cb6mr9426218otk.73.1662936684828; Sun, 11
 Sep 2022 15:51:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 11 Sep 2022 17:51:24 -0500
MIME-Version: 1.0
In-Reply-To: <1662621988-6873-1-git-send-email-quic_kalyant@quicinc.com>
References: <y> <1662621988-6873-1-git-send-email-quic_kalyant@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Sun, 11 Sep 2022 17:51:24 -0500
Message-ID: <CAE-0n51x3um=CZFk0K0k=7XkgbUk7OixtTjr2oqkhOLOz7yzwg@mail.gmail.com>
Subject: Re: [v4] drm/msm/disp/dpu1: add support for dspp sub block flush in
 sc7280
To: Kalyan Thota <quic_kalyant@quicinc.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, y@qualcomm.com
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
Cc: dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com,
 dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kalyan Thota (2022-09-08 00:26:28)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index a35ecb6..bbda09a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -307,6 +309,31 @@ static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
>         }
>  }
>
> +static void dpu_hw_ctl_update_pending_flush_dspp_subblocks(
> +       struct dpu_hw_ctl *ctx, enum dpu_dspp dspp, u32 dspp_sub_blk)
> +{
> +       uint32_t flushbits = 0, active;

Please use u32 in the kernel. It's shorter.

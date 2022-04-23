Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ACC50C60E
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 03:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D24E10E2D9;
	Sat, 23 Apr 2022 01:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E21010E4A0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 01:39:08 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id b188so10918872oia.13
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 18:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=7EJS8NNeeeYMyvlGg/Ekyb4WY0hHCp+wg2fhE6TIsAk=;
 b=RYGnji360BubilqdVVBND2TBvUGRtQqlSZYtbv+32nSrl/HaxDiU9NvStswPNTPHNv
 l5kk4CBhQPBzK8GQA2VPJHjjXUi1R2hmIzm4pifKn2ZVjffCZIePtPtXyHZFwQNqmGFf
 fnjiOnL0u+ncqJZdbj1an/HbxZAaJ1sZeCrXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=7EJS8NNeeeYMyvlGg/Ekyb4WY0hHCp+wg2fhE6TIsAk=;
 b=ZNF7UglBRqxkvjJn1+BIquMRsdm5TFCbzkMsPWQdAPmBk3cFF5CBFBNFaTPGUgcA92
 v2CgaFpQGQkF5zFuyug0NYz4Mj8GAubxhvckdO/X44JmS//xpZczrArqlLsDnYWHaGt/
 6/5BDzp7zsCJiU4OgwvJlB3N6bV+ON2phSVm6JP4HodN6SsMzHN9BNjgC8WBGVfrUAx+
 TEmrlpAaC4EcVd6KCoMR8OOpBB4kxA/JXtQ7L4XQ1f9k8ldn+oAo2Gqo+1iUOvOCEuEp
 usw+Q79F1VgW91SoW4zZsaPpekKsX7ndy9kMoKx5kA+5a0kHlxbsKWRzmea7vXfyWIhf
 VKAw==
X-Gm-Message-State: AOAM530q840A/zWbdyOBxFUoDcc2cPojMxa2znjTHbNpTsbFLfeKAToP
 QrOPG/+F0y4B7o+l8rJ/UKKFvzY1MrgTe2ywz4U4/g==
X-Google-Smtp-Source: ABdhPJykwLPlALEXFN/14+I62z2Ro0mrF6nz4lBhvSBstY/qhvFmCUzDDHH6zZMWwVedGzrAP/waI44abrHx0IYwWCQ=
X-Received: by 2002:a05:6808:1296:b0:325:8fb:68f3 with SMTP id
 a22-20020a056808129600b0032508fb68f3mr56442oiw.193.1650677947414; Fri, 22 Apr
 2022 18:39:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Apr 2022 18:39:07 -0700
MIME-Version: 1.0
In-Reply-To: <1650618666-15342-5-git-send-email-quic_sbillaka@quicinc.com>
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-5-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 22 Apr 2022 18:39:07 -0700
Message-ID: <CAE-0n52Lh_+_cPq7ivi0GHaUkY8_mH4nsvXeBBEbVRHLvHDYcw@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] drm/msm/dp: Support the eDP modes given by panel
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_vproddut@quicinc.com,
 airlied@linux.ie, quic_abhinavk@quicinc.com, steev@kali.org,
 quic_khsieh@quicinc.com, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2022-04-22 02:11:06)
> The eDP controller does not have a reliable way keep panel
> powered on to read the sink capabilities. So, the controller
> driver cannot validate if a mode can be supported by the
> source. We will rely on the panel driver to populate only
> the supported modes for now.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

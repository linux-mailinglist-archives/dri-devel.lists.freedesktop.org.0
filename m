Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E3143DB1D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 08:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3FD6E05C;
	Thu, 28 Oct 2021 06:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5A66E051
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 06:31:29 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 o10-20020a9d718a000000b00554a0fe7ba0so1345523otj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 23:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=fl3/6+D1WzrjlO9U2XlvyAbP1wGZPooZUWolFXNY6RE=;
 b=icJvMa5pUjALY+NkhGVS54Ds28x++ZE3VJJWfsC4PaJl0wk9D0YnQX8VgrkoN1N+jf
 2XmMVSkoHKJAQY1yroE0GbT2nKRKFPJJoOL7J1FiJwRoemobn38o4iTMCRgTpjbbNkoV
 wZ5HpRl/I3U6Mea/Wf46aCNQnb1zLIaYkJ0IQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=fl3/6+D1WzrjlO9U2XlvyAbP1wGZPooZUWolFXNY6RE=;
 b=kHl1oHn0I+cxFGMOv83Rm4H9HxuMWbjLdgqrgqrwAJK9qdv25p7TQ5MyPKlKxO0vAT
 72yp/EmUcsH11BmkTxxrLZb1vadpGu5JztMT7GY4HpMZ469FJ1XL0Wq7/KCPurfOmyOu
 o6Bb3WO4xeG2XsahVcMLG5bWc7N7uUYoxVEnSHoTdnTFvPz7c2lvuHyGBAzz3Y5oEtQr
 I7wk8GELd6WFWDt9UZyTXXKclPmiI9GBh6aoYtzDZyrVDbcn6GDw4BDA37WTKX/bDMs1
 ciJJkEkKVZf3jsSsDG6F78PWZBRJh1YPmRcFHgdaYCUb6V5Kxiv7bnbA1Gu6ujaxXOR2
 v7ZA==
X-Gm-Message-State: AOAM530M3dfYcH7clp6nklY0pS+IPVvKVTU9pKWW3TlQppMVDjeNAqdz
 LFFM07d2Ocw8E5WwMQpCPkTkqoCwrSaLTzXPbJpTSsPt390=
X-Google-Smtp-Source: ABdhPJwOH+dMU3ZV+EAZWCrAfkMlWceuSfzj8nbggbBIE6vGZwr08wjI7kbJHzryENUczI1dk388o3ot156zGeQHIH4=
X-Received: by 2002:a9d:6e16:: with SMTP id e22mr1856094otr.77.1635402688480; 
 Wed, 27 Oct 2021 23:31:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 23:31:27 -0700
MIME-Version: 1.0
In-Reply-To: <1635386088-18089-4-git-send-email-quic_sbillaka@quicinc.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
 <1635386088-18089-4-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 27 Oct 2021 23:31:27 -0700
Message-ID: <CAE-0n52o0FtVhd_TPEf_NhpXwLErcYm9NX+dqW8RnwrYGrM6-Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] drm/dp: Add macro to check max_downspread
 capability
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, seanpaul@chromium.org, kalyan_t@codeaurora.org, 
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org, 
 mkrishn@codeaurora.org, sbillaka@codeaurora.org
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

Quoting Sankeerth Billakanti (2021-10-27 18:54:45)
> Add a macro to check for the max_downspread capability in
> drm_dp_helper.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Looks OK to me. One question below

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  include/drm/drm_dp_helper.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index afdf7f4..b39e7a0 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1784,6 +1784,12 @@ drm_dp_tps3_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  }
>
>  static inline bool
> +drm_dp_max_downspread(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> +{
> +       return dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5;

Does it need a dpcd[DP_DPCD_REV] >= 0x11 check? Reading the spec I think
the answer may be that we check for 1.1 and always return 1 if so just
to make sure devices don't break the spec and put a 0 here when they're
rev is >= v1.1?

> +}
> +
> +static inline bool
>  drm_dp_tps4_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
>         return dpcd[DP_DPCD_REV] >= 0x14 &&

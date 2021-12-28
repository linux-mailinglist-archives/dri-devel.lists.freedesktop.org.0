Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CDD480CA3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Dec 2021 19:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D364E10E3B2;
	Tue, 28 Dec 2021 18:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3132910E3B2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 18:49:43 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 y13-20020a4a624d000000b002daae38b0b5so6205799oog.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 10:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eXhwfFLm6xuRXH07dJ43yJ+pTlr8xJ8+NlyVlndnfCM=;
 b=tsMCTyQL8yJvHEdjhTZNmLbJ57UAa8DmU4t+AJIjvr371gGhUD4TpfUfYQ+wQ74Imv
 GaoTxx0a03liOrWDFTeLIJCz1QWWvFJ0G6VIj7rkBgnwyPISmapj8NcRCURqS5IQ7I/b
 h8pLQWqR15McqilHIGRd9jtVaklDqDJRvrIC5hueGCx4lw0QBN/tFoe4Hbp9z4QxCkb5
 C1seEJxP7fvY6+cfZh4ZxgXtihTJjJP5yHQfR3pcueda7gQu0CypJ/kHPJVXWCsbN7hB
 iOezJZgrSR1fEP5Y+xvs8FkNRG0xJcHg6n8H/elrrOeVVr+F83OilwPLezSr1XU7Kha4
 t8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eXhwfFLm6xuRXH07dJ43yJ+pTlr8xJ8+NlyVlndnfCM=;
 b=RLI17KJG3UDyQetFDaKufUXRBgiofb6qThaaeSRKXXGVFHQmq7RSVriGtlVaoHrnuO
 XEiVFh0gwevqGKj5htzSLbTIKWcJem5R9VzixI5hAYrPCuOG+S9p7Q8LaTz2PEWwECpO
 gqKWEiV6tgGygSLag8tmi8H2fGD/taKcR+KNCQkpW9zVkFMxX6q5jQ0Vjgi8rwyvkkuG
 Fsr8nPleE7zmiiQL2Ac8Ixc5Jf9wc17GqPNsSgoFmIP7ROZelpe1qkyb3DI9X75coDdn
 JaD4z/Fjg1av8tk9X0wdRZ8e29gGMKR6aelN+jXNzkK7AZbSILfIPNpjuHV57pKhwnCj
 38xg==
X-Gm-Message-State: AOAM530wjGLfQKKLpR5IadkPtFAqSPeOhA6rbK2t0558kx9XUv/ivOcL
 izc/SJ22B2lozzgsgT7qNJGqVw==
X-Google-Smtp-Source: ABdhPJxFcz2lm2/hfGgOO3cwto/v7M4ze2hWUHK5rd5mQN6CYOKVEj4fK2UGpbvGa7fyTR5s1kvLFA==
X-Received: by 2002:a4a:a4c9:: with SMTP id c9mr14129371oom.21.1640717382428; 
 Tue, 28 Dec 2021 10:49:42 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 90sm3133883otn.59.2021.12.28.10.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 10:49:42 -0800 (PST)
Date: Tue, 28 Dec 2021 10:50:42 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH] drm/msm/dp: populate connector of struct  dp_panel
Message-ID: <Yctcgslq283lZXW/@ripper>
References: <1640713908-7453-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1640713908-7453-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 aravindh@codeaurora.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 28 Dec 09:51 PST 2021, Kuogee Hsieh wrote:

> There is kernel crashed happen due to unable to handle kernel NULL

It would be wonderful, for my understanding today, as well as people in
the coming months to be able to search for the callstack etc on the
mailing list, if you could provide some details about the crash.

E.g. a callstack or description of when it happens.

> pointer dereference  of dp_panel->connector while running DP link
> layer compliance test case 4.2.2.6 (EDIDCorruption Detection).
> This patch will fixed the problem by populating connector of dp_panel.
> 
> Fixes: 7948fe12d47 ("drm/msm/dp: return correct edid checksum after corrupted edid checksum read")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 71db10c..6a938a2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -197,6 +197,8 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>  	kfree(dp_panel->edid);
>  	dp_panel->edid = NULL;
>  
> +	dp_panel->connector = connector;

So you have a dp_display_private object with a panel and a connector
allocated, but before you manage to associate the two you get a HPD
event and call this function, so you decide to stitch the two together
just here in some piece of code unrelated to the initialization of your
objects?

It sounds like we're lacking synchronization between the initialization
and the HPD interrupts and this would not be the correct solution.

Regards,
Bjorn

> +
>  	dp_panel->edid = drm_get_edid(connector,
>  					      &panel->aux->ddc);
>  	if (!dp_panel->edid) {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

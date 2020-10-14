Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4106728DA27
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 09:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E746E9FA;
	Wed, 14 Oct 2020 07:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F936E027
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 00:36:55 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id gm14so491396pjb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 17:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=9imkWvMot1MzH+ehLJwgyaxPJxuOFrOphid59RBNFTo=;
 b=HmED74OGfPJeiSnehPVeZnQq0lW4FvMWAIKlf6FYb2rHCFz01nDI709PwTOJWBOj/0
 MqXvSM8QPTAfDM0pB4JgvphWDxwGWuejZM0o8302Eeidj20nyPmXqdAJwiviFChpfl/v
 s9g+sRDQ98tTWvQF3cB4/9eQhNX2CD4UTJsuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=9imkWvMot1MzH+ehLJwgyaxPJxuOFrOphid59RBNFTo=;
 b=GiwwkzNGrOui2eMrDw9MhW+u7d9yYkbPuIX0pJ7STdWfWLhTI9w5j9W5nrlwKeBLhx
 OhDUJKpDlyT/j3Ri/NBsMXOn//wz03ZyFTUDeShJiUk9Aa9XI7cNjH6YUGDhuAMDL3eP
 mOHUniGsd7UFtof9yPD+Q5q6HgyzV7tzAblaaeR+HBQSaRG7+E39epgI0i/Np8SQ8VS4
 XeQgWr7Zbz1QeS2pgwaK2DTDds4DmzzMzRndIskXptcGCCZyih8bc/9oZ8NsWKMeIWKY
 rgBD4ahNvWwbngOh3eUe9y6nDRrJgutHZ3/yw4d8jdQdQBfSPdKXvBxXHMKnMY2q6ORO
 dVqQ==
X-Gm-Message-State: AOAM531w5Q1MigckrN0rgZ4DwyZJMf+C++3SpXwjMwtTk6JFpda/6PDP
 vOLH2CwVLITMdBFGbbQPMeWZ8A==
X-Google-Smtp-Source: ABdhPJz//cpuLR3q6+8Xtvz7MFQA92okbEa8Sfnd9VzfzsJ3RYQ0rokXMZ0mF0DjfGRDqJuhhbjOPA==
X-Received: by 2002:a17:902:708a:b029:d4:cf7c:6c59 with SMTP id
 z10-20020a170902708ab02900d4cf7c6c59mr2262370plk.52.1602635814708; 
 Tue, 13 Oct 2020 17:36:54 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id w10sm455476pjy.13.2020.10.13.17.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 17:36:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20201013233522.5222-1-khsieh@codeaurora.org>
References: <20201013233522.5222-1-khsieh@codeaurora.org>
Subject: Re: [PATCH v4] drm/msm/dp: return correct connection status after
 suspend
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 13 Oct 2020 17:36:52 -0700
Message-ID: <160263581242.310579.522359444728182805@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Wed, 14 Oct 2020 07:03:59 +0000
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2020-10-13 16:35:22)
> During suspend, dp host controller and hpd block are disabled due to
> both ahb and aux clock are disabled. Therefore hpd plug/unplug interrupts
> will not be generated. At dp_pm_resume(), reinitialize both dp host
> controller and hpd block so that hpd plug/unplug interrupts will be
> generated and handled by driver so that hpd connection state is updated
> correctly. This patch will fix link training flaky issues.
> 
> Changes in v2:
> -- use container_of to cast correct dp_display_private pointer
>    at both dp_pm_suspend() and dp_pm_resume().
> 
> Changes in v3:
> -- replace hpd_state atomic_t  with u32
> 
> Changes in v4
> -- call dp_display_host_deinit() at dp_pm_suspend()
> -- call dp_display_host_init() at msm_dp_display_enable()
> -- fix phy->init_count unbalance which causes link training failed
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Can we add some sort of Fixes tag? Maybe the beginning of this DP driver
support?

Tested-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

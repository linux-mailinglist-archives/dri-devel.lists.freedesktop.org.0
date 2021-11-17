Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E198454115
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 07:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0836489B3B;
	Wed, 17 Nov 2021 06:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88FB89B3B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:43:41 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id s139so4145222oie.13
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 22:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=yTAfmJ0bF8bSpAIUOFMDRewe/b9IF2HUsW2XZzfQGbY=;
 b=cDTxUGFgV+D2sWJDHB8Zi9H3rp6GLIGbwCi5qGeau2co/SriSjaDiymu3yDRMT1rF5
 4a6UtJ7a6xWVyKz8fWziI1O/HDtR/5w9dXosg9B+rWhGtewQxhYEoSFzoY1eyJMEaqwK
 nwkal6A6S+uqNqnk52M/yvJgNQF8JtK9UimdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=yTAfmJ0bF8bSpAIUOFMDRewe/b9IF2HUsW2XZzfQGbY=;
 b=6/aYAkjxvr+PxWdCSg75EwAiKkiq6xvr8ZE5l5vF9rm/9aGm7eOBS1kBNPvBGCUjjy
 ZNH7OtQW9kxiIKMFuOKXaaT7EQoo10QjLjoesNr0DWZqzd4ch03ZYJdANWvnb89FBoqM
 GMqCmKzP8WxCCySv11+fYq8qDnFl+Vukzski2uroJnPS81oMo+oSH5YGZ4e+ifGyEdS7
 v8RNroigL2fuO2mbLsp6DVAqfAq0j3KRl6r8/8GKCIMnOO0k1Te9knd1pMOXY5hNuHTl
 EBxzSmytmPXtFM/GmkaTBEeXpoTfOCDw2o+RhHZqdKJyITRmmNTXJnJLZa2hnlIq5Brs
 f/WA==
X-Gm-Message-State: AOAM531U+Wf7DNKhziaw2pF1UFOCtb8SUuiDKwPfM+dbBClonfloG31o
 5MdBLdro8ppdvgGpW1H4k/l/jGhJAZd/LURk9njnikGrAjU=
X-Google-Smtp-Source: ABdhPJy9zCKUwdtUbQh78Q+Mv0EaKjj2J6iuCujpOCBSenzXXg7GYdTuGTdgDNcZxW1F9VTN+CjK8QtCOOdSrwB/lfM=
X-Received: by 2002:a05:6808:211f:: with SMTP id
 r31mr12120140oiw.64.1637131421167; 
 Tue, 16 Nov 2021 22:43:41 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Nov 2021 22:43:40 -0800
MIME-Version: 1.0
In-Reply-To: <1637046458-20607-3-git-send-email-quic_sbillaka@quicinc.com>
References: <1637046458-20607-1-git-send-email-quic_sbillaka@quicinc.com>
 <1637046458-20607-3-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 16 Nov 2021 22:43:40 -0800
Message-ID: <CAE-0n52n1qzrODJuFN7pnWvj-31uGop9h+HTUY7wXuuX_sO2SQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] phy: qcom: Add support for eDP PHY on sc7280
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_abhinavk@quicinc.com,
 quic_khsieh@quicinc.com, seanpaul@chromium.org, quic_mkrishn@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2021-11-15 23:07:37)
> The sc7280 platform supports native eDP controller and PHY.
> This change will add support for the eDP PHY on sc7280.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

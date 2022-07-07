Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5428E56AF2A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 01:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A857110EF48;
	Thu,  7 Jul 2022 23:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221ED10FDC9
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 23:56:07 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 2-20020a4a1a02000000b004285895836aso3631735oof.4
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 16:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=9ntP1WDLnC6Yx7jFk7jZStLEDziwDqk+ZlwPsvE1xWs=;
 b=bXuaYmps3SO/5Gg3nxuV379NqM1hoHcyQbvWn/KnsI4akOLpYz+plOpnE5dn9mRH7Z
 Ba4pUy+ktATqZI/NUhKueHyeRHspJaPiUIEewUlCm9RQVmwSizU1Qt7YSZVn+1svIEIs
 iVy1O+bxNmKs1ULMXdsz6tbhueBjHT39Ggtcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=9ntP1WDLnC6Yx7jFk7jZStLEDziwDqk+ZlwPsvE1xWs=;
 b=qRpLBc7+lMyhYc4pWUmEE4R9PE9t32hDkCGYQtEfFc2R7Uj0dxIM76ag0Ir4q2SYIp
 qvQY9ydnH/AdvuF+zdLXkJYUFzQQYPj0t4eVea8WrfQzech6+ndqAIHUgufG9WG6Jm9w
 fW7NuYhCsVSkKmOt26AACwgAjGh+d/rWuyu5u+DsVjNMdoYDIJzCBFcfyN2c755MOs2u
 KovwLq+4CpM/gjPK5ysNSEC9SdMvyeYkujOKmHA43f3TQ7URXpww964aft5f4aHjT1d5
 6UPnjQ1GyY0bheDZZYD6ueAMT9Dqih0yPIV9hKdsDdhix6wrVMBrAdjoCAJ+KwzGyyGh
 Uy0g==
X-Gm-Message-State: AJIora+U0VLI8JnwrNBWlfjxUDgE+P+sTQsSJP+vQEeor5sZrzSwS4O5
 p785xl8wO2ua28ub68i3UtaMxOe8+sYw2F0dVWCalA==
X-Google-Smtp-Source: AGRyM1s5aRJwu3pF2TR9+JflN9Xt6rSHUQxPIdyIsKnn5I3uBjzRJFONFzrC6JiOmFqLVKBgHodXNbkvtUIvE0e4ebU=
X-Received: by 2002:a4a:81c1:0:b0:425:b01b:f757 with SMTP id
 s1-20020a4a81c1000000b00425b01bf757mr305054oog.1.1657238106090; Thu, 07 Jul
 2022 16:55:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 16:55:05 -0700
MIME-Version: 1.0
In-Reply-To: <1657135928-31195-1-git-send-email-quic_khsieh@quicinc.com>
References: <1657135928-31195-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Jul 2022 16:55:05 -0700
Message-ID: <CAE-0n506RwOi8xqVEAaLjfhb3vey7R2FF_72_F-nmgrXrP6RWQ@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dp: make eDP panel as the first connected
 connector
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-07-06 12:32:08)
> Some userspace presumes that the first connected connector is the main
> display, where it's supposed to display e.g. the login screen. For
> laptops, this should be the main panel.
>
> This patch call drm_helper_move_panel_connectors_to_head() after
> drm_bridge_connector_init() to make sure eDP stay at head of
> connected connector list. This fixes unexpected corruption happen
> at eDP panel if eDP is not placed at head of connected connector
> list.
>
> Changes in v2:
> -- move drm_helper_move_panel_connectors_to_head() to
>                 dpu_kms_drm_obj_init()
>
> Changes in v4:
> -- move drm_helper_move_panel_connectors_to_head() to msm_drm_init()
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

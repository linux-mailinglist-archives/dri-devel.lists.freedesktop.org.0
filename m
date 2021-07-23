Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6138D3D33FF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 07:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A65F6FA42;
	Fri, 23 Jul 2021 05:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC216FA42
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 05:23:53 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id l126so716332oib.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 22:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=QrIRJF9RofbYH9iU/wiHncDBO5Vg6i2VjMBiDfskl+c=;
 b=AaOHiU8hxeiJRQI/nQxcRonIBltBTvgos+tyJ2OweZKsTeBIweQGGChjgbH680rgGX
 NdHCLzFKNWs6wchpfAQzRRpRDTAXLFF9flDPZsfHr84g1AoSYW+nmKqKiiX3B0DsH90z
 HxXhUeRpjDvkik0rb3OX/Cwgv3gGa4O99n1fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=QrIRJF9RofbYH9iU/wiHncDBO5Vg6i2VjMBiDfskl+c=;
 b=ZA3bfw8XH7X/YtOVo0SoJMapEh8tO7oLJn8cR8FAxFT52g6iE53Bm8rkVc3yckYN6k
 elLNbgLFRkELYka9lx/TswYNh4lUeh7++T/btkpYNS88zhVf0HzU8CO8Dr8MfsldWnAO
 9f5D1bd3btE+HADdCs7zrcAXpk3JR+R4zijeWX0CjqRDmE1Zm8kIWHtHO4hu2kctG7dV
 iexWQGnHY2u395XgJF8f+WIJLM9ePU+ImYaLJdzaDh0rXkCdEobVcUHVBblHjtbBSm1i
 QGihQaFbef6LkG6Bkkrbn4FaIcpitQepBQrJWCb98j42I4dq5S18duUEdAzVp0RXInka
 AqWQ==
X-Gm-Message-State: AOAM533qYeCuJUxNeiDn5kj/zMIH2IiRZ/fyOLoDlcDlg9Z9XyyIBh0q
 yBuKNHW5r1tAVplRIFQRCLvFFldYHtXVveGllaWZhQ==
X-Google-Smtp-Source: ABdhPJx5qd3hiNyuX6akrBxVGshX+vTI7xdfErJFXbTfeV1Ph6BJBjuKjtmFvXf/oMSd23Szqu+9XGYUYZITAQzqg9s=
X-Received: by 2002:a05:6808:a83:: with SMTP id
 q3mr7787904oij.125.1627017832959; 
 Thu, 22 Jul 2021 22:23:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Jul 2021 05:23:52 +0000
MIME-Version: 1.0
In-Reply-To: <1626992117-28887-1-git-send-email-khsieh@codeaurora.org>
References: <1626992117-28887-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 23 Jul 2021 05:23:52 +0000
Message-ID: <CAE-0n50QeAEbphveMJZrPFHg87AyZrTFQdGV2Makc0XJKgNfqg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: signal audio plugged change at dp_pm_resume
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-22 15:15:17)
> There is a scenario that dp cable is unplugged from DUT during system
> suspended  will cause audio option state does not match real connection
> state. Fix this problem by Signaling audio plugged change with realtime
> connection status at dp_pm_resume() so that audio option will be in
> correct state after system resumed.
>
> Fixes: bd52cfedb5a8 ("drm/msm/dp: power off DP phy at suspend")

This should be

Fixes: f591dbb5fb8c ("drm/msm/dp: power off DP phy at suspend")

> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

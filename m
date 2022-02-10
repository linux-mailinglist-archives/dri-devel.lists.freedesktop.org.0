Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC004B01D4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 02:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B3210E290;
	Thu, 10 Feb 2022 01:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FA710E308
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 01:16:45 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id i5so4452303oih.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 17:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=x2k5/p2+1EreJcvphg39ZeoqokALorRFjM7MtNKPEW8=;
 b=fLnwc+dZF5T7HAKKi4KAZvW+YcEzG6KqggXlylHCzvgPRpHFw4TMhuXKeSzGG151L+
 C0xOcGsNr4rJkVaFUgnFnCsNZEOzEOLzW65GoVSP4WCWs/rtWSM+xcc7IGI0RjnRGQFH
 DECB2VQvrMJKzGQ6zSTf2E0tUXzXnxTEQgNyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=x2k5/p2+1EreJcvphg39ZeoqokALorRFjM7MtNKPEW8=;
 b=2bgAX4bBnBY4BmP/IgKpqujH4I7EB6l5IpBgK32LUgMrUfm9K0bxjSDWBB3yz6H1wU
 kySUEQkBSA2nkCo1pTziDgFaxufSD/gLbwy6bcMT/1ChN/PwkY1C0Re3HzQuVeE4kjMx
 Ltvbc1ibEhH5k1kGIuIybnHjo4AP2fgKxW118MAThtthJhcV60ZXSksHnm8ZPb4fg49b
 U01hUHkdcUt0xPilhtZIOE9a3w97v63AGrCkcXuOEc9sxWi7Ve5iB3diwiBDOJMmi0li
 o6CSXSGn6LtFbtrg2YxWAgWj6/ei1KquVPi1ybbfKEG51fVwRHaScCYqvNG/HsUX3MXu
 YYjg==
X-Gm-Message-State: AOAM532E2thdnyXRYC4ydeAbIJbHoWkfmwi0Z4rpQnMqRfk7mOjYJD+J
 V9gEDhR1039O66obkDU1wd2Pgs/ueTtdsE2WaWrOTg==
X-Google-Smtp-Source: ABdhPJwLYBmMx5NDKo9m7NEKru/pKEgLewZGXLcS52Fihf8YUAInfps3SIKFvwGtmzu/zeGA/Q/klzGVKCkvVQjfOf4=
X-Received: by 2002:a05:6808:190f:: with SMTP id
 bf15mr60866oib.40.1644455804491; 
 Wed, 09 Feb 2022 17:16:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Feb 2022 17:16:44 -0800
MIME-Version: 1.0
In-Reply-To: <1644396932-17932-4-git-send-email-quic_sbillaka@quicinc.com>
References: <1644396932-17932-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644396932-17932-4-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 9 Feb 2022 17:16:43 -0800
Message-ID: <CAE-0n50FK4FSr6Xau9-UBYk9-0kVrETkCPr8TaDrPGS7BN6pMQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/panel-edp: Add eDP sharp panel support
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>, agross@kernel.org,
 airlied@linux.ie, 
 bjorn.andersson@linaro.org, daniel@ffwll.ch, devicetree@vger.kernel.org, 
 dianders@chromium.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, krzysztof.kozlowski@canonical.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, robh+dt@kernel.org, sam@ravnborg.org, 
 seanpaul@chromium.org, thierry.reding@gmail.com
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
Cc: quic_kalyant@quicinc.com, quic_vproddut@quicinc.com,
 quic_mkrishn@quicinc.com, quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2022-02-09 00:55:31)
> Add support for the 14" sharp,lq140m1jw46 eDP panel.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Can you share the edid-decode for this panel here under the cut "---"?
It would help to see the timings and make sure everything matches.

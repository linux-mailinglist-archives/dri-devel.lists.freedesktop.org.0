Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A85D13D19DD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 00:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A1A6EB48;
	Wed, 21 Jul 2021 22:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCFB6EB48
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 22:41:30 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 f93-20020a9d03e60000b02904b1f1d7c5f4so13740otf.9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 15:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=8tFkveikWGKHyoMJpaY3v9EmW9OHfpk/4+Rv8pSLhaw=;
 b=VSje6LWppRrx41vMaJH8+az7aeUTBbPPEmHq2CfO0WLP1LmVI48yuoLFKY8ummLolh
 MTW6XiUtEh6dc7mP5cTDNdk5DzLc+hmxu142zujZynzE6jYN8aqkm+kNKx7ZCMj/vZux
 SU20wbkOWK9sYoGRkbWnhwHYHDJIoGo5qgOkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=8tFkveikWGKHyoMJpaY3v9EmW9OHfpk/4+Rv8pSLhaw=;
 b=OOIkTFLhNTHnG7i+QVp7qE6Ia3Grl/f7LTfdzSBMYskvyMEoCopUCX02vrCAM4gaZU
 gnNER2QGt4KdC7trcvjO1feP4luJ7Co7EpcDly6GIF4YLBo2W/sdS2BQNSjJ44h/jgNy
 R2kCOkJJgfQSAP4138lmpHR4LiZZRa1HECXiPUaMSEw6T52IG5WlHIN7kWctQ9yVW7Kh
 CavItENhwB7inZk+QPRqYLliRK6ayGVRpI2StDIDM24czU7XR8/67L6YYnESqxe+nU5J
 hbJOn+xQBOXd1qwx+sHbK4VxAoADbQuXQpdXmxgcK+VfVOZxv5tX+YrDZiKqrQLNH1hZ
 uw6A==
X-Gm-Message-State: AOAM532p8pHmMXvnJXy8lokorQaKUHLWRCDBy6G/xPeejLRnyu+TMLuM
 Lk29x82hioFptsJoCAff62UJ/x3xbQ1O6VBAju4OQg==
X-Google-Smtp-Source: ABdhPJwwtgsrtyqzBuj1DRjgsHKLLxHFhAJV/T2ZW12VgttzYji/bsI5Wgec8BIoUSxqV9yPHYFOb7uz+/+23sbio8Y=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr27568157otl.233.1626907290064; 
 Wed, 21 Jul 2021 15:41:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 22:41:29 +0000
MIME-Version: 1.0
In-Reply-To: <1624365748-24224-4-git-send-email-rajeevny@codeaurora.org>
References: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org>
 <1624365748-24224-4-git-send-email-rajeevny@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 21 Jul 2021 22:41:29 +0000
Message-ID: <CAE-0n501_+htzvSp6pgMxxUaWMeZ7qLSKN1fXNWbNX1kwyYgTg@mail.gmail.com>
Subject: Re: [v2 3/3] drm/msm/dsi: Add DSI support for SC7280
To: Rajeev Nandan <rajeevny@codeaurora.org>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
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
Cc: jonathan@marek.ca, mkrishn@codeaurora.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, robh+dt@kernel.org, kalyan_t@codeaurora.org,
 dmitry.baryshkov@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rajeev Nandan (2021-06-22 05:42:28)
> Add support for v2.5.0 DSI block in the SC7280 SoC.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

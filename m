Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207E63E8308
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 20:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1B289216;
	Tue, 10 Aug 2021 18:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8639689216
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 18:31:58 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id t35so412236oiw.9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 11:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=bRoFoIrgb6DbxUcPZ4qNbvdQX1dffX7W/rihsgTb2z4=;
 b=QWJyaYLaSvyDInTM/b9ve7OmtT4fI/gbefn4OkqqYoJoS7qSL4WjCukVdCd2aFJn2+
 zgWtJrsWMWdriv+2tJAI0RqmwdkA/XtnmcxTNQ7J1bav4E8LazOhIbDE7cG92Wk9e7aA
 uptQrHkXkrQlnroBRb7ExPIZiqo7aqnrrjCRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=bRoFoIrgb6DbxUcPZ4qNbvdQX1dffX7W/rihsgTb2z4=;
 b=JrqEKYDjDGpMVjOeqk/+k4X+9ZeU9L0Ie0nlFdV1rRHndHxk1EakWwK7ZmA2S7yWqV
 H6imgdK1bYXxIFiIlvJTTxsJEEmf4WcGA9E6MBLyl4x6aYIuiWM4LjVh+/2pkuisnwMo
 wRBAiwWuxZwIb0QOMwxRhLH5v/DSOOSkQ2r4KxIDUVL096/56rbw++peOiNP6GgtoK0t
 TxzMADod+2LOuiWU93gz0QM7bzuJ3+AHXUWPR5ECJ0gMAsP90Jqexg7unmzzsK+uRnEL
 lIqlDnH6XUelAKAQCoOHGYb9G2SB3k6LLWZxPY4HyZpvKetNnRFDZb/6BWnEz/0yhij/
 POJA==
X-Gm-Message-State: AOAM533ovKTL0cORJoQz12IrxaGmygKOfEfQcX/wiBsPljdbyml5cGec
 9M2+uJUPNzMiuaJmCzgcmKv2B7HEEXyvm+EkVPRTnA==
X-Google-Smtp-Source: ABdhPJzuO8bdHRY8YfA6qtIShSohbIviDAruhTY93vX+OuVbguE9JaTNgfjrPkPDvsy+kBJf3jR5BGgDV0t7AZoC898=
X-Received: by 2002:a54:468d:: with SMTP id k13mr4595160oic.125.1628620317662; 
 Tue, 10 Aug 2021 11:31:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 11:31:57 -0700
MIME-Version: 1.0
In-Reply-To: <1628609362-2109-1-git-send-email-khsieh@codeaurora.org>
References: <1628609362-2109-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 10 Aug 2021 11:31:57 -0700
Message-ID: <CAE-0n51wQMmL-TYshTugGbR7JNnVeTq257OQMMQ6LSTcB30w5g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: add drm debug logs to dp_pm_resume/suspend
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-08-10 08:29:22)
> Changes in V2:
> -- correct Fixes text
> -- drop commit text
>
> Fixes: 601f0479c583 ("drm/msm/dp: add logs across DP driver for ease of debugging")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7378054DC16
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336A410E54A;
	Thu, 16 Jun 2022 07:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B77A10E54A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 07:44:44 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-100eb6f7782so982953fac.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=7kECHAE+GXQYNLXmd8ZAfx5ZSTEycGpfhYD0voXiTLY=;
 b=ZlB6csKF4ISyBxvF3WZVmH3ccTYq8q4zos7p5zIrY45z3g2k0cOgnf+AM0UMcW2kOY
 eOvxJHlLzUFnUYOpkDTI0IyCG6rv7wCgMPUeERoOUGhv0WeyUHCmnKDVV7QvSp84BFbu
 k+cLWnWHOoAaGRUXFo+K3yI/RQyjA3047e6m4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=7kECHAE+GXQYNLXmd8ZAfx5ZSTEycGpfhYD0voXiTLY=;
 b=dXhMiP2EAq509xW0IJOT+fiALQ7iSx+9D4izL5XZxI74yJpmlyUIAacm0wAWqWg3hb
 BazUx6J3qETRLko6Z8TQeWXgUwYKDiiMNo2tqQGBWvKd3FwX1qcyHBnF79Lm3nEj7H4g
 gl0F2utlNKV3w/AoyWZ6YIZ1zTfpIGJ9qHyH6YdssATEttSGHk0sUcNLN9E+v4YFCsRQ
 zZ/aheDXCOChhS/mCufNoStQGPM4IDuVIn70wa1Blq9i+tf9ZFpoy06eYQr9d9r1hLCn
 bDjNKaTdOGMuBrTApJRuQpx7wSHh3PEFWrRkbDlsziA/pWDcSZsMadt1xa6ROg0ASzCJ
 wepg==
X-Gm-Message-State: AJIora8wvDEzervELeQaNUmqIfXy4mGUk36tWWnjZKqOdHen/hC+p8Zf
 qJ5yVhBcFlijAhdDBQWZwjuX+CGQ5JB2LxUH77ZaRw==
X-Google-Smtp-Source: AGRyM1vropgb4ykS9bw8dwWFYy2i5x4/eBW5pZbUUEFI8RXotaQSBW4hF9nijvQLZFy5GYwRMk2MzJTUIy2iyjfCkaQ=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1973274oap.63.1655365483669; Thu, 16 Jun
 2022 00:44:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jun 2022 00:44:43 -0700
MIME-Version: 1.0
In-Reply-To: <20220609122350.3157529-8-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
 <20220609122350.3157529-8-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 16 Jun 2022 00:44:43 -0700
Message-ID: <CAE-0n53dmgHDzEzKnRAX+1e-G5zYmvhSD9F0CaDMYzZyedU-ow@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] drm/msm/hdmi: enable core-vcc/core-vdda-supply
 for 8996 platform
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-09 05:23:43)
> DB820c makes use of core-vcc-supply and core-vdda-supply, however the
> driver code doesn't support these regulators. Enable them for HDMI on
> 8996 platform.
>
> Fixes: 0afbe59edd3f ("drm/msm/hdmi: Add basic HDMI support for msm8996")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

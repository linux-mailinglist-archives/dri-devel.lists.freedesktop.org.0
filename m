Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE0C4CC7C7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 22:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4F710ED86;
	Thu,  3 Mar 2022 21:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE74D10ECCE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 21:16:53 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 x6-20020a4a4106000000b003193022319cso7249055ooa.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 13:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=eBRpf0i/hx08EbAhrJon0eI377sVgFylnKUzTw3G8q8=;
 b=Y1noj0CZkDChL6WDH0DFVnqalSjczZxzPiFZ0aeG9zYus0XaN6W0E0c+xiS47WsUTD
 ZgMe8dZXS/qf/ONhNPJR4f1+nbsghpw7hKXWIuCZ2dI2eZgfich2+2SlwJUaZZCyE95W
 Uc9E55tWfiKT76d6Z0xLVxVmKTccsfJXDXIec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=eBRpf0i/hx08EbAhrJon0eI377sVgFylnKUzTw3G8q8=;
 b=0vXLFN3hLrw2SrLlAAT/qjzAsZBhWaLX4yCABf7RQLwXXMZ8bTFVMZubOiR0PE0p3P
 PY7+8PYgOoVdo2NU03IgXeso91hUfZjGK/Fhs5W0t6EgncWQ2J4HC2OAtVeLtBv095PE
 jvlXkRD38Wr9Zqt78+v0EBuWb8JQNsTc6Y5S7ZgCGxJDAX0wB5VZTT64Lg/AGohs06Ks
 uhRhgpkYhY16kOa6s7yH5q27FgJVyaf1Q9iWdyP7spfkLw7q/0ryJgE2K5T67VvByW0W
 3u+A//3KBP/ZZjNVR7P15VIt5se/YB1U/n9A0xSe/2dqAlEMxCjgUcCS0yIdBQuzgu3u
 cNCw==
X-Gm-Message-State: AOAM530ZKvlNWIrm+VEYSDX6YMsU4yLeSL9qbxyqpQpcvlAzXBhYP1L8
 foLYgbr+isVewH7iDzLEsvaDivXu/GauduGgP1FxsA==
X-Google-Smtp-Source: ABdhPJycDTkb12wMHQabG8QDoujORlwb5yF7X0CE3x/kQihq3Ki7wuKuov+4lGz1lU8+V2cIfN0D2vjvseXYvTdgcQo=
X-Received: by 2002:a05:6870:3c18:b0:d7:22ed:20b0 with SMTP id
 gk24-20020a0568703c1800b000d722ed20b0mr5555933oab.32.1646342213146; Thu, 03
 Mar 2022 13:16:53 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 13:16:52 -0800
MIME-Version: 1.0
In-Reply-To: <20220222062246.242577-3-dmitry.baryshkov@linaro.org>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
 <20220222062246.242577-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 13:16:52 -0800
Message-ID: <CAE-0n50ANGE0gQ6My2eXR4jhp5ivU6kvRcFCoUmmZ1rEoUT9UQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm/dpu: drop INTF_TYPE_MAX symbol
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-21 22:22:44)
> This enum value does not correspond to any of actual interface types,
> it's not used by the driver, and the value of INTF_WB is greater than
> INTF_TYPE_MAX. Thus this symbol serves no purpose and can be removed.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

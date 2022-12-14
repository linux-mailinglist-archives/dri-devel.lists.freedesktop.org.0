Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C930664D270
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 23:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3E410E4B9;
	Wed, 14 Dec 2022 22:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005E810E4C5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 22:37:56 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id b2so48062249eja.7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 14:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1bSdi2nTZFfN0KO3twl810Uns3X1CbpenS2xYlJiGPM=;
 b=QS+/BUVNsbN6h+tQwIBW7N0LXW4/Jg584fdK+n867YoxGH2EVT3pvpOv0U+9ZxfOF/
 rC+A8JiiEJr2R7MGbILNYNFTad0rr0C8KD/sy/c1V8PbqBkKH32/xb29IPq+heVzZkXp
 klpRQ11wYfFmdLXqkEepJLbDXUndJHe8njFAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1bSdi2nTZFfN0KO3twl810Uns3X1CbpenS2xYlJiGPM=;
 b=lter5RxPo8uYpaPh7v8V6SOySElxA07l0FW+g0yb7Wbm4E10nZdjb+8LSvw9G+GO4v
 eV9gJiQbXnHDV8nNU+XtzWs8jyO9e9+Fo1pk1fzhBXhATt/qNt65/e2hHij715p4HLjx
 gC4p/m7VbnM/Du6wiZDrycgZrrzrIaKj+jND0982FKo1iU+nBJ0MHXeJFeFqw3ETcv8P
 K25KZYI/Pw67B3q8X1h0DAku3JgU/TUKmtLRTwGWFrjAWKjb29eJFLD79y0Xm8+O02vh
 cqtWA7ooD70Vcoar7Egh/MDuzZo7T0+mGwA9N+Slu2plLyH41yN4j9zFeFSfr+4XkDHn
 oZzQ==
X-Gm-Message-State: ANoB5plxBOGT9s5voYgwtfQAwJgaQGbB2wexADNxBuSToPnvB897R8Aa
 exoHpzfl7FWcTa7E1yIq130jPFvHr7pmf+VVHgw=
X-Google-Smtp-Source: AA0mqf6BiSewUYSdJwpsOXriapLZ2FRE5RxCMlqWtRePJHkWhUTej+FEJa5Ux7Hddz+wPvS9z3DXlg==
X-Received: by 2002:a17:906:a95:b0:7c0:f684:9092 with SMTP id
 y21-20020a1709060a9500b007c0f6849092mr18670555ejf.37.1671057475321; 
 Wed, 14 Dec 2022 14:37:55 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 i21-20020a170906251500b007b29eb8a4dbsm6427807ejb.13.2022.12.14.14.37.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 14:37:55 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so532878wmb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 14:37:55 -0800 (PST)
X-Received: by 2002:a05:600c:2d91:b0:3d0:69f4:d3d0 with SMTP id
 i17-20020a05600c2d9100b003d069f4d3d0mr191822wmg.93.1671056974914; Wed, 14 Dec
 2022 14:29:34 -0800 (PST)
MIME-Version: 1.0
References: <1671052890-11627-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1671052890-11627-1-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Dec 2022 14:29:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UTeCU7BcfPMXz8J-9uOp_7Fn9PFdtFMsu46x5wKa0RyQ@mail.gmail.com>
Message-ID: <CAD=FV=UTeCU7BcfPMXz8J-9uOp_7Fn9PFdtFMsu46x5wKa0RyQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if irq
 is not for aux transfer
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, andersson@kernel.org,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Dec 14, 2022 at 1:21 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> There are 3 possible interrupt sources are handled by DP controller,
> HPDstatus, Controller state changes and Aux read/write transaction.
> At every irq, DP controller have to check isr status of every interrupt
> sources and service the interrupt if its isr status bits shows interrupts
> are pending. There is potential race condition may happen at current aux
> isr handler implementation since it is always complete dp_aux_cmd_fifo_tx()
> even irq is not for aux read or write transaction. This may cause aux read
> transaction return premature if host aux data read is in the middle of
> waiting for sink to complete transferring data to host while irq happen.
> This will cause host's receiving buffer contains unexpected data. This
> patch fixes this problem by checking aux isr and return immediately at
> aux isr handler if there are no any isr status bits set.
>
> Follows are the signature at kernel logs when problem happen,
> EDID has corrupt header
> panel-simple-dp-aux aux-aea0000.edp: Couldn't identify panel via EDID
> panel-simple-dp-aux aux-aea0000.edp: error -EIO: Couldn't detect panel nor find a fallback
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index d030a93..8f8b12a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -423,6 +423,13 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
>
>         isr = dp_catalog_aux_get_irq(aux->catalog);
>
> +       /*
> +        * if this irq is not for aux transfer,
> +        * then return immediately
> +        */

Why do you need 4 lines for a comment that fits on one line?

> +       if (!isr)
> +               return;

I can confirm that this works for me. I could reproduce the EDID
problems in the past and I can't after this patch. ...so I could give
a:

Tested-by: Douglas Anderson <dianders@chromium.org>

I'm not an expert on this part of the code, so feel free to ignore my
other comments if everyone else thinks this patch is fine as-is, but
to me something here feels a little fragile. It feels a little weird
that we'll "complete" for _any_ interrupt that comes through now
rather than relying on dp_aux_native_handler() / dp_aux_i2c_handler()
to specifically identify interrupts that caused the end of the
transfer. I guess that idea is that every possible interrupt we get
causes the end of the transfer?

-Doug

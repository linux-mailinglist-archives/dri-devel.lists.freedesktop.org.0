Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7D24DD1C0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 01:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD83E10E8F2;
	Fri, 18 Mar 2022 00:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766F010E8F2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 00:13:11 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id p15so14001381ejc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d1Z8nI+f/X46wuhlEeKlYiI7DuyLSgelQdOIPC94sVc=;
 b=dq9FFRkofEvY/IQ16q22b9/GAC3XOlX/hWO2uBaym9wfsa21t2RqyXXsmcT4+ouP96
 sP5cckwa32YJttSDlHHjJtcORahNzuY8gpmwhPkulTeNBPqbWSAOutMIuIyMEvN2fd/q
 cw6DsfvWgKS9sZLyHWDTyO4TD4lLr/+JK5JXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d1Z8nI+f/X46wuhlEeKlYiI7DuyLSgelQdOIPC94sVc=;
 b=OUEX8XYoM0f/pdNLFf07/uB+62kqfSFY9f9oIlmn1qgX+eUhPY4FVbMHMJC8FNtyeD
 iRhj0nC7EkLBA+xKf9gGRFExZcFxjVUaglfT7BFzwFeSAfHb6UpeGndLq/GMhJ7TJZWH
 c0hRqRxrl1/9UOvRMONG9J3YzQCUscuNo0vtv7BpLjf/RFUsPVtRN7LwfUPYZd3U+S9l
 CyntSLRuS67hWbZe4tt1E8gOrYpBfotmu89YAXv6IXVnGNZ9sM0UbQh7FBxsd1ACbleu
 HCFpcGvXixwvV+vB4YiOeT9qspMC16GIixILMqWVhAtWPKkl7uXkZkLmDWRmNvH/Q3gp
 UCew==
X-Gm-Message-State: AOAM530A0YG6xoDNHC2e9DdZF+PdCo+CyHFALI6KQ8J0c1NMxmUL4pld
 LVEbHqtGe/Bk/X0DQJIyIlOCBPty3slC//AiVLw=
X-Google-Smtp-Source: ABdhPJxPJ4NLVipjTxOHRxfoJ3rn2+wgYIfnY6WVNLBr2qVJLDarizlfQS69VucKDbLs4s6qA/p8Kw==
X-Received: by 2002:a17:907:c16:b0:6db:682:c8c9 with SMTP id
 ga22-20020a1709070c1600b006db0682c8c9mr6889216ejc.153.1647562389688; 
 Thu, 17 Mar 2022 17:13:09 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 h4-20020a170906530400b006dfb1125e24sm410525ejo.104.2022.03.17.17.13.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 17:13:09 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id b19so9611554wrh.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:13:09 -0700 (PDT)
X-Received: by 2002:a5d:53c6:0:b0:203:ee27:12ff with SMTP id
 a6-20020a5d53c6000000b00203ee2712ffmr3723782wrw.422.1647562388738; Thu, 17
 Mar 2022 17:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647269217-14064-6-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647269217-14064-6-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Mar 2022 17:12:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U6VfmGMYk6PeJa6y6P1-FsbKVjzD4tVGxnqMdEVY9n8Q@mail.gmail.com>
Message-ID: <CAD=FV=U6VfmGMYk6PeJa6y6P1-FsbKVjzD4tVGxnqMdEVY9n8Q@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: sm8250: remove
 assigned-clock-rate property for mdp clk
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 14, 2022 at 7:47 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> This patch is dependent on below patch
> https://patchwork.kernel.org/patch/12774067/
>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Similar comments to patch #2 about the commit message, but otherwise:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

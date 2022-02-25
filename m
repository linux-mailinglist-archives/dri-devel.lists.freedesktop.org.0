Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9494C4D43
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 19:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9832D10E8F7;
	Fri, 25 Feb 2022 18:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8003310E8FE
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 18:06:16 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 r41-20020a4a966c000000b0031bf85a4124so7386732ooi.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 10:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=I6MkJlQQ4hU61fN5YrqAtX/5cqN/fcZrZGOgyZvO0uI=;
 b=OX3tyht/4LSsOvRcTrgfeXkyb76HiSQ7W8pI7J/RTBbroR/+j4T5kvlW2WmKmUzG/H
 xu2NViAASbIERVgMW/VanajirDvxVwf0ERZWB7p3LhGVPmT1IPo1TuayrNHhrLPZUOdz
 XJcFu2aCb6m5c3GwxNFlRaO8UGW/64pJTguBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=I6MkJlQQ4hU61fN5YrqAtX/5cqN/fcZrZGOgyZvO0uI=;
 b=4zPsk5wdJUzAnBWQfAjbIZ3FoetCI5cpvuTMqs+rjcllbL3n6tqL0F1bH2VgL1Vg+y
 XtawLzbLxni80s5lXrcrnxDkXJDumm+7zXq5dA1N98siOlmF6iVSMm9MkNsaQOKiUqBd
 hG2ICGyvzxExw24OPz9c5XzJ4pTFLJMT2BSDf9I7VzkZb4q3R6sV1FPvrMXlpwsuHCI9
 6IGwYYJO7y/bySQxIu50vOHxRc2L2M2fH18GFxTTw/e3un7PgNO2KilzAZFwN6uZqM8J
 kau/Wt4Try7VNaX6Ep01SFe4MUQVI19eRVmicKMRSJIbOUqqsG67KpPiApZxAFAuej/j
 CYXQ==
X-Gm-Message-State: AOAM530zTNxkPGQzYwXefHkG/ScslnylC7+knUQLpA9B17jxsv9Z95PZ
 HEKb6qG1IvPGIljdD6V0/x/avGhSoDL2rxynawjZEg==
X-Google-Smtp-Source: ABdhPJwRntMGqiM80NVcK8YfATn8ptbQGr+zoLTrJsgW0P2rhsjH5L4rwRJB1IJxViwSIqXbAU1GJUTof7bUMNm0RH8=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr2012649oap.54.1645812375839; Fri, 25
 Feb 2022 10:06:15 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 10:06:15 -0800
MIME-Version: 1.0
In-Reply-To: <1645804670-21898-2-git-send-email-quic_vpolimer@quicinc.com>
References: <1645804670-21898-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645804670-21898-2-git-send-email-quic_vpolimer@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 10:06:15 -0800
Message-ID: <CAE-0n52OPUEMO4iXP_6LuRcN5r+v-9oZoRwij_y+bwnUBC3ohw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64/dts/qcom/sc7280: remove assigned-clock-rate
 property for mdp clk
To: Vinod Polimera <quic_vpolimer@quicinc.com>, devicetree@vger.kernel.org, 
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
Cc: quic_kalyant@quicinc.com, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Vinod Polimera (2022-02-25 07:57:49)
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> drop the assigned clock rate property and set it
> during resume sequence with max value in the opp table.
>
> Fixes: 62fbdce91("arm64: dts: qcom: sc7280: add display dt nodes")
>

There shouldn't be a newline here. The fixes tag should be directly
attached to the SoB area.

> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 ++-------

Can you also update sc7180.dtsi? Are there others SoCs that need an
update because they're using an OPP table?

Doesn't this need to come after the driver change?

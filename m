Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FE34DD1BA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 01:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455DD10E8E8;
	Fri, 18 Mar 2022 00:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674A910E8E8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 00:12:42 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id dr20so13680606ejc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Zw9lPFduJ2icojxhfJ3aRjvx7VBmO2urvyYDaLJ4d0=;
 b=QMhgbox8xCb6ZSHg6qb0nNgah3j0TTlKYxHwcoQrl/cBMnwf4ZupJHJTrgJFw1csLO
 g1QvwAy3Ivjs5kB+3lKnBlk25Xek9CCmKA1EGxMrbFc4YNYz+bwCOl0GB+vbKkHq5OuM
 64BLXfm8aEmJXYfZZ7n6OAY4gaM6+1LKmPmSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Zw9lPFduJ2icojxhfJ3aRjvx7VBmO2urvyYDaLJ4d0=;
 b=q6UFNsZvxsosVmeYHspthH8fTD5K/FBQ2X8n2kiquqHW/cuAN7Cz9W8VwdwOka2ACc
 ycoLTyy9aafCt5RD9UORfs6r1Xw6nxKGIxKr8vFzWXbOBFlI2LhUYnX5i3uaMRPyJCHM
 ZFdak/C9jJJKOdmHSYGGYS8DS9TipbW2K8Vixxc/RUYAeZJSa7GmL0uAsmB/2mtbE8Ee
 JPHskcK1ZCi9LW+7f6QCqhEdJwMXLeJ6sEzjSNi45Wb/1a/CsKqhAvlkgH2v6FvZXZiE
 cDO96iegtUvvqphktlf+4YDQYt9o1awYRYUYTXxjK2qRV6PDf1gnfSbMaGBwfwJiGfnV
 CvNg==
X-Gm-Message-State: AOAM5334utrajH2LMbM82h11J4cqnFPWrEZT3liHa26+DUkkFZOIXS53
 DBGvyAKRJz518MLbO48AUUXLIo6r7Kba8670AnY=
X-Google-Smtp-Source: ABdhPJyX2Ct8zVg422YYdO1h75dhNx/OlhDsMIVU/PaHmX+5Xqxf/hnSl0HEIeo5KfV3/nNX3YvxLw==
X-Received: by 2002:a17:906:5245:b0:6b8:78e0:5649 with SMTP id
 y5-20020a170906524500b006b878e05649mr7112342ejm.520.1647562359870; 
 Thu, 17 Mar 2022 17:12:39 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 b7-20020a170906490700b006b2512921b2sm2975330ejq.48.2022.03.17.17.12.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 17:12:39 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id r6so9654259wrr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:12:38 -0700 (PDT)
X-Received: by 2002:a5d:6f04:0:b0:203:ed96:8212 with SMTP id
 ay4-20020a5d6f04000000b00203ed968212mr3631950wrb.679.1647562358403; Thu, 17
 Mar 2022 17:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647269217-14064-3-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647269217-14064-3-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Mar 2022 17:12:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U5O8aZqQxtx2MGz791SiQtSwMBx2ww3J5qFaG=W9skjA@mail.gmail.com>
Message-ID: <CAD=FV=U5O8aZqQxtx2MGz791SiQtSwMBx2ww3J5qFaG=W9skjA@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] arm64: dts: qcom: sm7280: remove
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

Some nits on how you're referring to the dependent patch:

1. In the commit message it's really nice to also include the subject
line of the patch so someone looking at the commit after it lands can
more easily identify the patch you depend on.

2. It's better to use links that have the message ID in them. In the
past patchwork's magic IDs have been list.

So I'd write:

This patch is dependent on the patch ("drm/msm/disp/dpu1: set mdp clk
to the maximum frequency in opp table during probe") [1].

[1] https://lore.kernel.org/r/1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com/


> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

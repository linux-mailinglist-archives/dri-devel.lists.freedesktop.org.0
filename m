Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6804F4CC888
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 23:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8124610E32B;
	Thu,  3 Mar 2022 22:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5DE10E337
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 22:06:25 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 p12-20020a05683019cc00b005af1442c9e9so5798619otp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 14:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=a98NmfLmxPwElplSUG27m4JRPCjHA63Gw4sinoazLJY=;
 b=GobSvDa3VrHxA7j14C3x/nMk7a8rt3B6ncIMZ/6ZB248iDm/WJ8X5MFgEZQdYEgc/N
 xEMoAprLTjD4kd4E34oMF6mshpLM3QZk1bCU5aMsnZwUiBkujKZXg1ke4s8xeK505b/b
 L9cgDH8QI5yBfTrxVVK3LKj0pudr64Mqiia80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=a98NmfLmxPwElplSUG27m4JRPCjHA63Gw4sinoazLJY=;
 b=C1wEtyCSd1WNICyXh0q1pNAJl/XoQatqqUKn906YRlXU9/Z2Q8ESgUKzRavbsRKn2m
 1a63B+ui1ACfR75rM1OPzdPFyZYKTZMse6adZ07Ev4XiwfMtmWIPh0FjHKWp7zaDRmOY
 /BhSyJDbh5DBmUv+7ZwQ+kAYG9IfnyHLG5FinG0W0kvR0I/c5JJRRql4upJ8juQN9Tgk
 GIzjGoxoQF7tfbW7ujznqkNsdH5FWtGYY+6BUodsZkCqG6WTFktwY61B4BVDZY3SJm74
 6R402K9WC9gq6zdNl/Yy97tWjFFfTSab3QO405tbzWkoFeQDgSFLi4ed9i9wzQywDPSK
 GPHA==
X-Gm-Message-State: AOAM531f3Lv0tDo2M/hoSTivcGE4oIgsPuI0ik6q7zU1u5NP2Om41kJz
 E5E9S3Y+XV+PVHL++h7wPRaSO6DnnrzvQWi+BCeXGA==
X-Google-Smtp-Source: ABdhPJyJUmY4cuZ/bYuBxPB7/aTUkrncJRnI7ZEDL9i6xSU71lycPvci4ZQssT9MWj/uBiKHGegkItt395XnRD+8J2U=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr20656220otl.77.1646345184764; Thu, 03
 Mar 2022 14:06:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:06:24 -0800
MIME-Version: 1.0
In-Reply-To: <1646300401-9063-4-git-send-email-quic_vpolimer@quicinc.com>
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-4-git-send-email-quic_vpolimer@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:06:24 -0800
Message-ID: <CAE-0n51mFD0JfxxEHOxj=mTFYV92Cc0JDzEY2fxKn6OKOwjq+g@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64/dts/qcom/sdm845: remove assigned-clock-rate
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

Quoting Vinod Polimera (2022-03-03 01:40:00)
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> Fixes: 08c2a076d1("arm64: dts: qcom: sdm845: Add dpu to sdm845 dts file")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

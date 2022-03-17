Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052914DCFEF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 22:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82AD10E79C;
	Thu, 17 Mar 2022 21:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5171710E7AE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 21:11:02 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id w127so6925579oig.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 14:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=RDGPwozN+LQmHwPOGm8zL9xPqdfxPVJfVvPr3LEIR84=;
 b=ohgOnRsTHNsHzn4tKFhXj0CqnCXzox1Cdt3qCVI5G7pxE2w8oUcWQ2XY+g/7HDIjum
 5kLmEu5WFc/STfCzRxgNoLeCM5fs8exy+hvMzzZxkCDirnRZEWaJ2HcVw0qdMaWXJrE8
 T84XuIWK1JMGyXIM+hMKfwXOo1gTIVpL/BQ6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=RDGPwozN+LQmHwPOGm8zL9xPqdfxPVJfVvPr3LEIR84=;
 b=mAeBcFON8aohb3L39BbRct54/amwt/YqsWJHrrgCePejP3w75H7ure1c8zkU/lDOoI
 trEkS73WA5YbnrXHwMh3JA+K/dBuPS+PRZABCJQezueZPxe5ncjJNDWeCS1ME+gDThYk
 +KbTq39LmDoTR9v2O6cO0g3zcijyBJPapMtE3xpRquO5H6Qop3oHU70E4UQQVQEY8TxL
 +jKd736dlus/B7XWt5Q5KAFIT+TTLn/RYD0WWl2WthLINjtowre0mWMoidm/Osa0f76U
 3blKvwb0TXT21Hk1UikIi+O44L1ZWiWMMvM4WRwThEmCV1mXH5tDFDwcB7+uEcSnajS+
 JEIg==
X-Gm-Message-State: AOAM530bC+bYluntGkXAHCJ12rv54fKXRgxd6fBpOm0YwibnIkaeh9MC
 tL+ok25Z7ODdUl+rvDDytfgJp3dfdHQbk+hfEwk13Q==
X-Google-Smtp-Source: ABdhPJwxqH7a3bQvRdSLIQBod5CkCbz7k99FXmolKOyZUVcv+RbpXkv78qjENrJA6MeD+xN0XeA0bpgBgINxE6TF4Ng=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr3000622oif.63.1647551461460; Thu, 17
 Mar 2022 14:11:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Mar 2022 17:11:00 -0400
MIME-Version: 1.0
In-Reply-To: <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 17 Mar 2022 17:11:00 -0400
Message-ID: <CAE-0n51vfoOK_6B0yAvws32MtLQ1SvBPoQPHBFE14TLzZFUZaw@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
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
Cc: dmitry.baryshkov@linaro.org, quic_kalyant@quicinc.com,
 linux-kernel@vger.kernel.org, dianders@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Vinod Polimera (2022-03-14 07:46:53)
> use max clock during probe/bind sequence from the opp table.
> The clock will be scaled down when framework sends an update.

Capitalize 'use'.

Why is it important to use max frequency during probe/bind? Does not
setting the clk rate during probe mean that we'll never use the max
rate? Does it speed things up during probe?

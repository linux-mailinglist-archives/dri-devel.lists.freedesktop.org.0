Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4894CC8D2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 23:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA99010E35D;
	Thu,  3 Mar 2022 22:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568D510E35D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 22:25:37 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 p12-20020a05683019cc00b005af1442c9e9so5836312otp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 14:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=W6b+sDlQ6fUC15y02viB9CBBs238nvSYgTbrXnSADxI=;
 b=i2VfhCwlYGuVKKwL2On8iEbyuLJyjQn2RZoPEiUYjw6HvvOnr1qNcHvsCi6NwL3w+Y
 oau/hrdWaWQwCpLO3mcfsYYwxfC4AXGtI8JB3sTnm8lZsoE7z3uI2oXik9/GeHNZW4GQ
 KBU77p6PVW4i8EQ+/ue+Mj1ZHXAesYbfQbVW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=W6b+sDlQ6fUC15y02viB9CBBs238nvSYgTbrXnSADxI=;
 b=rYiNzcjB5j2h4cr6Q9oX9CgJnDZYjIdbVUBzMlbujQhyP1CHUiYjRUOu7gn82xT20c
 HIPlk/hMSc+diu5TDExIl38HyTGHmURbP+1Z+5GCCd4eNffNeG4DuomQt80nFqKmL72G
 kIBAYdCpkxX1LUjiJKR0vsavbNSOIMtLFXMRXSEImQfNzEqPQ2pCGNAFSKnZ/r9G6c7g
 Sr2JNOQ0H5Ly3Xijf3mG8eEOtqW4+XpGnOvePs6EcOnEcVM9Wf2POrACZm8Zq4KkVZTe
 q6W1VaEVVm3o7d/b22erd7hSPoh+42iZ25RjEF3sGHrmJtEbEbOuu9dBiWuHMKS9Tqhc
 9WyQ==
X-Gm-Message-State: AOAM531lvnVv3KTa21gBjiDu7qO9KK1t3GuwMQmvHhaOVFe0JZt4kNwZ
 cPEdKmpOi/X9UskVuTrs+cCUNOq0KjQUjsyct64P7A==
X-Google-Smtp-Source: ABdhPJySDSyjRk7hKcrQxOwP82H8qzkkTjbRnV9lItUMyzxYwnq8G8pll8AB/Htj0HsykplhTrDx4gVGSByQP9iDe0k=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr20039488ota.159.1646346336645; Thu, 03
 Mar 2022 14:25:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:25:36 -0800
MIME-Version: 1.0
In-Reply-To: <20220217055529.499829-3-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:25:36 -0800
Message-ID: <CAE-0n53Zy3BV3Z0A55Fo2vefndAKayPdUBfQy1i0BFj0cNMnzw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] drm/msm/dp: "inline"
 dp_ctrl_set_clock_rate("ctrl_link")
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

Quoting Dmitry Baryshkov (2022-02-16 21:55:26)
> "ctrl_link" is the clock from DP_CTRL_PM module. The result of setting
> the rate for it would be a call to dev_pm_opp_set_rate(). Instead of
> saving the rate inside struct dss_module_power, call the
> devm_pm_opp_set_rate() directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

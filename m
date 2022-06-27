Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A5155BBB3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 21:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EBE11B049;
	Mon, 27 Jun 2022 19:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478C411AE6F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 19:19:43 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-fe023ab520so14142086fac.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Z4BLBohMulDpiQGQwkIAJHPx8Gj0+neiaxc8ZfUwbzs=;
 b=FhXMKjKCFkRUVtJCSpdI3CkMufY98kLhUCjtQ6qz3yaP1HUGK46079/aOcGvtf4Vu6
 s+pQpMUiYXG3dEKsuLAYzthsqRht99ySLWEHdqzPnD0iTujCoBzl/SnTPfo7/qLYLSk5
 xZMyfJQ/H7aeX1nrYRJtFpD46dqGo9Z/K8TJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Z4BLBohMulDpiQGQwkIAJHPx8Gj0+neiaxc8ZfUwbzs=;
 b=vhTZKVqAtF6u+s7Dcm80IeSIsYg0R49NdHdFEsUm4QS7HeOVIKP/p/m5/zkZ62Zian
 IYH5+ioa0EUwNLTQu03JJltV+m/WIEaMBqEB6wgde8C8xNnL9BbazQRYlKqHD85nwAVX
 xGFNagX0p+EPCBqbFCqQYcysrfJdHPNo742Op0djYEADZWEaKR8/N90oaqODKzuok5si
 1iYb6RlPwOY4FxuhBPr3xII+Zap6CHf7Ibug32aCznp/ix1GnqTue7h3HP5XssGVrnev
 2Xf6xzGrdYjc6MFob/oYxjoj4dNOb1NORhAwbm+gLz6lb/4KNRET3du9qmYSmfqVpdS8
 9vJg==
X-Gm-Message-State: AJIora8+tXoBqNMFv9tiGAHxa461yiCdvKNBj8t2nVFhtQpEHrZRpKw5
 iCK4BuiYKYiKwdiVkE9Kl3VPVJoUYOu50W0BpBwTEQ==
X-Google-Smtp-Source: AGRyM1tD+1otcDiEgbeGj10XjPtM+eHLnUuS+FgxcbXZDbTbvpy7V+WXNg3lEBi9QRly6nt/PZ2uBEKT7eNNpzkWjjo=
X-Received: by 2002:a05:6870:b627:b0:102:f25:a460 with SMTP id
 cm39-20020a056870b62700b001020f25a460mr8608960oab.193.1656357582537; Mon, 27
 Jun 2022 12:19:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Jun 2022 12:19:41 -0700
MIME-Version: 1.0
In-Reply-To: <20220627165413.657142-1-dmitry.baryshkov@linaro.org>
References: <20220627165413.657142-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 27 Jun 2022 12:19:41 -0700
Message-ID: <CAE-0n52OA=qSOmez983_J0PCa4D5qte-1VWMZcAMqjpMytGgEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: use ARRAY_SIZE for calculating num_descs
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-27 09:54:13)
> If for some reason the msm_dp_config::descs array starts from non-zero
> index or contains the hole, setting the msm_dp_config::num_descs might
> be not that obvious and error-prone. Use ARRAY_SIZE to set this field
> rather than encoding the value manually.
>
> Reported-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

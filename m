Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFE7543DFA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 22:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5297C11A0EE;
	Wed,  8 Jun 2022 20:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAFC11A0D6
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 20:56:51 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-fdfe64231dso6333875fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 13:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=v7Nak7X+2PmTexgwbA2pTmn1vNdtzIgIfHNl64wkMKY=;
 b=mEzg4mxTna9YIc14kLmTZ96iT6nIeloTFrcrRA9gSf1SA66PLSTZuK0mo/54Moy1KX
 tcQBJ2f4ayMmDWuYEqxChHp/Qbz0mZhjKJhth7KTWDw5iMz/fYXzOWys+JLTZzciGqDy
 p00Km0Ma13AYbY9AgcVdR9H33r37rOt01y91g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=v7Nak7X+2PmTexgwbA2pTmn1vNdtzIgIfHNl64wkMKY=;
 b=RaIYVxfAQtUdBZYEl3Ziwsyf9pz28KMiiDyvUjPd/Ax5N81GfzwtIRGwEbn4LIvvC2
 qpImMsuVPuf83VHwwAouEEGUtVq8m1aichZ/T+/g5rFiBCJgdLVK/3rQ/isv+dX8UZkK
 ma/FPdaQ2KQogtbux6DYD6fjVFbIVgB50R416MkGSg1fNt40SLOlIwPQ+WyDkyETJcMj
 MTCZqe/Suc32yRt+YqJiDORRqP5AnVLA4McSlYL4lNqYyRsYgvdr1qEDClWufz1mEG5h
 ets8UY0X7FDCj8D3pbNT8bJlj+gypEEeAYFwU7ETsEaye0S5kAwqOyPWPt5sDL/lR7a1
 5buA==
X-Gm-Message-State: AOAM532lkvYDDVWIhgKYNnSUxHYIktNp4TVKzE0i7XghTtTvy3Nhvasy
 pdAi4K9qS4xql5VQ32NbL4+FQJA7+RxdcJrwENtNPA==
X-Google-Smtp-Source: ABdhPJxabmpsfSGW+bvn77sCFVrRP3NgpCd+ghOBpTDAkTie/k6DjxTP2EftIQ8wF8o2G0mJU2Xaer735XNxODj6Ncw=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr3368428oap.193.1654721810576; Wed, 08
 Jun 2022 13:56:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 13:56:50 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-4-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 13:56:50 -0700
Message-ID: <CAE-0n538RnLT0KgLhZVfowmWNAmVmSJ3AaJUOCxgsToL6+VmgA@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] dt-bindings: display/msm: hdmi: mark
 hdmi-mux-supply as deprecated
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

Quoting Dmitry Baryshkov (2022-06-08 05:07:14)
> hdmi-mux-supply is not used by the SoC's HDMI block, it is thought to
> power up the external logic. Thus it should not be a part of HDMI
> bindings, but it should be declared at some other device in the DT (like
> HDMI mux, bridge, etc). Mark it as deprecated.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

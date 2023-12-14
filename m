Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7688813AA9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 20:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E3A10E256;
	Thu, 14 Dec 2023 19:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785C110E22D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 19:23:01 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5e2e4c88c39so20110977b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 11:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702581780; x=1703186580; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yG7suejrqRA1mYwSLTmp+LIk2/7peq/L7UWtxNt32fU=;
 b=xvb2k9saArVCNtSTJ40HcV9j8qOzEBw/rTAHDpDU1md7R25NS5kDY7FFsE/i+ES5IM
 tRo6X7I+50AuWMd54u+WtW0uQ1418eENNBU7qLiJSsirFCsj+m7LQO+fGBDFfgBowrn8
 xDeGopKPZHgMtERj0OuY6aQoGO0V8OKjw1YCLdfiSvmWIFeGl86uki9n4N+HM9Td2L87
 8l822RLUyvkNbFISt4RwmS6IF10VNEOSVYnoKLrNilfJPPLpIcQEh31rAeRpLuDZDlQI
 Wo5DyCZSZvUjWminpRDMtC/nGyLqJEXZd/5LvNpUjFmubMYb7UYwTnmZoy8DsfLIDr6H
 gZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702581780; x=1703186580;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yG7suejrqRA1mYwSLTmp+LIk2/7peq/L7UWtxNt32fU=;
 b=eRCJlstVEdNbnaoKVGwxBdL4/4Qip564VsDSB38U5TK/y8DHCSTUYrK4aqi5Fpk9Ro
 vEH3FZzLfz3eG6j/Egfcq1nnMa4gDdEr7q1jSh5NXXujLf5v9HbogZCkZdtrKKF2D9UP
 K06fYh3jmHGQcwZ/tMhEsUPK38Dv2xNth18kOJSQIGoW4x0OMNdJeoSsqjk2J0DC/rik
 D0ucLubuYbvaOJyGRpqzHnQ8E7mKcJLmGoj+W7ixKqc82UhnC+/HmmHZZRY0dZJoqWdZ
 Up62hpe2LtKuLe4WVQAUpBpY0gK0a0yCsVO7FjpitwIPnKu8Bnm7iKQkB79MyPh3YFOW
 gRNg==
X-Gm-Message-State: AOJu0YxVXpEby1g0aPS65q2mG+GKWTZBfeGMY/ZgiCbdGrnPb16h+C/f
 uxNVsRn3Xlf3VaDkog0ZhzRm1vSgJNJ0jwXwn/sNFA==
X-Google-Smtp-Source: AGHT+IGHgEYjjKO+laGz9YkrYFuIJVcK8YCew+uKOMkZmZYgNxF3CHdtysJHXl6PvN6SIOfG66h1mq9QwrAZVits0sI=
X-Received: by 2002:a0d:ff44:0:b0:5d7:1940:b389 with SMTP id
 p65-20020a0dff44000000b005d71940b389mr9313100ywf.85.1702581780647; Thu, 14
 Dec 2023 11:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
 <20231211154445.3666732-3-dmitry.baryshkov@linaro.org>
 <6f3c4692-ac87-4852-9a60-6df64ad8a803@linaro.org>
In-Reply-To: <6f3c4692-ac87-4852-9a60-6df64ad8a803@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 21:22:49 +0200
Message-ID: <CAA8EJpoVXs4SmcwAwG57ii+C5j=W=z59XBdBq46eacG=njiEag@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] arm64: dts: qcom: sm8150: make dispcc cast minimal
 vote on MMCX
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Dec 2023 at 20:17, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 12/11/23 16:44, Dmitry Baryshkov wrote:
> > Add required-opps property to the display clock controller. This makes
> > it cast minimal vote on the MMCX lane and prevents further 'clock stuck'
> > errors when enabling the display.
> >
> > Fixes: 2ef3bb17c45c ("arm64: dts: qcom: sm8150: Add DISPCC node")
> > Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> Only patches 2 and 4 made it to me..

Hmm, interesting. I'll resent them.



-- 
With best wishes
Dmitry

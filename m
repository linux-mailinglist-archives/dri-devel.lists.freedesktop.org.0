Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A655B80E8C3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 11:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED1410E1B3;
	Tue, 12 Dec 2023 10:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CB110E1B3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 10:11:30 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-db53f8cf4afso4476828276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 02:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702375890; x=1702980690; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TrALaesQgyuM5VBjLsZWxJBv/FBiGl6WWHZcz62LCsQ=;
 b=U2yLa3Qmtt6xWN2vIH6g7zzVoa3naEdnO8Cob6UdYh6dISzsoy8B3qM7T0ql0p57Bg
 WxynO4NKp1KEhzEGpouc5ANESEQNWnIpkbQDQ7b+c+WOBHvapzyUdrRJlXhgAKNP27NQ
 g8NUSNE4MtaIPwjduB8NpPZtxr7S4cOfa+vQCtklLE7Hiztey4nmgvUS1Cbg/f5U3Z4F
 G1e/zHFCtwlqZ4OmRKX/1yXwfzRoajmUN43xY3tADWjtj9+ZwC7kBv3zhE7lW6uVBQTo
 peiVFQSwqyIx+lfcG/ahbb+fBjVZGKsFbKwD1iutG7sFe9fsSjJmHuUkz88SrlrXjzy0
 byCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702375890; x=1702980690;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TrALaesQgyuM5VBjLsZWxJBv/FBiGl6WWHZcz62LCsQ=;
 b=nu8lYcQFHno5xVQbyqKFeofnDHgWjGgKrFmwOAWKIJQSnESZoxWFActHKNJmb2TSgQ
 9iTXmWMcE0IfaCYUuzRxoQXQ9ZkH2Oe7o3jO9O/7jBqFYfH2P+/2DEkdpF1eh73zrg2q
 whYBUtydhTeupcTcGrXX0TrCx8yz4YfDF4FxVbB74nN4jxllLYqPtFa1PNyzvVTmTXtB
 fl+jfqZRxhkn6O5t2+G8whlu63pzmd9uySB+xk9Mv7PX5KfiawC7MQcmIVwcYvU+igJt
 oEWpW0cAs1vNC9gpj/CoavOX1kpE/G9vIWVcFNuCDt0cGwOsfVvtmV+vmfEPnlpSk02R
 1HUQ==
X-Gm-Message-State: AOJu0YzPc81y/JN/nC97rYJsMB2iWp4dj2iT0W/BpLWmyGWMQgA7t913
 cTTq1LIK0Kj2ZNOYUdYKw9GLzDn7JjxJMaz8opj+YQ==
X-Google-Smtp-Source: AGHT+IH4kRlISgKjiU5BqBf5v8muUL1cRp5jUmprgddz13Vqnjj9lFJY/CpDvj3Ul+mqmEg09KelU7DuIhO0LQXv9y0=
X-Received: by 2002:a25:787:0:b0:dbc:be12:f04f with SMTP id
 129-20020a250787000000b00dbcbe12f04fmr150338ybh.42.1702375889844; Tue, 12 Dec
 2023 02:11:29 -0800 (PST)
MIME-Version: 1.0
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
 <20231211154445.3666732-2-dmitry.baryshkov@linaro.org>
 <b23c3d03-8b0f-43b9-90d1-8d5c3a9622cc@kernel.org>
In-Reply-To: <b23c3d03-8b0f-43b9-90d1-8d5c3a9622cc@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 12:11:18 +0200
Message-ID: <CAA8EJppntst7FNnobURw--tdDzkrZWZhCDKRsELKNZ8RxpHyiw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: display: msm: dp: declare compatible
 string for sm8150
To: Krzysztof Kozlowski <krzk@kernel.org>
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

On Tue, 12 Dec 2023 at 12:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 11/12/2023 16:44, Dmitry Baryshkov wrote:
> > Add compatible string for the DisplayPort controller found on the
> > Qualcomm SM8150 platform.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> DT list...

Yes...

-- 
With best wishes
Dmitry

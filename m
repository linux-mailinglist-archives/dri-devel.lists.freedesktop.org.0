Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5975C5A1A87
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 22:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C7F10E17B;
	Thu, 25 Aug 2022 20:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D57210E17B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 20:45:14 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id j6so16149745qkl.10
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 13:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=JSdjfSerwO9g3FetOi7P2/z3DUhKbfEFMVDhVV6tWU0=;
 b=QwTxLxiLBlzJmnpR4e5JEgqt2ejJY07csEDIYEFOKyxGG8zoSOVOQJwlxOuHZ5frEt
 JTXlELuo6jb8ZoEpTAaNbc0NUs2IMgYOwyN0DTNm2UQPyyEdAvVZMnVVizGw2ECi3f8S
 i2+gcxgq1DocFRWxm6XC/9VViqnzDs/YGI8knWlOQTUezobvptwaAQXlwux87HUyXoYX
 fUVtBPrbmNdRMh9jCwAGxa0akKcKCFrbzbnllbiNmqXcqtJJTLECllEh8mhy8S5eRckp
 HS+4WzBG0sXXMP6Exo9g8nyR23Me8b4FfTr3U0V0MCckQkjX19lokUHv/6KT33baTmO2
 pyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=JSdjfSerwO9g3FetOi7P2/z3DUhKbfEFMVDhVV6tWU0=;
 b=4o1iEtH3QGrLs3HaBVngTWPZY6/h5PuhzjTqTSoSvMrvV1CO+3VCxkmAqT0JZsu0UV
 3X57Sbs6YRNsdkjCoEdz8KLOvWmGfCDJUU9DfBKiDmMeLQLGmz7SCl4HlC5p5UeTJWAg
 3PFZ6Ii1h8owZRVjNR0v66+Y2k1umzVfJ3hJ7NAZrDVmbJnMY8UzWpZ7D86BDY/RD9Wg
 KM1kPyh57A8rrzNhgb+8n9sckcJspk/7xGUBwUUF9fe3KPXmjZwT0uWZlpEb+ha8HDnl
 dRtZ5EGgZ6SRc0/q5sBJ0YCTpgqIubtNgTw2T+GRQIU6l1TLjB/A/G2QPt802B+bagiU
 eLyw==
X-Gm-Message-State: ACgBeo2ji/skgg19+b8JTvavPB4YgSW/+r7jPk+RUWKt+R/6qDPBAJ8D
 OxtM8aHldqolppjfc+ikr3iTPLrrvLAxARMJLf79+A==
X-Google-Smtp-Source: AA6agR59SBka8UoNuAgg3yQp3xn9OsXleeXOcLXhYq5qifIsMU113ZdZhZAiLqMuR+VCW+SW/t1ph6ZO1ZtCVG0UVnU=
X-Received: by 2002:ae9:ed0a:0:b0:6ba:d20b:1002 with SMTP id
 c10-20020ae9ed0a000000b006bad20b1002mr4454602qkg.30.1661460313180; Thu, 25
 Aug 2022 13:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
 <20220825201148.GA1607980-robh@kernel.org>
In-Reply-To: <20220825201148.GA1607980-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Aug 2022 23:45:02 +0300
Message-ID: <CAA8EJpptkjYVcz+CtLmYHk0gdqXfGPDJaS5XJtJcQNs9m4ZGBw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] dt-bindings: display/msm: rework MDSS and DPU
 bindings
To: Rob Herring <robh@kernel.org>
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
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Aug 2022 at 23:11, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Aug 25, 2022 at 12:50:53PM +0300, Dmitry Baryshkov wrote:
> > Create separate YAML schema for MDSS devicesd$ (both for MDP5 and DPU
> > devices). Cleanup DPU schema files, so that they do not contain schema
> > for both MDSS and DPU nodes. Apply misc small fixes to the DPU schema
> > afterwards.
> >
> > Changes since v3:
> >  - Changed mdss->(dpu, dsi, etc.) relationship into the tight binding
> >    dependin on the mdss compatible string.
> >  - Added sm8250 dpu schema and added qcom,sm8250-mdss to mdss.yaml
>
> My scripts tell me I reviewed these, but I don't really follow what's
> changed.

Previously I used the $ref for the mdss child nodes (which resulted in
errors for disabled DSI PHY nodes). These were replaced with binding
dpu/dsi/hdmi/phy nodes using the compatible properties rather than
using $ref.


-- 
With best wishes
Dmitry

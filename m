Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB7D7C8AFD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 18:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E74E10E1A3;
	Fri, 13 Oct 2023 16:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BFF10E1A3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 16:30:18 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-d852b28ec3bso2458920276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 09:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697214618; x=1697819418; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=veDHOSSglRPxO++sDqxd9T/imdhN2ow5EstVAAB24X4=;
 b=I6iL6aun77EVIw/Wk/Dggsqq3j44XUrS8gjSg/RNaVgc9hMGPr2W6efgHuKT9hOHDd
 nRkWEO7w+xIlYx5AoYQK9eS2/Qh0+x2tfrb1zItQljBTQraX9+20X3yFzrbUlt6fN9Nc
 qZdEvd4MjRoOtfVqBdw94LNGDbzvMGnl3wEjHKFiVZOz7cosJoZnvBhR/4WRRu59LARL
 lIhOlWRTA7svPytwc6HAb46wxE7wXOSHcsAPe14eD7fWWSMaNh9kXDlZYj5ZF0WoLweH
 rt7y2pnr1nSNrtELZ0Hu8te0EVz/bWQrA/+v4aFDSI+IYG/l3uU9duw3GKuNyroiNliV
 6Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697214618; x=1697819418;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=veDHOSSglRPxO++sDqxd9T/imdhN2ow5EstVAAB24X4=;
 b=oi20rtKjyl1zxi+wqSMUrHWOArrxKsmIcnWVH1xO6g8fq6mEShazEZiRRTTEjmIxkj
 XOTn9aKqkc8nTzxnlIpDwflZ9sX73t9OcQlJIFbLHD6/VFSQLQq1MTSYDseaFszMeTrV
 J++VRtm8RHTZkunaTt4h0QIGE/fcrcDaWWlYyzRREPkczdZZ3YS5m4Mpy8Q1drHaxqpW
 pbwZQCxquq+jp35J9zgZz9DY8qbLpjGqnPf7AVUzrLXGtefHq8YYlmYDxobXUhWvzrZG
 /CN63zp6EatAHgWP8nIwTXRqV9HFBp9kSE9tg8I61rxVbVrUbZ+ycvVed0M7NjNsslNN
 oVHA==
X-Gm-Message-State: AOJu0YwCDoYXrVYf/SahQoRFxfjhbYclvnkQPLl/RWZdM1fXlIRgcJQj
 uWtvE1U4+bevqmaSnBHUqsnRidb/ZbRalaSY1zwZvA==
X-Google-Smtp-Source: AGHT+IGmGROLxFTg/QvBurrmJrb0DRXEr3xD4vja5abWktrT0Y4AE2J8f1r0WagBilg8IjNVZtcXk8Ii3xs4Np+B6ec=
X-Received: by 2002:a5b:f86:0:b0:d7a:d716:233c with SMTP id
 q6-20020a5b0f86000000b00d7ad716233cmr23602244ybh.41.1697214617968; Fri, 13
 Oct 2023 09:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
 <20230817145940.9887-5-dmitry.baryshkov@linaro.org>
 <dff4bd1d-e32a-9541-94d2-c354adf3d23b@arm.com>
In-Reply-To: <dff4bd1d-e32a-9541-94d2-c354adf3d23b@arm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Oct 2023 19:30:06 +0300
Message-ID: <CAA8EJpod3X_HJEUK4i=uO0KmBLUCE0D3pH1xGhezxF0U+cDucQ@mail.gmail.com>
Subject: Re: Warning notice "Memory manager not clean during takedown" on RB5
 runs
To: Aishwarya TCV <aishwarya.tcv@arm.com>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, broonie@kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Aishwarya,

On Fri, 13 Oct 2023 at 19:05, Aishwarya TCV <aishwarya.tcv@arm.com> wrote:
>
> Hi Dmitry
>
>
> On 17/08/2023 15:59, Dmitry Baryshkov wrote:
> > Add displayport altmode declaration to the Type-C controller node to
> > enable DP altmode negotiation.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
>
> At present RB5 runs against next-master are consistently throwing
> warning messages (attached below with call trace) on "Memory manager not
> clean during takedown". I can send full logs if required. However, the
> runs are booting successfully so the logs are quite big. Tried running
> with older dtb built, where these
> warnings was not observed.

Thank you for the report. These patches should be fixed by the
patchset at https://patchwork.freedesktop.org/series/125010/

-- 
With best wishes
Dmitry

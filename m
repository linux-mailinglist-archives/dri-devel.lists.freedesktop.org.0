Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6519C85FF6F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 18:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407D310E9C2;
	Thu, 22 Feb 2024 17:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MN/uiAI4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650DF10E9C3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 17:32:28 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-60495209415so80048627b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 09:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708623147; x=1709227947; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uHYuztdiqcnoWxT8IYhA0vORd3mYh+h0ETbBCJU2hFs=;
 b=MN/uiAI4inwFB6j9UXVTSf3vdW8CTMsHKA1Bav9YMrPZ4hm1L5Qw292JsoGFvW4DhR
 nvHPaKir1vA6z/g8D1kPcDRdwp1H074lfMU4bhonyjJNV5LH5vakLUbowtCSBzjcIrCP
 lTOP5WKblaCWps1Q4FujD9qLF6WwdV0c9uV9vUXo7rnMnHvsdkahq0FEI/zhsz3ytTKU
 qjSwx5OsFjjh3W/n11ehpk6nWFZ/gDXM40yryYGp2uv/sC2JN0p1M7zgO5C8S9uNw8TU
 ovPnnkthKq49IHRGu4aQNNpOx2yHEcNwDWwSIkHM+gYlYZMsrzUauVSIBzY87X60jAGt
 UsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708623147; x=1709227947;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uHYuztdiqcnoWxT8IYhA0vORd3mYh+h0ETbBCJU2hFs=;
 b=m5+g1VbP8SU4F5ShuvuXHFDHjCtQ5P5o4vXd4VphWHE6/44OOzS9hq8BhqWMx0WlMj
 U3TktpsoIa1wCBGj1E5JbR/zIcQXtI7BjwyuuSEWRTCajW4lrdmNWadYJtFY68tGj2RW
 yDTZwraNCacdc04kaUJz6LwEvaJ2hfEu3mvq8/WQ7Z7vLydC7JvUQjWycr78IMubL0rU
 yKzxPCh+/geC4RibirXApDPbNNid4iezVTcLbFxvJTbNNtLKrj/oQd2f9ZNCHGXg8Gkw
 +z4LVqqvZjF0XXMlOvFzhmjxolt0SXvX4ri9Iye4gXzWDqjRiEjVcPNOg+hzx8Qp/dSr
 izFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9LjHOAzYLlqrGX3vsnt5J4Ar3yzUEY9JpN7Zfr6HuK/6rzmnyD45/UisZqfqAi8119ZAc83oclG0UpkXXH9XcEoSggoxPtx8KqBI6jGye
X-Gm-Message-State: AOJu0YxvKx8C0w/TcCauKv/dctn7k6nhVH3ettQc3/u+qsVlqIG3VPMo
 o+3yUIq/IK+oapA0smUMGH2GhMnAwAYbftkJBGgpQItRp9sE6iUXvhqI7/X0imt85sZ70YYf4bA
 /cl9Ob0rVYR7U9Y5N6rQ/1mW6/sXTcrVpCu0Egw==
X-Google-Smtp-Source: AGHT+IEChpsE7RSvYtvlDilze7tlEfcebE5fWeV9v6TUsqyy6KJBLB0hOKOdzrs9KYPLmaKn2wbmU4LNaaPxNFAv0eU=
X-Received: by 2002:a81:6c0f:0:b0:608:7488:8691 with SMTP id
 h15-20020a816c0f000000b0060874888691mr6826857ywc.38.1708623147287; Thu, 22
 Feb 2024 09:32:27 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
 <CAA8EJpo=9vhM+5YzaFxUoYRuEWQyrMS8wLNPSF3K=bN5JwWyDw@mail.gmail.com>
 <8313a7c3-3ace-4dee-ad27-8f51a06cd58c@linaro.org>
 <CAA8EJpqFj5nf8d_=Uoup7qg+nQrxqQU-DHbL3uSP138m9AcXLw@mail.gmail.com>
 <8fcb5816-2d59-4e27-ba68-8e0ed6e7d839@linaro.org>
 <CAA8EJporaUuddHHqpyYHiYSu=toHmrDxSHf9msZUJoym4Nz72g@mail.gmail.com>
 <20240222150423.GI2936378@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20240222150423.GI2936378@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 19:32:15 +0200
Message-ID: <CAA8EJpqd=1KV_dN8AURQDcFDDyO+YtbC59gM7ftt+HohGM93hg@mail.gmail.com>
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Enable MDP turbo mode
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 22 Feb 2024 at 17:04, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Thu, Feb 22, 2024 at 11:46:26AM +0200, Dmitry Baryshkov wrote:
> > On Thu, 22 Feb 2024 at 11:28, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > >
> > >
> > >
> > > On 2/22/24 10:04, Dmitry Baryshkov wrote:
> > > > On Thu, 22 Feb 2024 at 10:56, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > > >>
> > > >>
> > > >>
> > > >> On 2/22/24 00:41, Dmitry Baryshkov wrote:
> > > >>> On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> > > >>>>
> > > >>>> The max frequency listed in the DPU opp-table is 506MHz, this is not
> > > >>>> sufficient to drive a 4k@60 display, resulting in constant underrun.
> > > >>>>
> > > >>>> Add the missing MDP_CLK turbo frequency of 608MHz to the opp-table to
> > > >>>> fix this.
> > > >>>
> > > >>> I think we might want to keep this disabled for ChromeOS devices. Doug?
> > > >>
> > > >> ChromeOS devices don't get a special SoC
> > > >
> > > > But they have the sc7280-chrome-common.dtsi, which might contain a
> > > > corresponding /delete-node/ .
> > >
> > > What does that change? The clock rates are bound to the
> > > SoC and the effective values are limited by link-frequencies
> > > or the panel driver.
> >
> > Preventing the DPU from overheating? Or spending too much power?
> >
>
> Perhaps I'm misunderstanding the implementation then, are we always
> running at the max opp? I thought the opp was selected based on the
> current need for performance?

Yes. My concern was whether the Chrome people purposely skipped this
top/turbo freq for any reason. In such a case, surprising them by
adding it to all platforms might be not the best idea. I hope Doug can
comment here.


-- 
With best wishes
Dmitry

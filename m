Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E128B85F3DD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 10:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF3910E8B0;
	Thu, 22 Feb 2024 09:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zCHYubWU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71DC10E8C9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 09:04:43 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-607f94d0b7cso67904297b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 01:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708592683; x=1709197483; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/TPJbWbUkPAf8/OgjM4Bs/DBnfD95CuyEz8cKBKIieU=;
 b=zCHYubWUTPyE9vShkFoik6rSNplrtFoXD6LcmAAiTq7Gk7vZQKITUZTVdDKJavrv18
 a6BSxBo5Ww38XDKz/yt/vAk21qThte6SmhSuar/pIJ6PLsBmR9LQkZNwl4/79hPF5Xo/
 4kJi5vHM9tH0Kb2s4iRZUBPWReD7A31ic8qezFbubiJwAiamRzzOo0mjnSsZzRZrt3bk
 jFg6qxm/YHKYV5fMHzAeFv3Z2QBtfyo2tArjBPqbcXff5WPdIuUbuwr69aqNhiGiBAEo
 U5F4Y6siR5BxTr+FjfNmaqbR6kW2m6+CsZGE27S+wdEmehBR6Oqy9h0csECMg+seKcCl
 +VQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708592683; x=1709197483;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/TPJbWbUkPAf8/OgjM4Bs/DBnfD95CuyEz8cKBKIieU=;
 b=JyzXLwMNefU/0IZFcxxh9vKnmT/g6a4s7rP66kiyxfsvGKQkdAi1e5qy6PGfLvTG9U
 4+QD0sDgQvYLYu9n+MdGnPwsYreq3bW03Qq87ftwwjnfa4MBPxRS4dkEAyNx8gupkVg/
 Ek/msY7P+F16i5K+jmZr7lAw5pmguxW9VMAHwqwc8CANWzgqOzTFpFAgIpUfi7Mm5Lgn
 myAxL2h2/tfI5jWcy4fCA1V2vggWuSyJLPEp0+e9J4ScbceZ1mqXUPEKq12Ptr7faabi
 73G9vtBHbsZ8RE1NJT9yzpdA7rEH+n9S8LNQ30ChzXlem12ZboKUxeBcSvhJnb++HxXv
 5Hwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC3ae1qaBSRcvH5SQhwZvHZg0mMbJR15MtQqu+I8rlYdzfnzG8MNhEMNtoAOFtLgP3rN41N47Csxrld2tI9ASZIyf8p5FCqmPqCcQuRQaF
X-Gm-Message-State: AOJu0Ywl2Df/Nlc77rX6BCOCCxsAjBGIF56JdDuHih+K8FexgQd9pdf7
 GH37dcTAquBqEjbTszqHcnLEpmBWstL2VgVOjwQqKpI47SyVvyluNNMBMwAYuOA9M2RrB+e7qLf
 OIUG2M95DBqSaGfpFr3q9DCM33IDY4hDDfUhBcQ==
X-Google-Smtp-Source: AGHT+IGh4PQ6sJzEBbpokmVQdqBTIm/+xR9L/veKiiKuOpm6XOQARzpp3TR3D/xAbTVR/A369Z/Zv2cdKDbeepxT0hk=
X-Received: by 2002:a81:a193:0:b0:608:3797:5ac8 with SMTP id
 y141-20020a81a193000000b0060837975ac8mr11133955ywg.32.1708592682743; Thu, 22
 Feb 2024 01:04:42 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
 <CAA8EJpo=9vhM+5YzaFxUoYRuEWQyrMS8wLNPSF3K=bN5JwWyDw@mail.gmail.com>
 <8313a7c3-3ace-4dee-ad27-8f51a06cd58c@linaro.org>
In-Reply-To: <8313a7c3-3ace-4dee-ad27-8f51a06cd58c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 11:04:31 +0200
Message-ID: <CAA8EJpqFj5nf8d_=Uoup7qg+nQrxqQU-DHbL3uSP138m9AcXLw@mail.gmail.com>
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Enable MDP turbo mode
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,
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

On Thu, 22 Feb 2024 at 10:56, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 2/22/24 00:41, Dmitry Baryshkov wrote:
> > On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> >>
> >> The max frequency listed in the DPU opp-table is 506MHz, this is not
> >> sufficient to drive a 4k@60 display, resulting in constant underrun.
> >>
> >> Add the missing MDP_CLK turbo frequency of 608MHz to the opp-table to
> >> fix this.
> >
> > I think we might want to keep this disabled for ChromeOS devices. Doug?
>
> ChromeOS devices don't get a special SoC

But they have the sc7280-chrome-common.dtsi, which might contain a
corresponding /delete-node/ .


-- 
With best wishes
Dmitry

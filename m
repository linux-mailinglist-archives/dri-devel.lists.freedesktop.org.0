Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A20CB74668A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 02:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D74D10E255;
	Tue,  4 Jul 2023 00:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1264810E25A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 00:24:10 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-c4e4c258ba9so2671534276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 17:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688430248; x=1691022248;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7ooo4dM5jALOtaXQ/scLIfMMHfxc7psGFc61PPL8SXI=;
 b=EC4ri2XnmUEcT5FMvk1S4XnLO2FYde1MbnG23B0qy9D1+GCfXYLTNHmwycc3q0wrcE
 9B37RTnYYPWSj1v9wdi5dXdv7P3/4Ac7BIxWQZolk/Kc2uYG5d5bT6Ki6Nj0BhODFQ0h
 CxVJ/BOxEsc/hM59vOeh63h5QiHPa3fXeXu6Uh69oNKD99VHeFA3UrkHyQUKk03TST/h
 2F6jT9YJ2CJA+LedHj1CNAOT2K44HTN0rTu5jxeb3qp8XEHkUzUOMXKsMhdQoj1Qvral
 WKGQBBPo37H8byJZb9Cl9z7NEo3oAA2bkSYT44mjeFFp0IrUud2RFaoXTSswBcziv0U3
 T/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688430248; x=1691022248;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ooo4dM5jALOtaXQ/scLIfMMHfxc7psGFc61PPL8SXI=;
 b=jtbjP2LlbfcgCBj+zh+UGyj4dsUi4CMSQwJqh0TFphSp0Qz4gYvxN/zvJiF1YdCkXg
 b4mDA1c5XprXz9AvL+BcMVCurc5OvF63/wMR5hf/3lQ/rInpf0hcwVMYJBhZdF+7k7aD
 H+/ioWLN3f+2/+46jqT0tMojVWdXtKNqNBvScVPzHPAwTOZ9YuNcCT7NqLLutALHhmA6
 V8h8O6XO27E0cOQLEtnrSPVRPG8LXsZeFeqdV2VxeMzkmI31sYbcCHNCbxLJpx/A1ZWg
 xHnUw9djT2AZ3HmKpnbucg+ZyFQCiuceOGKIilktdcQ68CtNEn/msGW/O4CszdnhXLan
 8Qeg==
X-Gm-Message-State: ABy/qLZe+3C/wZ6rUXqKnygMgFGJ7sM3MiBGGDJa2ubXpqRKA0QcWP+C
 QbzSG+V+77KYNTmkN6Y7DJvOcno0liwctCQ+eg4uGA==
X-Google-Smtp-Source: APBJJlGwBuEBQNkpWTGVzwAN8wHVIS3Z+h6RfADCfyBaNnBSNplPPR2iH9n5YEdPJApMCn3LPV+eq1ag4FSh0bWCATg=
X-Received: by 2002:a25:3ac5:0:b0:ba8:1aeb:2b68 with SMTP id
 h188-20020a253ac5000000b00ba81aeb2b68mr10197957yba.41.1688430248788; Mon, 03
 Jul 2023 17:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
 <b93cb054-fd42-46e5-aef3-dc41b36a85f9@sirena.org.uk>
In-Reply-To: <b93cb054-fd42-46e5-aef3-dc41b36a85f9@sirena.org.uk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jul 2023 03:23:57 +0300
Message-ID: <CAA8EJpqfF0aep1E26yWQRQT_xUVTQBBUtghGv=hq_2M0w05few@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Qualcomm REFGEN regulator
To: Mark Brown <broonie@kernel.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Jul 2023 at 01:59, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Jul 03, 2023 at 08:15:53PM +0200, Konrad Dybcio wrote:
>
> > Recent Qualcomm SoCs have a REFGEN (reference voltage generator) regulator
> > responsible for providing a reference voltage to some on-SoC IPs (like DSI
> > or PHYs). It can be turned off when unused to save power.
> >
> > This series introduces the driver for it and lets the DSI driver
> > consume it.
>
> What's the expected plan for merging this - should I be applying the DRM
> patch?

I'd pick the least two patches into msm-next after -rc1.

-- 
With best wishes
Dmitry

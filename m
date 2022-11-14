Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C489628A68
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 21:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6EF10E0C4;
	Mon, 14 Nov 2022 20:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C14A10E0C4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 20:27:45 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id n20so10582682ejh.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 12:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QCfG+hOC32UcE1+jvceujSzl/rFR67fnp9HdOcb9XXo=;
 b=YZbBARaiZIN5w5hmUzF7Yt5HUb8Fu8ZcAoW26h5RlMwSHRIVsAdn1PNguLoBw9ki+I
 avs6Bhr7b7wxAMHDI3giIi54k5CDbe4SATViP+LZnOobPbn85eYeB7PNCat8brXZqZ/T
 AhbN07fijNjTdg2kBJYXr5RMz1Nf5+naQTzsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QCfG+hOC32UcE1+jvceujSzl/rFR67fnp9HdOcb9XXo=;
 b=HNK/1lSP/jORHapGhE0CT7fRvt0Y8mz5xFknKamEBYsycnxgQQ+9YMJ/00hxbQsFqk
 jxd8/OBCMucMlXedTaZEvAi39jGj1ntAmW3tdolFq5cWSHrjTPWRXcJM/BNMHAYlyKHK
 +sSpu77tylZwsYdpj92g0ENunN/f9uyJnpPV0Y+T9jqV+A02NSTt6O/ONQeVmeXjz39G
 R17eYcAK/paqwHyuLWR0fd2GukAvC7wVDIFu6TdSOipH5868xm+ah46jTS3BHtfnSSmA
 0tReu88ErriuK3afeqvQEjWu7otwuEN0gD2wWvCnY1LpBfrPSwuIdXTzhOrh5I2Th/ZR
 xuhw==
X-Gm-Message-State: ANoB5pkynADq0azzUgaZoj2dgJBkdjXrr+zITdCGqF0D+B4pI69/Q2dF
 bvIYsBT+OAXxlMbLpakZ73GsLTBWo29vqeFM
X-Google-Smtp-Source: AA0mqf6OHs/L390kcbYfN6hRnsPbTPBxNRyH+faePT3dNVyMF/J3eAZAQFW8r5Zdvgtg0Jyoz4gmeg==
X-Received: by 2002:a17:906:a052:b0:7ad:a030:485c with SMTP id
 bg18-20020a170906a05200b007ada030485cmr11182201ejb.605.1668457662936; 
 Mon, 14 Nov 2022 12:27:42 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 oz36-20020a1709077da400b007ae4717bef1sm4725173ejc.15.2022.11.14.12.27.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 12:27:35 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so8801915wmi.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 12:27:35 -0800 (PST)
X-Received: by 2002:a1c:f611:0:b0:3cf:9ad3:a20e with SMTP id
 w17-20020a1cf611000000b003cf9ad3a20emr9535222wmc.151.1668457654755; Mon, 14
 Nov 2022 12:27:34 -0800 (PST)
MIME-Version: 1.0
References: <20221114194133.1535178-1-robdclark@gmail.com>
In-Reply-To: <20221114194133.1535178-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Nov 2022 12:27:22 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WB__v5TPFOqnQMajR6MvLGjLYrKrV+qosJYQFTCpROzQ@mail.gmail.com>
Message-ID: <CAD=FV=WB__v5TPFOqnQMajR6MvLGjLYrKrV+qosJYQFTCpROzQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Fix speed-bin detection vs probe-defer
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 14, 2022 at 11:41 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> If we get an error (other than -ENOENT) we need to propagate that up the
> stack.  Otherwise if the nvmem driver hasn't probed yet, we'll end up with
> whatever OPP(s) are represented by bit zero.

Can you explain the "whatever OPP(s) are represented by bit zero"
part? This doesn't seem to be true because `supp_hw` is initiated to
UINT_MAX. If I'm remembering how this all works, doesn't that mean
that if we get an error we'll assume all OPPs are OK?

I'm not saying that I'm against your change, but I think maybe you're
misdescribing the old behavior.

Speaking of the initialization of supp_hw, if we want to change the
behavior like your patch does then we should be able to remove that
initialization, right?

I would also suspect that your patch will result in a compiler
warning, at least on some compilers. The goto label `done` is no
longer needed, right?

-Doug

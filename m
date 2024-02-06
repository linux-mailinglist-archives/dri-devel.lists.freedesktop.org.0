Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8943384AF14
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 08:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE297112A35;
	Tue,  6 Feb 2024 07:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rqnAl+P1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B181112A35
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 07:27:49 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-5ffdf06e009so46428387b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 23:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707204468; x=1707809268; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JTwYss/MnnM13HyTf0vXaofwqZrwR8loiVFwU5LX2PY=;
 b=rqnAl+P1cYtKK3cAu1a/XQpXkG4xFEg89YmrVgVgBSBFP2FxE/uyv+W3JmdqJJsHbG
 rz3gVUJwXaPgfxk6bHODBo8tRy/Yw+9aYCtq8zKXLmLD2xqBcBFGZl2T0SJRAtMXaVFJ
 8cv4B7ZzjxYdgtW8Ck4CKY2JbhEdbe+8tCvOfk1GWTaVPx/tWVSyruho+67oddXW7VuZ
 hLb2ACwtuNIFqE3x3HChVo/bt6J2kKlexLa7HSMS2TkGpWgWdq2G9KFcVovwaBUEoOLb
 ekcAajI51wmkg/KXWLkloHd+ziKzNLrkG9DQheN74R3LYudBfK7nqWs0Ex3RNvatPEeG
 zxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707204468; x=1707809268;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JTwYss/MnnM13HyTf0vXaofwqZrwR8loiVFwU5LX2PY=;
 b=T8B2w+wGQj33DlwwpyI0FRN/G5LK2Z3tEIM1dt3up1mY7+80LW//Jb6EmSQ0+I1TRb
 S/qY+3pHVRtxh3RJYR9422FWMK++DYy3BxgPlXcZep5ntAdDDqwKy33jotYkIukXuctF
 GqjCzI9lGQAHKx5HL+5zjlg9bhzrfXYQDXDqlyW5VMwzK/gocU/t3Mni/vvUIJdcY5sf
 GSP3euvt7pzA9vANPnW4q9TVt/nhbD2dgS4NvUh08oxWuEOvM4shUiq1ULbkgPoRL/v2
 oZZ4+cr8JcXB1rxMcofY1M+e1ZQ2Wc/nvZvyxDKcnLDE4auFjx88wL2oYWBRwkz/LkLO
 JWRQ==
X-Gm-Message-State: AOJu0Yzv/zzBIdHKeohfDxJ4e0cjP19Y84KTYqbTZopcLwIgON9969mk
 nPMZ8MVAXGv7jY8OwQ4f8IAqHJVLxi6ulB92hBCY4TVicsLCUKS2rjvVD/o8oI21oYyFZJ0q3q+
 9ma0gECCWUwzbWZobx/6sdfvZalDCeD83KUDtMw==
X-Google-Smtp-Source: AGHT+IH5aZFBCbzPwOkfK/V7Pv0OlQXEJvQKSmrj7XFq6d9dhv5vj1J+OWKWV2kMYRxJQhWB7mB5XJ9vuezs7xZplJc=
X-Received: by 2002:a81:f90f:0:b0:604:ea3:6525 with SMTP id
 x15-20020a81f90f000000b006040ea36525mr737126ywm.0.1707204468304; Mon, 05 Feb
 2024 23:27:48 -0800 (PST)
MIME-Version: 1.0
References: <20240121194221.13513-1-a39.skl@gmail.com>
 <20240121194221.13513-4-a39.skl@gmail.com>
 <6e34c1a8-59e2-404f-aa47-0cab772f59d6@linaro.org>
In-Reply-To: <6e34c1a8-59e2-404f-aa47-0cab772f59d6@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 6 Feb 2024 09:27:37 +0200
Message-ID: <CAA8EJpo=mpEvSs_wSwZeAPvLErjkSkcMqkWHch0LC4KnuLp_eA@mail.gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: msm: qcom,
 mdss: Include ommited fam-b compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Adam Skladowski <a39.skl@gmail.com>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Mon, 22 Jan 2024 at 10:48, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/01/2024 20:41, Adam Skladowski wrote:
> > During conversion 28nm-hpm-fam-b compat got lost, add it.
>
> Please add Fixes tag and put this commit as first in your patchset or
> even as separate one.

Fixes: f7d46c5efee2 ("dt-bindings: display/msm: split qcom, mdss bindings")

Krzysztof, if that was the only issue, could you please ack this
patch, I can then merge it


-- 
With best wishes
Dmitry

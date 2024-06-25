Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D34DC917268
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 22:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027E410E2ED;
	Tue, 25 Jun 2024 20:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D9i6sIeV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7774010E2F3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 20:20:14 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-64782323bbcso6854027b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 13:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719346813; x=1719951613; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DALwJlK2ARCJSSDqUvIVUXkdGRcly/r/299uWG55Xls=;
 b=D9i6sIeVB73iIEkepQty7PEf9a1LTbBtm4YTz2UmFg3AC+iktqaCDLlZlzPUER7st5
 ufRTejDSVkRa1qadxC487B+5mml/6ciyz8EzvbTPOKmvzQTtK2nv//4fDR3koUjl8GVu
 uaf7vowjjZosV6aI0cpdSmD6TnRTpMglxGBTxrLwSPdoEnTOxpFcQtuqWF4tTnMFwrWE
 2pA2Cmd/hYaNeyEx4rTGy3cl0leCZiAfOSwkXg6LJz9xhyeSgxzhqnzmR0H0EWYeiEF3
 c8+bB7FQ1S7ZkW6ht/67qr792U+kjzq4CnXnliMpGwhfz80vUL6hdnD4j1L3Jn7dYvNx
 xrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719346813; x=1719951613;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DALwJlK2ARCJSSDqUvIVUXkdGRcly/r/299uWG55Xls=;
 b=errjTndTxhHLZyKTKqlm13EmuwOMXxsigRos1gq6YgKMlagqhP7WDXzeRJokL3L5Kt
 y3RiNXzO7y6yUB86SrYmmYYSZ6Ty0b60CFUJRX3uTqDpdYK4GHNmAmSsrcBnvsmiyzNf
 5Agzf93M6bzNo4ote7kzou634N1XKLJlqvLZdleWBpGUT3peIV13lEIBVu48KLf60o0u
 Vg+UYxrbnWNoJ+ETLSWr+B/qfmSLzxZhHxZCBpyASGD8yLRANhptw0XQLSQVCrtBtXMH
 HexzyyPeC32NrhfU+LxB/t5t8PTjdFTZIrzuYehzZ8eutSpmL6jru4iUseXY7lF1K2qS
 Oumw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs9rSd2259Em/G0td4DI3Q3kREv5lpyDLpMm55xH3lS4K8vpKNCx7+RDrSu/cfI9yYkGN1YKaSF6eKpdHANrHHHdVmEVlU3J5GgC2GaImB
X-Gm-Message-State: AOJu0YxcIMLpBNJmono8xAjuiZbsYhT5lzHjn1ZU0t5nAMln9dsJwkKB
 VI6JHhX9uB4g3/BoTZCvv0obLTMR3n5mTkoAn+YHy4LvHbdteKjIotcZe0SM8Ce/ZLs6Y+PcOnw
 f+BhO9NtkqqrqtRgeddi5JkY3h6HbTteSmGpBQA==
X-Google-Smtp-Source: AGHT+IHc1N8cdXnOekY/fB5EQn9UtYA0M5VUrWEfImUf2l5menZg5peEHCsjMvw2qLy6pLFOXbVvbc4dD7/Rh87mw18=
X-Received: by 2002:a05:690c:4905:b0:646:5ae1:b74d with SMTP id
 00721157ae682-6465ae1bb94mr47631727b3.48.1719346813387; Tue, 25 Jun 2024
 13:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240613-dp-phy-sel-v2-1-99af348c9bae@linaro.org>
 <bbdb8f56-4948-b0dd-55bd-ca59b78ed559@quicinc.com>
 <0ae0fddb-07f4-3eb9-5a62-0f7f15153452@quicinc.com>
 <3a5f68fb-2487-bda0-91a1-18ecd414937f@quicinc.com>
In-Reply-To: <3a5f68fb-2487-bda0-91a1-18ecd414937f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 23:20:01 +0300
Message-ID: <CAA8EJppd8Vm5uGzzVofWoTpVkfxE5atv6VOt0WMUsu4oYP1UZA@mail.gmail.com>
Subject: Re: [PATCH RFC v2] drm/msm/dpu: Configure DP INTF/PHY selector
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
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

On Tue, 25 Jun 2024 at 22:28, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/25/2024 12:26 PM, Abhinav Kumar wrote:
> >
> >
> > On 6/24/2024 6:39 PM, Abhinav Kumar wrote:
> >>
> >>
> >> On 6/13/2024 4:17 AM, Dmitry Baryshkov wrote:
> >>> From: Bjorn Andersson <andersson@kernel.org>
> >>>
> >>> Some platforms provides a mechanism for configuring the mapping between
> >>> (one or two) DisplayPort intfs and their PHYs.
> >>>
> >>> In particular SC8180X provides this functionality, without a default
> >>> configuration, resulting in no connection between its two external
> >>> DisplayPort controllers and any PHYs.
> >>>
> >>
> >> I have to cross-check internally about what makes it mandatory to
> >> program this only for sc8180xp. We were not programming this so far
> >> for any chipset and this register is present all the way from sm8150
> >> till xe10100 and all the chipsets do not have a correct default value
> >> which makes me think whether this is required to be programmed.
> >>
> >> Will update this thread once I do.
> >>
> >
> > Ok, I checked more. The reason this is mandatory for sc8180xp is the
> > number of controllers is greater than number of PHYs needing this to be
> > programmed. On all other chipsets its a 1:1 mapping.
> >
>
> Correction, number of controllers is < number of PHYs.

Thanks, I'll c&p your explanation to the commit message if you don't mind.

>
> > I am fine with the change once the genmap comment is addressed.

-- 
With best wishes
Dmitry

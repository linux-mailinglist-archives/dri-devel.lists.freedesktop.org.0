Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70228961A3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 02:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3F111225E;
	Wed,  3 Apr 2024 00:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hpcLZPRw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E42611225E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 00:51:15 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-513da1c1f26so6989010e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 17:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712105473; x=1712710273; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GWHRA9QpgbMHjxrXRwpYcGFaFTNivreKL1s0uQUDObo=;
 b=hpcLZPRwX6+Z6W6He6LrmZM4ueWIG9OHPMHGgHmdtPzNmrd2RlI2OjZgjdjpyVDltL
 rr60lNPN544zFdmh+oemNkiRQ5GDqSFDSPjdv409w/wbsbGGC2/lqrmiCbACiqXVaXON
 AHuhYK2uv1fqNKL8ahU+cbLM7yquaxIimPU7PHYAeN1bOwtFlws9b3w3yNVKA+TqABYl
 R3+0mhZ/GgfDKsYyQUPw1No7XnBpUlCRqEmxFXdWBEDi9VwyCK+j2mBkffeEgF7sEY6y
 gNNgePmjo/TZf/iaCV2yOGeXrLyqMqGCdipr4M7bHKCuOtTon0+67KuL6awdyru2GO09
 +fLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712105473; x=1712710273;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GWHRA9QpgbMHjxrXRwpYcGFaFTNivreKL1s0uQUDObo=;
 b=wJvNr/sLHxDBa3muE7L/oynpuUjoAoXOwEb7UAfT7c1AA4JfubcgsZALAlSsx1DQCj
 9PTm/WCTkgM2YxEfdx5CrjeNwZzw7IGT41RcjCvzRi8v+HPG5rCGAZ0mejfb/TpeP9/J
 TzD8d4N9erML+h5SA3/3W9ABk+QTPwk5/U9YJf23gcz2ozQBY77+EEs3TF9jZHr/KRQ5
 IGWvUuU3KTLh/IrcFcqjET5xHUnjOCs/jrtH2APTATigU97SvQnWVdF4c6MGwK3h04IO
 noLebxdrwBZdENL9u4KZMtzU0blMWtWCRgucq9YSVAwyjgavmnwbSVmVTgzIFVpcpyCa
 dhFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBNaFaSrhN/tSYGL57Wu34Iyvj1od3f5PUaKy82Ucza1MiKbIYritAzNZPxpZaVAH/8iHylkm6pJAP77lIax2ZgiVE8ajROzYP2D1vWNGe
X-Gm-Message-State: AOJu0YzUqTwAXIDwvH6Y4O5gcGNYM2MUc441PocM/CHvq6lrd9ss59PK
 7zZzbFg+1kXDWl1l70+eMN+Ohlu9qoXKY110kkYFeS85pehfNqu0FBGJiOjKVkk=
X-Google-Smtp-Source: AGHT+IFdYWW/kAAnQoA5IRo9Tv52gkqmNbWMJpe/JRsfmA/mRxHEpRhzCrfHlRnsuqaCYtAolee3xg==
X-Received: by 2002:ac2:5631:0:b0:513:39a0:1fec with SMTP id
 b17-20020ac25631000000b0051339a01fecmr618732lff.66.1712105473384; 
 Tue, 02 Apr 2024 17:51:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a193808000000b00515bbc2feedsm1907527lfa.102.2024.04.02.17.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 17:51:13 -0700 (PDT)
Date: Wed, 3 Apr 2024 03:51:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH v3 1/4] dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
Message-ID: <odtd5tfurh4kkhclsi3zmumrucmiz3jpqsukflbsvhmgvtyehl@bobsiymwtsys>
References: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
 <20240402-lg-sw43408-panel-v3-1-144f17a11a56@linaro.org>
 <9fbb9058-ccfe-436d-b413-b3ba27e4e5f9@linaro.org>
 <CAA8EJprwWd=ZtwnpTm3cVP8RBEqxCcSGyBu-bHj=iV=+X2=FyQ@mail.gmail.com>
 <t3cx5qxiteer27vsvysizbrxkbamxgrcbn2oafisodjopwas5z@nxlasb4rlnml>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <t3cx5qxiteer27vsvysizbrxkbamxgrcbn2oafisodjopwas5z@nxlasb4rlnml>
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

On Tue, Apr 02, 2024 at 10:59:11PM +0200, Marijn Suijten wrote:
> On 2024-04-02 10:23:22, Dmitry Baryshkov wrote:
> > On Tue, 2 Apr 2024 at 09:31, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > >
> > > On 02/04/2024 01:51, Dmitry Baryshkov wrote:
> > > > From: Sumit Semwal <sumit.semwal@linaro.org>
> > > >
> > > > LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel present on Google Pixel 3
> > > > phones.
> > > >
> > > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> > > > [caleb: convert to yaml]
> > > > Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > >
> > > Tags missing.
> > >
> > > `b4 trailers -u`
> > 
> > Excuse me, I keep on forgetting it.
> 
> Does a similar thing exist for adding Cc: tags for all reviewers/replyers to an
> earlier version, even if said reviewer didn't yet provide R-b/A-b or other tags?
> 
> I'd like to have the next revisions in my inbox as well after leaving
> comments :)

Unfortunately I don't know such option.

> 
> Thanks! - Marijn

-- 
With best wishes
Dmitry

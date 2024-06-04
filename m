Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967038FB762
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 17:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5576510E523;
	Tue,  4 Jun 2024 15:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pc0m1iYN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DB610E52E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 15:32:23 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52b976b5d22so2850682e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717515141; x=1718119941; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gHrM44L4syIp6QXQbLvLBhWUBG/rKUy59LnNZ47iEDo=;
 b=pc0m1iYNFIumIpUBv/mge248vjUxd9pMeZ5NWc7q9TR01e1nNyG4telq9vz8qHfjTJ
 MfYKuIL5NjG3FuqYiKU5A2Qfktp36ce9JO88CrHbgAMtqZ3d6B0u/st0S43ye9M0rgEA
 YQtG93dAjwXY+vuNhLde2kV9Bu2xuArBae3ZgUyupnvrEgrlWDptHd/CjtzQf2ECwX1j
 9KxOf0s3FSJA/EW6gWP+05Rf63q8UJ+7iCNgps63ywWhHTldDSPAHi2mcRSsfqIJIDcI
 ruIkpg6DL9BBoRNjanHxpOBYPHTfhFGt/CWTeXhMKby+VFH6x5iKVc2nBQz+kF2NQ+Dd
 qEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717515141; x=1718119941;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gHrM44L4syIp6QXQbLvLBhWUBG/rKUy59LnNZ47iEDo=;
 b=H9MgpS3sEARMCcvUszosoZAHruf9SOrfBRfNj+6z3io39YzVp7WgbBJ57r7klOd5fK
 TnMREjTlWFvcW200xrRok7fFOzEj4oGnfbKFU9ynVkemZQOXkflsjNj/2JRjPFUBT3gP
 2Dn9ikRRjHXgQC1YoTn1H6kFOM1FfHSGXrOant789W90b+G9v5O5JJHM0azO7Im0qLfq
 aYfWSC24LZ+OQnfbpnHDrhF8pHU5Ua2M4RJX7g/z1ij8r2pmff3yil3rKUHlrwAPZwsd
 oOnLnkt18C83+WVh16dw5kXnORcaPSDqKjP5rTqBMs1gtk/7UaH0Hiv8KDw34ZlmpaCt
 OzRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxANiUKnRamK32oMVw+5+LaXBRumXjBwEBc93XeCd13AZzvfQwuLhwDMb7jzoZbmWd10uVZ7GEJDx7fzcc0onch2J0zEjgm4x3e7/yYIx5
X-Gm-Message-State: AOJu0Yz0yiVTuob/TZ1NfoI6f0/VdBUtq3HtIpb2X+z+EFOU9eQhfqxs
 XTDIuXZ93RafxKf9ywa2r96VmBUWTtcCTEUNNhz8Tpq4r/33zMP72mG8k3jW7+g=
X-Google-Smtp-Source: AGHT+IGYLHNudiIaswlwjTUb/rMLM3nXqJvLYwLC+U0gfFCMtw5YjJkut7czzapYE+YZat6n4c3unQ==
X-Received: by 2002:ac2:47ef:0:b0:521:9315:670 with SMTP id
 2adb3069b0e04-52b8957f632mr7525530e87.9.1717515141146; 
 Tue, 04 Jun 2024 08:32:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d7ecfdsm1538150e87.189.2024.06.04.08.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 08:32:19 -0700 (PDT)
Date: Tue, 4 Jun 2024 18:32:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: display/msm/dsi: allow specifying TE
 source
Message-ID: <xc4knruvh2kasc563vbatppof67w5ui7bnoiq73euogvkjw2hh@meq3vz2qeekk>
References: <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
 <224fa477-07ba-e7b2-2f7d-8f7d21f4a0c7@quicinc.com>
 <CAA8EJpp8kRPKboHNHwD+R5f1AcndjaQdGG=Q4ygmRE9VMNievQ@mail.gmail.com>
 <5cde2f43-89ab-d2d4-d68e-605f8f5d1da7@quicinc.com>
 <CAA8EJpoMtr6OGjL8qq-cHadQSOVyDAaL8=2TLvOjBbYV2Z7+Mg@mail.gmail.com>
 <d1a9be5d-b0a0-73bc-c66f-6d45049fbaf1@quicinc.com>
 <CAA8EJppFZQTghtyweGG_8zSqqZpEp=ho0bXuRxgyU2qGL4+ppA@mail.gmail.com>
 <4b604c91-7b1f-46b3-6b41-fe7d45190b78@quicinc.com>
 <tymwexyhuujgrz2cvxkruimst3ff4mnevcm2k4h6qdmpmb7yqp@zqbwwc5t66ya>
 <c9cc5a0e-35b5-47a6-b271-46cac9e19872@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9cc5a0e-35b5-47a6-b271-46cac9e19872@kernel.org>
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

On Tue, Jun 04, 2024 at 05:22:03PM +0200, Krzysztof Kozlowski wrote:
> On 04/06/2024 17:14, Dmitry Baryshkov wrote:
> >>>>>>
> >>>>>> I didnt follow why this is a link property. Sorry , I didnt follow the
> >>>>>> split part.
> >>>>>
> >>>>> There is a link between the DSI host and the panel. I don't want to
> >>>>> end up in a situation when the properties of the link are split
> >>>>> between two different nodes.
> >>>>>
> >>>>
> >>>> It really depends on what the property denotes. I do not think this
> >>>> should be the reason to do it this way.
> >>>
> >>> It denotes how the panel signals DPU that it finished processing the
> >>> data (please excuse me for possibly inaccurate description). However
> >>> there is no direct link between the panel and the DPU. So we should be
> >>> using a link between DSI host and the panel.
> >>>
> >>
> >> Yes, I totally agree that we should be using a link between DSI host and the
> >> panel.
> >>
> >> My question from the beginning has been why the output port?
> >>
> >> It looks like to me we need to have another input port to the controller
> >> then?
> >>
> >> One from DPU and the other from panel?
> > 
> > Dear DT maintainers, could you please comment on the OF graph entries?
> > Are they considered to be unidirectional or bidirectional?
> > 
> > Would you suggest adding another arc to the OF graph in our case or is
> > it fine to have a signal generated by the panel in the 'panel_in' port?
> 
> Which pin are we talking about? DSI or panel? Commit msg suggests DSI,
> so property is in DSI node part. Seems logical to me.

Input pin on the DSI side.

-- 
With best wishes
Dmitry

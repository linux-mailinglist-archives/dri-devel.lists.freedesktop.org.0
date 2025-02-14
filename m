Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11984A35C8D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 12:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF4F10E263;
	Fri, 14 Feb 2025 11:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B0ESxRyO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2284610EC4C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 11:30:29 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-308f141518cso21257201fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 03:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739532627; x=1740137427; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NUXfDOQe1PjE/GwHmj5OmmzZEaxV8TIkFPa/Dhe7pKw=;
 b=B0ESxRyOah/HW67w4tg5b3RB94jpe6mCM87Is8YcWd3Hr3jlXuWmufKXp0dipSLsLl
 MBhjpSBbP5degKUhS+ISZgwpK+NKaxsonBXRog8v6qecgBxdG9FuAR7RIMIz1djaUeGu
 piZeVtCNfYMXnrtly47yTcqCK5Fv27nB/BJjxodGx4L99mqcUO3WZ3ehRhFwuq0vfUNx
 p5SqQ8tn93uAYNZ9osJGRD7JnBi3hnfEhnCsaIs06V3gClMstVP3J73KsXFOT31Nen49
 JLRcTEX7Bq6S7QJe/mTACSH4NiPL09Fes56TYdQrDq1CuEXaK+2yteZDOZEeXHEQev/E
 rJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739532627; x=1740137427;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NUXfDOQe1PjE/GwHmj5OmmzZEaxV8TIkFPa/Dhe7pKw=;
 b=qM2E1BudwMRXZuvWjHnkAf4Lu+MBBtawfyfZKAi2v/y6OEt96BkUvik1ma9Bxv/VOV
 pn82HnQafZvFJHv5k3p91904asf+qe3zOwLKCrbc82F6rCDNHlysOHogCx0BtRrqfFIo
 ZsYzNJ/UjEQCysOYZZbIaeBUwPP+6QSqBY+KTgw0RkWcY2DYcAnhCfN+IosdKMPyEupN
 kWrGVF9Is9ST0lUbX/yHb7gTSptfUfkaGC9NwyRzKZv/Tz3LHHi5V7rMwLYT1Bj/vuz1
 c6alcMXvqRyerQ0K0bgHCG8UjeKn/GCu3XSzTi4Hoq8Nr4ma7YVrKFp1VaXL2XpEy393
 B1Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw+zYdG2L58Mytc3/7j1Cm0noQTaKIQDBZhQO9Ou6rUwD6S/gD8/kYWsklWoprHQinIbHVS5y18Qk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5+NAJ2tFwUw7xzeBnYopuQx2ut0LQpm+Up/nQPlTw9kU3IAgw
 QOSZmY5goMuvV9ZmhbIZHbwExrM96YbyyCXPQNVVlWar3CjV3CKQO4U6cfgT7jk=
X-Gm-Gg: ASbGncul3mdiWWfz4b/C18xmeXLG17gwhJv517UZKj69dqKhmYlfAQFOgZaJuFwTKMZ
 grRbk6AinkcMH18Y1585y6C3PibchVtrIWP64jTIZc0INmTN6XLNKzTBP3X3v/WLfupkg9la8oC
 D3fHip7J9e9mbZMY9n4hhW2OWNQEm6KRfg0Me4NN+xxlsDMSJiqDp/u2xdctYC0/SahA/2h5SbQ
 b3XdsjFEms69Mt0QBgCEK8u65TYtlVqnHNCwzsWrCTIjq558snLzRGV3qTsWq+CVQ3wt0G/L6bQ
 JHZE8i3xnzKEmZ2En1ONGp8+oOYII+RDEF6RJTSSskuaNFFYtDWrtEXoQBfk8rTcoki2UqQ=
X-Google-Smtp-Source: AGHT+IG1HjnIzHq0g6LCLS2rLFVsIGs1tP/QSpXsX3Vtdfzqpm5vZz4Yto5JghYhTAcD6DaFR7+wyA==
X-Received: by 2002:a2e:a58a:0:b0:307:e498:1269 with SMTP id
 38308e7fff4ca-309050e318bmr35230061fa.37.1739532627133; 
 Fri, 14 Feb 2025 03:30:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091029b769sm5097411fa.101.2025.02.14.03.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:30:25 -0800 (PST)
Date: Fri, 14 Feb 2025 13:30:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/msm/dsi: Minor cleanups
Message-ID: <r5mq66osrzle4xbduvaqhv4ypqc5dfkjrhvqwchjmni2q32sbd@gh77gkgj3imp>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
 <ad2bc7a7-2e28-4599-bb94-fd66fd2ba88e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad2bc7a7-2e28-4599-bb94-fd66fd2ba88e@linaro.org>
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

On Fri, Feb 14, 2025 at 11:52:14AM +0100, Krzysztof Kozlowski wrote:
> On 06/01/2025 09:49, Krzysztof Kozlowski wrote:
> > Few minor improvements/cleanups why browsing the code.
> > 
> > Best regards,
> > Krzysztof
> > 
> 
> 5 weeks on the list. Any more comments from DRM side? Can it be merged?

Are you going to repost for the patch #2 commit message update?

-- 
With best wishes
Dmitry

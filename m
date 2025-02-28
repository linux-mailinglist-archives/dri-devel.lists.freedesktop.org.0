Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEADA48FEA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 05:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BE810EBEC;
	Fri, 28 Feb 2025 04:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S19+zJlU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC4910EBEC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 04:04:01 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-307325f2436so18126731fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 20:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740715439; x=1741320239; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Qd/SSjZSdsFXpP8Mw5Z4CDkuUKoi98PoVJbFfa8a+ac=;
 b=S19+zJlU/uKARbLbPTR3edbGuP2aF6l+Yfu+6mYkoIHVGdv2PNCrN3Az/JQKJp4EVp
 O4vJkDkhu5Amq2PVjhS98qgOVzEOLe/LfZjIPxM7CTosq2nQ6O3ORUgRZJ9Jdy5/W9IU
 lXgn/HbxYed05vEPcr1SH44lWYpvJ4JyhftKFMwGpRDPKXBkq9sjdc2cAYBElYEN8lUi
 PdjccU0Sp8eejnIrxnZ/aJ+KGtJuYO4tVkiuDJk++fZy2CwVGmYDGcv3fh9Y+eVWs3mM
 2eo2zsotbrh9RiRL2sdiY8tV9ESqhhEUvU1WMkC5b0bCICo7Aeqqcv2VLBYW5eVymX2q
 cShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740715439; x=1741320239;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qd/SSjZSdsFXpP8Mw5Z4CDkuUKoi98PoVJbFfa8a+ac=;
 b=V5327CMEin9/QpG2j5U1jTnf5mSDP+QxsdggwxH+vNY03Q293NFXpn9AuvtyJCNoLp
 HoVZlRD5sZD48zRrc9LFzcij45l1jQgMy7TYfGWgBuL58bsPLsH00yuLPQ391N5QcJ8y
 80CABnlVxZzdDHQji7TfIYbPlQqLGWvhRumzqmSROCtgAiULLJooBnH5Z8voAdr5tN0o
 YkE9Ee60pSmT+58UeN4ZuMTfMbX038tFqK9+A7MkD5pkAd3o2NBZKsksMBd+Bsj8XfJT
 q8yd/u1Q0zHlSXDNN7CLpHimpjQeep1AjJwrWy5WZSA1pIpA66IhRhlAisncmLP4pXwz
 wsig==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8JJju2LbkhAOQNKdLJPv52L5Oc3/MmWIyHIuV2u5WSiQTUJNXaQBUrpPoPWb8BVSDwUCTR2XgEPg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXxtZY8SHC9nvAFdfb/1E38b7nCp39DP+A8YRFHqDCqlt5ApEU
 pl+jGZblR0nOH8v5D1HHAu/tu/fwpWqgMv2s13qGR+eX8yWGWxI0nlBfbpnf/4U=
X-Gm-Gg: ASbGncuVMAFNM7CChUNcFNHnYdZZdOnBIM51dNYGL0xjRz1166kkfOVsbEW9LXRxyFX
 L/XB3wdDuq85DiUP3ATCoOKNQIaNRVLPIoKp3enAh6TwPOSpq/49bJsM4QZ605NB4O+t2NBEmu9
 xU1/qrR+Z0+CaempjkLcCfO2hkyfQqYKRkngGJews9wrV5eHCxSqw5lihpd2OVoKkc0Ui1T5456
 JpwoHjoAzECAg1SyQgZ7Z6ciz/CK/TfrRsxGTXmWINi4/yENSSF0Fb/wFtkcxGU+moXWqUojVWc
 0SNVidnPZ2ReIB+WYBVy+fxHPFCYUxWUW1r7MDqtDaLJh1xfPZgopiqXvuRD/FVmwmIuu3cKOg5
 Vyrmjmw==
X-Google-Smtp-Source: AGHT+IHNQymHd5ykzqnXmyMsW1a5EMx9alc09Hn9+MB6NToh83PZlB6/RNRvKwbTSqirwQlRGlJx9g==
X-Received: by 2002:a2e:b70f:0:b0:308:eb58:6571 with SMTP id
 38308e7fff4ca-30b9341382cmr4665921fa.26.1740715439491; 
 Thu, 27 Feb 2025 20:03:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30b962da0ccsm1003861fa.27.2025.02.27.20.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 20:03:58 -0800 (PST)
Date: Fri, 28 Feb 2025 06:03:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL
 blocks on DPU >= 5.0
Message-ID: <6utf3iirzf7vtotsjxswtiuodt75mtrmhlofvsju5qfdmx7sdk@6mflw7g67ljy>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
 <20250220-dpu-active-ctl-v1-7-71ca67a564f8@linaro.org>
 <45evxcbkcenkoiufh6vqpq5ngfz3mz62evvjxehmqgp5sd4lo3@a5swxugzf4fm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45evxcbkcenkoiufh6vqpq5ngfz3mz62evvjxehmqgp5sd4lo3@a5swxugzf4fm>
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

On Fri, Feb 21, 2025 at 12:37:40AM +0100, Marijn Suijten wrote:
> On 2025-02-20 12:26:24, Dmitry Baryshkov wrote:
> > Since DPU 5.0 CTL blocks do not require DPU_CTL_SPLIT_DISPLAY, as single
> > CTL is used for both interfaces. As both RM and encoder now handle
> > active CTLs, drop that feature bit.
> 
> I was wondering if this bit only existed to ensure the right "pair" of CTLs
> exist: not on DPU 4.0, but on DPU 3.0 we see that CTL_0 and CTL_2 have this bit
> but not CTL_1.  Meaning that split display can only work when that specific pair
> of CTL_0 and CTL_2 is used in conjunction?

Unfortunately I don't have a deep knowledge of those platforms and I
don't have a way to test it. My SDM660 board (IFC6560) doesn't have DSI1
routed anywhere.

> 
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 

-- 
With best wishes
Dmitry

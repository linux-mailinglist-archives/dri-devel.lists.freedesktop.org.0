Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2A897A853
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 22:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AF010E3E1;
	Mon, 16 Sep 2024 20:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cnxhJ5LI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A7D10E3DE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 20:33:44 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53659867cbdso4698310e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 13:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726518823; x=1727123623; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Yut24jaXEEyXf2W6luYkU7vtIEq+YITeP0mm4QVVNxw=;
 b=cnxhJ5LI+oOWFnzknsUWXMzaQW68GoA0gXZMnvjS/Fc9bGC2IOwCzqwNuacnBuK8lg
 stteJ5xKA8gx2fCa0r5OQ5xIgSVzGb7x8+fcTsY55YqVQ6eKTEWXPkmO8jXOb56ECZlH
 NK/RUmjnbLhh8XiZfHuYXZmUzYHS2WUD+Hgc6J+gcrXc+1N4vDz8foIGsoioXJ/t491Q
 Ll0aD+bw/dqvMOQ7qTTwxS39s/kfip9jvtpDc2Ww0PqhhNsep52ABHgz0wYfFtJAMCAE
 mfjWa+o1t7YgpPbjsgF65aHDqwJE4IYutKaddPCpOjMCb/zctyb7oZThOWnox+qQjwL7
 /ziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726518823; x=1727123623;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yut24jaXEEyXf2W6luYkU7vtIEq+YITeP0mm4QVVNxw=;
 b=GZ+e/zSNSZmlPpk4ZfGkD9Un+MOOKEeIGZF5zbtDcen5JtYy1DQzSIT2fWRCoshtG3
 bMncvqB/MZtPC4DynAM2p4gFl4SyxkjEwn7/tty5llWN4JRYc8YCJwH9tp4y0jAiKpxG
 SZFEx8DIZpCn5YRoOLFkGyWJ/ovp541OAkBq2+Ax9zwQigxuO8ZxEcdM25iUV/m4C7Pf
 lwPo6LU+SJHYySUoO7kV7HyI8Nt7w55E/QeuMlT4/QZrIXtGkVG7x5gfjxstfbUfA5ed
 fiHDuhEKWrQhRrfjUpvKNEjAO8CoaZv1eGNXiVafETIhTR4Lru4TpEN7t2VvIlaxSNzl
 tQxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwywOnRYgwlg1WqL4/XCjPP5KrXv9/9nrN9DUO3Y1LVXNV2qFn+XtAIe3ok8jzAhHnmqTT8bQ5s20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOZXXPikEu4TxxNPWIIpuj50luqIoo2oqj8eeB9qbb4W1+3nJ4
 haCFyzqNBehhR5NgKKtTxaEsgzvuQl5UsNcuwCoT88fi3aA5q6E8jX7pseR0UQ4=
X-Google-Smtp-Source: AGHT+IG9vXaSNFzRABgfXln+bLUZnXnpxO3ZvNYLOdCVSLIxonM0R628q5CyjP8oU+JQdKKaIhTAYg==
X-Received: by 2002:a05:6512:3f0f:b0:536:7d7d:c621 with SMTP id
 2adb3069b0e04-5367feb9550mr8405049e87.8.1726518821966; 
 Mon, 16 Sep 2024 13:33:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704685esm976445e87.27.2024.09.16.13.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 13:33:41 -0700 (PDT)
Date: Mon, 16 Sep 2024 23:33:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>, vkoul@kernel.org, 
 kishon@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 simona@ffwll.ch, 
 abel.vesa@linaro.org, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_khsieh@quicinc.com, 
 konrad.dybcio@linaro.org, quic_parellan@quicinc.com, quic_bjorande@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: Add eDP PHY compatible for
 sa8775p
Message-ID: <t4ytnii3sdiqsni74d7qsi2c6uv2klwmzmgznnirt2z55to4hj@lyaoh5fzcyti>
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
 <20240913103755.7290-2-quic_mukhopad@quicinc.com>
 <2hv2hcpbanduw4wg2wbza4jkze4sgilrtyc7zack23uygwsjol@ckskl2rkd5xp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2hv2hcpbanduw4wg2wbza4jkze4sgilrtyc7zack23uygwsjol@ckskl2rkd5xp>
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

On Mon, Sep 16, 2024 at 05:23:55PM GMT, Krzysztof Kozlowski wrote:
> On Fri, Sep 13, 2024 at 04:07:51PM +0530, Soutrik Mukhopadhyay wrote:
> > Add compatible string for the supported eDP PHY on sa8775p platform.
> > 
> > Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> > ---
> > v2: No change
> >  
> 
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

So, is it reviewed or acked?

-- 
With best wishes
Dmitry

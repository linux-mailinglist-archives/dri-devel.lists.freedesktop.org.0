Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D07739E3736
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 11:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099AA10ECB4;
	Wed,  4 Dec 2024 10:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mNMctgEj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3293B10ECB4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 10:09:47 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53de8ecb39bso7738384e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 02:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733306985; x=1733911785; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6GG/C0igHoeNKj2mH68ClLF3Ygx5izj48/Bea3x0gsc=;
 b=mNMctgEjvP6RxsfwoCbuHq6M7lsW82tXcNQi3y1TiBaGee4XQcNaIrVe9BHJu1lfSY
 h3Chd4CVzaaz1dzzKjgddHod+m14xC6spPn1QQiWqNEv2SirDUO6Zqmw7Zq7a2h5cY87
 leqpzE+ExcV+6gbqa+0k1k8PJ/xf6MMFzxnRGVGpVF8kXS0pIBIX67mv0NJPlB1/yOAa
 SFg8VB6F4MqC0MCfH+cVFeBXpL0yMlemU3cpmjl4tWnDSubCZ8QJZS7vRI93XujE+8s+
 tJ7xW6+l/cEdH5k/Gume8XCJd1t7FB11sVcpnOUPeAKgsP//u/BhEE32akAzQEXWz59L
 lTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733306985; x=1733911785;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6GG/C0igHoeNKj2mH68ClLF3Ygx5izj48/Bea3x0gsc=;
 b=ATp1nZP3xPZlfc+Gnf29eAJWFsnXH5j5YMMnIcodGRSxX2bSqCy5ZDxQOhErZ+jBI+
 r6XJA6t2RaTCu/I9zeQD8JJEao1xw+sXCHtPZti6bgGxe3Lrh7OaHESYVSRU8uljim38
 0Q+RBigvJ+DAUUPxcYLR3hbe9Vo2e71eewN5bEW8WhQ98Tqe5Lxa6wfpKUUmbRKhMDw+
 KCbeTVxq9awg1PNThL9k6CALBdaBlHRNH/YYZHO8RFwyUElEHAChnRFaudF3J0HhNhXn
 OLqyD9ky/yW9gX5erNJyCwICjzXlNEvO3CC1SGvNIakOv8ydL0jkk33oYvtfGWqPjOJ4
 VWEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN7mp/+l18x4NJKcik8fMr66xORIZ6UEGdStCbSLiNIpSKmLRAkK7ODhecc2R5C/zfM32MQiKJC7s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcFouI25WO+m6tUtQmz0ssBADkyAkNLadv5vKDZ9MvoyY3lW/A
 msWwoN0QNZVfOMZ6CTh2a8aP82TtnOg9IPwJlEqTOIHBA9bziGwV2xare1YB8B8=
X-Gm-Gg: ASbGncvQ9VWeXnp1hnre7S1vsO5ewNxQqW1v38IzJ1qBrlc+9McmhpoOwodCxuJZ+0H
 busPeMzw+vCYnPsrELt3LNi/38qHjGpTNevfKrj36hK/MShNzeebUqMqwLYpyS7Fwktf6O6pCGY
 5SOHmn/qIbTV7EqFd753uw2Iq9QoSWgII32vu1hx/H8rolhIj356Lxapzv8K3HMjb4w5vQD+0I+
 lXVxDZN/jSSOISJhCxSMFZEMvrFpMftv6xnAmDfccKMFAckEssrKyNgxqi0jVjPm3nPY6o3D4Ep
 aCD4fc45XXG6qGtJrE/lIqM6F6H53Q==
X-Google-Smtp-Source: AGHT+IFeChx3JdkEVrSx44qmoT8HCpAzvLzptFBGVf0Lu16LK9AmpqVP6+Unh/3j2hROlEszt0kJ2A==
X-Received: by 2002:a05:6512:224d:b0:53d:f82a:deb8 with SMTP id
 2adb3069b0e04-53e129fdd73mr3741737e87.14.1733306985190; 
 Wed, 04 Dec 2024 02:09:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e14f97649sm495602e87.146.2024.12.04.02.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 02:09:44 -0800 (PST)
Date: Wed, 4 Dec 2024 12:09:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: display: msm: dp-controller: document
 clock parents better
Message-ID: <pxi2nf4h34xtkickkkuwh4svvhbtsutuz5u3ukzgfgd5rzzcps@g4gct5zuc6kj>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-2-9a9a43b0624a@quicinc.com>
 <bfa857c2-cd74-4fe2-a88c-3b35a58710b0@kernel.org>
 <gpqrugcsyhz32bvip5mgjtcservhral2o5b6c5nz4ocwbjw5uo@eypv4x6jyrdr>
 <hqe2pipkcnxftoq5mvdk36xmkj3ybr3oto6eghimq75rqlncsm@v45smglhedy7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hqe2pipkcnxftoq5mvdk36xmkj3ybr3oto6eghimq75rqlncsm@v45smglhedy7>
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

On Wed, Dec 04, 2024 at 09:02:18AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Dec 03, 2024 at 03:41:48PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Dec 03, 2024 at 09:01:31AM +0100, Krzysztof Kozlowski wrote:
> > > On 03/12/2024 04:31, Abhinav Kumar wrote:
> > > > Document the assigned-clock-parents better for the DP controller node
> > > > to indicate its functionality better.
> > > 
> > > 
> > > You change the clocks entirely, not "document". I would say that's an
> > > ABI break if it really is a Linux requirement. You could avoid any
> > > problems by just dropping the property from binding.
> > 
> > But if you take a look at the existing usage, the proposed change
> > matches the behaviour. So, I'd say, it's really a change that makes
> > documentation follow the actual hardware.
> 
> First, this should be in the commit msg, instead of "document better to
> indicate functionality better".
> 
> Second, what is the point of documenting it in the first place if you
> can change it and changing has no impact? So maybe just drop?

So, do you suggest setting both of the property descriptions to true? Or
dropping them completely and using unevaluatedProperties instead of
additionalProperties?

-- 
With best wishes
Dmitry

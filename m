Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4419DA56060
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 06:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BBC10EADC;
	Fri,  7 Mar 2025 05:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rVqekRQo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A237310EADC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 05:51:13 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30797730cbdso13909541fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 21:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741326672; x=1741931472; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tXmSK8/WMVoYp/YH6Up96+HRQthxxadTxRUuQDlSb80=;
 b=rVqekRQooHvQGylVN/J8aUdHPTQ2sX7qM/grC/zR10TsyLj5pA1b+EY4ZFQsMdgxE/
 excgapqwDw4xr7e8pJTnfqIwXnl1cwVW4wyEZRQCsB/WHoWWTH/90aHVL2uBzIvFMd9I
 FbKFfeiatr09YvpMj+RPY4Pl2nz4k3WBNLtySmdMeqoQXnqYOREWTqW1NipWpcC5qz6S
 5wXfEpH9EIg7CNr9Zs2kjOOpF+dwOkGR1l2jxwvtBtiz0k3b+Zw20nz1HB/jZweF1yXo
 AHHqfkxgZw/3F4ifnCNhukJV3eS+2SBL7os5et/7a+IVvPTnmkjfQkNzyj2nYtQlZWsD
 eEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741326672; x=1741931472;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tXmSK8/WMVoYp/YH6Up96+HRQthxxadTxRUuQDlSb80=;
 b=NZACawENURahXgj/nY2PK+BKEMdTGUxAIfgkzEotwIzk1FcXfZgzVAOS6xL6nznTtC
 ensS+rqbyi6PHojWddGvhY7Ldl1X1VCv/wGf9n+HzbwQHdPYwZOhlFn/xiP1yW9uoVe1
 RxtaEV/grqfIQnJcEOiuxpRYVz43OeZV7Tmdm1zyDYdGdnNStFRk27GBlLng/sdPkl5x
 DQlA1xfBUf7yNWpWqBXcer/HEw92PPaiNz6MZ5xnXoqeE28cZOEIGr0Kk4aFkiH70zU/
 dl2MA7ic4cfyfj6Q8YAI+6QTL7p7L/IRNPafvcL+wWVw4Fd8PEhYtJPjodm8UH7xbyBN
 VYxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwTfwA3zDeiJSjrQnrzWNP7JcNWSzatcYscz6wSO95G0QUFpqrmXV204NsS+8GO7jVaySBmn3QOBA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6pk+JMAWfLqu//g8Zf4YGCUpvwXGRjyMXVOfl0eSZnz93eq98
 wNAjPebU4VL/eY4ttbJGgFHbFAgSoJD0ROsRspMrWpSpMeJEwGCxkV5OGd9HLVI=
X-Gm-Gg: ASbGncsHSjWV4vFaJXloZcFUA6lpp6eLRorG0eW+MVGeLHMWKfhHWHs/ISpCZXQy2OP
 W6phUfQF9WqJ8bIzJzulXK+VW0LqWH8UBsRQNYmKwyYbq+4gaDQycf1UGbeRVjNKuki1qLwxQge
 AzzmbW+4KKNUoTujWROWUHqg/PTfRJ402+A450ju0BloRfvIrp+QWh9rsjhoQ9ze4u6ByfkTrhJ
 SVXMpgDWSwh/SR9AYWFnv09tLw6Gt2p0BEKGT3QFRQ/6mQifdS8HuiRUkQgpMBqHFoNZng5qWB/
 xK0SQlKv8f9dVL9yf0Kzodxbn1Yqogxp0pHAtlleGMuv+8F0E8RkBqAsGiq7NJ6lzjHM1B3LhL0
 7FQs7lCDMTpeGAtPPLHwRR2On
X-Google-Smtp-Source: AGHT+IGZcu2fypEgK7clxXmR93TzJ7unEXU/+kahsKp0+Qev+odXPrrlaC4iINRI4Yd2AzKHpypLwQ==
X-Received: by 2002:a2e:330e:0:b0:30b:eb08:53e3 with SMTP id
 38308e7fff4ca-30bf45360acmr4804561fa.17.1741326672025; 
 Thu, 06 Mar 2025 21:51:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30be9a073d0sm4291591fa.112.2025.03.06.21.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 21:51:10 -0800 (PST)
Date: Fri, 7 Mar 2025 07:51:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>, g@eriador.lumag.spb.ru
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Robert Foss <rfoss@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 09/11] arm64: dts: qcom: x1e80100-dell-xps13-9345: Drop
 clock-names from PS8830
Message-ID: <bth4rfqqu2bat24avosimvxuqmruc52taues4wljnhfcmxnx7m@zkjvf32oiogt>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-9-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-9-0c84aceb0ef9@oss.qualcomm.com>
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

On Thu, Mar 06, 2025 at 07:11:21PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The preemptively-merged node contains a property absent from the final
> bindings. Remove it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 2 --
>  1 file changed, 2 deletions(-)
> 

Fixes: bd2dbbb1f35a ("arm64: dts: qcom: x1e80100-dell-xps13-9345: Introduce retimer support")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

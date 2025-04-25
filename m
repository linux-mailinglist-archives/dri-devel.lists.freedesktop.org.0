Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8ADA9BEF3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 08:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C37B10E893;
	Fri, 25 Apr 2025 06:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WHmwDjVS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4255910E892
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 06:53:42 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ac2ab99e16eso417122566b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 23:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745564021; x=1746168821; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TNsUXqANAHwqGKnEjqoHbtxkzle5D9NAnbyrathgw4Y=;
 b=WHmwDjVSXHxWcWE1F2fUM2k40VI6363HwJUDvIpAOql87d6um1UX1gDJuSF3JToDWp
 2SG55EJtg8O/eFfokVa2Ki4OuCGkahw5WXkL/IY3rBHyj7ZYhO7ug8GZDl1fs180Ahd9
 641cZ5r+lMDHeJOjefAxm3bmeNYzx3l48M8XZz4zPrHaaqdvFx3TwLtdT+9jsN+gDJR5
 xDslGafL8drnCnO+Cb/bxpHIp6wE7YTZE3aL9Cq16+s7cduUkQe4s2H/k5bfICmJgaVV
 Lt5wMKwG/Way/NmCmja8F78+0PCJfHB45YSozNgijqFKIbidpjaP54nXfDGHp0w8KoTl
 YNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745564021; x=1746168821;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TNsUXqANAHwqGKnEjqoHbtxkzle5D9NAnbyrathgw4Y=;
 b=Ejd+OzunGxMSJl7XvJzL4yMvaM0HfJHcY82ZGKtKikoH0VCCop4WVz+Swdr9yrb5vP
 zqhE78X1rg4WUiPWOj5/9F03fN7Ypc39SjTV1Qe4nnhCLXVZO5C7RLdMfKPF/nXbLBK5
 0oE3hg199QFPDp4BMDqFfUFWj4sFVPrSqK0n2Oxseg6IIA4s5luoMr94n3rIWP8Ilofz
 U3zLAA5auFNtbjnjRCStAA/eP+SIPd+zYgfmX64FqbXcmb1iupudBIqMFxSZRZJHdFBP
 rgzoMGFj9tVFe1ESEeXgZ9GjycEaI6B1fes7/9isKoO5LLPgFkvDyO3FciKrGGYQ4fLt
 3U9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGTfjeTMMLsRzCmUrVAM2sZlDar0Vl9GeeQIooRBNdMoCq7dbS/eGTw8KIGat+bq+RHDpkn2kyi7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8NyWte0Pr53riTUW86iCvSN/OYUOvzaulliGsyL7Q7EYJAsEO
 KLEuJdD3ZAKtrPfvaOUwwFjjEKFz3QLN30ITOlXF2t5lt1jysXlnwhdgRGhH110=
X-Gm-Gg: ASbGncthrhlzYqvZdOIE9V4ESNTKQ+cUSxHEBruJ4IzzWfLwQsX+5t4pwavV214ASVw
 QUChBmbJPgHwV7rrfgBSZRuHA/TvLKuQb6vAd8X6oePrJZHE6iDyNQsiKfChpT4TEcOquS8Z/tI
 nTHy+g5KwcHeNoWw7Y/IYVmYIMOsL8PJ6OMAT0nDv5nWhgyVbLRpVJ2D9X4L8z6uFxH0R1iOy2x
 nvqyIzAJfr3xCv8G8TzcENPUFS5qwvLM4F6godD+qxhTQJZS4V03dSUOFv2AruOo0cqI5BpRRqZ
 H9+uWER1Mih8n3MK1t96Qc8vRiMAWODV4S278Q==
X-Google-Smtp-Source: AGHT+IGH00KXAycAkV9YoM6vqabPYd7he5htUrIMPdynMtalpRs9NoW+Upt9XSoJNqYWkG7Pm5b77w==
X-Received: by 2002:a17:906:c110:b0:aca:a688:fb13 with SMTP id
 a640c23a62f3a-ace71178f01mr114937366b.36.1745564020787; 
 Thu, 24 Apr 2025 23:53:40 -0700 (PDT)
Received: from linaro.org ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ecf8c9bsm84603966b.101.2025.04.24.23.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 23:53:40 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:53:38 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, johan@kernel.org
Subject: Re: [PATCH v3 2/4] drm/msm/dp: Account for LTTPRs capabilities
Message-ID: <aAsxcrWyLeMB/Tdv@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-3-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-3-alex.vinarskis@gmail.com>
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

On 25-04-17 04:10:33, Aleksandrs Vinarskis wrote:
> Take into account LTTPR capabilities when selecting maximum allowed
> link rate, number of data lines.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F51A323B2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 11:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F02D10E845;
	Wed, 12 Feb 2025 10:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ag4FATBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D76F10E845
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 10:42:32 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30737db1ab1so61032061fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 02:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739356951; x=1739961751; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ld1TfC5Cdjw/PoVC0iP097r1SbIYfGgfFoLiWX4Zz3g=;
 b=ag4FATBoVcaoe4O2Bt2PZaaWP8IHhgH4ulV4RGtWlviFG87Afp6ExoG62C0JVAeLlg
 MqxvOHNkHyuqku3B+fjnt/wjYIOLg//hHkQiGBZCF17xqFjHQ0O4mpwSGs52XAxTu5TL
 eGkIPPC6vGDDJBlRypKBNhCVZhMMiR1mP/KkjRRjNILw5fIl0+IqiWCoSCbmSq/NE2NJ
 ZPur190Wgerkj7ABjtl2O4ImRwgDWS8PWORQLKFo7XFGHjetK8d0/odICCeaXFwq4kJs
 9/BxdRnFpzrpM4nvITMVj3TPlvkgrx+VBogvmBHjz0kcq+slEjDaeW2JPzgiympPPYVv
 a5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739356951; x=1739961751;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ld1TfC5Cdjw/PoVC0iP097r1SbIYfGgfFoLiWX4Zz3g=;
 b=ZAR+KqjZZ+gOhA+ZYLl9PS/DNUJZVyDs/i8ETjc9iUtjKol7/tm4L55sBIIyL8xq0R
 3G6kE4W1saJzoxhi60ujeV3unAoNnTqTkA7rLeG6J3Q/y+CR7HdQGvW47LfoWYENiDFM
 j9F+ZrZ5HUdBev9fWe9W3zJZvvta/tLNUlLjsFQlWO+QbVWEPnmoy3g1DATrn6jxAbRL
 LUFjrvoI4zS9cLxZbcUSqC4S55zccX/Z8Rwz8NWs5I4SXOrDUwzMt20kwevvQLuoLmK3
 TINqh6yo9oDgbtSM738hWoCxRtjGt2ULrnSyBE896wy+msdikXHN/7SJ0JOJWRjFUC+C
 LOPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcbMUUS6uoz7FnIppVQtrkJITkjGkKGd1gpvrTqVON0SHDnrL1KFdP437mCw3dXqVQqFEd26+iQx0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGzZxOUiC92ePzvt6J/zc5tHk9QjlqnUsG1Dt7+F37J5Kh+iZ2
 lFKULYZPtr9yHAamJXEVGTffS2Z2PkCJRhL2h6K1IIs6BExWK0PnPIQhc3Uxin0=
X-Gm-Gg: ASbGncsQTY241A4OS7xnL1xzoL8BI843lojxmtTcKBbJGSJFX9QMsDPkk0FhYswZkgo
 OZR/KVHKj/Zj5jfqZkFt8cik3w996YMZ15i8ujAT/o+sL5Tx79SclMbRyk8Aomuor9sJW0KEXzA
 ngtp4usERgAYceHPOZaGFkVAl8jUJC0S0D+nfgcfvSI/OhX03m814kL3ecjjcUP/Zj002/f57t4
 1a84RRtBuQtaoHAINmnYu93Hd7ThIPJE/wruV7KqwztWpp0lxQVjTL/6eoValI52uGeGIyYm69R
 vulIGbxAgs8KAKncdHanRldOi55xkVLHMnZYUENwd+Px8Bapm40RwEnoqY7cD1G07fs9fqQ=
X-Google-Smtp-Source: AGHT+IF+1GUoRD9HhqBh1RL9sJOAG4t7Xk0SYLrZn9lbwf1SpooHUxeWe02/GIT06t3TK4EotARjyA==
X-Received: by 2002:a05:6512:39cf:b0:545:17d:f96b with SMTP id
 2adb3069b0e04-545180eb5f9mr737259e87.14.1739356950858; 
 Wed, 12 Feb 2025 02:42:30 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54504e344a7sm1328754e87.5.2025.02.12.02.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 02:42:30 -0800 (PST)
Date: Wed, 12 Feb 2025 12:42:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Redocument the
 dp-controller for QCS8300
Message-ID: <brm43v5kzsum6hc6ahs3lqzgww55kczjzwzxsmx5a6alw3xxvh@3mdqqjvo2b5k>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>
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

On Wed, Feb 12, 2025 at 03:12:24PM +0800, Yongxing Mou wrote:
> We need to enable mst for qcs8300, dp0 controller will support 2 streams
> output. So not reuse sm8650 dp controller driver and will add a new driver
> patch for qcs8300 mst feature. Modify the corresponding dt-bingding file
> to compatible with the qcs8300-dp.

Forgot to mention that in the quick response: please fix usage of
capital or lowercase letters in the commit message. If you are unusure,
'git log' will help you.

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry

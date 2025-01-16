Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A52A13B96
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 15:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C62810E97B;
	Thu, 16 Jan 2025 14:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sI/33k3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980B110E97B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 14:04:58 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5401ab97206so981591e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 06:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737036297; x=1737641097; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6G+Qwp6aT8Mc/la8Y4v1IKa7CCW9R/xdEMSakDR+41o=;
 b=sI/33k3iyQxlvx1Xr3TcoiM9JNouRPZEqHMZElUeoAJBzAgRplLFbvXpXZjpqQuJKN
 kh7wVgKsdcfz+pC9bt+vC6xjABig6GNi+uTUaAoe5hreP9xwUJ51o6JCceWR2WtSm9VO
 IfOumSCNEDdZouC8W1C4Kcr25ekfU599HYp7YJCeWxU5hEX0SXaSf+yYDBuhNVFAr5Iq
 q1GbK7qI1mvj32CBVDZGuMhNWiNvlaprCctHWC8Gfu9vub6W9xMYe9j9F9FBLFeDkAql
 +hIjAoM4lysbtYx7xdp1K+KKyIunTPVatp8EstuXdgJfjRJL5aJI573qethBFjQRsgIG
 6Q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737036297; x=1737641097;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6G+Qwp6aT8Mc/la8Y4v1IKa7CCW9R/xdEMSakDR+41o=;
 b=JEU4kgop1aKDiGoKs1HfBP5zxUiehLPGGQEd0bxKSVqkoJAs/GzEo7yIEomiV7MhDK
 tp9aAp+TZE3oWGQMPhesSwQhEwKSuFBkf9R1uuoRMXj39e2Iait1YU9E6zBiZubQgmrG
 CuPdVbAfeNSjEk+wvudO/Hm2PY9nflxWfY9R/l9r2d35lqveYO0xyhNA3H+pjiJ0mZZW
 epFUzru61PPz534igVsPI/GzATVPWVZzaMAkSPK/Qh+M4+RFCBx/MtyFti+4Kina06fW
 fmu9XR2wlLmd8N0QdX4iq5LMzZrE9ts7QPm1icMRr9GXmeTrG3J93r6UW4Z0xk/CAKku
 XdxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH4PmzXJXF/rqITMKH2F339MGJ3OLhLdEuDxL4ZM5d8XhbbMEokPhVGxEwTqh/5vPMXiciYx5CXoo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrRhA6yv1EaHOPTfZHEADiHvFmY3yGptdnKu3Lq8J3m9rCy5Dq
 Yj+LcC9Py/KgfHKdzFuD9pqLwRYuMBOuhfWdgH/pdhz7u3h0nPyNREvd6zk0oFQ5keePKdS1hSq
 dnN4=
X-Gm-Gg: ASbGnctwQup73MYq/p/q0JT6zDT1I0HusyflgaEYbwjV8XwFmxrs9MbXEGhpkfNX0z4
 ntbvJf4ObmmTi2AqQtvDQrJnBfEcNsdVTq0mCEN/6WEV3dk/uKhZVqGA2tzBpbRPXkCu8P8cMie
 SQTPZC5j9LyaKr2Aq/MvZlALpJ/74nOnq8mPv/3yCxbL08Sc4t3Z9gmiN9Jy6G+3LZSyel23QSa
 2FsiruW7hK0aGIHNnTd3i26ez8As54Dsht7DejRoDF0UCP55fAmz+b3K9ScBHBNO1rnl+V0k37b
 dydXLA44U68Rbpk/cNSKNeVPOQtMmID7kMhz
X-Google-Smtp-Source: AGHT+IEgmq2sJVqU+nmEXJEYxGkoBKW3WEy835cYdTnytdewUNxZkXlRQLigCWlET5Go/BmeGkGlUw==
X-Received: by 2002:a05:6512:31cc:b0:540:1a40:ab0f with SMTP id
 2adb3069b0e04-54284546f67mr11469677e87.27.1737036296606; 
 Thu, 16 Jan 2025 06:04:56 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea66b4sm2375618e87.142.2025.01.16.06.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 06:04:56 -0800 (PST)
Date: Thu, 16 Jan 2025 16:04:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2]  support for kingdisplay-kd110n11-51ie and
 starry-2082109qfh040022-50e MIPI-DSI panels
Message-ID: <f2aj2jye6apigbn4dr5gbkv6vzy44ec736qfk64f4gueoocveb@rnuf3tfw7uie>
References: <20250116130530.3010117-1-yelangyan@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116130530.3010117-1-yelangyan@huaqin.corp-partner.google.com>
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

On Thu, Jan 16, 2025 at 09:05:30PM +0800, Langyan Ye wrote:
> The kingdisplay-kd110n11-51ie and starry-2082109qfh040022-50e are both 10.95" TFT panels.
> which fits in nicely with the existing panel-boe-tv101wum-nl6 driver.From the datasheet,
> MIPI needs to keep the LP11 state before the lcm_reset pin is pulled high, so increase lp11_before_reset flag.
> 
> Langyan Ye (2):
>   drm/panel: boe-tv101wum-nl6: support for kingdisplay-kd110n11-51ie
>     MIPI-DSI panel
>   drm/panel: boe-tv101wum-nl6: support for starry-2082109qfh040022-50e
>     MIPI-DSI panel

Please provide DT bindings for your panels.

-- 
With best wishes
Dmitry

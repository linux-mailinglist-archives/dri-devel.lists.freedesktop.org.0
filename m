Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 747FDA72AFC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 09:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB93E10E86E;
	Thu, 27 Mar 2025 08:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eMlbA0rW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD7E10E86E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 08:05:00 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ac29fd22163so112972466b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 01:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743062699; x=1743667499; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j4HEgztO8bDb8osaU3P7mi3hTF/hZput8WpT0jCkOJM=;
 b=eMlbA0rW6UGTxvMrJruLNOBCbttnbZEt7TNQzJdEoATbv+xLcAxoGAwlJWEAU9PFBD
 rP4lW1T0UTByr6wf5zm7TRZSP7t0hqHz/UA9c/EdcK/od1+LTTp7YMsRpkSinIb6Kled
 dvq6XFzTjV161yyoReGZNlrFlPwucCEYh3kHdpqygoGYkQaL5hClfpZAQPPtSSnjzkO2
 EHCE4w94bOdQSCfJBRUUC2M+Q6uWmLj/6bzcUZcAcBKHrfL7Cl0U0ft1RQF95gm8z0Bw
 TfRFqvVBIZSCnpLc/d4cwhT8gxzY1eR78Qh1Cug07VxrOjjCHcVDXLZqgtpmPz7TAPJ/
 lErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743062699; x=1743667499;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j4HEgztO8bDb8osaU3P7mi3hTF/hZput8WpT0jCkOJM=;
 b=bPEJC0+e7LSlrYCVHcqEPPEhMrhUJS9bTZJgYpgkjaxooNMLWdKGJWi+UoKWgQNvuV
 VxgJhXUO6JAumlRF/fO9ZhnxHY5voyY5aIQYtCKyM78nCEoah80G2c1Wc+elS1Dq8YhZ
 A2DrAuE9gCiLfkbYb6ToTTy7KfYSvFwRWB/j2RFOJk4b7eAzfnxK5EQhFr+GensMG0vn
 NIb9L5aBXeEuiD8P2lCFFWZhlZ1YN4wbYi1mIFhBLdzAEkRT1i/q3bzGiJDptk+QFrGb
 xqyRfam4AH+UZ6qmodc0fQdYBVtk7W0+aSodDn7/xz7gwGnSTkutpPePKO8FvwL5mPxK
 pfbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVJBn2rf4umn9348G1DuvOwyqagA9jdoVvgmrRMRH/VewyVbaz3PP6d/OIdlrmicnVvdkcaIOSyOg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7ryC265ALK8pfzTpixlvcyKWPj7CU4j6lbpeZjbaCGxznv6PI
 3awTFse2aT9/t0K5NdrL46VifnCxzifH+07cU0q1oU+91sDA//eHUIgoOOMHE0Y=
X-Gm-Gg: ASbGncv+Ew9Hkk5EgIEOg64GnmcUXdPCGGabJRLT2CtIjru0JtdgDnOFE9i72cM5vsI
 3aMaBer3US59xKfPqr12nuGdllDexg7Rd3d/RUPYwMvfzv0LvJ6huJawhmg3i1yVaW7ZHehICPn
 fYEl7487qfLyrRjhbrZYWYzJ5JYmjJcRaLe43Aq1k+YgCX+qE/wuzxX4isR5M4ZOIn68UiwZZr2
 pdjbnInGBntyCrWI+I+xd/hOsMXuQftC7HXfyYMJD8xasI6mOF5kiEU+MkaRA63/0HEs+PTk8XH
 IZM00NlbZoN3QPNRqXbmoXzdZ6o+2CQg+u6Sn2n2tg==
X-Google-Smtp-Source: AGHT+IHnwu/C7hwA35ZgXejtLeIFJKtAHLhv7l8qMYpyk9Q+W2Ud9zHdHAz/RjHL1R8rTdvL+rtmag==
X-Received: by 2002:a17:907:6eab:b0:ac3:8790:ce75 with SMTP id
 a640c23a62f3a-ac6fae47cfbmr238239666b.10.1743062699159; 
 Thu, 27 Mar 2025 01:04:59 -0700 (PDT)
Received: from linaro.org ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ecf76fcbedsm5182752a12.67.2025.03.27.01.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 01:04:58 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:04:56 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/dp: fallback to maximum when PWM bit count is
 zero
Message-ID: <Z+UGqItLubQ9kwF+@linaro.org>
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org>
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

On 25-03-25 19:21:29, Christopher Obbard wrote:
> Some eDP devices report DP_EDP_PWMGEN_BIT_COUNT as 0, but still provide
> valid non-zero MIN and MAX values. This patch reworks the logic to
> fallback to the max value in such cases, ensuring correct backlight PWM
> configuration even when the bit count value is not explicitly set.
> 
> This improves compatibility with eDP panels (e.g. Samsung ATNA40YK20
> used on the Lenovo T14s Gen6 Snapdragon with OLED panel) which reports
> DP_EDP_PWMGEN_BIT_COUNT as 0 but still provides valid non-zero MIN/MAX
> values.
> 

Nit-pick: AFAICT, there is no relationship between this patch and the
rest. So it should've probably not be part of this patchset.

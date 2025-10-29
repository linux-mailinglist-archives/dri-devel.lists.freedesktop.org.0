Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD42EC1D5A4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 22:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD8A10E854;
	Wed, 29 Oct 2025 21:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PAfLrsnj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791C610E850
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 21:05:42 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so224168f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761771941; x=1762376741; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mpxzYKWAnbzgsLyXnbb5p5d3wlWt84Zm/jE0R6RMIWA=;
 b=PAfLrsnjCOQc30AhWPr1detFhvUu4vaQ4V2fH8RwbwahXBo+E0OLWN8cxkJz4L/eja
 8y7oNElbiKOYti/cWI8AmOtqL8jfQeZa6So2yanSNtySeaO0HSigsmgfRr19XfAMCs/y
 RB5c5SGw0mOB+U8A9lNizK3+9G8/OdCGdsECCQ9mh39RXzQ3CEL7ednUJnSn6P9fsFYv
 zHO+VOvz5hoy3+dSCXIkgVoznrhcKyms+ux/1RHh+kg1sxAEyVEJDKjRu2E39nNEEeel
 yuMdu5KK8cUao/vzCkPTDr+GXdlHI0vgcE7Di5ThLITJznmxQY18o0VIh3OZCbT5F7SS
 2PjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761771941; x=1762376741;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mpxzYKWAnbzgsLyXnbb5p5d3wlWt84Zm/jE0R6RMIWA=;
 b=wZYskR/84umGh3ZVAl0m1eYV4qRT6YA/mVDRjV4np5jJy5LKk/EjRscai5Cw7q3FXx
 kYXc6WgwBZkJp0hWUPbLm+yFbNwfTmbjP2M1jyINWku8M5nbv5ZGcDLKrxYGfIfu3WsY
 lQsQKccGpKAGXEuvn9gO6ihI/wFHnkv+2Sbqzqc7LDCA+weQ61LevwvZKLbX28LttEFS
 LoEsMdoA0KB4CyxjqTy7oyGfff94JG03F8zQE6CfDDu9LikfCuzH4MC4linL4tkj857U
 2ahNAkbbQ4VRJl2dLdslHV40nMAMg2UmJrz1PMERKUq4JFYu64teL5VxizjMTDL/wsSm
 upJw==
X-Gm-Message-State: AOJu0YzFSlbsVGmwD9s98exwA+1I++TWnPSHiI/BuVa3EYmZ8cdhE09U
 rVSfDcSzUyJggDQcBXEEiAPTrOgNVqVI2PpWUzuOuylK2xVrbDQ7K1sObkP5OQaiG6s=
X-Gm-Gg: ASbGncuh0g+xay1NekBYBK1s7QXSe8HNJ89fqZC6Yc1zTNJXAixjcfl241Amq1kt3kn
 YbJaPALMJiQ1Il4DQMKbd6cRjlwnc+XsLvkPN5yxpGrWRroGlvTEOmVtiEhYkmYaleR1J4W28TR
 1TEAI6nGuLEn2t2xoqrqR/peq8HFSVTzBTyALiwubuVbXho8l2lPWJTLkdOtNpws9gTJBQ99299
 eHrOdKFk9lZyOWvLooaYiilwmTXbgZITh28TSGLIQaI7J3myOo/g01Ffi1Jk6GsbYjIkP53NTG6
 NX9Wmr1FrgOz8TdjTPUI8VKrG+Z098Ch8VEw9eUDGp+6F8BcpM3aWoI8PRZ1yAgOmuhWuWwCDMY
 yNYUOJuP56YWL6/vW58kPhN68PBKsc78WBDQZLHi3xPjGa7wnYP0uCbMZylQ41ncEagHwHQy6Rr
 zSAruapGlWiNFLQmLf1U48
X-Google-Smtp-Source: AGHT+IFjNDVfG9nSVNxP5ccXtI2gzlalGw+f6JndpkQvQxKW+TdZft3QWHVbSd6609LOnuWGywP0fg==
X-Received: by 2002:a05:6000:2506:b0:427:55e:9aa2 with SMTP id
 ffacd0b85a97d-429aef78924mr2715742f8f.9.1761771940865; 
 Wed, 29 Oct 2025 14:05:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de971sm27815109f8f.39.2025.10.29.14.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 14:05:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251009-panel-synaptics-tddi-v5-0-59390997644e@disroot.org>
References: <20251009-panel-synaptics-tddi-v5-0-59390997644e@disroot.org>
Subject: Re: [PATCH RESEND v5 0/2] Support for Synaptics TDDI series panels
Message-Id: <176177193995.2073083.3709590896561728636.b4-ty@linaro.org>
Date: Wed, 29 Oct 2025 22:05:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

Hi,

On Thu, 09 Oct 2025 21:52:09 +0530, Kaustabh Chakraborty wrote:
> Synaptics' Touch and Display Driver Integration (TDDI) technology [1]
> employs a single chip for both touchscreen and display capabilities.
> Such designs reportedly help reducing costs and power consumption.
> 
> Although the touchscreens, which are powered by Synaptics'
> Register-Mapped Interface 4 (RMI4) touch protocol via I2C or SPI have
> driver support in the kernel, the MIPI DSI display panels don't.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: document Synaptics TDDI panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5c42579b0705ea372ed7e6f158c880618850b409
[2/2] drm: panel: add support for Synaptics TDDI series DSI panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3eae82503f4fb24e36fc06f6827b8360678c2555

-- 
Neil


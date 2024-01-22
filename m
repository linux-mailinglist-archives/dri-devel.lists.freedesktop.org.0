Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ECE8360D9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C1710EDB4;
	Mon, 22 Jan 2024 11:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F43910ED25
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:16:08 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so3277048a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 03:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705922106; x=1706526906; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPmf9u26sxVj6eHcqF+q85lpL4wNzWXWxkNCXCaIX+s=;
 b=IyH9wbYiIQYCJgl6uumRzTFnQh1xv2Bx5FTqJXjPdB4mHGJSRuOt4ktkYYWpuw0nlI
 1YNNtXPEVdxkC2qLgc811YJeBDgPW3/dLNk0oM0RzIzVWfUjVBj7dp6De86vwXTCrEKK
 3y9OE98ca5n19ZhE5zG14y8zMnVFtc28AHS3NohvjaX/b3zGRyx6CCQ3Wqqgnofb0dXS
 VaNLFk76nRuGse95kaueqiMRozDHy7hN3K6pMTntGIE+sgDtlZJRjQEctPe+9+R7PFdB
 gKFvNaAJg9ybzz5TndAKqoOHBpvurK1ynKWn0h3Ba96nLt6rxAmslb5C1BXDda0Qt9lq
 yxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705922106; x=1706526906;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QPmf9u26sxVj6eHcqF+q85lpL4wNzWXWxkNCXCaIX+s=;
 b=PPMOMF0zx9rpmNX5j/Se7mj4op7896NHXohBd1cPna8SQQr1v35+j/9cupLRZ/FN8r
 AtXJcNjjXmXvvM3+MpMycXQ3bg5gd9avs1XTVRmGBjjnyxw7w12oLvZjO7ew6u5mIIFC
 d2IC00pmqOPT5L6VybhMPt2KF3XJCfzN4gX+GDMXkWv59+LtjoOi3QX3M740w9J2qXdp
 YW+3ZZLiDhDrt6gtSOYcyOYrEiTyjgIxJ13QmxH+rjGHYb/wWWGdCGihHdMvQHamiUn6
 B8g3ijI5fKihbEafmAe3iBStkKrjrgJeyLvRwR8y1jYJPVefrnUIk6vGJKUSJGo4moGd
 +C5g==
X-Gm-Message-State: AOJu0Yzhr+zhv93zEcx0+aQX4mn0wUKjyBxTaICN4Wl1ZtUMDOanJse7
 InK+IXsWCJ3AcWJCUKDCur5DmQNPi5KBXmFd4kiKTNQrmkUPHPYo53QMJ5XiVgY=
X-Google-Smtp-Source: AGHT+IE8I+Eo9RwcwMBcQ478giL0bJsjYQaZ7E+O1sXJtyfVCg3bIc32yO8QW6+TBwYJjV1QcNS3qw==
X-Received: by 2002:a05:6402:2786:b0:55a:466c:8e19 with SMTP id
 b6-20020a056402278600b0055a466c8e19mr1272882ede.16.1705922105764; 
 Mon, 22 Jan 2024 03:15:05 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66]) by smtp.gmail.com with ESMTPSA id
 h27-20020a056402095b00b0055c643f4f8asm179422edz.32.2024.01.22.03.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 03:15:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20240105-tab3-display-fixes-v2-1-904d1207bf6f@gmail.com>
References: <20240105-tab3-display-fixes-v2-0-904d1207bf6f@gmail.com>
 <20240105-tab3-display-fixes-v2-1-904d1207bf6f@gmail.com>
Subject: Re: (subset) [PATCH v2 1/2] ARM: dts: exynos4212-tab3: add
 samsung,invert-vclk flag to fimd
Message-Id: <170592210439.45273.227109126148019562.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 12:15:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 05 Jan 2024 07:53:01 +0100, Artur Weber wrote:
> After more investigation, I've found that it's not the panel driver
> config that needs to be modified to invert the data polarity, but
> the FIMD config.
> 
> Add the missing invert-vclk option that is required to get the display
> to work correctly.
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: exynos4212-tab3: add samsung,invert-vclk flag to fimd
      https://git.kernel.org/krzk/linux/c/eab4f56d3e75dad697acf8dc2c8be3c341d6c63e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


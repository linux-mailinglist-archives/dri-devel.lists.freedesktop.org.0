Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6B67B4C52
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 09:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4633E10E208;
	Mon,  2 Oct 2023 07:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E27B10E1A3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 07:11:49 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5041d6d8b10so25680582e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 00:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696230707; x=1696835507; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8b6I74ChX5IXifXdV7pS9ht3VdeHdLMbH0+LYgUaS1E=;
 b=lnHDdjeQZhBLwjE4kp3MhmbJvPcC36kd5wnioYOZg5m9G2l0Z7MPHhiZ0vOGelfOf3
 VwMp4qtQ4zyMGb/r7Vciy1h5FiVcyeb/sn51aEyS6pELcZEnr9Aip/KWXyhIqjyUeFev
 HL1GWFEdSiyWd3+aa4J+aFe/PYjcvqZPn576ekv+TfjsELt/hv6vVP8iuqcRY5E33U16
 enNXEDfCXZ6BCCkvpyQzCNv7UgFbloJrQWcxwtxRCAiSIEdFwf+fXC0sIUa2HtdjEBtD
 FZneHJKVs6WalnpI5IuV7Bp2I5T1gtPyXmwzagXHufyqMMkx6lyyt6fbncT4RYoh+CBH
 HjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696230707; x=1696835507;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8b6I74ChX5IXifXdV7pS9ht3VdeHdLMbH0+LYgUaS1E=;
 b=uS94KacceMO0kVZ5/c1EPoUzpO77C4pjaOIbUlUTfIN01o2SdfY/1H5mBcNknSMMFT
 r4d7F68QoFlrrmJbXhgpWKobt+pFcxQm1XcpbHoqA7grSEdFGHqv0re87wjrg9+c0NJJ
 Wd5QCDNEqX9e3hq7JoEZZo6x3R2VmT5hWoPZHbudrJ06ywIWUgrBj1C40N0v0PpaYmkv
 wVr5rhsXsXRX60am4hJ12vEqQudlH9iKUQxya4m+TXPCosE+n8g61bPHQxiq0t11V6Lb
 EmJVq18EbWNwYJo4ykL2zVQf1fuc+HiUTmSf+eHF9O9XsbYO5IIOkYSF8DR+vSZyKhTs
 BgDw==
X-Gm-Message-State: AOJu0YwPRzsnen81kzrXxFFtRRUTjEtezgYhpylvrEGif+E3cp/jrZVZ
 9NS0Gd7wGjwELJt6lpl84Upn8g==
X-Google-Smtp-Source: AGHT+IEYeQHOtTVqs/b3x1pEQIQklFTXhwp8Jgz4wdXC6OWOAm0JdlT8b+6fTwzpm5fomzbSGzqnRw==
X-Received: by 2002:a05:6512:1c6:b0:504:2dac:c017 with SMTP id
 f6-20020a05651201c600b005042dacc017mr7771083lfp.38.1696230707264; 
 Mon, 02 Oct 2023 00:11:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 25-20020a05600c025900b00405623e0186sm6601371wmj.26.2023.10.02.00.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 00:11:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Mark Brown <broonie@kernel.org>
In-Reply-To: <20230929-drm-adv7511-v1-1-b871b28ee594@kernel.org>
References: <20230929-drm-adv7511-v1-1-b871b28ee594@kernel.org>
Subject: Re: [PATCH] drm/bridge: adv7511: Convert to use maple tree
 register cache
Message-Id: <169623070644.3600226.16238713428149894711.b4-ty@linaro.org>
Date: Mon, 02 Oct 2023 09:11:46 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 29 Sep 2023 14:54:19 +0200, Mark Brown wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: adv7511: Convert to use maple tree register cache
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=86c3331c8089ac1cf231825f406c4bf8afd9f3a2

-- 
Neil


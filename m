Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B44D3B1A609
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399D410E596;
	Mon,  4 Aug 2025 15:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DWkNaxy+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D413710E596
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 15:33:02 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3b8d0f1fb49so2306763f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 08:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754321581; x=1754926381; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uGtT0dY3F6pCzUqfUZ/2BFy9sZFKOLTbo2dgZKMNO2I=;
 b=DWkNaxy+zcX2u5gfcnsinyA9H2AqWOICwsOMjDwuuE0qA4mzTqCDHTQSLgNO39Tz/J
 jF3AwBmHw8RipkqkZnzAaxUMVRJAXJbsiAN3oTY1Jj5KostnFy+NaJR8bY6UKG+A6JSa
 TBBQORhLi56YHEOWW3ZJm7Rgu3TqVXs63xjbjQhorLIM4mbk5XusxwEEMSfa0l96pWb7
 18G+ZEZCi6vOaXCx6Jl+fAT7HWdC243OovNjeUNR0zDybiIihh5OfN/64yGpuT10CtoW
 RXSmAmUN+Li85SxcvMsHMIV4FA4lwejf+zOg/OvxEE7XFWIgmKEJt3r2qWRWRjlhqEos
 IuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754321581; x=1754926381;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uGtT0dY3F6pCzUqfUZ/2BFy9sZFKOLTbo2dgZKMNO2I=;
 b=mC8ZvLaCH/cY8hAaxoeTWL/dayZ+40A93FcK5EAxqW3ye5WDCdcsOPI+gTS9HjG58D
 SH5Zy8keZW8sVKIwxV6GJpdtL0VO8msjiBB11Etm2mrEGK22QkLzPh/0nNfaR4OcKHqr
 Z6RZSBv2NwWxGthbk+r3IuZy7G4ngScHvA8oTw7E/uIySc43eg619BT/UpYkydR63KDy
 4fQYe3MfiFW42EnH9NFYuwyZxYvZMImUOO2alCedaLwLMcx9LTB5dfrrmGB2pBP1orYX
 vzFn6TGtaoqrUnUq5lsoZ4821Hsw1eFqPZnS50Er1Cj8XhwJs0PX0OanlsEEaRU9xTBr
 z9hg==
X-Gm-Message-State: AOJu0Yyt3eM4+M5Fq18hgG+2AMIcPYhAIfAZGLMK3QoRspc0k84Wgdsq
 GM6rWuQgYlB5irCN5zRA5+OTgUnr/XJFyHqkXqgbKbwJg4uhLxmY0wroXZWlLg9zTa0=
X-Gm-Gg: ASbGncvb2MlA6WAHS/WL+dZPv7ZdwDm+oc4rx53O41HnmoSge058hmT9qzM2ZtW4OiQ
 KSLGLX1XR3U7DBVEeC8rfXWGmwxdZ65xIMVbsuIUhHJYSikndwiFZ9+zWPZaL8JJIciIPgZEh7I
 tL420o7SxPVj3XLHtRqyBLyhPC84gLdDUi6dikY9BnJWOyMSyjpBzSgCrBa1S9Dh+tPW74IQJID
 wowm/BzE18oboQf6LlYUYD/KmnACtDKTNjwqDnPGmyxO+e9MUJLqUET/BtQqJ7T1YS74jdXpFUh
 0X4H8OLWQ6OCdJ/A1F+f7cxw3fdfLty2sahhjKy3T3vmlMUJMoDlKXFbr/ror9x3eYq75XZUs+C
 YwmW9DLiBdOAai4LhGe7Wo2popIUithzl4dGD6fS3TpQ=
X-Google-Smtp-Source: AGHT+IEw5RuP3v5fLuYYshx6cD3p6FVP/1Yl0UoCru4wIcfyrmaGFBKu5wV8Ia2PqQvV6nm6BoY+/w==
X-Received: by 2002:a5d:64e8:0:b0:3b7:93df:39d0 with SMTP id
 ffacd0b85a97d-3b8d9470d14mr7193215f8f.15.1754321581350; 
 Mon, 04 Aug 2025 08:33:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c47ca5fsm15664010f8f.63.2025.08.04.08.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 08:33:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 asrivats@redhat.com, Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 akhileshpatilvnit@gmail.com, skhan@linuxfoundation.org
In-Reply-To: <aIJagJ/RnhSCtb2t@bhairav-test.ee.iitb.ac.in>
References: <aIJagJ/RnhSCtb2t@bhairav-test.ee.iitb.ac.in>
Subject: Re: [PATCH] drm: panel: orisetech: improve error handling during probe
Message-Id: <175432157997.3671011.5814829967293718308.b4-ty@linaro.org>
Date: Mon, 04 Aug 2025 17:32:59 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Thu, 24 Jul 2025 21:38:32 +0530, Akhilesh Patil wrote:
> Use dev_err_probe() helper as directed by core driver model to handle
> driver probe error. Use standard helper defined at drivers/base/core.c
> to maintain code consistency.
> 
> Inspired by,
> commit a787e5400a1ce ("driver core: add device probe log helper")
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm: panel: orisetech: improve error handling during probe
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/640d512caa64b569e58a08b540d9c400e1aa8f94

-- 
Neil


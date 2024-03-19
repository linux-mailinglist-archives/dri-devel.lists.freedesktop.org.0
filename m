Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0C788010F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 16:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9B510EEA6;
	Tue, 19 Mar 2024 15:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DAj3IXll";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C1910EEA6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 15:49:14 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-414618e6820so10261245e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863353; x=1711468153; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0AgW5H1Xw0nh3sYvUagNT9t6fRWqtVWMPo465SRziyA=;
 b=DAj3IXllA7mjMrS8wYSjoDZawWAodGFB2lC48XnKUTOWCHcZFhKJT54dfBQvUdzaKc
 Rvu+jpbXamuHGp0F3wI2D6fPS8jNU69SnB15hHJwIilEbDDrNO0bAyxE1+i0da1y4DQF
 epVYacw8fydXrpkJFy0Ey2UpLZJ5HzNXU1v70Aax9GW0UWfTzf7NwwvvWUXUoQI3GVQs
 GsT7vCVrlz8zxwwkVagZf2YZZoFCRCE6MVA/0+RHjKLfncEeGsqt+jG0GzBTRgX0VwMW
 d73gOzr6Bs6f65/c+9We6XFbOJ64HesS4qLrxE42f1oYfqwrno9M2Bju2X+8URGN0hsR
 cbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863353; x=1711468153;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0AgW5H1Xw0nh3sYvUagNT9t6fRWqtVWMPo465SRziyA=;
 b=ROcohlkyMFNC1eX0XSvJf2QABQ2yvyhDHrf3ldmsy+qsIIR1ZbRao+W5jp0HZnXefd
 B8Lu0CrkjkJn1kYglS08dZvHChqzWqfW1z4mzJGBKsBcJRXWMySMsQHeAeWDFrfPeQti
 0ul0HqvsOO9BKmkah0LRGeDTMWvFDs3lMgx3tZZr/m03eEh1oDRydwXIlk0aydZPA855
 xAMALgBvEY3w2mKH8M856UKXvWFpQY9ZL/gKTmKdqYrTLHr5DP03XdB2wrw1wo1s6ICk
 tNIrvE5WRZi1ZOx78aMSyM9qTtCkYB0m10e35z1mSYrMmWSvPjZKPzmFoLfR4lemkwLL
 jmpg==
X-Gm-Message-State: AOJu0YwpbNHlshdEtZX1cUKX8wN+xDNMIgrzA/vSIAhGIFlfIT6rVNI4
 iaQjIPiNbZCWxtHh/Koo9tF0VMJOCiFle3uuMpiPhzYdLjNVU9gNX600UeH+mVM=
X-Google-Smtp-Source: AGHT+IFOdCTfd+Pd2eVNHBR1m5S2KhvNBQoo8IUrC/ZHPNCcspRu7v/RT270r4xqg/qiryuGg/qsrA==
X-Received: by 2002:a05:600c:4fc8:b0:414:6172:8366 with SMTP id
 o8-20020a05600c4fc800b0041461728366mr2543456wmq.15.1710863352688; 
 Tue, 19 Mar 2024 08:49:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c3b0900b00413ebaf0055sm18742915wms.7.2024.03.19.08.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 08:49:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
In-Reply-To: <20240318160601.2813-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240318160601.2813-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: bridge: thc63lvd1024: Print error message when DT
 parsing fails
Message-Id: <171086335198.3926836.8042127342768952812.b4-ty@linaro.org>
Date: Tue, 19 Mar 2024 16:49:11 +0100
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 18 Mar 2024 18:06:01 +0200, Laurent Pinchart wrote:
> Commit 00084f0c01bf ("drm: bridge: thc63lvd1024: Switch to use
> of_graph_get_remote_node()") simplified the thc63lvd1024 driver by
> replacing hand-rolled code with a helper function. While doing so, it
> created an error code path at probe time without any error message,
> potentially causing probe issues that get annoying to debug. Fix it by
> adding an error message.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm: bridge: thc63lvd1024: Print error message when DT parsing fails
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/974652d7a90be7ae3b24779794a65bfb90980044

-- 
Neil


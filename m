Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFC693F5EA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 14:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE3E10E3BD;
	Mon, 29 Jul 2024 12:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="EDkbKUfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E86510E3BD
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 12:54:05 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42816ca782dso14242775e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 05:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1722257643; x=1722862443;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d8CWPRtMQ6i+SW6jqovkol7RV6B7Kvi8g7hg+UsVQpk=;
 b=EDkbKUfHhdS9DHxI/tm97N6Ry0rcyIC8RdiV5uoYpycNSjbfIQZ0EOeDLZ0h98ExpX
 Cez6j11eFvK0SGq4OC7dJ58Q/xjW+OuvjRewBEM2ghz7mTH6Br5MRS+/9JghS1nAl6Nm
 SlT4iBw75V3N9NIZ55OrN2JjgLeNxF+RL8zZBEdXuJoytg0G3UoN94n7+1amhUZsJrIV
 Q/BTvVXnz4jexcD+wDHF6ZHTnXXyVWUqXuAeYPbIPzQ23xwUfVEs23UGeTYwXFmJOzzc
 RJCdlICBlwRGYm7dK/VNKSSgm3B9ip6QUruquWa03SFeW/gXbdPqKJ9DIk9QeKZPGv6e
 HbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722257643; x=1722862443;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d8CWPRtMQ6i+SW6jqovkol7RV6B7Kvi8g7hg+UsVQpk=;
 b=dGI/TKIcp8qOTaOXdAZCdJwzpEeEo1EO1xBs1ak0Q0TYLG2nUtJwFcR8KgIgZ9wTVQ
 mY44/iLZQCdRVzdEMXGRK6TfJOaj+ockVDWHJ3V+1wiDpPnvWdJGlyhMpYy0bJzcOoT+
 mtJPIoSCjxOuldcahyzElWGJ128pqAiFq/WcCjzKLFB7hsYSb54KTm4zB25BMGjgu/tI
 fOkNI8pBuJnGLqoXB1QxJIqXX3F4M4ER1bXivoK1XNHXvUMeB0ewLbFeCz3pVGkvTY/w
 +gceiJIqmBzZ1NGGUlPz8O+/uOCT/d+UeXbUQsHIakDCtr2+aDV4yDJARm/aA6e8ShAz
 ySRA==
X-Gm-Message-State: AOJu0YzAk9m+Dt0W3FYUxqEWi/HUgCRa5Ll3C5vBspf0UBd4hrIuewim
 jCRqwMDXTmQo97W9bqPASvuj9N/ACZ4yqrIMy9AxujWQLrZKUSCOGNL8EVGQ2w8=
X-Google-Smtp-Source: AGHT+IFAprFQeursk+pLM9WBhRQ6uq4d9IDvkkDE0E5tziAxefBSTePjFLPqqskNa+VnTiufDe0B7Q==
X-Received: by 2002:a05:600c:474f:b0:426:6696:9e50 with SMTP id
 5b1f17b1804b1-42811d8a81dmr56313735e9.14.1722257643238; 
 Mon, 29 Jul 2024 05:54:03 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428057a6283sm176878745e9.32.2024.07.29.05.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 05:54:02 -0700 (PDT)
Message-ID: <e137bbaa-65b8-4bf0-86ee-ab1d6efb8ede@freebox.fr>
Date: Mon, 29 Jul 2024 14:54:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Basic support for TI TDP158
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 27/06/2024 13:13, Marc Gonzalez wrote:

> Changes in v3:
> - Add 'select DRM_PANEL_BRIDGE' in driver Kconfig
> - Fix checkpatch errors
> - log errors using dev_err (so save dev pointer)
> - expand a few error messages
> - expand commit messages with info from the datasheet
> - mark regulators as required in the DT binding
> - Link to v2: https://lore.kernel.org/r/20240625-tdp158-v2-0-a3b344707fa7@freebox.fr

Series has been rebased on top of v6.11-rc1

Current changelog is:

Changes in v4:
- Add blurb about I2C vs pin strap mode in cover letter
- Add blurb about I2C vs pin strap mode in binding commit message
- Add blurb about I2C mode in driver commit message
- Add comment in binding explaining when reg is required
- Add comment in binding describing Operation Enable / Reset Pin
- Link to v3: https://lore.kernel.org/r/20240627-tdp158-v3-0-fb2fbc808346@freebox.fr


For reference, binding commit message blurb:

    Like the TFP410, the TDP158 can be set up in 2 different ways:
    1) hard-coding its configuration settings using pin-strapping resistors
    2) placing it on an I2C bus, and defer set-up until run-time
    
    The mode is selected via pin 8 = I2C_EN
    I2C_EN high = I2C Control Mode
    I2C_EN low  = Pin Strap Mode
    
    On our board, I2C_EN is pulled high.


driver commit message blurb:

    On our board, I2C_EN is pulled high.
    Thus, this code defines a module_i2c_driver.
    
    The default settings work fine for our use-case.
    So this basic driver doesn't need to tweak any I2C registers.


binding comments:

+# The reg property is required if and only if the device is connected
+# to an I2C bus. In pin strap mode, reg must not be specified.
+  reg:
+    description: I2C address of the device
+
+# Pin 36 = Operation Enable / Reset Pin
+# OE = L: Power Down Mode
+# OE = H: Normal Operation
+# Internal weak pullup: device resets on H to L transitions
+  enable-gpios:
+    description: GPIO controlling bridge enable


I plan to send a formal v4 in a few hours.

Regards


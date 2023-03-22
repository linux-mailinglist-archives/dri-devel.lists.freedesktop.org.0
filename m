Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D036C51B6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 18:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C3B10E9AC;
	Wed, 22 Mar 2023 17:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826F910E9AC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 17:03:16 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 u11-20020a05600c19cb00b003edcc414997so7083946wmq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 10:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679504595;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fF0kXha0iC7DXFpAivYe8iA4rI1+YTj1bu366LSCxxk=;
 b=CODHf0ARi+ZAQwKJquFfTZVE8GcbNBB35tiLrdZgRYIyaxVhmUezxMFGMCvTfztcTb
 zBY391pL+wcccrmfHqacIkJ0YwfRwFpDfuCK+Q9mDDiiYUqxSVdqaFsm4UhJtdgAcOk/
 F6LAVGKFmL2U0VXmZXkuJANw/xDh74CEr1oqlpBHvEkF7uwCOz8mHJqBtcndkweTZu84
 EWxQDoQICuRUaPaLZel4wmpg8X6v3kZxBzpnge4qiQbhvPObr36dnM6Ec00/y5F17gEs
 WA6uVF72nkfgiZpQBflwbEFO/Re4i7Fk8rbofwYctPmB9ebZDYXgHUX0vTBFV7d3NVPO
 81zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679504595;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fF0kXha0iC7DXFpAivYe8iA4rI1+YTj1bu366LSCxxk=;
 b=nelkZQkrk8QNgXxpvKpxdEFc1c6LlPrpn+P+ne04mKbUJDDH2CxhTUjt1CMKOrY8Yu
 hjYyeqiqvWEM/byrmAT/hFuTye/r2A22PY3YGNQQni0UD7FhAigeOsnXvWe1vALRQDKz
 1fekcMKDDXfCWPq9QkyRtKyIVfS2zgrcwfbHetJIrbXqAXfMbmPJ2dMLy4atY2jfYAT1
 0TOMDTfMr7zaNoCjo8fYLKIjBoXgLczt2hZhYWwyRjkqcseHi7d5TNqIXL58AI2Pjc2y
 w6iOQ2vOBEFYEirYiHUpIwhQ/AuRNcaXjZC6wSy9HKy/7IK7FTVVUkFxvvS3Bdg151v7
 Y76A==
X-Gm-Message-State: AO0yUKVmmy4c2AxoeGK+wCAqpzztAS+lAsrNN9p7ie34lhLcRlQuRP+L
 N7xwqvIzm+thtGBjs0ZsfsoXjw==
X-Google-Smtp-Source: AK7set+XVsENvidhTYRl8NHap3p+RLXPJj7q9BKTdTDgxFMbLPVmRCtz/DO/KEbqCzBtozbr/f27Rw==
X-Received: by 2002:a05:600c:2c48:b0:3eb:39e0:3530 with SMTP id
 r8-20020a05600c2c4800b003eb39e03530mr125002wmg.41.1679504595001; 
 Wed, 22 Mar 2023 10:03:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a7bc5c1000000b003db03725e86sm17553580wmk.8.2023.03.22.10.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 10:03:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
In-Reply-To: <20230306103533.4915-1-johan+linaro@kernel.org>
References: <20230306103533.4915-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] drm/meson: fix missing component unbind on bind errors
Message-Id: <167950459423.530086.3154658002025345243.b4-ty@linaro.org>
Date: Wed, 22 Mar 2023 18:03:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 06 Mar 2023 11:35:33 +0100, Johan Hovold wrote:
> Make sure to unbind all subcomponents when binding the aggregate device
> fails.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: fix missing component unbind on bind errors
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ba98413bf45edbf33672e2539e321b851b2cfbd1

-- 
Neil


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEA9663071
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 20:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FB510E471;
	Mon,  9 Jan 2023 19:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A5410E471
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 19:33:59 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id m7so9298706wrn.10
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 11:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9EGAARif97svm43WKQHpTah2AyhIqRbyKB8mnpK2KoM=;
 b=FN24xWhjGLoTMj4wniz93gpIal1LKDyeNvlCERxakutz4BhNniu2K5kQxqw6wquK0t
 G1cmo26HRw1BKyjaa/qfRWa06G1/1ZipE0RJTPXj+roz3L3mbTJKe3By8mD2VplCESEd
 NTssJ+cfKGxpNWZ8X3a1fbc4Heqo/V+L9w1fcNgKIgvmVkqNEsoEbS0cIkRjnXrhlX+B
 O+6n4QdtTkVuyaiTY2s3Ro3Po8Zadfgq3NXUv8CUFfxg9v0gPymTJteY+jKY9rRwtDky
 aJlzLzWH5o2xh1VIporHV7OSSwnPs3QYyi9K6E5MufrHSQ/SLgyzcqw9VWeTnzA0eARV
 c/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9EGAARif97svm43WKQHpTah2AyhIqRbyKB8mnpK2KoM=;
 b=FWRn6SZ5WnasivrjUUIKuCzFd2zLDaohlGsAexF/0R824K4ef0jlfYdKXW5EGW+ptX
 Zf3NWFapApFaeK6bn3uhVBkyVD9bqkQ6zU32S9NYIWG+2OIovHQ8R7iOqvoVjkVaciZ4
 GU+6uBwL9Te1oFyqTCOhouJyyAqOsbWgRH00nDCo7PgDJByBFpWArrjj3OwZbZoFZv/A
 ixY6SU/z6mpCxKI89f+XJv3zPGxfBETcTDIkABNzChyLHppvZjGLclzohsde5ttljlWd
 rwqibuwdlQb85EiSUIY6Z0/W0GDODqrFM6yX84wIqG+biyyOp3qM0qHnlLIUKr+65byS
 c88w==
X-Gm-Message-State: AFqh2kqILN6Z5Tf9AOwU/DXN57d7ofJOXoHe1vJdtGGXZWNf8cUYnnQx
 1jncTLRZmxkhJEXs54LtY5yXHQ==
X-Google-Smtp-Source: AMrXdXujuX4oRsEDqNPcClUhfWZ/stgeEBpG7Wkczu21BWmF8b0e0MO30sCiL8RFsHOkyhvZzZdqcw==
X-Received: by 2002:a5d:69d0:0:b0:2ba:5ed7:543d with SMTP id
 s16-20020a5d69d0000000b002ba5ed7543dmr10402348wrw.52.1673292838124; 
 Mon, 09 Jan 2023 11:33:58 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 v14-20020adff68e000000b002365730eae8sm9274282wrp.55.2023.01.09.11.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 11:33:57 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-vtdr6130-panel-v2-0-dd6200f47a76@linaro.org>
References: <20230103-topic-sm8550-upstream-vtdr6130-panel-v2-0-dd6200f47a76@linaro.org>
Subject: Re: [PATCH v2 0/2] drm/panel: add support for the Visionox VTDR6130
 AMOLED DSI panel
Message-Id: <167329283727.1538353.13855678312817983424.b4-ty@linaro.org>
Date: Mon, 09 Jan 2023 20:33:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.1
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 09 Jan 2023 09:49:29 +0100, Neil Armstrong wrote:
> Add support for the 1080x2400 Visionox VTDR6130 AMOLED DSI panel
> found on the Qualcomm SM8550 MTP board.
> 
> By default the the panel is configured to work with DSI compressed
> streams, but can work in uncompressed video mode since 1080x2400 in
> RGB888 fits in the 4 DSI lanes bandwidth.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] dt-bindings: display: panel: document the Visionox VTDR6130 AMOLED DSI Panel bindings
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ef85db911134d103a7f713eae6689dbb15c3f96a
[2/2] drm/panel: add visionox vtdr6130 DSI panel driver
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2349183d32d83a7635baa804934813bcad13fd62

-- 
Neil

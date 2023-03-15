Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7278F6BABD9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEEF10E977;
	Wed, 15 Mar 2023 09:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A4D10E977
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 09:13:51 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so1725065wms.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678871629;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1uTYqdvS7CTqX6IUu3AFWJKisW4+Wnz2lhp7ImHDpKA=;
 b=mKyM+6+HKdqL526yAvlvsBE+dJA4oHbWFu8jV3a/1gUpN0TCBWQbVL6y7qVMis9C7g
 aOZWppvVYdAOOFgLAgPp/K1/3SRUpZ+7z/VgCp5TDAKKNBG2/UQiEJBAAAqTRb65AJp9
 dYX7wvWzVTNsSqDvdMCwJ/7k9dYgmBhQF+AEe3a1tNaN8Kh+Iptmxrg3iZnOgCtDAX8X
 Fbqe3FpjzLs0xpXwIIGVPDAvZxwKhARWaVwizzpVj7UmmixMQFGKVyQre7cLf6AoTjEi
 JzeimVrMleuLbj8ugfIvDToFUxZtWXMApUQLiziW4/nhqWjexYPX+ATA8DkIccNQ0E9r
 S9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871629;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1uTYqdvS7CTqX6IUu3AFWJKisW4+Wnz2lhp7ImHDpKA=;
 b=5UvM+eVlOYVgrcyLhCuAkH0jamXBp8HPAssN8Y2OJtTDdhT2JyNaeEksNCraqSfdTw
 x18nSCTWLM9688GhMxVG+3rt9KC0SBc06zOiTY4WK6si1S/aTINY2pqqUNNzJQtp/nYs
 YSRU4UIozZf0B0ptPfe+h88w0lj2j0aS59QDKIG/4cWWuth9FszArjyvVqbr2DU3+3l+
 kFT2gg5ObnyLk8JYesq8ViN0gMwI1wOjreGO5jO7v3FSW+jv3+A8WH4mX+T868IM2njn
 TR5tSowB9OwqdI8oUEYfSjS0c+nDcoeJdfgYnutxKW73pIcO+HXLMXx2XqBsbnXruR0w
 rxFg==
X-Gm-Message-State: AO0yUKWp2Cn9svtiuuDwYvPwnmBJtZD/lszYkJQkjLY7deJPAvKUR1Qn
 GbaJJ0HtFpDZBSlLXITQSmjm2w==
X-Google-Smtp-Source: AK7set/Md5DRQey8UO3qNiwZdaJHsk4PoYK2Vc1uHAestzEkUcF5GDWcB8ctU6IvucKUgVX1Czt7pg==
X-Received: by 2002:a05:600c:4748:b0:3e7:f108:664c with SMTP id
 w8-20020a05600c474800b003e7f108664cmr16536728wmo.40.1678871629526; 
 Wed, 15 Mar 2023 02:13:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003ed23845666sm1136212wmq.45.2023.03.15.02.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 02:13:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: sam@ravnborg.org, daniel@ffwll.ch, 
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
In-Reply-To: <20230314090549.11418-1-zhouruihai@huaqin.corp-partner.google.com>
References: <20230314090549.11418-1-zhouruihai@huaqin.corp-partner.google.com>
Subject: Re: [PATCH 2/2] drm/panel: support for STARRY 2081101QFH032011-53G
 MIPI-DSI panel
Message-Id: <167887162888.2174720.11455500671990621678.b4-ty@linaro.org>
Date: Wed, 15 Mar 2023 10:13:48 +0100
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 14 Mar 2023 17:05:49 +0800, Ruihai Zhou wrote:
> The STARRY 2081101QFH032011-53G is a 10.1" WUXGA TFT LCD panel,
> which fits in nicely with the existing panel-boe-tv101wum-nl6
> driver. Hence, we add a new compatible with panel specific config.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

[2/2] drm/panel: support for STARRY 2081101QFH032011-53G MIPI-DSI panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6069b66cd9622c4b29817d4e19737e6f023b909a

-- 
Neil


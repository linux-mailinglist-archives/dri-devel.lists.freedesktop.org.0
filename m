Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DF770B8B6
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 11:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A1710E291;
	Mon, 22 May 2023 09:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B7010E291
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 09:21:15 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f607dc98cdso1849675e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 02:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684747274; x=1687339274;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1VacdKeZCjPhD/SpW9R0zd/0SapShlT3F3TXr88hz5s=;
 b=I+Y1NWovJ0NVRaQo+mdhuzI0Bel68VjKxnDspYW/p+A4HoEFpUEfwtxPUwAOXbVxv3
 H0k1+JNyPnQ7sT6sx7i1fqc6UyuA+P9gyeezY9upA270OzcXOHzDNqBzjgJNOTYX06DL
 aA8C0Bp+1oEpF6DGBlOzcwlBXFBvWlwCZPfZ2B6lVgomr7xaegGo3zeFG7dYAYEGzAbN
 XjNrY2DF7AQSJvzBumCk2/Olr0v/TMqCKX/NvVrP4TG7lnP6U8cWcY0JDIwXRznCKZsy
 94ATtcfv5G9fV9sXYxEyqaxgQxpKSZZ0ZCd3HGnbVnLSkHOn1Clg29VdHhqtKXwijDWC
 55dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684747274; x=1687339274;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1VacdKeZCjPhD/SpW9R0zd/0SapShlT3F3TXr88hz5s=;
 b=C6sofjTh8CbpQJ/JvsGIC6FvMOGOwoIKsu2RJvrEm0Hon1lvyrw9eq6KFjrb9k+8fa
 91uweW81ISJdaMPBBGDXdZyVIs4ZcKBegLvPFv0D3sriFO4Wgl3VLGVzqpMf+gtTmrXT
 nq2fQLQ2WMwnLCo2wkZdUJgiUcNGxjUX1IXfbEVbLwIVIlVMQwh3iAeQqncBLBqrVIJP
 r3+5zxPhpKmvdi/smInr4ODDUQewoU5vCZQWPifyZ9PaCskHyAtSgbZS6/ABO9190GtQ
 C8l9VeCccc3rULs1HF0nDFYlfSp1ysCsOEr4NSQuJw+M7P6SnURqZnngkddyvQUw6gWZ
 l5MQ==
X-Gm-Message-State: AC+VfDzjL9sVr/+kUfOfPDo+8agTpkPozcf1dKkeajNMmIpKeqfIbzCe
 EmE9w7ZUEQ2jqTwkhJGa5InMIw==
X-Google-Smtp-Source: ACHHUZ6xFwRV6290oiBu9zEMu/gtdsqpC8lxQZDtlQEeKNFmqY4beXf6hkZCcpWclRQaO8VLBAaeCA==
X-Received: by 2002:a1c:7405:0:b0:3f4:2148:e8e5 with SMTP id
 p5-20020a1c7405000000b003f42148e8e5mr6974812wmc.1.1684747274139; 
 Mon, 22 May 2023 02:21:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a5d58ea000000b002fe96f0b3acsm7073614wrd.63.2023.05.22.02.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 02:21:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: thierry.reding@gmail.com, Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20230519170354.29610-1-aweber.kernel@gmail.com>
References: <20230519170354.29610-1-aweber.kernel@gmail.com>
Subject: Re: [PATCH v5 0/3] Add Samsung S6D7AA0 panel controller driver
Message-Id: <168474727309.3803091.17592530014097097014.b4-ty@linaro.org>
Date: Mon, 22 May 2023 11:21:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nikita Travkin <nikita@trvn.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 19 May 2023 19:03:51 +0200, Artur Weber wrote:
> This patchset adds initial support for Samsung S6D7AA0-based panels.
> Currently, the following panels are supported:
> 
>  - S6D7AA0-LSL080AL02 (Samsung Galaxy Tab 3 8.0)
>  - S6D7AA0-LSL080AL03 (Samsung Galaxy Tab A 8.0 2015)
>  - S6D7AA0-LTL101AT01 (Samsung Galaxy Tab A 9.7 2015)
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/3] dt-bindings: display: panel: Add Samsung S6D7AA0 LCD panel controller
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=dda445651475b5a2a2941adcf1420fe3e9521bcd
[2/3] drm/panel: Add Samsung S6D7AA0 panel controller driver
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6810bb390282bb75801832f31d088236503fee89
[3/3] MAINTAINERS: Add entry for Samsung S6D7AA0 LCD panel controller driver
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0dd53308f74fcb16aa4e5cb90739b831c4a558de

-- 
Neil


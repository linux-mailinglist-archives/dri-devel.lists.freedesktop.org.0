Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A70F96CA095
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 11:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86D510E338;
	Mon, 27 Mar 2023 09:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088C210E338
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 09:55:20 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t4so2832513wra.7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 02:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679910918;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oIHP0oW2lg3pGPju/AqnuKxyIsHSSY/Z0nA6zc4eppc=;
 b=V9vLGJETFgVtCugeotELemVVEydjS4hd7yKWCs3ojx/qptfh/w3WJKNI3Wdl+ovCyJ
 ZB+EkW2XXQtJcjAI91g+HUq+J60M7yiQe9f8yiv7da0brdVBa4gdAoPtB1RPNNJd6kIw
 drMQ+IKURDAckY5Bo7rFc8vUq7joctFMR7l6Q8+yqPlzcBf2RULCva3334UqMJ8WXuVz
 50FkRDLvgtYKR0sceLvSlCa2OBaQyFc0W4NB3vAe4cOM5aprom42lcjmrxSnBNsXlygB
 bfFNfIQUEx8CMbOdjXBekWKeNOlujZDdKpm8apg0CBksa66nJJssg0h3/k/xtRS16qd+
 dv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679910918;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oIHP0oW2lg3pGPju/AqnuKxyIsHSSY/Z0nA6zc4eppc=;
 b=zXe8oOhFt5hU8nBfAyRQfpypCgdhWiensHRz7qcB4MkBwRpi9JHE2BKWKXYUP9ON5Y
 9dfEoT+fseOGNZzCW8BIshu0cdmpHifyWCL9H0Zob3omzLZhGrTdt4+gsYvZsjyJj7ai
 eiyeWiDfrD6lRqEMQNOy3/Ej8Iv9Ye0aHFl77LIDWCPYsKqrWlpeWKD44YA1mnWJpFPb
 KI60WRymANygM/YueF93glf3LSXAqZY9BXItV0VeE4felIknGDgXBJSz/bHVBbv2wwYy
 6Znri+FtuaEkiVjzTau2m9mdZNYSMd4XMXSVgBVQAXCX044A2Vh+gVe7vsgwTaCJufdE
 Xb4w==
X-Gm-Message-State: AAQBX9eYv3jTXrpgvHDJhACPKgH4N73nh3ykNSQe7dCpSvw7UGe+oflW
 FUG0RegP+cfOUBCXjs4aZ304pf317tMvvNz5d32bzA==
X-Google-Smtp-Source: AKy350bzh0+0wXuQx3da6/OOn6R3Fa9WVL4Lm3349lo5eHuojuEVC20BzSmdBT4O+sIdKypDH4aaUQ==
X-Received: by 2002:adf:fe03:0:b0:2d7:c9d1:65eb with SMTP id
 n3-20020adffe03000000b002d7c9d165ebmr7756235wrr.36.1679910918510; 
 Mon, 27 Mar 2023 02:55:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 b13-20020adff90d000000b002c54c92e125sm24684308wrr.46.2023.03.27.02.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 02:55:18 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>
In-Reply-To: <20230327044804.3657551-1-hsinyi@chromium.org>
References: <20230327044804.3657551-1-hsinyi@chromium.org>
Subject: Re: [PATCH] drm/bridge: it6505: Add range and selector_reg
Message-Id: <167991091749.404707.7868239484319275542.b4-ty@linaro.org>
Date: Mon, 27 Mar 2023 11:55:17 +0200
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
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 kenneth.hung@ite.corp-partner.google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 27 Mar 2023 12:48:05 +0800, Hsin-Yi Wang wrote:
> There are 2 banks on it6505, and when writing to different bank,
> REG_BANK_SEL needs to be set to the targeted bank. The current code set
> this additionally, which causes a race condition when a process is
> writing bank 0 registers while another process set the bank to 1. Set
> ranges in regmap config so the regmap API would handle the bank changes.
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: it6505: Add range and selector_reg
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1a2dbf0303e8793444a57a2eec0c6b29523657d9

-- 
Neil


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F647BD67A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 11:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAD410E248;
	Mon,  9 Oct 2023 09:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AAF10E248
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 09:12:52 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5046bf37daeso5558232e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696842770; x=1697447570; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yf7MiBunBZOqUWS6hOjNshMjhVlI4vDHakb12kS/gTs=;
 b=tsZqnhX74s3oe0kiLAfqI38SWC465YPgeYTXPdAFqhraFAXWx6YEI/H6/PtsLQ5//T
 lBFQHSDprsKHnJf7vph8DgMeKRdi69hYHSnNWPfrzZH26EXPm6FhCf6nV+amXrXlVNVr
 e9T6/+RqqU6t3ery257d4NiwrZCttZdFBbhZcjhsNuL6sSY5Yn7KmKgcPm+ySv83T6iw
 s/VE3LabEOMqbUuCAC9LLVebPPmHNVw6TF6Xogxp/NkbNWfDpnRcYX/l9yRlc6VBSA2Z
 Tjc74Dc0NGmDUfhnSNRxRJoBlnL6HSTdihRdMCVgmLoFL8QpE7Yfunidjvvvnh3M3kzo
 vF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696842770; x=1697447570;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yf7MiBunBZOqUWS6hOjNshMjhVlI4vDHakb12kS/gTs=;
 b=YV4XBSMdPADTB2hiMH18wbpp6jMNjZbBEZZoe0JA0b8ZsDg+rwSO5/HOommGXV4whK
 BchVGr+fHBT3VkugwgWKGCXQLy8fT5m+yGHFgD9dCaqBCs+jFNvhrxeMsLdQxkTUB2KT
 EJ6L3q6Z/ZCmMptB9T5zMCHcHheTHknMGFi1MZdrdw7MksAESOkIXjUCCjoPajf+O8Uw
 InrpY0tGsl3059AclV5QA8ZaSBiIbblPzacGfZDEj7YGqb+/uiDGwZlNYkL6qNvnJVDO
 qpGzkqT9vdTvJ8vyrtDDvNHogKBekbqPZbRLrdTgJVN2EejTzmMOi+nW4tGnpDEytjL8
 /WcA==
X-Gm-Message-State: AOJu0YxXMgfED2WqJlZsp0OfpBEAtBKLCx1tAOXkdA0szfu8i3xMeP44
 5cLWfSHBR/ZROJaW98WGdWeT0Q==
X-Google-Smtp-Source: AGHT+IGMyxnedEUG4uP7pO+e1T7JWEiTXPEDl31ulZdWNKEeL1Anaezb98mfuU0uGdkstRj7BEbFgg==
X-Received: by 2002:a05:6512:1391:b0:503:17fd:76bb with SMTP id
 fc17-20020a056512139100b0050317fd76bbmr15933979lfb.39.1696842770301; 
 Mon, 09 Oct 2023 02:12:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 1-20020a05600c230100b0040644e699a0sm12885533wmo.45.2023.10.09.02.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 02:12:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Johannes Zink <j.zink@pengutronix.de>
In-Reply-To: <20230523-simplepanel_support_nondefault_datamapping-v5-0-0d7928edafab@pengutronix.de>
References: <20230523-simplepanel_support_nondefault_datamapping-v5-0-0d7928edafab@pengutronix.de>
Subject: Re: [PATCH v5 0/3] Support non-default LVDS data mapping for
 simple panel
Message-Id: <169684276928.2063772.9134634213645233063.b4-ty@linaro.org>
Date: Mon, 09 Oct 2023 11:12:49 +0200
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dan Carpenter <error27@gmail.com>, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>, kernel@pengutronix.de,
 patchwork-jzi@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 29 Sep 2023 14:33:30 +0200, Johannes Zink wrote:
> Some LVDS panels, such as the innolux,g101ice-l01 support multiple LVDS
> data mapping modes, which can be configured by strapping a dataformat
> pin on the display to a specific voltage.
> 
> This can be particularly useful for using the jeida-18 format, which
> requires only 3 instead of 4 LVDS lanes.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/3] dt-bindings: display: move LVDS data-mapping definition to separate file
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5437d667a0cae87d34c321ce1819ea78011efdc1
[2/3] dt-bindings: display: simple: support non-default data-mapping
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=66b66c97f4074c38b1c53c49625ebdd9a33ba56d
[3/3] drm/panel-simple: allow LVDS format override
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1cd3ea3e4b124120dbdff3faf00a71c8fc6f6402

-- 
Neil


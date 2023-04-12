Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197F26DF730
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 15:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6595710E7E3;
	Wed, 12 Apr 2023 13:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F98510E7E3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 13:29:13 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 gw11-20020a05600c850b00b003f07d305b32so7290897wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 06:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681306151; x=1683898151;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFMQXzqic9JADR3uZcH2w2pLYBrlMwgqKANbtNBvuNQ=;
 b=KQWTqp+sMD6gnRpGq8joFWXdscoNOxnaGk0s6RAYKsxDwnJ3g3hjVyH0a+jH9/75it
 okDq8QsBYYXQIRkHUSA29l26VwaDSdN25ETX0ubow7qscj40ffabCFZvdh4SaJ1EX+m0
 XKYdqy+5xScW4m3qUO3R6sBKPVJonOiUIKuIIARW25ITmWfTyHlymZmcyukbK5jeMEcX
 Q26A5/RbhDrLAx0zsdwrV63JRohAyNWDMWPc+lAvrtaFF8AkoEEWrMwRyG49eGYnMnYb
 pYayiGfSs/uLmqmHHoDXa4yf531KVH87wQnZMp+D47HHi9td8HfjvXlbI2Y8szOTMnqo
 eAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681306151; x=1683898151;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rFMQXzqic9JADR3uZcH2w2pLYBrlMwgqKANbtNBvuNQ=;
 b=BlB1yf6c+NqtWl7StPN9thrC1bFalBCE2rTgVEy+m/ZVLMFiR84OUISb5okao3gRph
 f4NJkYNBghXXSwSLQKG7gyoYkAV86fmLorhxVkXPmPpVIaT4MiU4x8KrpcdKDbiQidGZ
 PV0805fQTCwCDk+Lb1EZ+WDIlm1LoGxGNq/CosoVPhIfME4QPszC8x1V2oZdak2Fhh92
 ZaM2iO9Hv7lxUT8/hwzhku5A49aI9ARz1S8QSWUqkhetgLTGY+mm/PXW5ybl81EuwnHH
 ewX2Uq2q4RBJKFo0Nnl3HT4NVNFKajSOtgyFf5rb5Vqr8NTzxSvwyMZnY+rak8iIP2V2
 WCwg==
X-Gm-Message-State: AAQBX9chjM8InLDNHRlQvg8t4FxfeCUOUEEGsBfGHT/jLod+W0CshSPy
 78dUmUKk8HvULl/qLXtq2fUOEg==
X-Google-Smtp-Source: AKy350a/A+h1URbKShg3o1vNKy6JcHbFlbF7MIEcwg5pHLdOIBOskauxh+QIAig75k5aoFgC43/Hfw==
X-Received: by 2002:a1c:770a:0:b0:3ee:289a:43a7 with SMTP id
 t10-20020a1c770a000000b003ee289a43a7mr14199701wmi.22.1681306151434; 
 Wed, 12 Apr 2023 06:29:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c19cf00b003ede3f5c81fsm2462924wmq.41.2023.04.12.06.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 06:29:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: DRI Development <dri-devel@lists.freedesktop.org>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>
In-Reply-To: <20230412080921.10171-1-daniel.vetter@ffwll.ch>
References: <20230412080921.10171-1-daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] MAINTAINERS: add drm_bridge for drm bridge maintainers
Message-Id: <168130615042.1549456.3446270515068509416.b4-ty@linaro.org>
Date: Wed, 12 Apr 2023 15:29:10 +0200
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
Cc: Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 12 Apr 2023 10:09:20 +0200, Daniel Vetter wrote:
> Otherwise core changes don't get noticed by the right people. I
> noticed this because a patch set from Jagan Teki seems to have fallen
> through the cracks.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> --
> Jagan, with this your bridge series should find the right people!
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] MAINTAINERS: add drm_bridge for drm bridge maintainers
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bfa8342c27c67e86a7b7022df06848709386e00d

-- 
Neil


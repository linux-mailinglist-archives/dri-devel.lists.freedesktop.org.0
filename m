Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8291966C19
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 00:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676FB10EA51;
	Fri, 30 Aug 2024 22:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N8aSjf68";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3578210E22A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 15:28:55 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-8278b0ba494so81642339f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725031734; x=1725636534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vah8cjhzLMApjKYb++BW5rUOqQaxePVKAdvzAWnfOaM=;
 b=N8aSjf68cazlERLJorCXaVZQsexGTg8B4heDKi6CDj8GPTd2gNHOfqKz2evGkqcNZ0
 CDWHECyrs72GILk6AcrViJE/vjLPTDqJSrjOUR35Th9BnN5zdT+QJYVChxwx6wQJaSnU
 9pL9/y7ItmTD1eCaM9Zz6rYAPiG2UH9RKqPzF/0VLSFLubs34hr5eJ8nE69A4W3LNo/j
 BroU/7NvyhTceFkYKzaJRHUDOthXBkRvJtFrLHOT9tUsneztLHdqwQr1tDV4TH97/TKG
 as1NtYkqOKYv3iFwaZhM4e6fnQcpFhSxCo+on+2lUDFZhtUbY//Rsiy8boCxDMmenwBc
 vRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725031734; x=1725636534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vah8cjhzLMApjKYb++BW5rUOqQaxePVKAdvzAWnfOaM=;
 b=GGDOgHoNr54784e77G3uddMxzEYsRDMCp+qzvKv0tUJ4/GxwTHkQep09zgHEOrw6nd
 lvLW6OEA5N1K72ugA+9j1Vs7bSyrSYCua8nURaR53sLB6XsGITnFUnmo0V9lWCjcqIjB
 uOgSeQ2FPAQE3WqIMJhwnmhat7T7h8m0bn/3iOvuqQ7qsr6zRUOeH4s9fUebxGuLNeMh
 93pWmFmZZcp4GfbN+5nlJNUz9FqNRR3mbyfMsLnMX38gVa606Fc193Aesn77bDZju/ZD
 eJK1cprWAVc4Ta7EGIl91a1ZuIJ1ctT/yFsR/693W41RyfeHXor12+hw/6Jpy9+4W+I5
 DoZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4sj2F0VXmbEk9EObwsf0LEI2EoitkQKCxlNJpz7A//DfNkthOkFwp11v99iXyjh+2U4Um7I4QYpA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylvOfHnmdnMXcXXy67IBGZO/aTEz1T0G8PuSdw/K11mqi6Xrb1
 kes7AYYh+erTE94jhkgxGxtsk1+zdftlikWTuEJvcQJYizZXHhn1
X-Google-Smtp-Source: AGHT+IEWeczUbduYfRfvJRK9CAJqdyCgkYF3aIwmFNEUPRqq3T8PgrzJvl3ssCccXEstFDKzoix0cA==
X-Received: by 2002:a05:6e02:1645:b0:39d:2c94:45e0 with SMTP id
 e9e14a558f8ab-39f379b2934mr77207365ab.26.1725031734314; 
 Fri, 30 Aug 2024 08:28:54 -0700 (PDT)
Received: from localhost.localdomain (174-20-195-90.mpls.qwest.net.
 [174.20.195.90]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39f3b040474sm8870925ab.59.2024.08.30.08.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 08:28:53 -0700 (PDT)
From: Shimrra Shai <shimrrashai@gmail.com>
To: shimrrashai@gmail.com
Cc: Laurent.pinchart@ideasonboard.com, aarnoud@me.com, airlied@gmail.com,
 algea.cao@rock-chips.com, andrzej.hajda@intel.com, andy.yan@rock-chips.com,
 conor+dt@kernel.org, cristian.ciocaltea@collabora.com, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, hjc@rock-chips.com, jernej.skrabec@gmail.com,
 jonas@kwiboo.se, krzk+dt@kernel.org, ldearquer@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 markyao0591@gmail.com, mripard@kernel.org, neil.armstrong@linaro.org,
 rfoss@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
 tzimmermann@suse.de
Subject: [PATCH v5? 4/6] dt-bindings: soc: rockchip: Document VO0/1 GRF
 compatible string changes
Date: Fri, 30 Aug 2024 10:28:40 -0500
Message-ID: <20240830152840.9066-1-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240830152132.8894-1-shimrrashai@gmail.com>
References: <20240830152132.8894-1-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 30 Aug 2024 22:08:56 +0000
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

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 78c6d5b64..8fd539125 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -31,7 +31,8 @@ properties:
               - rockchip,rk3588-pcie3-pipe-grf
               - rockchip,rk3588-usb-grf
               - rockchip,rk3588-usbdpphy-grf
-              - rockchip,rk3588-vo-grf
+              - rockchip,rk3588-vo0-grf
+              - rockchip,rk3588-vo1-grf
               - rockchip,rk3588-vop-grf
               - rockchip,rv1108-usbgrf
           - const: syscon
@@ -261,7 +262,8 @@ allOf:
         compatible:
           contains:
             enum:
-              - rockchip,rk3588-vo-grf
+              - rockchip,rk3588-vo0-grf
+              - rockchip,rk3588-vo1-grf

     then:
       required:

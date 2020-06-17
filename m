Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24B21FD911
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 00:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EE66E8E4;
	Wed, 17 Jun 2020 22:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2C16E8E4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 22:40:46 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id e9so1972147pgo.9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 15:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=yxhkUrEZGMGW6V4hv3gqzEshBUWawbyxpwsGYbTMAP4=;
 b=C3/TSekqJZZMRXXMevCccVhyXTBxs5StkCa3/Myij+08Kzcct5wdEG2BPhAKdXPOfv
 2WClkyxfVXT81fmioLGdEepEQcsW2bLVwfmqQUMvd7b5IWkow9dHGJs6bLcVtZVih5fc
 rNQdrLvysaoDWBhGyFA04ir9S1TuRmEIjHOnLlO7DA90LVaIf85LgLAAHAvENvOmjddy
 KZkzvb9C6Lxwmoj2fdVAW5JDELlZWxb1AnaS6nGlzHb7xrkX1pV8blDUKgNq+hVrWd9W
 ftuh3XjgDhvwf9nCH1imdw0Brn79AG/VerLFG89gmzHmvPDIaokCodch8Uq7SgHlxEQi
 GvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yxhkUrEZGMGW6V4hv3gqzEshBUWawbyxpwsGYbTMAP4=;
 b=Hyrlni5PZ73QZOIrwwI9fyJAVjixhM4mSN4yVhdGVVayuM8mLCYl/topmon11lYTRH
 Sb8gzDaHLNML/TpMxt75HEWkvyoWMHqo2uSzBCS1vcc/vX5adQEWEFXUbJKV1LtKQfYV
 A8XG3vy6PNLMNxy/1m4eox3M1QUo0fZ2SbeuSADjiaKa4mqEVpmwO1WwS6oq6RHM718s
 Z6NqWX8R8COthhRfXn6wfZ6YLotvNTrEZ8Li6LlgJAa3wEOaAjqSg0Upl3cdevOrtg/t
 rU0Z8R8rEgjjbFTJ+kTX4WyQBjw/NuF6sCYlf+ra2JTjkw1+G6c4qy+a2kewnSY8zA+1
 Okog==
X-Gm-Message-State: AOAM533BDREJ4gQU4BaTeRnC9liDdPEluQtbVUX6L4ahRkEdMk6rlJuQ
 xW2omYMvCi0CmsTRyCTOn58=
X-Google-Smtp-Source: ABdhPJxrIQeRLx2Cjy19QaB82zGd8G1E+KIumafFZaHrrE9sYy8tgFDygV/AkvTMIJRptlcBVFaf5Q==
X-Received: by 2002:a62:9255:: with SMTP id o82mr902817pfd.218.1592433645740; 
 Wed, 17 Jun 2020 15:40:45 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net.
 [73.202.231.77])
 by smtp.googlemail.com with ESMTPSA id x20sm486431pjr.44.2020.06.17.15.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:40:45 -0700 (PDT)
From: Steve Longerbeam <slongerbeam@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 1/3] gpu: ipu-v3: Restore RGB32, BGR32
Date: Wed, 17 Jun 2020 15:40:36 -0700
Message-Id: <20200617224038.17889-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: dri-devel@lists.freedesktop.org, Steve Longerbeam <slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGB32 and BGR32 formats were inadvertently removed from the switch
statement in ipu_pixelformat_to_colorspace(). Restore them.

Fixes: a59957172b0c ("gpu: ipu-v3: enable remaining 32-bit RGB V4L2 pixel formats")
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/gpu/ipu-v3/ipu-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index ee2a025e54cf..b3dae9ec1a38 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -124,6 +124,8 @@ enum ipu_color_space ipu_pixelformat_to_colorspace(u32 pixelformat)
 	case V4L2_PIX_FMT_RGBX32:
 	case V4L2_PIX_FMT_ARGB32:
 	case V4L2_PIX_FMT_XRGB32:
+	case V4L2_PIX_FMT_RGB32:
+	case V4L2_PIX_FMT_BGR32:
 		return IPUV3_COLORSPACE_RGB;
 	default:
 		return IPUV3_COLORSPACE_UNKNOWN;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

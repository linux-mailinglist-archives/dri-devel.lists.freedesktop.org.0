Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBQgMS8QqGk8ngAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 11:57:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547D91FE9E3
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 11:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E581510E9AB;
	Wed,  4 Mar 2026 10:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mE4/YTZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E718C10E98E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 09:39:09 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-c738585c636so11195a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 01:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772617149; x=1773221949; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rN93ANA+HWtDdddG3XEUggwOUXjfX92/pIpoIVfilZ8=;
 b=mE4/YTZEQ5mLFJFT7Qda5UZOrFvAkiC3UL/8WIQwJFO8dVO7SGlHNE2ucJ0z00Z6bQ
 88rpNnditZoUFj6SAN40P1QEw1So6agLmw2k4SqhF1bhaT9JIrdc7fS2E0rVAC+m7lVb
 oJFd5wtlnCOCiXVXCrJgGclLYPx8Ncs6EndKL6xLGHlSIEioG3i0OL6AsvF2eqxNiHgX
 QCtJd3TkE/9DdcvR7jjBJbrICwNWdnupV5uV2HsPkGUM8rmAF//o+refKKmETTTdUNdO
 hXC4WFWeuvLHNUIv5/jGBsA5T8GF0E2zyKVBIGdMy9NwRrCrvno5M6k1AtNC2Doi0RQM
 SQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772617149; x=1773221949;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rN93ANA+HWtDdddG3XEUggwOUXjfX92/pIpoIVfilZ8=;
 b=N0wT+Hez86KDrc0DwZ9dRba1YPOp+UFO2ljMYvNiDLFA8mwYMTondeBOz8qFkNQq8B
 p5fWgf6/qWi7V1hh3xnwyD86KvnerBaHbtLYKx+I62BR1VQbr/hteL1pgw6uni0367oD
 hER/ptiOaQX977PLWaY7HBCn1ewlQcEc4t7IEFEKeT01MFhDZQ+mJoVYNSIawP/hAtvI
 ivDpF9xCepaGUY5522FD11Te5Adh/o0UWm2GfUCxsTaXGWAihLl5Ns3C74jcsD3cbBx+
 JnZYQ5vkU1qBVS1dnoNdKwihvPa3nZStFm7oj8u+qQOHLU2xWMRXd9B36PfM1EmtWNiQ
 JM2Q==
X-Gm-Message-State: AOJu0YyaWpFFGzOsCksHu83Z6wPdI66CBc96HkQ3fLprr5n7qFO2qjzB
 4iI9MOXYcRUj/zFjkbG2k3dDiCyqac2KU2D4t4PvzFqqTKuZNWe12dw5
X-Gm-Gg: ATEYQzz8UdThsdjReMgkAGWclixioAimofq8F08/tvkjnBCBBhePmLARx8rE9Ol58QP
 kZNdBuSS6wXHU9uJadYVYeJofOQ7colJ3heQLEqypI4DwrEvcrLMvZNErFfKaSjdMuYtEuD7TY/
 KSJWs2jPQZAniYANQERAMuTyJO/nOXlxGvLI/Lnf0uJO4Km0oxF/XbpDZZApE7Pw3aJvPwJIk7i
 mflIRFsBUDL3Mc7bgF0MHoliE57jRLM+qbhMlJ6qXdvVow+LMERQo3PvvwRd9eEJWcF6rDR+Iut
 e23jIKWMAVtxBXAz2D9BUN9rXqFHaDB7GMLTta/OExN2Cf0mNuw8vtoILn1PEKX00FN16md6jJq
 qE4njQIPeE9ezMscXI68bNMRG/5Ba0SnP5zxScaLCEMDPw8CWy4likMVzscELhd5cwPfjmpZAsh
 icu7L398kZ3LmMRP2MHxw=
X-Received: by 2002:a05:6a20:12d1:b0:341:730a:ef54 with SMTP id
 adf61e73a8af0-3982dec6183mr1099807637.1.1772617149371; 
 Wed, 04 Mar 2026 01:39:09 -0800 (PST)
Received: from marchy ([180.75.247.187]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8273a081a14sm17142736b3a.64.2026.03.04.01.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 01:39:08 -0800 (PST)
Date: Wed, 4 Mar 2026 17:39:05 +0800
From: Adam Azuddin <azuddinadam@gmail.com>
To: andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: Update RA8875 Kconfig help description
Message-ID: <aaf9uQOBzCwQuff4@marchy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 04 Mar 2026 10:57:48 +0000
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
X-Rspamd-Queue-Id: 547D91FE9E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[azuddinadam@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azuddinadam@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The current description is too brief. Update the description to
include the manufacturer (RAiO) and the supported resolution
(up to 800x480 pixels) to help users identify the correct driver.

Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
---
 drivers/staging/fbtft/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
index 578412a2f379..92943564cb91 100644
--- a/drivers/staging/fbtft/Kconfig
+++ b/drivers/staging/fbtft/Kconfig
@@ -86,7 +86,11 @@ config FB_TFT_PCD8544
 config FB_TFT_RA8875
 	tristate "FB driver for the RA8875 LCD Controller"
 	help
-	  Generic Framebuffer support for RA8875
+	  This enables generic framebuffer support for the RAiO RA8875
+	  display controller. The controller is intended for medium size text/graphic
+	  mixed displays with a resolution of up to 800x480 pixels.
+
+	  Say Y if you have such a display that utilizes this controller.
 
 config FB_TFT_S6D02A1
 	tristate "FB driver for the S6D02A1 LCD Controller"
-- 
2.53.0


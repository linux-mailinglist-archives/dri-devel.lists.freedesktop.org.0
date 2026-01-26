Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDkeHfF0eGnEpwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:18:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2813391008
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E4610E4D8;
	Tue, 27 Jan 2026 08:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XIUmmtt3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430D710E3D4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:59:16 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-352e2c59264so2992106a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 00:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769417956; x=1770022756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oQ9aFobDUemcPRrLlp/PuTWIeXOZx5LQW0AdEMjMZ8c=;
 b=XIUmmtt3JNkGO2YXLEg8bUEPHW2OJVbiEQXiZgNBYbqX1htWXdFV2zhqchP3CguPio
 SDCxin2/PXlXwtDaOi2SrUuQNam13xfI+0jzXKWftTC/aZXXvEclBUotCrxxD+O938ve
 WwHo1//W25vEPgR2IbEvyyHTyDbA9YZEPmBdD01b8IUAwfdKh8TblaITJVmtD7mtcfHo
 zNDgHZNfiS7P16ZT2Q2fbCiYIVOmMnIZz2xdgEj/pt/43ONRnAd0uk8Ik9hqWlgv9OX7
 Ei1GhqtQ9vp1gM0wOV0wZDJQp5cGBrGK1mwP21BpPpVvmwBVTNOIXqsRiim/QoUFM/Qa
 nE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769417956; x=1770022756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQ9aFobDUemcPRrLlp/PuTWIeXOZx5LQW0AdEMjMZ8c=;
 b=jfU9x6TJ0JXmewcCJYNnx2PHNug/n/kCPod6R0fkgyiJrolNWq72O3GsuQbniizOsP
 e2Dj2xw65sYRoJevo1kd2E/ouwBCP43WoHqxSWyZb4EIAzYBWx1RZhBgo44ga7e6n9Xv
 rHp8iFeGKPCpds0XlKi1hnEYO2EWmLNVdzkNElB+3oPnb9K3da5XrV9vppJnYMj3wk/L
 vbg0BO9fl6EG7fS4W9R8cmcXCAg66ZOUnZimGI3OSjD3jjx2JmdBNC9AWb3X6dZ02shQ
 onUkDI4S4OqBalMcDKuYIDWMXhGSNIT56gBXdIVZyL7RLnwSdqpgWSOHCYqEo1Avix5B
 Q2Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtaSp/iHGjqpHwOFwBgjBy/sl5xoQ5nnMnP8hP1Wp5Uie5I599X1W3LSfYFTpmMYu2zPS/3hcjoZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzR0F8Z72Dv3n1Ini04999/+I/t4PiV/Jo0TVRiswmARyHmeS90
 l3uhq/1K851Rak7ZIVpP5T77czDdsLn4r1R7vRv1nZIe+cQiSPk9TN0m
X-Gm-Gg: AZuq6aLbo7x2qLYiJKTWbr2TShbHQrAooHq+nCiDrieBgp3eU4kd67Y6G9jhI38hq2W
 iyXLS2V/eNLmTio7c/XtT/BCRqooxDdVnZzpZ/kvNTXUPAQq3+LDWau8D7ZT92fFKF9VyUSOvP0
 CfaPBIUcrc2wGCYH4S6bDemJ0Sfl2tnwp4HHQRc9oLqSqpOhcIkCOJsf7INC8goH+Kl8DJBCnq1
 K5nXit2PrJrZiP28qkat5jsGxhL81YyCvQcRxzOMDez/jRe/tgubCAE4ZXDsQtyx2K+uIwej+e9
 yF/80h45ce3H7WPQHzOpzPxOxgmmqyvgvqaizb+kN+rdfLOj3A1YQRo81QtZ6mG6xnBi7bdeUWy
 iSl5s+9b9AMitXJ6lf8AYI506jvOE0II09n4vKePgP8stAJcJQVSbq8v9Z50zxH5QsvzzXndWNk
 kL1yo3xTN6NgPwm+zylRMmbFsjupDOXS245mDy8DehSR9+U1C3vjfAL+VKNWOmHFhy64F2lRCn
X-Received: by 2002:a17:90b:4a11:b0:349:2154:eef4 with SMTP id
 98e67ed59e1d1-353c40b84dfmr2930111a91.5.1769417955671; 
 Mon, 26 Jan 2026 00:59:15 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3536dc3e0ecsm8251798a91.10.2026.01.26.00.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 00:59:15 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 a0987203069@gmail.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm: nuvoton: Add MA35D1 display controller support
Date: Mon, 26 Jan 2026 16:57:24 +0800
Message-ID: <20260126085727.2568958-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 27 Jan 2026 08:18:47 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:a0987203069@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nuvoton.com,gmail.com,lists.infradead.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2813391008
X-Rspamd-Action: no action

Hi all,

This series adds DRM support for the Display Control Unit (DCU)
found in Nuvoton MA35D1 SoCs.

The DCU is a DPI-based display controller intended to be used with
external panels or bridges. The driver integrates with the DRM
bridge framework and supports atomic modesetting.

The series consists of three patches:

Add Device Tree binding documentation for the MA35D1 DCU

Enable the display controller in the MA35D1 SoC dtsi and SOM dts

Add the DRM driver for the MA35D1 display controller

This has been tested using modetest with a DPI panel and verified
to expose modes and perform atomic modesetting correctly.

Best regards,
Joey Lu

Joey Lu (3):
  dt-bindings: display: nuvoton: add MA35D1 DCU binding
  arm64: dts: nuvoton: ma35d1: add display controller support
  drm/nuvoton: add MA35D1 display controller driver

 .../bindings/display/nuvoton,ma35d1-dcu.yaml  |  74 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  42 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  26 +
 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/nuvoton/Kconfig               |  21 +
 drivers/gpu/drm/nuvoton/Makefile              |   7 +
 drivers/gpu/drm/nuvoton/ma35_crtc.c           | 445 +++++++++
 drivers/gpu/drm/nuvoton/ma35_crtc.h           |  78 ++
 drivers/gpu/drm/nuvoton/ma35_drm.c            | 389 ++++++++
 drivers/gpu/drm/nuvoton/ma35_drm.h            |  48 +
 drivers/gpu/drm/nuvoton/ma35_interface.c      | 192 ++++
 drivers/gpu/drm/nuvoton/ma35_interface.h      |  30 +
 drivers/gpu/drm/nuvoton/ma35_plane.c          | 904 ++++++++++++++++++
 drivers/gpu/drm/nuvoton/ma35_plane.h          | 226 +++++
 drivers/gpu/drm/nuvoton/ma35_regs.h           |  88 ++
 16 files changed, 2572 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
 create mode 100644 drivers/gpu/drm/nuvoton/Kconfig
 create mode 100644 drivers/gpu/drm/nuvoton/Makefile
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_crtc.c
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_crtc.h
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_drm.c
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_drm.h
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_interface.c
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_interface.h
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_plane.c
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_plane.h
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_regs.h

-- 
2.43.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADIOH+AOoWknqAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 04:26:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46361B23AF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 04:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2602610E0E6;
	Fri, 27 Feb 2026 03:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NAso4Jff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1451F10E0E6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 03:26:20 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-354a18c48b5so1376848a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 19:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772162779; x=1772767579; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lm2AcOtnsuA4yjZovdWg5px8aIMhZ3rKhw+QF/SygYI=;
 b=NAso4JffptmegBlwHAUkkehj+PFMyMkWaMBQVT3RMfFMUJ9VIY1urwABswOgwwxMhB
 df4p9x/UMz1nxw9pSVbzNs8GmJzjqDtm2xB/SZMpVZolF2326eikodto1aiG9aCar8+L
 bl6LJQ0iA0BPz0ncROoMgpg9e9m4JrgWBQT5YScN0t6Qf+DzI9TU5jeEfsC9ePXAY4yN
 tJUC6fMIgyfIufB5Ke3GG53cTec6rHzeTJWIbUhTfbRXe/Q0/963Ydt0sS0lKW9+x4Rj
 kGOEsWrA29iNAGKFT80jf/ARJhPK5dPbKs1m8Ag4v3R6PCcHnwvLloFYW2Howg7D27xj
 f/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772162779; x=1772767579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lm2AcOtnsuA4yjZovdWg5px8aIMhZ3rKhw+QF/SygYI=;
 b=IwZ9wKryvtd7sjLyM9iopHPhMcFK2tz17G3oj9kOZtD33zzcPqybM04WR6h7l57b9r
 s9GBJ1fykNpqmvQ7DxRCxBFWMk6bA47dROh949ypBhdPdE7ByyIH1nEVjgh7rPo6TOal
 lCZ0p/V6c1iR6dnRTimf1hOqOgV6eEzu3YpfWoTiMyZzFhr8mgyVS2KIE+m18U2E4Ib6
 xs80Amwd87Ip3Tjer3vrzeLviyuTFRETbQ6Fh7qkM9EyRSM6+KYfD+2lwKEgfuX0RsvS
 KT9BYTqIpWA/oXYZehfIqKs2H42yyxs7Wv7RHFvsjeuo/wEdu0NdS5LbAhFcW4QTSyV1
 7SYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSQ4obW3inJFFP/oiy94oaBDZ318dj7MlRrH+eKPaYBV4/bq0IyBTIb0s62cLz0Zu2C1GxRIB/eVg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5AsqWTB4LxLbNR2NrAg+CJKkDuoBCAndLZVC7LHk6nMVLRpp9
 JyZviYir0+A4u1pRZcnXBkYj0+ukC7TFakmoZxjAbK7b5eCb9a79F56E
X-Gm-Gg: ATEYQzzc3TZ1OQOXBEf2sGVdOz4+23Eu6+N/bQlWikXTcliXgGDMZ79uK6KVlOEOmSD
 OcBcDRHjoYmgDGdJG0TXbvpB9BrZFC//n4G0uRSD4ZoyxToDWGWFPnlOoZtIlFNpicQmDP1T/m1
 Um7xKBbgVCgDEQbaKR+Q9FwKdqNEFzNs9Sqy/Iig+r7ljzbRaSomqUr1//9Ep1MNqL1Lirrr2tt
 UZGWx5Oo+cswB+p7IC/Aw/ChO3UZ0DxrP24MCBY0uIAFfAZCpeyBj7vnjFEup0jDHjVa/mvSBoC
 NSbbJs/RHlp+rRXCTl7IxDhU322K5Z2S82KR0sjPD7ee2w6wQkG4j9dvCYGSnJKFrU/fLSVbCW+
 jjpqQBYb9cLRtae/C+FJ567aSHTdmN4KxrEcHnR7GS9OF4zQlwiLZIsX0AHm+YRPoKi8lVRoplb
 pAawMCEaWnr7EhofiACwXO5gkBlMOjDjgDqcQMAikJyh2VsN+Vzw==
X-Received: by 2002:a17:90b:1d4e:b0:354:999f:1b27 with SMTP id
 98e67ed59e1d1-35965ce1427mr1089567a91.31.1772162779536; 
 Thu, 26 Feb 2026 19:26:19 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35912fbc363sm4501887a91.2.2026.02.26.19.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 19:26:19 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.12.y 0/3] drm/exynos: vidi: fix various memory corruption
 bugs
Date: Fri, 27 Feb 2026 12:26:12 +0900
Message-Id: <20260227032615.108139-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:gregkh@linuxfoundation.org,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aha310510@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,samsung.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: C46361B23AF
X-Rspamd-Action: no action

This backport patch is for 6.12.y only and fixes a bug in the
Exynos VIDI driver.

https://lore.kernel.org/all/20260119082553.195181-1-aha310510@gmail.com/

Jeongjun Park (3):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer
  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 64 insertions(+), 11 deletions(-)

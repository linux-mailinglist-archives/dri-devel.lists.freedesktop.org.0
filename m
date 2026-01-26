Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFZlFgHTd2mFlwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:48:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D11878D43C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1490610E135;
	Mon, 26 Jan 2026 20:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EyRuREVb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617E810E498
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 20:47:58 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47edffe5540so56267635e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 12:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769460477; x=1770065277; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pLh/0068cEe1jqjjDyTpmEQKYSn3p5Mvjg19MdpSAs0=;
 b=EyRuREVbsl2J4BccLpl7FpNWZVhejTh9Mu8fP7Z+UmIEOfYEyftgN6KD9ojSQfWx6r
 BaZRbLSJJkKNsFZWCfn2WseQLgPHLdzolTKuWv5xPbb9Lk9CQrU5/Fd16YZKUXVK2z+p
 1/SgFsfdpKwsvzXYYeLgA4AcVvUYNMXsGmAW1FFBqor1RFNTui40JKgctV88tBaP/6s7
 v1Edp8taBg+PTaVrk/NZ8A93u4n78Sbuq9+ETHcOx7iPWsVuanPCdRHMcWfMCRt/T2Pw
 dqLNuukrVmuDx1PBhyj1Dkr+ZTdRJGgc5/zdz5hwmaLT/pVmm2Um/12PT9GTNqJ6LTun
 uUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769460477; x=1770065277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pLh/0068cEe1jqjjDyTpmEQKYSn3p5Mvjg19MdpSAs0=;
 b=QeqmA9w7SaWbrY7x3qD3XC81qx1UD8GGl5Ul2f8qcVYxdCq9qSbllGod8ViSp8UXUs
 TuujHw7dSQlEnDwka+sIxfFcaEhfUpJEJFBIBW3qADDUuyZoRSxBvhD3OZjbdavrXzJE
 /fF4Te4QT6JFR7f/SNBmgqSoDxbVoN+r6FePt18/4Dkj7t4sSI/v2v0RjXFYra1koaB2
 kkeFLWjy3kapbwdEUWbCmAQtF5DNupClFYtDmg7rHWD+EorzoS+kg+1MT6ZzqPylJl40
 nr8o8jpF/ecFQaIwHblW9VMaLActS2MfIb9WvRSbUjPW93xxSlrWgqhQ6Vrx0bILdyEd
 o6oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIR1N6YmSuv3qmnZQnYfinFh4/mip4XGFAR5MeilTO6nogxT36MxVdvbLsuo3muyk2n+UJCJNBgYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtfiH5ehSDVnqPTCT9GjG9KzqdF3pVev4Q6O+/BoCkMcPsodi3
 qQedCFfB6IJ6bOngSaty09lSI+jawQIuas2Y1/NwM/38G25/lUSa8WrQ
X-Gm-Gg: AZuq6aI5K94mDgl5cjV3voyKyQU/7VXAuA3JGWT2LIx7XC9padsDCTH9cKaxQ1HXeh0
 OZ68qt5zmmpOepz9GA/IqnHAy70xW6CO9r6SwTG5Qsonx6Mc/3gubyIYPprEG3y8ngGRAcNI0uN
 8OTy9thUKGsVsvgSST8ODCIu793QwNlxWfWkm3nrA6g+a6XjU8y6qr7w7gtHuRz1EY5dfaRKhJT
 WidrHpaZowWj7ueuVChAeO+YA4LIMu9UV+zALl6GOc6iWn/TKjFOQVccloylp4m+PBXJi2lGVmN
 xv6K4solELme0A0YjCeE/sLuiKTtC77yehCOiedeHlqz/TloYWz/tSODH/B5u1PPlpzSz7JbSp4
 5hGa6dPYnzvBzoM7o496tbkwYm+oZfwK47K9lAzy9xmB97dCpCCMGbLuLZg3IRw27mQJ9G5jEXt
 jWS+oF4EaLPw/imxNdwjKD9nkxiW9sj2tNsN94RQ==
X-Received: by 2002:a05:600c:314f:b0:480:3b4e:41ba with SMTP id
 5b1f17b1804b1-4805cf669b2mr78025315e9.18.1769460476713; 
 Mon, 26 Jan 2026 12:47:56 -0800 (PST)
Received: from ionutnechita-arz2022.local
 ([2a02:2f0e:c30b:500:c472:222f:bc60:d893])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c42895sm13275975e9.14.2026.01.26.12.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 12:47:56 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: superm1@kernel.org
Cc: alexander.deucher@amd.com, alexdeucher@gmail.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, ionut_n2001@yahoo.com,
 linux-kernel@vger.kernel.org, sunlightlinux@gmail.com
Subject: Re: [PATCH 1/1] drm/amdgpu: Fix TLB flush failures after hibernation
 resume
Date: Mon, 26 Jan 2026 22:46:04 +0200
Message-ID: <20260126204603.18124-2-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <ad3e0556-385b-471e-bb1c-43bd043ecf47@kernel.org>
References: <ad3e0556-385b-471e-bb1c-43bd043ecf47@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,lists.freedesktop.org,yahoo.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:superm1@kernel.org,m:alexander.deucher@amd.com,m:alexdeucher@gmail.com,m:amd-gfx@lists.freedesktop.org,m:christian.koenig@amd.com,m:ionut_n2001@yahoo.com,m:linux-kernel@vger.kernel.org,m:sunlightlinux@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sunlightlinux@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sunlightlinux@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D11878D43C
X-Rspamd-Action: no action

Hi Mario,

Thanks for the additional context about /sys/power/image_size and the
GitLab issue reference.

My platform configuration appears to be well set up for hibernation:

  - 30 GB RAM / 30 GB swap available
  - /sys/power/image_size: ~12 GB (13033648128 bytes)
  - Not using secure boot
  - Swap partition is adequately sized for VRAM eviction

Based on the GitLab discussion you referenced, my image_size should be
sufficient. So the known hibernation limitations shouldn't be blocking
factors on my system - the TLB flush failure appears to be the main
remaining issue.

I'll capture stack traces as Alex requested and follow up with the
debugging information in the next few days.

Thanks,
Ionut

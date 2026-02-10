Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEZ1NMeNimmwLwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 02:45:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 879491160AB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 02:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4397610E4A2;
	Tue, 10 Feb 2026 01:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oox3OpFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EEF10E49F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 01:45:38 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-896f4627dffso4220096d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 17:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770687937; x=1771292737; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=elsS/kGMmD0OoEVMgvfZiiYPaJsOWDl9DHfN22z7daU=;
 b=Oox3OpFWdx/pQbi8JLifIfs2s+RrTHItTGDSFPE/CuiUptN2Ltt1YxDTs5MdQh68Tp
 5mxgX+B7s2wz6g1Yu0NfvxzBquZ2tZIRd6XR4ja9ZZOw9d0clkCJf0rKCaxmMq31PVq2
 xQBxl82XbxRQiZczKr7iCSyozlELRZWsnyom45pdmh+zyC34+jI/bzuPQO3lIxHMoiXB
 lsEaEJhbRjxZxCExyaiM8uSpsdm0/9fc7QthHzoTtC7iI8YK0vMXxnstCYKJKBAh4NMD
 F0GjKf8TyGMB9kaFfWpUdvYOaGaenFlcCbIPd+YVxH3Jby0sv2kgGDR1Q+Bxe0LpH9AR
 Wg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770687937; x=1771292737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=elsS/kGMmD0OoEVMgvfZiiYPaJsOWDl9DHfN22z7daU=;
 b=H2V9KD1dhAZVI0jJO63+xPIUTT1/kB2TfD5btSMIXHLFLNtmwWbsHjdL2zYAVPU8nt
 KkM1ln61MjFEsvzBYI4lMacBEXFcGcRGHe4A1jt2JgUcoNFyPWePvhkgltg6cMyHGuF9
 1pWMu5ZgCFG1kBL6env8WM+w9Zytn/kct9Y3K4yeKNOkWK1v+g6V/DIb1O2W/AW4XR6P
 FJywN1o5GnozMCxheGcFK7aTeJE4cASevuT/xYrSmJK9HAFFXsaxgj7TlUIMs9MWNhKN
 8luIsS1qBwFydLTl1JLtqUhCj1WsdMv15k3nUDnbJuHoaacAVW5m3LJbRjGRsGaQ+Moq
 Bh6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDF1J4PhrJJriYET0W7c9+1QQGfotlu6kBp8GZovdSMTG3ntlPgz6v/3TXkWTmOqwXqZkkjfJA/jg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvDaf5misZVbVO9gJuKTB5lUjjDlqUkYygzNiICnj96pOBaZkP
 q5+v8hyFYzt+AHCsV+fcZJJerCkTyNjaoeRgiv3me7lH9higUPhuIXkI
X-Gm-Gg: AZuq6aI+iIpZSfAOQVdco17PA4AMeFYHISvVSU/9bxO4CjOBdmBJ4V5Z0fZcb27V4fh
 Qon3ZY3ik/hz/y3LIHKSG02SC7EP4EqF/S+VigzX9+E4foGwf4CRZEPZJpOFAqwbqDCuFfNu895
 Wdf6awqnA4Yk3brZ3jnbgDun1PPicUdVZk6+eKBp7yVLU3/Z/UMr7DfdBG75mEOprgefL60A/Ch
 A3+2MN1ToXYChUu3h6l21/Z8h53g3h+mDizZxj4Rhwrdjl9M/Am+FsOcxXhj8Aed+5bM9yIu4ah
 1o8F4QVP+5Ps06FZQ9QidWXuZJ+PK7BCXJm27XOdPGHkPiR/lD5JSjULic5sHtLa/YroGWFwE0e
 8Q8r9dFt1aqHp/a0Xo7tK82wXq2Wz3dVS74qYCkh73GUb73kkTKUtzzskewF4xP3ogAMg5r3UgD
 JpXyTo+pJdVMh54Rb9WhyuQcM2fg==
X-Received: by 2002:ad4:596f:0:b0:87c:2967:fd32 with SMTP id
 6a1803df08f44-8953c82d263mr190898256d6.22.1770687937497; 
 Mon, 09 Feb 2026 17:45:37 -0800 (PST)
Received: from localhost ([184.144.58.243]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9a15969sm933984785a.34.2026.02.09.17.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 17:45:36 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 0/1] drm/msm/adreno: Add A615 GPU for SDM670 and Pixel 3a
Date: Mon,  9 Feb 2026 20:46:02 -0500
Message-ID: <20260210014603.1372-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:mailingradian@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 879491160AB
X-Rspamd-Action: no action

This adds support for the speed-binned A615 GPU on SDM670.

Changes since v2 (https://lore.kernel.org/r/20240806214452.16406-7-mailingradian@gmail.com):
- drop applied patches (previously 2-4/4)
- specify that this constrains the regs and clocks (1/4)

Changes since v1 (https://lore.kernel.org/r/20240730013844.41951-6-mailingradian@gmail.com):
- add Acked-by tag (1/4)
- add OPPs exclusive to some speed bins (3/4)
- enable GMU by default (3/4)

Richard Acayan (1):
  dt-bindings: display/msm/gmu: Add SDM670 compatible

 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

-- 
2.53.0


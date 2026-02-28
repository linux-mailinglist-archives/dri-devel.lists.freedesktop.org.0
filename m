Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id idWNMAB1omlA3QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 05:54:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97131C05BE
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 05:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C13410E038;
	Sat, 28 Feb 2026 04:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WVYRPjio";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB28210E1F6
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 04:54:19 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-7982c3b7dfcso27643827b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 20:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772254458; x=1772859258; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SWHLiQPGuLNOIoRU+H9lZYNm5Ub8L3rxXj707dfRdFk=;
 b=WVYRPjio0rgWrk5fq893sAQ9rYd/GrwXImR8qKrzXiW/Z6nsSWWXoi8rTNSWikpoYY
 REEu2TlFe18ZbytfKu3t0w8uAgapeCvMnEYleP1IUdtYjcY9ECgWLqWkJdutBVa+tTQg
 ZKS0GORoGIqKExhUZRVU4l4o0GRVAhHJg1/ZVrYJ1FvnQ84PssF4qZVxolB60WoZDK9k
 s8OGQXSuHfzclBDmf1gy6UI77CFNTiChUdyywHduXEJks40UqKEWSFkhN4jRLSlfOREX
 k8S70mUtIDbnFQogoPC5UCIwvcVc5BQcznDvjhiq+6SEMjtiLjq6sHzGYLlkS/jBwdz8
 /+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772254458; x=1772859258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SWHLiQPGuLNOIoRU+H9lZYNm5Ub8L3rxXj707dfRdFk=;
 b=wlxLa9O4G60eiM1YaT7s3MV362ih1MMfIqb5ycljGwmLJ2E3SORmNaHAp+nuUSmajW
 k+tTkQP7LBFIJyy7EuRV6JeXd5c8kDBnZhSoLGThVzAaiK5MyHtAsBY2fd4VD8rI5+Sm
 iEPA70CSU3qKlBcyZU9ZuLGp02QoZPVtA+StElLmEjP1GEjX8l+mPdZhGiHShZiw+zBy
 5sOXEhGfO0u6G7y33h0dCoq2WArFGS8n/a4Ecvvd3sZKZrO9FdJCPuXGxL6J0S94tcXr
 yqEMF3Mikwfp7NfM/FXvkCb4CIqlqEqpgLMqqTBhnimXxNlAOEaQETL9Fs6CXG/WBqSY
 +uYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN5X+SVv0WFs796WkJIFIQdN6HJWArA6Dc686pTAydBEmPdK7CWkVzsDZnkE3b5yssRMQ5rjS2Xxk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyThuNkZdr43wsxFiDSiItQNLUsLl/LZ2HcsecmPhOP6lLZE5eR
 etIipswLVhRa7x77bZkr/LkLvYqjQQJTcC4Ojrl700jCBot9PxUX8KQx
X-Gm-Gg: ATEYQzyEng2QrbssNIN7Ks6cSx2OXcbOTZNh9zbVxRjCMrpkgez8hlwSd7GStr/F80l
 uJzdqK4e9l0wFhsHv3uRAypzkMxJ5XoALYS5gmjl7WPxPHUVUrAZDhV8FD3+RVL2Osb3imWQno1
 rby+ov1wZTYlcuTvYl9r+pfpPQsI2pwxP0Kc2HKynBj29HKw0VDPx6rEqxCJR6ythuCq80Uc4VB
 BIGlWylw2vPeLCHuy+j46j6DCE9xhD85vW0bRWjNL/JUBVXI8DKTvM41tA4Ow5m97Xszp4tGcfe
 eU1eru8I3TFEap4QD9c4OiFIcGnaEOBkn6QvWKkTKZRbUca6dh/EQxHsleOxgfa5HSXLwm42wBg
 k5XpsBJjoTdjTUsQgTXclEvIgVUtDTSzTJqwOG+bHLI/qp9g4BYPgxajwzGr4g3GyY214O8ukL4
 tQzxXawzd5DaLlc8V6S6pm+p/3F4NrOjdV+NgoQVhAaddFyQNPADVOQQ==
X-Received: by 2002:a05:690c:c50b:b0:796:2dfb:4af1 with SMTP id
 00721157ae682-798854690f5mr45220647b3.9.1772254458385; 
 Fri, 27 Feb 2026 20:54:18 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-79876bf8103sm29865967b3.27.2026.02.27.20.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 20:54:17 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: stable@vger.kernel.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Alex Hung <alex.hung@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lijo Lazar <lijo.lazar@amd.com>, "chr[]" <chris@rudorff.com>,
 Sasha Levin <sashal@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 for 6.112 and 6.6 0/2] amdgpu: fix panic on old GPUs
Date: Fri, 27 Feb 2026 20:53:54 -0800
Message-ID: <20260228045356.3561-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:Rodrigo.Siqueira@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kenneth.feng@amd.com,m:timur.kristof@gmail.com,m:alex.hung@amd.com,m:gregkh@linuxfoundation.org,m:lijo.lazar@amd.com,m:chris@rudorff.com,m:sashal@kernel.org,m:vulab@iscas.ac.cn,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linuxfoundation.org,rudorff.com,kernel.org,iscas.ac.cn,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D97131C05BE
X-Rspamd-Action: no action

Because of incomplete backports to stable kernels, DC ended up breaking
on older GCN 1 GPUs. This patchset adds the missing upstream commits to
at least fix the panic/black screen on boot.

They are applicable to 6.12, 6.6, and 6.1 as those are the currently
supported kernels that 7009e3af0474aca5f64262b3c72fb6e23b232f9b got
backported to.

6.1 needs two extra backports for these two commits to be cherry-picked
cleanly. Those are

96ce96f8773da4814622fd97e5226915a2c30706
d09ef243035b75a6d403ebfeb7e87fa20d7e25c6

v2: Add Signed-off-by.

Timur Kristóf (2):
  drm/amd/display: Add pixel_clock to amd_pp_display_configuration
  drm/amd/pm: Use pm_display_cfg in legacy DPM (v2)

 .../amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c  |  1 +
 .../dc/clk_mgr/dce110/dce110_clk_mgr.c        |  2 +-
 .../drm/amd/display/dc/dm_services_types.h    |  2 +-
 drivers/gpu/drm/amd/include/dm_pp_interface.h |  1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c  | 67 +++++++++++++++++++
 .../gpu/drm/amd/pm/inc/amdgpu_dpm_internal.h  |  2 +
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c    |  4 +-
 .../gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c    |  6 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c    | 65 ++++++------------
 .../gpu/drm/amd/pm/powerplay/amd_powerplay.c  | 11 +--
 10 files changed, 101 insertions(+), 60 deletions(-)

--
2.53.0


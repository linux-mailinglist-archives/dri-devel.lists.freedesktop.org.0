Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G2HBq1un2nSbwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 22:50:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB8919E08A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 22:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E4910E092;
	Wed, 25 Feb 2026 21:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cQ9bxgce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C188B10E092
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 21:50:31 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-824484dba4dso250430b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 13:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772056231; x=1772661031; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g+0HTxMeqTjjKK+AV+/0N3w+kuUR+oo3BRlsZmyUWtc=;
 b=cQ9bxgcea5qu8w+imziWp0UGi1RJ0Uc0i/sK4LlF2A5WVyoRHG3wivhjVaSXgRAZX8
 /eNFB0rrQ2Z0t8fcIGXfldg3XyIvY1feYBrxQBSYY7zhMaUSpiJs48ueNPvKNwE0W3uU
 uC3lGoRXN5/MNxnOc1+CWnU2c5gcMS83898UiFRXxu+66kQd4xn12mzfHp07C4nefSys
 Fp0Hb9DwQZJLgjKyR6F5vvDqN2BqvVGYHyVn8Pjq50eTGxfOULwMeKIz2Kzeh9wn2atv
 QOnFvFzTPmCFdXiKDqEPqrbEndq8yAvwTMYMkjWpPQ6+66n1J00gpP70VM8MFHhS4VeI
 dHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772056231; x=1772661031;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+0HTxMeqTjjKK+AV+/0N3w+kuUR+oo3BRlsZmyUWtc=;
 b=bjhATHQRA4EgWB6P1TOj9ThpFuAYMCXc1D1lmrvuNxgXDGiAv/ekOrvKDzey3aEY+e
 s3yxQEgBT1ILGptuJq9k2/5DC6P+fofBcDXRpzKMZkA+YDag2MiEx7/ngRDQOuFdp/O/
 seUWF5jN7i0/YJhiIG+z4IcjK/d5SfQedtZQ/D+tecbPADJ6u+kYA04tpyjsf/Z7//kO
 6lCIQEmjhs5VprLQpzRHpvx75ZuGOn2a5lC5QM76VdQ88S5r0xAKlscZuLHJDsCd6ORs
 RqcDGxGiI1E9+a0hKHdOy4+cTwNLbPWZHTx1wG5jegvCKBwUqHP0X4eVUlgzYBgBZoQ2
 YOBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMPvNu2UfrcheE/0L2gjAWLan0eKgu+0Rw5XQrbW6gzcwmFS0ZNWCHhZ0j7X4zVw+Y1uKsaf6nNRs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2ncVa53ypmkLu4o9U6ZLg5iy8yZmlX3xf0Osws9mlsgd97qVf
 MLu+Uv+FcfdFXfrvfrkNKwSfrZyoA+ivGlvh38ReBGkycnobei7WnHPj
X-Gm-Gg: ATEYQzz4DrQY1/3Cqd86LHAqQAuOQmw1KFJ7Wmchy+d5+/pFtHVO9U/2rVnEOLGQh80
 cnTj6ASBdMRAnvk9Qv2CYov1/DwBWgrPD8YIHIXwdvSl4RoE47tg+GFAmJVQQGveH3ew16EijMo
 WgxTRCaZzIMSwAGriUsRrF5cqfQWwcrmJ49lQLIviHwXOrcshzyKHG492tS6NR2rMFgyn/bmE+3
 MydDoWl33cei8XGqNJ/9Q4VOT6/mYMdKgKPlxkHzJKgbjgoIzpWMfJ98ahYr+vBMNGIpP1uVrFM
 KOdVNvFl5kvTZTUWEPG0620z1SXowmLeTh5zOI344oOPErKplt8KaFSklA687n7C9ZyTaxtpPWP
 1FJgSHaHoin5Z0NgJxtoVxJg2wj1VvMkvW4MEUl6dqvJJBcD2l0WJm463TMbfMHeYDg2V/Zcg5A
 nP/V+ray75eiFbdy4q5fY3t1ZnclTCxkW1+5zg3trwuO+xtRDymxijx0h0K9zCNJFc
X-Received: by 2002:a05:6a21:e90:b0:389:8f3f:50d0 with SMTP id
 adf61e73a8af0-395b496d418mr16743637.60.1772056231247; 
 Wed, 25 Feb 2026 13:50:31 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c70fa8059bcsm11990a12.18.2026.02.25.13.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 13:50:30 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: stable@vger.kernel.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Hung <alex.hung@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 "chr[]" <chris@rudorff.com>, Sasha Levin <sashal@kernel.org>,
 Wentao Liang <vulab@iscas.ac.cn>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH for 6.12 and 6.6 0/2] amdgpu: fix panic on old GPUs
Date: Wed, 25 Feb 2026 13:50:11 -0800
Message-ID: <20260225215013.11224-1-rosenp@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:Rodrigo.Siqueira@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kenneth.feng@amd.com,m:timur.kristof@gmail.com,m:gregkh@linuxfoundation.org,m:alex.hung@amd.com,m:lijo.lazar@amd.com,m:chris@rudorff.com,m:sashal@kernel.org,m:vulab@iscas.ac.cn,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4FB8919E08A
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


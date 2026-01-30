Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sQCbIT9OfGmDLwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 07:22:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9005B7998
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 07:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB89C10E187;
	Fri, 30 Jan 2026 06:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LKKbIJEW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BFF10E187
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 06:22:50 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-888bd3bd639so23905326d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 22:22:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769754169; cv=none;
 d=google.com; s=arc-20240605;
 b=XXgB2/ICXk6VKlFZb8SZePh94N3N6lxvRTlvL7T778CHuPCEdbe7IzCFEkvyulxDJw
 fKzaqVLmfHLFKMgWkewxxFGVzIpX/HR6kk8gTcMk6MHTpQmWMYK1lAR+tJXuTvtoPv+v
 ClhQ69w+nvfgAmFN7Rkx4eZFl2oDqoAdP14GChj25RiaJUf0K3ufXGY2zPB3i7GbiD6v
 MKs+Gn53AOjzO7zh8J75mqkeu78zk7pmGIPmy1iQrpjycUtv//kbqKiMKJT4qxwgjk9w
 fgDQy1TZbmBErVQrcsbBd60wVyiB2yqFeb5OBFKox5Z/FbncGE9M4hnXgz2bXythxK9k
 gQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=56wA5OXixB716c0ZqwzEquugKNWbJBgBjylv++HjvMU=;
 fh=A08XZwmmb57jzirbgTkluPSvjDeiJMkkojF1n6qDmTk=;
 b=CWp1KE5bqK09qg25+HpLXKWNAETpSZzpCTBGaS2NdBHW0UCHUhaubm1JdGpj1Ntksc
 adJAUqVyrGcuupz2taRQFYiUeWxGKrXwlD/Z9XhgkXq9zgyNYA954jemQtw0H+THcU/K
 dYJ8hDi3k2zRo43I/Eh7UUYrGqtbsN7E1BynMFlBCbTplt76FHDfpHrs60namtLYj3EZ
 pCvE5+ItOzCLW1v6iXEW28R6Xqognl9JWzfFukNCGoVXEdl6lwZaJ5pUV7lJDjwoGkGq
 3+rZpresOvWHTYIEE+rQVj8VyAMeuhkWlRqIjXToSICd8Ah2dwgkRBRZXyEn/1jwlkdy
 Ursg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769754169; x=1770358969; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=56wA5OXixB716c0ZqwzEquugKNWbJBgBjylv++HjvMU=;
 b=LKKbIJEWuKWWfWScTZlNNlyC04qbxF9EZl2YcY63nanLu6m99+vl1HQ5O4VSvA0y1M
 rSX9Svnngjvs25Uk4oXipVa59W1DMSQKZxicohLWTUdoTWruAhPmO6+SeENJvkzlsgRW
 /cVwuY21uNodTnyR8v1TfWEFssXIJqljUavRTrkkAd6cOUGCvX5FOluFcZmNoNQEpWjP
 gHULGaIhhilVSZj4BVSNRvRlmjYMNpNmlkw6S6Zwg2zPJEL8J5kKKNssvJPIFUrbGrXz
 d3PPCbFaujHcFFwaUWM9VpPaWriD3zS62kYdLU1dIjvnaeRNE9DJWTQj1hEmhZa8nFQz
 q5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769754169; x=1770358969;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=56wA5OXixB716c0ZqwzEquugKNWbJBgBjylv++HjvMU=;
 b=D6wevj6igEZAyW936fIt97pm3LHdm6RynYe8Bp4Z3JFjqy+FX44nnlddy49aIiqHAq
 uUmFa61wqPpTEPTAMYTg0/RcxnoksMnuG8jOBVWP42TygpBcCJ+3yFXC0X6ABMUv3Fvx
 aj5fA69V57OwKrMe6I7B35Nhx74Rb2kVzbhRdoomoRdmiS49Ht7YcHDC7rvx7m63GA+x
 Swb5h1T6yLOv2LdIo3rD5fnaeMA7qh2RFnUk69tcCIDVobzNjJ/l+aGMBPGO5HV6GVm6
 dqK0wKqak7tdzlqZ8uUaLV6flh5JMqMHM/ZS6+ZiayQueOeetoWCxkDweI/dMNDi43Pf
 ThKA==
X-Gm-Message-State: AOJu0YzAQnIatxBbJyCEJQNikQENjX7TNVr42glggKJ5YtKMY4tG9O5X
 dDTKATFgk2PGQ0mKbICO2ihWlf+SSmAeyoORiY++eUTjo9wfiqb9o6UQogQcRuxMdz5rBgBX3KB
 mg7ygls3APKtnTyjeBed19IsJfEJ6YrE=
X-Gm-Gg: AZuq6aKx1Hi9tUdcZ6SPx+0A1y1oq6qC8AWdgQf/sj9Emw0oQBJBx0WZcYPKt+7xqTM
 zdo1DY8MU00d3bQklxDTxGyKjLQct9SnwouEWTAOLEFuZMlEmVmRT+jzlbLYT2E+7JDC3rxuUYl
 sC6pnYhkh0Anr5wS7IlXmPSETcXQETzjDJcBavcGx1SqCrshoKyL4XWBt005xnu6v2NNzhMyo8X
 9QyygIN6d6oILcpbtw0FbOpQvjOr4tC8z309WX9guNzIkZDsW9/jPyL10rhj4WYj9uXGa4bOIt6
 qlgVJRRf88CBifY4pj23BjRUt6ao92X2T6I20mcWFguVWpPfUEvqLfj1M/bhrVhuAQ==
X-Received: by 2002:a05:6214:4110:b0:880:88cf:59ff with SMTP id
 6a1803df08f44-894ea9a68b4mr23588036d6.22.1769754169092; Thu, 29 Jan 2026
 22:22:49 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 30 Jan 2026 16:22:37 +1000
X-Gm-Features: AZwV_QgAg1LX2-dmNS78t1t0ya-M_h_B-hdUKBccd2lWFi7OeuHrLqFXCX47a4w
Message-ID: <CAPM=9tx0m4T9BQEO6DNVZ44pUcknBmXX+E3S9HSBKpiQDh_G+g@mail.gmail.com>
Subject: [git pull] drm fixes for 6.19-rc8
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C9005B7998
X-Rspamd-Action: no action

Hey Linus,

Seems to be a bit quieter this week, mostly xe and amdgpu, with msm
and imx fixes and one WARN_ON from user blocked. Nothing of note
outstanding either.

Regards,
Dave.

drm-fixes-2026-01-30:
drm fixes for 6.19-rc8

uapi:
- Fix a WARN_ON() when passing an invalid handle to
  drm_gem_change_handle_ioctl()

msm:
- GPU:
  - Fix bogus hwcg register update for a690

xe:
- Skip address copy for sync-only execs
- Fix a WA
- Derive mem_copy cap from graphics version
- Fix is_bound() pci_dev lifetime
- xe nvm cleanup fixes

amdgpu:
- SMU 13 fixes
- SMU 14 fixes
- GPUVM fault filter fix
- Powergating fix
- HDMI debounce fix
- Xclk fix for soc21 APUs
- Fix COND_EXEC handling for GC 11
- GC 10-12 KGQ init fixes
- GC 11-12 KGQ reset fixes

imx/tve:
- drop ddc device reference when unloading
The following changes since commit 63804fed149a6750ffd28610c5c1c98cce6bd377:

  Linux 6.19-rc7 (2026-01-25 14:11:24 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-01-30

for you to fetch changes up to 3a390a21ff0bc53800433441045c00b51de9d439:

  Merge tag 'drm-misc-fixes-2026-01-29' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
(2026-01-30 11:47:06 +1000)

----------------------------------------------------------------
drm fixes for 6.19-rc8

uapi:
- Fix a WARN_ON() when passing an invalid handle to
  drm_gem_change_handle_ioctl()

msm:
- GPU:
  - Fix bogus hwcg register update for a690

xe:
- Skip address copy for sync-only execs
- Fix a WA
- Derive mem_copy cap from graphics version
- Fix is_bound() pci_dev lifetime
- xe nvm cleanup fixes

amdgpu:
- SMU 13 fixes
- SMU 14 fixes
- GPUVM fault filter fix
- Powergating fix
- HDMI debounce fix
- Xclk fix for soc21 APUs
- Fix COND_EXEC handling for GC 11
- GC 10-12 KGQ init fixes
- GC 11-12 KGQ reset fixes

imx/tve:
- drop ddc device reference when unloading

----------------------------------------------------------------
Alex Deucher (7):
      drm/amdgpu/soc21: fix xclk for APUs
      drm/amdgpu: Fix cond_exec handling in amdgpu_ib_schedule()
      drm/amdgpu/gfx10: fix wptr reset in KGQ init
      drm/amdgpu/gfx11: fix wptr reset in KGQ init
      drm/amdgpu/gfx12: fix wptr reset in KGQ init
      drm/amdgpu/gfx11: adjust KGQ reset sequence
      drm/amdgpu/gfx12: adjust KGQ reset sequence

Dave Airlie (4):
      Merge tag 'drm-msm-fixes-2026-01-23' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'drm-xe-fixes-2026-01-29' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.19-2026-01-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2026-01-29' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Ivan Lipski (1):
      drm/amd/display: Clear HDMI HPD pending work only if it is enabled

Johan Hovold (2):
      drm/msm/a6xx: fix bogus hwcg register updates
      drm/imx/tve: fix probe device leak

Jon Doron (1):
      drm/amdgpu: fix NULL pointer dereference in
amdgpu_gmc_filter_faults_remove

Nitin Gote (1):
      drm/xe: derive mem copy capability from graphics version

Shuicheng Lin (4):
      drm/xe: Skip address copy for sync-only execs
      drm/xe/configfs: Fix is_bound() pci_dev lifetime
      drm/xe/nvm: Manage nvm aux cleanup with devres
      drm/xe/nvm: Fix double-free on aux add failure

Tvrtko Ursulin (2):
      drm: Do not allow userspace to trigger kernel warnings in
drm_gem_change_handle_ioctl()
      drm/xe/xelp: Fix Wa_18022495364

Yang Wang (3):
      drm/amd/pm: fix smu v13 soft clock frequency setting issue
      drm/amd/pm: fix smu v14 soft clock frequency setting issue
      drm/amd/pm: fix race in power state check before mutex lock

 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c           |  7 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c            |  5 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c            | 25 ++++++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c            | 25 ++++++-----
 drivers/gpu/drm/amd/amdgpu/soc21.c                |  8 +++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++--
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c               |  7 +--
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h      |  1 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h      |  1 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |  1 +
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c    |  1 +
 drivers/gpu/drm/drm_gem.c                         | 18 +++++---
 drivers/gpu/drm/imx/ipuv3/imx-tve.c               | 13 ++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c         |  2 -
 drivers/gpu/drm/xe/xe_configfs.c                  |  3 +-
 drivers/gpu/drm/xe/xe_device.c                    |  2 -
 drivers/gpu/drm/xe/xe_exec.c                      |  6 +--
 drivers/gpu/drm/xe/xe_lrc.c                       |  2 +-
 drivers/gpu/drm/xe/xe_nvm.c                       | 55 +++++++++++------------
 drivers/gpu/drm/xe/xe_nvm.h                       |  2 -
 drivers/gpu/drm/xe/xe_pci.c                       |  6 +--
 drivers/gpu/drm/xe/xe_pci_types.h                 |  1 -
 23 files changed, 117 insertions(+), 86 deletions(-)

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAIeGTHddGkV+gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 15:54:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8417DF8C
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 15:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADD810E28A;
	Sat, 24 Jan 2026 14:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Rkrf+Zdf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348AD10E2C6
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 14:54:36 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-42fb2314eb0so2674039f8f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 06:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1769266474; x=1769871274; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Aljt7hRWjvdGdfI17i0Kx5ImMNfHVYhoQpQMGch3H1g=;
 b=Rkrf+ZdfXZtqX+KLdbF1Oluge9KUqycfOAZZIl/MMiZZeO/YKisn2ruvT8kOwiepa1
 ap8Mb8Coad3eedmjmbfWLgRqcrgDDHKOyMPgYxlOF0ZysH9ZR+b+ewGad9+CAvhcBOy0
 yeMAKKPB0XzWd1xL5XOkDVS3c9AoikHNKfk2oNrRBtBGwol+n7xCN49/73skASH+Y5i1
 aQKEY1wKNrHArcIjmWddVxm91NkWrL/egkdAWRyxUB+PHh9HY2X970LDWoSLBjyR5k8f
 f+l1mjHGmpVVEuuq6jG2OUzhe8Oy032PqzYf0/RIIW42dlvswrzDBNf9tnXBGgXUKYTi
 CgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769266474; x=1769871274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aljt7hRWjvdGdfI17i0Kx5ImMNfHVYhoQpQMGch3H1g=;
 b=jZ4KMlcPnsGbIZKTNHGyJhjjTA+9NeyZjvGCkmxOAXHNgRj1D6y8L5QNhT9keoM2Tq
 QWxdkw8PAmQuW3dLmLRu6YOkTWb5p3/zJJFy897kcMXPAwWFlFv/HwOyE0vTRBu0AXbH
 qFFeEMsCQrTbjpLpZ2EpCaTBvvvJYT7hRc4+kel7BB8shC9ly4dxTrW4y2GRiDPiDTtK
 pilIVzrhWsIQ3Zg38St5zdr3Gjpy6cDZciBunwCO1WCk8iqc34KY6uo8ChFyvrbXJjs8
 5l2iXJeNNmRx5COBmPNjDuxYLX1V4IqTL2gXTHzsTC7yQQl6ulKaIgHuS3OvtsV6Ez0a
 uJaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkq2j+9OWPk8wZ5tPmzTXHefChn4vT54ptFSqPXrOYRt3s4SOJMZbgH2x0c5Y2qQ7LZ1ckgT49GpY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4sslRKNt+XrUOfuzVaEe7Hm97NvQ00b033McIME5l4pI/r6DE
 lz+tFi7gZgsXOff/QnEskKh9k5/oOFr4ThXYSvLKsF8PGIYwyln7yaEEUehobAkHh2M=
X-Gm-Gg: AZuq6aLVQ4rH6qxS471re01z4aUCpW4eDlX8DrjVmmAQ2kNPA9y17zBuE7tA6xzdFDE
 iCWESkMJbCgZ3RmiBLMl42PF1+M7Uefm7YgcO3ABjx94nsrko4S6hN7wP591iR5pKm8EW0tjugD
 sX5zqroFjH7/fZul1oqKXtAy1KCtBNg3rPwQ+H1fS938X3L2pAbKvLAb7cSZraoUZZXFGVWhwGP
 50Yv+HSWADdc/xzymX1D3qW+C8fPFyiyOdcZZo0PbAu1/uQfsNjycs8b8I8ayLqUdngenWmsGoY
 Nfw/JktUOj8zRs9aEwDQvoDJRRfax9ZDeWJ629Ll0uCR0xSn0xDNtK0j9/nrvJW0TsurPcZ5paV
 2ltrPD0bKTmhuwzpCwtDWnxDVeJlHp3QarFjcSypob3lu61AuRmHQq02bgKVscnVHpUceEbz0+v
 Qx09SHygoXHsrYM78oWjtr5fXm
X-Received: by 2002:a05:6000:4026:b0:431:8bf:f081 with SMTP id
 ffacd0b85a97d-435b15941e6mr10267693f8f.23.1769266474472; 
 Sat, 24 Jan 2026 06:54:34 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1f73855sm14846241f8f.29.2026.01.24.06.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 06:54:34 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v3 0/2] replace system_unbound_wq,
 add WQ_PERCPU to alloc_workqueue
Date: Sat, 24 Jan 2026 15:53:59 +0100
Message-ID: <20260124145401.44992-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com,intel.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:intel-xe@lists.freedesktop.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:marco.crivellari@suse.com,m:mhocko@suse.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: BC8417DF8C
X-Rspamd-Action: no action

Hi,

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an
isolated CPU where "delay" value is 0 or greater then 0:
        schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

        schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

=== Recent changes to the WQ API ===

The following, address the recent changes in the Workqueue API:

- commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
- commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The old workqueues will be removed in a future release cycle.

=== Introduced Changes by this series ===

1) [P 1]  Replace uses of system_unbound_wq

    system_unbound_wq is to be used when locality is not required.

    Because of that, system_unbound_wq has been replaced with
    system_dfl_wq, to make sure this would be the default choice
    when locality is not important.

    system_dfl_wq behave like system_unbound_wq.

2) [P 2] add WQ_PERCPU to alloc_workqueue()

    This change adds a new WQ_PERCPU flag to explicitly request
    alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

    The behavior is the same.

Thanks!

---
Changes in v3:
- rebased on v6.19-rc6 (on master specifically)

- commit logs improved

Changes in v2:
- rebased on v6.18-rc4.

- commit logs integrated with the appropriate workqueue API commit hash.


Marco Crivellari (2):
  drm/xe: replace use of system_unbound_wq with system_dfl_wq
  drm/xe: add WQ_PERCPU to alloc_workqueue users

 drivers/gpu/drm/xe/xe_devcoredump.c     | 2 +-
 drivers/gpu/drm/xe/xe_device.c          | 4 ++--
 drivers/gpu/drm/xe/xe_execlist.c        | 2 +-
 drivers/gpu/drm/xe/xe_ggtt.c            | 2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c          | 4 ++--
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 3 ++-
 drivers/gpu/drm/xe/xe_oa.c              | 2 +-
 drivers/gpu/drm/xe/xe_sriov.c           | 2 +-
 drivers/gpu/drm/xe/xe_vm.c              | 4 ++--
 9 files changed, 13 insertions(+), 12 deletions(-)

-- 
2.52.0


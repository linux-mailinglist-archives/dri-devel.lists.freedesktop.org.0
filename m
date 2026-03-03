Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGaqA9ZSp2lsgwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:29:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2E41F78A6
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D4810E8DE;
	Tue,  3 Mar 2026 21:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SfGla0rl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0931310E8DE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 21:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772573394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8SD2VoRr+tc5wYI9TVLRWC6aPDSxE2BzY5GPr4tLxmE=;
 b=SfGla0rl5MtypagclwtOm+ixhYiLImGhR76+j6J1GgU3/KZos910C2/1bSg3KP3abfe29J
 GEC/Cu2yKMjCI+tbMVC0EbvzX8z9m5wqLhWKjtkzN3ozZr9fbbrM+XFjFUIUuwKjLEPQjI
 555hBiF1iIZEvJQ/dq/AgU2KogWLVVc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-1_jCXgfHMxGlDJ08Z2xL8A-1; Tue, 03 Mar 2026 16:29:53 -0500
X-MC-Unique: 1_jCXgfHMxGlDJ08Z2xL8A-1
X-Mimecast-MFC-AGG-ID: 1_jCXgfHMxGlDJ08Z2xL8A_1772573392
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c71500f274so626787685a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 13:29:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772573392; x=1773178192;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8SD2VoRr+tc5wYI9TVLRWC6aPDSxE2BzY5GPr4tLxmE=;
 b=GyWWrldu//aGA5odkWtQuD7Y3y7HoHPTkdox9zJ5PrE+orZANAv0pnLc7AiZ5+zVlN
 lmiMMw8U6vg1peW7vRjui6nfK/telmoDAr84f2ZCieXcYllBbGhwohYgyxfORWJhdo+8
 DELawXpHgSGdBVbyzxfs2yLUr/FXYH1HJv93VhEuwrmxjsOIA+lHyqV3m8DpFTjTaFNH
 yC4szg2+fUIqsEl80ahnVNz7oHwz8GjsaH5a3UnO+dZ73+qbDdCxsbqBtbyJDh3RlUo4
 hUuyV5uM1qExdgnHroheYwO8WngBTCf9Y1hLybAt08q4MOG0QV9wziqk9BYr2WpuvbFA
 04Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR8Eby7apgRF2i8DvMndrW4jYGDzSDnV/GtGOJCeGvXW4awoRYGB90OL3tkSDWENMmoiyxHH/FSpM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyrZHuNW51cM4ac6Hq0LVYQd4vy55+6NMdnVWpTb7wtd7RQnfR
 re4RKO1+u+O868wZeTHlS0PalOTPXu3aIkgCckZvsvsKi9QmmZ4w+FWhBqOW+Tte8UeYGHjq6Op
 4F15m+XdvJgRo0ETZLlxk7jJJbYbC9fevZsGQin6LPt+rGKRBQFRR5laqGSxF3F73Rkt1Mw==
X-Gm-Gg: ATEYQzxzCyGxpJQaWTtASIc7tjV5NJAtM5Dwe1ZLVbPRPY/5dtDCUj7nWw5UnG65Ncu
 EUfC9OAkk4uBtJ1E27f4aLjF4k6dAi7jbngqfM/qa+6p3A1ZNOmzl6Znnk+1v4FhfkP2B0OZvG1
 rxhgTXdRW076xjzZrq9LI4YDjbIj4jIhhwCZALseu1O+oWkGFgV1d0RP2OJ9LNC69a3s+ezxnpS
 UA+vshwUKTmi40O6YvbCFnKcucHVW0LxHj04U2CCmEprCmte6XW788fy3c8gw4a37Bh7kHYCUYL
 IM3wiZ7Vu0PUv5hODXW4OwyCu5WV8Uiy8b1gzatOxwRNbspdiyiXnRVRJB2+PVk2VY5p89bT4Ra
 njybvFc6XpLhOijEbGBoGe6x/5A==
X-Received: by 2002:a05:620a:1981:b0:8c5:2ce6:dae with SMTP id
 af79cd13be357-8cbc8e98436mr2208241185a.29.1772573392246; 
 Tue, 03 Mar 2026 13:29:52 -0800 (PST)
X-Received: by 2002:a05:620a:1981:b0:8c5:2ce6:dae with SMTP id
 af79cd13be357-8cbc8e98436mr2208235685a.29.1772573391510; 
 Tue, 03 Mar 2026 13:29:51 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50744990e15sm133781341cf.10.2026.03.03.13.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 13:29:50 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:29:44 -0500
Subject: [PATCH RESEND] drm/amdkfd: remove duplicate ttmp11 scheduling mode
 definitions
MIME-Version: 1.0
Message-Id: <20260303-drm-amdkfd-ttmp11-sched-mode-v1-1-8130e3e6fcae@redhat.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jay Cornwall <jay.cornwall@amd.com>, Lancelot Six <lancelot.six@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Peter Colberg <pcolberg@redhat.com>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pALD6D6ipBANYVmZ1UCu4_AWRCZ1hEmaBdBMfvSO4B0_1772573392
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: 7E2E41F78A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Felix.Kuehling@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jay.cornwall@amd.com,m:lancelot.six@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:pcolberg@redhat.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[pcolberg@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pcolberg@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

TTMP11_SCHED_MODE_* are only used if RELAXED_SCHEDULING_IN_TRAP is defined.

Fixes: bbcad5a8896b ("drm/amdkfd: gfx12.1 trap handler support for expert scheduling mode")
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm
index 456db81998993803a25b32653ad75d529e35931c..3c976a4aac739669a39aebeb97bb35dfaa1af2f2 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm
@@ -112,12 +112,6 @@ var BARRIER_STATE_MEMBER_OFFSET			= 4
 var BARRIER_STATE_MEMBER_SIZE			= 7
 var BARRIER_STATE_VALID_OFFSET			= 0
 
-#if RELAXED_SCHEDULING_IN_TRAP
-var TTMP11_SCHED_MODE_SHIFT			= 26
-var TTMP11_SCHED_MODE_SIZE			= 2
-var TTMP11_SCHED_MODE_MASK			= 0xC000000
-#endif
-
 var NAMED_BARRIERS_SR_OFFSET_FROM_HWREG		= 0x80
 var S_BARRIER_INIT_MEMBERCNT_MASK		= 0x7F0000
 var S_BARRIER_INIT_MEMBERCNT_SHIFT		= 0x10
@@ -134,9 +128,11 @@ var SQ_WAVE_MODE_DST_SRC0_SRC1_VGPR_MSB_SHIFT	= 12
 var SQ_WAVE_MODE_DST_SRC0_SRC1_VGPR_MSB_SIZE	= 6
 #endif
 
+#if RELAXED_SCHEDULING_IN_TRAP
 var TTMP11_SCHED_MODE_SHIFT			= 26
 var TTMP11_SCHED_MODE_SIZE			= 2
 var TTMP11_SCHED_MODE_MASK			= 0xC000000
+#endif
 var TTMP11_DEBUG_TRAP_ENABLED_SHIFT		= 23
 var TTMP11_DEBUG_TRAP_ENABLED_MASK		= 0x800000
 var TTMP11_FIRST_REPLAY_SHIFT			= 22

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260224-drm-amdkfd-ttmp11-sched-mode-a7a722d96df1

Best regards,
-- 
Peter Colberg <pcolberg@redhat.com>


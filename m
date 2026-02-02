Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aD9mODTfgGleCAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 18:30:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52804CF9D4
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 18:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5C210E1D6;
	Mon,  2 Feb 2026 17:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P30SP+1L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7485E10E1D6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 17:30:24 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so4399851f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 09:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770053423; x=1770658223; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RI/alqYAM4gO0/wt3nMxDoDmoSnVqh/ah5aH4qQn4kU=;
 b=P30SP+1L/9XiYivwfAOpmSDqRUzMN6k8RY/zDwujEZb5eAjb4tlVB7SNSPlaYLt2bk
 Tb0yUU02GGFKs8OLyI7MhZUDWex/3n/D4ulof6VW+39XNUH9OqzWZMF9SuFwpRq1/K5z
 kSgs95xfpln9Ca3ImZIwB1JGqRdiujXcLta+EJ9B8ePONbq31WSBjD3zZuQFg+mDYWbG
 fqmKflKrzsakU50bsWalT5FvfyzYaPdZ6U1BomPTCtVvCi6zdYoRB4SZj97o7pKVwRkv
 AOxPDGZx0QgHfcGX0E66jMx+wtDL8rmfpDzku5AOLCirV7tJZJt94DX7ak+PWu1WT7iR
 WEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770053423; x=1770658223;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RI/alqYAM4gO0/wt3nMxDoDmoSnVqh/ah5aH4qQn4kU=;
 b=Ckd1oeZYhrPNNLHHAWCZWY7Y6/IkpW4bh7DBTYkw/AYh79x8ydMrcRFQWKHm/inH7v
 kKXf+oKikfLFZilAboRUQBo9uyNNhK+fRNFk0JxYzmxpNniLTu0ThNeDVAHMjWO8oB7w
 zoF2JHVgVkCZ1Rp/pr4Np97T3W9KQijtVG28VbVzyfKG3gYRTHlcKmAk9Tid4OM94lFm
 9WQY0S3YUqUeeihmo4HdyRplBR/fkC0KgI4qzF8y+7BQxv+s7PsTeP7xaIzLTrftXfBF
 Ah2KKIbTRcIvzO5SF+cChMmAai3vGMyw8cD9+1qMEuN09ceI5drKUQAh9h8jmDbZ2KNp
 XXyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJULm5hrsq1BHB14t5RFOPFMujITX5chh1GGnLZrhAV3CXhL4fptbgs1Co46rNw2cMjAAhqKezUb8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnRwBIRAtLl1ta0G+zd0v4M+zLqP3smsLH/EVJJFG1hN053rks
 76jYZawK9wsmQGzwPReD+DlmxfPkkscQtmq+WSYn3CTaYNISsxhOdJFf
X-Gm-Gg: AZuq6aILcvh1vJXWCNgieDv3r4QUdO4DuW93TbbhhvND45+TXZXC+ekS/hmPvUpT9E8
 Nd1iZTFJFObA9lUgNGKPxTw1HrP1Z1Lly0khXOfiifQooW4KgqEtSJAQ2ZVazTLof3Lp1ozyOvk
 jOZ2it5LcPfrCZJj+cGO3k3EUOFrEh38/kTiDj/n01///Bp8n9zZVoqLiP0wRdt0lw7pknDXuXn
 dx4NJiBiKQehdlMEGX9x7n+dhJYehKZ/Zj/27ZSMkuDFCm3ag2A64IIxNESzTEm+oQuQ5m4kLCA
 J7PUu3buLe3dvFqKYFtkC9ZNSxv4EkJUknSBPCWJQcZNedsKA1zdmseEVdWQ727uDKF3SIq2ZdO
 HQ/GZ80hn9hKI95Q34gZxT3xbDfjXHn3bMiGsu+s5Jptx4OVhjkJ+FHcGPXFs3bXrPp2FrrvC7E
 AXIIvzxX/V/9Ppg9IhbYnMYo2hAmscKM8=
X-Received: by 2002:a05:6000:4381:b0:430:ff0c:3615 with SMTP id
 ffacd0b85a97d-435f3ab2695mr19181714f8f.53.1770053422479; 
 Mon, 02 Feb 2026 09:30:22 -0800 (PST)
Received: from hassaan-HP-Victus.. ([192.140.149.43])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131ce58sm44324788f8f.20.2026.02.02.09.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 09:30:22 -0800 (PST)
From: TrainedPro <hassaananwar12345@gmail.com>
To: amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, TrainedPro <hassaananwar12345@gmail.com>
Subject: [PATCH] drm/amd/display: Fix ignored timeout in do_aquire_global_lock
Date: Mon,  2 Feb 2026 22:30:15 +0500
Message-ID: <20260202173015.33743-1-hassaananwar12345@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:Rodrigo.Siqueira@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:hassaananwar12345@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hassaananwar12345@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[hassaananwar12345@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 52804CF9D4
X-Rspamd-Action: no action

The do_aquire_global_lock function was incorrectly returning success (0)
even when wait_for_completion_interruptible_timeout returned 0
(indicating a timeout).

This caused the driver to proceed with atomic updates significantly after
the hardware had hung, leading to system freezes.

Propagate -ETIMEDOUT to correct this behavior.

Signed-off-by: TrainedPro <hassaananwar12345@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 39df45f65..6546bc9f2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10458,6 +10458,9 @@ static int do_aquire_global_lock(struct drm_device *dev,
 				  crtc->base.id, crtc->name);
 
 		drm_crtc_commit_put(commit);
+
+		if (ret == 0)
+			return -ETIMEDOUT;
 	}
 
 	return ret < 0 ? ret : 0;
-- 
2.43.0


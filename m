Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UADQAkHvhWlvIQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:40:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5968AFE486
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486B610E746;
	Fri,  6 Feb 2026 13:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FhA9Hu+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7748510E74B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 13:40:13 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id
 5b1f17b1804b1-47ee0291921so7166815e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 05:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770385212; x=1770990012; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GPiWcT/oJWu1HMdei+am/uID5ljtBm8TxUG5R2Ik1AI=;
 b=FhA9Hu+6BwGpWUwbsNeIcNj214CMppFaV1PAH+lZUS9PB7yl8pkMKLyxr+ypr3UJOf
 1CgoG257GHYoxIr9n/CkVPezZ8EXXFzJPYyFWKb3FMSHrxOGzWuoECbtDvgtuxpItGK2
 9LZG646fNNRZNZ+r5/uHImdPGqU52nZVyZsR4qkzVOJ/qo/aa8K3NhhMfxogj1yW+DTT
 5HPocMgYLK0VU7Sg0ILIvM2QWzRZFjY1VAhGa2XoXG31C/H9DyoO2xvs+6Z4G8PHYKYG
 nfKeIeKixJubIUR5Ww5ShhQYy0lNA4hJwxeRH/+M67371/KIUhq2Suhobj+TbvOnTfvU
 hSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770385212; x=1770990012;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GPiWcT/oJWu1HMdei+am/uID5ljtBm8TxUG5R2Ik1AI=;
 b=koWWd8PY+QUIk+8O2cUe3b0jTpgoR6Vd5+JYwEilFzmX2pvgigXgeBR6JZnhPV0GSY
 rBLRcafQ/aw39USCdy8WGqHxpLLXJ7YnmDIbJhEst0LmqiGwgrENjPy7tBoRoTTXH3GJ
 wzh7wBfzC+2Y6HsR9oCatY25qALbTHkd425j43AEgecHM1hvkzcOx401wPG3farRV3WL
 CUiLMGnVYQ/eCWQIdkkueBmoROCGzwAYJF77/2doAM1oO7i8UHZRQPsqh2vEWda4gDS+
 ewY5OCB/lsZOJ0WDT3dindPw5bIqRpRmqtkZm8fd/mEsYvIqly99VZSYmtUYBei4D5wH
 AuJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8N8KMejEEBvH36GemHBwyC2wUFs3BqZjCI/4KwptLJPFS0Cabb7Hb/YmX09bFfIuBksrPPrkgTSM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/wZVK3yAyMFnzVVP/cSxNAk3DKkHg/eG78wDlJEUAjOIUh6Cf
 E4DDDrfIv7qRTrefpmUZcEvcM65ait9CbVfUNkEhd7hYp58MATFB9C44Lz/m7XGJRxk=
X-Gm-Gg: AZuq6aJYkrHYfeZCCKzi3bGPYxFCs2VJv+2YsJxV93jn+XKvWj84fzGx4oNziQ+DB1q
 pnLt/4z/r0F5B3dvhMzMxTz4qFNs27KEqX/ctPqJ+1066dqrx4fw8pg5b3IyldfycznzT3h0Cr/
 QfB/+ayRLOYY3h+48GkrHpLqobfP11mhoLlRO3ok71HKTiGs3uJvQHWRsNIh0b93ATFndudZAU4
 73EQQm5UZuayAR6iaqumtyIx3be4jwTHcPLwHqkFumklZVvVcEHDbOZqRMX4cIsh9B3WCOhKua8
 3XLwOyHIRuGY1VliQHu9LE8/8Eke+TK+DonwFqKthx9/bbn/CyKStNJQ0T/BcQLRrs8zwGsDdAn
 p6AE48ttNfZ4hqsKa3fkg+Gn/mbHX95QwFQTWbVovCfkQxUCn1xJuAFbMps0XMrGTb8G0N1Dweb
 rDHk/NzeeD9k7uAAI9vkfg16hOtCE=
X-Received: by 2002:a05:600c:1f16:b0:47a:814c:eea1 with SMTP id
 5b1f17b1804b1-48320227d98mr41961805e9.35.1770385211873; 
 Fri, 06 Feb 2026 05:40:11 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d345c2sm171490355e9.6.2026.02.06.05.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 05:40:11 -0800 (PST)
Date: Fri, 6 Feb 2026 16:40:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] drm/xe: Avoid toggling schedule state to check LRC
 timestamp in TDR
Message-ID: <aYXvON-q4xpkubRu@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:intel-xe@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: 5968AFE486
X-Rspamd-Action: no action

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Matthew Brost,

Commit bb63e7257e63 ("drm/xe: Avoid toggling schedule state to check
LRC timestamp in TDR") from Jan 9, 2026 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/xe/xe_lrc.c:2450 xe_lrc_timestamp()
	error: uninitialized symbol 'new_ts'.

drivers/gpu/drm/xe/xe_lrc.c
    2421 u64 xe_lrc_timestamp(struct xe_lrc *lrc)
    2422 {
    2423         u64 lrc_ts, reg_ts, new_ts;
    2424         u32 engine_id;
    2425 
    2426         lrc_ts = xe_lrc_ctx_timestamp(lrc);
    2427         /* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
    2428         if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
    2429                 new_ts = lrc_ts;
    2430                 goto done;
    2431         }
    2432 
    2433         if (lrc_ts == CONTEXT_ACTIVE) {
    2434                 engine_id = xe_lrc_engine_id(lrc);
    2435                 if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
    2436                         new_ts = reg_ts;

Imagine lrc_ts is active but get_ctx_timestamp() returns -1. 

    2437 
    2438                 /* read lrc again to ensure context is still active */
    2439                 lrc_ts = xe_lrc_ctx_timestamp(lrc);
    2440         }
    2441 
    2442         /*
    2443          * If context switched out, just use the lrc_ts. Note that this needs to
    2444          * be a separate if condition.
    2445          */
    2446         if (lrc_ts != CONTEXT_ACTIVE)
    2447                 new_ts = lrc_ts;
    2448 
    2449 done:
--> 2450         return new_ts;

Then new_ts could be uninitialized.

    2451 }

regards,
dan carpenter

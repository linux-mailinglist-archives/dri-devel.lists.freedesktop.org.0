Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJAABZEMe2k6AwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:30:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73A1ACA15
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE85C10E7DE;
	Thu, 29 Jan 2026 07:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aF+QCT3D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E68110E7D9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 07:30:21 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id
 5614622812f47-45c9f47e1e8so258457b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 23:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769671821; x=1770276621; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=go+flHjCFj5QaaQiPaxub6cNyzDZojFZJyQzORscVMw=;
 b=aF+QCT3DxJ86RHah88vCUP27u2BUSo8Ybj1A7XnNGE4OJ4FyQRFhn41DFO3C+pbb8k
 BpYVJl4bKLkiEIy17DLHxAvuT+E+9y18zW1duDrAI82c63faTvhUAsDvfruBY6e6oJ6K
 OHCjz76Y20lDP1i57gTo+HYwZMZakKLa7S/7+nEmMcS1kGUPyC+aw2+cmaAQdVgtg9Kn
 EBeOh3k3zBZitQzdhCEQwiwbpOpy84WJ6Gt4m0zDbgqHJy8mr9ys9Y+/ZXO2tqqvjpmq
 Gr6LEVV0sj7eXzIc6MRkrC7Vpb7Lbslg8jLjHtmWg2g4xqib/QNmRH85zIKsm1+tb0XP
 PmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769671821; x=1770276621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=go+flHjCFj5QaaQiPaxub6cNyzDZojFZJyQzORscVMw=;
 b=e+4HA3u+ybwcmp3o+kmRKLMSTcaVzEXmeuksk8H7jEsr7B75QDXI/NPwCqw1/bo6cz
 L1DD59AOBVZMn5XKtVV+IG5b8xFpvks9dKEITIUw3DfnyvMIwhs8hTS65aXloz065RBT
 /d8N5B4DPwxQ3PNLfgpqSW8wc6iBpe+Yh0Cj1qnUcthk6l423l9dLJEAoZUUQp2onjap
 l5fQ3rLcDm+2M1zykcJvzXR9Hob3tjItY2PxBMpdqYcKC4LpktaXOoC7/QIlljnpNmtR
 iSoI907GbYVowEzsYKR4LRled55Fr/HGnv7u+oKXo6uqRofkPBTbcHdHPmrxVRQ8qUwO
 yS+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkHTzJXbICaRKQrRUWwpfUQSS19XGBHLg+DTS8H+2wW3iNnS1rYjBaHM3xoPh0/WOXQvs+WX375lA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0nq5fbLIGeoDanj0MOT6j8hQzPxgDM2AmiS9EFPU0pVJ5Ht7c
 p8P0jYBV06daxZ8730BDFzTXU8+N9izsSWX302eseOgRmvDnpGWiR01T
X-Gm-Gg: AZuq6aIbi+lEQbhcj0UcTcqetAKVrxtPA7KnIi3O9xHFc6qY7UzjVh52jR51A43O6rY
 BlB9QV2cBbsNXl3fWG0kBG2SjuVj9aIptf3/4y9U0OG4b8Bn+OYqbpt5aw0dzkUhtEMAO4VBNAl
 k+EgOtzYQuyXHzfIUEGtUYNhtWQMH/6IypM1p0bTHFRdbhJroRl9Jy950i0px8R5TPIu7NH/CLc
 B4d3y+Bt7nYAQf8qWbTdmATSy6H/Z3/ko/n3Q4DAV3zIPnWWWN5KRanYzNjNr+it6qHSeqsNNwu
 dbTPZucZD3lZ6/d6uvwwiq34Op6y0B9wxBopGxL1o5J2xOsZaQpweR1+6kM+jCIo0UKwTmf14ap
 vppeP3wjJkPhaRPJwQ5IsPFu3eq71TNldOwO8a1kyUnUVj9ECgkcJ66kN4YcMgdJPJegqPV+H9b
 u3tLInXzMFZdFfWRyPMD4dOIdaifFB1Ep8wmbUlOVm
X-Received: by 2002:a05:6808:1a08:b0:45e:6697:b7cd with SMTP id
 5614622812f47-45efc5d1a5amr4649291b6e.20.1769671820601; 
 Wed, 28 Jan 2026 23:30:20 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-45f08f73625sm2638135b6e.18.2026.01.28.23.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 23:30:20 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 08/32] dyndbg: make ddebug_class_param union members same
 size
Date: Thu, 29 Jan 2026 00:28:54 -0700
Message-ID: <20260129072932.2190803-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129072932.2190803-1-jim.cromie@gmail.com>
References: <20260129072932.2190803-1-jim.cromie@gmail.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jim.cromie@gmail.com,m:jbaron@akamai.com,m:ukaszb@chromium.org,m:louis.chauvet@bootlin.com,m:bagasdotme@gmail.com,m:airlied@gmail.com,m:daniel@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:pmladek@suse.com,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,akamai.com,chromium.org,bootlin.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,suse.com,linuxfoundation.org,vger.kernel.org,linux-foundation.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B73A1ACA15
X-Rspamd-Action: no action

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index a10adac8e8f0..441305277914 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -104,7 +104,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 55e07b706c84..1d13e3ee3e12 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -811,7 +811,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.52.0


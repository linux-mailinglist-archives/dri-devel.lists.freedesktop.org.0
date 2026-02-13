Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMUUDU4Uj2mqHwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 13:08:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A937D135EFE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 13:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9254010E283;
	Fri, 13 Feb 2026 12:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i5YCCLHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B1310E283
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 12:08:41 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so5109365e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 04:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770984519; x=1771589319; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZWDDVUz8J9tvSAhnBsNBMLMyz74/BvxCVQ+lSI2K8JI=;
 b=i5YCCLHYNJyZzupEP6hOkHPSi1pSFG3I8O5vWikRD6Y4D39qUPOM1ppZyvITeZleC6
 uKSVAjh+nTBDW09/9kn4ET2xPRzAvw4NryL2AT4L6GvVb3/l2NsGjdCNZMgc+xypt4zK
 NLEjqf7ZO1w2wH33oTVPqjgS8QrnY8u+hCJTSyP29A+KKNDZRvlVr0UV2Kj1OsMLE7rq
 qV+8qQYN9gDWskNxBUXyAlz48U1K1geDXlon5WbKX6eOxk3Gined+gpKPJvEXUfOVCKa
 n0J60SsSapE440UyrtVJGL5MSoXfIlO8pUm4qUwrl0TJlHeoNHezwqTJ5D4VtDW8C18r
 NVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770984519; x=1771589319;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWDDVUz8J9tvSAhnBsNBMLMyz74/BvxCVQ+lSI2K8JI=;
 b=YzahmgeTcHvuKGisJ9B+7A6HPcu4soreCBtjmQf5wbJqn+Q1g/lNdQp7tGlwm81LQu
 BBz/rEioPg2cWlVWO6u8LVE7tZHJcHBX73f8LK6PG0/RggjMkGnOSGMJSS5oKDUuJZ7f
 8pA7G6igdT4IPeG8mM/FKCXWeQ5smDtqWfR/bul4wlZF276fiJBq5OgRFHrSLbb31dol
 /j2q1CL9N08YT0CzXGBeuU1HNBHpMemIj3qWFQQ0E3iBYNDx0gaulKJkfJyHUYEpEXw5
 nzVL+fJheZGE51dzEb/PoIDXn/YdzzFdPRuhCkbJkWLxw6gfG8DcjAVvPkNrj2XoLhdx
 BiCg==
X-Gm-Message-State: AOJu0YxpqhWST+2cfjr+JgC3M2fVczwpWiVGDt0QcEs7A6xDN0k4CKuZ
 iQCLbPw1KZCy2KoSZ4hRfhCoxtV1ouZxXC+H7boinsBI9VK3e0yW5vqu
X-Gm-Gg: AZuq6aIX1oxBaa8IHq4PGVyx0IdeJ7SCD4s+Qx0EiiKbXvvV+fVGpgmCTklS75vCDCN
 zfTavyvQeWGoj9JiPjIdsErV35+nFTp2ZbWso5EB73EHGwdRp4CDo6wwifVtEi8WS+tTics53Pb
 c741pkSQqW8Q7CZZ8l7bLZ437QVswTbv8JBkdMQfYSq3K6RAwEGsIyktRtFNCusbiqge6hWIfa4
 wEPX2ECtjxQApDularYGty0FWJDYhzIMhtEy2ia7ecXaXxxqhMVIHMsqiEEMR5tzImswY9sb401
 1y6Rn/W1UY+8CUAOht2ulYlv2ZLDj7LufT+bx55FQVjg/4lmv94MIhnpVM1mCmfSSPjslanvgzp
 NBgsYFTFSicHM0t/cy+dFbfDf7MYsSAFFtUHZ5tWqo6XAWLGGdNNihnYxoWfVaeI2EZqYjqFXp3
 Kk/cJzFdV3vOArdVo3VA8kJbVtuGS4TnQerNQyFDJ+PIBmuQgUiMYGwS4Y7f/8Lgt2OUeI
X-Received: by 2002:a05:600c:3584:b0:47e:e78a:c833 with SMTP id
 5b1f17b1804b1-48373a5452fmr22341515e9.32.1770984519328; 
 Fri, 13 Feb 2026 04:08:39 -0800 (PST)
Received: from Arch-Spectre.dur.ac.uk ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d99497asm289274955e9.6.2026.02.13.04.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 04:08:38 -0800 (PST)
From: Yicong Hui <yiconghui@gmail.com>
To: christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Yicong Hui <yiconghui@gmail.com>
Subject: [RFC PATCH v1 0/2] Starter task: Querying errors from
Date: Fri, 13 Feb 2026 12:08:33 +0000
Message-ID: <20260213120836.81283-1-yiconghui@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:yiconghui@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A937D135EFE
X-Rspamd-Action: no action

This patch series adds an ioctl that allows userspace to query a syncobj
to get error codes from fences when submitted jobs fail, in response to
the starter task in the drm todo documentation.

According to the kernel documentation:
https://docs.kernel.org/gpu/drm-uapi.html#testing-and-validation
I will need to add relevant test-cases into IGT alongside this patch,
is that correct?

I am still a beginner, so I am submitting this as a RFC to make sure I'm
going in the right direction with this - Would love to get some feedback
on this patch series. Should I need to add additional parameters for
flag inputs as well?

Yicong Hui (2):
  drm/syncobj: Add DRM_IOCTL_SYNCOBJ_QUERY_ERROR to query fence error
    status
  drm/syncobj/doc: Remove starter task from todo list

 Documentation/gpu/todo.rst     | 16 ----------------
 drivers/gpu/drm/drm_internal.h |  2 ++
 drivers/gpu/drm/drm_ioctl.c    |  2 ++
 drivers/gpu/drm/drm_syncobj.c  | 22 ++++++++++++++++++++++
 include/uapi/drm/drm.h         | 13 +++++++++++++
 5 files changed, 39 insertions(+), 16 deletions(-)

-- 
2.53.0


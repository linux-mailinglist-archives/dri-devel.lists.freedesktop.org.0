Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KVsA/cemGnhAgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:44:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAF7165D94
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D138710E7CF;
	Fri, 20 Feb 2026 08:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F3U+wj1D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com
 [74.125.224.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BCD10E33E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 22:44:45 +0000 (UTC)
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-64ad8435f46so1310947d50.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 14:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771541084; x=1772145884; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pH/3gnQr87FHbNqJn52DgWvIFWAoFRDTMQB92zG80ZM=;
 b=F3U+wj1DeXktfomb1ARwcZcR+tci1iGnSlq5O8LlzZfvqP5kYxaBK52cYWuc5aB24n
 4Gzhwtb0wJEC2FSAHK9NMLpBv2eAKAQy4+H9F46PAjpTBsq9MhPlClVty8yIXNLNHx+8
 UgedsBJGSExff6uS853t0eOk/w1kl2qFwqFfaREgq+ddS1ykLzM0WIaf4wTGwcfEQwXP
 WK9h7yiev4CvCPKUTaWupYSObpp3GJXeKIQRgr71rN1SDu/r8rvpIDnKQiV3VAwimkGH
 ZpPv6GB8gxwRw6Uk4KEmirewXhwxr/+I9D2lrFfNr8QWIOmjdjhjMhrJVlouI5CK9Gbc
 6dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771541084; x=1772145884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pH/3gnQr87FHbNqJn52DgWvIFWAoFRDTMQB92zG80ZM=;
 b=UdDKb3Qt2ZkrA33Sh5Ic5QwEaeX048q9j5J04uYaPXwaWhJrotYEcz74IUkFBC7djK
 WaS9JnXlS8fQsofIABm4i9cbNx9Unxf9iiIHjgnc0aQ4qSkhrWenQVb+jWwWu6Wl0+Fy
 R5ZfLzTem1TjJxjfQ+MqYbfOID4Yh2HVQn3Ym0D2LaYkpYy8xRkkgXK/NGhcoPFRXuzA
 ElA2S/WDNzitf+XjXRr88i5mYPLkvK1jESiwx+Ti46gUpnV/JRyzt5uPUYZtl4Fnh2yc
 wXUaajYJZ6K/IRwRLYlKEfd/1wZ/uPZ2lkPO4vtqnV+WlZl8NxknoDu2s6doqnWhlEne
 aTzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU18K6a2Y0QObY2nlXZZI/v3mUFddYowxBAJKp3lYVAWjB40A/7Y8whTd3sO/IghnM0ffV8QYXC7NI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrQGSSLjFuDODaXj1aR8Tsj4NhHzGXltbTDhdJ9B+GcnFufb/8
 M6oijC5zZD2hnAZ4vq8C/NZWEorsWT1gBRRAUiKhkvWbYhfbSOOqZOt2
X-Gm-Gg: AZuq6aJH9nhVViHj674g6LyahXHEQe/IADX2908Z97tkN8UhXqtC2m6qBznqi5bmKYs
 5ZaoB2yvTGo+jFrRzxmm2wGCTdJil1weVarqXlmSuJufAgT0ouqNxkSm7txwDQK+cmp8Ors6ma8
 AfNRUDl1fNq4EJjDYHTxkj0H+DnAlBmSR8xXBbrmo1+GwhwqLZXWyQMR8ego6a2WgwqGOpsk03A
 JhbAxXDmGmd+tXHC/9Id1eemgKYjvdeZR3aO9BHQynGesITpYn64t9UUuQE6GZbBCp07qbX2MMs
 95ipgGD/Bw7sblIDTqTeKid3s26cHWAEFwb8j+Zv/9w4oepgdejjZu4n4N5J6ZD4Ahelhc0MgJ8
 muqwcGSxuchgVj6yyX0c41YHuiaU7XZC1xdvzKUBan8EWWCaVgVgMMT/RhyFOgxsCEFcT3W4uLl
 dak8NHZFAfPv6gCTplW7aNYdI/tu1glmUIv2R6XsQs7NWt2JgeVJmQS1bB+NoRTLug9tqJ7KLoZ
 ApAcl8EXUcE1JUDpPyRW9TSILn8cdwShsVJAqe0Jyk=
X-Received: by 2002:a05:690e:1281:b0:64a:e61f:a6f7 with SMTP id
 956f58d0204a3-64c21b599a4mr13503566d50.71.1771541084386; 
 Thu, 19 Feb 2026 14:44:44 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-64c22fb1d22sm7453050d50.17.2026.02.19.14.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 14:44:44 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] drm/kmb: Fix error pointer dereference
Date: Thu, 19 Feb 2026 16:44:26 -0600
Message-ID: <20260219224426.1122073-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Feb 2026 08:44:31 +0000
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:anitha.chrisanthus@intel.com,m:edmund.j.dea@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:sam@ravnborg.org,m:linux-kernel@vger.kernel.org,m:ethantidmore06@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ethantidmore06@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[intel.com,gmail.com,ffwll.ch];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ravnborg.org,lists.freedesktop.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8EAF7165D94
X-Rspamd-Action: no action

The function kmb_dsi_init() can return an error pointer and is checked
for it, and once confirm here in this code block below, goes to the label
err_free1:

kmb->kmb_dsi = kmb_dsi_init(dsi_pdev);
if (IS_ERR(kmb->kmb_dsi)) {
	drm_err(&kmb->drm, "failed to initialize DSI\n");
	ret = PTR_ERR(kmb->kmb_dsi);
	goto err_free1;
}

At the label itself it dereferences the confirmed error pointer.

 err_free1:
	dev_set_drvdata(dev, NULL);
	kmb_dsi_host_unregister(kmb->kmb_dsi);

	return ret;
}

Add check for error pointer before running kmb_dsi_host_unregister().

Fixes: 7f7b96a8a0a18 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 7c2eb1152fc2..9eabbce7574f 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -576,7 +576,8 @@ static int kmb_probe(struct platform_device *pdev)
 	drm_mode_config_cleanup(&kmb->drm);
  err_free1:
 	dev_set_drvdata(dev, NULL);
-	kmb_dsi_host_unregister(kmb->kmb_dsi);
+	if (!IS_ERR(kmb->kmb_dsi))
+		kmb_dsi_host_unregister(kmb->kmb_dsi);
 
 	return ret;
 }
-- 
2.53.0


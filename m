Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FoWCQJdi2mcUAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 17:29:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBED211D2E3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 17:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C3510E5D8;
	Tue, 10 Feb 2026 16:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F5L7KCjx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21DA10E5D8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 16:29:48 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-483487335c2so17797285e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 08:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770740987; x=1771345787; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sdzOxstMlsYuxY5gUUqtUIeZeD3M+KWyBuexQsbSY20=;
 b=F5L7KCjxLMySlyMPYEsNYMiFdYfdC4jzm47Rk0tWgJmN+1qgMiOemV2mO3a1ZbyLBb
 Ra2z9BmVqLs/U7yIA+wQZ9Mvet3zfbnPlkf/2Z3mPP82r3AmvL/oi7kXdy9OBI6jOsif
 FENc0nQJanypv1XX/W58frIE965BUgT18ng/jPwvdUGF+L4r9kllhchPz8EGkrF01e9w
 PfalrwOaDxEGsHFLDvCabwIeT7WIdt2jlboCn/QPuL6bi39H/MuZSqE1hhKbRsHAceex
 +DyAoYI/Ay131dLL5x+4y7R9P8hWvoWPT0aGRxWGW2aC/t5AWSeUgPxh5iOCgo+1nw4M
 7aDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770740987; x=1771345787;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdzOxstMlsYuxY5gUUqtUIeZeD3M+KWyBuexQsbSY20=;
 b=KdhyKIZSMS/N5EhIEZDnPOhla8JWLIIaDRZxY7qdKjKq6GuOjrta6h1QhHhBhDJKnE
 /+i3S9vDdOTEK3eLRcdtEcDIevoeZAzyc4dMssFrI3sApH7yw1AOZYAqj2gPZRI6/pQE
 4YJBsCCb0MR6sZZdHuqKlGPCgj3Wnt5JjRugCLl2N41N5s6B2KXkVLwdOSgVN0Y9bRZw
 hoTMCYGX6M32yvk6+aNAx4GXrkRt5RAWHmPweoDSpzTaRQHALlg3dXKn3APSmh0Nrqc+
 4NXjV/hBhC827eCLgG0STFzBq7kiSf+X/vrXaDtbo7drYBhfYFPF9fV9Ru3DhepA0uo7
 F2sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4q67hwlSiBQgp++n3E9UckNah7TLdmqNeJPdMsrKbpIkas4DUWTdXg9777LrHe9Yvqj5je4nJYK4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0uFFMeS8dOFkn9Q57EKRdAukknE9wnM5t8+mW0ClsvqHRGA3+
 m8FjVAUklYKXzTqSdIK7BhzZm250XdGrVmCIKij3TR7BR5m/D57y+Cs=
X-Gm-Gg: AZuq6aJNIDDzuAJJANHvdD5cQwiMnT38Y3oDbxxPAgGgQ70+6A+CoHpbhLqtKVJjrXR
 owGvOzLtK5SxAlJ7of6ouZfkdmXTExnbfNtSZJzFWANrG6ee46ujh/JYwjy5pkPWFdo1XC3BQQ8
 1AaSQywWa4blNqWfZls5LEgci/9lzK60jovPq5UxMAB6drMr6q4fuX9Mo14avj4/+rtHMMcwqQo
 wXpTC261UIeEGvDWIBAoMlY8OKlXxiGS7dPK3qi8qfIPhAqi6iM+jSk71/6IZjfnNuWfRVkDGzj
 /h1vtIlMslRsvpFzJI2FUxada9lZ0chgpFSq2jLy/+83QjivmxE66XWLUga2dwHwhumhoxQ37fq
 xIO0yIJeivuSFGuIYOkEywk9G36QbwVYzzOo/3De0WFox8w2IQ5+8FHCQy4jUSve265mWnP6pOz
 lglPeqd/O1sZS0H3zq2c3Df8MvryetbYw+jVacoiXTOU6rYCXSHb9HGiaSgwHbYslRkyIpplAEk
 1XHsT/FVv/+kQ==
X-Received: by 2002:a05:600c:3148:b0:47a:8154:33e3 with SMTP id
 5b1f17b1804b1-4832097e27fmr187592045e9.28.1770740986868; 
 Tue, 10 Feb 2026 08:29:46 -0800 (PST)
Received: from [192.168.1.17] (host-79-19-172-190.retail.telecomitalia.it.
 [79.19.172.190]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d78cfsm95182975e9.1.2026.02.10.08.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 08:29:46 -0800 (PST)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Tue, 10 Feb 2026 17:29:42 +0100
Subject: [PATCH] drm/msm: always recover the gpu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-recovery_suspend_fix-v1-1-00ed9013da04@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWwqAIBAArxL7naD2oq4SIWJb7Y/GLkUR3T3pc
 wZmHhBkQoGheIDxJKEUM5iygLD5uKKiOTNYbVttjVaMIZ3It5NDdoyzW+hSXefbpq/s4usAOd0
 Zs/634/S+H7EzSB1mAAAA
X-Change-ID: 20260210-recovery_suspend_fix-77a65932fa4c
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770740985; l=2814;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=n5cxhcAYuqXwVPgqUWtTDYlwQYPPyoUIskghINChSL0=;
 b=M9SJ3nUQubja4jNzIiH2tA9YijW97ffp9B+aOxZx4Zzsd4ZwxYxM2PqFAUA4PUMwW1FxjOr3Y
 r9kplVv06gSCIjLoDjXxpAys0/yewGxd4mLhyICAH8uf89NNneUrX8G
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:anna.maniscalco2000@gmail.com,m:stable@vger.kernel.org,m:annamaniscalco2000@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[annamaniscalco2000@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[annamaniscalco2000@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BBED211D2E3
X-Rspamd-Action: no action

Previously, in case there was no more work to do, recover worker
wouldn't trigger recovery and would instead rely on the gpu going to
sleep and then resuming when more work is submitted.

Recover_worker will first increment the fence of the hung ring so, if
there's only one job submitted to a ring and that causes an hang, it
will early out.

There's no guarantee that the gpu will suspend and resume before more
work is submitted and if the gpu is in a hung state it will stay in that
state and probably trigger a timeout again.

Just stop checking and always recover the gpu.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/msm/msm_gpu.c | 42 ++++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 995549d0bbbc..ea3e79670f75 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -547,32 +547,30 @@ static void recover_worker(struct kthread_work *work)
 		msm_update_fence(ring->fctx, fence);
 	}
 
-	if (msm_gpu_active(gpu)) {
-		/* retire completed submits, plus the one that hung: */
-		retire_submits(gpu);
+	/* retire completed submits, plus the one that hung: */
+	retire_submits(gpu);
 
-		gpu->funcs->recover(gpu);
+	gpu->funcs->recover(gpu);
 
-		/*
-		 * Replay all remaining submits starting with highest priority
-		 * ring
-		 */
-		for (i = 0; i < gpu->nr_rings; i++) {
-			struct msm_ringbuffer *ring = gpu->rb[i];
-			unsigned long flags;
+	/*
+	 * Replay all remaining submits starting with highest priority
+	 * ring
+	 */
+	for (i = 0; i < gpu->nr_rings; i++) {
+		struct msm_ringbuffer *ring = gpu->rb[i];
+		unsigned long flags;
 
-			spin_lock_irqsave(&ring->submit_lock, flags);
-			list_for_each_entry(submit, &ring->submits, node) {
-				/*
-				 * If the submit uses an unusable vm make sure
-				 * we don't actually run it
-				 */
-				if (to_msm_vm(submit->vm)->unusable)
-					submit->nr_cmds = 0;
-				gpu->funcs->submit(gpu, submit);
-			}
-			spin_unlock_irqrestore(&ring->submit_lock, flags);
+		spin_lock_irqsave(&ring->submit_lock, flags);
+		list_for_each_entry(submit, &ring->submits, node) {
+			/*
+			 * If the submit uses an unusable vm make sure
+			 * we don't actually run it
+			 */
+			if (to_msm_vm(submit->vm)->unusable)
+				submit->nr_cmds = 0;
+			gpu->funcs->submit(gpu, submit);
 		}
+		spin_unlock_irqrestore(&ring->submit_lock, flags);
 	}
 
 	pm_runtime_put(&gpu->pdev->dev);

---
base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
change-id: 20260210-recovery_suspend_fix-77a65932fa4c

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


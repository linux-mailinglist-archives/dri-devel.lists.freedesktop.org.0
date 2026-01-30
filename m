Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ce5KPyofGnuOAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:50:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56542BAA7A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E8810E99D;
	Fri, 30 Jan 2026 12:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j2PhqgvW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DEC10E368
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 12:49:58 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso17727445e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 04:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769777397; x=1770382197; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FDyuTxJQ2wPWDIlHnScBHP39ldpO6z/HRmLWZsSUiWM=;
 b=j2PhqgvWN8Gnna3WdmUTmvZxhsayOfDi+B9ZsuVnCmxwWF1Xpks1K/Evw11m9y5se3
 7VU3+2O+64xeSIMESIOYWaYl2wzAKJfvqoITPVxWxcaLGQqPqOiTwy5O9nBaRvI1aTvg
 ZeBvEbQ46c8BYdVNcyy1lEbvbm7+7cWiqDXRAN3oz6+vufkhq9+Bfd2+SzxnVmekuafT
 OaPDdIT1RMTzbiIxusLfge8ObNQ1IwZRWQoJPu9p/FV1UK9/ljmVRRG2Keq0UtwYz9O3
 5ukf5MDwJrWMhOQ3FjGe552jihSiXtd8GTvbaS59SStJkzLFOMSLkw6pFHcsfU9Njstw
 FDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769777397; x=1770382197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FDyuTxJQ2wPWDIlHnScBHP39ldpO6z/HRmLWZsSUiWM=;
 b=Xya5N4lGRGcaBNL9oExotOx1m3/VufYAi+kgIi/LhVQIhEOcUYS/FfAh8l8pZhd6k8
 f4ABezeq2bo+VDTKGQ8nN6WlhNLmxLGfyllhgNOY6uB19f1spkIJwniIvp9zObC8HD19
 1Ue4XDBZGRb2GsI8GFP3j7g4Kx/FXzL42IOF/gxbpToo5DHUPHn1iwmvte5QilAhM9Bu
 yJbVq9f8Evgw2kMLLhtPuWSju7JsuKRKfjffUoZ0J25IfDGlRnVo6p8jKFUgzM3gZwez
 rM+XnLEuigvGu2Iy7E3fOumC7dptFIGvweCyozr73kDgAJsh1H+lxmEo01BMg6ARMNCJ
 IkXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmUxcyWlbPhpbtbPmydqJ+51vd3EwbSC8UNkWHyhVkdnd0xW4MRHC6TptCCf0yTig2R5WmYMxZ2NI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP855kN00FD7p5FIANUEd6WjObTyV4/4IGlMaDvIVbxcWJlbdr
 XxoogrfL3TCG7Vi2ARiTGHLXSGCYqwqRAr+Ol3VXQ34QCaA8ZhpnPl5n
X-Gm-Gg: AZuq6aJArMm/mxcNE8EworQgFWdhOe3rcGr+M47WqNAgeWs5Sdn6x+C45UT+NVtuIfB
 5xPzuBuuEYTciNXN5VnhWJblu3I7tGvH7EB8oFoV8a+620K+vpiaeQ0JpcEdN3Q5tZm0PWFYmxY
 JVF5trJ8sBRyhQ4KNFgQpn1NvPL83Bqy+UaCE/xDcMcMHqTU3nF/9i+9L1DoaCggTHtV5PGOoW6
 gjWgWQUUYplO72rv69t8jMlQ2stkr/apszPRXc19tvUBY9/FCP184DCGp3vmnFMg5YtY5c4KYJm
 UnmpnlO2F9xhRzJWiUkKgFKQ3f2CHsnzmC3d5P8GC6ZsRlx36HtK4rBP27p4fiMB9rsrJPTFlNF
 OCijVZvAbHrLA+J9JHg475duE2O5FR3svJmpyXfzoU4Vxw0u9STZE82X4erKsMd8oRmp1BwhsCg
 JefFsVBrF9yqo=
X-Received: by 2002:a05:600c:a00e:b0:477:63db:c718 with SMTP id
 5b1f17b1804b1-482db4bda8dmr37743845e9.16.1769777396741; 
 Fri, 30 Jan 2026 04:49:56 -0800 (PST)
Received: from xeon ([188.163.112.49]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 04:49:56 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v6 02/15] staging: media: tegra-video: vi: adjust
 get_selection operation check
Date: Fri, 30 Jan 2026 14:49:19 +0200
Message-ID: <20260130124932.351328-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:hverkuil+cisco@kernel.org,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:thierryreding@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 56542BAA7A
X-Rspamd-Action: no action

During __tegra_channel_try_format, the VI (Video Input) checks if the
camera sensor driver provides a get_selection operation. If this operation
is unavailable, the crop is set to 0. However, if the operation is
available but returns an error, the VI currently fails.

While this works for simple cameras with a single pad, it creates a corner
case for sensors like the mt9m114. This sensor provides the same operation
set for both IFP pads, but returns an error when get_selection is called
on an unsupported pad (such as the source pad), causing the aforementioned
behavior.

To resolve this, if get_selection is implemented but returns an error,
try_crop is now set to 0 — treating it as if the operation was not
implemented — instead of returning a failure.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 4b80086f8c05..70a84158b589 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,17 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret) {
-				ret = -EINVAL;
-				goto out_free;
-			}
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.51.0


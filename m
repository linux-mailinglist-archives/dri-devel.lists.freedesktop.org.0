Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBTgCAipfGnuOAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:50:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB2FBAA9D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD2310E9CB;
	Fri, 30 Jan 2026 12:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nsUR+KwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B52D10E9CA
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 12:50:11 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so20049025e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 04:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769777410; x=1770382210; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xr+OjmRQzkV1Pp7uXV6oto+bq13Pjg/MusGbR6wa4s0=;
 b=nsUR+KwBsPoy1u53KlEz5vm+9xZdxxykVcTAw0u5Nxu1FOa3VS45SUPYACiscaWmwd
 njOG3OGGSyqRPU09YWE6znBjtOb0BaPz4zoW6DwyJ1bT884oUXMj8mgWRGsB4TRNRxop
 F0+PbpkAKqQD+39c4Iak6bsBex4DbqPZU2l1UFxtHmZKamKcvFXSMjnM3HCIkzngMOgB
 3d5qBa+tN4ISQasZ7BJFcENyp8TboCJ4UQjkh14zDw8UatzAAVB1X0CtOHW+DusPhwPr
 ot+7BaeIJacOmBesFDp/TIG/AIsxO/J0hEz5qKTv3waJfYOPJwtZ8O5hLJUuojdxjgnq
 Agiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769777410; x=1770382210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xr+OjmRQzkV1Pp7uXV6oto+bq13Pjg/MusGbR6wa4s0=;
 b=b3eTunwEp50JFcqhJdqrHP7dfeZ81f6CE1nqorJNcZp/tVp5gEVwaifjICnd63cflS
 x8a2YQrDzd4P/YMlOJqz7ejysvWhzQ5si7Rky9PhlneZ7oRoyAPWS3iy53IWjfpT9bmQ
 9R9XBhDDhSNi7k9O5PLgDvIJrd131ISxWKJTSQEGCAq4Rcq2o86gcZ0m+f56RpsXnQ/S
 c1OkyBjetDwEqgjR60W+rDmx9takP5kpGpOKv2BCdowwBk93Gp/qqIG1LdaESEnkavjn
 s/28p4P1nRkB6053PbcIBGwokFy8FbBnjnO1DzKACuKMgv6Z3dpmAkq2sysZFOS+2HJL
 Kgzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP2iRX1HIX+h+2fzXtiu//YDvPi3fjvk1qwkMbXzDBsiEpoWUVEIza7EccJGfGCYpAb/hfdEJkCQQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmViBiD+p5FrbDqd8IsGwwDb6iGtw8OI0b3NT+ZkDDuTINs1jE
 ibZtRcS7cW/7sKom20NfUdHWAlqZBEP3J7416v/tFU+qvKC1KK1+3Yt3
X-Gm-Gg: AZuq6aLkbLQb9EmP06+zdU+4uK5VYuIIgESzbuHP3gmU/5haP8VcRonWsHcj+mBMB5V
 SNHwmzbOaELmTgnrvbblK7CmdbqQSF3VfYh+5sEXOGZ6uKaYCEa6hJY/87XFHP+34D1tVyHWQLH
 L+Cn5AChSPMoG3uDrXES5JTpdpXxx7N63pLrhy2Ag45M5w1zqSMIIEgsHj2OlASkVl0P9j27zWn
 AdLm3k6t0V/KurQPDa3FKntcCeV+Ergrh+GqhgVKIxdo4Joq2U5wzJR6N41/UjTXMQ635oQIo6U
 +fnMZRVDzJKoD5ZtxgSdYIUQ1vZJOds/V3L0/Ei1OR5MprSZV9eCNlX15GOfGt/MHwJBeXX6EIv
 4t9/t6lBcrVwmQHB2eRsd/Nl1DteoMWBMcCbc4BUqoz29GkboV+cmsUVT3BLlBfPmmxISvXwsbs
 24jZX4EouxSVE=
X-Received: by 2002:a05:600c:a4c:b0:465:a51d:d4 with SMTP id
 5b1f17b1804b1-482db45770cmr35972115e9.6.1769777409790; 
 Fri, 30 Jan 2026 04:50:09 -0800 (PST)
Received: from xeon ([188.163.112.49]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 04:50:09 -0800 (PST)
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
Subject: [PATCH v6 14/15] staging: media: tegra-video: tegra20: adjust luma
 buffer stride
Date: Fri, 30 Jan 2026 14:49:31 +0200
Message-ID: <20260130124932.351328-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:hverkuil+cisco@kernel.org,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:thierryreding@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: ABB2FBAA9D
X-Rspamd-Action: no action

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 36a57078d539..1b8f2a2213f2 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -504,7 +504,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.51.0


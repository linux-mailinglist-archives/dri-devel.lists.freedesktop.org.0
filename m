Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DoaABafpmlqRwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C76C1EAEC3
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AD710E666;
	Tue,  3 Mar 2026 08:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c55KN9pF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F309610E66A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:42:55 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-387090ae5b1so89220631fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772527374; x=1773132174; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tq2yeiELH2O2leNzpOSOy0DgLmB+c4y6g32iEDIZZWE=;
 b=c55KN9pFicmdyCrkKh2tJwRR3SOWOFntN5WH7nq5LCy8wH1fGRRiOEMqryzR2kdIhD
 blbYO4rf3+nbhiPzKetaB+oFMDUXQCqNGwrIM9A9fWokuAlm8VBvuDb4SmjvlBSjBeyg
 I5fp6fgQtRDFDwe9KCEbfIO5PBWGFE5EheVoL9lmrGdkkIWakJSfgl32+wTrXTf1Rkyu
 TQ1xJwt5jc0GgOQ+NsO4jDSvMPoiQ36mikZ/kH1bYpE7vIFUgb+YgU+AKfK4Yo5sxaHg
 S7JmbLQJE26KYVIHQ/h/DtCsELZZYVHj/Er7jh/tFMJjIZJ5a/EyfzCz/zMxUIOTJnd5
 /8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772527374; x=1773132174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tq2yeiELH2O2leNzpOSOy0DgLmB+c4y6g32iEDIZZWE=;
 b=Vi4bNME7nFSUFe9KmhFLU5e0pzrkfJTwJzLnJ2nxcC9gEQJkThW6OlwUQ0NbVnzzG0
 145zoIqrNQjEVegeECcTnfM2mALBjWyT+u3wSCU6m1uMHDLJHKPdsZ29ORlEZtVU0Kav
 2aFtoE5uQHSpDm3OTueya7opcz86a6qD6Fd0nQmOl64kRYDT5V5INYu0Pvlop4330CTz
 /kbooa2rtdiljLnCCnepmmwNfJes8xwLu+fLX545lboaGmpHH/p4+oDhjiKjMVC54cJD
 VFja+1brvlg3bNwisHMXm5FdkLLWvp8rM9SG7Wqha16W+GazdceNeEYNzqEi8heIEbuj
 tXRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVekt4Q+xX5r94sANWrky8jW3ZpB4C8LgdYvTk3W1+mOfuTY/ngODLPMqRnyT89DJhtzVvCd0mWnhE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfoQ3962c3mJ/lPJ5lD3mGpi8Tt0IOIv1OnB4aK4z07K/KjCsB
 VFpfHZAN3wuIN4BeKhlPsf9Y2Z+WgclSW8gw0mcnW8fJL9eQTd7+Dc25
X-Gm-Gg: ATEYQzyPcMSp2miQSwm75aTnvN23lQBe7plX5hc9RgGYvM+9zAvx8bnSlr+H2TDeD4n
 DBD1PhpupEkP+H+aXaUzarZwlnfAeOR0XaUSycZ/ifmClH1byWonz1NB+gPU64x0guga4o9d/wi
 /j7ZBPnOOgrT8b1CaGk6Dz7+Bx2PH70irRNgMLYBwnx6N7LMsQfUwwfI5vRn7udeoENDp3Gp98U
 6xLxOoe2zUBPZphB2wsYdSQ1akhqzttpqSi9C/t688AovNQfMCXsDO1rMBg60OS9YYKuBh+ZNq+
 gYoZaFpbv5EZ5pDfBrZC3s0HCwo5UlnzliZqct8BbLwZ/g8MrVdykvrotJs3hHXgsLiVu/NxoNQ
 4PYhrAcqeiQZcWJ+nJUEgy6sWUDwSGt7a6r/j7wq1rgDQVnHwcMHFL2t1nEck5vRX8lUyW/+Akc
 vze/X0gviMP2XA
X-Received: by 2002:a05:651c:2120:b0:383:26ac:4fd8 with SMTP id
 38308e7fff4ca-389ff07fd9amr102630141fa.0.1772527374144; 
 Tue, 03 Mar 2026 00:42:54 -0800 (PST)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 00:42:53 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
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
Subject: [PATCH v7 03/15] staging: media: tegra-video: vi: add flip controls
 only if no source controls are provided
Date: Tue,  3 Mar 2026 10:42:26 +0200
Message-ID: <20260303084239.15007-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 9C76C1EAEC3
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
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:treding@nvidia.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:hverkuil+cisco@kernel.org,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:thierryreding@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Because the current Tegra video driver is video-centric, it exposes all
controls via /dev/video. If both the camera sensor and the VI provide
hflip and vflip, the driver will fail because only one control is allowed.
To address this, hflip and vflip should be added from the SoC only if the
camera sensor doesn't provide those controls.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index e0961bc0a017..19eebfdae221 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -962,6 +962,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -987,11 +988,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.51.0


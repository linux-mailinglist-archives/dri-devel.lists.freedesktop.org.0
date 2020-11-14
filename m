Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742462B3B06
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E22089DDF;
	Mon, 16 Nov 2020 01:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E486E930
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 15:21:13 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id k4so2514170qko.13
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 07:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8trkRjP9UFPyJqjxFvhkrNselLfEoUHaVtNBCoJ4XCk=;
 b=tAvkwqI5UxVZLosgiy2dth1kE1mcObUnNjCIF6g213uhCAWBHnRRh5fpxcrgw4xb3v
 FZ7NpmkKli8Co1oMfBaarPj3K76JK44Ml1lkgtKkBh09QtZQ3+zfv1uswWhXd61y4bQE
 j/X998FoLQ84iWpWlrUVOo/Q3OBuKZs9cqij5UWCtakg6o/hSjfI+DtG0TBdUATP99z1
 gRiqRqcuyqK46TknWsQIXmrU0QiaF+mSHY13qSlOKkOoJQg6DbBkqlrPmB0OQzbY/isO
 +v33fhTuN3YUdRVIzPhPZJQDAlEazj2T3f5zJHglATLeKtFoLgiRU9C+AwUzyYMLEkv2
 EkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8trkRjP9UFPyJqjxFvhkrNselLfEoUHaVtNBCoJ4XCk=;
 b=oihozZDk5ELtrAaUu4JMB2MvGu5xGEd4/7+JI9D1eNwZoD3uoqMvHhjoPEsdRCbUlX
 NQlO/AGiL/X3KZLADCkWRx6y9/gxRX8EihlbDq8GYgIecJeCmvL0LmawMQTXZk6AcjGh
 x0uL3CqHpoEcE6xSnpzpRUzeZSE+NSFdt9TroJOdZzau8bpvcwpGP5iwQjognD4zRDz4
 JPnzrUHEP0l13Hy7Gb3gxig/qF+JOtWAmIploJLiLz0JanmUzeIYw4NX0qro72x2uyZ5
 Bhqb1yyUUZwZqrb46zecVBbOWcd+yHKd46dN9tr1UrvGoumjBL0P4lvqETD7A6HpdMTA
 czAQ==
X-Gm-Message-State: AOAM531C9/PCdgZx6yiJM1K5ALfzqGQIsNMamIHFR18M0+QTFasQ38RU
 GN3lyS2dKiwOXvzO1Q6wSIZopQ==
X-Google-Smtp-Source: ABdhPJwk2smqvgptEJnw46UBkqHH5sjXfXDGxlkv1FFfTWhR+COGK7v2Bg8xIbe+LZRJgTPMlPpQFg==
X-Received: by 2002:a37:de08:: with SMTP id h8mr6941400qkj.0.1605367273113;
 Sat, 14 Nov 2020 07:21:13 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id h125sm8888368qkc.36.2020.11.14.07.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 07:21:12 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org,
	hch@lst.de
Subject: [RESEND PATCH v2 5/5] drm/msm: bump up the uapi version
Date: Sat, 14 Nov 2020 10:17:13 -0500
Message-Id: <20201114151717.5369-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201114151717.5369-1-jonathan@marek.ca>
References: <20201114151717.5369-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Increase the minor version to indicate the presence of new features.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3f17acdf6594..7230d3c0eee5 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -39,9 +39,10 @@
  *           GEM object's debug name
  * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
  * - 1.6.0 - Syncobj support
+ * - 1.7.0 - MSM_BO_CACHED_COHERENT and DRM_IOCTL_MSM_GEM_SYNC_CACHE
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	6
+#define MSM_VERSION_MINOR	7
 #define MSM_VERSION_PATCHLEVEL	0
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

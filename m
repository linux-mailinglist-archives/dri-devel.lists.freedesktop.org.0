Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF9085E25F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 17:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A8F10E7F6;
	Wed, 21 Feb 2024 16:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="GjlDSs5v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5228F10E7D7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 16:02:33 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-60886665c25so11114137b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 08:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708531352; x=1709136152;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=pXMOhwD5qEr4jMu4yu+cDm4xZSeU+k4T71jhjLqjWWI=;
 b=GjlDSs5v4A6YfuzK9rj2Ks6yqUgDPealTHYNMXutX69J9doeSaxh+dLNxU/p9Fj7yG
 qg3X06GxvjrVn1ejI11eUTCGErl7zB5kgmXyOSge4KCtjsP4I799SOGMPP/LbOFVxvqh
 u8/JLCttg3etnyJ73CFipruI72ACm0RylVI9DHC229yMbelFGie3/pK3xcL3N8yoXeAi
 bwwdDBHO1MEzKCVJXYmFguxR1E6b/v2LtcVhe3KVLDPD3X4X3h7/gSETxg1QAeLOKkzh
 M5aqMb0cuZwpME9XAKVCcu9KVnkAL/AdoZ7U9jvFb2wv00onH5LuCYJOR61NupJis9wN
 RGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708531352; x=1709136152;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pXMOhwD5qEr4jMu4yu+cDm4xZSeU+k4T71jhjLqjWWI=;
 b=mjeEb/5fLXI//LdNIHqjDuvz8BOdpMKPNLfXUeOosO7bM5KJEhlbIJd9x5aktS0Kav
 hSDrRRtoav5YJZURQ3Zr2kJACyqTujozbLOIam6kZu3D+KOoqFTW8lbWB5rBNrsfVFiF
 vpqDuU18GYuakSymggRGhjzR5EJ5X9nyW4SFffMJLHRbisBXsldS75p9CTtKn0GCyswq
 +sP+FnWOhSNGOhLlcckeDDEfMqbANiyJcLAEROtmi7r30crGrlXmx4dgadBW6kASVmaL
 kQ9TjHtUOzPMeCMchLIIeIN9S2pdseLJeVjBVP97INy1ekjjGb9yII2DjSu5EsQSUPQr
 uATA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQomJT8N9Lhlvb+UXuHpHroCkJSxdvmo8sffa4QHMUJugqL3oeZEYq/J1zlh0Z0uj9c9F/wDVcEUrUmymCIIMWVQ/aa3ChT2VyZM73Q2Io
X-Gm-Message-State: AOJu0YzmX38C5JUPqYsjo4kvtCwFFD8wZ9MjHZXLO2W3LxW1av+oO+ZR
 Hl28mrnbDJljGIMJVqAW/DD2vAG9hhyer0PysidoEp5opJ62NWVcn2AL5CnUxXG7YeferphHdTR
 Zd3zlPoWzjQ==
X-Google-Smtp-Source: AGHT+IEQSmE+pix24dTxLHfotoQgbv1Z0gXzz2ZnjnupyHoB1Vw6PlSxU+BraxbINWyowl3J+NqG5SJCyd+0Bg==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:690c:a:b0:608:2104:5c64 with SMTP id
 bc10-20020a05690c000a00b0060821045c64mr2767809ywb.3.1708531352282; Wed, 21
 Feb 2024 08:02:32 -0800 (PST)
Date: Wed, 21 Feb 2024 16:02:07 +0000
In-Reply-To: <20240221160215.484151-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221160215.484151-2-panikiel@google.com>
Subject: [PATCH v2 1/9] media: v4l2-subdev: Add a pad variant of
 .query_dv_timings()
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 chromeos-krk-upstreaming@google.com, ribalda@chromium.org, 
 "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Currently, .query_dv_timings() is defined as a video callback without
a pad argument. This is a problem if the subdevice can have different
dv timings for each pad (e.g. a DisplayPort receiver with multiple
virtual channels).

To solve this, add a pad variant of this callback which includes
the pad number as an argument.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 11 +++++++++++
 include/media/v4l2-subdev.h           |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-cor=
e/v4l2-subdev.c
index 4c6198c48dd6..11f865dd19b4 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -389,6 +389,16 @@ static int call_enum_dv_timings(struct v4l2_subdev *sd=
,
 	       sd->ops->pad->enum_dv_timings(sd, dvt);
 }
=20
+static int call_query_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_dv_timings *timings)
+{
+	if (!timings)
+		return -EINVAL;
+
+	return check_pad(sd, pad) ? :
+	       sd->ops->pad->query_dv_timings(sd, pad, timings);
+}
+
 static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 				struct v4l2_mbus_config *config)
 {
@@ -489,6 +499,7 @@ static const struct v4l2_subdev_pad_ops v4l2_subdev_cal=
l_pad_wrappers =3D {
 	.set_edid		=3D call_set_edid,
 	.dv_timings_cap		=3D call_dv_timings_cap,
 	.enum_dv_timings	=3D call_enum_dv_timings,
+	.query_dv_timings	=3D call_query_dv_timings,
 	.get_frame_desc		=3D call_get_frame_desc,
 	.get_mbus_config	=3D call_get_mbus_config,
 };
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index a9e6b8146279..dc8963fa5a06 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -797,6 +797,9 @@ struct v4l2_subdev_state {
  * @enum_dv_timings: callback for VIDIOC_SUBDEV_ENUM_DV_TIMINGS() ioctl ha=
ndler
  *		     code.
  *
+ * @query_dv_timings: same as query_dv_timings() from v4l2_subdev_video_op=
s,
+ *		      but with additional pad argument.
+ *
  * @link_validate: used by the media controller code to check if the links
  *		   that belongs to a pipeline can be used for stream.
  *
@@ -868,6 +871,8 @@ struct v4l2_subdev_pad_ops {
 			      struct v4l2_dv_timings_cap *cap);
 	int (*enum_dv_timings)(struct v4l2_subdev *sd,
 			       struct v4l2_enum_dv_timings *timings);
+	int (*query_dv_timings)(struct v4l2_subdev *sd, unsigned int pad,
+				struct v4l2_dv_timings *timings);
 #ifdef CONFIG_MEDIA_CONTROLLER
 	int (*link_validate)(struct v4l2_subdev *sd, struct media_link *link,
 			     struct v4l2_subdev_format *source_fmt,
--=20
2.44.0.rc0.258.g7320e95886-goog


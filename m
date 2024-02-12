Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D792C85146D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928AB10ED3C;
	Mon, 12 Feb 2024 13:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0IAgruZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5253210ED30
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:14:22 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-410422e8cd1so19338275e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 05:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1707743659; x=1708348459;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=9j4Lx9tyhvatf/UB1EXBEYAcw6HSL3npB5akS3xX/6Q=;
 b=0IAgruZEDSiuyDuvkzIKK/EwWg1csF0Qncovjt/PT2tAraGmILQyoGu2xjG6GjTAAQ
 ja018bpefRLe51PVqL8IhozvkKeOTZSwgLMW+rizcMS6390Bsn9QiUpUgYgr2OEap8DG
 XWQ/TvTxM7BEL0XDnCs/Qo0slCTNx457cJcIQqcpLlvJGMTaxGWex9nSt1J4RM5KeAPh
 ys3bCIEtHLDte85CmjdcOQDVZECN5qXkNNg6rzSl+N/8ncNsay/RAV42kLyFCBs4m252
 rpci0ITvceqiM8t+VGaLRO9QHCuJtw50sBLHhP/6JZ0wSe4MXivOj+2S5pPwtn4oOEyK
 4WLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707743659; x=1708348459;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9j4Lx9tyhvatf/UB1EXBEYAcw6HSL3npB5akS3xX/6Q=;
 b=sKu77iklLzCV9ZdiQTJhpdYKJ4PKTb5q+Q4Q6mivGSmJSH8txfWUR2lULcKYzwTNVw
 9xHRM8Yaz8YVVONyS6ZUGUhDN7j11KVBlIBNaoajVR72FzMqN9uPqzUgsq8nKATVEUE5
 KK+29q+PqX11oKCfS8cjTD4tqKLyH6UlwYl/djBwr55GLFAk3AfTKXJ1Z/rgdltyM4/R
 LL7C2gJP30cunmMMoZlYYIQUdClCw1nmzgqc/lUwLjvcLqBpDYKef2uqAnbj8gCvl0OI
 Bc0x7g031Pd2ZSu08r2LRA39X7VufXy7azgrK0PPwjUFSjVe/W5d0NnHOUWy7Pdc08dV
 uipA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0dNlxdScN7uUl/apBSi4RVwKLqoIYayjVYp3SsAhyQk/gkTqungjaWkn3aPidehX3UaK5fstJV4KaRSWaM4DmdpEWwiToWr/0YqaZqddY
X-Gm-Message-State: AOJu0YyJrV/RLADBFwRk6ZfmDN2S/Gs3TR4I+W72VKLHJainlK97Zpy5
 AxfqlYz0pB8ZmzFmAmW0JITmcH3dbyvsv74w+Vm1IfAZYW8Jp6W+8lN1JxGa7qZ+0KHeSDW8BZ1
 OftXHgNoTOw==
X-Google-Smtp-Source: AGHT+IHdGf1zsqlIjaw5dRK/aSKf1uPqY+pJGSDB6Zn96kKbNMcrq4+wzpwRbGGHfIXhRNnKW33OovqNk+ntOg==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a7b:c2b2:0:b0:410:c0e6:c975 with SMTP id
 c18-20020a7bc2b2000000b00410c0e6c975mr12370wmk.4.1707743658932; Mon, 12 Feb
 2024 05:14:18 -0800 (PST)
Date: Mon, 12 Feb 2024 13:13:15 +0000
In-Reply-To: <20240212131323.2162161-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240212131323.2162161-1-panikiel@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240212131323.2162161-2-panikiel@google.com>
Subject: [PATCH 1/9] media: v4l2-subdev: Add a pad variant of
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
2.43.0.687.g38aa6559b0-goog


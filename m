Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32948CD4317
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 17:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81EA810E030;
	Sun, 21 Dec 2025 16:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nChQO6YV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctzvyT/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BEE10E030
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 16:57:44 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BLEJUVu2378453
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 16:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=bN7W8KuZTb2DirG3bJS9nOTczWMfVRtYjIE
 WaxsTlhQ=; b=nChQO6YVdWJ/36aFmgJFoyt2k0fZLABFDaX178In4m2hbQlkGut
 W0o35lFehl7X208DYvazaGVarSrStAgyhsDP+06pyJjp1dNJ50cBkjSMwmTAscS+
 On9ILbLrjf3FGOoWDPq1XDTZg/Auj1ePMjtL+k2gGqtTyBBMO+d5vCn3AfdjPmHw
 FYrVWl/Bf6qMdVd0vMKuMTGbofm0dIIIEM/JiG/TkBjaWac9yIeFy2mbmwIEq/+m
 UO8JuLcLwbB1WaD+GHz+Rg59nwB46d8Pbhgwl1PdXIYlpb3IWRFrpEUGPWSM9u3b
 uMJfc6dmDkdYegLwE0nG7xU1Z6nyp8bABRQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqjkf7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 16:57:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4f4a5dba954so76041071cf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 08:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766336263; x=1766941063;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bN7W8KuZTb2DirG3bJS9nOTczWMfVRtYjIEWaxsTlhQ=;
 b=ctzvyT/bgTtSSZjTbB1jPQapbB1TV04uU0uCVbawCSNjXEZ9It92Sdxy4CRVtKxijx
 zLg+i+MZ0C+OkGTn6D9XYXRwRRzOsWua5z3GxZIZKGgShOW4iRVI8ck+Tlt6ZYuHzGRV
 S10Gwbz1C2jagTLA1OJ/bIWM1L+AKsbX0ESptaZVpfFK9eB+IvltW+F+LRcEmNtA5GNt
 /3VsxQm0kqCIo2B4cwdmqX8zYzPa9ybGX29c+vCIhCp4FKOhZ2dcoufLQ/jic+RIXmwe
 2akppm/EV/g5m3JMPMamU8tgoC33FiQ0QmCkqLzktXmTDXmUWFNcsXfMITzWuMoyq6Sv
 eDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766336263; x=1766941063;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bN7W8KuZTb2DirG3bJS9nOTczWMfVRtYjIEWaxsTlhQ=;
 b=Rqg0RCrLODMa7eASn3di24BT1ShaqiFDtQ+a1dDnnDcEEzQ8NGmps68O8bYB3UH3Is
 TY83Wnh1le5M1Djp08a8xvFUe+w8oQn9+Bw+zZMlQJXtRNVEJh7+xbBitosP1TjhHnOt
 nL2PErljeth8YFWwO09wyUnHrkGddiBsoLph44RFaRVPs5SLAum2V2Wgpa6jCjcbWdLi
 o8g1q3RuQT7O1hFTO1a2XB4fq/dYXUWhTmId1t6raSumWcgxVwCpHa8JkBkoAPTGLutl
 BMhMivVlfsVqAlzYsxbrf6nDKlrgOywuTJgOG/T5iuEpSU5b4BSsda9VofBo/BCEkjZG
 fodw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLg7aa6MTuNNRYNUIl1lRg/D+8tUydXVmtopnuHSt4exEwrLX37TXIEjj4J0WYO5XVRqe3Rb1Ys9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjlDkv6thFeNqaLmB3ErSrP+ysy7mhK1FVeuUCEr2NqABPLwCM
 h3ktpEp7YO+MS/eDBoTRz94AVzaIqNlLyKSk4IzRO9g9Ty8TqukNQhLmLx+D9cLZ78YKyjK/h10
 4GxWI/L9rUx5Tj90zHZPdH144GB+mRLHm5CEzqt3Ec1cuIVLCDONG39f6CiqXuQpF6Pu559g=
X-Gm-Gg: AY/fxX6e0NqgKQ9TVVpI2+YPyKtURTHjyrkZKdZTXJaFZbg552v2FLzrxit0RQEsEsQ
 rajKYGtGUmY2lCxRM+OHZEBtHpuYAvVgk52YsSUaV30iXumoIy8F+PMLzM2aEBL19i0vLMRjqR0
 r3uU68r7FA++OQPPS4REnbg1XuVCkzf1TIpdsNmWKC3EljbLWyk/2655WfcZlQ46yjajy65ejak
 jyTTfByKm/HDjqNK4GCfSgeOWrIPKNJfOnfavKaMiQMlG1CIfpzPaU85fhBPcO+qYh0gOTFnXAm
 TadLK6FKFRxBU0YAQ5cJdF27WDiy4+JErZoCiqRr9TbO9GWhfLBkfvXAVQAqXhmYl/BfnJj192Q
 XgHIOzC0MhfBNQ5XIb4cA/BNZjt/JjWbOKUbfrurtJ+9aWxROHI1lxpB3vhJgPnK3usA2ZLw6ZY
 Ydl3thABzudOMKy955otIFUbKW
X-Received: by 2002:a05:622a:588e:b0:4f0:24e2:8de6 with SMTP id
 d75a77b69052e-4f4abd9765emr147790521cf.64.1766336263061; 
 Sun, 21 Dec 2025 08:57:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDrLWQigAphc9gZx4ySp95tJ7pg8YC1s9DqWguNVNoGK8HW9bCnd0hfLpMD8fq2gEg1xMSCw==
X-Received: by 2002:a05:622a:588e:b0:4f0:24e2:8de6 with SMTP id
 d75a77b69052e-4f4abd9765emr147790231cf.64.1766336262551; 
 Sun, 21 Dec 2025 08:57:42 -0800 (PST)
Received: from shalem
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f09149sm807070166b.47.2025.12.21.08.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Dec 2025 08:57:41 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 stable@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] fbdev: Use device_create_with_groups() to fix sysfs groups
 registration race
Date: Sun, 21 Dec 2025 17:57:40 +0100
Message-ID: <20251221165740.15821-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sgaUd8tpkWj7uFInLh8YB3rKh6_5ikIy
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=69482707 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mFxE72mproX8ypq736UA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: sgaUd8tpkWj7uFInLh8YB3rKh6_5ikIy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIxMDE1OSBTYWx0ZWRfX4MIZiXZPCGHO
 v0BSFAS6VuVHI+0c2opXt98PNRHe87oa69iYdsgtYiIXXo7L4T8EJcazMvParXVveGJO2YX0gPA
 G2HGYw5EUMnpeXgxro4SuvGodL6Q8Teoiv6ZsT4ds44szmHYVbUjSIGx8waoymUc9w3045P5AoM
 uDCn7f5izVQn3bJhZAqk8RIKuJJow/AYtGFL3abCm/aUKImWrpesSSeNYjBeWHOyI9tUpBExwnc
 EMCe0pQsR4Tc1ksX4sO0dL+l91z4PftdGbMPhAqPAT0eg/ozr1sUvzDGDMoM8fc+v8fS5QB2BEL
 Go4ZW6TCBJd5heklzLqKkm1VviiFiaUdRYl4FGwJxQz4ReYfK3PTBp1h4aYMcYXvuft/nD1CwfG
 F0VdUrF8sygDEAMMhjrSNFLMyYK6yyc9iYxdtGhP/EWSTmXbdhvPsjq5PLKk4fHaNK0DC6HEl3n
 awhctqCvh9dgjupvOsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512210159
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

The fbdev sysfs attributes are registered after sending the uevent for
the device creation, leaving a race window where e.g. udev rules may
not be able to access the sysfs attributes because the registration is
not done yet.

Fix this by switching to device_create_with_groups(). This also results in
a nice cleanup. After switching to device_create_with_groups() all that
is left of fb_init_device() is setting the drvdata and that can be passed
to device_create[_with_groups]() too. After which fb_init_device() can
be completely removed.

Dropping fb_init_device() + fb_cleanup_device() in turn allows removing
fb_info.class_flag as they were the only user of this field.

Fixes: 5fc830d6aca1 ("fbdev: Register sysfs groups through device_add_group")
Cc: stable@vger.kernel.org
Cc: Shixiong Ou <oushixiong@kylinos.cn>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Note the fixes tag is technically wrong. This race has existed forever.
The commit I picked for the fixes tag is a dependency of this change not
the commit introducing the race. I don't believe that backporting this
back any further is useful which is why I went with this commit.
---
 drivers/video/fbdev/core/fbsysfs.c | 36 +++---------------------------
 include/linux/fb.h                 |  1 -
 2 files changed, 3 insertions(+), 34 deletions(-)

diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index b8344c40073b..baa2bae0fb5b 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -12,8 +12,6 @@
 
 #include "fb_internal.h"
 
-#define FB_SYSFS_FLAG_ATTR 1
-
 static int activate(struct fb_info *fb_info, struct fb_var_screeninfo *var)
 {
 	int err;
@@ -451,33 +449,7 @@ static struct attribute *fb_device_attrs[] = {
 	NULL,
 };
 
-static const struct attribute_group fb_device_attr_group = {
-	.attrs          = fb_device_attrs,
-};
-
-static int fb_init_device(struct fb_info *fb_info)
-{
-	int ret;
-
-	dev_set_drvdata(fb_info->dev, fb_info);
-
-	fb_info->class_flag |= FB_SYSFS_FLAG_ATTR;
-
-	ret = device_add_group(fb_info->dev, &fb_device_attr_group);
-	if (ret)
-		fb_info->class_flag &= ~FB_SYSFS_FLAG_ATTR;
-
-	return 0;
-}
-
-static void fb_cleanup_device(struct fb_info *fb_info)
-{
-	if (fb_info->class_flag & FB_SYSFS_FLAG_ATTR) {
-		device_remove_group(fb_info->dev, &fb_device_attr_group);
-
-		fb_info->class_flag &= ~FB_SYSFS_FLAG_ATTR;
-	}
-}
+ATTRIBUTE_GROUPS(fb_device);
 
 int fb_device_create(struct fb_info *fb_info)
 {
@@ -485,14 +457,13 @@ int fb_device_create(struct fb_info *fb_info)
 	dev_t devt = MKDEV(FB_MAJOR, node);
 	int ret;
 
-	fb_info->dev = device_create(fb_class, fb_info->device, devt, NULL, "fb%d", node);
+	fb_info->dev = device_create_with_groups(fb_class, fb_info->device, devt, fb_info,
+						 fb_device_groups, "fb%d", node);
 	if (IS_ERR(fb_info->dev)) {
 		/* Not fatal */
 		ret = PTR_ERR(fb_info->dev);
 		pr_warn("Unable to create device for framebuffer %d; error %d\n", node, ret);
 		fb_info->dev = NULL;
-	} else {
-		fb_init_device(fb_info);
 	}
 
 	return 0;
@@ -505,7 +476,6 @@ void fb_device_destroy(struct fb_info *fb_info)
 	if (!fb_info->dev)
 		return;
 
-	fb_cleanup_device(fb_info);
 	device_destroy(fb_class, devt);
 	fb_info->dev = NULL;
 }
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 05cc251035da..c3302d513546 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -497,7 +497,6 @@ struct fb_info {
 #if defined(CONFIG_FB_DEVICE)
 	struct device *dev;		/* This is this fb device */
 #endif
-	int class_flag;                    /* private sysfs flags */
 #ifdef CONFIG_FB_TILEBLITTING
 	struct fb_tile_ops *tileops;    /* Tile Blitting */
 #endif
-- 
2.52.0


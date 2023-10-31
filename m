Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB877DCFF3
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 16:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320D310E51F;
	Tue, 31 Oct 2023 15:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507EA10E147
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 15:13:50 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39VCJjRf013616; Tue, 31 Oct 2023 15:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=LlMPaIZm0OIaosP7B9Bi8LDXMsgJLgjM26UTMrYeXVA=; b=IoH
 VfGogRLXrX8gNC/SlNQPMP31Xuylr+HGwlVlGlMDrCIa4AGE0a+TbqOhfKlqPLNf
 7v+qDr93P3hicajnqWKMw8ZNJy2k4ffyo3/QgOW8+NwSsrJTQqaB4JwCkUju1xIf
 o3uZvQboH3qa8eC26Bg0Q81F8lVrMfjZKyM8gASFmvBYfKBkPlULu4YGbxty6yH8
 +xIHm1iAL8PMKYa8yTskHxC/ORtWD7XFwmqv7bauzXzWOm+jzR+TRU0hP3gaN0T3
 ng6UE5qqobeWySVEv4f1q19tLAFgCzVg8cJwGd9cEwt6kfUY1qHmM8xZuVnCU6ht
 ZnZI7W6yb6MiF8XWd3w==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3u0rjntf42-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Oct 2023 15:13:28 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 15:13:28 +0000
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.51) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Tue, 31 Oct 2023 15:13:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHW0L+jEBHwI5mZzUldxoAJ62hyn2p4I4VtctiDNw1BMLbe/+8Tng5nDj/N645BJto3c146uSSPqeeLBCe5hrKnNibXlZu0mSkrDh4WH3Pep9ebxA2ImeC4mGwMI60/5q8gW0BtQ5QSjjRSr0AuLA/LaTCeY7fvgEsaPiSQOWvTHbywFBy5j6x6zgxrqVqEtzVbKW3luUz+tS58Hj9NCXOYh7k7Qv0bMVkW+x5RdGztt42SheBya19TLY1RD2OtKrwiL2RrbVWoMFmswBIU0jp8mg19ExnEthA7v91YhMcDffI81gSr9A6F5mxLGBdRfL2fIVQ83tqm2RA6u/rIl4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlMPaIZm0OIaosP7B9Bi8LDXMsgJLgjM26UTMrYeXVA=;
 b=iGD0ZNIJWbJCSmqmcvkbOyR+CLZ141wNol+EorccY3nWtqDLCpUCpEwiR+Vmyl2aVuQ0nZZMat3QXoCz7c8+UnGGkb8hVxPnxjnQMtVKAXN1fHA7Zi3VyRG9PPz2AzuP3pgaxR16KWIj1YI8kZGddpH2eU8BrRTbhNbfpUpS84dqAyvSZaKc5r8UEFAOuUjy58CHzMTD82zXmV4mZO3Lq7rQqS9q+v4AwrdzMykAqfPklYJxCJdjFeVuLBZ/fwSjqaozDDAybq/3i1zqA2SaCTg6MG5x4lLsH2Q7aA9rN/hGCRo3gK6ZqOi61mdjU1PXdAx1zvEifINvTL+5EfqFeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlMPaIZm0OIaosP7B9Bi8LDXMsgJLgjM26UTMrYeXVA=;
 b=La/XW0ZTSy3L9zsCEO9MfmB+cGXfsZQorM+a3QjQvhcYrhnosJ0RisdfXvOl5vq58zF6J0sFN6vhRMSo2AlClJcRAUzrzRueSKAATWxYwggovrMo1WTqYuhBpkFK31IqxqwUFz34cXMB1E77jA0UyGA4WHACuztOhmWnnUES32g=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB2018.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:6a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.25; Tue, 31 Oct
 2023 15:13:26 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086%5]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 15:13:26 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 20/20] drm/imagination: Add driver documentation
Date: Tue, 31 Oct 2023 15:12:57 +0000
Message-Id: <20231031151257.90350-21-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231031151257.90350-1-sarah.walker@imgtec.com>
References: <20231031151257.90350-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0301.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::18) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|CWLP265MB2018:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf6842c-5e16-48c2-957d-08dbda23ee4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pKH3a/NhjsImC56InRkxcjGM//qKz5O3YzxA0sVVfHR8ySOOTWbdzscQFMFfMwbCf8vDcHJm8RTg6nYMaVKRDjK7QdTydnLIOQsdL5k5cZoYbDV2XhKWTB/M91PxBxX6EH3vs965l1imugkJHrE/X3xDibzfwzTx0yAc3fIUKbrWSPMpoQxl/nq65LfMvvVEg1HsuDa0x3txtMrTlgT4wXfcGeTH/3YKiq+0twrPYoYO9WG167x2JeMeo9lcc5nU0nb1IA3Vz+We2WWbWJOQZBfhWoX4aHYISJ3KawFXXoR429TP1jjI2MuHzcQFyq+v0uNiS5ckjow9qJqHh9ug66mCChHp4Y1lq2x8MHXNflqKSEcqmsQjQqc4apthInwB1GqPXZDJIev/EqPLAD/jtvSaYgqAan5Ur4ywKQTHC3AnrL9Hzw+ZsNPGqDbswFtRSveuVaeK1WjkQfqghQs2PE7B4PkHHVzVyUdnyY/r+w+QyeT4KZ/RTq3oQ/bh67FE1GU30Q8OKKcLmEeACAMAix80lquXJoYg/gjFex1NbG5vBlzDYA5KSnpHXZdTMVKn68Sc1VXsrXult9jC9wLPm76d61//O0j2alN+rg8lbP7cAaANb1G/tVKoq8JDeew3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39850400004)(346002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(7416002)(41300700001)(5660300002)(44832011)(8676002)(4326008)(8936002)(38350700005)(36756003)(86362001)(38100700002)(107886003)(1076003)(316002)(6916009)(66946007)(66476007)(66556008)(2616005)(478600001)(6666004)(26005)(6512007)(6506007)(52116002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AfyeOS3rWX4IXA5/VW1h4KeRUn8uYZs3jNBXRVN/RXukj/0e3lPI2oqCossw?=
 =?us-ascii?Q?VjHIJ5nhNKzEw2l7yO6gW2c3/r+jC7i/3TP8KrMLpB4rFYQQF3NSTQR+2rKZ?=
 =?us-ascii?Q?4f69pqnEUsCeASUuqOcr11+pIZ49Gb4D1lHTU9C9vy615crhu7oMZOIwMKrb?=
 =?us-ascii?Q?SqGrjTsnnX16cXf6K3CvgM02NH35etXQoWVJXPgU8yDNKjnTnMlGUpo/kNdq?=
 =?us-ascii?Q?2z+8YkzSp50Oryxr+u0kvZYcrcgRHdehWXcyI3iUDEvehhJ1i3TIQZkgIJXk?=
 =?us-ascii?Q?/GhOP51VO6ZEmZIx7DmfaGRcOgY7rHqbjxetwPZQizdoptLhExIvXRnvtJ8V?=
 =?us-ascii?Q?u2wsx9X3Sihj74AWN93r+2j+YZQHnOOy/YXgLgW8eChsdZ//oNd1+BdQ1+z1?=
 =?us-ascii?Q?e+di6ppNIxvTmPcmxVllXbaEb3g/9RHDX64sU1bJf4zrwA0sDF0nG4RSYJ2y?=
 =?us-ascii?Q?R1kvcn5aceL7AHujN/zzSILUy6GtJhw1T9xhK7+oU2WeGOWOXvvNw04tVq5F?=
 =?us-ascii?Q?cGpb0NwDi4EUyt78U7JNJR1e0MeRauZVvZvPHpPgYfKpAnbhqWmIvI/WSiEW?=
 =?us-ascii?Q?TNnrE71rvZ/PtIx+e3AHI7yUDHZ1xwaqlaVQC00GNYoFxEwELp9TaQfRU0vJ?=
 =?us-ascii?Q?f2uWXG6YUIO1pQvRM3FsQRmjLjog0USHDdPFuHA4C2o+VTWOCOX/rPKgOypv?=
 =?us-ascii?Q?7NiQn21P2aHrVeIUqW+rd/Yfs3QQlmWvLlPf5tInpAWHD8gNlPolMR6MhmaT?=
 =?us-ascii?Q?ElR8UDd+l8JSGEacDrNIkpIzdilJgDg8MZ3NTVkoGzVeSx5AmqaMW00KU7Tw?=
 =?us-ascii?Q?7l+33HAf5nVPqUHde1f3Xj3wPBCL7HKqb9xeKI4s1U2NQjSRv84aNXBwM5G9?=
 =?us-ascii?Q?jyAJ1bqHtBv8E5NMyk+84i0Ywq/a0Z6lkVwgIY9JQotNJoDrI0TnmdWve3S1?=
 =?us-ascii?Q?J3bUmKqMzpEDs8+uqyLE9exIf23r6FRgz3II9mRwcXvEj+b6lV1I9HPJH02V?=
 =?us-ascii?Q?8ZEM3Z0XxenDUGaKl3T3YDx/+HvRHYwsZdZ2AI5XaQRoio5BR5uLxkfu9neI?=
 =?us-ascii?Q?WZEeG6Q+7cMKdadReSB3tqBgUuYpVkQt/ZV6ow2yDXBQEpQVYVtVjjhPEgCH?=
 =?us-ascii?Q?1qeP1wPDY9F7ASOm3hztI0f1dtDdxW4vCMR4HJ1njRJKyOdqvtIDpPvjgwsd?=
 =?us-ascii?Q?Jg9zT00v5Cp5IWLgdbH25GlKihTgiGgyxckNDmiFPGFPVvdQ3oao8ZiY77wD?=
 =?us-ascii?Q?oun0ATgP3YCHa6fcP7qdArdwkzyKV37t4zz3hj1R8VzxzYcrtuCQbWMxVbEr?=
 =?us-ascii?Q?O6UOSZSzcp6H1ksXP5psI/3zPhmKJto1waafY8iSnIAc5o9HbRddBOXxX5rD?=
 =?us-ascii?Q?Ub1cQl8TfoxGQITNfShO+mhPiFmcEagHjAZEBoNJ+0c29mymOvENtgm5CWqq?=
 =?us-ascii?Q?9BiRgMF490rK0G++zXkMxevlIo307z8SJnlo9ItUrXKxQWyMSv9/IIbfpfQQ?=
 =?us-ascii?Q?+UI9yS4ldOQYt3TrJwVbBz0sQ78hKiTvmknr0yhNcNYewUwG6/suoh5G/OIJ?=
 =?us-ascii?Q?LBE+YGgBIbJZ8VdNDu9xxeQJQEao/eNnqC71tymesdmWSq/HhF9TWS2t7P+0?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf6842c-5e16-48c2-957d-08dbda23ee4a
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 15:13:26.0763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZsylP04SPcl/U3Yebvb6/BkYjBIXKLQaN4i9WE7gF4TtTddwXmpfUfxQj26d8KJnWJs3Av88tyOCjFlN1S3HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2018
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: u5c7F83SyKU4oAlSVw8-n1jF5EGKDz5A
X-Proofpoint-ORIG-GUID: u5c7F83SyKU4oAlSVw8-n1jF5EGKDz5A
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 krzysztof.kozlowski+dt@linaro.org, matthew.brost@intel.com, corbet@lwn.net,
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org,
 Matt Coster <matt.coster@imgtec.com>, robh+dt@kernel.org,
 faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for the UAPI.

Changes since v5:
- Remove obsolete VM documentation

Co-developed-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Co-developed-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/drivers.rst           |   2 +
 Documentation/gpu/imagination/index.rst |  13 ++
 Documentation/gpu/imagination/uapi.rst  | 174 ++++++++++++++++++++++++
 MAINTAINERS                             |   1 +
 4 files changed, 190 insertions(+)
 create mode 100644 Documentation/gpu/imagination/index.rst
 create mode 100644 Documentation/gpu/imagination/uapi.rst

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index 45a12e552091..cc6535f5f28c 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -3,9 +3,11 @@ GPU Driver Documentation
 ========================
 
 .. toctree::
+   :maxdepth: 3
 
    amdgpu/index
    i915
+   imagination/index
    mcde
    meson
    pl111
diff --git a/Documentation/gpu/imagination/index.rst b/Documentation/gpu/imagination/index.rst
new file mode 100644
index 000000000000..dc9579e758c3
--- /dev/null
+++ b/Documentation/gpu/imagination/index.rst
@@ -0,0 +1,13 @@
+=======================================
+drm/imagination PowerVR Graphics Driver
+=======================================
+
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_drv.c
+   :doc: PowerVR Graphics Driver
+
+Contents
+========
+.. toctree::
+   :maxdepth: 2
+
+   uapi
diff --git a/Documentation/gpu/imagination/uapi.rst b/Documentation/gpu/imagination/uapi.rst
new file mode 100644
index 000000000000..2227ea7e6222
--- /dev/null
+++ b/Documentation/gpu/imagination/uapi.rst
@@ -0,0 +1,174 @@
+====
+UAPI
+====
+The sources associated with this section can be found in ``pvr_drm.h``.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR UAPI
+
+OBJECT ARRAYS
+=============
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_obj_array
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: DRM_PVR_OBJ_ARRAY
+
+IOCTLS
+======
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL interface
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: PVR_IOCTL
+
+DEV_QUERY
+---------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL DEV_QUERY interface
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_dev_query
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_dev_query_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_dev_query_gpu_info
+                 drm_pvr_dev_query_runtime_info
+                 drm_pvr_dev_query_hwrt_info
+                 drm_pvr_dev_query_quirks
+                 drm_pvr_dev_query_enhancements
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_heap_id
+                 drm_pvr_heap
+                 drm_pvr_dev_query_heap_info
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_static_data_area_usage
+                 drm_pvr_static_data_area
+                 drm_pvr_dev_query_static_data_areas
+
+CREATE_BO
+---------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL CREATE_BO interface
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_create_bo_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for CREATE_BO
+
+GET_BO_MMAP_OFFSET
+------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL GET_BO_MMAP_OFFSET interface
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_get_bo_mmap_offset_args
+
+CREATE_VM_CONTEXT and DESTROY_VM_CONTEXT
+----------------------------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL CREATE_VM_CONTEXT and DESTROY_VM_CONTEXT interfaces
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_create_vm_context_args
+                 drm_pvr_ioctl_destroy_vm_context_args
+
+VM_MAP and VM_UNMAP
+-------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL VM_MAP and VM_UNMAP interfaces
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_vm_map_args
+                 drm_pvr_ioctl_vm_unmap_args
+
+CREATE_CONTEXT and DESTROY_CONTEXT
+----------------------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL CREATE_CONTEXT and DESTROY_CONTEXT interfaces
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_create_context_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ctx_priority
+                 drm_pvr_ctx_type
+                 drm_pvr_static_render_context_state
+                 drm_pvr_static_render_context_state_format
+                 drm_pvr_reset_framework
+                 drm_pvr_reset_framework_format
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_destroy_context_args
+
+CREATE_FREE_LIST and DESTROY_FREE_LIST
+--------------------------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL CREATE_FREE_LIST and DESTROY_FREE_LIST interfaces
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_create_free_list_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_destroy_free_list_args
+
+CREATE_HWRT_DATASET and DESTROY_HWRT_DATASET
+--------------------------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL CREATE_HWRT_DATASET and DESTROY_HWRT_DATASET interfaces
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_create_hwrt_dataset_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_create_hwrt_geom_data_args
+                 drm_pvr_create_hwrt_rt_data_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_destroy_hwrt_dataset_args
+
+SUBMIT_JOBS
+-----------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL SUBMIT_JOBS interface
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for the drm_pvr_sync_op object.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_submit_jobs_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for SUBMIT_JOB ioctl geometry command.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for SUBMIT_JOB ioctl fragment command.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for SUBMIT_JOB ioctl compute command.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for SUBMIT_JOB ioctl transfer command.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_sync_op
+                 drm_pvr_job_type
+                 drm_pvr_hwrt_data_ref
+                 drm_pvr_job
+
+Internal notes
+==============
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_device.h
+   :doc: IOCTL validation helpers
+
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_device.h
+   :identifiers: PVR_STATIC_ASSERT_64BIT_ALIGNED PVR_IOCTL_UNION_PADDING_CHECK
+                 pvr_ioctl_union_padding_check
diff --git a/MAINTAINERS b/MAINTAINERS
index 8166ffd4349e..61aff30c856d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10265,6 +10265,7 @@ M:	Frank Binns <frank.binns@imgtec.com>
 M:	Donald Robson <donald.robson@imgtec.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
+F:	Documentation/gpu/imagination/
 F:	drivers/gpu/drm/imagination/
 F:	include/uapi/drm/pvr_drm.h
 
-- 
2.42.0


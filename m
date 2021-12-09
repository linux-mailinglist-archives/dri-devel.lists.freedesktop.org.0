Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BEE46F01C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D9510F663;
	Thu,  9 Dec 2021 16:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC6189F8B;
 Thu,  9 Dec 2021 15:47:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qn+gym92hsF2kVS3Lu/Wjd3ncI5I5zv54kxoh1Ix9qYTn+48odkrtSKEFjimVCjfWWN5bWgGR3304Guny5g2ovXd2MJfiOJBRAHrmCUdNXX0qpYFBNd4w2tJzmhv9pd8j0+edm9lbixdMZyxJD4oueSSxEjcbTzTstAPnlESiFsYGxKhGeLUFh+4OaJlFhlsFDA3GJx1P6StW94PlykzSqZRdIGA5dMbW2deVXjRKtNRanEnSaowGXT41W90TMqJkMiySDucwfryVBaesqNzjszWUH/0LVeRgtbrm8ZRV/NSagDP2OEb4bRt0akPrbR0NuXKOv55i78KCvzXZGxRKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ebzg5k8R32x8Idj/JNDVexhW1w4/gmFZ684v+KOXB8Y=;
 b=gITzaNCF+f6H3ciHrira8169dViqPLwByZpWq/HvcOuSBJRYGqPjHX9GK1IkdkFbsPCyMC+YP6Ju0JKneY+XreLEfHsn1qQrBaK5DV1jAvIRebFahyUYRMWcm84eSsXzUHW8Vn3Bh43Y28GF0FBjHEX23AA+EZoSIDkjm6JSWgxpl1x1CKjqBHCSQjR5ezMntCrXQW42usbQHeMjNlPqNhx6JVOGvJpDl1BfcaDegtSlVqBID0bb/EvTAt81W9u6WPelBhd62Anh2FQHja+LlGyYv73/7uznP3rwDxru3juhTTJ6yOXdUrJegLaUgOxTqAulAvj/Ezo9qkjQd1noYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ebzg5k8R32x8Idj/JNDVexhW1w4/gmFZ684v+KOXB8Y=;
 b=mOFlTyM5ViFMyEAUus7mGKYGZprol5+tOogxTZgTCTTnA+7FOIcpP5abhjon5wAtTq4ygEI/ysQ8uzaH5FZuCTNDTHc3DpvfyQAcSUQPGp18KsA5rjqecdIuX5pZBgqTZGoMI3WtLaYltvKCGZv1joi4Ve3GDktugPQhLZJXV7Y=
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BL0PR12MB4932.namprd12.prod.outlook.com (2603:10b6:208:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Thu, 9 Dec
 2021 15:47:06 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::98f9:b924:cedc:93ad]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::98f9:b924:cedc:93ad%5]) with mapi id 15.20.4778.013; Thu, 9 Dec 2021
 15:47:06 +0000
From: "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
To: Matthew Auld <matthew.auld@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4 2/6] drm: improve drm_buddy_alloc function
Thread-Topic: [PATCH v4 2/6] drm: improve drm_buddy_alloc function
Thread-Index: AQHX5tIvwAIFhGZ50kKJ8BjgcPe+Q6wqWbGg
Date: Thu, 9 Dec 2021 15:47:05 +0000
Message-ID: <MN2PR12MB4342EA8DD09D84589AE3C0A0E4709@MN2PR12MB4342.namprd12.prod.outlook.com>
References: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
 <20211201163938.133226-2-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20211201163938.133226-2-Arunpravin.PaneerSelvam@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-12-09T15:44:40Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=e4295bca-2dc4-49e7-807f-3b14cadfc79a;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_enabled: true
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_setdate: 2021-12-09T15:47:01Z
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_method: Standard
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_name: AMD Official Use
 Only-AIP 2.0
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_actionid: b6c32938-7da3-4a38-a745-5faf4efd42cf
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dda90f5f-31bb-4a3d-fee7-08d9bb2b270c
x-ms-traffictypediagnostic: BL0PR12MB4932:EE_
x-microsoft-antispam-prvs: <BL0PR12MB49320BF85AD8EEF71B8F7EFAE4709@BL0PR12MB4932.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:546;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BFbgHfv5MmDelzuVBMcfFokgLMg8P6PbxFu6HKtiphfz2hFBZI2flXJTUEKfJfJAdJnScw5Unhf++Xlcwowb9SNbilI7LH08fUTNCNfSixkzTjKz0voSz6HPcwym8xuD1Y8dYSiUsXing02mnjJJIhf0NYKHBza4dcyr4ST5KDfHV0kblI/Ne0ic6ap5oNKuJn3ku4vGZJH8U5W3nl+YwdYyNiGNc9ez7FkbrwwymEbQpZBneLyaed7yaolCLZk+q5SiCHcw95rsrvqAgxt6iJOtEYb2S650ra5eNlhRH8dijO7kRscUe1j0u88oCTlHeyU9nzMXMVgPWeNz3sbhwCL5w4ptrYz7o5Q/fYsSL9jX0757R2gU7TvmQzStbEO4zcmdAMXptPG/not22UTvhxzqkLY4pSkrrGWRO53Y/SCiPG10WjlPmP/hJOJiRzbQ6zrwIpaxiCnOynsG/2VESxP6aVXEXNuaKemQRH91yJi50LUJ/88JjABT0Rs8XztntrV0C5dBVb/6ZkDoQy2EOmqKcvi+bXxJFnDxk1beGeH3YNiuVxxYzTpgmYZjEQ4rTiC2JVEmGiQ+oHFt2n8+zRiBh25kXGbuBdGNgxHFcP2oB2nesxRw8il+nT9NfR3GCWbmiFEk4d4vobVkzSa7kQNjjwwib+6o8lfP/Dp8l67MkDbGquVKgItkd22NL6ISCPScDbK1/4PD0fchMS4w2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(76116006)(38070700005)(5660300002)(186003)(66476007)(66446008)(38100700002)(122000001)(6506007)(83380400001)(30864003)(316002)(52536014)(66946007)(66556008)(64756008)(4326008)(7696005)(2906002)(8676002)(8936002)(86362001)(54906003)(53546011)(55016003)(9686003)(26005)(33656002)(110136005)(508600001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ynKg6xFeYtSNfogPJmRS+8TnSB7uhuHlWwG6x1S5hGfV0c7ABciUxdA2eKLU?=
 =?us-ascii?Q?pFlgenYZt76a7tuRpYQ8Xvoml4rACBAGt8/rpwcMxGbxf+xPkRf55XoN4NQB?=
 =?us-ascii?Q?/7K9tjOIiyEJCCHHkN70QjyWuFid6LStIAxk12rcN4+6uHyWH8FMuOE7a5Mf?=
 =?us-ascii?Q?YYtrtGu3r02BdZ/NL3SAV874SRvx3Uq0TfIm2re2jqu77cS/PiQU+AX/w+A/?=
 =?us-ascii?Q?rgre8ZKTkiPnUfvMp6mVRHXz+ljqafAxnCmhsjYPYwmXfGedlCHdn5UMO1UQ?=
 =?us-ascii?Q?YBcBzuoa2K016lnXxZAj0JsjgOwUX1uqt6P5gQ+jp6x+RTLaujVHrDEHiKaz?=
 =?us-ascii?Q?8qdYMQjuIHQH879gugy/4sUewxQjlGDfnnejCt7tI2bqfBqNHYdC2Y5f+g3f?=
 =?us-ascii?Q?aXGpaYzTbd8AZEUhnF4LXS7iHOu0b0qA5/dgEEsoXi00l+kkvx+f6eC2x0n9?=
 =?us-ascii?Q?j4izBQqVB+Teofe+2rDPQ74orNooPXMw9vQesyTGr3yKmg7kZFpGv7MKWZne?=
 =?us-ascii?Q?VSrykzCpVzwOKGCSlPZ2zW7Ehv7iPAZKUI6QDc8soPOUMmWcxCBfrFe6zZxX?=
 =?us-ascii?Q?IpfW2DZSHQx4LL/5JVxQPcQcb3iqylYe4+aRg/q34bhd3XIVzVrv/qI7uQGg?=
 =?us-ascii?Q?FnAaJCrutXiZYERA4cjUOMNxMAqGKLWZtZECG7UxjHZ4cYTw8cIlVERPATN/?=
 =?us-ascii?Q?q6+0CizJWeGqancZCSVO6OcUE5vns4mcdwxux9kDQfXPkLGzP8HyaEKkmNkC?=
 =?us-ascii?Q?YV8U5E0rEMyqJttNV8wiVczKNk/FzFdMNDGfeuqQGpEb8tbgqZOJ4/e1ySl/?=
 =?us-ascii?Q?Rkq4HAqEc8CzkiuPZE0uIWJeccXW4/5qydJv068dYgXu8RDo1KSCw5+c95xv?=
 =?us-ascii?Q?Mr5t2DKsECYOQU/TC/j4F+NKJjo4CRWYzFsC1ne+SFMjf5PnBx5nK3t736i5?=
 =?us-ascii?Q?NUtgg/NUrA0jRCCTGMHdU8sVWVcx5hP6pcWdO1tCRWNRy5Fr7lErKgCgU1iV?=
 =?us-ascii?Q?I8VUIWDRYHv0IOIjZQU0+EJe1gh+ZVHZ5YAGma/flht1MIsyC01frl/qWk1S?=
 =?us-ascii?Q?XlI9KsFiBlpHzrLkabGHpoMkAm+MRWPiv+PVCvbK86tt1NLOhX2xqVIRkwNZ?=
 =?us-ascii?Q?EV8pPnvgb03VBzDLoqlgruIXijAqgrtD/reIxahFLStiEKnJsjwaiIaARgQe?=
 =?us-ascii?Q?Womw1/y1sD5yzoUaLWr5RpKVhdRY95ZOEqvvVnRDRWOKxbkx++ueAZpJv5x9?=
 =?us-ascii?Q?QKXECZ/UOSevAmusgoUYhBAZtlVHwHuliOsyGcXBI8kILm7bv6Fzl6MyPhxn?=
 =?us-ascii?Q?KC/WUDSyTNQH0E87SwCiMzK4vWQbNBxueUIM9y3uaPeigRjPJOZXwpe9EvaB?=
 =?us-ascii?Q?Q7ZHOLr3+CmW4l1nRaRGZqdp4Kp2VZOwZiY3nu7n18LWR3z6ylgZXh/7MhBP?=
 =?us-ascii?Q?rxw4LQHjC9DKHSA4gSRSNp8vVmQdun+Ba/Z/HvhnW3MqvFA4wIwJUYoUmu7T?=
 =?us-ascii?Q?Ixx/nRT/l6yS59QnvL9F0EXpFwbBOJq3sBSDxm33PcibZSnMPvJbGCvon8f0?=
 =?us-ascii?Q?KpE4B051iMONzoJnIiXvVwSUY/PEH9K9OCI1zBsVVwzUCTPDOi3dHNQz5XM/?=
 =?us-ascii?Q?flHCCI7MpAeTLvHOMZcllq8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda90f5f-31bb-4a3d-fee7-08d9bb2b270c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 15:47:05.9506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bc1ENZ6McLTT2xbuUxM9MT2+zblEfFvntr2sSz2LHnspHexWZYxhQM0n6oLOKAGl0R89dLyps2W0l+ILc8hoJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4932
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
Cc: "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

Hi Matthew,

Ping on this?

Regards,
Arun
-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Arunprav=
in
Sent: Wednesday, December 1, 2021 10:10 PM
To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; amd-g=
fx@lists.freedesktop.org
Cc: daniel@ffwll.ch; Paneer Selvam, Arunpravin <Arunpravin.PaneerSelvam@amd=
.com>; jani.nikula@linux.intel.com; matthew.auld@intel.com; tzimmermann@sus=
e.de; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Ch=
ristian.Koenig@amd.com>
Subject: [PATCH v4 2/6] drm: improve drm_buddy_alloc function

- Make drm_buddy_alloc a single function to handle
  range allocation and non-range allocation demands

- Implemented a new function alloc_range() which allocates
  the requested power-of-two block comply with range limitations

- Moved order computation and memory alignment logic from
  i915 driver to drm buddy

v2:
  merged below changes to keep the build unbroken
   - drm_buddy_alloc_range() becomes obsolete and may be removed
   - enable ttm range allocation (fpfn / lpfn) support in i915 driver
   - apply enhanced drm_buddy_alloc() function to i915 driver

v3(Matthew Auld):
  - Fix alignment issues and remove unnecessary list_empty check
  - add more validation checks for input arguments
  - make alloc_range() block allocations as bottom-up
  - optimize order computation logic
  - replace uint64_t with u64, which is preferred in the kernel

v4(Matthew Auld):
  - keep drm_buddy_alloc_range() function implementation for generic
    actual range allocations
  - keep alloc_range() implementation for end bias allocations

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 316 +++++++++++++-----
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  67 ++--
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
 include/drm/drm_buddy.h                       |  22 +-
 4 files changed, 285 insertions(+), 122 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c inde=
x 9340a4b61c5a..7f47632821f4 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -280,23 +280,97 @@ void drm_buddy_free_list(struct drm_buddy_mm *mm, str=
uct list_head *objects)  }  EXPORT_SYMBOL(drm_buddy_free_list);
=20
-/**
- * drm_buddy_alloc - allocate power-of-two blocks
- *
- * @mm: DRM buddy manager to allocate from
- * @order: size of the allocation
- *
- * The order value here translates to:
- *
- * 0 =3D 2^0 * mm->chunk_size
- * 1 =3D 2^1 * mm->chunk_size
- * 2 =3D 2^2 * mm->chunk_size
- *
- * Returns:
- * allocated ptr to the &drm_buddy_block on success
- */
-struct drm_buddy_block *
-drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order)
+static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2) {
+	return s1 <=3D e2 && e1 >=3D s2;
+}
+
+static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2) {
+	return s1 <=3D s2 && e1 >=3D e2;
+}
+
+static struct drm_buddy_block *
+alloc_range_bias(struct drm_buddy_mm *mm,
+		 u64 start, u64 end,
+		 unsigned int order)
+{
+	struct drm_buddy_block *block;
+	struct drm_buddy_block *buddy;
+	LIST_HEAD(dfs);
+	int err;
+	int i;
+
+	end =3D end - 1;
+
+	for (i =3D 0; i < mm->n_roots; ++i)
+		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
+
+	do {
+		u64 block_start;
+		u64 block_end;
+
+		block =3D list_first_entry_or_null(&dfs,
+						 struct drm_buddy_block,
+						 tmp_link);
+		if (!block)
+			break;
+
+		list_del(&block->tmp_link);
+
+		if (drm_buddy_block_order(block) < order)
+			continue;
+
+		block_start =3D drm_buddy_block_offset(block);
+		block_end =3D block_start + drm_buddy_block_size(mm, block) - 1;
+
+		if (!overlaps(start, end, block_start, block_end))
+			continue;
+
+		if (drm_buddy_block_is_allocated(block))
+			continue;
+
+		if (contains(start, end, block_start, block_end) &&
+		    order =3D=3D drm_buddy_block_order(block)) {
+			/*
+			 * Find the free block within the range.
+			 */
+			if (drm_buddy_block_is_free(block))
+				return block;
+
+			continue;
+		}
+
+		if (!drm_buddy_block_is_split(block)) {
+			err =3D split_block(mm, block);
+			if (unlikely(err))
+				goto err_undo;
+		}
+
+		list_add(&block->right->tmp_link, &dfs);
+		list_add(&block->left->tmp_link, &dfs);
+	} while (1);
+
+	return ERR_PTR(-ENOSPC);
+
+err_undo:
+	/*
+	 * We really don't want to leave around a bunch of split blocks, since
+	 * bigger is better, so make sure we merge everything back before we
+	 * free the allocated blocks.
+	 */
+	buddy =3D get_buddy(block);
+	if (buddy &&
+	    (drm_buddy_block_is_free(block) &&
+	     drm_buddy_block_is_free(buddy)))
+		__drm_buddy_free(mm, block);
+	return ERR_PTR(err);
+}
+
+static struct drm_buddy_block *
+alloc_from_freelist(struct drm_buddy_mm *mm,
+		    unsigned int order,
+		    unsigned long flags)
 {
 	struct drm_buddy_block *block =3D NULL;
 	unsigned int i;
@@ -318,78 +392,28 @@ drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int=
 order)
 	while (i !=3D order) {
 		err =3D split_block(mm, block);
 		if (unlikely(err))
-			goto out_free;
+			goto err_undo;
=20
-		/* Go low */
-		block =3D block->left;
+		block =3D block->right;
 		i--;
 	}
-
-	mark_allocated(block);
-	mm->avail -=3D drm_buddy_block_size(mm, block);
-	kmemleak_update_trace(block);
 	return block;
=20
-out_free:
+err_undo:
 	if (i !=3D order)
 		__drm_buddy_free(mm, block);
 	return ERR_PTR(err);
 }
-EXPORT_SYMBOL(drm_buddy_alloc);
-
-static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2) -{
-	return s1 <=3D e2 && e1 >=3D s2;
-}
=20
-static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2) -{
-	return s1 <=3D s2 && e1 >=3D e2;
-}
-
-/**
- * drm_buddy_alloc_range - allocate range
- *
- * @mm: DRM buddy manager to allocate from
- * @blocks: output list head to add allocated blocks
- * @start: start of the allowed range for this block
- * @size: size of the allocation
- *
- * Intended for pre-allocating portions of the address space, for example =
to
- * reserve a block for the initial framebuffer or similar, hence the expec=
tation
- * here is that drm_buddy_alloc() is still the main vehicle for
- * allocations, so if that's not the case then the drm_mm range allocator =
is
- * probably a much better fit, and so you should probably go use that inst=
ead.
- *
- * Note that it's safe to chain together multiple alloc_ranges
- * with the same blocks list
- *
- * Returns:
- * 0 on success, error code on failure.
- */
-int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
-			  struct list_head *blocks,
-			  u64 start, u64 size)
+static int __alloc_range(struct drm_buddy_mm *mm,
+			 struct list_head *dfs,
+			 u64 start, u64 size,
+			 struct list_head *blocks)
 {
 	struct drm_buddy_block *block;
 	struct drm_buddy_block *buddy;
-	LIST_HEAD(allocated);
-	LIST_HEAD(dfs);
 	u64 end;
 	int err;
-	int i;
-
-	if (size < mm->chunk_size)
-		return -EINVAL;
-
-	if (!IS_ALIGNED(size | start, mm->chunk_size))
-		return -EINVAL;
-
-	if (range_overflows(start, size, mm->size))
-		return -EINVAL;
-
-	for (i =3D 0; i < mm->n_roots; ++i)
-		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
=20
 	end =3D start + size - 1;
=20
@@ -397,7 +421,7 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
 		u64 block_start;
 		u64 block_end;
=20
-		block =3D list_first_entry_or_null(&dfs,
+		block =3D list_first_entry_or_null(dfs,
 						 struct drm_buddy_block,
 						 tmp_link);
 		if (!block)
@@ -424,7 +448,7 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
=20
 			mark_allocated(block);
 			mm->avail -=3D drm_buddy_block_size(mm, block);
-			list_add_tail(&block->link, &allocated);
+			list_add_tail(&block->link, blocks);
 			continue;
 		}
=20
@@ -434,11 +458,10 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
 				goto err_undo;
 		}
=20
-		list_add(&block->right->tmp_link, &dfs);
-		list_add(&block->left->tmp_link, &dfs);
+		list_add(&block->right->tmp_link, dfs);
+		list_add(&block->left->tmp_link, dfs);
 	} while (1);
=20
-	list_splice_tail(&allocated, blocks);
 	return 0;
=20
 err_undo:
@@ -453,11 +476,144 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
 	     drm_buddy_block_is_free(buddy)))
 		__drm_buddy_free(mm, block);
=20
+err_free:
+	drm_buddy_free_list(mm, blocks);
+	return err;
+}
+
+/**
+ * __drm_buddy_alloc_range - actual range allocation
+ *
+ * @mm: DRM buddy manager to allocate from
+ * @start: start of the allowed range for this block
+ * @size: size of the allocation
+ * @blocks: output list head to add allocated blocks
+ *
+ * Intended for pre-allocating portions of the address space, for=20
+example to
+ * reserve a block for the initial framebuffer or similar
+ *
+ * Note that it's safe to chain together multiple alloc_ranges
+ * with the same blocks list
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
+static int __drm_buddy_alloc_range(struct drm_buddy_mm *mm,
+				   u64 start,
+				   u64 size,
+				   struct list_head *blocks)
+{
+	LIST_HEAD(dfs);
+	int i;
+
+	for (i =3D 0; i < mm->n_roots; ++i)
+		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
+
+	return __alloc_range(mm, &dfs, start, size, blocks); }
+
+/**
+ * drm_buddy_alloc - allocate power-of-two blocks
+ *
+ * @mm: DRM buddy manager to allocate from
+ * @start: start of the allowed range for this block
+ * @end: end of the allowed range for this block
+ * @size: size of the allocation
+ * @min_page_size: alignment of the allocation
+ * @blocks: output list head to add allocated blocks
+ * @flags: DRM_BUDDY_*_ALLOCATION flags
+ *
+ * alloc_range_bias() called on range limitations, which traverses
+ * the tree and returns the desired block.
+ *
+ * alloc_from_freelist() called when *no* range restrictions
+ * are enforced, which picks the block from the freelist.
+ *
+ * blocks are allocated in order, the order value here translates to:
+ *
+ * 0 =3D 2^0 * mm->chunk_size
+ * 1 =3D 2^1 * mm->chunk_size
+ * 2 =3D 2^2 * mm->chunk_size
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
+int drm_buddy_alloc(struct drm_buddy_mm *mm,
+		    u64 start, u64 end, u64 size,
+		    u64 min_page_size,
+		    struct list_head *blocks,
+		    unsigned long flags)
+{
+	struct drm_buddy_block *block =3D NULL;
+	unsigned int min_order, order;
+	unsigned long pages;
+	LIST_HEAD(allocated);
+	int err;
+
+	if (size < mm->chunk_size)
+		return -EINVAL;
+
+	if (min_page_size < mm->chunk_size)
+		return -EINVAL;
+
+	if (!is_power_of_2(min_page_size))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(start | end | size, mm->chunk_size))
+		return -EINVAL;
+
+	if (check_range_overflow(start, end, size, mm->size))
+		return -EINVAL;
+
+	/* Actual range allocation */
+	if (start + size =3D=3D end)
+		return __drm_buddy_alloc_range(mm, start, size, blocks);
+
+	pages =3D size >> ilog2(mm->chunk_size);
+	order =3D fls(pages) - 1;
+	min_order =3D ilog2(min_page_size) - ilog2(mm->chunk_size);
+
+	do {
+		order =3D min(order, (unsigned int)fls(pages) - 1);
+		BUG_ON(order > mm->max_order);
+		BUG_ON(order < min_order);
+
+		do {
+			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
+				/* Allocate traversing within the range */
+				block =3D alloc_range_bias(mm, start, end, order);
+			else
+				/* Allocate from freelist */
+				block =3D alloc_from_freelist(mm, order, flags);
+
+			if (!IS_ERR(block))
+				break;
+
+			if (order-- =3D=3D min_order) {
+				err =3D -ENOSPC;
+				goto err_free;
+			}
+		} while (1);
+
+		mark_allocated(block);
+		mm->avail -=3D drm_buddy_block_size(mm, block);
+		kmemleak_update_trace(block);
+		list_add_tail(&block->link, &allocated);
+
+		pages -=3D BIT(order);
+
+		if (!pages)
+			break;
+	} while (1);
+
+	list_splice_tail(&allocated, blocks);
+	return 0;
+
 err_free:
 	drm_buddy_free_list(mm, &allocated);
 	return err;
 }
-EXPORT_SYMBOL(drm_buddy_alloc_range);
+EXPORT_SYMBOL(drm_buddy_alloc);
=20
 /**
  * drm_buddy_block_print - print block information diff --git a/drivers/gp=
u/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_m=
anager.c
index c4b70cb8c248..7621d42155e6 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -36,13 +36,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource=
_manager *man,
 	struct i915_ttm_buddy_manager *bman =3D to_buddy_manager(man);
 	struct i915_ttm_buddy_resource *bman_res;
 	struct drm_buddy_mm *mm =3D &bman->mm;
-	unsigned long n_pages;
-	unsigned int min_order;
+	unsigned long n_pages, lpfn;
 	u64 min_page_size;
 	u64 size;
 	int err;
=20
-	GEM_BUG_ON(place->fpfn || place->lpfn);
+	lpfn =3D place->lpfn;
+	if (!lpfn)
+		lpfn =3D man->size;
=20
 	bman_res =3D kzalloc(sizeof(*bman_res), GFP_KERNEL);
 	if (!bman_res)
@@ -52,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_m=
anager *man,
 	INIT_LIST_HEAD(&bman_res->blocks);
 	bman_res->mm =3D mm;
=20
+	if (place->fpfn || lpfn !=3D man->size)
+		bman_res->flags |=3D DRM_BUDDY_RANGE_ALLOCATION;
+
 	GEM_BUG_ON(!bman_res->base.num_pages);
 	size =3D bman_res->base.num_pages << PAGE_SHIFT;
=20
@@ -60,10 +64,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource=
_manager *man,
 		min_page_size =3D bo->page_alignment << PAGE_SHIFT;
=20
 	GEM_BUG_ON(min_page_size < mm->chunk_size);
-	min_order =3D ilog2(min_page_size) - ilog2(mm->chunk_size);
+
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+		unsigned long pages;
+
 		size =3D roundup_pow_of_two(size);
-		min_order =3D ilog2(size) - ilog2(mm->chunk_size);
+		min_page_size =3D size;
+
+		pages =3D size >> ilog2(mm->chunk_size);
+		if (pages > lpfn)
+			lpfn =3D pages;
 	}
=20
 	if (size > mm->size) {
@@ -73,34 +83,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource=
_manager *man,
=20
 	n_pages =3D size >> ilog2(mm->chunk_size);
=20
-	do {
-		struct drm_buddy_block *block;
-		unsigned int order;
-
-		order =3D fls(n_pages) - 1;
-		GEM_BUG_ON(order > mm->max_order);
-		GEM_BUG_ON(order < min_order);
-
-		do {
-			mutex_lock(&bman->lock);
-			block =3D drm_buddy_alloc(mm, order);
-			mutex_unlock(&bman->lock);
-			if (!IS_ERR(block))
-				break;
-
-			if (order-- =3D=3D min_order) {
-				err =3D -ENOSPC;
-				goto err_free_blocks;
-			}
-		} while (1);
-
-		n_pages -=3D BIT(order);
-
-		list_add_tail(&block->link, &bman_res->blocks);
-
-		if (!n_pages)
-			break;
-	} while (1);
+	mutex_lock(&bman->lock);
+	err =3D drm_buddy_alloc(mm, (u64)place->fpfn << PAGE_SHIFT,
+			(u64)place->lpfn << PAGE_SHIFT,
+			(u64)n_pages << PAGE_SHIFT,
+			 min_page_size,
+			 &bman_res->blocks,
+			 bman_res->flags);
+	mutex_unlock(&bman->lock);
+	if (unlikely(err))
+		goto err_free_blocks;
=20
 	*res =3D &bman_res->base;
 	return 0;
@@ -266,10 +258,17 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_ma=
nager *man,  {
 	struct i915_ttm_buddy_manager *bman =3D to_buddy_manager(man);
 	struct drm_buddy_mm *mm =3D &bman->mm;
+	unsigned long flags =3D 0;
 	int ret;
=20
+	flags |=3D DRM_BUDDY_RANGE_ALLOCATION;
+
 	mutex_lock(&bman->lock);
-	ret =3D drm_buddy_alloc_range(mm, &bman->reserved, start, size);
+	ret =3D drm_buddy_alloc(mm, start,
+			start + size,
+			size, mm->chunk_size,
+			&bman->reserved,
+			flags);
 	mutex_unlock(&bman->lock);
=20
 	return ret;
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/dr=
m/i915/i915_ttm_buddy_manager.h
index fa644b512c2e..5ba490875f66 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
@@ -20,6 +20,7 @@ struct drm_buddy_mm;
  *
  * @base: struct ttm_resource base class we extend
  * @blocks: the list of struct i915_buddy_block for this resource/allocati=
on
+ * @flags: DRM_BUDDY_*_ALLOCATION flags
  * @mm: the struct i915_buddy_mm for this resource
  *
  * Extends the struct ttm_resource to manage an address space allocation w=
ith @@ -28,6 +29,7 @@ struct drm_buddy_mm;  struct i915_ttm_buddy_resource =
{
 	struct ttm_resource base;
 	struct list_head blocks;
+	unsigned long flags;
 	struct drm_buddy_mm *mm;
 };
=20
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h index f9ff48=
a3f3a6..221de702e909 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -13,15 +13,22 @@
=20
 #include <drm/drm_print.h>
=20
-#define range_overflows(start, size, max) ({ \
+#define check_range_overflow(start, end, size, max) ({ \
 	typeof(start) start__ =3D (start); \
+	typeof(end) end__ =3D (end);\
 	typeof(size) size__ =3D (size); \
 	typeof(max) max__ =3D (max); \
 	(void)(&start__ =3D=3D &size__); \
 	(void)(&start__ =3D=3D &max__); \
-	start__ >=3D max__ || size__ > max__ - start__; \
+	(void)(&start__ =3D=3D &end__); \
+	(void)(&end__ =3D=3D &size__); \
+	(void)(&end__ =3D=3D &max__); \
+	start__ >=3D max__ || end__ > max__ || \
+	size__ > end__ - start__; \
 })
=20
+#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
+
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)  #define DRM_BUDDY_HEA=
DER_STATE  GENMASK_ULL(11, 10) @@ -132,12 +139,11 @@ int drm_buddy_init(str=
uct drm_buddy_mm *mm, u64 size, u64 chunk_size);
=20
 void drm_buddy_fini(struct drm_buddy_mm *mm);
=20
-struct drm_buddy_block *
-drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order);
-
-int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
-			  struct list_head *blocks,
-			  u64 start, u64 size);
+int drm_buddy_alloc(struct drm_buddy_mm *mm,
+		    u64 start, u64 end, u64 size,
+		    u64 min_page_size,
+		    struct list_head *blocks,
+		    unsigned long flags);
=20
 void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block=
);
=20
--
2.25.1

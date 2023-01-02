Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 521B065BC24
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 09:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A9310E3A1;
	Tue,  3 Jan 2023 08:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF7810E194
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 14:51:44 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 302Bx46D011991; Mon, 2 Jan 2023 13:41:52 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3mtd0uv746-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Jan 2023 13:41:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EH7Q1ygdq8hb6QLZQg+FO3oVGM0vm/dgC8rYDMaCGbqIzXkBuWvCcCjEkT9BLFqskHwaumIyq3O3nt6S5Lv7I20UGLq5EbJEuzTyi4uAGvxCefF2eJ+MLBNKzcGQCMf99/O6b+D/cvmd1SOTEBLp7S5aSdrAICK71R/mpn+6dPMsNBX9SvNqhNas0XK59rwP+6JqZz6b8q8+ito9T2Q97MSKzUYHfnpWR1KMBwizuOo6HjMPZZL6snO3eWsUlI+d3zRu+9cGTFheT0qcGXU+/YLlh1I79DJOB+VbOub05RYYlQ3TvBxRSNAp4DZQG2EoyCpsMwrK/QjvIfQcEebgkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upLENppnbaOJqNZ7wAgRPaS772ApiRNNpeCnQADukok=;
 b=h+zfyrOORIykAmzlkpyogetoAix8Ex/PKUn+FKR/CFwgSrN2riv/nmkccGuDkFF3iiK9iWQe4JH40PFdW3gVJQEqnW3kaaGslapFEmRK/TraLd/VkjPYvKzhHc9aCfG7l/LljrHRLbsIZN4YNplomA3lqaUPLyMRuTyv39tjSkBm4Ko4k2vNmtjtlXIBF4EDigFUpgo5qiSl30DEz2m9ro3GF2XAHRxccHCCeMtd+eeMWzpe7xFrvksY2hejLBl8G0Lkv2341IL6xZ1hUE+aloTtaisvD3JqTfwBOK8rQ+DZVOtP83gFWo1r5OFzyV+B5k7px/Hh7RzcV7YOA9L8ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upLENppnbaOJqNZ7wAgRPaS772ApiRNNpeCnQADukok=;
 b=T3oL8E80Zu6y5uljNdl6ASKZKYjjEA7AvCxRY+i21xtxiBfvjMG6/xT7U1cxnRV8lE86tjF/e6m7K0WSOpKufW2F26xxojhuABWsRb9Rdktjhc9cFPEfgcVpTiLOWy350xpe2P9Tb2eXTIs7kvUmoOuOUXre2jiercXn7OwfUsXdDUa48eBYSKuWR4trfV7gAhRp6gSvM8JJhEtgWUpo/9Y71yLuG4xGOvkI1CvXsSA2dU0+dGAeyRGFM6zAuqb440w9PlqSo0KFmegGnGw7qbB41zxXhotEha0P45ur/8uCbWEGqGTmJVe3xyippsarZ1xnEtawF+otzRYHSeUnlg==
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by DB9PR03MB9709.eurprd03.prod.outlook.com (2603:10a6:10:459::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 13:41:48 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::2da6:6d63:389b:3552]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::2da6:6d63:389b:3552%9]) with mapi id 15.20.5944.019; Mon, 2 Jan 2023
 13:41:48 +0000
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "jgross@suse.com" <jgross@suse.com>
Subject: [PATCH v1 1/3] xen/grant-table: save page_count on map and use if
 during async unmapping
Thread-Topic: [PATCH v1 1/3] xen/grant-table: save page_count on map and use
 if during async unmapping
Thread-Index: AQHZHq/2VrVTMTTaekaw3MeMlNz4/w==
Date: Mon, 2 Jan 2023 13:41:48 +0000
Message-ID: <e58e80d2856cb4656ec76409c2db75652865e2ed.1672666311.git.oleksii_moisieiev@epam.com>
References: <cover.1672666311.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1672666311.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|DB9PR03MB9709:EE_
x-ms-office365-filtering-correlation-id: 01aafa7a-9d3f-4d4e-013e-08daecc718ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qufCfaYw3n7K5GBDOfPY8lJ0s2EbpdNaaVh1FB2Pw+YoK5QwbfcpPET4AXM5Toz2dzO9dIr+DdNC4joci4/RzuhGLqi21535Yz3P3srG6Lpcnh7CUF2hJv/HHJIo0FYK7JNW0GwdhZT8nsBTZUNHceKZjm5bn/VOJRDshf278kimt9ZzSTXviP06ZWob69c/WnQGL5BMf34w91h10zbmqzZwUdRBsgn44uTXvUfabiQWwUdSUvqiZfxXh7MADOPECKVxUZpOM+ev0TJxcSh9SFuc2DE9zKdog0Ikyu9z+yKmTFvPtmmAb5B+PqNXAtO8c/7NqDZLxOjEnXUq1yJO00YW3fodzAxmUGKLwvsS0s1kIr3BsboABlbV5GsHXpJlano+8KhyfZYdjFzYqPFo21E+sg5CTewTHHOL7kLIJkwQEpAJaC4XCTxhA/SLDVpj6ZCCnAzR89BcHAbZeXMQyB2Hjwi+q+/YDnZix3Vsht6ar5afyQ0WGDdtD08a3BCnkOAZ3g+WgyqselwMRSFAVdlRLIVolZKEsWGR8iwB3eEXrak1oySjbeKAjKnaVScUQDaILO8fZ/9v6KZQz/ic05R5cFDigD6yCyMTnU6xaQWRkCEakZ/7/gyGCyVciq/zys1pLiMmM3pGFA4XlGHpy9WESyonSwVWHzF22oyBXuxZC+T/5ValxPLViewW81d699ESQS/SFiQXon855al4XyCzxm+4AUow5YOHP5/f9ao=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR03MB7136.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199015)(38100700002)(122000001)(86362001)(8676002)(38070700005)(66476007)(76116006)(66946007)(64756008)(66446008)(66556008)(6916009)(91956017)(4326008)(41300700001)(54906003)(316002)(2906002)(5660300002)(8936002)(2616005)(83380400001)(6512007)(478600001)(71200400001)(6486002)(6506007)(26005)(55236004)(186003)(36756003)(22166006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?dANsysGQdFemPfZPLN3R5/iueQyffU7Aefc222DGZ8engqUXxDYFqDhhWs?=
 =?iso-8859-1?Q?klXBmUqO8vdTsG9eOYChTyQ3+PL/+hhuseX0TkGSJKfjWL5yL1FxZI3DLL?=
 =?iso-8859-1?Q?LNWx8q2ucibwxBygufAWID7zKm+cikKSS2rG1pejj+wR1TIuu+K4jplG65?=
 =?iso-8859-1?Q?gFh/+hDBrmYEOHMFr+uTX/Lh8QwwaB/6qHCUjgRwIdlHc3a3UYM96ErdWU?=
 =?iso-8859-1?Q?QOvxwx+ofVp73MmjqxruCfkoSXCYr6T3sXHXGJRNK6L5zKsa8qmeIqt7Zb?=
 =?iso-8859-1?Q?ZwrLGQMJPVB0+P6bg4yghqhyj69aQHwy0x6O94ezPzNMmQYcIMdO+ekY3u?=
 =?iso-8859-1?Q?TKEWrbhJMy+Smzzu52UFjuCq5NTQdEoX1mhiEvnomzVaryP9ZqHooMRPTT?=
 =?iso-8859-1?Q?2p9XEorxFULahLRpfxbZUE28+dnNoLxy3DwrzLfP2YecjeBmwxewRXbxMl?=
 =?iso-8859-1?Q?Q3g+1N68v6lKIRYINDvORC2v7aSOodhMMxcd1Fto72kkDvuQgDrnY27u55?=
 =?iso-8859-1?Q?8OmEd4flK0bQ2jx2sFB5LzGQFN6jUcJIKVIoUyM0lSuHQY+/6PKUKfp/IT?=
 =?iso-8859-1?Q?hCgXV/xWkEELFj5S8nu+/znOyxSwEWeXHshjI5VUt45VhiCvHaHNFzkoQM?=
 =?iso-8859-1?Q?VCcKqsJpv+w8qy4aC+O/zHSn88lQWNbMgd8YYWfRgM75keJMuZbWA1lHQr?=
 =?iso-8859-1?Q?DOnSVB7uyVzulo/R3rWzsTR6oXTE7k3smf49EChQUJRzono5yFwXGDKCfZ?=
 =?iso-8859-1?Q?Sw4/+83oz2cTfxyPYnd/AFfj+M5himSq/t282B5M00TU4Xz3b8YgeDs3Qg?=
 =?iso-8859-1?Q?J3ZBI/2oaAh5nWD9Y+7758VlM/ANYR9Aj46qDx+FOZzJN0cE/xwggKnVDT?=
 =?iso-8859-1?Q?0lX616JttIsRpZ0MYz0cDn+Z388IrOdy9tqgiGe3wvEZFujLz3XRxnyVlz?=
 =?iso-8859-1?Q?xRHIhUGyj6ii4r+jvD2KA8nvMV1mcxtbHkcKlzG9O5dn7+w1/pvVF8f8tI?=
 =?iso-8859-1?Q?nCJ/1SG18OlFiPoUQkKNXYi0gcjEdnxlIQ9Jp+Bt+NKwn9zr1VtjovfjPh?=
 =?iso-8859-1?Q?Rzun/CuzGk/fh2uuaVEadwIcntMwSGXrroTPLOiB17mDlUqd86F+lC/615?=
 =?iso-8859-1?Q?wEzM4vFGJo1gN5F/PmMfolS1kGUcXjVYdYC0wnTFtFlfW1BEZE9EW8MWmT?=
 =?iso-8859-1?Q?dQ/4u6JIBk/Kn8b9cXEOqmg2mcP6yGcIfARxp9CgDU9v9Zuwqe4Ut9v0iF?=
 =?iso-8859-1?Q?Q8QR4DIedxMgyTZPc6wfygq0+Prcu3CzYyAahoY7BAAROmXxKXvIuHxlx+?=
 =?iso-8859-1?Q?tWyMROlWn5GapUZEH34JKeVSD0H9TdnrT7yvsTncF5KCNdKVCtpOuoM+L1?=
 =?iso-8859-1?Q?PgL62+5zHNaB7PqzKmXwB0nwr9yOPIgblcWs1df9/tVt1syoCdf0YNcayZ?=
 =?iso-8859-1?Q?6706N9LqTL7QejzPhha14Lqym3usffPv8FSd80TdfyRJ5wv0ICxWXp8D/Y?=
 =?iso-8859-1?Q?gIqGHet/mIPyvNR10HTpJVUT1rXskt0g3Dc5EPWVM637dWaMp0SfhwOfT0?=
 =?iso-8859-1?Q?zyufy/nezBU2LaSsW2RaKNfl2Gp4tzoSSO3uoJzsHiIDy0pwY1tGcqeB1H?=
 =?iso-8859-1?Q?f/0OgvjdnGNOcLr6n/E1H018gdiz50V/9uefCUfa6ecGjGARXGxbNAOw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01aafa7a-9d3f-4d4e-013e-08daecc718ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2023 13:41:48.6825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kI1NPR1PtH+s/DzX1W50xaAwDmqfN4R/xQrpV0d+2vI3yUPaymI20bn90qI3J/4UWEJxnW+SL0clikRBIlzGek+KvB6SWXedvjDmoLuBIUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9709
X-Proofpoint-GUID: mk6-_2x5bNgRKHNXlG71jmOCVvk0mvbE
X-Proofpoint-ORIG-GUID: mk6-_2x5bNgRKHNXlG71jmOCVvk0mvbE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_08,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=902 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301020124
X-Mailman-Approved-At: Tue, 03 Jan 2023 08:24:55 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Save the reference count of the page before mapping and use this
value in gntdev_unmap_refs_async() call.
This is the enhancement of the
commit 3f9f1c67572f5e5e6dc84216d48d1480f3c4fcf6 ("xen/grant-table: add a
mechanism to safely unmap pages that are in use").
Safe unmapping mechanism defers page that may being use (ref count > 1).

This is needed to allow to map/unmap pages, which have more than 1
reference. For example, DRM_IOCTL_MODE_CREATE_DUMB creates dma buffer
with page_count =3D 2, which unmap call would be deferred while buffer
exists because ref count will never equals 1.
This means the buffer remains mapped during DRM_IOCTL_MODE_DESTROY_DUMB
call which causes an error:

Unable to handle kernel paging request at virtual address <addr>
....
Call trace:
  check_move_unevictable_folios+0xb8/0x4d0
  check_move_unevictable_pages+0x8c/0x110
  drm_gem_put_pages+0x118/0x198
  drm_gem_shmem_put_pages_locked+0x4c/0x70
  drm_gem_shmem_unpin+0x30/0x50
  virtio_gpu_cleanup_object+0x84/0x130
  virtio_gpu_cmd_unref_cb+0x18/0x2c
  virtio_gpu_dequeue_ctrl_func+0x124/0x290
  process_one_work+0x1d0/0x320
  worker_thread+0x14c/0x444
  kthread+0x10c/0x110

This enhancement allows to provide the expected page_count during
map call so refs could be unmapped properly without unneeded defers.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---
 drivers/xen/grant-table.c | 16 +++++++++++++++-
 include/xen/grant_table.h |  3 +++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index e1ec725c2819..d6576c8b6f0f 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -1241,11 +1241,23 @@ int gnttab_map_refs(struct gnttab_map_grant_ref *ma=
p_ops,
 		case GNTST_okay:
 		{
 			struct xen_page_foreign *foreign;
+			int page_cnt;
=20
 			SetPageForeign(pages[i]);
 			foreign =3D xen_page_foreign(pages[i]);
 			foreign->domid =3D map_ops[i].dom;
 			foreign->gref =3D map_ops[i].ref;
+			page_cnt =3D page_count(pages[i]);
+			if (page_cnt > FOREIGN_MAX_PAGE_COUNT) {
+				/* foreign structure can't hold more than FOREIGN_MAX_PAGE_COUNT.
+				 * That's why we save page_count =3D 1 so safe unmap mechanism will
+				 * defer unmapping until all users stops using this page and let
+				 * caller handle page users.
+				 */
+				pr_warn_ratelimited("page have too many users. Will wait for 0 on umap=
\n");
+				foreign->private =3D 1;
+			} else
+				foreign->private =3D page_cnt;
 			break;
 		}
=20
@@ -1308,9 +1320,11 @@ static void __gnttab_unmap_refs_async(struct gntab_u=
nmap_queue_data* item)
 {
 	int ret;
 	int pc;
+	struct xen_page_foreign *foreign;
=20
 	for (pc =3D 0; pc < item->count; pc++) {
-		if (page_count(item->pages[pc]) > 1) {
+		foreign =3D xen_page_foreign(item->pages[pc]);
+		if (page_count(item->pages[pc]) > foreign->private) {
 			unsigned long delay =3D GNTTAB_UNMAP_REFS_DELAY * (item->age + 1);
 			schedule_delayed_work(&item->gnttab_work,
 					      msecs_to_jiffies(delay));
diff --git a/include/xen/grant_table.h b/include/xen/grant_table.h
index e279be353e3f..8e220edf44ab 100644
--- a/include/xen/grant_table.h
+++ b/include/xen/grant_table.h
@@ -49,6 +49,7 @@
 #include <linux/mm_types.h>
 #include <linux/page-flags.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
=20
 /*
  * Technically there's no reliably invalid grant reference or grant handle=
,
@@ -274,9 +275,11 @@ int gnttab_unmap_refs_sync(struct gntab_unmap_queue_da=
ta *item);
 void gnttab_batch_map(struct gnttab_map_grant_ref *batch, unsigned count);
 void gnttab_batch_copy(struct gnttab_copy *batch, unsigned count);
=20
+#define FOREIGN_MAX_PAGE_COUNT       U16_MAX
=20
 struct xen_page_foreign {
 	domid_t domid;
+	uint16_t private;
 	grant_ref_t gref;
 };
=20
--=20
2.25.1

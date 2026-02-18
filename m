Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EXEHOcDlWlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 222881521D1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241E410E555;
	Wed, 18 Feb 2026 00:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PpXAN0Bz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010066.outbound.protection.outlook.com [52.101.201.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B959110E557;
 Wed, 18 Feb 2026 00:12:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLkQitWyV9yU8vbtg6Ihke2SzaV8R9xkcM6rGYQrAu5bA9rufakiDF3FY31bqzB/JY3ToR/D1ILktM+M/SGZbRybMLDajl1PTGx0tL3y5s4q5cdwCWgJ2H0/ppi0Zn9qbgNrskeUY1zsFbYB2VZOE8bemeaRyb78iVdqRvm7kZkGe6jcI0Y3KpkNm4D+F2eFZ7XiAYliT8nOIo9/K441Y/XkqxJ2TIBnSsYglK5arkku6YGbaDczzdC38wQHW1RHJfo8cYA7yz51/pvsh+0WBJX8wS+XZv06HCMKVp/Zvbkcysgcv3cfQWH8dbHQsQ+DRuevn4tGesslIT5ik6FuDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJ97i3Buw8qA15KBdWvUEG5ksKzgeIrPhRBuETTxJXY=;
 b=tMPP2517ZCpDIDe1qSurtwcXdU6UZPY3PivcNi6LDhBMsQwgtv0JwW3JYjbfOIbTtLZRfF5f0Wy7KYT+FExz3DoNAOe5MsH68sApiL8Nuyh4ktMIugIoxr84USPuOiaQ8KAhYtLG2cF6HfF3clKfbpst2tP5VuAg3mfPZI/WIenHErt176GB8/Ik2fV3CjGfuQDcKxpNud6kz4pF/9e8WuDrXU0teQX8pz0LYUEC6KVV0soMqduonD/9xxNa/k8kblZlMjKCdeuR70hKxxruFy8o8lBEcc8XlMlLcO5LfFDyTA5RVzwzjvSBSyHfiMEoUbtXXVQdHA6sUDL2Bm1V4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJ97i3Buw8qA15KBdWvUEG5ksKzgeIrPhRBuETTxJXY=;
 b=PpXAN0Bzl9u/z0NFMSkRCaOSZfC7zJFCA3VNL6WIsK7s8yNO2aPB1DpajNHiHSob4RD1Cta9pkaE7onlTQX638Mkexx4pE/Iv0nKyyjsSAAdCAeytzLCRcQSeh73M84qvdfAgtbybvRVue6Fd5gx8nYlKeNqjeELoRe4/SLXre5bZoFiQPOFz0n+IX9x3+k0PCLR3wdna0Kz6iey0o1JIdXjd3p0xuR885KGaxHZAgruakgDxycxtxv63ht7Gen2iyenuFxR4WZNB5FFZkCX/Jd0ExCY+/wcGNvwaSAHlcrCETf1NiwvQBBbHt7lLRLMJxOvJvrhkGQNUZVQT5Fc9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 00:12:06 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:12:06 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: 
Cc: Christian Koenig <christian.koenig@amd.com>,
 Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
 Kevin Tian <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH RFC 17/26] treewide: Rename dma_buf_map_attachment(_unlocked)
 to dma_buf_sgt_
Date: Tue, 17 Feb 2026 20:11:48 -0400
Message-ID: <17-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0026.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::31) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: f3da7c07-d159-4890-b977-08de6e825668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d1OhFU3fL1Z8Bh5PV7lp7is/K2etn/1/QXeIXVp0gW0+BuaX61/yxC0MQ2Pn?=
 =?us-ascii?Q?rMmitXOgwhYj8ZftQLGFAp4psMAKgk50Yq0GV5Alamq8HCDGtJBwWbaniY9V?=
 =?us-ascii?Q?2h/cHf3qBXm++aztgGjXuWIs82QfkCEvGQtDAZau8w3t3+dc43OhPfc4Sb02?=
 =?us-ascii?Q?DTgOiUk44/VRnZp+6NjZ/XBsozEfCnW7nqxHFHHjVyx17wjNQMaXZ3b8IcE6?=
 =?us-ascii?Q?FSrE+sFjL2Xkl0gxw74Q3AlIBdfglE2OyPnVef1URKfoCi2Anp6i5n9Ivp/V?=
 =?us-ascii?Q?xuH2HL73QioqR3Xz7lOG2IJqrj41Xg8DmlsnkmpFre2gm30HKxBK4lAfpfpx?=
 =?us-ascii?Q?fMeUu/URGAIyx+ETA4vJ70sUpxW4Xpl+UEFORIt2SXcb1CPhwfVhsHvHPvAa?=
 =?us-ascii?Q?WAXP9vF54fEVZu1AJl8mbNPaNPnIzlsOutCwsFGgtFAc5kROR8Nh5v01ibf2?=
 =?us-ascii?Q?dIKoFSIDiOZc6D59tx6jSESSRrSrmhr353ZXn/9NyHxk7VGwC5PO4U82WDjO?=
 =?us-ascii?Q?Z6gLUMukxmeXdRuXFEQGvz07flfn3tYx6WVhk8T3LPfvZ1Jbe2GUNbx1+QlP?=
 =?us-ascii?Q?M7jfcME2lkcoLdVMiRrWWLfzFSdnumNWW22m/myVyVAm/uUkotS013Ev4CAA?=
 =?us-ascii?Q?Ss6C1I+uezL9t4jxaDSWoRPY29Bs30J+7XvZRVuo14Jpf7X4dRSsq3syUCk7?=
 =?us-ascii?Q?xwBFndD9iWcE5T9WHt3yt+ETo3dFaufx9YbJ7vTr22yfyzpY6vuGI92Jfwys?=
 =?us-ascii?Q?HfF4dBgb+ZpvbFo2gVUJcrjDw6jJWw2TdwMcUGW2yhCtEzsgiYQHWN1b33c5?=
 =?us-ascii?Q?CiukVPRq5uEASxhyRWCYhtYOR4+GbMhoUGyAx7pS16bArifHxaFvlhIzdw0+?=
 =?us-ascii?Q?XINiqVdIZgTRQM/ow1yhx4n9hQy+qLQnSUUUcMb2A8SyyI+P4yDYPKYLWBqS?=
 =?us-ascii?Q?D/qws7MlvelOm4lQgsLLs5A1L8KWuCioZ5HpJlOJ8wKm3+pPRTDQ/abNt4dW?=
 =?us-ascii?Q?5cX1rXAlvYXsbErJ3zgjoLgrj2UW7ElE2hsHXeaw/h4WDVEdoMx31wtgy2Pz?=
 =?us-ascii?Q?9jjPkdzsGqFWDStLOzsXtBo0UYZjkhCEKWCvkcv4OY1dz3/IenUBg7/EsVey?=
 =?us-ascii?Q?qvC1RYJFDn2u/ufh3J3u+0Y/jks5hugfQ2cbgmJItxbkLh4EcU7XOrpuX31C?=
 =?us-ascii?Q?g4HbZR2UI3JU29KYt6T7QBzfSisxLorikope1+MFxgsl0Jp3o99sDUM00Acs?=
 =?us-ascii?Q?g8czuKKLZzuWW9A8AbCgxamm8S1k6F7kf6gKyBf8YkVJfU4ZX65t684pCosF?=
 =?us-ascii?Q?qYol45JaCMNSK52PeTpYaekVFFuArAulYFPqDIVu+NunV0UvcEXEeTH6aej7?=
 =?us-ascii?Q?A2uvGDeMGQdvuNwFLozDu9OmH2vkc9IZ0hEBHKSq/vG6nHXLTZypmng8Jq2S?=
 =?us-ascii?Q?H4if6bqILYsB5zplCfXxU6hLrJlXwk5MkAigPQOEWxySNud1tT8Pl76OL6vH?=
 =?us-ascii?Q?Hqy9a7fWmLQ0q8bfPc0jfr5mQRqNw5eMspZbcFgYL6HRQtYb7IGXuGrdROxC?=
 =?us-ascii?Q?ndRrJBGBS3Dm+o2lP3I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m+JIiJMzjGnnUD0LP2Fbo0JhShIYKqe3BiNBE+7Q6+EkbKkawKAfR1SKPzl4?=
 =?us-ascii?Q?KsiNZZyYdwCJ+0hcS+kWZbCTIpfGLTcgdBS8okDXA2XSmeD3UcaMO2t3OP7b?=
 =?us-ascii?Q?jAqq8oOsbSsz2bYzKBEv5CDTZdeEcsAkG/OEF52nkXko73mu60+P3RYEkKAo?=
 =?us-ascii?Q?/ikkQTUo1bcNJ9R5TZ8m8/URWRcnztiZ4y9yQaAQnEnDJstStEx4A1IWUgwc?=
 =?us-ascii?Q?6+ab285ZM7pm7FdDdyjuZ01DJXTn0VODb5tunv08mgIKv35bH85s6WmDb4AC?=
 =?us-ascii?Q?2Au8BG/Z9vfVszP0Adc2iNavx5qhO5hBO50tkzmx0WaZ8WGBCnr6FJVy7UMh?=
 =?us-ascii?Q?udg8ewJg1POMEAQ9kqLvgC6BSvo6oUX9oFjUc0iWMylqJa3zcETjYOB7RELj?=
 =?us-ascii?Q?TburAYbDdSQsJ1y49I4oh0Du6NAXr4sPb5U7hhAWMhV0zfySXgk/sNJQPxzD?=
 =?us-ascii?Q?x0sSm318k0hz0Pfr0e9+Z/SSI9IqyoQ9QOYd0fzRAhCLv0TzL+7EW9XwMfqi?=
 =?us-ascii?Q?SPlW6htDSNDeIJJdXeol4f+q9LGGazN5k/6FCBLv5JBQqfbErhWtY0+1KvTj?=
 =?us-ascii?Q?5IEJSJAJ3ZobIQFuKIzAfi/JEM3XSBi0T3T77nizrCP81tkTUe64//kZve//?=
 =?us-ascii?Q?eD72sWXNDvQGATj2JMF1t0ZSwNtls8/k+ss7cRSQA7/yr00UTq4tbsygxkCp?=
 =?us-ascii?Q?g7VLCk8ZHPwOKOn6edR+sJQrhnz6bhxT5QWiVGk2aRzHKJxIOf9Jyd6xiV8H?=
 =?us-ascii?Q?mvAv61bTOFkwoebU9UtBll1Atev7RpcqsG3wSs3iDBBOIKQRRGRSK25sqkLY?=
 =?us-ascii?Q?YZOsJnF7uPphx0dO9LhsELyKaHzUy9bMpSQ5mQtDF8hG/v9+bZ7VU581XKTg?=
 =?us-ascii?Q?6hCn9/qRExsCXxvE68ms977ghWItwTFD57f877sVmu3ecnVBeYAGPkxNszp8?=
 =?us-ascii?Q?UiN7DoW2CDFn87l2dmvpPwLENeYM0MIJrhY96Mk83yqshWLnFzBg2iXbi6/y?=
 =?us-ascii?Q?mBaf7OlUr1E28eZjbeyeMTwrmPIIOVYMdEyhr4pfCKYTonotPUrasAIyh4QN?=
 =?us-ascii?Q?UpK9Bsyq17WYKWKYqp9eTQLjBuQqAYJf+h9nzE/PdZj8ltK7kCjhLw9G95yB?=
 =?us-ascii?Q?vGJ7WqWax209EFItRo3Y2+EnJAgeN7MyGZ8PZnOsKz4gT76W25etyI3jxRgr?=
 =?us-ascii?Q?otwjj8bQxu17/ohYo2Ff2OIWk/jPus1Y2/Vbb01AkO5PDanduf94W5fFIU/q?=
 =?us-ascii?Q?xWH8UunKrHGC58cEFxdKNekcdqMF1JX1TFUijnaXi4bw0/PnvZJ3Ig/JRbs8?=
 =?us-ascii?Q?70PuivRPg/ETHdhKB4ZHEuAzuQ5IYDOajKUarexDzcJjfui18jTna7yzC/zl?=
 =?us-ascii?Q?OIajYbFGbFwt40ghnc0HC79K9h0s95f8UiRT3Z7X3QMnJ0c3mtucssr+XoXp?=
 =?us-ascii?Q?NoG/kS+WLfU22zej2BNSlOyc1OFJqrgB263w1GR+PWd+jD/vNiQeGzA9oW1c?=
 =?us-ascii?Q?h7wdoaR85ZepP5wVcCmk/b3AWwRIw9gpzqVS3MZyAgHvITG09VxiiDgZiAm8?=
 =?us-ascii?Q?aNFhG4vYbutIMmlJAOANchC6SS6jX9lgcqJ+HvJleCXwJwjjV6xJNvSulC+8?=
 =?us-ascii?Q?bnPvdd5LybaVqBUIt0Znx10s6lHK6pFDGFd7JNJJKdiUPi1IX0NUSGw9FsGL?=
 =?us-ascii?Q?QNRNVsLtwTYOcTNRx2Q7f6JF2TnNju4LaGtCvrCx5hcMekoHeuJxJufHBGgB?=
 =?us-ascii?Q?9FgFw42YHw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3da7c07-d159-4890-b977-08de6e825668
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:12:01.1562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uG3vm12lfUhJC3v2+9n95B8x8JwMCRJjOt/MR1+YQZKTgd8QPujjq6GxEEAgZtie
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8202
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 222881521D1
X-Rspamd-Action: no action

This map function only works with SGT importers.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/accel/amdxdna/amdxdna_gem.c           |  2 +-
 drivers/accel/ivpu/ivpu_gem.c                 |  3 +-
 drivers/accel/qaic/qaic_data.c                |  4 +--
 drivers/dma-buf/dma-buf.c                     | 28 +++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  3 +-
 drivers/gpu/drm/armada/armada_gem.c           | 14 ++++++----
 drivers/gpu/drm/drm_prime.c                   |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  4 +--
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  3 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |  2 +-
 drivers/gpu/drm/tegra/gem.c                   |  6 ++--
 drivers/gpu/drm/virtio/virtgpu_prime.c        |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
 drivers/iio/industrialio-buffer.c             |  2 +-
 drivers/infiniband/core/umem_dmabuf.c         |  4 +--
 .../media/common/videobuf2/videobuf2-core.c   |  2 +-
 .../common/videobuf2/videobuf2-dma-contig.c   |  2 +-
 .../media/common/videobuf2/videobuf2-dma-sg.c |  2 +-
 .../platform/nvidia/tegra-vde/dmabuf-cache.c  |  2 +-
 drivers/misc/fastrpc.c                        |  3 +-
 drivers/usb/gadget/function/f_fs.c            |  2 +-
 drivers/xen/gntdev-dmabuf.c                   |  2 +-
 include/linux/dma-buf-mapping.h               |  4 +--
 include/linux/dma-buf.h                       | 10 +++----
 io_uring/zcrx.c                               |  3 +-
 net/core/devmem.c                             |  4 +--
 26 files changed, 63 insertions(+), 54 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index fb7c8de960cd2a..ab7610375ad761 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -610,7 +610,7 @@ amdxdna_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
 		goto put_buf;
 	}
 
-	sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
+	sgt = dma_buf_sgt_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
 	if (IS_ERR(sgt)) {
 		ret = PTR_ERR(sgt);
 		goto fail_detach;
diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index ece68f570b7ead..850dc82c7857e2 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -54,7 +54,8 @@ static struct sg_table *ivpu_bo_map_attachment(struct ivpu_device *vdev, struct
 
 	sgt = bo->base.sgt;
 	if (!sgt) {
-		sgt = dma_buf_map_attachment(bo->base.base.import_attach, DMA_BIDIRECTIONAL);
+		sgt = dma_buf_sgt_map_attachment(bo->base.base.import_attach,
+						 DMA_BIDIRECTIONAL);
 		if (IS_ERR(sgt))
 			ivpu_err(vdev, "Failed to map BO in IOMMU: %ld\n", PTR_ERR(sgt));
 		else
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 60cb4d65d48ee7..0a7b8b9620bf9a 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -844,7 +844,7 @@ struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev, struct dma_
 
 	drm_gem_private_object_init(dev, obj, attach->dmabuf->size);
 	/*
-	 * skipping dma_buf_map_attachment() as we do not know the direction
+	 * skipping dma_buf_sgt_map_attachment() as we do not know the direction
 	 * just yet. Once the direction is known in the subsequent IOCTL to
 	 * attach slicing, we can do it then.
 	 */
@@ -870,7 +870,7 @@ static int qaic_prepare_import_bo(struct qaic_bo *bo, struct qaic_attach_slice_h
 	struct sg_table *sgt;
 	int ret;
 
-	sgt = dma_buf_map_attachment(obj->import_attach, hdr->dir);
+	sgt = dma_buf_sgt_map_attachment(obj->import_attach, hdr->dir);
 	if (IS_ERR(sgt)) {
 		ret = PTR_ERR(sgt);
 		return ret;
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index e773441abab65d..73c599f84e121a 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -653,7 +653,7 @@ static struct file *dma_buf_getfile(size_t size, int flags)
  *
  * 3. Once the buffer is attached to all devices userspace can initiate DMA
  *    access to the shared buffer. In the kernel this is done by calling
- *    dma_buf_map_attachment() and dma_buf_unmap_attachment().
+ *    dma_buf_sgt_map_attachment() and dma_buf_unmap_attachment().
  *
  * 4. Once a driver is done with a shared buffer it needs to call
  *    dma_buf_detach() (after cleaning up any mappings) and then release the
@@ -867,7 +867,7 @@ dma_buf_pin_on_map(struct dma_buf_attachment *attach)
  *
  *     - dma_buf_pin()
  *     - dma_buf_unpin()
- *     - dma_buf_map_attachment()
+ *     - dma_buf_sgt_map_attachment()
  *     - dma_buf_unmap_attachment()
  *     - dma_buf_vmap()
  *     - dma_buf_vunmap()
@@ -885,7 +885,7 @@ dma_buf_pin_on_map(struct dma_buf_attachment *attach)
  *     - dma_buf_mmap()
  *     - dma_buf_begin_cpu_access()
  *     - dma_buf_end_cpu_access()
- *     - dma_buf_map_attachment_unlocked()
+ *     - dma_buf_sgt_map_attachment_unlocked()
  *     - dma_buf_unmap_attachment_unlocked()
  *     - dma_buf_vmap_unlocked()
  *     - dma_buf_vunmap_unlocked()
@@ -1120,7 +1120,7 @@ void dma_buf_unpin(struct dma_buf_attachment *attach)
 EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, "DMA_BUF");
 
 /**
- * dma_buf_map_attachment - Returns the scatterlist table of the attachment;
+ * dma_buf_sgt_map_attachment - Returns the scatterlist table of the attachment;
  * mapped into _device_ address space. Is a wrapper for map_dma_buf() of the
  * dma_buf_ops.
  * @attach:	[in]	attachment whose scatterlist is to be returned
@@ -1140,8 +1140,8 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, "DMA_BUF");
  * Important: Dynamic importers must wait for the exclusive fence of the struct
  * dma_resv attached to the DMA-BUF first.
  */
-struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
-					enum dma_data_direction direction)
+struct sg_table *dma_buf_sgt_map_attachment(struct dma_buf_attachment *attach,
+					    enum dma_data_direction direction)
 {
 	const struct dma_buf_mapping_sgt_exp_ops *sgt_exp_ops =
 		dma_buf_get_sgt_ops(attach);
@@ -1213,20 +1213,20 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 
 	return sg_table;
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment, "DMA_BUF");
+EXPORT_SYMBOL_NS_GPL(dma_buf_sgt_map_attachment, "DMA_BUF");
 
 /**
- * dma_buf_map_attachment_unlocked - Returns the scatterlist table of the attachment;
+ * dma_buf_sgt_map_attachment_unlocked - Returns the scatterlist table of the attachment;
  * mapped into _device_ address space. Is a wrapper for map_dma_buf() of the
  * dma_buf_ops.
  * @attach:	[in]	attachment whose scatterlist is to be returned
  * @direction:	[in]	direction of DMA transfer
  *
- * Unlocked variant of dma_buf_map_attachment().
+ * Unlocked variant of dma_buf_sgt_map_attachment().
  */
 struct sg_table *
-dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
-				enum dma_data_direction direction)
+dma_buf_sgt_map_attachment_unlocked(struct dma_buf_attachment *attach,
+				    enum dma_data_direction direction)
 {
 	struct sg_table *sg_table;
 
@@ -1236,12 +1236,12 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
 		return ERR_PTR(-EINVAL);
 
 	dma_resv_lock(attach->dmabuf->resv, NULL);
-	sg_table = dma_buf_map_attachment(attach, direction);
+	sg_table = dma_buf_sgt_map_attachment(attach, direction);
 	dma_resv_unlock(attach->dmabuf->resv);
 
 	return sg_table;
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment_unlocked, "DMA_BUF");
+EXPORT_SYMBOL_NS_GPL(dma_buf_sgt_map_attachment_unlocked, "DMA_BUF");
 
 /**
  * dma_buf_unmap_attachment - unmaps and decreases usecount of the buffer;might
@@ -1251,7 +1251,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment_unlocked, "DMA_BUF");
  * @sg_table:	[in]	scatterlist info of the buffer to unmap
  * @direction:  [in]    direction of DMA transfer
  *
- * This unmaps a DMA mapping for @attached obtained by dma_buf_map_attachment().
+ * This unmaps a DMA mapping for @attached obtained by dma_buf_sgt_map_attachment().
  */
 void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 				struct sg_table *sg_table,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 2b931e855abd9d..6c8b2a3dde1f54 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -914,7 +914,8 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
 			struct sg_table *sgt;
 
 			attach = gtt->gobj->import_attach;
-			sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+			sgt = dma_buf_sgt_map_attachment(attach,
+							 DMA_BIDIRECTIONAL);
 			if (IS_ERR(sgt))
 				return PTR_ERR(sgt);
 
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index bf6968b1f22511..21b83b00b68254 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -531,7 +531,7 @@ armada_gem_prime_import(struct drm_device *dev, struct dma_buf *buf)
 	get_dma_buf(buf);
 
 	/*
-	 * Don't call dma_buf_map_attachment() here - it maps the
+	 * Don't call dma_buf_sgt_map_attachment() here - it maps the
 	 * scatterlist immediately for DMA, and this is not always
 	 * an appropriate thing to do.
 	 */
@@ -542,20 +542,22 @@ int armada_gem_map_import(struct armada_gem_object *dobj)
 {
 	int ret;
 
-	dobj->sgt = dma_buf_map_attachment_unlocked(dobj->obj.import_attach,
-						    DMA_TO_DEVICE);
+	dobj->sgt = dma_buf_sgt_map_attachment_unlocked(dobj->obj.import_attach,
+							DMA_TO_DEVICE);
 	if (IS_ERR(dobj->sgt)) {
 		ret = PTR_ERR(dobj->sgt);
 		dobj->sgt = NULL;
-		DRM_ERROR("dma_buf_map_attachment() error: %d\n", ret);
+		DRM_ERROR("dma_buf_sgt_map_attachment() error: %d\n", ret);
 		return ret;
 	}
 	if (dobj->sgt->nents > 1) {
-		DRM_ERROR("dma_buf_map_attachment() returned an (unsupported) scattered list\n");
+		DRM_ERROR(
+			"dma_buf_sgt_map_attachment() returned an (unsupported) scattered list\n");
 		return -EINVAL;
 	}
 	if (sg_dma_len(dobj->sgt->sgl) < dobj->obj.size) {
-		DRM_ERROR("dma_buf_map_attachment() returned a small buffer\n");
+		DRM_ERROR(
+			"dma_buf_sgt_map_attachment() returned a small buffer\n");
 		return -EINVAL;
 	}
 	dobj->dev_addr = sg_dma_address(dobj->sgt->sgl);
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 0852c60a722b67..c1afb9e0886c4f 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -1005,7 +1005,7 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 
 	get_dma_buf(dma_buf);
 
-	sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
+	sgt = dma_buf_sgt_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
 	if (IS_ERR(sgt)) {
 		ret = PTR_ERR(sgt);
 		goto fail_detach;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index a119623aed254b..92e2677eb5a33b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -242,8 +242,8 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
 
 	assert_object_held(obj);
 
-	sgt = dma_buf_map_attachment(obj->base.import_attach,
-				     DMA_BIDIRECTIONAL);
+	sgt = dma_buf_sgt_map_attachment(obj->base.import_attach,
+					 DMA_BIDIRECTIONAL);
 	if (IS_ERR(sgt))
 		return PTR_ERR(sgt);
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 2fda549dd82d2b..fcfa819caa389f 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -293,7 +293,8 @@ static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
 		goto out_import;
 	}
 
-	st = dma_buf_map_attachment_unlocked(import_attach, DMA_BIDIRECTIONAL);
+	st = dma_buf_sgt_map_attachment_unlocked(import_attach,
+						 DMA_BIDIRECTIONAL);
 	if (IS_ERR(st)) {
 		err = PTR_ERR(st);
 		goto out_detach;
diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
index 23beaeefab67d7..569ee2d3ab6f84 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
@@ -121,7 +121,7 @@ struct drm_gem_object *omap_gem_prime_import(struct drm_device *dev,
 
 	get_dma_buf(dma_buf);
 
-	sgt = dma_buf_map_attachment_unlocked(attach, DMA_TO_DEVICE);
+	sgt = dma_buf_sgt_map_attachment_unlocked(attach, DMA_TO_DEVICE);
 	if (IS_ERR(sgt)) {
 		ret = PTR_ERR(sgt);
 		goto fail_detach;
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 244c01819d56b5..4866d639bbb026 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -86,7 +86,8 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_
 			goto free;
 		}
 
-		map->sgt = dma_buf_map_attachment_unlocked(map->attach, direction);
+		map->sgt = dma_buf_sgt_map_attachment_unlocked(map->attach,
+							       direction);
 		if (IS_ERR(map->sgt)) {
 			dma_buf_detach(buf, map->attach);
 			err = PTR_ERR(map->sgt);
@@ -477,7 +478,8 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 			goto free;
 		}
 
-		bo->sgt = dma_buf_map_attachment_unlocked(attach, DMA_TO_DEVICE);
+		bo->sgt = dma_buf_sgt_map_attachment_unlocked(attach,
+							      DMA_TO_DEVICE);
 		if (IS_ERR(bo->sgt)) {
 			err = PTR_ERR(bo->sgt);
 			goto detach;
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index d7e1f741f941a3..3dbc1b41052068 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -163,7 +163,7 @@ int virtgpu_dma_buf_import_sgt(struct virtio_gpu_mem_entry **ents,
 	if (ret <= 0)
 		return ret < 0 ? ret : -ETIMEDOUT;
 
-	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+	sgt = dma_buf_sgt_map_attachment(attach, DMA_BIDIRECTIONAL);
 	if (IS_ERR(sgt))
 		return PTR_ERR(sgt);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 71acd45aa33b00..e5e716c5f33fa8 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -764,7 +764,7 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 		ttm_bo->sg = NULL;
 	}
 
-	sg = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+	sg = dma_buf_sgt_map_attachment(attach, DMA_BIDIRECTIONAL);
 	if (IS_ERR(sg))
 		return PTR_ERR(sg);
 
diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
index 7daac53c502e50..7556c3c7675c2c 100644
--- a/drivers/iio/industrialio-buffer.c
+++ b/drivers/iio/industrialio-buffer.c
@@ -1701,7 +1701,7 @@ static int iio_buffer_attach_dmabuf(struct iio_dev_buffer_pair *ib,
 	priv->dir = buffer->direction == IIO_BUFFER_DIRECTION_IN
 		? DMA_FROM_DEVICE : DMA_TO_DEVICE;
 
-	priv->sgt = dma_buf_map_attachment(attach, priv->dir);
+	priv->sgt = dma_buf_sgt_map_attachment(attach, priv->dir);
 	if (IS_ERR(priv->sgt)) {
 		err = PTR_ERR(priv->sgt);
 		dev_err(&indio_dev->dev, "Unable to map attachment: %d\n", err);
diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index 0ec2e4120cc94b..aac9f9d12f0f8f 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -29,8 +29,8 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 	if (umem_dmabuf->sgt)
 		goto wait_fence;
 
-	sgt = dma_buf_map_attachment(umem_dmabuf->attach,
-				     DMA_BIDIRECTIONAL);
+	sgt = dma_buf_sgt_map_attachment(umem_dmabuf->attach,
+					 DMA_BIDIRECTIONAL);
 	if (IS_ERR(sgt))
 		return PTR_ERR(sgt);
 
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 2df566f409b65e..4fe30a21e1e687 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1470,7 +1470,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 			vb->planes[plane].mem_priv = mem_priv;
 
 			/*
-			 * This pins the buffer(s) with dma_buf_map_attachment()). It's done
+			 * This pins the buffer(s) with dma_buf_sgt_map_attachment()). It's done
 			 * here instead just before the DMA, while queueing the buffer(s) so
 			 * userspace knows sooner rather than later if the dma-buf map fails.
 			 */
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 7a3bc31699bb90..de3eb4121aadb0 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -706,7 +706,7 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
 	}
 
 	/* get the associated scatterlist for this buffer */
-	sgt = dma_buf_map_attachment_unlocked(buf->db_attach, buf->dma_dir);
+	sgt = dma_buf_sgt_map_attachment_unlocked(buf->db_attach, buf->dma_dir);
 	if (IS_ERR(sgt)) {
 		pr_err("Error getting dmabuf scatterlist\n");
 		return -EINVAL;
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 03a836dce44f90..ed968d7e326449 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -568,7 +568,7 @@ static int vb2_dma_sg_map_dmabuf(void *mem_priv)
 	}
 
 	/* get the associated scatterlist for this buffer */
-	sgt = dma_buf_map_attachment_unlocked(buf->db_attach, buf->dma_dir);
+	sgt = dma_buf_sgt_map_attachment_unlocked(buf->db_attach, buf->dma_dir);
 	if (IS_ERR(sgt)) {
 		pr_err("Error getting dmabuf scatterlist\n");
 		return -EINVAL;
diff --git a/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c b/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
index b34244ea14dd06..595b759de4f939 100644
--- a/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
+++ b/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
@@ -102,7 +102,7 @@ int tegra_vde_dmabuf_cache_map(struct tegra_vde *vde,
 		goto err_unlock;
 	}
 
-	sgt = dma_buf_map_attachment_unlocked(attachment, dma_dir);
+	sgt = dma_buf_sgt_map_attachment_unlocked(attachment, dma_dir);
 	if (IS_ERR(sgt)) {
 		dev_err(dev, "Failed to get dmabufs sg_table\n");
 		err = PTR_ERR(sgt);
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 2ea57170e56b3e..52abf3290a580f 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -779,7 +779,8 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 		goto attach_err;
 	}
 
-	table = dma_buf_map_attachment_unlocked(map->attach, DMA_BIDIRECTIONAL);
+	table = dma_buf_sgt_map_attachment_unlocked(map->attach,
+						    DMA_BIDIRECTIONAL);
 	if (IS_ERR(table)) {
 		err = PTR_ERR(table);
 		goto map_err;
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 5c81ea9afa1249..d5d4bfc390ebc6 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1520,7 +1520,7 @@ static int ffs_dmabuf_attach(struct file *file, int fd)
 	if (err)
 		goto err_free_priv;
 
-	sg_table = dma_buf_map_attachment(attach, dir);
+	sg_table = dma_buf_sgt_map_attachment(attach, dir);
 	dma_resv_unlock(dmabuf->resv);
 
 	if (IS_ERR(sg_table)) {
diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index 91a31a22ba98aa..78125cc1aee322 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -590,7 +590,7 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
 
 	gntdev_dmabuf->u.imp.attach = attach;
 
-	sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
+	sgt = dma_buf_sgt_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
 	if (IS_ERR(sgt)) {
 		ret = ERR_CAST(sgt);
 		goto fail_detach;
diff --git a/include/linux/dma-buf-mapping.h b/include/linux/dma-buf-mapping.h
index f81e215401b49d..daddf30d0eceae 100644
--- a/include/linux/dma-buf-mapping.h
+++ b/include/linux/dma-buf-mapping.h
@@ -101,7 +101,7 @@ int dma_buf_match_mapping(struct dma_buf_match_args *args,
  *
  * When this type is matched the map/unmap functions are:
  *
- *  dma_buf_map_attachment()
+ *  dma_buf_sgt_map_attachment()
  *  dma_buf_unmap_attachment()
  *
  * The struct sg_table returned by those functions has only the DMA portions
@@ -117,7 +117,7 @@ struct dma_buf_mapping_sgt_exp_ops {
 	/**
 	 * @map_dma_buf:
 	 *
-	 * This is called by dma_buf_map_attachment() and is used to map a
+	 * This is called by dma_buf_sgt_map_attachment() and is used to map a
 	 * shared &dma_buf into device address space, and it is mandatory. It
 	 * can only be called if @attach has been called successfully.
 	 *
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 5feab8b8b5d517..1ed50ec261022e 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -475,7 +475,7 @@ struct dma_buf_attach_ops {
  *
  * An attachment is created by calling dma_buf_attach(), and released again by
  * calling dma_buf_detach(). The DMA mapping itself needed to initiate a
- * transfer is created by dma_buf_map_attachment() and freed again by calling
+ * transfer is created by dma_buf_sgt_map_attachment() and freed again by calling
  * dma_buf_unmap_attachment().
  */
 struct dma_buf_attachment {
@@ -580,8 +580,8 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags);
 struct dma_buf *dma_buf_get(int fd);
 void dma_buf_put(struct dma_buf *dmabuf);
 
-struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *,
-					enum dma_data_direction);
+struct sg_table *dma_buf_sgt_map_attachment(struct dma_buf_attachment *,
+					    enum dma_data_direction);
 void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct sg_table *,
 				enum dma_data_direction);
 void dma_buf_move_notify(struct dma_buf *dma_buf);
@@ -590,8 +590,8 @@ int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
 			   enum dma_data_direction dir);
 struct sg_table *
-dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
-				enum dma_data_direction direction);
+dma_buf_sgt_map_attachment_unlocked(struct dma_buf_attachment *attach,
+				    enum dma_data_direction direction);
 void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
 				       struct sg_table *sg_table,
 				       enum dma_data_direction direction);
diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index b99cf2c6670aa8..3b8c9752208bdf 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -137,7 +137,8 @@ static int io_import_dmabuf(struct io_zcrx_ifq *ifq,
 		goto err;
 	}
 
-	mem->sgt = dma_buf_map_attachment_unlocked(mem->attach, DMA_FROM_DEVICE);
+	mem->sgt = dma_buf_sgt_map_attachment_unlocked(mem->attach,
+						       DMA_FROM_DEVICE);
 	if (IS_ERR(mem->sgt)) {
 		ret = PTR_ERR(mem->sgt);
 		mem->sgt = NULL;
diff --git a/net/core/devmem.c b/net/core/devmem.c
index ec4217d6c0b4fd..ccdf3f70a4de9b 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -223,8 +223,8 @@ net_devmem_bind_dmabuf(struct net_device *dev,
 		goto err_free_binding;
 	}
 
-	binding->sgt = dma_buf_map_attachment_unlocked(binding->attachment,
-						       direction);
+	binding->sgt = dma_buf_sgt_map_attachment_unlocked(binding->attachment,
+							   direction);
 	if (IS_ERR(binding->sgt)) {
 		err = PTR_ERR(binding->sgt);
 		NL_SET_ERR_MSG(extack, "Failed to map dmabuf attachment");
-- 
2.43.0


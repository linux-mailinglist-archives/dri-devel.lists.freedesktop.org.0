Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 828CD5AF5A2
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 22:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8234210EA83;
	Tue,  6 Sep 2022 20:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACCB10EA7E;
 Tue,  6 Sep 2022 20:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662495424; x=1694031424;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=t3tRAGMT9XkcPnOx0NHixcOfXhtq+FPnW0bmN3b3jlg=;
 b=StpxNifz0w8U5DdXCWdf4sLGhlMB7enportx0bDGg3WOozl/KMrj5xZm
 +wx7JszFI2hAi9hta34mKccWeSGcyjSuUMvTf6IcM6A+azPjP8pybsbsy
 ZO4aUvSBm/MkL0XAhnkWT5E+WZabidgKNagXv4w5fVaBhvPR5666BoaGX
 DXBktnP1j5DW1jWBjqAqu4+ZY6ERIsf7gfu55iJ++P8joN6pyB1VeIJJe
 hExVJTfhvQuUHL52t1wVjk1qEmjPEDYm/DSfHptcT6+ihFMQ19wwE1/84
 Jhu8l68qSn9uegq6hIY3/hKJpRNPqBfI0ND+Rlhp+PVLWg7tTaybInzGD Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="297479832"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="297479832"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 13:17:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="789801764"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 06 Sep 2022 13:17:03 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 13:17:03 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 13:17:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 13:17:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 13:17:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B96lc7Kjuq4SGapfyxAtZMomaZNDbOJbbrT3KC5MWMH/lfxbnaKcQylGHM/F31CyXhWGw5QeXCXQGaldEJBNEOEfyAKeaMgPm80O9reVJ/UTO+NkxRsKb3ugSClzqo4JVBQXaFI0GFOiz8qT0BYSLVFQSFr2S0UWqjkZhrKYPrb5MtyU52Xrf9UqDgT0FvQKW9MWF5WXG9CJsHVxufwEsfbvqTonYAfBP9U7FagUix3XL48Y2wnmkgTtf+eqqXLmwhJQ98UWlOZRmoaaGAKCTzeLSszgk525ZZCBfqrca2chzsPEuIl5RPDReUNPbXZDV5+FuG6uQ378f4Qg4Xc3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2A9AXpXnBhks8FcmX8onD+Qe1k9pkbV2ikpg/TFyqiU=;
 b=SxRmzESSteqacVubgQ6tYNZfyNoUKx/PQwr3PZf9/KCYHKlX1gbeocB9o5H/0TxRb4n82MjN4pLSgXxwvjGxlf47xmvTb0DoZsHgy6BweuSxipI0TUDS9Xn1ACbyHgAThiKM9pA0jnceXbcBN+iaG7uykHcjhDIj7Rd/1EAOGWpJAdZCOWZDPdOR/Q/Ci0iNy0TL7QAEYS1UjrBglzcuOL+aj5DhpohJp7iRg4awSeze6bM6pD+OtLH8j360/VoXolpaaGTCW19HAmwZQG6Li8MsXTqHJVWNNX4sbdlVzApKMy5VV2oCWddhO8k6FcL+JCc1ZyQg1wpFckTDpjI8UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH0PR11MB5396.namprd11.prod.outlook.com (2603:10b6:610:bb::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.12; Tue, 6 Sep 2022 20:17:00 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 20:16:59 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 0/3] drm: Use full allocated minor range for DRM
Date: Tue, 6 Sep 2022 22:16:26 +0200
Message-ID: <20220906201629.419160-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR04CA0020.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::33) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f85773b-14f2-447e-a501-08da9044c088
X-MS-TrafficTypeDiagnostic: CH0PR11MB5396:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LQMOOvDf8aS+1ARCha/XdaoWBmVx8w9dtS4db0jt0WV/E3YG7tg9XjMsbglqFuzIyGbSOjN+c/rb6Y/+6RSRdjqxqQnAd97gKcQ/+HhQ8LHD78GlpBLfdj9GBy4C3MJzXAgzKGvEPOdmiIeG7EKzoCg5U/cte03p1m0O9b8bcIGiD+d0YV8dU12Y/rAX8FnAkGUGp49so3bD1twOlI1zjidK/+5Fx/sDZj9FBh7xQMvEQzo69pa9sbcgcoWYpLffGkywf41Aj47ycEq3c60FPg5QJhipzwU+LHKsRKySC/hp0p2OC381Or0+543Uxfgn/n5PP9+m3Yo4gwLW2tebO+khfKe6KJTxroTyMFRRhHCzdhMDlhmuHKARB2bfF9G9USCYLIz2PT/JktVqbDzTyAup4u5Sah4qegzuJAX6yufXObd3MbbdEaFKJ/pmNzhbWEmLmeI/E9VKaTdbAM+w/Cjnljvd3ktK80Tzs1ZSUCKOQjB38RagJARROoJ9bCoyVQnC1BwLqBaM2CmlYdJ/QZLUbPlW9B+4YTzFSAA2TpLY1x0D0ZYkulYi1hqp5KPirWmdaprrSK2NEkcIoghV1/D3gJO2hCHAon49LFCti+I1SVrOp+nVlIEKp8naaCBWZd4hio3j+YIyqSL/reCZSjCS0MFb4PNfQ+pxlePZ+DtSdO2SYj+o/rI9/gLjXa3rG/eHIZpVnJUsDkBUqXld/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(346002)(136003)(39860400002)(366004)(4744005)(316002)(54906003)(86362001)(82960400001)(36756003)(2906002)(38100700002)(5660300002)(8936002)(7416002)(66946007)(4326008)(66476007)(83380400001)(8676002)(6512007)(6486002)(2616005)(6666004)(186003)(1076003)(6506007)(478600001)(66556008)(41300700001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WW1VS0grcFd4VEJWcVBWZERxUEhQMG8zejZuMUpLWmFvdzJHaGduWVNXUjQz?=
 =?utf-8?B?OFEveUhMc243VUFjcXZZSzN5eEFOYjFOcWNnbDBERjZId2lkYjBuVm9uZGlv?=
 =?utf-8?B?c3pOUTFmaXJjdXhibllJQzhrZ2RCSmhqVFZkd1R5RzdCcDJBR0V3SU1YU2VR?=
 =?utf-8?B?empJWFdZaEk4UUVmOFRJWHkyVmlxUFprc1dUUit0amJMblZ1M2lQMXJ6VXM0?=
 =?utf-8?B?VTcwQUtUaDBLK1FGZmRSZms5aFlsYVh0Yk1Rd0FBZXQzNktrTlVwNGZDTWQv?=
 =?utf-8?B?NWY5ZzI4WDRxUWxKdlorQnRFNEFDd3AxQkxCTFIxSW00WTBjWUdZMUFORmVR?=
 =?utf-8?B?OEZScVdDRmpOeUhLdTFIOUNSR3NwOTlkR0t0SC9ML1NsdlNCTUJpOXRGSU9I?=
 =?utf-8?B?bUs0SjNjTEM2ZWNnbUdNNTkzeHp2Y0xxSS81cmtwNEFPbUI4cGxaS3J5VnZ5?=
 =?utf-8?B?dVVkbllyTHd2UG1xZUl4RkdOVEF1OUVUbVozY3NXQU5MQmtodzFQd1Z0K2tx?=
 =?utf-8?B?NTNDcytIaEJDdHBQU0dRc2J2bWIyY09iOWM1WHd4YUpEMitKOVFPeUN1QnJB?=
 =?utf-8?B?RGpVUGwwNmxFNHo2M3lUSFNPSUlVNTVDcStwcnF5OVZvWHBQcDFOcGI0L0dY?=
 =?utf-8?B?UGl5RU5JNVFtd2creWNHSWN3b0dieTNPbzU1SjlKR2NQdFc2bnpHQVNqck1Y?=
 =?utf-8?B?TUExNk96cGdKR3N0VXdRVTJEeGIzVHdtV1RkUTV3TjljTnZ0Z291cGFZOWlo?=
 =?utf-8?B?YTVYTlhrT0NnY2pCTkkrTWtlVU1jS2tQalZEQzlhUDJhN3ZoOVR0WE1vOVVu?=
 =?utf-8?B?cVFSZldMbzhmQ3dOYVNlbUI4Q1pOM3haanZVZ1cvdDJuQVlXQXBlWG9PbWRi?=
 =?utf-8?B?Ni9vRlBGVWFpL0Z3cHFRM1lURkNjUVdNZVJpYmtVb1Q1UnZnQkhFYm9yR1Ns?=
 =?utf-8?B?dG5INDhLZzZUdW5IT0NBUzQ2UmVzeWI5NVBjNFBqbjRGT2xibVdDMHJTcEJr?=
 =?utf-8?B?bFBOSDNYM1RNRTIwUW90Zi90STFIck90Nld2cFpDMXpxN2Y1NWN2SlhGcDN4?=
 =?utf-8?B?cU8ydTZjWlh2TUtnMjF6dkp3Yy9kZ1Y2TUUrTXl3TG9ab0xKeVRZdlQvbG9s?=
 =?utf-8?B?NmhpRmhMQ2dZS2Y4ZVRUNUg4MExEWGlIVTBTWURqR2NPQktVSzVPMmxDaGhF?=
 =?utf-8?B?aEhhR0NWdHpGNER0OHRmRmVLdGUrWEU0OGdZZkhCK3owVlNJQ2c4QXVMYW1U?=
 =?utf-8?B?MXR6L3RQNnVvR1B3cXJ3NG5SL01CRVVSSllzZzdSdlVwWEd0MWNFaWxsOXVw?=
 =?utf-8?B?aFZrSllQZTBNbnd3Mk1FaVBxTGllRS90M3lacE1PZ2s0OTVwY1d5bGJoRStL?=
 =?utf-8?B?QjZEa1JnQnE2U1NQR0Q3YWVrWERtVTVaekxKbnkvQnNtTFBnRHpLVU9henBY?=
 =?utf-8?B?dDZ4R1NEZHZVYVFxNy9XZUdyRmVyNy9EOU10c0VFNi9rdno3aWdCSmpnN0gv?=
 =?utf-8?B?QTE0R2JEZnBSUzNwbXlaR2lPWFFFS1VvVU1OU2JtYmdYYk1xd00zQXNWaThq?=
 =?utf-8?B?WjBudnhyNVNRRGxJTGlaMy9vR1lvckJZNFhGMzJHQzIxYkxCNys0OGFNRzM5?=
 =?utf-8?B?aHlQN3dxQkpCSkVtREpwR1gwMEYxTnRKbXlwanVzZXBORDY3bExMTlk4SDNx?=
 =?utf-8?B?NE9tRDhpWjdBWGRnakk3eGIwell6Mi9DcWRWTWY1aU1qamlhQjhZKzBKQU5C?=
 =?utf-8?B?dkM4ZTRYTlZhL3E4azZaSFNNMG40TG5CdWhwOXd4UTF2c3hWVnNEaXdqRmhF?=
 =?utf-8?B?cWMwWENsb3c1NE0xL0FOVTJGNkN1VjRFOGM0eXZBY29vVXZYMVFSb1ZucWlt?=
 =?utf-8?B?Vm5LTzF3Nng0MjNGbmxXS1lCZEJvWWYvSTh3eTBvSGw1bmJFTURaTzJ0a2dT?=
 =?utf-8?B?RDVCUkdWRGJjc3VXZXdxUkU0YjNhM0MzalZpTnhKU2lUeHo4MDRYRnJLakpB?=
 =?utf-8?B?V1lEYk14ZS8zYTJ4NjZxSm1QL3RuaU1talpTY1J2YXN2STBRTHh4TVQrNWRz?=
 =?utf-8?B?T2dES1phQTd4SWhmYlhYTXhmV3VGNTUwMDFPSTdvOTJHL0d5YTBTVEc3OTNH?=
 =?utf-8?B?Y01mZEVpOVZUeU13Qkt2TGpMZWhWQzNxeVRzcHptZTZFaFRha1hOczE4dXVu?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f85773b-14f2-447e-a501-08da9044c088
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 20:16:59.0265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WsyMNSyloT+vKmQKlPbt5WuYt67LdILKwCIpzeNPHafXNFA9BaVMLyv0uBDTBXA2NHsfuTG/I71jFoh8ABdKdDwmAvQQZ0VOL5kBA0eOe34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5396
X-OriginatorOrg: intel.com
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 David Airlie <airlied@linux.ie>, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

64 DRM device nodes is not enough for everyone.
Upgrade it to ~512K (which definitely is more than enough).

To allow testing userspace support for >64 devices, add additional DRM
modparam (skip_legacy_minors) which causes DRM to skip allocating minors
in 0-192 range.
Additionally - convert minors to use XArray instead of IDR to simplify the
locking.

v1 -> v2:
Don't touch DRM_MINOR_CONTROL and its range (Simon Ser)

v2 -> v3:
Don't use legacy scheme for >=192 minor range (Dave Airlie)
Add modparam for testing (Dave Airlie)
Add lockdep annotation for IDR (Daniel Vetter)

v3 -> v4:
Convert from IDR to XArray (Matthew Wilcox)

Michał Winiarski (3):
  drm: Use XArray instead of IDR for minors
  drm: Expand max DRM device number to full MINORBITS
  drm: Introduce skip_legacy_minors modparam

 drivers/gpu/drm/drm_drv.c | 66 +++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

-- 
2.37.3


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3390F8043F1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 02:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B1D10E458;
	Tue,  5 Dec 2023 01:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3341C10E376;
 Tue,  5 Dec 2023 01:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701739360; x=1733275360;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=/KRnXauEAOtxAh8pRgl7NtYOoKySCCtw3a7e+b3zVG0=;
 b=CV3F0PPAOsMBLfzegQGHCk+vFpMPwl2eVkuDvyZ3Vv+MsSCM39KJJx8p
 u4lmF/CCJOQrrKKEMDkUTKtFaE2zBO5jMhB0P4DhRxK+Y9q/3aTsJagIQ
 aoAteJhUiThoxhnRip0Sn40u13/7AA3/bcSkuGBdGohufr/jEDUBo522A
 ZXIQeFyA56uBe+SRQPkitV6fmtUiE87CdZcZGYSv3vEsjJRZ7FyfsZGGB
 iWszRWIioCZH3RmNFtMRt98oQo0G4K6ljfdqZBrTcGalZvH9Qgdy1wU5X
 Y87xS6y+O1CAT0RqjAE87uK1u/THe4Xb8siuGd9fxDpwPetv0qurhUi5N A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="424982890"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="424982890"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:22:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="805089160"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="805089160"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:22:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:22:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:22:38 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:22:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9EKMXhHTORsLHGaQs1tPev0O57QIBgotAHu28spi3pvl7pXOrdS1lnJ21eN3LadJUj/P+L69gMOXpi10HsMVeZGzOb38voVlxMnuZVdB0PKQAzro/SiAy67C+aUS/t9ZWF9NlBbvFuxwh1XSbVTrRn33dpbdmRSk5PF/l0ongrOu9lFg4ihH8LIx1R06u9ZjyL1jV51AAtGB9bx6oJ5M+M7Sy2a75ANNHp2/oaDSXFAVdi1x95XVZD1xxxVfamcsxI/l3YssL4LV6sqU3TeEqLeSjP6DtCP6mNkUc8KLfPlXUNY8AhwVFVM3EcIbrkGEQ9BUStyKLtTIHnyG0ZRAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsoveNRYj9IEnYsjpcmWWEMQ1KU94lp3NVfwmulhFNs=;
 b=QjihE/5ZUJXzBBxzri00WJDs9jS/JfIq1Pzm/8LugV5odMVpgp6QNl7ej92LY/XjMLliY308ZTsw1C2Frmb0WArFcAsW18aLVfVPFjB1n3bM+Iy1pugxNxSwfvume6a6oGZdQfNkK9X7LZ2rgb8VawfVQbnjkAU9X3nOnBy8bxd4/5rK3XYvKjWOIFYWe9HOF6XpFq2Qb/T/par8f+cTUdLecf9qsB6tRTWalBew1fROS8KPt5EHV3rD7Ua5sIEFmNLbJWpEeRddupAoW1YUq50oHa80qhbzUxJ41ureI67oLUa5lcXCiOBw4oHl6tW6k238ek6LYQaO3FJFXDxDlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ2PR11MB7618.namprd11.prod.outlook.com (2603:10b6:a03:4cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Tue, 5 Dec
 2023 01:22:36 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:22:36 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] drm/managed: Add drmm_release_action
Date: Tue, 5 Dec 2023 02:22:07 +0100
Message-ID: <20231205012210.1491532-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::8) To BL1PR11MB5365.namprd11.prod.outlook.com
 (2603:10b6:208:308::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ2PR11MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ba5a4f-a4c3-4963-2cee-08dbf530a9b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qa8mQnIJvFCvhBsh6c8J3wUkoCg7lQwWjxXFhWH/MdeiPxod6PqfP2hxme5egNWWR6TupxqQStZ91hbkjioSooMzr66GnxrRhirUQPIk0cTeSR06xVyw+w/RN51RGapu7JRctqMa7U6XCmRnZtWRMHkGr910STdnmyuTvLRNckGDQXSD76bqKdyaRdNyM6kke9eterAAVTmcaBhsPqHMOzwweDETYUJaGIgbLHg4YTp+kFXVKmkgBMkQ8S3EPHhofEtRUZmqdU3tFC8210nFZyX0nws52YTfLQY1VTv5qbsvKwdDQ+UFWeVo17vFBg1pxsK36xlUzs2eMZWkH8nOTzWCuKbl4JUo3e5bnukWRsJU5ageqf6m2ASFQS7VpaIlXjKh2p8sLbGwY/2x9wPbjpLsfwwgX3d96TebzeQEOCRtWbau4P41Nu+/muvXPkgI/laqHQMiPfSrSqjMRzsSC/VJLpSWZif52BQK10lIWuiYTF+q6oRU3JO2HsBk3YgJfahoTNai/2ICBMzjrYB3ARWlm0kzSV+45A5ZnD/xAnc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(5660300002)(4744005)(86362001)(4326008)(8676002)(8936002)(2906002)(7416002)(41300700001)(6512007)(36756003)(1076003)(6506007)(2616005)(82960400001)(6666004)(83380400001)(6486002)(478600001)(26005)(38100700002)(316002)(54906003)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0JvL3RtUHExUDdXSDlFTmFGbTNTSll4aitUMnVqSXNxdUZSdGZBbVIxK2Fh?=
 =?utf-8?B?MTFydjh6N2tnSytlMFJXMDl5aVJsSlh1R1NtdDE5clczV0tabUVmRTl3VVR0?=
 =?utf-8?B?R3NxcTlSYVVIQ2ZyOHRPcmhPN2tWaXBtaFdzMjZhcDg4R1dscmlnSmtocGIx?=
 =?utf-8?B?TzNZZktMcVB6YUF2OExqQXNlUmZmUUdNZ0NZaFJ4QS83TDM5WkJCNUltVnox?=
 =?utf-8?B?aE9RRm5zdkxWcnh4Z3hmMUZjbXNmZTNQMWRPZWZRYWZQcXJqRERGT3ZoNW1G?=
 =?utf-8?B?dHpXYU9YdW50ZGZBa3R6SlVoYU1NNy8reGdxMVhCZ1dmSXF3ZGFMa0Y1c291?=
 =?utf-8?B?M2lzNWQyYnR0VWQ2clJEUkJkWllnVEc0R091WmdQV3Q3L3NoRURWR1FtcDI5?=
 =?utf-8?B?anE3VjZNL21nOFFyeGd6MjdvS1NnVklDcTdNMDJ5Y1M2Z3d3NFEzdmlnSGhr?=
 =?utf-8?B?RFg1QTB2aC9ZL0dudGt2QVFHU2JnVDZoa0hvWGE2ejNRU1gwbDhINEJMZVZV?=
 =?utf-8?B?emlRUWFBS21ZSUcxK1loRjZ1OFNYM0VRL1NQcGR1N3dCdXJ3T0hLaUxydm9B?=
 =?utf-8?B?a1lZVnJJWXRUTzM0OU5zajY5d0J0MGhSbTh5L1c2ci9ycGpCdXpaa2MyL0cz?=
 =?utf-8?B?VjY4WEtDQkI5aDhzVXhKU256bnppR0xGZlpLVWRieUc3dWFDVGEzUlVqTXh4?=
 =?utf-8?B?aHZkeXUvQU4zQnJZdnplcXA3ZTdZNzZtNEhOK2tpQ2JsR2swa09wSG1iZEN1?=
 =?utf-8?B?b2EzTEhnYWVQVlc4NERyUXFrYzVUdmVRYU03eUpXNE9BaDBFQ0tuQzQ5c3dy?=
 =?utf-8?B?TTBDdjgxWWhRdU1OQjAyVmtaMjFpUmhhNmFOK3VVYTVHZTZYbkhRSTNUd2RX?=
 =?utf-8?B?WGJLRy9GZUc3cUFZSkRhc0JmcGRTTEh3Q1RqR2VrS0o3RVNSOHJnWTZtcEg5?=
 =?utf-8?B?MjlXU3JyY2x0azc3U3d3S2NqR2l5UTQ1aW1zREpjT3dYUXBRUXNxNm5YL0hv?=
 =?utf-8?B?cU9CQk1NQnhTZHhjT2EwcXd0SHlDTVBzbUVZeUhjdFdhekNxSTFCcllkb1ZN?=
 =?utf-8?B?ZWRkcEJxQjAvUjJndDgzZzd3dVQ4UEFlR0JDSjFyaEVpZTkyNHRyczgwYk94?=
 =?utf-8?B?UTNtZDlaL2FNMEhjNlB3dnl0ekNETkFVeWRUNW4vM3J2eHMvNUhqQ0w1aEFR?=
 =?utf-8?B?TElBUWJMYkdSTXFuMWtZbnl4Tk5IL1VVdjJJTXRPaWErTUJIcVdZcDBBZ2xp?=
 =?utf-8?B?UVlnYzhLZ0NlSmc4aVNPT25uUlQ5R1g5Z2I0TFQ4a2tkTGxUR01uR29henE1?=
 =?utf-8?B?RWo3bk94Z2tDcXRYV2hvVHUwVWJCRVNzdUd4cmFSRGtLckZjTGJPc2VrUjRE?=
 =?utf-8?B?RUdaQjN0Q3dRRGR6RkNnMEFPSXl2dDhUWnVjUnlqMTdQWmZRMHVUaU1aWGpI?=
 =?utf-8?B?YkZOQWVSMUs4S1drbU5PcFBSbkJlWWlUZFphazM2anMrOG94MGgrU2IwamVR?=
 =?utf-8?B?TEgvelZmTkliMnNOUXJvSE9xaXp0bk1JenNVR2FpK0h4b2tmZ0p2MUVUbEIv?=
 =?utf-8?B?YjhWY1kwcnY0bkpEQzdnanJmZStNS3RXTDJlK2lPNFQ1WGhocU82Ymh3bWd5?=
 =?utf-8?B?VmJjcEJxOFNkdkRvVDJlTVJnNjR3QkhmYVU5VzBLL2gwS1E1T0w1MGoyU2hU?=
 =?utf-8?B?VlpqUEVNVVZDdytvLzRWL1FsNVBSTEpsL0RleUFUVjF0c2VKMzFzY1B1VDh5?=
 =?utf-8?B?VlNxOThnQXVhdjRPNmhWNDI5ZnVsWVQ1bHh6cDZQb3FuR1RqWHJCOUg3enIy?=
 =?utf-8?B?dUNld2VlOGhhbmpOaUk3emlTakt1L2NKeUp4bHJXT04xcFBUSkR2WjBlYUdy?=
 =?utf-8?B?NkRiVGs2SndjTFpVOFZIcVBJaEd1U0NWWEdLYjdKQXUrYkpXYiszSDhReG4v?=
 =?utf-8?B?YXJ4TDI5TVVuV1J6aVRQYy81ejJXOGxIZFpMWEgrN0xMU0ptRHV3bjJVZlR2?=
 =?utf-8?B?SnkvWGorSHhsY210bXhPZWV4STdkdnNta0pRUnFJaHN6MzFGNzlZUlRTNUdR?=
 =?utf-8?B?djJBb28wdG82STEySEMvSlBCbjVmWDJzQ21oc2Q1UERQWkcrelZMbkpFTGpB?=
 =?utf-8?B?UEt6N0FLWUtvVVpveEcrU2NPekgwQTZaY0RkU0tCcGhoZGVHY1pkVVYyczBm?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ba5a4f-a4c3-4963-2cee-08dbf530a9b2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:22:36.6552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMUHkZFOxJ+Y5i/yfACQu1DezGz1YYcNnyEoQm97l6Ls4YusfDhIQqW6b+syRC4xkaI2K3K0MWI/LiaM6r9vzzzoa5lsKALB1bI74idb1go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7618
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
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Upcoming Intel Xe driver will need to have a more fine-grained control
over DRM managed actions - namely, the ability to release a given
action, triggering it manually at a different point in time than the
final drm_dev_put().
This series adds a drmm_release_action function (which is similar to
devres devm_release_action) and a simple test that uses it.

v1 -> v2:
- Split the test changes (Maxime)
- Simplify priv lifetime management (Maxime)

Michał Winiarski (3):
  drm/managed: Add drmm_release_action
  drm/tests: managed: Extract device initialization into test init
  drm/tests: managed: Add a simple test for drmm_managed_release

 drivers/gpu/drm/drm_managed.c            | 39 +++++++++++++++
 drivers/gpu/drm/tests/drm_managed_test.c | 63 ++++++++++++++++++------
 include/drm/drm_managed.h                |  4 ++
 3 files changed, 91 insertions(+), 15 deletions(-)

-- 
2.43.0


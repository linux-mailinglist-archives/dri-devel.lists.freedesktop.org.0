Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E305182518E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 11:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1461610E599;
	Fri,  5 Jan 2024 10:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3421610E597;
 Fri,  5 Jan 2024 10:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704449620; x=1735985620;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=jG+UXnu39siiUHFWD+cX+4Xt4Vu6x/mdodFTmIoQACs=;
 b=WmM+dhAbW5sO4TEswCryo5hR6IVqCgJxreiFIOTTKbhdyxGhHXJIDvnQ
 Ww38Mc0WyQ9AlxWu6axuV3rb0nNAxcad6S0OoR4sMPtdsLRxaw4w64cng
 /pdHAKtRrGfnne5tPyGbp++DCfsQ5gwp5BTpsUw6LIdDlclfa/BYBOI+b
 d95K3Ylge+rm9QujXwPHlJ5v3hPlViWxvUxypfpta5afM7aKoq/XYd2f9
 VmwyCMf5u6pr0zMlez8d521zycjU1TRz8wQ6+3jHByehFyw9azEJr1gg/
 /AKT1/0DE/227KIsDXDUNTqx0j7fxW2WOgW+i391ME8TMwLk9i0Xn+9PW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="376967336"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="376967336"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 02:13:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="904113834"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="904113834"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 02:13:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 02:13:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 02:13:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 02:13:38 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 02:13:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyp0dkxo8XtB685ERSSraYQuN6t3SGFIKq0KeHGf2yRvUlHywOathWctaAk2IcDDLcPz2GHqRhqBLkoTSu+C81hd4UoQfhXBFPLy4u8CFJ5E8RT4vCv1E7MSvsKjOtMcsTPAO3TniL6Qvdy8bgVYzUL49VoxIBfz6kNcBf2aOal12zU3p84XhnerQ8qQlKFDO5xKj+U++O/SUVnWw1vDQOV1GkayzVNvW53s/X+RDaja5aeK4JyopqY0PR+7XG1lqL0cg+qIlFAYDbmXJKU6mTujMaFaLeywQkyJywiZ01TfpaQ37dnW63qjYzflVkZW0r88nU/uPZYhWuAV5ENgHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LyqUh89AtYOl8u/v5U0Fc2slc/zlHAFLwUHPYIImPE=;
 b=IpDiuwAew78y4QPjcbG4Yic0tNTzYcm3cdjTw2ND6tvLIyG3GynJCnSP88tqsV4u7ih2RxPZudS9t7IpOAMbaCoSIWyhkvFLraRW+gXaWczlXeWl03/YqYLZdBjn8312+FrOYRJSilE8tGSlSjOVJq1TT75zsknmFzPz3PfFCZ9snLkB1MGZMmjvXY6ryyPHSpmFDpna/WRBD4Axg+mpKio2dKWZNDbS7lFcHlx54WIMLgypfeQAmb5xB+UGFRe1JGas/0Prw2fvIcqj3ogpR2sR+HUY4syN9Whb7JpaaZwl5Ric7CQPEelMky7Y7hqkUpCG8f5sqyAsCmKo8j/7+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.14; Fri, 5 Jan 2024 10:13:30 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 10:13:30 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/6] drm/managed: Add drmm_release_action
Date: Fri, 5 Jan 2024 11:13:18 +0100
Message-ID: <20240105101324.26811-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV3PR11MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f83b4c-f7d4-4474-2e16-08dc0dd6f732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RN2l+gRXmx90Vqyw5pN7WCFvYlOCurjD0U9qlqdkBLcaTlbwFRwCyCzFj6rAyoK4Nykl1NyPbMtYY+x1fdNC6tzCa7RGwx3wj9aj/hcHtSmAHWZhkg1wnzOBxM+O9fVIJ15JBv56eH5k92NI0UR3QSrWHw69hChD4+XvbZTR1D1sqpyxKGnpJjjJbLd4TM2dyS09gjm06K0UkwYC4QwEic+KxXzfsMzG5h0UL8zqtChDxmL9Romd6MNtZAcvInOa/0nqOVhFCB5cVZYGcF77QzBn3DNU4BgejkZAyuQiGIVg0ah9O0ty8rVstOrk73CNDdlqmjOX6jBUgxRbjqoMjjjyKnvUMNkEZXgXSaZqEQ4Ft117UhjiY43nJoa0DcVWXI3SBxFrahwSYMIYd+dyBgKHcjonrFqnBYF5+CYqOZzTr1TaJ41tuqENKnWyHkCBsHyixDcktdK01Jxq0bRHmZW8kdIjNOUBbDS2Q91c25xum0mlCGXdcq1zLrlK5dBj5Y4Em/xaPaoSnSAfyOK3rNLwpEsHbUDnUItBOpaV5ZJfPOzaUktIh0XMu7rfm8jv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6506007)(6512007)(6666004)(66476007)(478600001)(66556008)(66946007)(8676002)(8936002)(316002)(54906003)(2906002)(6486002)(26005)(1076003)(83380400001)(2616005)(41300700001)(5660300002)(7416002)(4326008)(36756003)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHlLaTNiS1NQcEpyMlFvUWMvcm1tTUpIemFGdjF1KzVjOERtMElXM2lyajA3?=
 =?utf-8?B?dUY1clRJV1U0NlorQ0E1cTFCZzRqaTRXb2pQbUx4NnpDcEZmK1U3dHlpaUZq?=
 =?utf-8?B?TjllQXgyLy9HVm5tNGFxOGgxanFrR0pYaHdWSjY5TGFhWER0ajljWEkyTzJv?=
 =?utf-8?B?TUJGb2hRZCtubWpuWURMZDhEa0c4VWNqbjBLbXdobHYyZWVlRldydGpmV0l3?=
 =?utf-8?B?RDlJS2pyY0xRRkVjT0RRUzlUUVNRNFBaRWNLT1F4ckZ6d2toZDBtQis1SWxa?=
 =?utf-8?B?UWpjd2swM2g1R0QwbVNiQndiQjh4aENma2FBM2QrZk9DUlZ3WFBRcjBDMU1w?=
 =?utf-8?B?K3FZZWNEd3BOOU1QWWQ1S2x1akdTNE1NV25ObXY4R1Iwa2ZsMXJ6UWxRdUto?=
 =?utf-8?B?UDV2S3FrcXlKVGExQTdZT0tYV1BETlFnQ3ArZFNPUkhZZlBVQWNwdy91c09r?=
 =?utf-8?B?U0FLdFlOTFJuZC9TNkhvSUt2WWRWNURPUUlNcUh3Ni9TZ2M0L1FsbHo2V2JI?=
 =?utf-8?B?Z2dvSXQwOVArVWVlRVJORU45VjRkNUZVM29xb29vTTNTOW9tRDNUcXV6UVlt?=
 =?utf-8?B?K3VpYTdjK1YyZnNLUHgyd1I3Y2RBUHBpU0lINExIcmRSSlp1SzlGZkNRK3cy?=
 =?utf-8?B?bHoxdzAzTTFKVThQTXdSS2xhLzVORUI2WlZnSDJ6K0t4MEVldEFCKzdZTWVB?=
 =?utf-8?B?RDRmcFE3a0N1RUdBM2UzNXRid1NDR0JVRVhRSVQ3Zm0zeTBOeGQrZnArWlhm?=
 =?utf-8?B?L29MbzRBdVJPaGJvYUxNVXZWWEg5ZFcvMnhkbzdRTUovVGY4M3hBMlFvYjdB?=
 =?utf-8?B?Y1Vka1pmOUpHZXA4cVFaNE9HS1hVT2RBTFBXUDRLRCt6eDFNWlZrRkJOdkdI?=
 =?utf-8?B?eEhmSHMrUzlwWmRjZXR0c1RSbjMvK2k5TjhYc3c2Zm5USXpoU3dtWWp3c2pZ?=
 =?utf-8?B?YXF4OVVrOW16VnpiRU1vRWZySWJuNHM2MzFFTGFvWDVBQXpxQXJOdmM2ZmdV?=
 =?utf-8?B?aC9XbEFBQnpSM3hSUUVjeDZjdjhSY0lReEJFV25SQTZGWWl6ZDJQN3dQeWIz?=
 =?utf-8?B?VGw2dnRvMk5aVU5nRWhhaWZZVTFhUkNqSjFzaHFDUUhCcks4OU9sdGxTczhC?=
 =?utf-8?B?aERvUzkrOVY3V1ZiN1lCK3NxaGg1cSt1anNzRURRVm5mc2dsd2VFYnNEQjhM?=
 =?utf-8?B?OWtaZXlteUtPME5sQ3BQWVlqK2FwTmxQUHhmSFhNNlpKazFLUVhHN1JiekJC?=
 =?utf-8?B?Y3hVSHpJSHZmN01UaEFQRGZJVVM2bXE0ZW5wQzM4ZkV5ejZyYjdnb1U0NklC?=
 =?utf-8?B?UHJtRUxyRzFSUDI0d2F0QXc4Um82R1RNYVAralIzM0YwOG1mTzJHTGhVOFd6?=
 =?utf-8?B?dlVEd210MnMranB1dVp3UGxqYTgxVUExZ3NCZUNrd2tLWVdoMjlZN09yMW1N?=
 =?utf-8?B?QmFkOHNyUkhpSUNQQ2NHQ01jM1ZmaDdERUJOS2NNcloxVTVCbGFYS2FCYXNw?=
 =?utf-8?B?VlllWTg3MmZLSTJGdlh2NnNZQ2UwTFVIb2EzaDg2WEQ5bVJRQlh2MzRuTkk3?=
 =?utf-8?B?aXNoWXhBMG9EcXlGVmVoa1JJZWlmSjErOE5Bb2QzUHY1d0EwMGFDN1ZCeGE1?=
 =?utf-8?B?UHplRHd5VUtwR2lYRlRIdFFiTWRCNFlxdS9wTWl1UHA0ai9vMG0xTzNhcFpt?=
 =?utf-8?B?Vm56NHp4N3JkWTRoNmF1ZWdmVytUeUFzUHRUL0ZDT0xzSlRBNzZGd21pUXpm?=
 =?utf-8?B?YjBET083NGliSUE3TjQ0UkRPV0JjRUpwdVdUZEY4U3NHZXZDTE55UUMxcGNL?=
 =?utf-8?B?MmJBTUs4Y3pId1lrZi9nT3c2aGlZZ1FJVVZ1bnBnRU1yOCt4SWppMUdyaU5S?=
 =?utf-8?B?a1Z2ZUlnbE4yN2RHWXU3SXJGZmQ2NjQydkFSTkJKalpzUU5QVitnNzA5cHRY?=
 =?utf-8?B?QnpPelA5cnVFTzRjeHZHVk4wWlduTWhWNVRTOWVnZStneEhyMEk1VUlYSEtP?=
 =?utf-8?B?T0MzWmxKbTJBemFFVkp2MnlGVG8wUG9nanEvZFdMWUtvc2hHT1Q5ZE5HTzhi?=
 =?utf-8?B?akxnREFVcWx3R24zZElyczM0bXVOLzdJMVo4aERLOVdqaXY3amhub3ZwUWE1?=
 =?utf-8?B?WVEzT1dUbjJMWHV5NlNjWnF2MzJQUE1UdTNjODdHVVJvV251clY4UVFtZzdy?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f83b4c-f7d4-4474-2e16-08dc0dd6f732
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 10:13:30.6090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aP3AgjTCoTULo46WAKjd6EAkGfJXoSlUbpr1jwYxQjfs8qa5r3Np7ftxkBPg1PAa07c+uNNIS3KZep4w6Z+uQ9kKc9j6NLquyxdbTToG+8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8483
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

v2 -> v3:
- Order tests alphabetically (Maxime)
- Add comments explaining the intention behind the tests and the reason
  why DRM device can't be embedded inside test priv (Maxime)
- Bring back priv lifetime management from v1 to avoid use-after-free

v3 -> v4:
- Split test changes into smaller patches (Maxime)
- Remove the waitqueue usage in tests
- Rename the test suite to match other DRM tests

Michał Winiarski (6):
  drm/managed: Add drmm_release_action
  drm/tests: managed: Rename the suite name to match other DRM tests
  drm/tests: managed: Remove the waitqueue usage
  drm/tests: managed: Add comments and expect fail messages
  drm/tests: managed: Extract device initialization into test init
  drm/tests: managed: Add a simple test for drmm_managed_release

 drivers/gpu/drm/drm_managed.c            | 39 +++++++++++
 drivers/gpu/drm/tests/drm_managed_test.c | 84 +++++++++++++++++-------
 include/drm/drm_managed.h                |  4 ++
 3 files changed, 105 insertions(+), 22 deletions(-)

-- 
2.43.0


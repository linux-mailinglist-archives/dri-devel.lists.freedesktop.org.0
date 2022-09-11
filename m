Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD8F5B5141
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 23:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6887110E22A;
	Sun, 11 Sep 2022 21:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0CA10E22A;
 Sun, 11 Sep 2022 21:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662931035; x=1694467035;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=vHkaE57T3rJcPkoUXPYIflj3CCyNC96DZvUR+o1vbvQ=;
 b=PBnsoe+TsxOOmNZ9OAZpvqcc0oWvbwl57nZ/Ym+Cqe/nrYQYZ7awmGZs
 Ipv8vr0FGHD3RoeBPX6YPa5OMQziddaHV2HN5BkQWEbeUJmcK50onDNqR
 awUMsWEAUOMzhzEp0bRlp5OpAIFoJ0x/BPRWmoik5aCvJxH8dSGueHbjZ
 /s8HYfAgG4w83Eg/BXHQ8ImFEnG/OAjwETdX0VRfbC9+7R6+QcqG9FU8v
 uCaXqBAk7kaGgwcXvZB2xKSfIEeO+qraMmxGubjfgmhqdpeQkWaYGIarR
 7M1Reg6TXPKsrfqvgM+gpM1MIuiJTN/3NZOh6vUh87QFwSn70aYhuAyhw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="297754138"
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; d="scan'208";a="297754138"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2022 14:17:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; d="scan'208";a="615853485"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 11 Sep 2022 14:17:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 11 Sep 2022 14:17:14 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 11 Sep 2022 14:17:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 11 Sep 2022 14:17:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 11 Sep 2022 14:17:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9oEP1vjd7p2o3yC3hJbMmR0J+tzHx68YWFiSp4aDU7mcq9qvEFPxpm5YuzPLyHxyStrLEIkk6Ca9G25EUicSHjTbQ0/FG4gw7Qek3Q2SKN8NMZvKcOyjRTICMBFtopPVgGwSg5Rvpo21fgIf694Pvv2kcSEFZxRV66ZXb/4ADBJxHhTh3KvskxYdzQAgrIvVnRhBfHz5SJx6of2HhLClayWgBUXoDa10nWb+H9MWCbWZa4GJoBepAq4DFxHmcyVhoNyHABY3TdwrmoKZEnXTit0YqFoUUe0fw+nl9+Jd6Wy+pEwqAbCmm4ADTP5oI2sL5zheaWRCm8rK/DK7FjSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVbmtoLi0CQAxT2U3PmBcEc4QieQl9BuFvBgJKMxNro=;
 b=W2IEJhnMESJYxklFenU3hKY4lqQ+6DrZcha3ya8Ix9TZDybxhq5KGkHqxGoryPW5ht0BIlE/jji5fbBwQQz8yi9RG04hZ95MKCDCR92pkdVYP7FMDNmSfjoD5oTV8VveW/s8Y9QA5cign9eab1rwl+6nqEdDtWXV8nO+kY6/Allxhu2cGKGBJAGBAEv6S0rg99SuQdIpYEG/bHL4JHHLTqZan5qDmjacuAuu0Z7n5ouR9fLeoqyDInpTZYdkdwA50A5Hj7+3/PAh7Xb8j4RpISOyG7jPZNZ8IbAkckoWuakz65d/324YOosdZn7qFoZFpE9jYRhWQYo1xwlAbZEfUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB6065.namprd11.prod.outlook.com (2603:10b6:8:60::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.20; Sun, 11 Sep 2022 21:17:09 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424%5]) with mapi id 15.20.5612.022; Sun, 11 Sep 2022
 21:17:09 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v5 0/3] drm: Use full allocated minor range for DRM
Date: Sun, 11 Sep 2022 23:14:40 +0200
Message-ID: <20220911211443.581481-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 215efe06-cff9-4fc9-ccf0-08da943afc78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vfdWXGlKkuPzYW9cYlftTTWFykcawAcTHcvpYkR/TMZG8Soa9rQtNxZqmyI9V7rNKDllJ3DlWUgeC3D3f97X9kY9DsV82JHFfr7IpoLNWa09sIpLYyRjW7weLr3tbnULCNnpv0LRY7CCPvqZnu9727SiW60+jP5396fRIsjvy6lvDz4T1iH+f6X+jUNad05S3i6WL85Dcq7+eFUbvi5sANCIFZsRMKSd/RCzd/N3/ZVqp8xs69fyoRwUeMsa2GgMcckCFo19tFo0AQu0UFMAQyMQYpVZoTLgU/M1peozyeU4QCY/NFhBiVXmljNe5llmAslzh4Un1kx4EdodZRRbeW8BWx7uQ949oTBpdFabbXQ+SltuvcA9ylIb15FP1yI37VMwU4DxVmf4kvIvEzDxSnCTkNoEANOPt3hUW3t65e+l3k7Hox8KEbmSWVRuz/zpxu8QzhHscHaYpmyGkKDZknRKKNZtH1ufEd7HMNszgcgDP9So1yDcT1Br43wgVcPQFfENQ6UKC1YxwlI9fs8qTTTU2/RO++2P/XW6CLB3BQ3YWLyC3zbjaneJw/RySo6coNVm9GxFXpzlwTrwXt8qTdufPKJyNj68Benrtz4CP0HjePQqw3m+9T92HQ57VqpsemafWeoJD/25jz+ujVSuWKGH9SWmqWOAeWmk6kVTpD5iJWC8PygOK3QOYtddXB/ckT0rbN0l/Gg8P3sA6vwTNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(396003)(136003)(376002)(39860400002)(186003)(6512007)(26005)(41300700001)(6506007)(83380400001)(6486002)(1076003)(478600001)(2616005)(6666004)(316002)(4326008)(8936002)(8676002)(7416002)(2906002)(82960400001)(4744005)(5660300002)(38100700002)(86362001)(66556008)(66476007)(54906003)(66946007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFpDcXpLZSsrSzBlc1dZYTNnSFNISmNRY2lneHVvdENGQWxFVXU1czZ4enQ0?=
 =?utf-8?B?RVpMOXBpZ3owUmFPRUNyaFZRVFpucjVsYUNETkl0UzRFbm5uWnRCY21OME0y?=
 =?utf-8?B?VEx5NHMvRUFWZ01YREZHa1ArakQrSW9EbUtlMzlLL3QvUzAzOUVRTThIYjZ3?=
 =?utf-8?B?VmJiNzZJUHNJWEZyNkUvUHFHZnBtc0J1TXVmZmxZekpicGJLUkVRK1ovNDF3?=
 =?utf-8?B?YlBiZG5RVEpuZE8wQU91ZVZGdEI0ZnpSWklDSEJoWi9WTU1lTkdscDJsNC9s?=
 =?utf-8?B?VXVGU0VqbCtsbm94ZDh3OVN0MzAyK2dGZ0JTOXBtSkVMMXQxQ1hhMzFyUStR?=
 =?utf-8?B?NzN5cStBcWxGVnUzb3h5R0VVbnYyK0dhWm85SjFpQXQzdXNldG14RGdSUmlo?=
 =?utf-8?B?UW1JZVVPcnp2WHBXcVZ3ZFIralVmcFhCUHcxQ3dWbVNwSXFDeTlZTU14aGxz?=
 =?utf-8?B?T1Z1b2c4Z2xUOStuTGZCMVdGY29ZN1NxTW8xMDFCQkdydFdPQTNtSEVUeHNE?=
 =?utf-8?B?dHYvNWlDdzVLaHkvY0FQOGFIb1M0dnV1OWE5bkFaemNUNExQYnhCZGZnUVlr?=
 =?utf-8?B?OHNEckJLT3A2ZGl2ZlBJeVgxM2M3WWFpTUVlYWY2dnFWNTU5bWZ6L3hCUkxY?=
 =?utf-8?B?eG9VdTh2SlVhK05mUWtDYzQ4blYyTUo5MW9kRGNPYUp5bXVUL1BFU2N3aEJI?=
 =?utf-8?B?ejYrNXhMRGZCbjlmQXR3TFJrUFZBSnNKMWRsRVFLYU5WeDhjMHFyV1hyMFZK?=
 =?utf-8?B?Q3FaSDVab0JaR0k5SlBoQlhvaUZNcGx3U0tRa3JhUFVqVkJjUVNrMmJPa0NU?=
 =?utf-8?B?Q09Kb2xocWZGY3o0eEZ0TXQ3RmQ0U0JvQ0FTeTVaMXNDQmozU3AybWU4ZmpC?=
 =?utf-8?B?dUY1eXpaYnJmZ0d2QzNNc1o1U3ZEeGpieWNDMGFZL2E1SDVvVlg3ZVh3ZWpD?=
 =?utf-8?B?R2tQL3RidW0vSDlTODc1ck1vZW52ZlpwRm5vNGZmUDdwek5SRSsveXlDQ05B?=
 =?utf-8?B?R3JiOTdqeEg2aFBMZWJwYXBCRVhVVFkvR3haZHBVSWJ1YXJGbXNYUlpVWFNQ?=
 =?utf-8?B?Qlc2WksrRFE5WWRrb2YvQzVoUVNYdWJlazY4QisvQTJxT2Y0cFRrRVNBZmYx?=
 =?utf-8?B?UzUzMEV4amJyamt5SDJ3Tkd6U3AzcFg5c2dTek5xb3RJMXJmZFduZVVSYkJr?=
 =?utf-8?B?QXB1QUlQNG9VUWg2LzROaFIwL0RyT2FQOHhlWHpNK3JUQmczdHdNdm5QR0li?=
 =?utf-8?B?c3BkT3hJWDdWV3VxNFMrZnNtZTNjRTJ5QTBhSTFrNURkYUZYZCs1UnJCeWNo?=
 =?utf-8?B?NHBNQ3h6b1RlMzVkQmovMUFhMFFscjFlYWdaSy9WQy84dXNJeHgycXVFNTNT?=
 =?utf-8?B?ZlZnak42NGJ5bTdaVnJISGV0OXc4UHBTZHNJSkdYTjZFeFBnSzJ1K052amtP?=
 =?utf-8?B?aW93THI0LzlZbmdkM2syUnlURGNWL1FubEROcTBhU050bUo0OVZndDZ1R1lB?=
 =?utf-8?B?RDJjL0xYRGpUbVltNlcyNlhBb0VVNzQ4VFlIMmp1QytBSHRud0FnWDdhdWRq?=
 =?utf-8?B?MUxZWkQ0QVZMUUZ1cWYrUFRacmRGWm04Ukt5WXJnMmtpdWlHWDFqdFdJSjBB?=
 =?utf-8?B?b01nL1Y0dXIrSktYZWhIL2N2SmpmN1BkeGQ5Umd2TTRONDBOWitMaEs5MTAy?=
 =?utf-8?B?ZHhQaXNjVzk2TE5ZeExKYW1kMWFvWGRpZ3V6d0crZVhDcU0xU21VOUsvSUIr?=
 =?utf-8?B?ZnBsbFNLdWdKeEhYSWxhelVyTUFBclNXODRmcUtnSHdENkdZTWNqaXdtTWVV?=
 =?utf-8?B?RnZ3b3d3bk5NcUVLWmhyOTBuTGFnc1VFL0RJbEJyL3JkNzhlcjVRREp2ZDRQ?=
 =?utf-8?B?d1ZuOWhzZU9IbUQyT0NJdHZQa3dBWG56T2tzWXVnZ1BLRjNqN29DS2tjdGxp?=
 =?utf-8?B?WlVaa0ZiMXdJV2tGRG14WnJSMG9ITnkzeW5sZFFDS3RscGMzZ0ozamVvNVRO?=
 =?utf-8?B?b2NoR28rT244UDRISDEvYTBoQXY5K0VNRitSRGhYRHhWWjdQNXZGamxIdElw?=
 =?utf-8?B?bk9paTZNbW5nMWp0SzIwWTZmZ1IwckY1aVdoMWpJUG1SY2d4ZnZQOTJ6NFl2?=
 =?utf-8?B?WEpldlpuVXZ4VmUxUGZsUWRadmF4OGpydGFucHlldXRJT0s0RDlsQTB2eXdG?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 215efe06-cff9-4fc9-ccf0-08da943afc78
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2022 21:17:09.2073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OyYDrRBb+ndzdvSa7e19I517W8CEHuoKB69v0Sdv93BDq2B/qN8iGksv2RJRRkJERNBRjprZKmFfcM0j6xW2t9gVvqZC2lnmPvNvBIF3evY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6065
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

v4 -> v5:
Fixup IDR to XArray conversion (Matthew Wilcox)

Michał Winiarski (3):
  drm: Use XArray instead of IDR for minors
  drm: Expand max DRM device number to full MINORBITS
  drm: Introduce skip_legacy_minors modparam

 drivers/gpu/drm/drm_drv.c | 68 +++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

-- 
2.37.3


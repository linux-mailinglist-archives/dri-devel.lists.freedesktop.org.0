Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880115979F6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 01:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F2DAFCCE;
	Wed, 17 Aug 2022 23:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C1AAC892
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 23:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660777702; x=1692313702;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=04UR7kiKXBQc4LHVWASajk0vpB8u6NxqBiW/D5jzGKE=;
 b=fKT29Eo4wybeyqjvi6cNjEN3iIrcw9lic9LwRhAMbM2iRRY3DBFDFesd
 nfReghf64AZ3Ex9I4wGQSCoPXQeQbcQOEEiEPC4gTi0MZrHQYbsmH3OFm
 /iycuu/xrNuDv6Sus6o5B10kS72qVTq4juGxc4LrO1zMsqi7HBfFwOGA/
 Lcj5deB5pHSjFLl7tOSVOZ8A839EPlrPLpXHlZFKysvu8GtcsDpFEKQLY
 9Lh3AA/QkFhUoEumN5HoYdJbsjt8PJ//gZheGoPY24zy6tFdRp4CO7BhX
 Ca9KgkuJrKhNz/csTDP8FX5HMKQ3UOTYs6NNXOoynxoffWSeKBgehGMeJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="279587798"
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; d="scan'208";a="279587798"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 16:08:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; d="scan'208";a="640640820"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 17 Aug 2022 16:08:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 16:08:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 16:08:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 17 Aug 2022 16:08:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 17 Aug 2022 16:08:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doHMCLCXYI2HxUPUzULbOjcaMTczq2mPO11N8mOl7+LAegfDzmxBPfODiFupBl45BoOk18wYAdAIOHgI3rU8UxjZ6BIQe5EpJQctiPuKB+KC83I4zKsFcJhdzc1o2dpnA02xU/k5PD33V/h8VVfblt5/CGDV7WWSTgu73nFhlxT55s44+D/AzFeF2uXAwxb+IxvZ2hQDqWo8+e7aDOsvLmvkcOC/fJoqleWEAgEL7gWFTA25iVg8RZQ3oXpvHpQnbKJBenMu0pO0UTQyS8jcJkBX0xyxEPk1D+7abaQG6iM1vVf7mG+MchpnEgDCt4bx/971ZStb/8ZMoRts5w5vdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjnHyRWuYsgeDkLrpIp6cE9rRXPrNUcwxkcbsuRjdBk=;
 b=hpe+cL+EmIA8D3kG1GCdWNiK6/tLzhnl9JLHY1efua3ekxoEfHrrEi+fHO+uLpfHaV1fgV2leZOmh4oKXs1EfURErpvb2yn3DflQlr15z1BXvwM6Sw+APy3/EMoMH9n8/x9taQD3JdYiv4LTDNYt8oRnkkQauDzVFBS7pKATiHq/T0qg5+K4o5LyxbSKSTUtG1cBmNOz9vKQv1Bmt0KRKwahinNTElM5ycQfPr0obQni1n61msuNe5efkvugriVMdyN0XRzp/SbPAnfVOrly2B75N0kt/UuvZlc1qJm9sTgqWzgzR9GSbJZBxGYW9Tzb9p/ZCTRNK0ltJCesSFMjWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN2PR11MB4190.namprd11.prod.outlook.com (2603:10b6:208:13e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 17 Aug
 2022 23:08:16 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 23:08:16 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/3] drm: Use full allocated minor range for DRM
Date: Thu, 18 Aug 2022 01:05:57 +0200
Message-ID: <20220817230600.272790-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 474b2502-af33-4b3c-0e75-08da80a55df8
X-MS-TrafficTypeDiagnostic: MN2PR11MB4190:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CVSMe9w068Olt1mY1fJYzOxypMbEXNLXbpTOXYUN8v05p4bLw9qVFfPMcukRGnkdlTKlLFDI4/Lg+BzcHpciIpouA9pygO4O2jIw/e245s3Jncy+GqyOrFpQMqwlyTCeN45zvg/rDJTzC9S6NQ/o8hOAS6kj2CiLyOmNZ31Du+bPGsTQMvnAm9WRHDGhVi0YL46ZP35FKljnYxPCmvRq6PWRCPKC0Kknn+2Ag/QJ7E7ffdcIescOh4gi4vFh2kX2QmESgD5zpriLEltO4KzjorCeoro0p8e8sJTrOWjRCdTApHsCD2exrjHI7DoZozNEEh+2DXSTxYdReqhfvMYP9szLtV6b2OIzu6QZOfkqbNtDaw2brtSWOH2IKw2dBHj4Gdh3rBpDdAB+svkEyG+l22GW64HCSCTt6WhQK+6x9r1PZ4YnrFcdHru4vA3fWC8gIw14Aqm6nvhhJMWp/ebiK0/6kq++42TZmnYT1gJNaNUNHs3n6kMtvwGPeGxN7jagdAcMvAWiCaZ6d6z2AHZUbPq/LpjVSr/A6tsjgzyC62WMQHQJkwFrXfJu129x26+MBLr9e11rRor5w1pPKfUC2of84QbvK2s4L3jxZWTBeXHbISDZ89ClbvD4qeaDg7iyhsSMjFJMZTJ2HxQQ0QWnKSJG9efLvG16nbZoQckNkGkJK/3AvRtCdPZ8ahd1ZC6z2N7BCsWP/UQFkVTk8JmGaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(396003)(366004)(346002)(376002)(86362001)(82960400001)(38100700002)(4744005)(316002)(54906003)(6916009)(2906002)(66476007)(66556008)(66946007)(4326008)(8676002)(8936002)(5660300002)(2616005)(1076003)(186003)(83380400001)(478600001)(6486002)(41300700001)(6666004)(6512007)(6506007)(26005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1VxOUMyMzMyMktrd1VLZEpCUURsUHJDaHZsRko5U2VEQjBoVWFzYktLK3Ew?=
 =?utf-8?B?b0NqOXR1WE05U1VOd2dubUVJNFJGRDNxMFBQQ1A0WkVMeHgzL2xkeUEzKzFK?=
 =?utf-8?B?UnNuNTFid0lFL1RzT0Z3Z1NFb0F2ZnI0MnR6RkJlZWVrMkI2R1gwdzhISmRP?=
 =?utf-8?B?alQvRWhPRkgvWTY0aGZDNFR6MDFzazJrVXFmb2lUOTd4LzlVNmhuSkc3Slpm?=
 =?utf-8?B?V1JzS3BhNWJGdjZveEhVTFFBb2hGOEN6dXFEVjkxenhWbVZXaEt4ZWMvZDNo?=
 =?utf-8?B?by8zVmxUUkpwcVdoNzRBdVptUDRLZ3BQbVBSbVFoK1FaU2xtNEw0Z1NrZHd1?=
 =?utf-8?B?STFYb2VtUklYOEpUeDZJQ1cySllvUTJuUE9IT0ZiZzEyNjcwWUZadElKWW5s?=
 =?utf-8?B?Rno5RWFkamkrQ3IwVisrUkE0NzM1bWdrR0ZWOTZnYjNhV21wdDQydUsrMFJ1?=
 =?utf-8?B?NDZWZmhRYms3MDM0ZTFqMDF6bnZrTUE3L3FQSm13ZnlrOWhoQi9qSmFwT3I2?=
 =?utf-8?B?aWIwdXk3MmVnRDlPSXBSSm1JQVR5WFRxUVFaeHM1UEI5K1lTa01BR1MyQmFY?=
 =?utf-8?B?VFB1QzhUNHhud1VGU25QT2dHSWc3SGRCblBIRXgvZldkaWYwczhOWjArV0Jw?=
 =?utf-8?B?WGNicnJsYU9DUEdoQWEvSDB2aGhJL1F1a3ZzdVVaQjNuZ3R2Q2VkNmNhbVdx?=
 =?utf-8?B?UlBoOW5WM2ZXc3oxQzIwelF4cG9qUFIxT3hVanMwVXJPS3VaWTZwaEhPdmtE?=
 =?utf-8?B?Q0tYV3F6VWNjSDRnRHAzNkNSVXBQQkpZVkZmSVJIK1JLVE91YktHVXZpNEls?=
 =?utf-8?B?NTlPRDRzUjg2K3pIbUJpMjk3ek1NR04zWFBTOVpkWFRnRHgvckhEbEZ1clp2?=
 =?utf-8?B?TzdJTnNpd3RCSXQ2aXhNaDhhUVg0WVowa2liTDFheEw1TTZNTWZxd3hxd2FH?=
 =?utf-8?B?ODdLT1piQkNJdkNjOHlqN2Y2eEw5V0tJSzcvN3VWQzVpSWhSVGxUV0ZIQVFK?=
 =?utf-8?B?akhZU3A1bXhNWlBOeEZraU44MSsrR1cvM2YxQVdtZ0ZWWFovbmEyeVpYUlds?=
 =?utf-8?B?bVcwR2pPaDNMSmg5MndlN3lQeHdSSGpsSzNqQ1k4Z0JIV0VlQUtoRCtYNVFE?=
 =?utf-8?B?NW9aZno2MUxHVnFmSmFOY29PZGVvbW9qeE9YZkJadGpvK3VnK09SYkx6Sm5o?=
 =?utf-8?B?ZWZWOGVjNWRWY201dVNLTGZLdHRCdW1yb1AzVzNsQ1I0VzNteTdBMEJZZXJR?=
 =?utf-8?B?WHRvaERFdE5Hb3NqYjdxeWY3NHVNZTBXajdlMmVhOFBsSnZQUzNDeEhKMDNi?=
 =?utf-8?B?ZW4vOWQza1NyOE42eG1NR01ITEpxbDVaK2VyblZpc2RKZFRIMlBaRWFsZkEw?=
 =?utf-8?B?NUkwdlpJVml3WVhEQkZraytqSVl4RnlLcDVOUWcwb1NuNVNEWmlQSUJTakVm?=
 =?utf-8?B?NlZtbXZMQW8wM29tbCtjZ1R2eEpUQkZhaXpTampzYjdjOFhRdEVVRSswWGlD?=
 =?utf-8?B?NUpuWTZoTGx5S1hZeGROTDRzbDB1VTU1S1NWT05aOTl1dXNaZHVyOGZIdXJL?=
 =?utf-8?B?STlEVmxONmtPNmpjNXFEZk0xSWc1dHBwbXpwMTF0QkhUMHZPRllqVkRsVkpo?=
 =?utf-8?B?a2l4VFRwQUY4NDg0NXNJRzJmYVVrV1k1MGxOZ1hSYmFqSTdhcXRjekU3cHd0?=
 =?utf-8?B?eWREUmJoVEJsbDV5Yld3a0FGb3R4dFFnUXNPWSthOWZyTkp5RXFkckprSnRL?=
 =?utf-8?B?b2o5dHJoalBOSTRTM2ZES3hvdmRWeEx5VTlUbG1QLzNBUzFUYjNWQUdUMVow?=
 =?utf-8?B?L2FNMGc0RDcxMit3TjJtYjd3dTNnWFZoSlNvd0tjZWkyRjdVNlByMHNVbFZ0?=
 =?utf-8?B?Z215c2NwLzVJVE9Ra3IzWWNjQ1lqTytZekdhN0dRdHpFRjNubU5hWFBMTnhS?=
 =?utf-8?B?MVFRV2lienEwNnFCUEF2NXJ4c3ppQlVHOVl0SnFJWWZMMlVPQ0piV0NNejBs?=
 =?utf-8?B?aitBa05lOTFPUU9IaXhTWTZkWEhEMVhJdE9rZjRvVHhWRE10TVVabTBtTCtF?=
 =?utf-8?B?WUpQNnNLUU1WbnA0WmtrK242MnpEOWJkYlgwVWxPTHYyUmw4S0ZUaVRYRlp0?=
 =?utf-8?B?eWNuSUFBbDVoR3JYUHd1VFZZZ2hMM0sxb0gxT0VVejhkQ1MzTHhmdmhxVktK?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 474b2502-af33-4b3c-0e75-08da80a55df8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 23:08:16.2092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLxArDVY2DKTofHCimYAvCMYPz/rLLBopPZcwwnfsCakWySrGkfpHrxsh1gcpN3xgtPXdol7uR/abx3u05CpLSXYM6hP6wc+D1R5S4yOBZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4190
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
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

64 DRM device nodes is not enough for everyone.
Upgrade it to 512K (which definitely is more than enough).
Additionally - one minor tweak around minor IDR locking.

Michał Winiarski (3):
  drm: Don't reserve minors for control nodes
  drm: Expand max DRM device number to full MINORBITS
  drm: Use mutex for minors

 drivers/gpu/drm/drm_drv.c | 45 ++++++++++++++++++---------------------
 include/drm/drm_file.h    |  1 -
 2 files changed, 21 insertions(+), 25 deletions(-)

-- 
2.37.2


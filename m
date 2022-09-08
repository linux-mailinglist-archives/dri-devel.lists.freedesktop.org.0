Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9F55B277F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 22:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A02310E64C;
	Thu,  8 Sep 2022 20:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C6910E64C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 20:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662668099; x=1694204099;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=f08VbAxGacBCvmTEcNRE1FJeO9G5L7cRaWW6PYa6YYs=;
 b=VAhjyoLL0Zhml5BmiYQaN02Ugi5/7fPphFLrPDbt7HvRxkiYps4mMidK
 64uIC+ED4tdYvwi8zu2UUL1u8qX2oKMNTYDcBHJUHCOW9z3zA5xDLVloT
 KzpQdlP/p/tBsPNuXMnTbO2fW8fjpiGM9ubdVFyd72pUR7Wdb7aJJOovL
 MkyPOX9FlanJu+tWqcT/puPOFIbfAgwFdyBOzBKZ3iORiRclPVuq5qVd/
 16kc+3rABnq4f9hozedsPaissw3I1fmg+qTNkgf3yHWvT6DER7NT4n3zq
 URDdjYGAjfhRXQVInvOuSZIadbxQvi4pH6o+zoVTULrE/Ian+UfTw3vlS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="323514552"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="323514552"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 13:14:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="617604060"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 08 Sep 2022 13:14:58 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 13:14:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 13:14:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 13:14:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgfMXC0fuzcDOWQdEki+yuXVCt78CZJVd9xHgdSnfY1kdDEzQpet0GvJPjIzMaRLr9g0/PyDJwYm+gSj94DutfHdQXr4OczSGezvXjOfmWyCaCbD9qLt3Ud5aMoCWY26hc8yy2sR6ShvukiDav0EOOcqsoCDlrr6kC4RU6f5D/04pIHT+fBw0HxeR0TMbdOiuhKz7JdTT0YYD3unC3tZfrQ5dqScI/jiMV6KEvWLmRfW5GbJWscTecPRxLO6dt5BYA3cQJVFHi8F0ydjAEOoJWLYsT+WohrTVJjBc2HHNNNfQB75GzLEWGovqRuTFlGQPJhiAyYLZs6pQklrzrdJGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXU2OJh4lza0YrY425P+aQhBz2RQxq6aZ8vg3SV0QdA=;
 b=Y3M/b7dEcOyKqp+QGgSM2xBMc623JaCRpbQjDfS6uRm46wHnULi8SMWNkXKtAExDYe3KvIT/dQtYRzu/317TV08uMsrE0qBBlWQ+O3543mGhtzuPEI6X0Kzf5C4lEi0SALAmzNUBDr0jL95Q4B7uEi4wmc/M76TB0JIi74s737jOwMjv88cV3DnEqHJSd3L3UuBti2Ay/fPqvG9EuY6W9IHxxU0frQIJnx7To/vfRw0aELcAgHUZ0SE76L8G5rY2Lfd7hXETqS3wV2JJMkzwbcE8792v0TMKCzHHe9TBMkVCW5GokgtpCoxH712jVRMvWKv6eyYzzft4h/Bbz7CNHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB6985.namprd11.prod.outlook.com (2603:10b6:930:57::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Thu, 8 Sep
 2022 20:14:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2%5]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 20:14:57 +0000
Resent-From: Lucas De Marchi <lucas.demarchi@intel.com>
Resent-Date: Thu, 8 Sep 2022 13:14:55 -0700
Resent-Message-ID: <20220908201455.5l6kwte636zohgdf@ldmartin-desk2.lan>
Resent-To: <dri-devel@lists.freedesktop.org>
Authentication-Results: spf=fail (sender IP is 192.55.55.70)
 smtp.mailfrom=intel.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=intel.com;
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="718702466"
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v1 3/3] drm/i915: Invert if/else ladder for stolen init
Date: Thu, 8 Sep 2022 13:08:16 -0700
Message-ID: <20220908-if-ladder-v1-3-9949a713ca08@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908-if-ladder-v1-0-9949a713ca08@intel.com>
References: <20220908-if-ladder-v1-0-9949a713ca08@intel.com>
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-df873
Content-Transfer-Encoding: 8bit
X-OrganizationHeadersPreserved: fmsmsx601.amr.corp.intel.com
X-EOPAttributedMessage: 0
X-CrossPremisesHeadersPromoted: BN1NAM02FT051.eop-nam02.prod.protection.outlook.com
X-CrossPremisesHeadersFiltered: BN1NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-TrafficTypeDiagnostic: BN1NAM02FT051:EE_|SN6PR11MB3311:EE_|CY5PR11MB6139:EE_|CY8PR11MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: 21cfa982-4e15-41aa-6972-08da91d6cccc
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(396003)(366004)(136003)(376002)(38100700002)(316002)(82960400001)(36756003)(41300700001)(37630700001)(4326008)(478600001)(66946007)(66556008)(26005)(8676002)(6486002)(66476007)(2616005)(86362001)(8936002)(6862004)(186003)(6506007)(6666004)(2906002)(6512007)(5660300002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 20:10:19.4886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d48f7e-e0c6-4753-f375-08da91d6276b
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=46c98d88-e344-4ed4-8496-4ed7712e255d; Ip=[192.55.55.70];
 Helo=[edgegateway.intel.com]
X-MS-Exchange-CrossTenant-AuthSource: fmsmsx607.amr.corp.intel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3311
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.1467159
X-MS-Exchange-Processed-By-BccFoldering: 15.20.5588.018
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910001)(944506478)(944626604)(920097)(425001)(930097); 
X-Microsoft-Antispam-Message-Info: cD0eeWsWl7XStIx1kgeAMbuZXN3rFkIAjEc4Xxdl8iTvv36tKlmlTO2FSfwsJttEkKbsV/lUCgLVCysuftMEXxp5ZVU1U9y97rIic239XNEuNZvhHfDaVxbW2MQy+T2M029X9o7q7griv5ux4un8zh0kbY2Ej+qFf2zvBj+i8cYQR10Wf4YekwlwlJvHe3UdcI9dZiPjiq3/WbF7WT3yqUUbEXl9a7Z2Am+2UMHq9E570pFLTMWD/jYm2cAVWP2+l8KEfyLPu5AXASoV0uhg849N3AHqAWOgE/gCcEOnqwNe+mQ/XMc7J202pPEtwetlHt/Tc+LgDEJmH5USMzY169eSP5r1OM9/t2OaN4DzmypUmYGw9RA+yYi38oKEhsQhM45fHKNknj9sG60nDwGZyIGmuw6qXPxAqtC3e6qEaCckIGPNi6ULWPSg0mHZcrgNoxLuB5hZMmJiD9SMQPZH33EDqke725GuC3HvzYJb1bWGiv4GIHH0mnY2U89bm6N3IRZFrkoTGvsCFJjMRf0zZ44p9dLWar5RnqieDkHtXw5zmI8qcPkBgiHvYi2D96P+VYpCR0s7ZVKb1gX6LtyjpGvm1Tq2DTgr57fOq4EY/IfRNs0urisAKhag9UPAGrMepk4VN50U+OwXDHGtE93i3pP2+tp5xsNUz6gYF3zJqiGuSMEFcLDwHFgDFcc5bJYStEwy04Q3X54pp1y+u+t9Pg==
X-TUID: JEj1VZUopVMV
X-ClientProxiedBy: MW4P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e9d48f7e-e0c6-4753-f375-08da91d6276b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0NXU3RuT2ZvSSt0TFd2M3g1RWhuN0VoS3VGZUJyMXhwR21XNm45NkZWeUMx?=
 =?utf-8?B?Qk9oemZjYjBKYUcvWWJiZmNMc1J3YmhxMWhrMElLYmp4MERyU0pUWTZnWlZp?=
 =?utf-8?B?N2pkODZET0ZUcFVBUW1KRG93MnFSNzRUZGZrN0xFTGtvV1AxRHcxdCtxbFJK?=
 =?utf-8?B?eEN0R1l0ZkZFY0tKc2dadlRUYXNmMSttSThUQmN3d2d5S01KYW1rb2pZb1Nt?=
 =?utf-8?B?eEsxWXJVbCtzS09lRjRCdXRvdG84ZjR0QVl4THdhUEsxRFdmU2c5a0gwWUhh?=
 =?utf-8?B?Q05XTWNrY2dVZlQ1T0dFaWNzZDA0R2xpLy91RXRmemZOcnZTdE9BOG1qYlhF?=
 =?utf-8?B?SGlpaVJGY0l1RlFVZkt5d2M0UXhzaTlFVjYyS3k1ZkJuMzUxcmFWT3JxM2l5?=
 =?utf-8?B?VzIzVGNMcnY3M0VORVoxcTNRNWNxQzFNdFB2RTEzKzR5NGJuazZMTmc3d0xK?=
 =?utf-8?B?WTBkak1RSjdKU0djdS93QmlmOTlSc21UR2NBK2Y0Tnd1a0x0OUQ5KzZvQWt4?=
 =?utf-8?B?bTVsWVBmT25RM3ZSV3I1K0NMc0ZiM2J1TnlBTFVhWFgxdDVrejQwcW03ZTJD?=
 =?utf-8?B?cnptS2cxTDhCaXBXSnBqMGRBZE5lOU10UmliUGlsTE1TUCt2Y21IVGg4RmVp?=
 =?utf-8?B?V2Y1eVg0YkRBR0xUM3J3UkVhYkV4SHJNZXVaQXJoR2hmYUNzd3R3MWdoU2k4?=
 =?utf-8?B?eWdETHFaaGlsUm5JWWNIeVhKV240OVlsWmtpYklQaTh5UWRGYUdYZEZNL1dN?=
 =?utf-8?B?MUdvaGo3eGJoVkJVVG53bTBKM2hOaVE2Nk9IcXJMa1U1MXVWaEFzcE0vWExw?=
 =?utf-8?B?Z0hXVkVERy9ZRHltQTVIT2EyNU54UExVc203ZjBlTW1Vd2JjUTY5dTlCbVJC?=
 =?utf-8?B?bzFZQlB4VzFPbTZ5aWVkcUR1NnpJa2t3U1pvSU9NY0xjUndmUmFkRzR3MXdE?=
 =?utf-8?B?ejFaeDZleDA3djNxQ3FNTE9lOUMxV0VzUWYrQWxLeVdYL0FNdE5idmZtY0ZS?=
 =?utf-8?B?Q2ozOC9vM2huSnFsYWp3K2JLazZ3ZUdXRWVDKzhPaVZUREJ6TE1jMWpKcGpL?=
 =?utf-8?B?d2d2RXBSMjl6SnpOMGJZTHpOeUo1Wkl6U1UvY1JVT0RmUWo2SHdoY0Nkdi9x?=
 =?utf-8?B?YjBZWVFrVjFSMGxSaGI3VE9JQ05HQzFoeTYxVVBTdkNVd1g2Vkk1WFJTbyt2?=
 =?utf-8?B?Z2NKUEpmQ2lNUUZSMGJzdE5UM01CRVlOak5PSFBrbk9tdGxVRUlCeVJDb2Vp?=
 =?utf-8?B?dXhCZFhwRkJJanBCSEo0Q3pTS0pzY05vL3BYaUNnSXhlNHBvc0FUbS9nNUVB?=
 =?utf-8?B?NzA5RGJ2L3FQYmVhU204ckdrbDRPUlBtazBIL0hFeU1QOUxsakpxWjIvam5q?=
 =?utf-8?B?VkFTNUtibU1ENWdjcHNrRXY3ZWFUQkp6OXZLUTkwbU9yTmM1WHlpbG4wYWs2?=
 =?utf-8?B?VE9wWCtUeGF4Qi84ZWwyY1pFbVRYbDNEeTZZYmNXTmhOdlpPZjV2d0xLZnNM?=
 =?utf-8?B?L2JMRFZsU2RqcnRQbmhIaFBlalZzNXpUN3hsOUxISjFaMi92WGVaSVdRanJM?=
 =?utf-8?B?RVNZQlN3U0gvcnVEZ2JJRDRqUlZ6K0hLTG5EK25TNzkwL3BTY1NSZE9lVW9L?=
 =?utf-8?B?d1NkdXRzdmF4MUg4ejZkSGdTT1VlM1lQWmpoQkRmZm9wc0lndmhuK3ZWaDdD?=
 =?utf-8?B?c1FjOXJ3Q3puZ1FmQTBheU5JL2dSYVQ1ekxMU2xya2JmSkljbXZEd3NlSU94?=
 =?utf-8?B?ODdhajdhK3UvWVdRb3ZtU2xyMHgwb3FoK0NibHZCQ3RqaGlHMENjbmxYY0Nz?=
 =?utf-8?B?cVpPMFYyZmlmOEVBdUFubkp5NlpOaEpqazVCRTlSRnJNdmE0Q2laNFI4VTBT?=
 =?utf-8?B?SXFpNnFid0tmK1VLZGJQb2ZLNFdPQy9rNTd3bnVqUVFDNEJ4TnVURnk2LzB6?=
 =?utf-8?B?OU8yZngwUzRRU2puOThFTGE0aXdjNmg1M3dQcW9xNDlUSlkvT3k4VDJDNlIy?=
 =?utf-8?B?dGhSMGoyc09DRndDUVB1Y0lXSWo5N1pISW4xNmZabndyV011elZ3NWdrbkEr?=
 =?utf-8?B?NCs2akQ3bTFSK0hXZHVPWXBIY3l1Z0FVa0JXd1BEWmhXT25xL2FqQ0pQN29L?=
 =?utf-8?B?UmptcExRZ0ZNblJWdHZKd2JUVFJkcmVvSGpNOUR3NnJaSUlnczN0bkNka0tz?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21cfa982-4e15-41aa-6972-08da91d6cccc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 20:14:57.2417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJWxQnss5GV1M6U6saNTT/YjZvrkm28+tq6zBVwOQB3r92SYjc40oA1qF4r228JIcaybJ3h9SZ8NWLIg0IXSey6vbsnbiK9DJEZGMFzzl/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6985
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Continue converting the driver to the convention of last version first,
extending it to the future platforms. Now, any GRAPHICS_VER >= 11 will
be handled by the first branch.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 4f4c9461a23b..acc561c0f0aa 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -430,48 +430,29 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 	reserved_base = stolen_top;
 	reserved_size = 0;
 
-	switch (GRAPHICS_VER(i915)) {
-	case 2:
-	case 3:
-		break;
-	case 4:
-		if (!IS_G4X(i915))
-			break;
-		fallthrough;
-	case 5:
-		g4x_get_stolen_reserved(i915, uncore,
+	if (GRAPHICS_VER(i915) >= 11) {
+		icl_get_stolen_reserved(i915, uncore,
 					&reserved_base, &reserved_size);
-		break;
-	case 6:
-		gen6_get_stolen_reserved(i915, uncore,
-					 &reserved_base, &reserved_size);
-		break;
-	case 7:
-		if (IS_VALLEYVIEW(i915))
-			vlv_get_stolen_reserved(i915, uncore,
-						&reserved_base, &reserved_size);
-		else
-			gen7_get_stolen_reserved(i915, uncore,
-						 &reserved_base, &reserved_size);
-		break;
-	case 8:
-	case 9:
+	} else if (GRAPHICS_VER(i915) >= 8) {
 		if (IS_LP(i915))
 			chv_get_stolen_reserved(i915, uncore,
 						&reserved_base, &reserved_size);
 		else
 			bdw_get_stolen_reserved(i915, uncore,
 						&reserved_base, &reserved_size);
-		break;
-	default:
-		MISSING_CASE(GRAPHICS_VER(i915));
-		fallthrough;
-	case 11:
-	case 12:
-		icl_get_stolen_reserved(i915, uncore,
-					&reserved_base,
-					&reserved_size);
-		break;
+	} else if (GRAPHICS_VER(i915) >= 7) {
+		if (IS_VALLEYVIEW(i915))
+			vlv_get_stolen_reserved(i915, uncore,
+						&reserved_base, &reserved_size);
+		else
+			gen7_get_stolen_reserved(i915, uncore,
+						 &reserved_base, &reserved_size);
+	} else if (GRAPHICS_VER(i915) >= 6) {
+		gen6_get_stolen_reserved(i915, uncore,
+					 &reserved_base, &reserved_size);
+	} else if (GRAPHICS_VER(i915) >= 5 || IS_G4X(i915)) {
+		g4x_get_stolen_reserved(i915, uncore,
+					&reserved_base, &reserved_size);
 	}
 
 	/*

-- 
b4 0.10.0-dev-df873

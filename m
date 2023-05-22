Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B17770CA1D
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 21:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63A610E264;
	Mon, 22 May 2023 19:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9F810E264;
 Mon, 22 May 2023 19:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684785447; x=1716321447;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=rp6UWkajh026jgXNYIgL7G7oItbXLZ/+dZDaCqA0UWg=;
 b=NxA88n7U+h3jGl5BZbW7IjRyXwlMereXgEhq5Cjbx6j4i9E+0ZihK8tg
 UtigSl3jUsuqi3oPYqKk8tf3tEyE2PGpIExWK2RVg2CMf0VdHH7yI99sr
 yLgx3ad83q6JAaw3XREGJsn7cGygvAYmA1II1smRinyWBJst0hG6muDQl
 JF5hzixgLCv3XtwZfQtD4DPLwjb9+my3KSJpTq9ZgtaroiXjpEduFLNL+
 FU0xetKn3gnr7b33fLPBT8iiWC+499b0DcqWu3OYARuNaQS4fXx9j+5v5
 KV0Sj/uClSyxF7oB+pamlbil+okiJl5E+GTl3kkAlkwTOJMtGaCMXWxks Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="332640281"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="332640281"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 12:57:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="815810803"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="815810803"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 22 May 2023 12:57:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 12:57:25 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 12:57:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 12:57:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 22 May 2023 12:57:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9fBQYgWZPsiRw2aN3TMedR5Y8NSKPo+mcx0gKF1FMMRuGugMKU0Vqrv/mM1o0hzyQS1TO/q1lMjdgQejm+BiNyltmFLw/xEaz3HpnvcZBhDzN3x2Aw2ml/4vNeAtdGcBAHeC4FH6ito9x296JUTnv8avWVAma0KXt+mgZ07DtLN1Y3fXdZ0Azb6z/jbMQTr1X9JNObLxLXnDQyKI7EDNQIknLhvdeMEY6a2798CZCOVAaKJ/QdhJzBjWs7lHNR+HMOigzxyT7M4A/hABwrRiHcFXd3GKIkejd9EkA5NwGzEiyocwjmcbIL14n4EpOqNTqfISOdJb2+SL2zmODFGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELAeGkggJrnJaEWQjH0fYIq9CjkqMoVa5TQhnDmV7H8=;
 b=JXC3chHSxYvHEhgf4+5au4v7pGH8SmACm8VKHD3Nq7ga4/Fvu7HiYsilGSzi2uWNbfWatDi7g2/eqxfAZo5BUklLBJMDG07yUrN9kqPMBOPkmbBCNdULNvQ5qI9mJ5PI/CYrRPrPC+qXcBaJotK16RiZNdlrvPfF96FNH8q8ytb1FmlwPfhd2tvO2zWtiY12Kbz1hginQichdQYIxL+eLs8YKIkNLcOCOubY7Y+ISdu+JHI7jd340rdgqdP+OdD+adxButa4gn0lPYHhdXw8zKZcIqPTVq7f4GEjL5yCiDO9+qpZjF7GD1d6jSvAXZtTj1XxOVCK11G3bJY0zNVpYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5201.namprd11.prod.outlook.com (2603:10b6:303:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 19:57:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 19:57:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/doc/rfc/xe: No STAGING in drm.
Date: Mon, 22 May 2023 15:57:12 -0400
Message-ID: <20230522195712.2162736-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0044.namprd08.prod.outlook.com
 (2603:10b6:a03:117::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5201:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8d81ec-783e-48f0-9f83-08db5afec197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NH2T1kUyD1R7nQno6eHxnXSMZJl3gDeYyavGwoMewwROR0FWRor2yX4VKWJL+manUxoUiOsU53H2tVx3EOPwAD7qraaV9RMj8VUlNLGjR7/o9SYmcw56dzKlVPvh8ymnrfa4SjUGyuZMNmZ4Lb5Ipb/hBTqEg4vF0yX73YryOvemnZJKnt1Mve68JcDTICfntlOJl9GBguRKSqosMyrrj7rUcwvFdDRRTYx45kLPjOgOlF10PkIdJvA8Cm8xWWBLfcvud7hWcA0MiHlK2RcLabMwFzTH9UCTHhcchV5UIDVDpMiLPOmfqzVqrf8dusR6znH5bvqoVzE0wwA5uaQUvMnC7zOqPsQOYamTWJ91Wil+fOBaUqotAo9b9nAXVfzRQ71wZJ+lMrwEmz7STmck5Ei1TjJiHHkXqQyU/FUJHmccpFnB1aTiG5L6pE1lTkPpB0YZgewJdYFMml+IR0JQEuuzzBCg2FIADjsEvFb1n6ufHBFuFIRW0u6d3TSNfoJnFaZWJVDDA9Cfu7OoNE1eEdRKYLnaoxxNRmp6Qn9Uyx8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199021)(8676002)(8936002)(5660300002)(44832011)(186003)(26005)(6512007)(6506007)(86362001)(2616005)(38100700002)(1076003)(82960400001)(83380400001)(41300700001)(6666004)(6486002)(966005)(66476007)(66556008)(66946007)(316002)(478600001)(36756003)(4326008)(54906003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mnh4RXZtSzI5SDFmSXN6bjBuQmF0a1lUckZ4THZVdVVhMEtJclIvdkFienpt?=
 =?utf-8?B?Tk14QlM5UkhpcHZvUHZIamlmcmttM21xNlM3a0ZqSkl6b1VsaWF6a1JmQ1Rm?=
 =?utf-8?B?RTJscnZoYUZWcVFGUUxOemVvNmk4UzlxMHpqZFlWNDRFV2JGMnFYV0ZHZERE?=
 =?utf-8?B?L2ZONnZoMzJYdlFjb0RjZHd4VklieGFkbmtrZGcwdlRuQWZuOGtSa2JYMWgz?=
 =?utf-8?B?bTNHQjFkdFNOOVlUM0RtTHRoRUJjdWNqYktKNjhWOTN0Sjh5bENUSm5waWxj?=
 =?utf-8?B?U3pwQktZV1crYXBFTlp4NGRQT29KQzRQMk9JUjlwTFlwSTZ1WjRrajA0VHg0?=
 =?utf-8?B?cWRZZ0RYYWJvbC9iRjEzQnJSaEd5YWdBUEROOGlaL2xqMnNxckhrN09QT3BZ?=
 =?utf-8?B?UWpnSS8xWHUwZ0trWWhLTUNpdTR4Q3ZKNGtJak5Eb2I3OGc4U1lVV2tJajJJ?=
 =?utf-8?B?TURUelJZS2c0QXJ4Wkw0TXdNdXlkK1dxZ09SKy9WZDEyOHV3d2FVN202Wkxi?=
 =?utf-8?B?VG9yN0M3emlLY3R2a0s3aExPQ0hXeXBCUC9IUm5wcG4rZkkyNjB0VDVNc05x?=
 =?utf-8?B?TlNyRDA3S0N1M0Qya2NVWnA2UFQ5SkJOS1pVSXNTemFiMUZWREJxMEFJNzhL?=
 =?utf-8?B?Y21uams5dExXSGIzdERlY243ZlB3Yy82a1owSW9GN2lMQ3Z0U05IZVIzM0tH?=
 =?utf-8?B?aEJVWExQWldRWWwwczVLUzE3M3JDWmxrSVJhRTN6MENtK3NWeEI2d2RDTHR2?=
 =?utf-8?B?bjJQTnl2blp0TG1mdWtqSzZMNWw4V1FSREJqRUd3emwrNE1xNld2aStaR1c2?=
 =?utf-8?B?RnRORWtRNlFVb2cxOE5mcVpBc2RlQ0dwWTBNR1pYdGpQWHJoTXRETXVmTmVr?=
 =?utf-8?B?biszZlp1cXQrbEJuUzZxOGJSZStvYmRSaENMaEFpQUlDZkkvRnQ4cVFzQlkx?=
 =?utf-8?B?K3FkTFZUT3pwL3NkYWdHd3IyYXoxOE5TM1k1enJQbjNyc3krMG9DOXpMZXZ0?=
 =?utf-8?B?cnppZDdsa3pWZkNWckNVc1FzYmJSRlBJRHo5ZGVGaGl4c3ZwSHlmam1UdHFw?=
 =?utf-8?B?R0E2RzJXNWo4RFhtM3RTYlpPYk5nWDZnVjA1TGJRWUg5cUx6ZXVFTzJIRG9q?=
 =?utf-8?B?N2pYa0V5ZVExTjJZYWpHTmMzbnoyaEtTY2hTSkZ2VHFKbyt6c21YY2VZbmNr?=
 =?utf-8?B?NVRqVFZYaUJjWlRvM2JpR05WdEMzdlA1NU40UkY1QkVVbUxOdFFqOC9tM3ps?=
 =?utf-8?B?VCtwRzFnd3hpNWpuN1dkeGtNTG9GaGc5Rng2eVJsMzNERVAyeGxiVjBTYXdC?=
 =?utf-8?B?QUNhR2FOa0s5WUpzN3Y0bHRnbkhNdDd6YzE0SjM3bEVJd0RIeFZzclBEcHdL?=
 =?utf-8?B?RFpNbGtTdTZCY2NFMDhYN0YzMld5Z0xBelErV0t2YkZRd0paNEVYQndHd1Mw?=
 =?utf-8?B?UUFzVm5PWTRHZFpOQkFUa1lFT1J3cU9mRGp4YUNib2w3YnFOckVhWCtFNHcr?=
 =?utf-8?B?QlZYd3Iva2tFcWtWVXJ1T0NuVjVMcjFLdndYYzJyNjhvbUxPUCtoRGNpbG1X?=
 =?utf-8?B?QlpjNW94Z0hncnpMRnlQb1h3WE5kNllScEQwZEpYcmpPb0dnbkwyTzVwZU9Z?=
 =?utf-8?B?ZnplallrZlU3MGtSSnlnUENTVVNMN0h2NTRTV0F6WTgvdkhkdnpGTVRSaCtX?=
 =?utf-8?B?TjBLZHdEWE01QlVGUWExa2JuZzBSZUFNWVlmVGZocnB2Q3lBL1FUUmZXMElM?=
 =?utf-8?B?MlEwMEd1RGREbS9weFlTMlRwcmxRNzNYYTllRFZFUE10SUdiaXFOMjh1c0FQ?=
 =?utf-8?B?R291czcyZUU2UTRxWGI0OFVPYnhuMHlLZmpZaE02YUNZQlkxUHp0cWNUSkVv?=
 =?utf-8?B?Q1MwTmx4VUNTQnJSam5vMzlPcmZHbEZvbW5Iam1wYjdiZ3NtenRRK0hZYyt4?=
 =?utf-8?B?RDlmOERIc0trWjBoaWphd25YZnV1VkpDRzVHeVJ2N3hmZVNDZFZJYjl1Wkdw?=
 =?utf-8?B?WkoxMjRwK0VIRUZmYmdNZzkxODYyVWZ3cyt6c2NPWDNFc3BUdVA0bnQ3MWx6?=
 =?utf-8?B?dUE5Y3pKdXp5aC9oK1JZL2VIcktNaVBtMjUvNFFUNnZxNmtYeGhIdG1ZcUpW?=
 =?utf-8?Q?CDDD4UO47+jES3//Q3mJDzi50?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8d81ec-783e-48f0-9f83-08db5afec197
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 19:57:22.2311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFrpOZojv0IRJ8jNZNGfqVcKpDqShzYoqeXMJDE3hPYZLOarCducaW9lKlQE4ZcucJP5SDh7qvmbwEydrI4pig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5201
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Luis Strano <luis.strano@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We are not using the STAGING inside drm and the uAPI needs to be
in the acceptable form before we get merged upstream.

Link: https://lore.kernel.org/all/2023051029-overspend-sherry-1b85@gregkh/
Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Luis Strano <luis.strano@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/rfc/xe.rst | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index 2516fe141db6..8524095a54bd 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -67,11 +67,8 @@ platforms.
 
 When the time comes for Xe, the protection will be lifted on Xe and kept in i915.
 
-Xe driver will be protected with both STAGING Kconfig and force_probe. Changes in
-the uAPI are expected while the driver is behind these protections. STAGING will
-be removed when the driver uAPI gets to a mature state where we can guarantee the
-‘no regression’ rule. Then force_probe will be lifted only for future platforms
-that will be productized with Xe driver, but not with i915.
+Xe driver will be protected with force_probe, which will be lifted only for
+future platforms that will be productized with Xe driver, but not with i915.
 
 Xe – Pre-Merge Goals
 ====================
-- 
2.39.2


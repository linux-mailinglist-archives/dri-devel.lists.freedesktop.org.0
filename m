Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E735A553D2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 19:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957A710EA51;
	Thu,  6 Mar 2025 18:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F7tz6OIY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD05810EA4B;
 Thu,  6 Mar 2025 18:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741284093; x=1772820093;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=ZpJLDjDx70SNaQ1CHIespDtQhK1tWR3SDzPApCXicMo=;
 b=F7tz6OIYFCXTmkfbAXkn4Leqo5F/fUlpURb4S6PwunCjnGElh/xYWMnG
 Tit05ukE8TVJUAeNiYB74uqTJY0cx4lI4aqLz4Bu86ZJxEw3CWNNMUnSO
 sceip4izKgLcTf/ntjiK7gijmGqphJQBnbPq8br2Cp2Au1johkf92Zn1j
 rSYA2n+xPPq7ubRG3mCD9PUsVDRzYDqCMLQN69aUBU7EG5dE4u5Roa9/Y
 29oxa5R5ELdNqki2/P3V/fxjWF5TQAYVe5N3O0aBMBPMzhnxboWqUUxWL
 X9TbwjDlcM4B1xGMWxr9tmLPZO6Mj9EcG0019+oy6amU8dC+eOh4KkZBA Q==;
X-CSE-ConnectionGUID: r9Q363v3TRSdprdzLiPjQA==
X-CSE-MsgGUID: ZJHsaoitQnmvRoRUUU7WsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="45967469"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="45967469"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 10:01:33 -0800
X-CSE-ConnectionGUID: AtZtJmzRQtimF2xEKk8NKw==
X-CSE-MsgGUID: N+2AcE20RtmyGJ3KuzHP/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119598499"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 10:01:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 6 Mar 2025 10:01:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Mar 2025 10:01:31 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 10:01:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6aanf9A8vC3RQjmFrv+qEFxJHBXLV2u6Wg+LaPNzIZ2+ka3Mddy9VRJcRCnEdSd0CTWHXwN7C5ezeQRppU0BEZ5Xi1QLahzrCJWzNbWD0pSjJi3C8cQFpS9UMmcqLg1ZvQ9NVy35WdXYOEtji4Utj7TcRdb1z6ynPQWnRBqxcb3k6MbizDOy5DjDaHeh8JLjjM13f+QjGxxxMVpYHvVEDC9Alivi1Ta2DMXTny4mM6657ykuA79DlEn6m5GaTG+ZUKDVD93JJoshBDtOZJBgdO/OyF+JHokUSV6kgR+v58op5xJwsTqNnbUuCapnKKDEUlW2nRAjtkhXUL1bTN1OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVbpHBj03qWvkq3VdH6SUo2zt/5eRFD6uz0K2DU7aE4=;
 b=ti2OE8lXsCVfGaIfGjV/Iz/OWd5gitTWh4N+JxH1SkmQg5QAmMICojQi3D2g4AvQxyCAYHiKq3c/FCsrsk9kXN8raI6B7z3hfGcrVblv6GWpOQtv59ZpFjI8Q0Bzcm0DQ80whGQFOM/VCkBQucMaOeMWNk4lQwWo/MA7XOz/FB8sMvgr5TngbwsQjkem9XUK4wzqkPw1na4yXSVnUzBMJ01Y2STu+4nMtcBC8zk93jzspIZDnUrmw9r1Vg7Hvgu/RARoXUjFQ2d0A1BcVoZkSMlw7lJ9t9bsQwA68ff1X7FBrPM1tR3btaz60rGKGlGfdoOj9FDqupFfjXb7Vn2uvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB4955.namprd11.prod.outlook.com (2603:10b6:806:fa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 18:01:21 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 18:01:21 +0000
Date: Thu, 6 Mar 2025 13:01:15 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <Z8ni6w3tskCFL11O@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:303:8d::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB4955:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b4e104-ecb4-4efd-8222-08dd5cd8e6c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?LGwB5W2+Q9ffL4fJX8fbgJvj9eLlxk39+EwRlVpITDxZ9RMLJ3qXdmEdqA?=
 =?iso-8859-1?Q?aoTPogmbb1tgfZTjszq3tAUt6cc7Pp/ejU+hxr+6KFI6EB04xxhKADo9mr?=
 =?iso-8859-1?Q?o7ByWFtcwJvMwzhCQBSVaXSVHTUPRm2JZix4WQs/6EI4g/RRm00VAozbQG?=
 =?iso-8859-1?Q?KTpCOWS8QEeoXkjruymca6fEWO8VrARei49JMdJJVvtHMBA86Yf/oPgClt?=
 =?iso-8859-1?Q?M7jPVR3rE3EiXMq51uQI5jrD0SdKJ5PPJULlJlPlHCwLhQBV8N5noT9kJd?=
 =?iso-8859-1?Q?faxpHK5aX06wbxacGE8z8uDiHkfdF7k363bJtzOoQTIgz+SqX9e5Lg4avG?=
 =?iso-8859-1?Q?68P96M/j8BXPkZXHYrGON8K3YLXiszi5nH3/pEc3y36leOscw5ZldB6S0I?=
 =?iso-8859-1?Q?hjQBMWxmzPm2PngTHSn36WihF8lSDtdb6xnDSMSj63iJ+8cfa7wp/ATygZ?=
 =?iso-8859-1?Q?QeaOTHLyxXgEx32c52ac+swoiKKMImkm4/TST5U9osWa9rpEQ19gWfHJSu?=
 =?iso-8859-1?Q?mSQT2gOT0IcrEr4rODuSXw51huKh3n248k3BVyWf6tHoEade2EQ+VASNsf?=
 =?iso-8859-1?Q?Dknh0dTLd/oLGaLbxlUk2P2U1cIVqjwF3AZj/bkMEtGzm4z8kwOqDi8Flu?=
 =?iso-8859-1?Q?YI/A0nox7qNYWadA4C2TCJcmJFDZmQRnuAzM3Gc7coBTLsoHifkeRSlTrN?=
 =?iso-8859-1?Q?J4Ucdjp6RDFhbkpJcv/+VJUluJgSebG16II/e36Zglh4ZA+FBq1yqRrIfp?=
 =?iso-8859-1?Q?NOjdZOdb7y4uY2CyDOqC+gbA4FcHXaTXDGHKkXhTG5n+6NACWhTyz6umcc?=
 =?iso-8859-1?Q?T3FuLndrsFVwyAi9JdpxF7l0XI4eJys5FnKlO1dQlbjx4lilJxYfAHc6zx?=
 =?iso-8859-1?Q?Zi9Bx1eFVZfhxIkU9kaGG7NGHwG59SSYyVm+m7G5Tj54q1g7Aip53xr93e?=
 =?iso-8859-1?Q?M9X9YmiPxFOJGVEIw7B/2/fcDYbVeeviC1iGMMeTu+qZmA7om0qyZANJcm?=
 =?iso-8859-1?Q?4w2xiw38rNjy1DCALZskZ8AF4SwsA62i0ZU64wUkYKIbxiFx/d9t/qLRPk?=
 =?iso-8859-1?Q?2BZ7boUnQFY6d5W6yZBuj314AQnL1s4KQ2Q2n6/YIEhg+ldKxRVSVIPkU8?=
 =?iso-8859-1?Q?YBMGpLbMd8ZZRbmyc8qSigXUnpgUmel44rPxlLaDzpDY+bRXJJ5+ufYIeU?=
 =?iso-8859-1?Q?oekdAU3OHB32KgyTVgFp+Ma1HZcVRYbmJM7n1lENEPWm3v7dWPquDbn0d9?=
 =?iso-8859-1?Q?cC7ydlhZeZguiYRpKefwhTdaxWbuNmYoxoiULmJYyqBJWMbC6YcV86akTI?=
 =?iso-8859-1?Q?cFkPuo7Ibkyzx+bC1xIjnhFUVhKRHLVC0HUIEu9BTji08vUaZ2//AwX5IN?=
 =?iso-8859-1?Q?FWZOW9hadn/zhMROYkJur6f+IrFBs3lQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LhwT9kJ0CIzCDAdpL7NUvcwUnsEkwg/Lr7S63eXjGMNIg3h7SqoJM3Marf?=
 =?iso-8859-1?Q?QsIFv+DByqbxogh1Bbbk8Y4qGsNfQxXUO5QQ+bDBV+QgZ6YuOZwyhKzOA9?=
 =?iso-8859-1?Q?Lm7dl5zJxYG1UGaLWTX9kfyFTT9R/72JX24+d1kVQb2OnYISDo1lVa4Dog?=
 =?iso-8859-1?Q?ojU5jSWFAxNjqVWnrNFSDp3G44bQmu7ohUQJy+hFX/WTfbnIGsyv95Ypam?=
 =?iso-8859-1?Q?nfg0LWY7b5Xx66qjRtoFi3B08dpxce2DYKscJv9cant5uBvy4kMfC6Fca3?=
 =?iso-8859-1?Q?LaMyaN1AuqOpo6ZoV0m8PqJVbP1iieVyWSiZEwcxgZTD7V8fANxd73kZY4?=
 =?iso-8859-1?Q?Nh3Qcer9MINwNGRFd8Fn/OhjeDUI8/hbod5KAjtILEGOr3upqrxEIIMUu9?=
 =?iso-8859-1?Q?f4ZhACbQ5pPmOTss4S84p/O8Z2ITIGB3kT0BeM47KU7DXHG3Hsy8+fHbUC?=
 =?iso-8859-1?Q?zNat7Ptack/04Qb6c7scH3LGUNimbGJeuoiPNqnbAvPDuzz156P0tcNouW?=
 =?iso-8859-1?Q?NbWKdzoSAdOxYiMg/uInrxlYUxO+3NfW1876qgRuOcg0LjlIKSDXwqy+v1?=
 =?iso-8859-1?Q?Bc34TUXpJuB2MMS2kfaul+6VFeDTWRHuExVZSfgehN2H7Ni7Cca2AXDYMz?=
 =?iso-8859-1?Q?AAnQgySlORaQfY8rz3xMW+T/1hJqT7rMt7OiGYaTVbt3BplhkL/+vF9Ye1?=
 =?iso-8859-1?Q?Q/zZ0wEQawcWfxiPD9wLN6tY1p1FULXRRLTYSc0lUFurkkevZpQzCMwD1T?=
 =?iso-8859-1?Q?qmyOqaPc2qMYMUZd32VH9cbbnHdXAuuQp+C/hTWQgqoSGZS1JDWP8Eqjuy?=
 =?iso-8859-1?Q?r2oIqDwMH6qJ1uSPcjhomig3BGNps/mrBbf/OBt6kgC2yibhfmznheBbS5?=
 =?iso-8859-1?Q?YtWILn7frwa9pmuh2wU4G/0ynFC/z8leMr6WE12FdecN+btUboIC4KVqI4?=
 =?iso-8859-1?Q?oQd1pczvilHK2EeOc7J99wE+xZ3m4cGcQ81WI6N4XsHXTIgBh2dez9iQRl?=
 =?iso-8859-1?Q?+RAVuWe57NrF3rPmxYibzprqjOhk4JrQo3o9DyTpBoEYyOfNaZr/haWbZP?=
 =?iso-8859-1?Q?r4asISCK4sRdSuxdSXCSbUKUbsg8ctXjVUwvDN7z7MDotLPFPs2xPYQMux?=
 =?iso-8859-1?Q?pNPyUTEx56tUjuXXA6CjWXn9QTHikanOaAlYqcLS49SXiRcyDn5oo6piUh?=
 =?iso-8859-1?Q?P23skirg4Dr1rF/eBnVRT2HgZAK40LE7p1sM1VStJablUyrT+F7KAEfHlh?=
 =?iso-8859-1?Q?9Isgy1Yv3NMmbvmHslUtK6vT4CFgcsGV/uKNqp78z0l2XwSFrr7hEz6VS3?=
 =?iso-8859-1?Q?/hbBBDMr4uiyEQ/kIAUh6zGeGi54uz2UxSQzD9br1evO4nbn1VL2PUmGoB?=
 =?iso-8859-1?Q?QAAMcIo8LzXvUkB4XbBhir55mnpAZDmu7Fjfxj9XxP3nhmnxt9zun0XoMc?=
 =?iso-8859-1?Q?dcVKizAtCVqQMkJcnIWkxAwxNM+rDSEZuHzNOt8lny0Jo9f/gYPjZNOvAF?=
 =?iso-8859-1?Q?8Twym71umunwT5b8FeN2sjg0+wB1h+2K78/ztWIBYaPlviNvoUxkIbV+Jq?=
 =?iso-8859-1?Q?nbpRFGZHgiiy5A55LmUvuo/HCmhSAECnKVSukpSJULbR0l3hp/7UAsJdj1?=
 =?iso-8859-1?Q?aMObcIB9YAvxTqMBNeK0YGx03l+mBn7XQlvRyKd6OTU8Gym9LkJvxBrA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b4e104-ecb4-4efd-8222-08dd5cd8e6c8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 18:01:21.2869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MTe1H8Me/yQqjtZhGyQA+dTvOsOi6iPR9YB1qSWVWuj6b5OGxJWK0g+JI9oAoG0wUrvyllOjIF6B0iZLjc2bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4955
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Sima,

Here goes our xe fixes for this round, with
many fixes around userptr.

Thanks,
Rodrigo.

drm-xe-fixes-2025-03-06:
- Remove double page flip on initial plane (Maarten)
- Properly setup userptr pfn_flags_mask (Auld)
- Fix GT "for each engine" workarounds (Tvrtko)
- Fix userptr races and missed validations (Thomas, Brost)
- Userptr invalid page access fixes (Thomas)
The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-03-06

for you to fetch changes up to 333b8906336174478efbbfc1e24a89e3397ffe65:

  drm/xe/userptr: Unmap userptrs in the mmu notifier (2025-03-05 14:25:27 -0500)

----------------------------------------------------------------
- Remove double page flip on initial plane (Maarten)
- Properly setup userptr pfn_flags_mask (Auld)
- Fix GT "for each engine" workarounds (Tvrtko)
- Fix userptr races and missed validations (Thomas, Brost)
- Userptr invalid page access fixes (Thomas)

----------------------------------------------------------------
Maarten Lankhorst (1):
      drm/xe: Remove double pageflip

Matthew Auld (1):
      drm/xe/userptr: properly setup pfn_flags_mask

Matthew Brost (1):
      drm/xe: Add staging tree for VM binds

Thomas Hellström (6):
      drm/xe/vm: Validate userptr during gpu vma prefetching
      drm/xe/vm: Fix a misplaced #endif
      drm/xe: Fix fault mode invalidation with unbind
      drm/xe/hmm: Style- and include fixes
      drm/xe/hmm: Don't dereference struct page pointers without notifier lock
      drm/xe/userptr: Unmap userptrs in the mmu notifier

Tvrtko Ursulin (1):
      drm/xe: Fix GT "for each engine" workarounds

 drivers/gpu/drm/xe/display/xe_plane_initial.c |  10 --
 drivers/gpu/drm/xe/xe_gt.c                    |   4 +-
 drivers/gpu/drm/xe/xe_hmm.c                   | 194 +++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_hmm.h                   |   7 +
 drivers/gpu/drm/xe/xe_pt.c                    |  96 ++++++-------
 drivers/gpu/drm/xe/xe_pt_walk.c               |   3 +-
 drivers/gpu/drm/xe/xe_pt_walk.h               |   4 +
 drivers/gpu/drm/xe/xe_vm.c                    | 100 +++++++++----
 drivers/gpu/drm/xe/xe_vm.h                    |  10 +-
 drivers/gpu/drm/xe/xe_vm_types.h              |   8 +-
 10 files changed, 292 insertions(+), 144 deletions(-)

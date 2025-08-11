Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7402B20765
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 13:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B7510E453;
	Mon, 11 Aug 2025 11:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="by/SvY5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB99310E451;
 Mon, 11 Aug 2025 11:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754911170; x=1786447170;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8bpewh5qrdXMZLJrguI8TsHYnr/9d45RS+bSJJpct5M=;
 b=by/SvY5T5z0b0T0wIXyRr0f4SAjDh8ZghJAb7cPmFXDt4ByNgHC49DmT
 JIPZHRM9kEyRt8eyHiOG0EQdHEp+h725nr/Bz1kcT+gWWD/TGxunjdPqj
 voof6SMdI6bhtwu/SNvfA8gM3ke2jKzvRUSpvALI9KXI9vXVMvtqYOMce
 yYmy3wC/ff1T3p8DIh6BSdQ7cX+8LYrdTzaSovA7ALKiwjIALGv26lSVZ
 KSCGf6i5X77PKhCX+sfLqFVR8YaL6QvLTYGK7+r0lW6F7G/Pd12VT9Okf
 Q42O5ZzrpmvXhL5jVro/sp018Bm4XcUpFjdqgucH/oCGz3kJoNVXnpnnd w==;
X-CSE-ConnectionGUID: Jgxvyx7MTJaW2anze+LJdA==
X-CSE-MsgGUID: 2rVUwhPERR6liJaP9xUGLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57081657"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57081657"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 04:19:29 -0700
X-CSE-ConnectionGUID: 1+1eSvgSRs+0qDGuxCRGHw==
X-CSE-MsgGUID: 0ntWQ38rThqj2STjcuMlwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165097206"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 04:19:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 04:19:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 04:19:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.43)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 04:19:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uaHxgBZ2+e/m566nnsQZmGcCjtXpgxyr78oWbf8g8wrq9K87eEIiZ4Q+z7jlSrncD8gChs9JgBZYkd2svCwap5B27s/GzXexQOnMmUlVBwcYoPPQionmSDbWGL2A+WlSqIlXtotQgxf1/VFRZdhKKZokNXWcEI7bZpc+QRORG3k6Qm5AjCBPyI6y6OSjbzjlU96mMHymT+WXunxHSHDj5U79c5Po8D2xIK/58mLyWr5azG3Mqu58DVCU8iLuOjgyBSilhtCg2VFgHIxHQToa6zwk/K2ryFB/MEVMJXs2j5ePZjkIA0kaymp0gFVhvJCnn0fkDOwDqa4UtUC4jXLnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bpewh5qrdXMZLJrguI8TsHYnr/9d45RS+bSJJpct5M=;
 b=B/DJV/S0C6J2d6U2AraJ5GkM4qQjZLqLraWmv+u1VYHejRCa05mFl+8stTu7xwn6EI9uEVYKtTfp7zqHKo9T9oWko/sw5IAFkyKSzO4yNP+lSvIpPpFLGRTY21JIykLjdNQUJ3bjU45deFDG4amJEH5cURb0ROqCidxlizyD5aNXF9MOyJCPF0YFdBhWc43E0vcGQ+5+0Zs4J4XxWPOCwUnonMymSLUq7F4x7CBzTCiiSoPPy/LWsxEAnBP9byP++q+nhcZRoxc0MnHfHFxKNvHNkKvSpHPMQkru4mavCfQaU6tenRSAmCLsq5PxR/c8jw9ODM+C/Ko4malCjR/5Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ0PR11MB5816.namprd11.prod.outlook.com
 (2603:10b6:a03:427::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Mon, 11 Aug
 2025 11:19:26 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 11:19:26 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
CC: "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "siqueira@igalia.com" <siqueira@igalia.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "robin.clark@oss.qualcomm.com"
 <robin.clark@oss.qualcomm.com>, "abhinav.kumar@linux.dev"
 <abhinav.kumar@linux.dev>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
 "sean@poorly.run" <sean@poorly.run>, "marijn.suijten@somainline.org"
 <marijn.suijten@somainline.org>, "mcanal@igalia.com" <mcanal@igalia.com>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "tomi.valkeinen+renesas@ideasonboard.com"
 <tomi.valkeinen+renesas@ideasonboard.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
Subject: RE: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Topic: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Index: AQHcCqI6AGKw1/GB0USjdMcIW4UewrRdM8uAgAAKoACAAA7iAIAAAG7Q
Date: Mon, 11 Aug 2025 11:19:26 +0000
Message-ID: <DM3PPF208195D8D7513998A044E1A54B6D1E328A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <20250811094429.GE21313@pendragon.ideasonboard.com>
 <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
 <20250811111546.GA30760@pendragon.ideasonboard.com>
In-Reply-To: <20250811111546.GA30760@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ0PR11MB5816:EE_
x-ms-office365-filtering-correlation-id: f98bd1fb-28f3-4602-44f6-08ddd8c8ee7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?WXZTZmtiT3k3d0h4R1B6L2FSTFYzWDR1SUlKdm4zY1pNeWw2WFpsa2x1NU50?=
 =?utf-8?B?eVd6UFRxZStrMkc1NnE3TFE1MTdRaVVZSFRjSUVOTWtHbUhScC9WMG9LTFcv?=
 =?utf-8?B?WXZXd3gvZW1NTzkvc3dzbXRudFVnYyt2eGNYaVZybXk1M3pVQnJFdXdjVUVC?=
 =?utf-8?B?YWIrNmF1d3V0QVB5bXp3OHpFbHVsVk5BQmg1STNFd2FHMld3MWYvZlFmTU5N?=
 =?utf-8?B?Q0Jlbjg1MUJoOENSbWhkZGFJeXQwS1ZoQnhVUUNNKzgvUHVlV01EbjVxMElD?=
 =?utf-8?B?Y2Q0bWpjZzhTQUxNNGVGc29FUGdtNjdGVHFHSFVjalhZOWVxZytHYncyUkFB?=
 =?utf-8?B?VytXdFZ1S3pLa251RWRpeHEzSkNGVFByMXc2WVdTQmt4akZNT0U1N1AzK29S?=
 =?utf-8?B?dEFBcU9jOXRrTk1tQndGV3ZTYUpqSGcvQ002YUV0dksrSkhzVUVoZVVvc3R4?=
 =?utf-8?B?VHF1NzZscnY1eHlOM0kyYjRSdjBlT2p2UVYvcHhVSk9TTVhrdTRhYytuOVJY?=
 =?utf-8?B?MFRVR1JscXpvZm8vUEFObXF0WWZ1eWxKZFNIbmUwZmF0QUtIMkFBWFJCRThQ?=
 =?utf-8?B?a3JWQnBHdXowUlVLSkR6dVArZnBMbVp0T2FkZDBQNVVDS2RoNE1zOUlGNFBU?=
 =?utf-8?B?blZPdk9OVlloNlRlbGkraVYvWldOVEdTS0V5QitFTi9wcnBWaUx6c2tCQkxF?=
 =?utf-8?B?Ly94Q2RtcUNtRnVLNEhFU0grWWRmRDN1Z0lGWG1hV2V3OHdBaTAxNWI2bzFs?=
 =?utf-8?B?amNHcytESWQrZjhGaFpySHowNkhnNFowMm9sNksvMEFWaW1oNE01U00vS256?=
 =?utf-8?B?WkdKUzNyOG5rdTJRT2dyaXoxYy9kcHJyZGh4QW5oTkhTU28zYTNPb0Z4aEE5?=
 =?utf-8?B?VlpEYVFWWGtiaXd6bkw2aG5pMTI4bm1peDBvQ3FNd3pEK3hGRnQrWWxSSU0z?=
 =?utf-8?B?NkZLNlhCamhRN1VVbSs2S3pqdk1NaDRVVHlXNm03N0Q2QW9JdC90M2hTK05Y?=
 =?utf-8?B?NnBabkNubVBDVWJ0b3FQSUhHUm9SMGFCMHdmZmVYRGpSWXZIMFZkMXBiMHBX?=
 =?utf-8?B?VExtY2N2TDE4QmhraVg3Qkl3MzdDZDJnVDZaWUZFQ05vTEZ5bks4YXRja3Iz?=
 =?utf-8?B?aGc2cDhHOUFiVTZnakM0dFhQYlF1SVNBcGVORWcycUdONDhUWEJhTElubFVm?=
 =?utf-8?B?UktpTGU0Q1RpVUlTVXRNUElRc3Rua3ZFWGFsTmt2T3FjZGZYRVZMOHY3SXFa?=
 =?utf-8?B?Zlo4elhqcGhvZ3lEZGRTZThZenREVGxGQUV2WUxFbUZjODJoVThIbzBwQjd0?=
 =?utf-8?B?ZVRiTmdhTW5qSlFPT2ZlM0F2TUVsMno1eVo4TERsVURGZWUraGdQaFRCMVV3?=
 =?utf-8?B?a0pmdzFWTXhlMVh0Q3J2cW9FN1lDcWYyUmNRQ1M5WHB4bjZ0cGpQaGRBSlNw?=
 =?utf-8?B?QWQzTFhOeC82TEhMM085bFRJV2RnemFlUjRhSFVGcXprNm00QXdtNUE1VHVo?=
 =?utf-8?B?NnFDZHhmMVdTbFc1bUhSWTZSL3hObTdVNnBTR3dYeHZoa0IyMTM4Q3N2OENQ?=
 =?utf-8?B?UzZRQjN6cWczN3VPRjh4TmNlWGtyNlZDMEpJMHR4Sk5SVkpQQTgxbmpXV1NE?=
 =?utf-8?B?MWcxcitReDcrQUk2UzRZemwyd3FFcy9EZ28xQjFySDNGNEl4RmJyTG5aNjFQ?=
 =?utf-8?B?WXF6VSs3cCtCeWR5L2d6Yk41STV4UzZKSjhkbFBYSDlhdlBZb1F3WnlsL25Y?=
 =?utf-8?B?a0ZkMkFFcXFVZVpYd2xaUnJmNUZwR2F6NVcvdU9XSG5qaDZkM3pFdzJBVkZw?=
 =?utf-8?B?aSs0R0pxZnN0ckYvYlpjajU5SFFFZy9aclYybzNQMUU0TU9RY2QreGp6dEdN?=
 =?utf-8?B?Ylp1VUVaYWVpc1hzQ3NSaDB3cHBUaWJwMHV2TDBtYWQzZzFMa0RweC9kL0hR?=
 =?utf-8?B?U0tDb3pBa0VlSTlFbmRodldoR3QvTER6N3c5WVhsSVVzQlF6UnVPRnlxNmRE?=
 =?utf-8?B?eXlaKzdtTHpBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3c3RFQ5SDB4eXhRQ3R0bDNkaE05dUNDRnR6MGZtS2l5eWxhY1BVRm1zUGlL?=
 =?utf-8?B?MHN1Q1daTVFGOHJiSVlER3dNbzdKdFZNY3drZFo0b0kvWER5WU9lVlZOYnJ6?=
 =?utf-8?B?SHVaNkVxWkFpRDRIRmlzRjdVbW53WGZEVzJLZFJKTlBtVkltVi8zVmpGa0du?=
 =?utf-8?B?OVpPZm1aT0x3NDZoQW1SRVJzVFhndzVkVHJPbjliTGxtbkluSnQySTdzakJ5?=
 =?utf-8?B?QS9sb24wK2Z4blFGVHhGY2IzekEyT1BaMVQ1ci9uVGFWeDJsZGtsM0E5WVVa?=
 =?utf-8?B?dVNSMVZuSUFhcGo5SHdVblpkTklONXhvRTJnaFpTcUFIazNjbmtlZWlDNlN5?=
 =?utf-8?B?ckdoSFp6SU9rYWJ2bDdNT0xGZWRxTStwSWsrQ2ppQmt5b0RLR0Y1MkZQQkpQ?=
 =?utf-8?B?am1oMWNrNFVUcVZacWJma0VjSU1FUTV0dGc2cWlsT3NiSDBDSFIzOWFWWkl2?=
 =?utf-8?B?OFNMSVlva0EzTEtsdGxUbUVBMFgvSWE0OGYydkgwWkN5amlLMmpDMTR2ZTE5?=
 =?utf-8?B?eXBPSldmcGluUk9zUkhVK0J6cXdLaFhWMThMQzUyQ2dVOStyMTVMdngzNjRF?=
 =?utf-8?B?Z2hoR0MvZmJ6cHJHVHJSSHkrVmFmSHR4UWtyVG5RTzREdnlRQ21DREI0MlVs?=
 =?utf-8?B?UE1NSERicWIzTjhhd3MwK3VGMDF3K1E1UktoY05TU0xyOEx4eWlGUmRPY2ZV?=
 =?utf-8?B?N3ZOcUR6aUtDQytnVXREbjRQS05KSXl5SzlremlQZDNteHpzWk85Nlg4R2Fq?=
 =?utf-8?B?SDA2dmdQWTJSV3BWYXNPSWRvbVFrS2dBN3FxZlNrakF3K2hESm1ZQ0pBS1NB?=
 =?utf-8?B?azJHTERiOWZ0VGNxc2d3ZTYxS3BROEVKdUkzVnhhWHJLVklLQit1RkNZVFpY?=
 =?utf-8?B?QW15OGw3RitXVXcxc3F5ZDZ4RFRqNXdMU1VyRlVlcG9sZXJDOHFWbEZFT1g4?=
 =?utf-8?B?bGIxdXJSZkwrdkdoWVp2RWN6RUpRcW1uc25LR1kycW40S29DYXNkQWZIZmRP?=
 =?utf-8?B?TElCRFVuQ09FUGZxVW4zM0RFZWVlWlAvOUl6K2E4b0FDOENxYjVEbzI0Mk90?=
 =?utf-8?B?eHBjRE8wT3JyQ256aE5jaDB4ZnQzVWxEbDNrTW9YQWt6Y3F1dlJKNDdCNVR0?=
 =?utf-8?B?MTNHTTR4djZaS29zWEV1YmZMY0VpcjdIQmJRcDZQNzQ0dzdCTlFLZFBKY0tM?=
 =?utf-8?B?ZFBsTzFNRy90VjZGay9YRS8zMUNNMElBTi9WKzRhVjBHUlAyK0N3dGpqZDFm?=
 =?utf-8?B?dzI4MjJGMDl3VDdiVVdqdnQ5dko0SFEvYUwzNFZkU2tJNkp4VzlBL1JEaE5w?=
 =?utf-8?B?MTg5WTVwb3kvZ3JoZnRsei9La2RQR0plOE5xQWhxVUJHRkdyWEZzbHVwK1dD?=
 =?utf-8?B?WGQ3V0pGbldkUDVzaTRxVGtKRnBWeFIxQmthYTVGK3lPSDA0dFRtLzYvUVZV?=
 =?utf-8?B?dVYwTWNlY1locEVKSzZRYzNiYW9oVlkzb1hQK0tQaXhaRFBiYTA5VDlTUTB3?=
 =?utf-8?B?NzRWMW1idkRWY2xFWEEvaWtSb3lWVGI2NnluVGZ4bm1EdWhoT3p1UXlnL3Zy?=
 =?utf-8?B?Y1dpOXVFNmRpU2UwY3kyL2hkOVY2QkFqc256aTB1Y1NQc2xFWmRwUGZxTkNh?=
 =?utf-8?B?VmpwNjlNQkN6RXo3UnRETkExK0I4aTlJdnBnNFlCai9QVHNycUE5dGNUYjdo?=
 =?utf-8?B?Y3RxRGMwOWIxai92R0JxUTRPcStyeUJiU0ZwbXgxbE03WkhnVHNvWDlNZGhN?=
 =?utf-8?B?R1BaVEVhQ0tPNE5qcGp4N3NmOXJCYkZCYWd1RDlYbVI2NXp6eGRBUkMwcnFp?=
 =?utf-8?B?YUZEZ3hUU3FlYTR1aWhmVzNGSGlzOFAzUTdrb3RzVW5hMEpNSzIxcEt2cjIv?=
 =?utf-8?B?UjYyTzh3VnBHbThwb1ppdHZZOU9EWmFrU1ZMeHcxMXR4TnVuWE11MjRvQ0p1?=
 =?utf-8?B?TElTTVI0UVZxd3Z1NmN5VENxOHJhSk13aytDeW9nMDI2dEhuWkZzOXhpcENY?=
 =?utf-8?B?dlBFNGhwTGl1K1dHSkh2NngvNWxPazVsUmlLTGltOE56VjF0UHBBVjJReU9M?=
 =?utf-8?B?RTlMNy9WaU9aMnRacVJITDdDTWlReCthZmNTTWpyWkE2RklIQklia1dCczA4?=
 =?utf-8?Q?8lpWQsK4TywCTkIayaCC3ucJq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f98bd1fb-28f3-4602-44f6-08ddd8c8ee7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 11:19:26.2202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z+iM1Ff0Yabv57Im3r1i+kdhZq2NHv7UGMzVgnEgBbIWY1gZSs2sPajo/gXEnX+28HQNanzirIAks4srTkUEAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
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

PiA+ID4gPiBAQCAtMjMwNSw2ICsyMzYwLDExIEBAIHN0cnVjdCBkcm1fY29ubmVjdG9yIHsNCj4g
PiA+ID4gIAkgKiBAY2VjOiBDRUMtcmVsYXRlZCBkYXRhLg0KPiA+ID4gPiAgCSAqLw0KPiA+ID4g
PiAgCXN0cnVjdCBkcm1fY29ubmVjdG9yX2NlYyBjZWM7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwkv
KioNCj4gPiA+ID4gKwkgKiBAd3JpdGViYWNrOiBXcml0ZWJhY2sgcmVsYXRlZCB2YWxyaWFibGVz
Lg0KPiA+ID4gPiArCSAqLw0KPiA+ID4gPiArCXN0cnVjdCBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rv
ciB3cml0ZWJhY2s7DQo+ID4gPg0KPiA+ID4gTm8sIHNvcnJ5LCB0aGF0J3MgYSBiYWQgaWRlYS4g
TW9zdCBjb25uZWN0b3JzIGhhdmUgbm90aGluZyB0byBkbw0KPiA+ID4gd2l0aCB3cml0ZWJhY2ss
IHlvdSBzaG91bGRuJ3QgaW50cm9kdWNlIHdyaXRlYmFjay1zcGVjaWZpYyBmaWVsZHMgaGVyZS4N
Cj4gPiA+IGRybV93cml0ZWJhY2tfY29ubmVjdG9yIGhhcHBlbnMgdG8gYmUgYSBkcm1fY29ubmVj
dG9yIGJlY2F1c2Ugb2YNCj4gPiA+IGhpc3RvcmljYWwgcmVhc29ucyAoaXQgd2FzIGRlY2lkZWQg
dG8gcmV1c2UgdGhlIGNvbm5lY3RvciBBUEkNCj4gPiA+IGV4cG9zZWQgdG8gdXNlcnNwYWNlIGlu
c3RlYWQgb2YgZXhwb3NpbmcgYSBjb21wbGV0ZWx5IHNlcGFyYXRlIEFQSQ0KPiA+ID4gaW4gb3Jk
ZXIgdG8gc2ltcGxpZnkgdGhlIGltcGxlbWVudGF0aW9uKSwgYnV0IHRoYXQgZG9lcyBub3QgbWVh
bg0KPiA+ID4gdGhhdCBldmVyeSBjb25uZWN0b3IgaXMgcmVsYXRlZCB0byB3cml0ZWJhY2suDQo+
ID4gPg0KPiA+ID4gSSBkb24ndCBrbm93IHdoYXQgaXNzdWVzIHRoZSBJbnRlbCBkcml2ZXIocykg
aGF2ZSB3aXRoDQo+ID4gPiBkcm1fd3JpdGViYWNrX2Nvbm5lY3RvciwgYnV0IHlvdSBzaG91bGRu
J3QgbWFrZSB0aGluZ3Mgd29yc2UgZm9yDQo+ID4gPiBldmVyeWJvZHkgZHVlIHRvIGEgZHJpdmVy
IHByb2JsZW0uDQo+ID4NCj4gPiBTdXJhaiBpcyB0cnlpbmcgdG8gc29sdmUgYSBwcm9ibGVtIHRo
YXQgaW4gSW50ZWwgY29kZSBldmVyeQ0KPiA+IGRybV9jb25uZWN0b3IgbXVzdCBiZSBhbiBpbnRl
bF9jb25uZWN0b3IgdG9vLiBIaXMgcHJldmlvdXMgYXR0ZW1wdA0KPiA+IHJlc3VsdGVkIGluIGEg
bG9vc2UgYWJzdHJhY3Rpb24gd2hlcmUgZHJtX3dyaXRlYmFja19jb25uZWN0b3IuYmFzZQ0KPiA+
IHdhc24ndCBpbml0aWFsaXplZCBpbiBzb21lIGNhc2VzICh3aGljaCBpcyBhIGJhZCBpZGVhIElN
TykuDQo+ID4NCj4gPiBJIGtub3cgdGhlIGhpc3RvcmljYWwgcmVhc29ucyBmb3IgZHJtX3dyaXRl
YmFja19jb25uZWN0b3IsIGJ1dCBJIHRoaW5rDQo+ID4gd2UgY2FuIGRvIGJldHRlciBub3cuDQo+
ID4NCj4gPiBTbywgSSB0aGluaywgYSBwcm9wZXIgYXBwcm9hY2ggd291bGQgYmU6DQo+ID4NCj4g
PiBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciB7DQo+ID4gICAgIC8vIG90aGVyIGZpZWxkcw0KPiA+DQo+
ID4gICAgIHVuaW9uIHsNCj4gPiAgICAgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yX2hkbWkgaGRt
aTsgLy8gd2UgYWxyZWFkeSBoYXZlIGl0DQo+ID4gICAgICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
cl93YiB3YjsgIC8vIHRoaXMgaXMgbmV3DQo+ID4gICAgIH07DQo+ID4NCj4gPiAgICAgLy8gcmVz
dCBvZiB0aGUgZmllbGRzLg0KPiA+IH07DQo+IA0KPiBJIHN0aWxsIGRvbid0IGxpa2UgdGhhdC4g
VGhpcyByZWFsbHkgZG9lc24ndCBiZWxvbmcgaGVyZS4gSWYgYW55dGhpbmcsIHRoZQ0KPiBkcm1f
Y29ubmVjdG9yIGZvciB3cml0ZWJhY2sgYmVsb25ncyB0byBkcm1fY3J0Yy4NCj4gDQo+IElmIHRo
ZSBpc3N1ZSBpcyB0aGF0IHNvbWUgZHJpdmVycyBuZWVkIGEgY3VzdG9tIGRybV9jb25uZWN0b3Ig
c3ViY2xhc3MsIHRoZW4NCj4gSSdkIHJhdGhlciB0dXJuIHRoZSBjb25uZWN0b3IgZmllbGQgb2Yg
ZHJtX3dyaXRlYmFja19jb25uZWN0b3IgaW50byBhIHBvaW50ZXIuDQo+IA0KDQpUaGlzIGRlc2ln
biBvciB0dXJuaW5nIGRybV9jb25uZWN0b3IgdG8gaW5zaWRlIGRybV93cml0ZWJhY2tfY29ubmVj
dG9yIHRvIGEgcG9pbnRlcg0KSSBhbSBva2F5IGVpdGhlciB3YXkuDQoNClJlZ2FyZHMsDQpTdXJh
aiBLYW5kcGFsDQoNCj4gPiBJIHBsYW4gdG8gYWRkIGRybV9jb25uZWN0b3JfZHAgaW4gYSBzaW1p
bGFyIHdheSwgY292ZXJpbmcgRFAgbmVlZHMNCj4gPiAoY3VycmVudGx5IFdJUCkuDQo+IA0KPiAt
LQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K

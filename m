Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F66C223F9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DC410EA1D;
	Thu, 30 Oct 2025 20:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ii35gW4D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927B310EA1D;
 Thu, 30 Oct 2025 20:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856324; x=1793392324;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=lziEhmcOJN8IcccwoLpIQ61LzThrbV3Wnf3EXFUYls8=;
 b=ii35gW4D3Npa3pREPId6nSlJ4UIPiZiE5ufzM0o0lyo+sZYwWvlOVRf7
 mUnFOshCkuTELNIFNrjkmyMkZ27DC+TWtBIDQ9J9Jq02BLiEliI5L4jD7
 1AnZS+Llgn4vLyNTR2oqY/f0NKN8FP1sDRI5+BRANudk4TfsTkMnp3pxd
 b0PZ1URPP8bnCwF6CwWh7AhC/KqoEbHy5iBXgbGtN4T/fSdL0G6hbIctT
 Dx2h5zJqi8hgn3cmGoYaN5SgVUGt5QriYuRNe0cu9qOUAMg7nmeSLxRuQ
 wX6OOQnAhsqbCZilBoAqQY1nmWqldbf/fsaPvIQrj7GfM7WCMuljF0/57 Q==;
X-CSE-ConnectionGUID: bdRnE2WGS5WNfLRzWszEfw==
X-CSE-MsgGUID: ET/rmAAPTJ6Mb3u6EfU/BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67847675"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67847675"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:32:04 -0700
X-CSE-ConnectionGUID: wGQIRKm/TaWA5KRdXc8QTQ==
X-CSE-MsgGUID: vUnPDu7BT2GnBvHebeEzTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="223283967"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:32:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:32:03 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUwTnU90IeH4Cx3QDkf8w5iA5RE3KjqOmOo2evlUdcJqD0G+ebKsPi5KkuKOwKPOfsY4inDgwlC/S8rtP+wS4o6exR//q7mE0KofsuQBSA6DUGjgthriVb04AqmpwrvuzEFfACK76Nu983FKP2qO9Tz2iTS2x/rfMc+iApPyelm1t8kkoAoPCtPBemf/oT07+oH7QWjZEY1B3qemn8UfuV5zNuwhSUKVmMmgt3+ig9+AEcNl1dXmIXDJkTkjGlkqzoioQJZwLcICD39ZBN8iyOO5Q6e9dwpIv8JjkcMg9RaMvc/0KjtbyjRqqZ8HFgMnnaQ5n2JXo2qmlFpI7BQOpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6bPIAlVg5luXFUOOGUsCVbr44q6taLEU5HxmhytKc4=;
 b=fEYQDnDx3p7w2DCIVmq5Te+tsXHTwqZEKYvAYSKZotfV46Dm7B/oruOPd8Pvw9tdDoosa2LRDs9DqaQfBAJkPy2q2Js2qZsm2Zes6ivNH8XjWDhJKlzncg6Ab1+Hrm0ktbAwEaO5l/it3GoRBUyPIfd5f8eshU84SPWPY1K+9VbGlyegsY3tHYlGJJgMY5Joz8Q4CwSAaLGh8rCOG1jHf7QLeospQJtk8UGW0GT5Mm69ZEk9+xzYM2LDMCFiLqaS54RMT56IBEpiNiTZkUOuCmNGdRitKF9sESdyORanjF+ZbsCHAlSmQjCKxUW96OoA7ICvPHcL9elzMqUzcO5Yyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:32:01 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:32:01 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v3 00/28] vfio/xe: Add driver variant for Xe VF migration
Date: Thu, 30 Oct 2025 21:31:07 +0100
Message-ID: <20251030203135.337696-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0274.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::41) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4817:EE_
X-MS-Office365-Filtering-Correlation-Id: ca48441f-8614-464c-f2bc-08de17f36137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVE2VW8vSXFMTkpWU0ZKbklnYTF4QXFkbGRNSDZmQXdFOHZlanhhS3R6OEhC?=
 =?utf-8?B?RkR0Qy9PZDVVc0xYUXBZcXcvZVNsZVFHZW16M0liSGhrZThJNksyamk2Uy9N?=
 =?utf-8?B?Y1RuY0VvbWRTaGtGeWc0YTVYSXFobm9EOEx2R2xaeXRkVXNNbmozNnl1RkFz?=
 =?utf-8?B?WjRIbkt1MGxnaDJyMVhsMDVjRGFxZ0dkZzZoRU4zVDZIQjBKM3JpVTNJZldi?=
 =?utf-8?B?dWFTdjlpdTNWUktrTzBxS2hQd0crK1A1M1RCK0p3RmFxL2ZDUVdFRlNvYmhu?=
 =?utf-8?B?MUxsRHAwMklOQ2hJTFRWaWVOa1duMjBxOSs2Ly9ONFk2ZklzZHVZMWllNXVB?=
 =?utf-8?B?K2k4b2lYeUs0NkhnQng1NU95L2MwQjltcGR4NklRUGExb2FNVE5ZMkdNM2pm?=
 =?utf-8?B?Sm9DQjRZdE9kMGJXdm43M1dVUWpMM3JVaE1DSTIwZWRYeWZTOWNYbFpoUi9S?=
 =?utf-8?B?S3FmNDVSRDdFRHN2N3lSbWtHRXZxYmppdXpIUVlnTFQ3VGUxdkNVeUNyNkFV?=
 =?utf-8?B?eDl4dnVYNmVlcWl0cjUzNGhBbEtMRFpUU2R1WFVrNFFyelcyWWZTQ3dWeXdr?=
 =?utf-8?B?ZGdpa1pXQXl6UXlPQkVhK2NBZG96enIveVp1TWZmZU8zcno3blVZTmRjYTdQ?=
 =?utf-8?B?Tk1OdmpyODBMaXBXRUVvVUt1Wkhab2ZNc0FlTk96WGcyMjh2L1dyaFB4WDV0?=
 =?utf-8?B?YWJxYjRxNWRyUDJiazM3UW0va1hwLzdTRkNmNmg2VGZvc0s3ZzVyZkkyV3pk?=
 =?utf-8?B?ZEZXTkZ1RXJhYVRkOVBod0Y3RXFnMElrbzdGaUg3MGFxak5EbmtXU1hGS3hZ?=
 =?utf-8?B?VjlCWFEvT2liUnhHdTJCY3RxZzlKdzVtR05RZTV6WnlMdElVUTdMZm5DUzA3?=
 =?utf-8?B?VXJmZUhTT1BTcUZxUk85Wnl2MWVXSGZJV1czTU5vSC9MOTlQeVI1QUZLQVpI?=
 =?utf-8?B?TWk0b0tCYUFLdzJMQWQ0NVowbmtWOSt6SUwvMUd6UFl1OHpEM0NKMkpMYzhW?=
 =?utf-8?B?d0N1ZDl2Zk94REExZDNYVEFhTUFkWHd2MlFOSld1WDBHSzZsVXlKY1l2SU0r?=
 =?utf-8?B?ZkdpVzRxWTlLejlIb29STDJDZklybEZpcEgwdTB5a2JxVGpabHlQckhkdm1Y?=
 =?utf-8?B?QXFwcCtidW9vNzd0dnhPTTZVMmxLOXl2djZicitSY2EyUUdIblhYa1F1M1ha?=
 =?utf-8?B?SXB2Wlh2cXlKRmlTekxNS0lpZDc0Z3BZa1lFYmJOWGtJWU1ibG9ieHdnUGhk?=
 =?utf-8?B?N2NwSUFqVDhtL040ZDY4Umdzcis4UFJOZ3JEbXpGZE14T3ZzdktSYUh2OERZ?=
 =?utf-8?B?bG5qR1BKRzZZTGVYZXJLZnVlckNnRjMrL0J0ZitMcFRNMytLSHpNc0s0Y21P?=
 =?utf-8?B?R1drdkNuYVllWGcxV3YxMG5QSVhqYzN3UllVcFJPdThiWXVSd21DNU5QdUdB?=
 =?utf-8?B?Q1JtZzdLNzI0bnc5cEdQNXZ5ajR4dUxjcnJiVWkrZzJqc25STzl0c1BsNTRi?=
 =?utf-8?B?T3dtd3R3R3lsaUtVbkZLQnN1bHhBS3ZVRGJhRUJFZ1dJeFZSTVcvLzkxRkUr?=
 =?utf-8?B?djJ4TFFodnh1VC9xQ0phSFhLWUZlb3lCZ1R3Z2ZpVTBmTEl0K2YwZFlYU3hE?=
 =?utf-8?B?ek5zZ2wyejJ1S2llTlh5UWxuSkkzVVVvWWVJa3BPMWZBbjBwRWVpYlE3ZzBp?=
 =?utf-8?B?cTQrbDZCZTcwcmhKUGQ5Y3gzODlDT0JUSm5VVDNmVjRkSmZNaFdwcG15SHNl?=
 =?utf-8?B?OUZFUXRKT3NpOHpGMllQTWtVNnVqbjdLUmtqeUZRbE0vTmtxdWpFWUw1eThX?=
 =?utf-8?B?VWlYbkZvdUNkTXEwMkRENDQ5SUJzU0pacUVHQXZDSDlBeDJGMzlSUVZLZEV1?=
 =?utf-8?B?NDlCYUtDUHpSb290bENHOGI5QjV4NUozMTBDWWc2NXVYY0JtbHpaZ0RvajRF?=
 =?utf-8?B?T0hVWGtwd2VWemZKRTdVRDlFbkpacXVEZ05hbUFGc0RzWkdFRGk3aE5DdWN1?=
 =?utf-8?B?WDZZZlFSejFNQ1h4RDdYYWxjdkkvT2JQUWpDc2RFdnFocEVyeDE2NWJyMGdE?=
 =?utf-8?Q?9PN2/7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0N4enRyN1BXTmdMMTgyVThyL1V2OWZDNG9TV1E5dWxuVWM0aCtqOUlRUUZM?=
 =?utf-8?B?VTFMR3VFT0daMDhmSWFSUTZRRmdFN2p3NC9GVjhPYzNKQUs2TFU3cDdldFhj?=
 =?utf-8?B?RHM5SXA4UEJSZkhiQkY3YUZtRmRLNEpUazg2NERwRGxtUlVZeW9KWHNTY3hO?=
 =?utf-8?B?aUJWQ3dtbWRsYXd6MTNab3RPaUtqVVhPcXo1YmhXbmtkaEZtSWZ5QWpzeGg3?=
 =?utf-8?B?b1JEYUZhSkpyUExGbzROcmJ1dkJCVmJSbkVUYUFJamVaSzFjbXJLK2ZXWjRK?=
 =?utf-8?B?NjdiZ1YxaHpMVi9FSkVrVVk1c29qRDZXRVBFU0pUSkROQmM3aTNicGFxWWFq?=
 =?utf-8?B?M0pmSElMcnRyWmljOThaVGRIV1I4NkY4MkwvY2VwZ2txNThiWUlrQWxwbHcx?=
 =?utf-8?B?UnRkd1dubjMvaGFaeTZYM2lZZE5iU0pwOFRpcnZyVTlHdFovZ2ZIYmVMWWZV?=
 =?utf-8?B?WFA5S0JuUVFFa2hTeWRoOWRJVFgwc29hOElsUTBiOXRHUEI1dXpOWkwvRGNJ?=
 =?utf-8?B?Zm11d0JzdkxzZnBaNHZNNDBaQ1Q0VE1HU3dmSURLV091QktjTmRsK1dxTUFp?=
 =?utf-8?B?aDdrYS92TlBiUGllU1VmSkVWQTYyMHJlV1NOQlJBMmltYVAwZjlBNW1lWVFk?=
 =?utf-8?B?cmFOWUNrZFF3bHRtRE5INVBWN2hwUDEybHlFVWdURGNoRnMzTEk0eExwTHRv?=
 =?utf-8?B?RXVZaXE5R3VyUWhuTDlMYTVKTkErM0R1djBnOGZpNXh0Z2lJM2FRcDZ6Q1FH?=
 =?utf-8?B?emk0ZTB3ZjNDSlZuVlZjTHNaWUN1TUw5cTRZNzdqd1Vvd2tRcVNHTmg4Vm1C?=
 =?utf-8?B?UE5QY2ltT3hpYnY4K1l4RElnczQ5c2w0RHo3bTBwVjVVMm9jNmRXOXR6eWJH?=
 =?utf-8?B?OVo1WG44bHBYNU9CWnJycWhvZUNqMnZxV29oK1ZZWFhHaUMzSkFjekNHZFF0?=
 =?utf-8?B?WjdBKzV3ZHAxTDZ0RkpUUnZ3ZTZIREszWGhid1ZtZ1A3MEp5b2k5NWZuWlgw?=
 =?utf-8?B?aTdyc1BJZmtRYnVwZG15Ky9XT3dXVHdqNXBKeHhRaEkvdkcvQmJGL2ZwQVB5?=
 =?utf-8?B?cEdBRklKb0V5SjBwbkwrbGd5TWF3ckovdHg0cUhNRk9SWWlxY1RTM0FlMjV6?=
 =?utf-8?B?K0pscjFycEcxRW43ZXlKU3FwSWh0WkF0QXd6a282VEQ1MzlKOFhmdmVnUklK?=
 =?utf-8?B?cXphckJUWjQwZ0N6UG96c0EzZ2JidHZvbjFsL1hlN2lOUHU1bGVmUnovaENr?=
 =?utf-8?B?Sk5hRVdrUnVVdndITGFwdXRuaVZBQTV1NjVrSFQvZmNKSmZ1RXJQVUpKRzRR?=
 =?utf-8?B?K1prQng1S0FUbktUVUcwRFVUd2NQNHFaUVJKc2FTNTJpc2VVdVJYeXhCUTBi?=
 =?utf-8?B?bm5MWXQ4RUJlVlY2KzBvMXFNajN0UGxHMS9KV0dhWVZkaHdDSVljdE5PWnFy?=
 =?utf-8?B?RDh5cTZDYTdhbnM4ZkE0TkRwSEw2V1M0S05zNDhjTW85Mnd4VG5VV2p5U3Qz?=
 =?utf-8?B?eWJ2ZDVFNlUrM2YraTVJOTlZRGxvVGM3YXJWUHVwL24yWTAwNWJQOWZWakJ2?=
 =?utf-8?B?NlkzQ3ZKNVgvNjRmczdBREllOVMzTkJkUllDb3BOWmNLcSthdjhqNGZoMmFv?=
 =?utf-8?B?MXI2UWNLYklZU0pjVExVZlh1OXVNRGZFR1Q2WFdIVnlnMGZHT1ZNbTllMzRz?=
 =?utf-8?B?QnpneWJDNjhCaklTZUsyZk1Wam9jVHBNdXlzbnZjdHhoc1daUGNFWUJrdlU1?=
 =?utf-8?B?MWZ5Y3M2MkhsUHR5Z2NTRU1WU3Z0VG5DVyt2SU5td0p1U0pOWVI0bzE1TFIw?=
 =?utf-8?B?MkVGajZ1S0Z1WDNWOUxONENwT0NJTVJoQUFDc21IVDVuSm1vSW93akdFYUlm?=
 =?utf-8?B?SFFHRUVucVRpQVJJSUtzUStHWkxTTGtxQXliWGNsYWhmMnJvZGRKZVJndFB0?=
 =?utf-8?B?VHl1VUphbEU3TlpCUFJVeHU0T3lZRmhGWWQ0R1hsWWEvZ1VHYlBaWlV2U1NV?=
 =?utf-8?B?YVZuVURld24rUGMzOG9qc1g5V1JsZmROTGlLektiN0hGQmJjOFZYVWJZeXUx?=
 =?utf-8?B?OWdzbjNVd1B2ek1wdEJMbEVUcFZzSDZ3SFFsU28wMW1FSlROSndUUHVaMjNL?=
 =?utf-8?B?dkZkWUZxMmFsaTU0K3VpUmZRdlczNGxiYS9lUkM3ZWRqSU1FZmJnSnQyejl6?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca48441f-8614-464c-f2bc-08de17f36137
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:32:01.2960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fj7U174a55VKmnc4Bn04ky1oiuEhk0eW5fu2oLDcldT+51IhATI0RalccRCAod+Jha4H/QHFY0X//AlnfK5E0auVH+WlQV3a4/tyVDiFNM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
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

Hi,

This is a third round of patches introducing support for Xe SR-IOV VF
migration.
Thanks for all the review feedback.
On VFIO side, the biggest changes are related to addition of
state_mutex, pci_iov_get_pf_drvdata usage and PCI driver match (where
we're now using specific device ids).
There's also interface change - PF struct xe_device is now used across
the entire API between xe-vfio-pci and xe (excluding the wrapper around
pci_iov_get_pf_drvdata).
On Xe side, the biggest changes are related to PF control state machine,
where SAVE and RESTORE states are now symmetric and individual
resource handling is now tracked outside of control state machine.

Full changelog can be found below.

Cover letter from the previous revision:

Xe is a DRM driver supporting Intel GPUs and for SR-IOV capable
devices, it enables the creation of SR-IOV VFs.
This series adds xe-vfio-pci driver variant that interacts with Xe
driver to control VF device state and read/write migration data,
allowing it to extend regular vfio-pci functionality with VFIO migration
capability.
The driver doesn't expose PRE_COPY support, as currently supported
hardware lacks the capability to track dirty pages.

While Xe driver already had the capability to manage VF device state,
management of migration data was something that needed to be implemented
and constitutes the majority of the series.

The migration data is processed asynchronously by the Xe driver, and is
organized into multiple migration data packet types representing the
hardware interfaces of the device (GGTT / MMIO / GuC FW / VRAM).
Since the VRAM can potentially be larger than available system memory,
it is copied in multiple chunks. The metadata needed for migration
compatibility decisions is added as part of descriptor packet (currently
limited to PCI device ID / revision).
Xe driver abstracts away the internals of packet processing and takes
care of tracking the position within individual packets.
The API exported to VFIO is similar to API exported by VFIO to
userspace, a simple .read()/.write().

Note that some of the VF resources are not virtualized (e.g. GGTT - the
GFX device global virtual address space). This means that the VF driver
needs to be aware that migration has occurred in order to properly
relocate (patching or reemiting data that contains references to GGTT
addresses) before resuming operation.
The code to handle that is already present in upstream Linux and in
production VF drivers for other OSes.

Links to previous revisions for reference.
v1:
https://lore.kernel.org/lkml/20251011193847.1836454-1-michal.winiarski@intel.com/
v2:
https://lore.kernel.org/lkml/20251021224133.577765-1-michal.winiarski@intel.com/

v2 -> v3:
* Bind xe-vfio-pci to specific devices instead of using vendor and
  class (Christoph Hellwig / Jason Gunthorpe)
* Don't refer to the driver as "vendor specific" (Christoph)
* Use pci_iov_get_pf_drvdata and change the interface to take xe_device
  (Jason)
* Update the RUNNING_P2P comment (Jason / Kevin Tian)
* Add state_mutex to protect device state transitions (Kevin)
* Implement .error_detected (Kevin)
* Drop redundant comments (Kevin)
* Explain 1-based indexing and wait_flr_done (Kevin)
* Add a missing get_file() (Kevin)
* Drop redundant state transitions when p2p is supported (Kevin)
* Update run/stop naming to match other drivers (Kevin)
* Fix error state handling (Kevin)
* Fix SAVE state diagram rendering (Michał Wajdeczko)
* Control state machine flipping PROCESS / WAIT logic (Michał Wajdeczko)
* Drop GUC / GGTT / MMIO / VRAM from SAVE control state machine
* Use devm instead of drmm for migration-related allocations (Michał)
* Use GGTT node for size calculations (Michał)
* Use mutex guards consistently (Michał)
* Fix build break on 32-bit (lkp)
* Kernel-doc updates (Michał)
* And other, more minor changes

v1 -> v2:
* Do not require debug flag to support migration on PTL/BMG
* Fix PCI class match on VFIO side
* Reorganized PF Control state machine (Michał Wajdeczko)
* Kerneldoc tidying (Michał Wajdeczko)
* Return NULL instead of -ENODATA for produce/consume (Michał Wajdeczko)
* guc_buf s/sync/sync_read (Matt Brost)
* Squash patch 03 (Matt Brost)
* Assert on PM ref instead of taking it (Matt Brost)
* Remove CCS completely (Matt Brost)
* Return ptr on guc_buf_sync_read (Michał Wajdeczko)
* Define default guc_buf size (Michał Wajdeczko)
* Drop CONFIG_PCI_IOV=n stubs where not needed (Michał Wajdeczko)
* And other, more minor changes

Lukasz Laguna (2):
  drm/xe/pf: Add helper to retrieve VF's LMEM object
  drm/xe/migrate: Add function to copy of VRAM data in chunks

Michał Winiarski (26):
  drm/xe/pf: Remove GuC version check for migration support
  drm/xe: Move migration support to device-level struct
  drm/xe/pf: Convert control state to bitmap
  drm/xe/pf: Add save/restore control state stubs and connect to debugfs
  drm/xe/pf: Add data structures and handlers for migration rings
  drm/xe/pf: Add helpers for migration data allocation / free
  drm/xe/pf: Add support for encap/decap of bitstream to/from packet
  drm/xe/pf: Add minimalistic migration descriptor
  drm/xe/pf: Expose VF migration data size over debugfs
  drm/xe: Add sa/guc_buf_cache sync interface
  drm/xe: Allow the caller to pass guc_buf_cache size
  drm/xe/pf: Increase PF GuC Buffer Cache size and use it for VF
    migration
  drm/xe/pf: Remove GuC migration data save/restore from GT debugfs
  drm/xe/pf: Don't save GuC VF migration data on pause
  drm/xe/pf: Switch VF migration GuC save/restore to struct migration
    data
  drm/xe/pf: Handle GuC migration data as part of PF control
  drm/xe/pf: Add helpers for VF GGTT migration data handling
  drm/xe/pf: Handle GGTT migration data as part of PF control
  drm/xe/pf: Handle MMIO migration data as part of PF control
  drm/xe/pf: Handle VRAM migration data as part of PF control
  drm/xe/pf: Add wait helper for VF FLR
  drm/xe/pf: Enable SR-IOV VF migration
  drm/xe/pci: Introduce a helper to allow VF access to PF xe_device
  drm/xe/pf: Export helpers for VFIO
  drm/intel/pciids: Add match with VFIO override
  vfio/xe: Add device specific vfio_pci driver variant for Intel
    graphics

 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/xe/Makefile                   |   4 +
 drivers/gpu/drm/xe/xe_ggtt.c                  | 104 ++
 drivers/gpu/drm/xe/xe_ggtt.h                  |   4 +
 drivers/gpu/drm/xe/xe_ggtt_types.h            |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h           |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  78 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |   6 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 599 ++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   8 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  33 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  47 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 985 ++++++++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  50 +-
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  34 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   5 +-
 drivers/gpu/drm/xe/xe_guc.c                   |  12 +-
 drivers/gpu/drm/xe/xe_guc_buf.c               |  57 +-
 drivers/gpu/drm/xe/xe_guc_buf.h               |   2 +
 drivers/gpu/drm/xe/xe_migrate.c               | 128 ++-
 drivers/gpu/drm/xe/xe_migrate.h               |   8 +
 drivers/gpu/drm/xe/xe_pci.c                   |  17 +
 drivers/gpu/drm/xe/xe_pci.h                   |   3 +
 drivers/gpu/drm/xe/xe_sa.c                    |  21 +
 drivers/gpu/drm/xe/xe_sa.h                    |   1 +
 drivers/gpu/drm/xe/xe_sriov_migration_data.c  | 550 ++++++++++
 drivers/gpu/drm/xe/xe_sriov_migration_data.h  |  37 +
 drivers/gpu/drm/xe/xe_sriov_pf.c              |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      | 128 +++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h      |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 102 ++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 275 +++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  24 +
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  67 ++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |   9 +
 drivers/gpu/drm/xe/xe_sriov_vfio.c            | 248 +++++
 drivers/vfio/pci/Kconfig                      |   2 +
 drivers/vfio/pci/Makefile                     |   2 +
 drivers/vfio/pci/xe/Kconfig                   |  12 +
 drivers/vfio/pci/xe/Makefile                  |   3 +
 drivers/vfio/pci/xe/main.c                    | 552 ++++++++++
 include/drm/intel/pciids.h                    |   7 +
 include/drm/intel/xe_sriov_vfio.h             |  30 +
 43 files changed, 3948 insertions(+), 327 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_migration_data.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_migration_data.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
 create mode 100644 drivers/vfio/pci/xe/Kconfig
 create mode 100644 drivers/vfio/pci/xe/Makefile
 create mode 100644 drivers/vfio/pci/xe/main.c
 create mode 100644 include/drm/intel/xe_sriov_vfio.h

-- 
2.50.1


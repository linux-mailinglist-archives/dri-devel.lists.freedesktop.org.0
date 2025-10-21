Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AB2BF4254
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 02:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9690F10E54D;
	Tue, 21 Oct 2025 00:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AwemTQZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EE210E566;
 Tue, 21 Oct 2025 00:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761006415; x=1792542415;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FRzp2M1+LuOOOAv959F074AgCJAYh6xpmmTP2LcXM/E=;
 b=AwemTQZb4mdl0cUfrynXYTASMf8xXMz6hPjK0bMnHbfroCQSiR+x/qvU
 G10OQ9JInI3+obq+T3SGC791+8G3wkPVYWZqWjTOfDGk/AXoS5xAbm558
 BNsMrBwYSJD5sdtJDY/8Fq+W7GxIq32jBeKk8bbQu+Klh1X/9qJxbofwj
 7fQ212j7HQpxgZkAbAeeAWB1iMHkFKrVnhdp4jeAsMcwuetE5LUiBqx3W
 IRLOBzkNGmHojWR1Zy0zMQlIAda5VuXrt81ToGk/ZU3KbJ261wDpti+X1
 y+TlLpLV23Tdg+MLm3KzSLtkfz93r6o1VhRMxBB/NuYcTZQbeIO1lSNfh w==;
X-CSE-ConnectionGUID: 6LvlibJ4TRSKErFtrPg7rQ==
X-CSE-MsgGUID: 1wZUaaLSQZSfx0pDR2/R8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80755236"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="80755236"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:26:54 -0700
X-CSE-ConnectionGUID: RAhUVZtWQ5WPEWefty7VWA==
X-CSE-MsgGUID: N0ujKqCpQ7SRcZSxFGE3ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183939283"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:26:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:26:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 17:26:52 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:26:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNYmdC7azbuvq14+TsUKX+FnypJlehbXFqxahLeVOGYyhHL7ew3nW67yPBCNt1q5R8McEwuztIgusfAX36PZm+3CvAyJGR2ZdCFI7HgWf0B+dhkOqC7URrQ9SHcgrZnOin4uKeVeCN1H0MsVZJuikICF0sy2Oo0lqecwi95da9CcSW4xaeeut//nM733CjSNSmu0lF38PlHaisRYyVgilYv1C7IFFHIjrLxadXOqvuwK/F4FE28jUj5ggHU9F9Vm0/u9ZYGDZrtBxgRotMK7T/GYnlRDSjYDCKN1ksyCT8lLeWJFy4BPpKSfGlftV7EWOXUKcHIA74uPqSETS6dqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbZpxil4k8ciwuqfjTFQ+V8HkMqhMNhhTo8RxuVIgSc=;
 b=d3Qqoaqmy6EmIayA2q6prKLyqr/eKWyGAEwhgX5rV0UAv3PPadBDD1fElfJ0QtWvgHa5ZbPeH1QYIs0l+2d6pyiOEe/gHI0ZXPG3XQD5IH2EdN7n92bl1WRxqjZZ/MeW9HfNVYOMj9MA6UuYn5H/ef+k2xIpcVQRFfdX+aI8E6BmLMEcHgTfZH6Z9x5b9WrPIdUlB4qxO3iHEQ5qfc0Pe4mfVP0cOfo1Huv7v8RpyqN09d4glCC2E0yDOqZJ51evyOoo8MizQYkXmfDlOsYXAGUlZVAOIQExkTMIs2XOc9AOsj8j5NMN/itbg9i3jrrGeDOOhmdKAgZ7JQtOKR43uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM6PR11MB4707.namprd11.prod.outlook.com (2603:10b6:5:2a6::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Tue, 21 Oct 2025 00:26:49 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 00:26:49 +0000
Date: Tue, 21 Oct 2025 02:26:46 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 06/26] drm/xe/pf: Add helpers for migration data
 allocation / free
Message-ID: <nlwa6nyfdgracgqgtfvas6x27lrxlmg676nrhgc6j3g7zux775@arerdzyst436>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-7-michal.winiarski@intel.com>
 <aOv9jIA27B3kJt0L@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOv9jIA27B3kJt0L@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BE1P281CA0263.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM6PR11MB4707:EE_
X-MS-Office365-Filtering-Correlation-Id: c8322a26-540b-49d7-a653-08de1038868d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGRhbE9BeEJBUGRUWG1oMU41Qzh1Zndoc0VrdmNVN0VjUG9GRDhtd0R2KzA5?=
 =?utf-8?B?VDZEc3hyQUh5STZYRllKYnNQeTQ3ZWFueFhGc1dlWFBNSnltTHpGUW5CN2Fj?=
 =?utf-8?B?V2lYMXV0T09xVnZDYjFIUFVob2I0STRxcVRqOUVJNU8vQVRnUUl4ajNmVndm?=
 =?utf-8?B?dTYzblNqTTNhRnhmRjRZQXViYWp6ZGZadVREaFlUZkV1YmFJMTNBVmpDK1Fn?=
 =?utf-8?B?UlhpamM0Q3BrZkxzYk1halFpSXo4WXlQeVcvdDN6QU10Q09mNjF2eWhCRzhG?=
 =?utf-8?B?cnRBKzVHK2IxZzRiM3NIdzdvWGN4bVJsbGNyRkliZmNwdUlWNHBQTWZTZmlJ?=
 =?utf-8?B?cm1XMktYZGFJa1BmejJjdEtDb1RSNW9RTXZtL3o2elUwT2F4TW9KRVFEcVVl?=
 =?utf-8?B?ZXQ0QTVtQzFZMVQvTmR3MHUwcEZyNXQ2NmxUa2M2bnBOUVV3T2loR0VKbDNq?=
 =?utf-8?B?NTNKcHlFUjd3ZVJQVG80ekd6NHh3a045OEE4eFBXN3RQVllZSHRDd2FmVzd4?=
 =?utf-8?B?bUhaUDR2aEM1MEFPRGFERnBHWllUWjZreWlHZkFpUStqOVMxVzNEc2EwTFdp?=
 =?utf-8?B?ajdWazg4MEkxQUJKbnFJV0lJejVqdnZSK3h2c3RNUlZrWXZRS3pMUytwaWJl?=
 =?utf-8?B?a1VRaTkxSVN2ZVkvMCtCZ2kzUmJRN3BiVHNYUlQ0eG00Vk0xYmRwc0h1bVFO?=
 =?utf-8?B?R3RLWkpSbWJFTzcraDIxTnh0SUJoNVlBRStKR2g4NG9jNG9mTUdoWWlsd1p4?=
 =?utf-8?B?a0RhQW9ub3pmL0N6UGJPdGQ0OTJGaERheThpNlhmeE9VYVlIYUNlY3Z6MUgr?=
 =?utf-8?B?VWNRa01GcFVWV1NMcDNQaWE0bVBFNzNqOUx4bDRBTXlzMXRHaC82ZnlaWjd0?=
 =?utf-8?B?dncxeHBNdVQzRUd2d0tZelo1TnMyWVZ0ZlhWRHlOOTdXWXNGdW5SQUw4SVFR?=
 =?utf-8?B?cFpSNWtWTlB5dk9jUjhzcmQ2UWEyMm1HL2RjamsvRUJVNGVEVUNrY1VoamxM?=
 =?utf-8?B?MWMxNEMyWE56SXdhN2pZQTFMYjdPZlBZcEh5Z1NQUTlFRWd1Y3pVOUFBNFpN?=
 =?utf-8?B?cEd2YzE0Sm5uY09XeTladEJFRFd3Ny8zT2U2Y0dtVTFWZlAyTjBoK1BvcFlS?=
 =?utf-8?B?VFA0R0ozRXNyM21zeGU4ZXpiYnEvOXpGZ3BLSkdvR25Ra2lXOUVuN2huYzhs?=
 =?utf-8?B?RXpCV2RmNXJ6M0lwTDdlN1BrUzlIVVZ2T3BRRVVHU0tET0kyUnFCcXptbW5s?=
 =?utf-8?B?NmlmMVpmODRzbk5haGgyVTNSem5rRjhLL2N1blNUcU1sdHFJM0JuOU1zbWQw?=
 =?utf-8?B?VkFaNE5md1FZUzV2SUU3VEhMcnFOYjZkLzJJNGZsV0NQSDNzb3IvYVFveVlv?=
 =?utf-8?B?ZE9zM2pqYmxXVW11WnFkMnp0bmpwNlYvdXBxSnRVUXRydCsveHZmKzQxWk9W?=
 =?utf-8?B?YzdYbDlSSTVpWUpzc3Q0SjdxMlBNdU5QQzVQN2NmMVI1bGdXa3JqR0tsZW1J?=
 =?utf-8?B?Zlp0R1FsVXZYZzRJNjFDTG9CbjVjdGJmOE9BdUlSNFFwUEFHeGZQaTRiZDRO?=
 =?utf-8?B?cHFuN1JHcEx0eEZnYVhxay9IK1JMVGxuLy9oVXFaazRLcEJ4TzQ4UDJMOEpi?=
 =?utf-8?B?YXZreWk4T21sOFI3ejRHV0dNUytYajlSVnZmV1FuTThJQjZJNUE4MEJTdWZ5?=
 =?utf-8?B?b0JOUjZuckJVMXpkR0MrdmgwQncwSGdjVjQ5VlJ1MGJNeHhFT3c0Mzc1TW1G?=
 =?utf-8?B?NW10aDFBVE9lU0VWay9ray9sTGFiTXd3ZHF1bFNYVmNTc0U2VjJ3ZmkvTVMz?=
 =?utf-8?B?M0s2ODAvRFBackRqSEY3LzNNZ1JNRWt4TUtWcDhNWEhUbnp5NHkxWXJaS1p5?=
 =?utf-8?B?RTlWY05sUXVkS2MreFZZMjF5b0RQUC9VUWd4bEJwQ2JNUElEVFJkZGM3dU85?=
 =?utf-8?Q?0JZCRq6ZjYHXmg+nAc71qbEndPJv6zw7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3JjREkxN0FoQUJKc2xPMzlsc1BtcXd5ZTZJS0UvY2pIcVB0aHRrTDVOcEFF?=
 =?utf-8?B?eVBZTndPV2xwVTlNamh3Y3hxMDE1VVpGS2FkbER2VFJRTE5VZ2tUUzRzb2x1?=
 =?utf-8?B?Z3NWQjR1S2RCWVRsdTdKVnEwSHVWblp3OU9tTDBtOEtKYnBBUVhMYXM5QzBj?=
 =?utf-8?B?NW5JL2dwb2ZmTVAvK0lLdmZOUUtWRkwyazFMN3U0TVNsQlozTGlNeVQ1WHNx?=
 =?utf-8?B?RDBCVms1OGtmRkNRWHRzSWZUcHhHNkVlQTBIMFdoTTVtZ2lmNzFQeGVhZzJq?=
 =?utf-8?B?dnVDaHEreFpwQUlITUwyUjVBNEp5eW8zRUp5dUVFTG1jRTVMMGk2WlIzbmVz?=
 =?utf-8?B?WTV6Um5FRkZtb1ZQcGRSZ0JrVVZCWTYyU3IyVkhsOFp2d2hXcjZ1ZGhSNWdy?=
 =?utf-8?B?OUU3bXNTKzl5R2VqRjJPeTMxUUd3ZGVIQ2o1OXNFc1ZQdGx0eHlsMTlKYzR3?=
 =?utf-8?B?RkFTQm9TY1ZUTk1XK1paVjE3TTNMM0REWEdqVU9iUlRzcDNpWGpyaWg2SDBJ?=
 =?utf-8?B?eGZMNFJDa2daYVVRcDBOcFpXSW0vNkJjekQzOUNKWW50aU12VVYwVG56amMv?=
 =?utf-8?B?dTJZV2ZKV0d6TWxsdVhYUWROdEhQOE55b2NKYXJ6Tit2VXo3UnZoUmNKS0xP?=
 =?utf-8?B?c2ZhWDd6YUdVVXE4Mm5NS0pEcFlZSkg0N0kxZ0VUQllWT0ZaZUIwdzdMalJO?=
 =?utf-8?B?WE5oakV4S2QyOFR1ZG41eTJvOFJGbVpDdVBZejl1MDYzM0c1K2ZIeUNSNjNv?=
 =?utf-8?B?bjFweVY1QlJQb3lkbG1xZHl5SGc5SjEvUy93dUxKTWFvL1pPemRNREluKy9Q?=
 =?utf-8?B?YnA2bU1oRTZpNEY4eDVGL1NpcG1jRC9xRGVkaHhXN3liOG1VZDJxNjIrYkx6?=
 =?utf-8?B?NWJpaE9RTXdWQnNydjlMZHB4M1pUMlFReDBya0VaeDQzMmEwK0tFT21neGlw?=
 =?utf-8?B?aUZpK2RibTltQWFHb001aGRMTWY0Wm13NTB5NlQvdEdQSXpTNVF4NHI4eXgr?=
 =?utf-8?B?QXF1TXZtcE0raG4xYU5jUTBycnorQ1ZTbWNFc1Z4Z2VYOHdZS0J0ckRLeVRM?=
 =?utf-8?B?Y0crQkcrd3A0RWl6UjdqeitZV1pFTlJjQTNSRHdNa1VZZ3FEeWpkdXl4RE5x?=
 =?utf-8?B?c0NveFV1NE1NdFRWZG9TeVFnMzFRNC9TenlJeGUrL2c3RFBSZndkY2xRY0ZU?=
 =?utf-8?B?bzVhQzBvYjc3NWN2SXpCRktiejhuUEFSWFBxWUdMOXA4MVZUOVRhZHNwMEdK?=
 =?utf-8?B?VTNCeFRYcTgrM1l1RlB6REpPUTgrS1hsV0plbjZTeXBTWlUzN0E4bWF2TU91?=
 =?utf-8?B?QUREREIwQnVxVTR1NGhYT0wxa2ozTGpvOWhIcVRiTTJMYmNlVzJGK3hWR2pt?=
 =?utf-8?B?UlQ1N2hoTWRGNEQrY1hlY1F6SGoyeWZrTklNdThMYS9tc3VTZjUwdnFYQS8y?=
 =?utf-8?B?M2x1dTZxQjUrMzdHbk5LQWRvbTUrRFV4Smpva3RkYjRwT0Y3YXJLUG9qa0pS?=
 =?utf-8?B?dHp6ZEhwa3JzTFhZMWR6YVAvR0dyNWIvK2VGZmJNTjdZTTZHYnRtT3IyMllM?=
 =?utf-8?B?RkVkdTZudDk1eVNoMXhtV1NhK0xxcHpDUXFuNDRFcGk0RnBWbEJtTWxycUFt?=
 =?utf-8?B?TURlUUkxMGYxN29tR1Znd0laSnNaWC92c3paUVlBY0VQcExYWnlqM2x5MThw?=
 =?utf-8?B?UUFHemRGc2JSZm55OEdhVk0ydEpmaTJWYWs1aWszeldwQXFZcCsyaVFzWG5y?=
 =?utf-8?B?N1doTG5VMVE1NndDMkpudkpIclBlbmhSa0lUem10L0ZqQXZVS1FTRU5YUUtW?=
 =?utf-8?B?NUF6V2NXKzBUbmJ5c3BFbXl0MytZWnFHNzJXL0lwVFI5OGtjbnZ1bDhwaTZM?=
 =?utf-8?B?SGY3dWRaT28xL3FWU09LNTFnTXlsUDZJckI5c0JwK3ZJdVJ5clFOMHlhL1ZZ?=
 =?utf-8?B?dlJGMTU3TGd5Y3VQWmZVdGtQdW4yVGNFck1PVXZEcXZFa3FzMG9OWkVqOGNy?=
 =?utf-8?B?SnFyVC92YmxyNG93U01iOHJRNXlBd0NnWEZsNnhmYThHamdLZWNXRXdjS3Na?=
 =?utf-8?B?eDJmT2w1UTI1andHTUN3Rjg3djNsS05FbG1XYzYvZ3JxR0tqMzh3TTBFY2Ex?=
 =?utf-8?B?TFp4aUduRjRzMDFXVC9iLzRXbjdQbGNJU0d2Rml6WHJkbXgyaTVXMCs5WTJZ?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8322a26-540b-49d7-a653-08de1038868d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 00:26:49.7938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fIwMeW28NSSULMphHYXfbwDE1+SM+7L3Ar/NR2wDnowpmP+HjS6c0hA2bt+PfxTuaG+wgFhqgD21tAbgIwCMRrOFUzFHlQkt3t7dOQ0o22Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4707
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

On Sun, Oct 12, 2025 at 12:12:12PM -0700, Matthew Brost wrote:
> On Sat, Oct 11, 2025 at 09:38:27PM +0200, Michał Winiarski wrote:
> > Now that it's possible to free the packets - connect the restore
> > handling logic with the ring.
> > The helpers will also be used in upcoming changes that will start producing
> > migration data packets.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile                   |   1 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  48 ++++++-
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  10 +-
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |   1 +
> >  .../gpu/drm/xe/xe_sriov_pf_migration_data.c   | 135 ++++++++++++++++++
> >  .../gpu/drm/xe/xe_sriov_pf_migration_data.h   |  32 +++++
> >  6 files changed, 224 insertions(+), 3 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 71f685a315dca..e253d65366de4 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -177,6 +177,7 @@ xe-$(CONFIG_PCI_IOV) += \
> >  	xe_sriov_pf_control.o \
> >  	xe_sriov_pf_debugfs.o \
> >  	xe_sriov_pf_migration.o \
> > +	xe_sriov_pf_migration_data.o \
> >  	xe_sriov_pf_service.o \
> >  	xe_tile_sriov_pf_debugfs.o
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index 16a88e7599f6d..04a4e92133c2e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -20,6 +20,7 @@
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_pf_control.h"
> >  #include "xe_sriov_pf_migration.h"
> > +#include "xe_sriov_pf_migration_data.h"
> >  #include "xe_sriov_pf_service.h"
> >  #include "xe_tile.h"
> >  
> > @@ -949,14 +950,57 @@ static void pf_exit_vf_restored(struct xe_gt *gt, unsigned int vfid)
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
> >  }
> >  
> > +static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
> > +	pf_exit_vf_wip(gt, vfid);
> > +}
> > +
> > +static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid,
> > +				     struct xe_sriov_pf_migration_data *data)
> > +{
> > +	switch (data->type) {
> > +	default:
> > +		xe_gt_sriov_notice(gt, "Skipping VF%u invalid data type: %d\n", vfid, data->type);
> > +		pf_enter_vf_restore_failed(gt, vfid);
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> >  static bool pf_handle_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> > +	struct xe_sriov_pf_migration_data *data;
> > +	int ret;
> > +
> >  	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
> >  		return false;
> >  
> > -	pf_exit_vf_restore_wip(gt, vfid);
> > -	pf_enter_vf_restored(gt, vfid);
> > +	data = xe_gt_sriov_pf_migration_ring_consume(gt, vfid);
> > +	if (IS_ERR(data)) {
> > +		if (PTR_ERR(data) == -ENODATA &&
> > +		    !xe_gt_sriov_pf_control_check_vf_data_wip(gt, vfid)) {
> > +			pf_exit_vf_restore_wip(gt, vfid);
> > +			pf_enter_vf_restored(gt, vfid);
> > +		} else {
> > +			pf_enter_vf_restore_failed(gt, vfid);
> > +		}
> > +		return false;
> > +	}
> > +
> > +	xe_gt_assert(gt, gt->info.id == data->gt);
> > +	xe_gt_assert(gt, gt->tile->id == data->tile);
> > +
> > +	ret = pf_handle_vf_restore_data(gt, vfid, data);
> > +	if (ret) {
> > +		xe_gt_sriov_err(gt, "VF%u failed to restore data type: %d (%d)\n",
> > +				vfid, data->type, ret);
> > +		xe_sriov_pf_migration_data_free(data);
> > +		pf_enter_vf_restore_failed(gt, vfid);
> > +		return false;
> > +	}
> >  
> > +	xe_sriov_pf_migration_data_free(data);
> >  	return true;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index af5952f42fff1..582aaf062cbd4 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -15,6 +15,7 @@
> >  #include "xe_guc_ct.h"
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_pf_migration.h"
> > +#include "xe_sriov_pf_migration_data.h"
> >  
> >  #define XE_GT_SRIOV_PF_MIGRATION_RING_TIMEOUT (HZ * 20)
> >  #define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
> > @@ -523,11 +524,18 @@ xe_gt_sriov_pf_migration_ring_consume_nowait(struct xe_gt *gt, unsigned int vfid
> >  	return ERR_PTR(-EAGAIN);
> >  }
> >  
> > +static void pf_mig_data_destroy(void *ptr)
> > +{
> > +	struct xe_sriov_pf_migration_data *data = ptr;
> > +
> > +	xe_sriov_pf_migration_data_free(data);
> > +}
> > +
> >  static void pf_gt_migration_cleanup(struct drm_device *dev, void *arg)
> >  {
> >  	struct xe_gt_sriov_pf_migration *migration = arg;
> >  
> > -	ptr_ring_cleanup(&migration->ring, NULL);
> > +	ptr_ring_cleanup(&migration->ring, pf_mig_data_destroy);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > index 347682f29a03c..d39cee66589b5 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > @@ -12,6 +12,7 @@
> >  #include "xe_pm.h"
> >  #include "xe_sriov_pf_helpers.h"
> >  #include "xe_sriov_pf_migration.h"
> > +#include "xe_sriov_pf_migration_data.h"
> >  #include "xe_sriov_printk.h"
> >  
> >  static struct xe_sriov_pf_migration *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> > new file mode 100644
> > index 0000000000000..cfc6b512c6674
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> > @@ -0,0 +1,135 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include "xe_bo.h"
> > +#include "xe_device.h"
> > +#include "xe_sriov_pf_migration_data.h"
> > +
> > +static bool data_needs_bo(struct xe_sriov_pf_migration_data *data)
> > +{
> > +	unsigned int type = data->type;
> > +
> > +	return type == XE_SRIOV_MIG_DATA_CCS ||
> > +	       type == XE_SRIOV_MIG_DATA_VRAM;
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_data_alloc() - Allocate migration data packet
> > + * @xe: the &struct xe_device
> > + *
> > + * Only allocates the "outer" structure, without initializing the migration
> > + * data backing storage.
> > + *
> > + * Return: Pointer to &struct xe_sriov_pf_migration_data on success,
> > + *         NULL in case of error.
> > + */
> > +struct xe_sriov_pf_migration_data *
> > +xe_sriov_pf_migration_data_alloc(struct xe_device *xe)
> > +{
> > +	struct xe_sriov_pf_migration_data *data;
> > +
> > +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return NULL;
> > +
> > +	data->xe = xe;
> > +	data->hdr_remaining = sizeof(data->hdr);
> > +
> > +	return data;
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_data_free() - Free migration data packet
> > + * @data: the &struct xe_sriov_pf_migration_data packet
> > + */
> > +void xe_sriov_pf_migration_data_free(struct xe_sriov_pf_migration_data *data)
> > +{
> > +	if (data_needs_bo(data)) {
> > +		if (data->bo)
> > +			xe_bo_unpin_map_no_vm(data->bo);
> > +	} else {
> > +		if (data->buff)
> > +			kvfree(data->buff);
> > +	}
> > +
> > +	kfree(data);
> > +}
> > +
> > +static int mig_data_init(struct xe_sriov_pf_migration_data *data)
> > +{
> > +	struct xe_gt *gt = xe_device_get_gt(data->xe, data->gt);
> > +
> > +	if (!gt || data->tile != gt->tile->id)
> > +		return -EINVAL;
> > +
> > +	if (data->size == 0)
> > +		return 0;
> > +
> > +	if (data_needs_bo(data)) {
> > +		struct xe_bo *bo = xe_bo_create_pin_map_novm(data->xe, gt->tile,
> > +							     PAGE_ALIGN(data->size),
> > +							     ttm_bo_type_kernel,
> > +							     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED,
> > +							     false);
> > +		if (IS_ERR(bo))
> > +			return PTR_ERR(bo);
> > +
> > +		data->bo = bo;
> > +		data->vaddr = bo->vmap.vaddr;
> > +	} else {
> > +		void *buff = kvzalloc(data->size, GFP_KERNEL);
> > +		if (!buff)
> > +			return -ENOMEM;
> > +
> > +		data->buff = buff;
> > +		data->vaddr = buff;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_data_init() - Initialize the migration data header and backing storage
> > + * @data: the &struct xe_sriov_pf_migration_data packet
> > + * @tile_id: tile identifier
> > + * @gt_id: GT identifier
> > + * @type: &enum xe_sriov_pf_migration_data_type
> > + * @offset: offset of data packet payload (within wider resource)
> > + * @size: size of data packet payload
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_pf_migration_data_init(struct xe_sriov_pf_migration_data *data, u8 tile_id, u8 gt_id,
> > +				    unsigned int type, loff_t offset, size_t size)
> > +{
> > +	xe_assert(data->xe, type < XE_SRIOV_MIG_DATA_MAX);
> > +	data->version = 1;
> > +	data->type = type;
> > +	data->tile = tile_id;
> > +	data->gt = gt_id;
> > +	data->offset = offset;
> > +	data->size = size;
> > +	data->remaining = size;
> > +
> > +	return mig_data_init(data);
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_data_init() - Initialize the migration data backing storage based on header
> > + * @data: the &struct xe_sriov_pf_migration_data packet
> > + *
> > + * Header data is expected to be filled prior to calling this function
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_pf_migration_data_init_from_hdr(struct xe_sriov_pf_migration_data *data)
> > +{
> > +	if (WARN_ON(data->hdr_remaining))
> > +		return -EINVAL;
> > +
> > +	data->remaining = data->size;
> > +
> > +	return mig_data_init(data);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> > new file mode 100644
> > index 0000000000000..1dde4cfcdbc47
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> > @@ -0,0 +1,32 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SRIOV_PF_MIGRATION_DATA_H_
> > +#define _XE_SRIOV_PF_MIGRATION_DATA_H_
> > +
> > +#include <linux/types.h>
> > +
> > +struct xe_device;
> > +
> > +enum xe_sriov_pf_migration_data_type {
> > +	XE_SRIOV_MIG_DATA_DESCRIPTOR = 1,
> > +	XE_SRIOV_MIG_DATA_TRAILER,
> > +	XE_SRIOV_MIG_DATA_GGTT,
> > +	XE_SRIOV_MIG_DATA_MMIO,
> > +	XE_SRIOV_MIG_DATA_GUC,
> > +	XE_SRIOV_MIG_DATA_CCS,
> 
> grep XE_SRIOV_MIG_DATA_CCS  *.c *.h
> xe_sriov_pf_migration_data.c:   return type == XE_SRIOV_MIG_DATA_CCS ||
> xe_sriov_pf_migration_data.h:   XE_SRIOV_MIG_DATA_CCS,
> 
> XE_SRIOV_MIG_DATA_CCS appears to be unused right now, I'd remove this
> data type of now.
> 
> Matt

I'll remove it.

Thanks,
-Michał

> 
> > +	XE_SRIOV_MIG_DATA_VRAM,
> > +	XE_SRIOV_MIG_DATA_MAX,
> > +};
> > +
> > +struct xe_sriov_pf_migration_data *
> > +xe_sriov_pf_migration_data_alloc(struct xe_device *xe);
> > +void xe_sriov_pf_migration_data_free(struct xe_sriov_pf_migration_data *snapshot);
> > +
> > +int xe_sriov_pf_migration_data_init(struct xe_sriov_pf_migration_data *data, u8 tile_id, u8 gt_id,
> > +				    unsigned int type, loff_t offset, size_t size);
> > +int xe_sriov_pf_migration_data_init_from_hdr(struct xe_sriov_pf_migration_data *snapshot);
> > +
> > +#endif
> > -- 
> > 2.50.1
> > 

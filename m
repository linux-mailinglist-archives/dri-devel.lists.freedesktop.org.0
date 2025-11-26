Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991F3C8A6BB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE32210E64A;
	Wed, 26 Nov 2025 14:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XbQLHx0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA10510E649;
 Wed, 26 Nov 2025 14:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764168415; x=1795704415;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VN5w5rFf3mXWHO41R9I4+ot//wY6S9S3DmOW44tAaic=;
 b=XbQLHx0bmfy4JxQ3IijvUjY33Enep0/Ck2E1qc7VCfpG/EbgzINdMMME
 s1jcdWvhpzQjNaNd/J0jH+YHiKuZibm5/EPWunGpv1d8i9nJ6ZRJzPVwK
 roYUtyfy8vEw93Y7XqeXjqw/KsLhgeskn8pqcmJV0WsvEZ3kxZvlik3JC
 BaWqfopwBFW5gks7nVzDZR0AXnYjCv9M+Y/MCdwhYeNsfgTK4uRLBujR+
 uhsNYmSHnq3yhV+uExRoSum86PnZHsP3ZM4QVI2rj8t3HIbjjmO95Tg8h
 Qq/wlOJoWNgKI0FZvD+C9DfmVlC5qp+6kEcmUXj23rybmdAfO+M/T6II+ g==;
X-CSE-ConnectionGUID: R0AB2MtsSrG27uL+g5d7MA==
X-CSE-MsgGUID: tzTTnPYTQQiSGfAdpEVsNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66094778"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="66094778"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:46:55 -0800
X-CSE-ConnectionGUID: snAg7CutQjmgnD7LCfd6RA==
X-CSE-MsgGUID: CGi/aJJARmayKjgerENHqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="193055354"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:46:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 06:46:54 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 06:46:54 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 06:46:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4+gRjsaMb8nqP8bk5yEdpfKLDqi0/mlZ5DPrQQu4S5S+4pjzArlIF5pMK64UVkE35LfktFujE6PzzvVfS/M1ePdeENsaR0mpNpDOjBF6wTxUQNNjj1mSeB1qG+UKxVZdiUTlX+XbzETzcFWzzgOsIpAX3bWwpdju4ccl441dyNTPpU0Vw2Re0TRzNuLeh3zAOk8KYCtbeUSCs+9onrB65WjYG96yQo1HdLmiHtBPsD6Y4Hgct5REJq8GSeDP93uB5P431tMJ2J29ueEGH582Wx4to24GQvAMlDh6PLpnhzQAWGICKG2PfGqYaETljXApsKev+OVJse+/VIqF8e6Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmQteIfLTZLtlgEoY/45qNJnouFfUEUivNLbX+1YUfY=;
 b=cxuRNNLSaG2fqpI/eqT8M5HkMm9g67vHzjNgOKR4xPsApcxCcSunJwRzDD3dUucv5qzuYFo094+Mj86a+pU4ueWi5bvg57+j9vna+xJIgLoJy1MRQPDmN+sTUKmHY+ppIof4Ngd87utUMMC21to9y0J1HM1d/oP41dsegGQQYC9HIYJCTzQHuR8GVRpCizSzO3811z8ij6gIoTQ7ME00UxVpQxViIte4GnKCDroFryWOS03FkzazeaNIE0jppriP/GKqHSAYjaNU/jE37e51+YQKx9D2FnZjfk3BNUmTW1DAp3Z+kwMiRIWL4JBcovZ5HcU61dmxUwjk9YeMJDQjHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5365.namprd11.prod.outlook.com (2603:10b6:208:308::18)
 by DS0PR11MB8020.namprd11.prod.outlook.com (2603:10b6:8:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:46:47 +0000
Received: from BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::9e84:1ac6:7813:4af3]) by BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::9e84:1ac6:7813:4af3%6]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 14:46:47 +0000
Date: Wed, 26 Nov 2025 15:46:43 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, Alex Williamson
 <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas
 <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer Kolothum
 <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v6 0/4] vfio/xe: Add driver variant for Xe VF migration
Message-ID: <nsiqp2nv73cegxwmnqkxw66zfy4efl4k3zxidt23ljyry3u7b5@buufaqzja7sb>
References: <20251124230841.613894-1-michal.winiarski@intel.com>
 <20251125131315.60aa0614.alex@shazbot.org>
 <aSZVybx3cgPw6HQh@lstrano-desk.jf.intel.com>
 <c5f1344daeec43e5b5d9e6536c8c8b8a13323f7a.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5f1344daeec43e5b5d9e6536c8c8b8a13323f7a.camel@linux.intel.com>
X-ClientProxiedBy: VI1PR08CA0239.eurprd08.prod.outlook.com
 (2603:10a6:802:15::48) To BL1PR11MB5365.namprd11.prod.outlook.com
 (2603:10b6:208:308::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5365:EE_|DS0PR11MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7ecea2-270f-455c-1c86-08de2cfa9f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFhDN2x0ZnZBbjBxVHdxNzRWNHJIWjd5QnFaUDVYTXA0R0lkTjB6aGcxSFNw?=
 =?utf-8?B?Q09YQnhsNmpOYmIvMm5BRjc1N1kvdnFuekNSQ2J0cU9zWFVZeHRUTW5mTEUz?=
 =?utf-8?B?UWR0WG1YbGovbThSS0tJNWthT25HREFKcysrTW4vc2M2ZnZDMmpzVUNKN2FX?=
 =?utf-8?B?bkJnaFREeHdvVXQ2QWdCRTdZVjBJZG9NMXRkTVI1Q2JWRERoaHdteGZOTFJC?=
 =?utf-8?B?WWo1aFZSZm5GaGt5WnVFRmIrZW9PemZGcHJlSE1xK2tPNlR0b2hlU24rSnE4?=
 =?utf-8?B?NW16NzUyVUptai9ENE82cDEzVVFheVNYMkMvdVFIU09GR3U4SDhtZ1F2L3c1?=
 =?utf-8?B?ZUczZFZYdCtYNFl1UkZ6UUhENmF0T1p4YUdrMFUwc2tQZk5Rc3RZUjdJcnZS?=
 =?utf-8?B?QXgyU09QNVlpQnpQNmd0TEtWN01QbkVWODBIR0lMcVVqOEtEa3p3Ym93Z1ky?=
 =?utf-8?B?RDlIR0FLSktXMlUxVFRFQkJrTlBNWDBaNGw3Y2JTSFJIM2gwa0ZVbXJkSDIr?=
 =?utf-8?B?a1prYlUzejAySlRVdC95UGxLTmxxblc2dUptL0FLMmZCdlZOcU9GNUNmUDQw?=
 =?utf-8?B?N3JBZ1RGaE1oT3dkaUJVZ3k4KzJVV3M3Ykg3c2VDK3ZjaXQ5KzIxelJEdDd0?=
 =?utf-8?B?TndITUgrQVBlRURNNWM5Nk5wTXFRVlloWnlDZWtuODVxVy9WSEZ1Yjk4Tnp5?=
 =?utf-8?B?ZlpzbHNzRDJ6VGcwTmN5bW1QNk1PeENKRThHQi9kN1R5ZkZ0Rm5ick4zekVO?=
 =?utf-8?B?T0tvcnJ5QUFXOEVRTHlBTzNvb0JrUVBrYzk5bmMxRUVtY2VMVmpreDErbGNn?=
 =?utf-8?B?ZGkyUGQ3WGpiWk9UZWRvZUlYSEpwZUJ4cGoyYk5tbG1aOW1rKzMvaHBBckt1?=
 =?utf-8?B?QVNTT05JLzNMa2NpVnl4Wi9PQ2ZsTkVZWDd2U1RXZUs2QTBFRmdYbGVJM0Ji?=
 =?utf-8?B?TjdkcGUrZDQ4aFk2T3VhTFFyRi9zTExvb2N3QnlFRENpaEdrOVhWcFZqTHcv?=
 =?utf-8?B?c3Q0aU84ZUE1VGpMVERhOUticTJ2VHE5cGd4bjB0TFVkOVd2Y3dpT2xQcS9j?=
 =?utf-8?B?dTF5V29aWlRWUUNGd0w4NmpGUmpLQVp1aXFsY3BSUmM4MkRGREVud2RKRHlW?=
 =?utf-8?B?aXlyMTNzT3k3cTMwSEh5dW1sYmhzQTZTdUdPS2VkUXRQWHk0dmg3eXN6L1la?=
 =?utf-8?B?aHhiKzBvNDRYeUlzRVJnc1h2MkQ1OTU0MGN2RHJCbEQ4enU5WjRKNkwvZEFX?=
 =?utf-8?B?ZHBmZlNNdFBQaUdHTWQxR0JFTC9iV3RnMnhCVVErUERqczdTNE1TL0t5VE4w?=
 =?utf-8?B?YlRGeHdacUNucnVpVEtiWnU5Q1I0QTFuRjlBVktPdDJlSWZyQ1FCbTVpTHlZ?=
 =?utf-8?B?bU9OVngwemRqT1MyWmdETW5FM2RBc1gxcmFXYlh3Rll0ZlhqZDBGbXNVcXNs?=
 =?utf-8?B?ZUNxeGhSNU42bGxCa2dZa2ZHcEFuVC9VM25WTy9xOCsvVjNmZ2ozNnZuVVRw?=
 =?utf-8?B?MytINkJHa0o5bVBLRTZsTUhnUXdwekUvM2lIN3VzbGdwRzRNMFBOdVFTNjJM?=
 =?utf-8?B?bXlqdXBBcDFuNWU3RFlMSUFPYWlEN0I3TkQ1eTdITytVaHBzSnBGZFJocDRr?=
 =?utf-8?B?ck52cDNPQ1lUb2RxeHhYMXlTbnVMT0VwYllCYU16aGpMM2xsd0M5VXlFMXRD?=
 =?utf-8?B?Z1dZYWxKM3lLMzNpa2dmeXc1cHhubzhhWFMzT3J6cFMvdzVNQUtWMmV3Wm9p?=
 =?utf-8?B?YktoM1NCS2JhRyt4WCtSRWw5dGJHMXZGQTIvL3Y5SHFJb1RnbUdMeTJEVFdi?=
 =?utf-8?B?Qnl5WXBjRXdlSGZJUXcvTlVUdmFlSVFjL1FmVExWblUzNXBjay9qbU5TWFhu?=
 =?utf-8?B?Y3pLa1o5d3EwWVE3VFJHdWdEaHQ1YnNVY25OUDhodllDdlVsUkN1L3lkZ1FD?=
 =?utf-8?B?akVUSEhGcjdkYmw3VUluVHVGZ0RMQkZxTzNnVmhTaHFzQXVHa1d1OXBDbHlN?=
 =?utf-8?B?R1orYThEQ21BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5365.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2k5ZGhFaS8wZFdZUjd6S05IcDJ1ODdyNUZxcU9WV1FheGtTNjFRcmxPZGdK?=
 =?utf-8?B?K0RPVVNaTDFvVUFJSjk1cStZVjRuU0ZDNmRYWlZQS1QxTFpabWJ4WDhDK0U0?=
 =?utf-8?B?UU5RK0M2eTl3ZnFPd1Nia2loNDBiNVhXSjAvZEdvTnJ0OVJrRkNFZlUyZXdB?=
 =?utf-8?B?ZEZtLzZRYVhGZ1N6bEpoM0Z1NjQ5blAvVzdGM292ZW9UUUhKWHdPYW1KM3Zj?=
 =?utf-8?B?bmNGa2JxZHB6VkVQQ0JrU21JOXpkWmQ3dll4TUpZbzVuVjU4emdyVUNWY1l0?=
 =?utf-8?B?QVVyUVVOUzhiaUdwdmJyOGpoZmUrZi9NYzRJbUY1SUVlblVCeEh4YTJJaisv?=
 =?utf-8?B?cUdLQit1QVlWYWFyV3VNbGp4YVcyZ0F1WXJtT254Qlg0Z0JnODducitONmND?=
 =?utf-8?B?REJUbFhORmI2L3l5WlN5TnZ3QmdsUG1RNlU5R2VtMVhTYStpMWsrRHhDZFhr?=
 =?utf-8?B?bmxYdFJ4cUJVN0xkdlpXaXdPbkJrNzhhQmMzVytNT04rOUxMdytyaTltY084?=
 =?utf-8?B?QnNzTUNRUVovbEUxaGVYYmhwL1lwc0Y0WnBpaUJUWVVKb3VIWkQ0b0hYTmFO?=
 =?utf-8?B?dUorMzhXNlc0VlpKRFBkNW94S3Y1blBVWi8vSWVodEhzaUlnb0JsV3hpVHdm?=
 =?utf-8?B?anowc01VNGlRVGJRQ1VPRzRPaFBrUGJDeFU1dGh3bWpIYmpSOU1pN1BPb0N0?=
 =?utf-8?B?aE1JRWltWFdnQ1l3a2xQZ09wM1hFWVA4TjF3TFpYM1MyQUc5SWRPdjlQQmd3?=
 =?utf-8?B?bkRPRTAzZVdkMk9hd2JYMFk4ZStpL3ZXbzkwcnlRNkN2cjdEaEpKeWkzNTJx?=
 =?utf-8?B?VzRoUmJWZ0lGN2hmdDFMcVh0Zyt0SkVvYUN2TXN5U0NxTTFoLzZpK2lGNDZk?=
 =?utf-8?B?bThWcWJlNnhmcnh4cmYxb3liTVFDMW5MemZKN3NsTzI2UmxLWDJFN0hJMWNm?=
 =?utf-8?B?aTVSL0tTcGVQcThMNEhpTVlacGcxTGlaY3crR1l4RUR5Ri9MNU5aTFZ1WXIx?=
 =?utf-8?B?SFRvWmQwb0pkdHpHMTduVWcrYWh2azhJWjdVQ3lTZC9TZk9GVVkzMUVLOGZ2?=
 =?utf-8?B?L0ZKamZsZG1BL2pUaGFQYWVQQkg3QmxrWm9XanFxcW82UnpIVEdYZCtLQ2Za?=
 =?utf-8?B?OWdGQitsWmcwZlQxOWtkb0FYdjJLYkNWRHdJak9wN2I3N3I5RUtpNUtiV2F6?=
 =?utf-8?B?ajYrcUdmY2I4b29mQi9KUEQzMVFyODNJTkppdXVZbDJOVlJZVVlRY282R2p0?=
 =?utf-8?B?S20xRnBtS1hMdDlvWkRmbklWY2p0YWNDRHN0V1lpRVZZMGpYdm5JUzVUcjFp?=
 =?utf-8?B?SGU0N3NiTEh0M1haN2t2MjlmdWVaR3BobE50dGl1ZVFwN3Bob2FpcFNlelpz?=
 =?utf-8?B?a08wVytUMmV4ZUVyYlM2UEN1RXBHUG03RGZiVStrVWR5dTY3ZTJnejQ0TGRQ?=
 =?utf-8?B?UHREOUd3VjhJUVlGa09FdDFKbWd6ckVqeHMxalpiZkVRVlJUWFpsWUhHSXdW?=
 =?utf-8?B?MVd3a25hTGIxam1qZXZKTGlKZ3ZVL3JTc1lWTFcxUkJQTEtBUzY1Wm9DT3p1?=
 =?utf-8?B?VkxzMkdhVlhjMzN0djNIYSt5SXhPbVIxbndJcTVzNDNMTFVZSGdBcW1MVmpl?=
 =?utf-8?B?TWdCZllsSDZzOEdTVUlUV3RIRHBwN3dvRzY3VDJMQkRld093YUlXc3ZWblA5?=
 =?utf-8?B?elJEalA1bUp0NHVjVWtpVXNDYmt4TWtsN2VVZXptanF1VjJIT3FNYUdlMXNi?=
 =?utf-8?B?QkRwaUNMNkZyZktuUytwSW9WYWVSc3cxYXAyYWdMQUZWNDBIUmkrcFRSNmpY?=
 =?utf-8?B?bERDN21uamh0cmRWNWduZVZ4bzdZSUNwdjR6S0VGVHhDTXNFUTlRdnZFU2dL?=
 =?utf-8?B?cnJHSjhOQ1B6VVVyZXBncUNsd0N1WFQ3NDA5UnU1Q3hJZTFGK242bkxjMGd1?=
 =?utf-8?B?a1VPa2NhaXhNemNmWXBIMllFTk1QTytLdzZ5QzdEQndNMjI2SFc1d2ROV3pz?=
 =?utf-8?B?ZzhQTUZDV0QxK0Q5bkJxdkNrVmNsVDZnS2FzRWc3QlBiNmFjSk1nYjZ1Zkg4?=
 =?utf-8?B?RGRLa2RPZWVVd0R1RGVlZTl2NVdCWjhtdTJ0L1lCcFZhNUpvb1hycDUwaWpZ?=
 =?utf-8?B?S1pvb3Y1c0NqK3RqK0hxK2pGUmZXeEVTK0p1Y2pIYTh3azQ0WkFiZVBCZTRG?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7ecea2-270f-455c-1c86-08de2cfa9f58
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:46:47.1577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVNkZhbxnZry6pI9p8O8SZH3+tUXJvNIAdDLRxgRH/WnVCuJAAEpjWt9nzjXQcZGmDZg5bqxr57OyfqPOllLn7/fguo8pxyc+4R8JPf+AHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8020
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

On Wed, Nov 26, 2025 at 12:38:34PM +0100, Thomas Hellström wrote:
> On Tue, 2025-11-25 at 17:20 -0800, Matthew Brost wrote:
> > On Tue, Nov 25, 2025 at 01:13:15PM -0700, Alex Williamson wrote:
> > > On Tue, 25 Nov 2025 00:08:37 +0100
> > > Michał Winiarski <michal.winiarski@intel.com> wrote:
> > > 
> > > > Hi,
> > > > 
> > > > We're now at v6, thanks for all the review feedback.
> > > > 
> > > > First 24 patches are now already merged through drm-tip tree, and
> > > > I hope
> > > > we can get the remaining ones through the VFIO tree.
> > > 
> > > Are all those dependencies in a topic branch somewhere?  Otherwise
> > > to
> > > go in through vfio would mean we need to rebase our next branch
> > > after
> > > drm is merged.  LPC is happening during this merge window, so we
> > > may
> > > not be able to achieve that leniency in ordering.  Is the better
> > > approach to get acks on the variant driver and funnel the whole
> > > thing
> > > through the drm tree?  Thanks,
> > 
> > +1 on merging through drm if VFIO maintainers are ok with this. I've
> > done this for various drm external changes in the past with
> > maintainers
> > acks.
> > 
> > Matt
> 
> @Michal Winiarski
> 
> Are these patches depending on any other VFIO changes that are queued
> for 6.19? 

No, there's a series that I'm working on in parallel:
https://lore.kernel.org/lkml/20251120123647.3522082-1-michal.winiarski@intel.com/

Which will potentially change the VFIO driver that's part of this
series.
But I believe that this could go through fixes, after we have all the
pieces in place as part of 6.19-rc release.

> 
> If not and with proper VFIO acks, I could ask Dave / Sima to allow this
> for drm-xe-next-fixes pull. Then I also would need a strong
> justification for it being in 6.19 rather in 7.0.
> 
> Otherwise we'd need to have the VFIO changes it depends on in a topic
> branch, or target this for 7.0 and hold off the merge until we can
> backmerge 6.9-rc1.

Unless Alex has a different opinion, I think the justification would be
that this is just a matter of logistics - merging through DRM would just
be a simpler process than merging through VFIO. End result would be the
same.

Thanks,
-Michał

> 
> Thanks,
> Thomas
> 
> 
> > 
> > > 
> > > Alex
> 

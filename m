Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068E8A21D18
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 13:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5466210E071;
	Wed, 29 Jan 2025 12:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XstCuUdZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D0C10E071;
 Wed, 29 Jan 2025 12:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738153700; x=1769689700;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Fuf0eECQ7jA20LgxDIdT5RBZjm6t1vI2Xhvtmn/OWNU=;
 b=XstCuUdZE8vaKH1h7Ho1AKFfqmL8AVEqVWJO+s59g9LgVNXXLj/baaTE
 RdhG0DwU47mv9t6ANFJ1RYItTgEAR0E8uBg/DJQXbAGKmwYnzvZUoIjpa
 j2B+NDsdjMHX9Gi1IDTNgmQiiLX8ZPxA1xCi8bZgUDwwuqv2NTNKwI47W
 q10IVp83KzUQDTAdbWVSM3uuPWHncDOtkJhm9hQxYpI47ezFrIWiVagzc
 ShJqRxUkszX7AJtNJJTOCxJPQ7scMXQtArCG17dPxTm+PJzrhwn7GF7hz
 qlqSEsbjZX8wbDxOsbO8mhVxF5cuykxl6MUgXqT3V74j3X3ce9QEljdC7 w==;
X-CSE-ConnectionGUID: ciw0lHsNQ56bHGD6isimGg==
X-CSE-MsgGUID: d9RwjpWCQuedxzEqU1lwzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38694174"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="38694174"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:28:19 -0800
X-CSE-ConnectionGUID: LXlWjE7FTA2xAC4krdXWqw==
X-CSE-MsgGUID: x2ox1j51QkK44N5HD9lOmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="109572362"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 04:28:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 04:28:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 04:28:18 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 04:28:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+D3ez9cJdV7xr1tB27QUbTLcKHq8mW0S/7aT3d8ToTbPy9EK7FEkqYAdeFE1bLiUzknsFxhRI1BKdWbUkhG8y4HVLEM5z+STymX+5FfDk6ORCL7YbEzPHKbz+/kqFm4rQVGxzYLmTrvbyLMV5/uZvDjMgbXDp6k5ZFImF6Rr7v5awAGvfIyFYsbsXqbBr6wuo9Wx8pOFtUJTae6Rgpr4dTbdx8n2YuqXvAvUHAt1UPUKrCImryE786WMNVCSZEi6pg1zi0vzndphV9CrhpF/ZRT2dEiiEq1J7+q3eD8RewswCMwHf9FDmc+M+99p6Y+or92+rZ9DOoZYwzjgUBCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiCRoh1dOEzKYaM5Ccwby3UxVZFUGYIeLPh8Z5y6jVk=;
 b=pUaNyIPCjQhpeKcz/24cy36OpA5HFneBuPrxfaOyFOebfFcjLe7xh6PJG73X9VDAkNJH8UCax8AFuFlEC0MhQ+eIqoCNeh85qGTbE/NKYy+Sc8rxBAgqWICWYofquitdkPIYVzi0vUXmO8lIINqjc5pnxpETEvhvi9IVCtkD9gVBTeLzESDu20wnb5+DH9wwu4NsdsjJMqnLAFzPZgo+L3hLLDmI3WHHUu6mJESZeXGmTifjYs4JvE5vinG6FMF8wzLdBZpK7DptcRAJd5sYDRrptIw34gGdcddUMmZcMvt5U3cVDD8+klO7XvtjI4JdbvklTNN2ykmqe1PYugXCHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by DS0PR11MB6327.namprd11.prod.outlook.com (2603:10b6:8:d1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Wed, 29 Jan
 2025 12:28:13 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 12:28:13 +0000
Date: Wed, 29 Jan 2025 12:28:05 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/selftests: avoid using uninitialized context
Message-ID: <grofpjmuilwm5tb4t4ejj45lcyibpoytkuidrhycookq6474az@ggd4yeflby3f>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <seffzgr3ptmwyrk4rmq4hn5lx5lljm6zoan4w752dovrai4ajg@slooah72lixx>
 <5c7jhypl3bk6gtg5ucr4b4nhqlev3zzn7jp2bwr4qqzy6jkbx7@ongldkbpqs2o>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5c7jhypl3bk6gtg5ucr4b4nhqlev3zzn7jp2bwr4qqzy6jkbx7@ongldkbpqs2o>
X-ClientProxiedBy: DU2P250CA0006.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::11) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|DS0PR11MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b8afb0-68ac-4afb-e39c-08dd40606637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWF2b3pVQXBPV1hyZ05lQm14SlJtTTJOT0NlOFdPbGQrVmludlFhTnF1amFm?=
 =?utf-8?B?Y0d1eS9CdkozMXhqUGgyOExVVFpWditCb2ZURitDWEx0WWd2Q0ZRc2tnOHR2?=
 =?utf-8?B?YzMvL05nUUJkTVA2THFjOWg1aFJZT3JTckVoQzhmVVRPUXYrZFB6STliamIv?=
 =?utf-8?B?STNHbE1pdDFZOUNUNDJCRnVRQzg1di9XM2NKWGlvdG5JU0F0aDEvRjkyVnU3?=
 =?utf-8?B?aWZLbTllZUhqOVpFcmx3aWV5ZWQrS2llVnhsZ2djVUF0NUN1cUczNE9kVlF2?=
 =?utf-8?B?OFdEYWMzazRscmVVdkRwUUpmeTZRUG91aGd1NTB6QjFMMWh0ZWQzTityQWxi?=
 =?utf-8?B?cUVDZFEwNVovYVl0SEpscUNCc2dWOS9aR1dUQ01CVlBVd3QvaHVWa1NHRWZP?=
 =?utf-8?B?V0hNSDVSV1RmbkdJRUVkeUtkY1doWVF6RnZDQ2NvUVBneGY3YkRFZ2tjYzFz?=
 =?utf-8?B?Y1VtSDRBU0hOenFuczZtQXdXYk9zUk9HUjVPcU1XWGxMa2VZeWxJcWNnUzg2?=
 =?utf-8?B?RlhUaENtUW1vN1FZeWlucHNYdUY3UmMrTDNSVFZ3dXhlN0hvb3h6UWhQb0pX?=
 =?utf-8?B?am5YSFgzZ3lBUEU3UHQwb3lPcG1kM012Z05nN25iVW9vd0xITnBVaGlWU2hp?=
 =?utf-8?B?Vll5SVQ5ZXhOOE1Hakljd3oyMUNPTExYT3dCMEQ3MzJ4NWpxVEw2b3Bya3JG?=
 =?utf-8?B?cDFvbVZDTzZobmJSaWQ4dDFDQnlwWUF0dFNaNzlYa05BNEF4MWxld1REeElF?=
 =?utf-8?B?d0dQWlAzWFRTRUxaaWpDVDgzWjRNZnVCTmRYQnRDRU9VQjBHUXhYeS9WQVpF?=
 =?utf-8?B?c3FwR1JCb2l3MFlmMWwvUThxSFVSSnliVmxYa2RhTklSVnYyQWVuMmp2Z29u?=
 =?utf-8?B?YmJHTUFRWWcwMDkwbnNiVHJXTmJIaGtaK1Y0WGZGeUFmN1JVdnVwbjIwN3Yr?=
 =?utf-8?B?Sy9Qd09XM04vQnFrSXdIWlF3M2tNNWV3eUFPVStRbnlOSGJyN2xwN05CZ0lB?=
 =?utf-8?B?Tkd4VE8rUlAwS0NKcmZhUDFaS0tNQkNXaXlRZjR5TVlTeUhDOUR5SE1BQnI1?=
 =?utf-8?B?ZmdVcm9aM3Fwb1hqeE80MjlYSlJ0STBESEpxRDFqMTlyRFdrZ21SOTA5TGtB?=
 =?utf-8?B?MnFqdXF2bU9uWWdtRUZFellhd3ZBMUpvQkVvNGVCY1NDRnErc0pMeXlwSmt0?=
 =?utf-8?B?WE9WY0tTTWtscENnczhLV2w4dHdjMUcrR2NseWxIU1VMSCtoSDl0dXh2SU4w?=
 =?utf-8?B?V0QydGdnUkxVdy8xZS9WWnA1SXA5cCtuNVRhOUVNbXJMZFBYUUkyaHhQdTZX?=
 =?utf-8?B?ZHd0VDk1ejlBVUtUcEpWT1h4ZmVHM1V3UmpCaEY4QkJqaFl6UjUzeWhCNnQz?=
 =?utf-8?B?Vnd2REF5amR2dGJ6TXF4L3FIWitmY1N3UkZwaCtvOFlSUnQ4YzVEcmhka0FG?=
 =?utf-8?B?YkQ5TFB2YWpLWkRpSUpmN0o5cTdkNmFIaENuUkc0S3ZQU3cxaVpvczZzdEc2?=
 =?utf-8?B?V2hxN0ZhWm9qM3RzbndmY1hCRTZsVDNSbUdRRE10VHVtU3JnbExWMVBFL2c1?=
 =?utf-8?B?cUZ1VEI3eFJrMW1Gc1g3cTdZODFEcXBDSk16OTh0Y0FTd2dxK2I2SzlmbHQz?=
 =?utf-8?B?eXZMR1B2TkpDMWlYTzllUTRVdnA4eFd3YnB1K05aWFpWeEpQcXluYWg0M3hh?=
 =?utf-8?B?T00rOGxzZ3NCMXRuUTkvOERwVTVVOEI2a1lkSlRIWk03NUdLMy9QcjJ4c3Nr?=
 =?utf-8?B?VDVnUm5IMlZVUEtxVUxwNnpBUldUUzdQRVdNb2pIL1ZqZWtmNXVGbkJ5TCtS?=
 =?utf-8?B?b3FBd2U2SE4vM3IzSE5EcS9ueThIOGZHc3JIVXNLUDZVVUlFd1pGZnN5WHlB?=
 =?utf-8?Q?Rp4T/0ThFAKD4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGtRcHZ0WHZza1VmdHBWVmQ4dGo0azVheUEvOURXcWl3ekxGODd4bjNuSFMy?=
 =?utf-8?B?TmxBdUczMmtka0EzT2M4eEJyeTE1Z1gveG9CcnduNk9yRGxwUk9ZcGJoU3ZM?=
 =?utf-8?B?UGVmREN2bitTWG1vR1d6eXBLRzg2MEZXZ3VVOGVoSGFKeUt2RVZsc0RrcHR0?=
 =?utf-8?B?dE41d2s5L2xRZHFpaGdlMEp0UDZlME00anJhZTVjbG5aUmx3Y0J4aG96ejdu?=
 =?utf-8?B?SnpXK2NlUzBUR3YvVTIyTlBmN29qMVZGOGY4VVdJcVZobjBVY2s4bEpTV1Z5?=
 =?utf-8?B?SHJZTlFwZnEyekpiZHB4RThXTHZtQno2TTg0cGY1eG8ycTRwS1RVMGpuSEhy?=
 =?utf-8?B?cy9wZTJVNndZTG8zZHJBeEhHVTM5aU44dERaNS9qYkw0UTNnOE5sWW1qOEM3?=
 =?utf-8?B?dStYcDY0QythNjQvVElQMFptQXQwNjU2UlA1NS9QbjJKaWdhMCtZai95SStP?=
 =?utf-8?B?MGY0UWxTYklreXkxWXVURHNFakwxSm9JcDhSZHQ1d1JIcXZOZ08rQTVnYzhz?=
 =?utf-8?B?RkpSVkd1Q3ZQekZBN25IZEtOS1JaVWUremZBUkNuUFluT2VNdlpxWmx6bnd5?=
 =?utf-8?B?d1g3VEZQYVo0K1l3VHpiZ3BvWFhXbTlBdjZEb1I3eVY4dlpxNTJnRTdLbXJG?=
 =?utf-8?B?YkU3Y2JRMjdQb3hPR2RhZjBkOHBSL0ZMUE5tN3huTUxDMEFYaXlLdlpkMkdp?=
 =?utf-8?B?cjR0YXZOcE91VjR0ZG94cWhqZExWYTVDV1ZKTmJqNmFkaFZVZlNzL0dOSVpC?=
 =?utf-8?B?MTQwQkxDTHlidlF4NGMrMW1UUi9nT0x4NmRJS1JlSWZ1Mno4MVo0Z3NIazVk?=
 =?utf-8?B?N1cvNC9uR3NBc2ZrZ0hVemtGa0lIQUEvM2w5S2haeWNxbHcrMmZRb01vL2ZR?=
 =?utf-8?B?YlNMMkR2TWRkMW1UUnNmVFA2N3ZLc2V1VGUwSDRJYVhoeHJCaGlkMXNJbVpp?=
 =?utf-8?B?dHhtNnUxNVZOMlgzMnJka3o1MjZmcEc2OXF3bDgvZGxZQ0hDc2ZBQUVBQis3?=
 =?utf-8?B?Y2lPTXhpeGIrY3Nza0hnSW1ueWdab0pvRTFLbEcvcW5TRzB0NnROeFovSGNk?=
 =?utf-8?B?ZFJxbnpPZTYvcWRTS0xWQjU4NlB3YjZna3YwR0pwdzlLODZoQnAwa04ybS9o?=
 =?utf-8?B?Tm9HOVg4bHpDc3greWdpRHloVzRVWDAySVNsclJjNTdCMHFtd2NsOUNmUWlG?=
 =?utf-8?B?NlYzbm9OUm8zSjhxc3hBNTN6dnRxUExjU25pN0l0dHkxMHBJaVZZK3NCNkdL?=
 =?utf-8?B?QkRJODc1U3JJYWJhZEVJRDFGeWNOb203eHBkT3B4Qm1HWEVQRWp0Q1J0RnFF?=
 =?utf-8?B?OHliMDFiZk4zZldKSVdTY2xIVHlvRFFva2hIZzVQbGE5a3A3cVk3M2EwcnIv?=
 =?utf-8?B?NEUvVFc4VUtVTTJkWThZZ1hJWko0djRLM3NWbjRyaTR6K1Zwdzl6TmtiS3hY?=
 =?utf-8?B?VElqSkFnc2Y0ejJ1d0JzWDg3d2V4emVwNW8vQzd3YSs2WVg4N3RMMWo1dnZM?=
 =?utf-8?B?b2c3OFpOTmZyc3Vvb0hyMEZtMVBBZGE5VmRBYThrajVjUVlSUWdDZ0tpdmFZ?=
 =?utf-8?B?WkpoVkpGLzBlUG5qRGl1STd6OUFpZm8rVVBXbmhrd2VIQThpVEV5c2NiZXBH?=
 =?utf-8?B?eW9PZlJVRUtLbVpTWkoyaVB0aHBQUjdQNU9hQTFNd1oxdDRFNDd4SFk3dDBO?=
 =?utf-8?B?dGJ3S1dtU0VFcUIraXh2eFF1aXRtajJCVisxVWhJOFptbXA5dFhTK2c0Ukpu?=
 =?utf-8?B?UTZtNklucHNGTEhhMUkwVldMVDF2cHRzS1poNFhXK0NDcjNVekxHNmxWNXFv?=
 =?utf-8?B?R0ZlWGxrQWdDaEdzeTY1djkzU2lQNzRSNEJTVUxjbm95bGRCaTJTUXN6RXRq?=
 =?utf-8?B?bFhYcFpkNEIxWSt1UUV2MHgreGtudVY2Wjg1V0dsQStPSjBCREdUSFdFS3hI?=
 =?utf-8?B?emk2UExSa2QwZXR2anJwZlBYZSt2c1NxaG96ZDFxdEpTL21FdjFSUWt3Yldt?=
 =?utf-8?B?bGdrclFRR3lwTnAzQUZoQ2h0MVZPWTN0SWlaTUt6bDc4VHBWL3hqdC9nY2Rz?=
 =?utf-8?B?V3AvbFEyOUU0bHg1RHlDeFQrQStEbElZYnpLNUFrL3dmUjhrSkd2NzhZVlVa?=
 =?utf-8?B?VDhoUnhMd2VJTTUvQWNzY3ZHM043cWxGdlV5NytmV0NxbThDUkJCaWUzM1JQ?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b8afb0-68ac-4afb-e39c-08dd40606637
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 12:28:13.4999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnnIPHhqRESFzCKAn2I4/BwK05FAmQmsOhh1q4kX0l7ZbqjuWItrgcQzOp9ccAP/qcXXjGzKrG7H7/lTAHb/Cq32HBUH/Hs1k2ZhZq70QL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6327
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

Hi Mikolaj,

> > +	if (!ppgtt->vm.allocate_va_range) {
> > +	        i915_vm_put(&ppgtt->vm);
> > +	        return 0;
> > +	}
> 
> I don't know if it feels more in line with kernel style, but consider
> changing it to a label before second `i915_vm_put` at end of function
> plus goto instead of creating new cleanup section.

I do not mind, we can place a label as well, as long as we avoid
using that uninitialized struct. I will include your suggestion
in v3.

> Otherwise looks alright.
> Reviewed-by: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
Thanks for reviewing!

Krzysztof

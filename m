Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000859149AB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 14:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E563710E412;
	Mon, 24 Jun 2024 12:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jj/BZ4Sa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3438410E414;
 Mon, 24 Jun 2024 12:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719231599; x=1750767599;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UN9BC3M3+aTNRCdpm1Mebesueg16NITN51gWygMLkCI=;
 b=Jj/BZ4Sa7QAGx+iymmUc6LPoS4cWTDloBAj7B7lMEb1eccj5r09q37A0
 ZMRqqONf4qWsviITEBWJcsbVZsJy0zL9bteV7YzKcu2xRRVx72F7NzN0J
 x0hM+Z4gKdh3pCiCd2Do7bhI/unPkx1x7TfpO4h8bw2Cq2YYl3qbNMiZe
 b0PigXGAajCzCa/WjuQybVWcNn70fYdEeidz2xH7cUq+me1aKi2Jb2poH
 Ui11OwpbVPqPRh6hNkJuqfezIhbzqHop05M0sYb/FBfwRNaBUPYLI1e5B
 6xNoPCZCuzvppduD7KiRpn2HZiQ34eb9B4WSazWyR5FTdlf9ORjcYM60q w==;
X-CSE-ConnectionGUID: m0SaVSiUTpWqJnQip3T6pg==
X-CSE-MsgGUID: iENnHoPpTnekqLrwGpMjQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="19098940"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="19098940"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:19:54 -0700
X-CSE-ConnectionGUID: ZTWmf2A+Qe+FuPRrq23/vQ==
X-CSE-MsgGUID: PjJrsQHcSkeJyFmpkVeHjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="43264482"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 05:19:51 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 05:19:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 05:19:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 05:19:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5jQlq3s+oqHZ9/mRhlrKc880b6J4pe3k8EnM3WsOQYW4yOPEB5yQSzYwU5MVtxMQ7wNHHzcLVcmt7Sa8Pdzjt6l3aV1lGHwt8nYdHqkM0eSAKKw5PhFXofpeHANpZ0L/4ri7Q7zBwHbSMRXUNZvftscZ2ssslahs3pdLeEtlHmfzUYfGbPaqlvPvoeLnDScgzJhM9wgz8bs4aJwunsX+l/i3mqQ+MtF+zkXpMoUlOH0/xMJpnSSs9SrJB/JhXVKnHOOVTR1EK1tRljNFsuGMSLsF6up1aiDfAIaSo5djAc29hlkTQYUuOJUMzLAjHhKv3MK3JEjxPDonAvKLBuHhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2C85b1gzfA7KgKj7CauSQFWaIMl5rrTC9xjAG3fcqoM=;
 b=hl6rxyP8fAcYZlMZFkgA5WyI+aHjboOBSAAIS4d6QXvNVQlcHURwInCUuGbM4NRFUDETag/QcCEEYHt8vx3Xb+aDCi0oHDXR3R7B70YF1A4Rotru/zpv8IXxn9cE99kEij7ZltXwqm2dVEbHG5hzc2LPK8h1i/ntsRvd85xe05mr95Zb7sIZI2hiSWS5GcFMkRwDwTFcFjvIehoN/a71CEzPq9XZpMsHzkigocJmNEbIkBpxSS1X3FMMJDmcHkH/yisHcZqr1j5KzPXfZwRkAN/tE1Ipjl8jMAMogEmALHBux6TwexAS/+BJDFFySk8nQdrls+EwbUkZiH02nXbTpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MW6PR11MB8410.namprd11.prod.outlook.com (2603:10b6:303:249::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Mon, 24 Jun
 2024 12:19:49 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 12:19:49 +0000
Message-ID: <dd330f73-d83f-4894-a48b-aa2ad004a82e@intel.com>
Date: Mon, 24 Jun 2024 14:19:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Add a flag to allow drivers to skip clear-on-free
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240624100721.24331-1-nirmoy.das@intel.com>
 <7d576b58-81f7-4f2c-8932-70b96764c634@amd.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <7d576b58-81f7-4f2c-8932-70b96764c634@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0003.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::9) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MW6PR11MB8410:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c451760-41ff-45d2-2e33-08dc9447f154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnZGZEpMSERScjFwSjJJSUdMenhydWZXRFpVT1h6OVV1TVkxcUtNMi93MHVr?=
 =?utf-8?B?TTI2NE12WCtaZS94Ui9IUWtZdkhGeW1wTUE1ZWdDMTdmOUpUK2dabzY1elRw?=
 =?utf-8?B?eHlvZ0NhOE94L0VldTc0dVIrNEFDd1pWZkdCT1NnS3YzbjBBd0IrY2lHWTBU?=
 =?utf-8?B?ZldaUUtqUlFxSXRBKzJBbDBPblNGWk9RU1BHYVhCVXlvZzBvUFY1S0pxQk16?=
 =?utf-8?B?QzF2Rm4wSENheHpTeDNzQVpyWkdvdG11RVVya1lpU3A3S29HSkZCd0hJeGJS?=
 =?utf-8?B?ZC81WHliWDd4c2VKVkI5Qy9VaWY2KzFzNU1sL05Dcm52QmZzU3ZjM29SK0d6?=
 =?utf-8?B?dE1mQ0RzRnQ5Nk0vbjUxR045dm1xUUZIa0JndFlpWDFtVmN4WlY0ZFRUWElt?=
 =?utf-8?B?aVZZNUsxek1EeVVwZjFsVkd0ckVHK1RPZmpNc0dQbHNTRFMraFhFSXVydkNY?=
 =?utf-8?B?Q1p0OTdMV0R3dTJNSERZT0tuSFk0VFdlTkxXbmxQRkxFMGE2ZXl3WFpLRDk4?=
 =?utf-8?B?RjZ2R1NlNGtHbTdNV2lMSjJETEFaNmVJY0dUSzcxNk4wRjVMWFlSNUdlWmo1?=
 =?utf-8?B?WE0rL3hSWldXQi9PalJWUkhaazVIMnE2OUFtckFQVkJRUmV1endkamJQOFQr?=
 =?utf-8?B?WE9hU2E1L1FaY2pFR2ovdUhaM0hNemtYUmNpekJadHd4ZmZFY0NFdHJYRm1Y?=
 =?utf-8?B?T3BxakF1dlJlK0Rwd2MrRkpUeW14TXhLUXkrNjB1QnRpVnBKTHpsWVlrbm1u?=
 =?utf-8?B?ZndGK0tNYmV6NXdWV3NodDJJR2Q2SmZXMEYzOTNBaXhVTURYbUROQ1dMbm9T?=
 =?utf-8?B?N3NVeHp3SStwNW1HbUxyMFJaNlpRdThhQTEwRklVSmJaL3hxR2pvU1IyZ2M0?=
 =?utf-8?B?SEZpRnhFVVdMSG5uY3VJRkR0N0U2KzgxaFNwVVRhTU55bUZNZ0RieWFYdEIy?=
 =?utf-8?B?MitwbnFiRTlOTFdxSWZFVUJocENlcnV5cTl0dGFTUnE2YjJneDFncGNOeTVj?=
 =?utf-8?B?QWVKNGEySW8zaU1tcW0wVDd2SkJNQU1obkJDdHBxM1lCK3VzVUpQUkhWNjVj?=
 =?utf-8?B?VVB4cnlSbUwxNHNuRmVTUTF0dEh2RlRLbUtldzJTWGVic1E3QnJIQlJzNjRr?=
 =?utf-8?B?UThONFhJb1lNeWwzcWFER1lWUk8vcU04NWRlNWVIZjBHa2NlY1dqbStPQUcy?=
 =?utf-8?B?dnhweGh3V3VGcHY3MGtkaVQzci9IL01CVmpMTGNvaFlNakRtVkxXRW8xWG00?=
 =?utf-8?B?L1oxQndqZFQyakQvQzZhT1pFd2NGYmp4aU5KK3g5dUxPRlZSTERldDVUS05J?=
 =?utf-8?B?NDBJc0ZzRG43SW5LaE0yMnJyd0pBdlRQVWJ3V2VDNUtXZTlVU3lFNmdBbXNN?=
 =?utf-8?B?K0JOT1dQUVdUU0JSTFJPbWZadWlDd00yd3NOWWJVUjE0ZFhtQXRvSitjc1RU?=
 =?utf-8?B?WlZwdUxHaTRzT0JLeUU5Q1d3Z0wwTEtBWE1NaFNhUGo4RFU0ZlFTZ25idUNQ?=
 =?utf-8?B?UWIwTGVnMFRGZHRtdzZacFZudll3MHlWOXlDb09ESEZoWnE3dEZYTXdockd5?=
 =?utf-8?B?RXdDdjZYeDBRc2c3SVg2a3BNaUE0ZDlZU0puclc4U2I1RE92dlJ5QjNPQkdK?=
 =?utf-8?B?N0NsbmpRVHN6K3E3R0JQVjhZMTdOejZiQ0FwRmgxSExTb0NTYXhHWkkwV3Fz?=
 =?utf-8?B?UGI3MjR1Z0RIZTJaN2o5Y05tVzBOWW1SS2cvSllwaEFyZ2wzOERtWGZRTmR5?=
 =?utf-8?Q?wPqU8lY7bMLd+nlB7uaNziuQPOWMRCnN6eqV7k8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHQxWThseDg1eGJITzFrd2NoZFhlbnVyejUrNk9yT2xSRzl1NVlBQnBBZUg5?=
 =?utf-8?B?dUhxOGlVeiszUk9Kc1o4TnJ4SVJxMEhYZi9hM1JxWHVVWTZ2NzVvRDZOYVlD?=
 =?utf-8?B?QnpRbEY1WXdYSWRZMm5zT3l5cjdYZk1nMkd1a1ZPcmpQYktIaUxxWmsrdkMw?=
 =?utf-8?B?Z3lSRkpBVlVXQWlPeDlHSEJORFowZnNiaklwK2hjcG5UYUw5SVFnN0FKNUVk?=
 =?utf-8?B?V2JDdmh2NHhsenpLZG91VG0xYlBNREptSGR2MjdwTkV6Zk5Pdkh6R1o0TmMr?=
 =?utf-8?B?Ryt0VTBXenU1VUJSQ21DWktVbHN5ZFBtRXg5QUp6ZG13TTVybmRKbFZQUUZL?=
 =?utf-8?B?Uk9mdlhBRGVkdG9haVJSZ0RpK1daVU1wSFdXdjBiZ0xSalNVRU1tbndjMFVB?=
 =?utf-8?B?VHBKaFhuM3ZYeDFDU1lzdWs3eWNHYW96OVJETzU5UHhYb2ptWmVHUUtZbDlo?=
 =?utf-8?B?cEYzekNDY0VVMGtZamRkUGdVcFdhbDRwOGY2RnBVU1d0S3lhbXFvUHVtVWlR?=
 =?utf-8?B?K1h5d0dYQ0Y4VENFYjB5S1gwWmtLY25tYjRZUTVqSXBpZHEybFhiT3FrNFg4?=
 =?utf-8?B?SS9MNDVKVUgyNU92OSs5OXNkMEhMcm4vbjloejE3VE9BcDV4VzZrZXovT1Nk?=
 =?utf-8?B?WVFMbHVxelB5K3FVb2hOM2Z2eFRkdkRaRmxWNXJrVHpoRjNoR1RiSlJ3UW1y?=
 =?utf-8?B?WUtkYjF3VTlDVWllUk5PaC9NbXRwZEEyVlp1Y29uMHFGS09mRDg3TUh1c21I?=
 =?utf-8?B?b3A0VHNXWWRxQWI3U3A1d0pQVkgrcGNCTkJxVUZ5UjhUcDZsYUR4RkRvMU1a?=
 =?utf-8?B?ZVI4ckpaR2pWVWE1dlIxV3g5azJBLytiMFN5R2FtckhQSVdreVpDejBKYVZ1?=
 =?utf-8?B?Z0JYeWM1K2JNMS95Q3JBWlhScUtnSlM0ODlDTVBwOHYrV3FPS29QeFRnbSta?=
 =?utf-8?B?bWR5VFFMTVlod1hjVlVPUytOb1ZDUjNpS0NWSXdBcVRxYlMzTy9GaHJEVlll?=
 =?utf-8?B?OG12ZXFzVTZ2RlVON09xeVNVR0d1elVBWHM2RTRhQVlveGplcW1KLzgrTnpB?=
 =?utf-8?B?WS83MFpld3orM3RpZi9iN0NJOUFjNW1OSENwNGdOZlF2amZIUXcxUFY3TE5i?=
 =?utf-8?B?bXZyZ0w3bU41VFpnMXFMVU8zaXkyME0yb2llc1pPNGZ0VGo0enI5QjZ4R252?=
 =?utf-8?B?WGZuZURMOXl4QytEYkl6WXQ1Y1pHZU9uUVdta1RieHdQa2xERmg1ZVRFc29v?=
 =?utf-8?B?M0M3RXJaZ3VIcmMxWG8wdm0yTTNKd1NPRWp2RktIZFlYR1pUL0JuMllmdkla?=
 =?utf-8?B?VzVGN2dzdGwxTFlzMlFVaDNxT2N4aEdRTzhkamxSUCtEWFJNVUVsbGNlc1hN?=
 =?utf-8?B?ZlRLQ3dDQTAvTnpvRGl4Ny9XZm1LOVpuemgzQnA0aEMyRlN4dElVNDhTV0w5?=
 =?utf-8?B?akFtcHpNUittazdTUVljaWhCUVBHMXpFL3YzLzY3U1FWVmJxNm45WDhJRXpl?=
 =?utf-8?B?VXJ6bjBTWTZBbGtUeUdmVHpOUEpGQmFXT1RTWjZ1L0x2WWFWZHFYSkxaU1gz?=
 =?utf-8?B?MkhJTFJLaW1OL1BFR0ZLSVdsNFRPOS9YdHkwdmNVaU9sWlJhZEVuajNBTGFL?=
 =?utf-8?B?dlp1MW9RdTJ1RUxNVGUzdXVHdGZFNE5UZndrd2N5Z3pvdyt2MlFEb1BxK1JE?=
 =?utf-8?B?emZTbVZMTjROUzlLMHd4N2lnT1ZJZkk2NjlmMWtkQjgraS90K0lzb3BYdTN6?=
 =?utf-8?B?cXB4S3ZCOC9nSE1DS25OYkIrOVhKYVpkeSswVXEzZDJCTU5RSHM3V0lJNVBa?=
 =?utf-8?B?MzFmZ2F3OGZQSVlkOXEybTZwOTNSN1dxUld1eHZCV0IzbC9kbHNtTVJ6RWxq?=
 =?utf-8?B?S2xHL3hTbzJYSEJnZW5Scm1aanVuR3RrbThKN0NWU1Iwdyt5VGJyTkRodmdm?=
 =?utf-8?B?YzhSMGxNRGgweitZM0hKbExBN3R5c240VitrYzhKK3JUeGlpU0toVjZidm1u?=
 =?utf-8?B?QXdUY2NoS21EVnY4TmJrNC9leTR1QWNaczkwOUs1UUF1ejBSSk9ON0RpeW1u?=
 =?utf-8?B?WHlWeG9vSFg4b0JzeEkxeXpCOW5NQ0NucUFUR0NVbHBxanhKTmR1SXM4RGxv?=
 =?utf-8?Q?LJSlPtVxhwJWMgTOmogycAjdg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c451760-41ff-45d2-2e33-08dc9447f154
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 12:19:49.4662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTj3ma3goSTI+3IJ+W5evcH/alS9ekB2zEle1Y1Uez8aAPvPltyiT33BlK0VrkyObG+i+lBKYIFP2ATWoETuMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8410
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

Hi Christian,

On 6/24/2024 1:39 PM, Christian König wrote:
> Am 24.06.24 um 12:07 schrieb Nirmoy Das:
>> Add TTM_TT_FLAG_CLEARED_ON_FREE, which DRM drivers can set before
>> releasing backing stores if they want to skip clear-on-free.
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks a lot. Could you also please help get this merge ?


Regards,

Nirmoy

>
>> ---
>>   drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++++++-------
>>   include/drm/ttm/ttm_tt.h       |  6 +++++-
>>   2 files changed, 16 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c 
>> b/drivers/gpu/drm/ttm/ttm_pool.c
>> index 6e1fd6985ffc..b78ee7524bcf 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -222,15 +222,18 @@ static void ttm_pool_unmap(struct ttm_pool 
>> *pool, dma_addr_t dma_addr,
>>   }
>>     /* Give pages into a specific pool_type */
>> -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page 
>> *p)
>> +static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page 
>> *p,
>> +                   bool cleared)
>>   {
>>       unsigned int i, num_pages = 1 << pt->order;
>>   -    for (i = 0; i < num_pages; ++i) {
>> -        if (PageHighMem(p))
>> -            clear_highpage(p + i);
>> -        else
>> -            clear_page(page_address(p + i));
>> +    if (!cleared) {
>> +        for (i = 0; i < num_pages; ++i) {
>> +            if (PageHighMem(p))
>> +                clear_highpage(p + i);
>> +            else
>> +                clear_page(page_address(p + i));
>> +        }
>>       }
>>         spin_lock(&pt->lock);
>> @@ -394,6 +397,7 @@ static void ttm_pool_free_range(struct ttm_pool 
>> *pool, struct ttm_tt *tt,
>>                   pgoff_t start_page, pgoff_t end_page)
>>   {
>>       struct page **pages = &tt->pages[start_page];
>> +    bool cleared = tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE;
>>       unsigned int order;
>>       pgoff_t i, nr;
>>   @@ -407,7 +411,7 @@ static void ttm_pool_free_range(struct ttm_pool 
>> *pool, struct ttm_tt *tt,
>>             pt = ttm_pool_select_type(pool, caching, order);
>>           if (pt)
>> -            ttm_pool_type_give(pt, *pages);
>> +            ttm_pool_type_give(pt, *pages, cleared);
>>           else
>>               ttm_pool_free_page(pool, caching, order, *pages);
>>       }
>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>> index 2b9d856ff388..cfaf49de2419 100644
>> --- a/include/drm/ttm/ttm_tt.h
>> +++ b/include/drm/ttm/ttm_tt.h
>> @@ -85,6 +85,9 @@ struct ttm_tt {
>>        * fault handling abuses the DMA api a bit and dma_map_attrs 
>> can't be
>>        * used to assure pgprot always matches.
>>        *
>> +     * TTM_TT_FLAG_CLEARED_ON_FREE: Set this if a drm driver handles
>> +     * clearing backing store
>> +     *
>>        * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. 
>> This is
>>        * set by TTM after ttm_tt_populate() has successfully 
>> returned, and is
>>        * then unset when TTM calls ttm_tt_unpopulate().
>> @@ -94,8 +97,9 @@ struct ttm_tt {
>>   #define TTM_TT_FLAG_EXTERNAL        BIT(2)
>>   #define TTM_TT_FLAG_EXTERNAL_MAPPABLE    BIT(3)
>>   #define TTM_TT_FLAG_DECRYPTED        BIT(4)
>> +#define TTM_TT_FLAG_CLEARED_ON_FREE    BIT(5)
>>   -#define TTM_TT_FLAG_PRIV_POPULATED    BIT(5)
>> +#define TTM_TT_FLAG_PRIV_POPULATED    BIT(6)
>>       uint32_t page_flags;
>>       /** @num_pages: Number of pages in the page array. */
>>       uint32_t num_pages;
>

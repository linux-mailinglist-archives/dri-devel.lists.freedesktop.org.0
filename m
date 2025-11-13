Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB81C56260
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 09:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A93B10E514;
	Thu, 13 Nov 2025 08:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MiQTj8X/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C87110E514;
 Thu, 13 Nov 2025 08:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763021036; x=1794557036;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Bvcrdw/2HPQmddUGGbqzpsXh9qFtkQ3AtROJQx6ayOk=;
 b=MiQTj8X/KyNVSNOdbrosw2aHWfkYQTxWz//AZv3cvOvmiyfcaHOJ6tls
 MYwuSHxg+syjnxAVQ/DeI0ClD/cwYoZpgBsc/ePxCkzN8/qXk8+QfMUfX
 0En9NdzouqdxV3zOiPuGk8x5WUbgm7b/gTUj/dJxzTfzMJR2Dglf6vy4v
 6uU/p8frjXJrOOMjN0Iasg4kWf+0EeB/9Q2jyL/oa0BcHe9DI03AvqPpm
 5RzaDl3F39GKV09/aH1o8ebXCQeSQE3JT8ilF3En5LNlkwQyTfjv1LiWC
 xnLW9q1XCv7lwte3ydchvXhtbp2gsEF8EWxRimeIWe392ydpxRLoD0T+A A==;
X-CSE-ConnectionGUID: e0Z0zEYFRL2f0aeqU5Qgig==
X-CSE-MsgGUID: cRGV0YZeToqTOOlXlokGIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="76198618"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="76198618"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:03:54 -0800
X-CSE-ConnectionGUID: ooSJxrxkRMGhIm32EdQNJg==
X-CSE-MsgGUID: mw2yvO28TnuST89isYSlIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="193557147"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:03:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 00:03:49 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 00:03:49 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 00:03:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUxab56lAJ43vAT+qErURnJrx4xUiL3iSALGx+wnUKElU5e9DKiheH62oLbn+vdUctUNmRYP7xfvPZVaK64K+ZtqmOvbiBVGYhFbfS+XZpHz6qi0rA66qCMYV10J5wP0VN3DAAzA/nrMq9lPJnq74u9uVbdv7abHp2BceaFbgtJmsDgFUkw78XrZkuTVwzUiLSbu+JYPhzAXeojuH5nSexIwsMc2bfXulK+kSsk8yvPY1sKgwHb0HbEUa3z9+SpI5/tW/vtyYxrrYA/WWvDXDg8evDK3livQkhyneBIOewdS8yeUbHCJLOE+CH4D0mcVQUx3tIZr+Kkw0efbrT3ANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MClZo6H+t2GDZZVU5TAJ+eI62IxKon8PJqwFaJhaffI=;
 b=s0KC2sbiL6fY+z2GfcfaOmcPRwxiO45BV4DtLMw1U55ojHXUMVv7YZccRkADpz925jmyFxgpDbB9zNHJp8boMQq0NEPBkLslBngrB7R+BdUKQchl6RwT49yaW8WdFw2g045il1fXZLnLAhPV5aM1eDqAoXq7OgZzKJppPfdKxLyBtD4pkpZKCjv9pGxehEuWj6W5jlPB+yCgA76q06z9j+/d9iGe51R/pHx3j8yp1AAEkxiM4lStaGJsRh6/EKfBQmZMzan/SSudUF9OQJX39RVOvpZnyhz36Rvq43eYaWuhtbWeWM6mhlUW13yFfpcr/9EeDhQuWhjY8nWS6mSJdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 by BL3PR11MB6339.namprd11.prod.outlook.com (2603:10b6:208:3b3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 08:02:53 +0000
Received: from PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::33e9:2b0b:5259:ff9e]) by PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::33e9:2b0b:5259:ff9e%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 08:02:53 +0000
Date: Thu, 13 Nov 2025 08:02:38 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zilin Guan <zilin@seu.edu.cn>
CC: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tursulin@ursulin.net>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <andi.shyti@linux.intel.com>, <mikolaj.wasiak@intel.com>,
 <krzysztof.niemiec@intel.com>, <nitin.r.gote@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH v2] drm/i915: Use symmetric free for vma resources
Message-ID: <iox4deamqlg4o3wishu7m63d3d5yzpns6oh5sej3vcxyq3wfus@7ypetc2hez4u>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251113063405.116845-1-zilin@seu.edu.cn>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251113063405.116845-1-zilin@seu.edu.cn>
X-ClientProxiedBy: TL2P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::12) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5064:EE_|BL3PR11MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 00649c01-ffd4-41ab-92bf-08de228b0b4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEtlUmJ5NnB0eVZJRkN5allrWVVxWTQ1UG16bmtSU3M4d2lwd3AvWkxsbVNV?=
 =?utf-8?B?TElaN1hzN3FwWHBrMVZlcnNyd25sSm44VVlZVm42alV6MlFlTXp3MlBXRkhJ?=
 =?utf-8?B?T2xXWW5aSk51WktYbWxJREJWcDZLRThWZFVhVVhGN1cvZjd4ZzdVcFZ6cEt2?=
 =?utf-8?B?NlUrWUI5YzJKNHQvYmtsUk1rVEFaaUc1VmNMdTRXRjdKeU82YVk5dFdxbHZJ?=
 =?utf-8?B?K2xrdWtzN3hFYzBPSDlqRTdudWd2OUVJV0VrWDN1YStLYkZzQVlBeGliU2g2?=
 =?utf-8?B?Q3M2M2FEOStXQTBkRUptUkZoMmFrSGsrZkhXSFMveHpJaVZRbUd4NnRCT01v?=
 =?utf-8?B?eXBkZGp6K3RMUllsQkNJdjV1dzFZWmZJT01TbWh0bE9jMlA5elpGd3RHSEFp?=
 =?utf-8?B?eVpzbVdvOVlIcUtJUC9CKzQxYi8wbkpJQk4vRmc2WUJnWlBrOVdVUlRycUFV?=
 =?utf-8?B?clpEUEJWdFdsWWRkNkNycHFQRHIrWnh0aE9WVFAxVTErOGFlU2t2U2tBOWI1?=
 =?utf-8?B?N1hYaVloZmM3dzlSTi9nMldLejNqY1VnV3ZzL2N4OHBkYzhRR3Y1MXFPaXRW?=
 =?utf-8?B?UjI1Wit4SHgxRTBrTDkyOU1Qdk45aTJpTlNvcTRYeTNPQUhYdVB5VllxVHd3?=
 =?utf-8?B?VkMzU1ZKb2N4WTJKdzBYbFl5S29FQmZGUGVCOXIzQUpRN3dvVlF0aGUrMUpx?=
 =?utf-8?B?cng3ZnIvRU01YktHcG1wdzRXblEwTktyeS9YTG5TemExQlZMeXJqNzhQTVMz?=
 =?utf-8?B?clpraHhjRURlMkV0ZWxyT2hSYVZZaXlRL29mWkJNK1grZEVPTmtwZzA1b1Bo?=
 =?utf-8?B?WWNvU0JWT3BwcmkvdUppTHNLdXlkWkF0b1ZrdllDSUVaK1VNUThDcEphM0kz?=
 =?utf-8?B?Q1NrVmRNdDNpclh3UFdNdy81d2dJODdsaUIzdDFSUU1jbk5ndlQyL1FFSk9k?=
 =?utf-8?B?MWVBMFc0TngxR1kzRmJRRWJMdWgrcTNFTTh4L2crY0JVU1RLdUdPcXhMTkF6?=
 =?utf-8?B?TWZkQ2ZwcnN2VW54UGZsM2daaE5IN0lhRDd3dWNOWnFlSG0wT0FrY3BlWWhW?=
 =?utf-8?B?ME9WUU5FSFlCcmxDcURvd1ArZW5lYTV6cDZzOGgvNUVDTzY3TGQvSWJYcHB5?=
 =?utf-8?B?WWhsNXBXeDg2d0hyYlMyaUw0OW5uaHVBTlNsMzJtOTgwQ3VsYTNVMXd6RmMz?=
 =?utf-8?B?dHFJK3ZxLzNCdmxhSXNVc1dDNE9DdDZaRWtjRkFpYnVRYm84WUsyaFJiSUpB?=
 =?utf-8?B?bk5CcjViTVhnMThmTHlzWDU3SlgxRitWZlRFa2VBWWViNmxaYStxUU1ZQjNH?=
 =?utf-8?B?cnNHKzVyZDAwQklkUXRxZkpmWlpIZnN3S2NYNEpwUFZaSjVqMmd5dVVSY3NI?=
 =?utf-8?B?SC8waUo2NWd4dnZXRlpHREdkZG52VTh5NFlKYkN6VUh2K25HQ09SUkJ5a0ZR?=
 =?utf-8?B?Y2EwOCs3VmVPblBxQ3hMN1J6TjB6L2JKUFV2c1d4YmxXaFhwNFowWFlhcnlS?=
 =?utf-8?B?ck9uRUcyUnZJTW8zc3crSCtjOG12cityWGdoZUF1Z25GL05sQ1J2dktlWUJC?=
 =?utf-8?B?K1RHU2RZQm4vTks0ZGFMUDE5RDhKQVczUlpzYS9Hc3BtaWIzYkNnMW4ya1l1?=
 =?utf-8?B?ekd2YXcxNUJFMzRTYm5rMWNWenJaQytyM1RXUmhnWnQ1YXB2Tk84US81d0ZP?=
 =?utf-8?B?L25Vd2xWUmhNeG54a1VqWTdVZkd5ZGRWSTZHM3VGcllRKzVuOElhNDVSZ0sx?=
 =?utf-8?B?SU0zN2xjeWpXdWhRWm1EczJUSmtTWkcybERwcE4xTjNrZC95Ym13RWNBSmlW?=
 =?utf-8?B?TVAvekl1eXJtZjkvSElPSmlVaVBVZkI3a1JQdEowdzBFUU5PN21neDl5UkVT?=
 =?utf-8?B?UXZhTDBCckRKMU94RkJacnMxdEZuVmRHenZoOEhtWkF2NmJsMEcxWjVlS0dU?=
 =?utf-8?Q?NHPxs9uKrg2DEH0YejZCQ22/3AULihkM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5064.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1dWbER1YXN5eE5YV2NhR3FRNTNJWlF3Wmhtb0czZzh3R3g1V2lVaUxMUDNl?=
 =?utf-8?B?NnFNZVVpbkdhNmtSYUJuUi83aDhzR0lyQkI4WE45Y3VFaFpLWnhPVXM1M3dR?=
 =?utf-8?B?MmJ2cXZqNEMvb0JkK3R4aEh1WWNBK3MwQ0ZpQUprZmFlWFhOMGIwdm01dEli?=
 =?utf-8?B?aFNUb3ZDNjhUSnRyNUpSYzB1RmgvU2FpVXJFQUp6TTZSbzZ0Z2lrRXRSN0xN?=
 =?utf-8?B?TFNKeTNzZ1kySm9oV2NVYWRCaHNFWmRJSWY0UlJVN0NWYVAzK1BqVXZEZXdt?=
 =?utf-8?B?UVVCaTY5YThSTGF3SFlEd1VSZnliYUJDaGNLTW1UZlB2LzhiNnNFWUhTQjhS?=
 =?utf-8?B?a0d1MXdieDAzd3NUK2tHejJuc3JhWTRQcFlVcW5ydE83M2VpRjVCeWxYNkQx?=
 =?utf-8?B?aGcxTjM3VEZxeE1wRCtNTHBHYTBxMllYT1N6MjQ3OEIvRjV1a0tNQkFYU3VF?=
 =?utf-8?B?ellHV0NBQlduQnliK0tkNjh2KzlUQ0lrWm15WnpXeGdPSVFqZjFkcFRqOU5L?=
 =?utf-8?B?a0x3b1l5NmlWOFFqSkZxQkRnc0dnOENld20zTW8vbVJxOGt1OVJGZmF5WEFJ?=
 =?utf-8?B?dFcxNUdUY1ZMY2ZMaE5iL2loMWtMZ1FsWHd3YytPUXYzbXE0UjdJQ3Fob2Uw?=
 =?utf-8?B?cHN0UFVCYVp1R3pQQkNObk9yTUxlZzB0RC9NanRBalVtcUM4dHI4L01yeDh5?=
 =?utf-8?B?WVFIVUk3U1p0RkxoL3lOTVFWV0dnTFVGNHFMZUY1ckwzZ1hObWRxM2ZDamxi?=
 =?utf-8?B?KzQ4b0wyeUFCRC9ocGZyazlxVmkwbENlT3ZXcjJQdzE0ZGw0YXBRK0h6MXFp?=
 =?utf-8?B?cXVYVHcrbmt5TDBoRTBLVGY2ME5pem1MdlRiWXNHNEF4WG1hSzBEeFNGTWxZ?=
 =?utf-8?B?YUxKWGdIRW5WNDE5dHhyUVk4eStzUHpZUVByN1g2Z0VGNU5ZbVNtOGxQc201?=
 =?utf-8?B?S0dNSW5YSitQNmttN2d3SXo0cXlwbXJTVHZ5c0VFOTZ1RUlseUVPdzNHTU83?=
 =?utf-8?B?YjRsRzJQeDJuYWRSWThHZk1POW4vUG54VEcycmI2cE5JdXZwZk5HQSt6L0hy?=
 =?utf-8?B?c1JHSVduYUI5QjBYaHBscEZxREZaU1dueE5raWtkMy9SZGZsaUpGeStUZXM0?=
 =?utf-8?B?Y0ZLWldIM3hwd2JIWno4MGlkcktFMlFWZG5kUTJmZzVuUkFrUzVERWFxMHJ1?=
 =?utf-8?B?SGF0QlVmV2JuOGovTzJackVDQmV4cW1aZUZPdGtOdmxmYWp4NDZUKzFPd2hB?=
 =?utf-8?B?eTVZYUR1SkJFenNaTkRxZnVobmFRK2NQRU9zNmgrZ1NsQ0lUa0ltcEZpK1Vr?=
 =?utf-8?B?QVBiYjA4OG85czlhWEdTcjNiVzlyWTh0N2kxanJDNUNjaUJqVEpXUEptckI4?=
 =?utf-8?B?TjdSb3RlRVE4c2lXRUpxYU5ITndmTXVmLzFFZi9zd3ZFSmdSUGhuMnNEUlZx?=
 =?utf-8?B?aG9HbU5jd1FwT3Y0Szd2L21QNGdPRkN0c3l2bzBUWGtnVlBRQmx1VCs4WE1V?=
 =?utf-8?B?OGpyS3ArcFdnU1ZBak5KRElEQ1UxWElzT1pIK2dxS3hqOUpSTDNGb01zeHl4?=
 =?utf-8?B?elUvSjladWV2WDhEK0llT1kwTGtGTWpRT29CQy9uOTd2RlpTVHVUdG9jd0FS?=
 =?utf-8?B?T3hwdFcya0p2Z0QrcGhzZSszU0t5VVVlVXZGVkgyUUUvcDQ4S3o1T05oVk5R?=
 =?utf-8?B?UE5aV2VXNFdmd2I0UkY4amlZVmlneGlMWGUrbWZOYjJHNUhLNFBtUk1lRDRQ?=
 =?utf-8?B?eG4zendsUW1DcURmcFNPVmMxWnRwUUcxaXdCazVOUVRKaUhBY1Rickd6Ti9M?=
 =?utf-8?B?aVlSejJDK29zV3Y3UFdEVVo3eWJYNjhneEEyV2hsQTBhWENGQlJ5MzI2cHBM?=
 =?utf-8?B?K1AyeVIrUHpwR21Sa2dzcnVzK1lZN1dIbktxbVUzNEFjV1hjZFIwVUpzcld5?=
 =?utf-8?B?NEVtSmoxYXdwVHdWTGEyclVzeGZjMHgwYVFya1krcFY4V2pYY1phTW1zVENu?=
 =?utf-8?B?WTlUNE5iZmxVcnhyVzVackRKWktCa1hFVnFySFZETkFYWDVvc0NDVHBHQ01U?=
 =?utf-8?B?WURRaUROTDhpTHV5NTdhZS9CRGRZN1RNa1ZtdDVhZE90Vjc3b2ZpMTVZbGRp?=
 =?utf-8?B?MklES3p5Znh0UjVielN3bTdkTzY1RnVNNWYyaVBmeTR2MjJDbUJTaWdOVHA5?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00649c01-ffd4-41ab-92bf-08de228b0b4e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 08:02:52.9920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m98DQDK3fd3yobssm3kPjtKLyTKcfCx6nHjRrZd7UevFTiiuhNXXMxHst9cHvGafVO3CDtIoTa01I7gmRtc+EkZXBDU2HZ9jk06ArL0fFJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6339
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

Hi Zilin,

Thanks for addressing my comments.

> The error paths in reserve_gtt_with_resource() and
> insert_gtt_with_resource() use kfree() to release a vma_res object
> that was allocated with i915_vma_resource_alloc().
> 
> While kfree() can handle slab-allocated objects, it is better practice
> to use the symmetric free function.
> 
> Replace kfree() with the specific i915_vma_resource_free() helper to
> improve readability and ensure the alloc/free pairing is explicit.
> 
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> ---
> Changes in v2:
> - Reword commit message to describe this as a readability change.
> - Drop the Fixes tag.
> ---
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index 7ab4c4e60264..16e72ef57bed 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -1524,7 +1524,7 @@ static int reserve_gtt_with_resource(struct i915_vma *vma, u64 offset)
>  		i915_vma_resource_init_from_vma(vma_res, vma);
>  		vma->resource = vma_res;
>  	} else {
> -		kfree(vma_res);
> +		i915_vma_resource_free(vma_res);
>  	}
>  	mutex_unlock(&vm->mutex);
>  
> @@ -1704,7 +1704,7 @@ static int insert_gtt_with_resource(struct i915_vma *vma)
>  		i915_vma_resource_init_from_vma(vma_res, vma);
>  		vma->resource = vma_res;
>  	} else {
> -		kfree(vma_res);
> +		i915_vma_resource_free(vma_res);
>  	}
>  	mutex_unlock(&vm->mutex);
>  
> -- 
> 2.34.1
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof

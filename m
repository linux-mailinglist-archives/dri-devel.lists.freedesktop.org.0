Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49953A4B898
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 08:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F7B10E226;
	Mon,  3 Mar 2025 07:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PungosYw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC1F10E226;
 Mon,  3 Mar 2025 07:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740988432; x=1772524432;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jPqhflSCtB96tgI/DHPK8708U82rbzyKI7Q71hFmyQ0=;
 b=PungosYwa3cq2IQogO39bxr/5R0o01wTWxt1a7bChdE7AhLEdTbwzKEw
 VuW0TI+t2pSaGnS1ghHi1kyfhMSmNEr5qxbDrVBN/GXXid9n1eaqQ+2Ht
 T/GVYgdY1oMFgCV8Jqc8Yvyx1rYB5ugzmaZuRHdCjFrszj1WW/e9y5SMA
 RBA+H/MaY8dfxkQ0YPhpWu44RC4tKQnF3srsJcTYW5Uj1jqKT6l6pbkSK
 lRTLynvxMlzm/4Cu0FRWsPY0u6ULIBEmnnCjPBFIZTzXgWHWO9FfjJNVG
 lcj9MXN3I+I/bDVtFf6zU1wido/2/SR8l9PhbT8Ft+wr/pRLsFss4PjjI Q==;
X-CSE-ConnectionGUID: BiXipt9XTNKaoapR3Dm4aw==
X-CSE-MsgGUID: gUXt7EbkQ0SwI0ZFJa0IzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41878952"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="41878952"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 23:53:52 -0800
X-CSE-ConnectionGUID: mVDgDXSmQqm966sIsHhKOQ==
X-CSE-MsgGUID: DdnpHDRvTLS/KvRyp36qAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="117951233"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Mar 2025 23:53:52 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Mar 2025 23:53:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Mar 2025 23:53:52 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Mar 2025 23:53:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJ+WzyXSiVqVrdsWbXRRo/Z9+Zv5wk8kOWP/ludJakpY0Uunl4TUL94e5Oicn/kdVgFhvaz+EwtqqoCbgnft00F2JErt5BzREvOUf24gRHtMAGk4zoi+0eopFwV0delxrUOPgy3HgY4ANwtJ27wwS8Oyxa+1WpJKDPZZAIb5Y0BT3iWOyBBgcFgYqsBtPZ9SgfJttmIzo/iPwOybunwbaw+H2/+Jm7i/GmCHcKh3fDofGJq8Dzj/y8l2EETZrhbYDXptoobXghX4oB5wneO37OxT87pjd1nS/Za+XW++kDq53MCBnadWy63SFWd9qFZy7Qy7fmgFQeJ970/jvOk9Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cN6lAhkjzeawTvyZ7oTMtiuYZA6Eeqh4RXyerxDaSiE=;
 b=mZJCNcVajz6B5F89KgJvM0bAdtSH7zNOEg/F5ufH8tEIQ0TNlunvPYCgiVb6iZZ6L3Icfub6eLAClyrbBKIU70IOkKWhn2pjtLY3x+WaSPdvPXx7MvWYaQUyOqyyamgKGxDawohzJKsu8qFT6qhjAPtqemUUvX2v63OsIiaD3G2MljyNZ5Qc22nCP6SO6E1eQSwTlLvfP16y6M4/aIIp6C68mb3zlzVADHETwN/UJoZSOBJIB3wpaVmCOhC1qWlQmUMEAj0c0c8rx5cDYLKfMohbLRx8xMVxec6u1wcHIxJ5OyhknZ3OZfUuL5irQL7OzUeQOXGcrs80cVTZroHIfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW4PR11MB6885.namprd11.prod.outlook.com (2603:10b6:303:21b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 07:53:48 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 07:53:48 +0000
Message-ID: <95a3e35d-2c5e-4861-b7bf-f38815a44e14@intel.com>
Date: Mon, 3 Mar 2025 13:23:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <suraj.kandpal@intel.com>,
 <dmitry.baryshkov@linaro.org>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com> <20250217120808.708b9b4d@eldfell>
 <c423efcb-5ab8-41c2-af0a-621007c6175d@intel.com>
 <20250218181819.11ca41ab@eldfell>
 <cd095fd7-3043-402a-9e21-c0c85c53f8e3@intel.com>
 <20250220175047.412ee8d4@eldfell>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20250220175047.412ee8d4@eldfell>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::14) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|MW4PR11MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f4487c-d4a0-487a-b8d7-08dd5a2887c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0swdS9ldjQra3REeU5ZTi81K2NOSGppV1cxNlNmT294QnFHYklUSy9vTWNi?=
 =?utf-8?B?UUd3cEs4T2MzWGdzWGNXcCtMRldNTHZwTjVMY0JWZXlrZ0pvM2lSZWlBeWZY?=
 =?utf-8?B?cVV6WDJ2eGJwMFBBcDFpRjJRb09nRDhjNGlLdm9BbEFmc3lUK2gxc082ZWJR?=
 =?utf-8?B?Z1NIMFg2OEtYZkpmTkV2RThEc3ZDS2FLNDZFLysyeGdUMEZONTV1bzVSRzRz?=
 =?utf-8?B?QTFrTGdweTlQVTdHOFIzZVJvMDNIRGhDWDZUZlY1aEtkUnJCTmFDT1NYR09W?=
 =?utf-8?B?Z1BOSHZYUU5nVDBObWVBUjdYOGVMLy92b1VOL0RVUDNCVXFCZisyWW5renZ4?=
 =?utf-8?B?YlRsS0tBekFhOHNOMUx2OThJbCtLSnZ1aExFU2Z2aWFQWUc0S3ptNjJLcWVt?=
 =?utf-8?B?ZDZKQWRnOGJPbHMwcFgzRHY2N0JnbCtGaFVRVHljclNCclZDQ3NCSld1WWxh?=
 =?utf-8?B?TjdzT255R2t4d2REazliMGo4b0QvRGdLZjBVWXg0NUFaeEZiNEI0WE5hb21a?=
 =?utf-8?B?c0hBWi80VFIzR3Y5YzlJRjZCbXVJYk5HeFFPMDdLZXA2dWRnVC9pU0tTSk9X?=
 =?utf-8?B?dytyZjlLYzFUR0xqeWRlZ25KcFNnRjh3bldXZlZOSDNFd00rYmVEL0RhaXd3?=
 =?utf-8?B?MEJWUmsxWEhvbkFraFphcWZhSElwUlFaK1gxL1libnVVajZjczY2VVltUWYy?=
 =?utf-8?B?R3MyRGUxVnRJTUZzbEl0eFV0dXVDMS9hMkY3ekpYU3czZE9pY29aRGdNVzIw?=
 =?utf-8?B?dU5XM1laUG0yTXZaWVB6T1UraFZDa1hITzl1TjRIdFd6cHIxUlhZb1gvN0ta?=
 =?utf-8?B?RW9UK25xYUdGVitTbGNvNmNlbEs4TkUvNFB1cW9YdDFnUFpBZTVpdzl4WXN5?=
 =?utf-8?B?V2YyK1p0VURhOHN1R21VVTYwL29uTGtwc3VKaXJTVG43aDFuZmFEMkdFQTZm?=
 =?utf-8?B?NytWNlVhZmdBOG13RFB5cW9EZE02bkdqSnI3N3h4Z3VJWEpoUElNaEF4VVd6?=
 =?utf-8?B?d09URXJYTmptaDNBYkV4OGdvZjRxTys5Ukg1QktUNjlFMGJjOFhwWGNYSmF2?=
 =?utf-8?B?OWdNY1hLem15eXBLSjBwMUg0MUhXc2lFNTZET2dLb3RmUnA0RWwrNzhZWjlQ?=
 =?utf-8?B?RW43WFhZQVFSMHNkUWlxS1ZRcFg3eGlNeDJvcUlYM2ZhSHczY3R6enRIa09E?=
 =?utf-8?B?K3NHQ25RT2Q3bGhsaGdyUHdqOEZEM0RoZ0FueWlYUzRmbWF0czRyM3NzUWMw?=
 =?utf-8?B?TEkrdjcyS2liOHdlNy93QmlqQnpYK2MzdlY1d0x0ZWRvVWdXVGhhS3ZzUEt4?=
 =?utf-8?B?a0U5VVFqczRvejd6WklkQnQxWHZmV0tncGFFMEI1Vkxwb2VPUHM3UlpZZWVK?=
 =?utf-8?B?elhXaGJzTXEvTEdIYVdLdkJVbVppNFB1dEYvWTdIOVNTbHZUaU1oS0N1dXZF?=
 =?utf-8?B?WWY4TmF3a2ZLVTlML3ZmWTVLd0hENHY3M1ZVY0ZoelhoQ2liTVdla0UwTXRS?=
 =?utf-8?B?d0lsZWdpajlXVUdzRDV1MHI4UUVTTHRjTC9ycVpNcllvcFlVdmZIYWg1VDhs?=
 =?utf-8?B?Y2VCWWU4bm1qTGtTTjJEd0laMFJ2WndQOHZ4VDdZZHlLV0Nhdi8yVVc0S0Rn?=
 =?utf-8?B?L1U5OXlWd2Z3UHYyR0lET2NoZFJhclZwZHVFUi9WU0hTMG1aSllKYTByb0ps?=
 =?utf-8?B?MnFjM29yQUhySW5ackEvZm4vRzRqbzFmRXNtN3hGVWhhYm1ZMnJpY3FGMWZ2?=
 =?utf-8?B?TzVHTVV0djJ4VUpQWDk1aFpxOVAzWVk5Zzg5SU83TjY5cjBmN1BMTHlyeW5y?=
 =?utf-8?B?VWFsOXd3a3FzVGNyZzNoM1lxOC84eFJFR3lVRnQ2bGpTaHJXZitRbUpQY3dz?=
 =?utf-8?Q?N5/nLT69BaO9J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEZMMEJVYmhHREJYVlRibHZmWEZMNzN5ZWZHVGFqOGcwUkh1SmdESU5pT2VV?=
 =?utf-8?B?NEVJZkpWc1dDdGgzQkNqS2FyQWYzOS9GcTlDanRYM1NJUTY3ZU43UWNkWkRL?=
 =?utf-8?B?V2tibnRnR3Jrb0lHOSszMmNZQm9vSlBrNWxHdFpadzNYR1JIcDBtOWpPZlBi?=
 =?utf-8?B?VUNRSEJodlZXbU5FTzlNbGdpc0ZZcXJDWWE5SDJJVXMwMkduNzBTOFJxU1Zx?=
 =?utf-8?B?VCtycHUwdGU3bFlJV2ZRZHRmNHR5MzRxbjgzOTlhREw1Qyt1YVdCMldXTnF5?=
 =?utf-8?B?cy9paElHdld2ZjAramsrUG5wMXNmcXcyRmFRNVVIaW82OEc0MUxZTEliV3Z3?=
 =?utf-8?B?UndhWnBuM2JCVWtQL1YrQzA0TjRPSGNKZDlJT25DckpqNklJSW5MdmpyVTFj?=
 =?utf-8?B?cmtpQ3N0eDRyZFRyVUx2YzVRZGJ2cVJmTHFUZnVjcDg1ZmhJYTZ4R3pQbzZu?=
 =?utf-8?B?MUIyc1V5NDFEYS9kcVB1alhOSzQvY3NyQk02SnVlU2wwRm81d1VTVkpvLzBx?=
 =?utf-8?B?TnZoSldJQnYvNGZwT0NibHJKWVlZbFpuUm9lekpsUHJYcUJKMGJuNmttbHhF?=
 =?utf-8?B?SVhvQ0JFMGl6ZU9SOUgwQmRhdmFjaXZrQzVqNDYwZ0dyUVYrS1FDWVpMV0Ri?=
 =?utf-8?B?UGdKRlZTVzhxcldwdDN4ZDlVSktkMGhXY28vZE9RL1ZtemV1cy9kbTlJc3Fj?=
 =?utf-8?B?R3NOdjE3d3B4UjBnREZ0WS9yaHhZa2pMSkVqaG0wSVZwMnRpRExZdWV1RnE5?=
 =?utf-8?B?SjFqRjRJNXNjSmo0aS9jQjBIZHM2RytUMlE2cVgzMGovZ3VUSTJJMkxLZVJh?=
 =?utf-8?B?Y0ZwSUFOeExtQ0Y4QnMvdnFRQlo2cmltTUtBS0pQc0tlWFVRclNUT1JTa3kr?=
 =?utf-8?B?ajd5VHhwVnFzUGRpT1p1bngyRWEwSnBZbjRlWEp2V0tpR1NZdXBkajh6VDhV?=
 =?utf-8?B?OThNdjJ2TCtsSE8rbWlTajFlS05mVFg0MkNSZUxPTjNDNFNBMVREMlgremQz?=
 =?utf-8?B?ekhRZmExdy9HWjJXY3pxZ3I2cUVLM3BZVW5JMFgraWQvdGlSdEtWQTNjKzZv?=
 =?utf-8?B?Z05oaThjM1dDUGRURWNOVnFkOUNCeTRMbWNmUEVmbFR6QitwWGFtTWRLNTA3?=
 =?utf-8?B?RUlIOWVLcDBqQkJrTDBOYnNXZWZqZFNKYUtyR2FBWWJvLzU4eTVON09qeU83?=
 =?utf-8?B?ejM0dnZEU1pROTFUYk1WMnZPMnRqQVBIaFljcG5DdHd1UXNFb1JXRGlTZVJs?=
 =?utf-8?B?ejFHSmlaeTlSMTdvbXhqNENGL2hXM1FiUTlBMFBEQXNWUmNEMEJqSE5lSVJv?=
 =?utf-8?B?NWpyWWNtcTlLamdoc2cyR0VSMU53SVpMVjhHekUxczRSV1dScGwvWitZN3JE?=
 =?utf-8?B?RlZxaEw3bWdVd3I3TFhFZUtrVkJGQ3JkRXNtbi96aFl4VVFYVHhhMkZYQkRo?=
 =?utf-8?B?ZFlBdmprV3hFNG1OQ2hWOUlvbit3c1V4eWIzS0l1dHRlU3A1MmVwbzIwaUxj?=
 =?utf-8?B?K3VLL21lc3dnRUpaWC9KYzRnWXI5N2dCVlo4clZneGNadDBxRUJxOVR6MWJu?=
 =?utf-8?B?aC80aWFWb0t3RkZXcnAxckU4bnhwSVdqb082dmdQWG5LODFteE0vTDlSMENC?=
 =?utf-8?B?bjBrL0g2YjB4OXJ3S3NjNjI3RXpKaXBZL2hVZXFJR0htL3NNWkVHMFA2R0VN?=
 =?utf-8?B?S1Bueld2Tkt2dlRIZDFpVU9yQTIxbEhmNVl0OE9RUEF3aFNPbFlwT2FiZ24y?=
 =?utf-8?B?b0VLQzByYUtPd0x2RW1PdjJ3VVB6Y1hKSVh0dEVGZHh2TEFVQ2hsdjZDVkRX?=
 =?utf-8?B?SithaVNYVGhSVzhiUVFucWZyUERIV2JFdG9COW5Ya1BmenlOd2lBN2Ezd3dB?=
 =?utf-8?B?WjRSaktLRnFQR0ZsSDhHZGJ5WEI2eEd3dmFNZDR4M1Y1OXJ0NXFxbUV1Uldl?=
 =?utf-8?B?TEdoRjVZVXZqS0VPTE1WTVR6TXNnazRjb1B6ZUl6aVlGSGJZRzhSMzN4UW5t?=
 =?utf-8?B?aVk0ZzkwdGNlM2lLMFFvVnlXbFRGVUlZY1NQMG1HTVFBMUI2STdrMDdOdUJy?=
 =?utf-8?B?M0REZDN5NEtXTXVZYUdQODlIMjRQRVRreVJPQXMwQVFnVVYyeTJBK2JUcG9B?=
 =?utf-8?B?VSt3dk1PS1AzOVBRaXdIbU90ZURpVzM4MFR0Sy9lYnExbnoyTTRmN1dORG5F?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f4487c-d4a0-487a-b8d7-08dd5a2887c5
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 07:53:48.2450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxFh2sagVoDxCWqmMKk8WlxwHtg36QR4+4ZXGIs85VoWjpB8FFov0/TnULG5G+8j/q4sRJ1E5BwxQxbYVirTig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6885
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


On 20-02-2025 21:20, Pekka Paalanen wrote:
> On Wed, 19 Feb 2025 09:28:51 +0530
> "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
>
>> On 18-02-2025 21:48, Pekka Paalanen wrote:
>>> On Tue, 18 Feb 2025 11:13:39 +0530
>>> "Murthy, Arun R"<arun.r.murthy@intel.com> wrote:
>>>   
>>>> On 17-02-2025 15:38, Pekka Paalanen wrote:
>>>>> Hi Arun,
>>>>>
>>>>> this whole series seems to be missing all the UAPI docs for the DRM
>>>>> ReST files, e.g. drm-kms.rst. The UAPI header doc comments are not a
>>>>> replacement for them, I would assume both are a requirement.
>>>>>
>>>>> Without the ReST docs it is really difficult to see how this new UAPI
>>>>> should be used.
>>>> Hi Pekka,
>>>> I also realized later on this. Will add this in my next patchset.
>>>>> On Tue, 28 Jan 2025 21:21:07 +0530
>>>>> Arun R Murthy<arun.r.murthy@intel.com> wrote:
>>>>>      
>>>>>> Display Histogram is an array of bins and can be generated in many ways
>>>>>> referred to as modes.
>>>>>> Ex: HSV max(RGB), Wighted RGB etc.
>>>>>>
>>>>>> Understanding the histogram data format(Ex: HSV max(RGB))
>>>>>> Histogram is just the pixel count.
>>>>>> For a maximum resolution of 10k (10240 x 4320 = 44236800)
>>>>>> 25 bits should be sufficient to represent this along with a buffer of 7
>>>>>> bits(future use) u32 is being considered.
>>>>>> max(RGB) can be 255 i.e 0xFF 8 bit, considering the most significant 5
>>>>>> bits, hence 32 bins.
>>>>>> Below mentioned algorithm illustrates the histogram generation in
>>>>>> hardware.
>>>>>>
>>>>>> hist[32] = {0};
>>>>>> for (i = 0; i < resolution; i++) {
>>>>>> 	bin = max(RGB[i]);
>>>>>> 	bin = bin >> 3;	/* consider the most significant bits */
>>>>>> 	hist[bin]++;
>>>>>> }
>>>>>> If the entire image is Red color then max(255,0,0) is 255 so the pixel
>>>>>> count of each pixels will be placed in the last bin. Hence except
>>>>>> hist[31] all other bins will have a value zero.
>>>>>> Generated histogram in this case would be hist[32] = {0,0,....44236800}
>>>>>>
>>>>>> Description of the structures, properties defined are documented in the
>>>>>> header file include/uapi/drm/drm_mode.h
>>>>>>
>>>>>> v8: Added doc for HDR planes, removed reserved variables (Dmitry)
>>>>>>
>>>>>> Signed-off-by: Arun R Murthy<arun.r.murthy@intel.com>
>>>>>> ---
>>>>>>     include/uapi/drm/drm_mode.h | 65 +++++++++++++++++++++++++++++++++++++++++++++
>>>>>>     1 file changed, 65 insertions(+)
>>>>>>
>>>>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>>>>>> index c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..b8b7b18843ae7224263a9c61b20ac6cbf5df69e9 100644
>>>>>> --- a/include/uapi/drm/drm_mode.h
>>>>>> +++ b/include/uapi/drm/drm_mode.h
>>>>>> @@ -1355,6 +1355,71 @@ struct drm_mode_closefb {
>>>>>>     	__u32 pad;
>>>>>>     };
>>>>>>     
>>>>>> +/**
>>>>>> + * enum drm_mode_histogram
>>>>>> + *
>>>>>> + * @DRM_MODE_HISTOGRAM_HSV_MAX_RGB:
>>>>>> + * Maximum resolution at present 10k, 10240x4320 = 44236800
>>>>>> + * can be denoted in 25bits. With an additional 7 bits in buffer each bin
>>>>>> + * can be a u32 value.
>>>>>> + * For SDL, Maximum value of max(RGB) is 255, so max 255 bins.
>>>>> I assume s/SDL/SDR/.
>>>> Yes, sorry TYPO
>>>>> This assumption seems false. SDR can be also 10-bit and probably even
>>>>> more.
>>>> Yes but in practice majority of them being 8-bit. So have considered
>>>> 8-bit for illustration purpose only.
>>>> The design itself should accommodate 10-bit as well.
>>> Hi Arun,
>>>
>>> if these are just examples, then there is no need to mention SDR or
>>> HDR. You can say that if "thing" is 8-bit, then there are 256 possible
>>> values, and we could have 256 bins or we could have just 32 bins.
>>>
>>> But what is "thing"? Let's see below.
>> Sure will remove these over here and add then in the ReST document.
>>>>>> + * If the most significant 5 bits are considered, then bins = 2^5
>>>>>> + * will be 32 bins.
>>>>>> + * For HDR, maximum value of max(RGB) is 65535, so max 65535 bins.
>>>>> Does this mean that the histogram is computed on the pixel values
>>>>> emitted to the cable? What if the cable format is YUV?
>>>> Yes, again the illustration over here is max(RGB) used for histogram
>>>> generation.
>>>> If YUV is used or weighted RGB is used for histogram generation then the
>>>> mode will have to change and accordingly the data for that mode.
>>> Do you mean that the HDMI or DisplayPort signalling mode (YUV vs. RGB?
>>> sub-sampling? bit-depth?) affects which histogram modes can be used?
>> No this is actually for user as to how to interpret the histogram data
>> that is being sent from the KMD. UMD reads this histogram so in order to
>> understand the format of this data he needs to know the histogram mode.
>>> Currently userspace cannot know or control the signalling mode. How
>>> would userspace know which histogram modes are possible?
>> As part of drm_histogram_caps struct under HISTOGRAM_CAPS property KMD
>> will expose all of the supported histogram modes to the user. User will
>> then choose one among the supported modes by drm_histogram_config
>> struct(HISTOGRAM_ENABLE property)
>>> You should also define at which point of the pixel pipeline the
>>> histogram is recorded. Is it before, say, CRTC DEGAMMA processing? Is
>>> it after signal encoding to the 6/8/10/12/14/16-bit RGB or YUV format?
>>> Before or after YUV sub-sampling? Limited or full range?
>> This again is the hardware design. Theoretically this histogram hardware
>> will be at the end of the hardware pipe, i.e after hardware/software
>> composition is done.
> Hi Arun,
>
> sure, it may be by hardware design, but the UAPI must specify or
> communicate exactly what it is. This seems to be the recurring theme in
> all the remaining comments, so I trimmed them away.
>
> A generic UAPI is mandatory, because that's KMS policy AFAIU. A generic
> UAPI cannot key anything off of the hardware revision. Instead,
> everything must be specified and communicated explicitly. It's good if
> AMD has similar functionality, someone from their team could take a
> look so you can come up with an UAPI that works for both.
>
> Dmitry Baryshkov tried to ask for the same thing. Assuming I know
> nothing about the hardware, and the only documentation I have is the
> KMS UAPI documentation (userland side, not kernel internals), I should
> be able to write a program from scratch that correctly records and
> analyses the histogram on every piece of hardware where the kernel
> driver exposes it. That means explaining exactly what the driver and the
> hardware will do when I poke that UAPI.

Hi Pekka,
Sorry got getting back late on this.
I totally agree that the UAPI should not be any hardware specific and 
have taken care to get rid of such if any.
Here we are just exposing the histogram data and what point is the 
histogram generated is out of the scope. Generated histogram is exposed 
to the user. Please let me know if anything is hardware specific, will 
change it.
I feel the rst documentation as suggested is missing and is creating the 
gap. Can I go ahead create the rst documentation and then repost the 
series and then we can continue the review?

Thanks and Regards,
Arun R Murthy
--------------------

>
> Thanks,
> pq

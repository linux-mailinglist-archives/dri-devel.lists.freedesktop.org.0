Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F939B621F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 12:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8874610E78E;
	Wed, 30 Oct 2024 11:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9snTKj8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE1F10E78D;
 Wed, 30 Oct 2024 11:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730288612; x=1761824612;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qKDbVCEyYnkOQWtJGf2gDiw8C9fFEN1FdxcOWUeIJ4Y=;
 b=T9snTKj89aIzlzAnfpxky3HnD5IBF+S7lhb7AHjpzi0omTq0innUk1tO
 9ypu7cvV7qfKkVsybJ63MP6RZcVeYQb5NOx2qjxXH9eX76WbBbmehMOoL
 Qt2xvOvUQoeUdVa6ttyfV3CiJEEhP1ZwDj2sLR0xWURLxObkCP53wDHPT
 59hzR++3E1Q2/DnTZHmpeq1R+z+XaXok/fsJmypvSdW0HiSDglyRr7BuP
 MfXs069scAlwRB8+0Pp7c4KGFPZ5ZurewXEoLy1OshvoQdI+9qjyc84R1
 RMBLx9++6E2ttSIzWgHk1Fj7M42NuhK0SYcn4H+NhjNdUhXT4+TMgnjOd w==;
X-CSE-ConnectionGUID: 2HAcNutPQqS+qnaUYFyqsw==
X-CSE-MsgGUID: CVtXJXLXQTmzF/y6dCaWLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="30199466"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="30199466"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 04:43:31 -0700
X-CSE-ConnectionGUID: A7VjvNQgTM6d2QD5KbWyGg==
X-CSE-MsgGUID: OeLK3lX+TX+WNb4FUgW3cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="82199002"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2024 04:43:31 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 04:43:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 04:43:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 04:43:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDjpEI94WEFcgJfM0tOOApXlofCxQTHC+ckP8CWW+bxUs96/XRYKR6qIvE2os0W6Wgmr4l39lJ1NdML74OYl+v24wfjsTYYbuAntJKSI65mqCOqmh/tRVMHE0GLmtUUrQHs3vrzuDNSEt63YxUqgkpryq13vRKX5wx7kBZswdMXnEBb7NGgvNxfOrrB3HSK+jHfErma/kPmUutTTWvssrrmOrq9zKqoJwLLpJksPoujMRMllGeJrSgyR6gQaCme3PhIeMVDEBvQiFX456eG+5k18wsJAegU8wNKSY6dtWivwP9L6vy5XlU1MnYdRz1jnVC2VzC60EoPJeCYqC9NqYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Wp0K74CCAzPL2K0hlCqHbbVZR3e3UApRACJuHORRcw=;
 b=FSJsQfPBm12Lw+xxG+wCozw+EmB76HnzQ0+FwrmpDSK1ASDDW9obKqrPtrXTfkOBHekFxuBmiYdzHTxTGQbbIhQIBgsj5oEaGzJXrKHiWrXOZfyjVVd9BDlOyjIWTdxb3uyBbgbFmnYz3PqzufOn7zg/DqPsZSD+SX5XdW6g2VIuDuu9H4J4DpAXEFrKpMKR8EnT3kDzu1Q6sXmwQ4T7yTdm7JspAFETZIU0wgz2YabrVgFT+6azcJphwqQUsS+xIbC/wbv+Re2m5jnw8rAUE5Bg5hgM3m127uxU//8TDg/vfA06FR5oFLpVJxiuFPHlBJsb86/Frn7WWt9RbwHZWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA3PR11MB8003.namprd11.prod.outlook.com (2603:10b6:806:2f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 11:43:22 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 11:43:22 +0000
Date: Wed, 30 Oct 2024 12:43:19 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 5/7] PCI/IOV: Check that VF BAR fits within the
 reservation
Message-ID: <zbazqug3u77eiydb7p6p6gexwowrjcdl52cszczuww4xow7ebc@tke7k5hewrn5>
References: <20241025215038.3125626-6-michal.winiarski@intel.com>
 <20241028165604.GA1105091@bhelgaas>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241028165604.GA1105091@bhelgaas>
X-ClientProxiedBy: WA0P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA3PR11MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd5f767-0f52-4e4b-d691-08dcf8d80eaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUU0YjYvaHcyMUJRZjJ4elgvUk9ib0VJOGY2enBYdXl4V0dPcURMdDR0LzNm?=
 =?utf-8?B?M0xraWEvUlhKQ1FXQ3RlMjVRVE5sb2tsRzI3QnJydm1wTlpTUEROZEhmTitp?=
 =?utf-8?B?Z05tSENJMFhmelF1R3VnT0lsRTM2N1hGdVhGZWFHS2tUSWFoNGxsTG5sNTZP?=
 =?utf-8?B?VjNFSnFuTE5wS0VacHNwRjVQL25hdjA0dmszOGVaRW9IREx1cEhScTZ5dnA2?=
 =?utf-8?B?eTNFU2gvUUxFSWVLemFRMFpxQWtrZ3k0V09EeXVWMTcza2hXK3gzRDVETFVP?=
 =?utf-8?B?SnV0TzVNUGZaWnpFazZzWGdoN1dzZnREZzBFblFMNTY5a2ZhdmxhSXc1eWhB?=
 =?utf-8?B?YUMwMUdvYUQ1TkNiaEI1TzV4U2Q4blFSLzQ1SC9vNlY0ZDdLelF5eWFpUU1T?=
 =?utf-8?B?UHlyUk5NZjZrRUkreVdqUHYyNDRUMlNicUtIdEQrSnJJVWNzV1g3MnJpWklq?=
 =?utf-8?B?ZmNCVHowK2pydW8rTXdxVTJwdUhoWVlMVjZZSEZNeWJYNU01SUVxN21WWGx2?=
 =?utf-8?B?OVg4T2dxSGJxdHo4aU5vZVdVWXNnMDErSUNZaStxNW5ZbkR3L1Vid2VKOVdh?=
 =?utf-8?B?SWdaeXpaYlNzNFF4YWNDc25EOWk1Y0tRTmhPamtwOEl4TWVuOU9CSEh0eDgx?=
 =?utf-8?B?ZW9TWlhDL2M1bGxLTm9DMUptL04rcXJheDFaMHl3OEFORkFhMzR5WVh4amRW?=
 =?utf-8?B?SjFRYTFad3dpSThkVzdZWjVHREFmNUg3ZVdmUmNEMlpqZWhWUTN6Rk1udUp4?=
 =?utf-8?B?Zm5Fa2c4dm1rOFZRNk5PWjB0cHdVaWdoZDQ5QWdvT1dPbjdndU9sbzdlR0Qz?=
 =?utf-8?B?OUh3ZnlJbHYxZDBPUExRUHpzYms0ekhYN2MzLzFzWkNCTm1udUV4MkRHNm94?=
 =?utf-8?B?SzVlT0E3YllhbGhPRFlGVUxjVW9CelBmd0ViYXlDMlZXSng2QThsU0tNOEdB?=
 =?utf-8?B?QnpvbW0zYXI0U2E3MDJrcWlyajg4ZWdnbTA2ODNabUdiVXRuV01rM3FYS25r?=
 =?utf-8?B?RFZmNHZlMlF5ZElTeEpsUGVxMENIQnEwa3ZWREhwSGx0cGhsNDM5Vk9SY3Rz?=
 =?utf-8?B?S2dmSzNEd0pEVTVHakVadmR1UXNrZHE3ZWExZXpoU1JjR2lST0JROVpZSUpw?=
 =?utf-8?B?cWZEbjMrRUNacGdTNG42K25LS0FOdWtObEtOMUg1MHM2YVorakQ1UFV1R3cy?=
 =?utf-8?B?d3FsTWxZT2o5YXpyb2Nsb3VPbEhzZnhCY2FvUjZnU0VKTFdPd3pYRWNsTWtJ?=
 =?utf-8?B?VGphdzlySEhaVmZpMWRDbFhwVWY1ZFNkSTRsb2ZlT3pJWHhob3J0d3ByNFRH?=
 =?utf-8?B?TUNxdDBCWHhpU3VDYzZvY3VuS1RyWjI2UDhNeVFqWUhPcW9aTDU5ZUpKK2dD?=
 =?utf-8?B?MVpxeURxNnU3TlBEQmlPTldudnJXVjc2TWhHbmpKaFZMeXhWVmp2RjNDcGF6?=
 =?utf-8?B?ZzBRQzJzYnR1V2Y5cDRIazZJdCs4OXNDSTd6RnJCTGNhVWpaNDVkdHQyenpX?=
 =?utf-8?B?OWpWTkh6U2JKUW0ydURXbUdGNmJxOXJxSVBQRHMrMTBSSHZ1VHNGc0FyV0Q3?=
 =?utf-8?B?V2UrajFoOVdka1IwcUlLcUZJV0llZE55dStZY0dKYTVOank3Ni9wVXVMeEJ0?=
 =?utf-8?B?NzVpSW9obkthTzdpaldTNWlhWkI5ODJLVTJwc1ZLYnlZaE81aUNvZkRVdlgr?=
 =?utf-8?B?UWN5N1IvTlZ4YkdDNTN0Q3pwTGtSWFIwbitqZkYxNTR3UnhucVZ2M3J2Vms5?=
 =?utf-8?Q?7mdOeFkRrbMiUx4FVCply8xaV35ShXowQ4Tt94Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OSswYS9LSkRWR0JVN080NWJTeU1Ob3crZlIyUkJvWE9uRUZQT3h3WHplUzFt?=
 =?utf-8?B?QXZHV0ozMkNIazMvVVpTOWtsTWdieUpOZzRHbDZLWmh2QVUzaUM1M3E5cEt0?=
 =?utf-8?B?RzRkWjVIQll4eHo4RzFqKzZHN2V4dExMMWZHUGhUamVxWUJ2ZWtJNlZuRGdE?=
 =?utf-8?B?TmRsQlhWS2JEejlRNVppWmwvZk5LNCtIV3lFaEJRd2djUnMzVHlFaTBPOXFQ?=
 =?utf-8?B?Y1l4WEduL3QvM0cvd2ZEU2tRNy9OTVZMdDI2eVppMnliQzQxMGtGc1pSVC9V?=
 =?utf-8?B?Y1NJNVlTMlhXMWFjQjR1WXRwN204ampmUHk0eXFINmM1Vnh0bERiS2grNW5l?=
 =?utf-8?B?ZjlIalgwdTlSbkNLRUJJRCtJMDJRNjFVaEJneHhndDl4OUtuWHM2MCthR1hI?=
 =?utf-8?B?NFdRSkhkMllJT1h0bEhZa096MWxibDY1QUZlVnB3SDhORFBPQU9VUDlEWWtF?=
 =?utf-8?B?WlJsMUZsOWcxZFhEZWVQNFNESkVudzUxY3lBazZxZ3cyL2dNL0NTYzdCODlr?=
 =?utf-8?B?RCt3T25Qa3ZHa2gvdno1SGVVcmYwOHd2eXg4QTZlaXd2RE54UmV6M1JPUDVS?=
 =?utf-8?B?d0U1YUFIQnV3K3U1RnZQbGhWUncvM2dXSWhDOTBKa1p0MHRROHI2WFlxaGMv?=
 =?utf-8?B?Njl4bWdSdGthOHd2NzZZMCtxSnVYS21tbjFSWFVleDU3eCtGYS9iVFg0YkND?=
 =?utf-8?B?OVNWTzlEK204YXJzT0d0QzNpWHJySzVMV3gyZ2Z4RnhNbHBIdE4zbktNVmlD?=
 =?utf-8?B?YnkrQWJmYmpqY1NveTBKQUd5cEJmR1ZUb0FJZExKM25uR2FCQkl2aFdMVDVM?=
 =?utf-8?B?ZmJQYk9wUENzQmJyYWNJTmFhU1VGQXc4MVlhMDk5VjVxSDV5aUo2SGZFRytG?=
 =?utf-8?B?ZW91TCt4eDBHckZUTVlSTFR6OHhicnFjQ244aUYzcDFkZTMwRXNHVW5id29N?=
 =?utf-8?B?K0Y0a00xRnpOUTBVRGw1K3dwMkxua2JhbmVoMm5yUmpaMTE5L2ZUK1RSTE83?=
 =?utf-8?B?QVBTNmJBMmNxK3FkU0tndU02UWVUazRGZ3VkUzY0YlZHUjh0M05UMnhLY0JT?=
 =?utf-8?B?bTN1bDRNL3pvSFhPZXJrQTlHT3NNUEZyTjVVbzIrNXVVWUZtbEtpb1Njd3dz?=
 =?utf-8?B?ODJ5NUxMZTVTZVhnckQ3RW9BbmZXTndXYW1KWTR2YnVINUFGZXJPSXlQNEdX?=
 =?utf-8?B?cTF2TENWdDNRMFpZdDJaRVJsZ2xMbjNtenFGdm5DWDA2azI3cUwwUUduQ0Q4?=
 =?utf-8?B?SUFCeHhJMW1ybDVvdzZKeTJ6bTIxVE9ENkIrNys0MmwxdDhEYWEwM0Y5aS94?=
 =?utf-8?B?UytNckNMWUsvR2duUmVzRnBWMEtyZmNBdXJVQlBEMVJ3TVZmQjRlR0E1ZGN2?=
 =?utf-8?B?RnVUZDAxZVJobzJuL3piM2NKS29MM3VMc0FQdlo5UE1GbEpIZWpBUmdsQmR4?=
 =?utf-8?B?Q1FSSFFXWmhCWUY1U0VtVm02QmJYci9tS1V2SERnd2QrMDVqWnExcEpUNTd0?=
 =?utf-8?B?cC9CeERnd0N3dFhpVVdtUml5R2pqdTBIaTBWd0FqdVpHTEhFblVyYlhTeUJs?=
 =?utf-8?B?VjRHNTFGN1dNN2FoVlZDbUs1c08rUkdLdkpvSGFZdHhCRmkyY2pWUEdadWV5?=
 =?utf-8?B?eGlXTEtxODV3QmVjR1RCeVZkTFo0b3dmSkdnbnAwQ0QwKzQ3dHNwZGJpa0s2?=
 =?utf-8?B?cGpJd1VGS0x5RXB0N0srY25KdEl2eUUxZWlVNTRiZE5hK2x2MGY5OEdWeXp2?=
 =?utf-8?B?cHArL2RWUlpZMFU2aTIyemZNMUJzS2Jld04xWXI5V0pGLzg3YUxYdzdIK1Uz?=
 =?utf-8?B?MWxIMDBLQlh5Wk81VnU3K2F4T0xPSG1HeXZZUmJMcThscDhuOG5sYnFsR1NO?=
 =?utf-8?B?eDh3bkpiVzN0dHgyTlo3R2ZqNUhxalk2cjJIN0tNWmlteVE5UjNhQmZ4Nm1q?=
 =?utf-8?B?TDRGRFJUS01uQlBnY0FBVGlaZmRoNVpyNWVmQVJaN01hWnBBUDRCRjlGWGwx?=
 =?utf-8?B?R2N4Z0V3UkZBb0ZaU1grZE5jVDVmKzl4bmtta2VCdThCcS9YUjFndlJKQVZq?=
 =?utf-8?B?TVVhMDI5L1hXdXgvVzAyRThkKzVWbjJ5d0xVZTExTVR3dEdXUlFDTVI2Z0d0?=
 =?utf-8?B?SlhuV0J4c3lCNGZpSGNVYjZ0ZzVMMUpmKzdwSEZ2OFJsUTJjaTE5Y3lqVEJS?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd5f767-0f52-4e4b-d691-08dcf8d80eaa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 11:43:22.5439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIjXUJYduPZdwZXzylqCXHJVO28RsY9CtlcghiZs8TmwiHjBsqJZzFJNm9HptsXiksT0G1MDe+8j56X8+7N+tb15xp9CXjnYfaWOy/I3M/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8003
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

On Mon, Oct 28, 2024 at 11:56:04AM -0500, Bjorn Helgaas wrote:
> On Fri, Oct 25, 2024 at 11:50:36PM +0200, Michał Winiarski wrote:
> > VF MMIO resource reservation, either created by system firmware and
> > inherited by Linux PCI subsystem or created by the subsystem itself,
> > should contain enough space to fit the BAR of all SR-IOV Virtual
> > Functions that can potentially be created (total VFs supported by the
> > device).
> 
> I don't think "VF resource reservation ... should contain enough
> space" is really accurate or actionable.  It would be *nice* if the PF
> BAR is large enough to accommodate the largest supported VF BARs for
> all possible VFs, but if it doesn't, it's not really an error.  It's
> just a reflection of the fact that resource space is limited.

From PCI perspective, you're right, IOV resources are optional, and it's
not really an error for PF device itself.
From IOV perspective - we do need those resources to be able to create
VFs.

All I'm trying to say here, is that the context of the change is the
"success" case, where the VF BAR reservation was successfully assigned,
and the PF will be able to create VFs.
The case where there were not enough resources for VF BAR (and PF won't
be able to create VFs) remains unchanged.

> > However, that assumption only holds in an environment where VF BAR size
> > can't be modified.
> 
> There's no reason to assume anything about how many VF BARs fit.  The
> existing code should avoid enabling the requested nr_virtfn VFs if the
> PF doesn't have enough space -- I think that's what the "if
> (res->parent)" is supposed to be checking.
> 
> The fact that you need a change here makes me suspect that we're
> missing some resource claim (and corresponding res->parent update)
> elsewhere when resizing the VF BAR.

My understanding is that res->parent is only expressing that the
resource is assigned.
We don't really want to change that, the resource is still there and is
assigned - we just want to make sure that VF enabling fails if the
caller wants to enable more VFs than possible for current resource size.

Let's use an example. A device with a single BAR.
initial_vf_bar_size = X
total_vfs = 4
supported_vf_resizable_bar_sizes = X, 2X, 4X

With that - the initial underlying resource looks like this:
            +----------------------+
            |+--------------------+|
            ||                    ||
            |+--------------------+|
            |+--------------------+|
            ||                    ||
            |+--------------------+|
            |+--------------------+|
            ||                    ||
            |+--------------------+|
            |+--------------------+|
            ||                    ||
            |+--------------------+|
            +----------------------+
Its size is 4X, and it contains BAR for 4 VFs.
"resource_size >= vf_bar_size * num_vfs" is true for any num_vfs
Let's assume that there are enough resources to assign it.

Patch 4/7 allows to resize the entire resource (in addition to changing
the VF BAR size), which means that after calling:
pci_resize_resource() with size = 2X, the underlying resource will look
like this:
            +----------------------+ 
            |+--------------------+| 
            ||                    || 
            ||                    || 
            ||                    || 
            ||                    || 
            |+--------------------+| 
            |+--------------------+| 
            ||                    || 
            ||                    || 
            ||                    || 
            ||                    || 
            |+--------------------+| 
            |+--------------------+| 
            ||                    || 
            ||                    || 
            ||                    || 
            ||                    || 
            |+--------------------+| 
            |+--------------------+| 
            ||                    || 
            ||                    || 
            ||                    || 
            ||                    || 
            |+--------------------+| 
            +----------------------+ 
Its size is 8X, and it contains BAR for 4 VFs.
"resource_size >= vf_bar_size * num_vfs" is true for any num_vfs
It does require an extra 4X of MMIO resources, so this can fail in
resource constrained environment, even though the original 4X resource
was able to be assigned.

The following patch 6/7 allows to change VF BAR size without touching
the underlying reservation size.
After calling pci_iov_vf_bar_set_size() to 4X and enabling a single VF,
the underlying resource will look like this:
            +----------------------+ 
            |+--------------------+| 
            ||░░░░░░░░░░░░░░░░░░░░|| 
            ||░░░░░░░░░░░░░░░░░░░░|| 
            ||░░░░░░░░░░░░░░░░░░░░|| 
            ||░░░░░░░░░░░░░░░░░░░░|| 
            ||░░░░░░░░░░░░░░░░░░░░|| 
            ||░░░░░░░░░░░░░░░░░░░░|| 
            ||░░░░░░░░░░░░░░░░░░░░|| 
            ||░░░░░░░░░░░░░░░░░░░░|| 
            ||░░░░░░░░░░░░░░░░░░░░|| 
            ||░░░░░░░░░░░░░░░░░░░░|| 
            |+--------------------+| 
            +----------------------+ 
Its size is 4X, but since pci_iov_vf_bar_set_size() was called, it is no
longer able to accomodate 4 VFs.
"resource_size >= vf_bar_size * num_vfs" is only true for num_vfs = 1
and any attempts to create more than 1 VF should fail.
We don't need to worry about being MMIO resource constrained, no extra
MMIO resources are needed.

-Michał

> > Add an additional check that verifies that VF BAR for all enabled VFs
> > fits within the underlying reservation resource.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/pci/iov.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> > index 79143c1bc7bb4..5de828e5a26ea 100644
> > --- a/drivers/pci/iov.c
> > +++ b/drivers/pci/iov.c
> > @@ -645,10 +645,14 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
> >  
> >  	nres = 0;
> >  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> > +		int vf_bar_sz = pci_iov_resource_size(dev,
> > +						      pci_resource_to_iov(i));
> >  		bars |= (1 << pci_resource_to_iov(i));
> >  		res = &dev->resource[pci_resource_to_iov(i)];
> > -		if (res->parent)
> > -			nres++;
> > +		if (!res->parent || vf_bar_sz * nr_virtfn > resource_size(res))
> > +			continue;
> > +
> > +		nres++;
> >  	}
> >  	if (nres != iov->nres) {
> >  		pci_err(dev, "not enough MMIO resources for SR-IOV\n");
> > -- 
> > 2.47.0
> > 

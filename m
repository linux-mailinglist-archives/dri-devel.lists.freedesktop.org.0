Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8937BAAA8C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 23:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E727A10E118;
	Mon, 29 Sep 2025 21:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RcAOYiEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494C410E118;
 Mon, 29 Sep 2025 21:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759182295; x=1790718295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aSBguJGl0t34kgNZhLnWw8WDqqQsYyb7TnvWj33tFAo=;
 b=RcAOYiEx8AEXKs+rsmTLPxrPtprd8rQJdX7TMyA6RHE8O3ZrS10btpaw
 unhqEnaPcjFcuUg8c1Hi/lGEOsLpKDLdLW9UKbYOPqnva4iWbc4esOb0q
 ngmh6bXaYkyolutjXvp9/EdDCqj2hEbYA1XrJFzrBBmLqYwZ74/XvculZ
 l0vtmG7Nw+fJOriuhXkH6PteAOhrylneDszlMA/3eotFyc+N12zcyZBqk
 KeR5qviEgW295BsgVudHU93KnOi7VIPH/bi2PCge3YFlWPKVyPPD1/Z/x
 0Ebh4a+OWtKwjAGU5jB5Xf+oQWV7BbRT8Bo1eIO7IeBJLvVdxWlNWFkp/ A==;
X-CSE-ConnectionGUID: 1ALx3haBRlO0ouAx1IjRXQ==
X-CSE-MsgGUID: ouNFuASYQ7qKSN/QkfJGjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61388941"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61388941"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:44:52 -0700
X-CSE-ConnectionGUID: l9OW5sEUTiOkzaVjZt2rFQ==
X-CSE-MsgGUID: OoEIPFbVSXqx0K2LQPTXjQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:44:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:44:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 14:44:41 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:44:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qz3eXpotMuCgtLzvFJY61Yjj2I1Gg+1Hac8kI1DqsU8ECYL1Hav0TgxPx/Sq23Gn+Kh7vreRibGy/JtyRrTQLpHJOtqYMuO4NFAJqtu8W6AHdNxHfm7aGGWryH5iTKUmAKi0stGD9O9WOGFywdNNxJqSd4f22SIGm0ogMI5Mf/UoxJchtzq8bU7etpyaJAv9jfCuSMTkQDUAYRYoQjaMTCvy1f3pf5cuseJtrI3YiBkFpWTKlR3z8cTzYbzWXEjcfqIoAVITuaejaT54RIdNeOyuh4kjSw7w0EYWVIOxKD7LuOz0DqUOwowmn2Nib4qVQP1e+DrxQdvE9KBI8d5a/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0j/EC5bZtEA7tPzQ1oQTxZeE5lzD5OoRj5BL5TJKKqU=;
 b=Uqdq+fHzwpTUxzu1Jo3UQFTZEWTgc/Q7CEExx29IqqZiIRakwSPnXqxM8uu4qs7eP6/Bzi8Ov6CCUFkWpP3FDP/kPKJ3XwrJIs7DdFyAAx7RfY12ZmSvApSxuCVoyq7/LjagX/dNHkIOrr61jotgFk6cpUP4tgXharirqbJUi/XyEzlN7XBfIv4Jo0SErAqYhaXKHzThSR3d+d2rCQAN36EqrHAqkC4FgoczsPUG/S9EvQj8zn3PE3Zte28f1Db4afSXyeMrxWFD2kzCSoGvFxLGlJ6Csztpjytszwks8PFEHmxx+W5MxD+IN3KT7qfkbnegtaonth2Oxzgrn7H6/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by LV2PR11MB6069.namprd11.prod.outlook.com (2603:10b6:408:17a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 21:44:39 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 21:44:39 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH 2/2] drm/xe: Introduce the usage of drm_ras with supported HW
 errors
Date: Mon, 29 Sep 2025 17:44:14 -0400
Message-ID: <20250929214415.326414-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929214415.326414-4-rodrigo.vivi@intel.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:a03:331::9) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|LV2PR11MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bfff1c9-4cee-43c7-db5e-08ddffa1643c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Si9RN2t4ZDZrMExxQjUxeXdrS2w3Yjdyc3gzdW1ycXdSVFh5OVp0c09iT3E0?=
 =?utf-8?B?RWRxZWFJNjFHeUpXZjhXN2hNKyt5bndXeFVTTFBkdklRSnQ1V2Z0bURKT3Bn?=
 =?utf-8?B?SEU5dUthRXRMMFR4ZWwvQTk5VVUxNmtQajU0alo1TEtWMVRiOGZZaTdrNFZE?=
 =?utf-8?B?c1Z4U0RoL1QwdEcrM3htcTlPY2lWSjJGaTJHN1M2MVdNR1hwMFA5dFpXVHlJ?=
 =?utf-8?B?MlQwUzhMSVdydzBSZWNkWDB5d1o5b0s4YVhLTFo0ZVZVVE1ZLzVWbFhGQlFZ?=
 =?utf-8?B?dFRZckQxdEthZTQ2NnNDajB2WVBYb3JrQjk0RU9nN0hKcXdIeWxseU5YOUNm?=
 =?utf-8?B?WnppanZhN2Fwa1pYSXhXdEJQLzBWR3Z4NHFYYmRFckloSnduYjJ1YVFmYlZ5?=
 =?utf-8?B?TzhVOG5GV01wdE1KbWJnQVNRZXRHWlhtdHppUWlLcEZycUN0R1htdVVOaCt5?=
 =?utf-8?B?TG9mZmdKcXpiTUxNUXZqWDNXcnlOTjJlbzZJcHh0OTYyV1VBVjRCSVNtYjRD?=
 =?utf-8?B?cmwyYU1kRllmM21ISW9uSnphdFhsNm9LcmNzTWFmRWRoVCsram5xVGU0Rmk0?=
 =?utf-8?B?OUt5Q1krZ09PZzRKa1hYVjEram9JcS9NS0kzblFaVGZuNjNmZnMyVU1LWDVu?=
 =?utf-8?B?aDR0K1UwcWlQYThWMCtNc3NNUzZEeHlMTDYyS0MzODZ6RDdkcTdaWE1UbEVX?=
 =?utf-8?B?S2FrZkxhK0lHOGVtUDFTaVJCOElTRDBKdmZuUlpzdnlrbWpKVXUrRFNzVE5a?=
 =?utf-8?B?R0FzT0ZYYWdoK1QwZDVpM2pmajJ3dGwzY1F2K29jUHord0YwdDJacXVKekpI?=
 =?utf-8?B?bGJrL2RZVDZSU0lOTVJlY0ZvcC9hUDdlLzdkU0sxSU5kT0NWZzdnblBIVWdV?=
 =?utf-8?B?YzFzU2tRSS9RK0FxSWtzbnkwUkZkb0RhVjRNcDBTa0J2eXBzVThRbytJaHY0?=
 =?utf-8?B?Nmp3SEplcFJGV2dYU2RWZDlwZ0YxYmluaEQ3N1FrUnVGaldabUJCVHBobFJ1?=
 =?utf-8?B?WFFRdjFneUc4dmFVejcyMWlXVTNHemVKTmdTcGVQZDhVY0NVdUx0YjQ5eCs2?=
 =?utf-8?B?bll6RFNxN2I0c2IwalljRjZDd3JDR0x5N1p0ZWRvUlJZRk1zbjdmMTVuN0pz?=
 =?utf-8?B?blR5WVV2WWVwOTZmV0ZhUGtlckhBQWI5dkVlb0QycXhEUjlMaDJjSktLU1FF?=
 =?utf-8?B?dDBNNnh1T25ZYkdXV2Z0cmxML3poWHRzdSt3azhNRDdraGJxZGJSd1h6d0JH?=
 =?utf-8?B?V2Q4b2dYMjZYT0VrZmsvK1RKSDR2d1c0b01aUU9WVll2bkdMeVFsbE9kREpk?=
 =?utf-8?B?RVBkZzJuamNOTGkybFdUZms3Mi9FMng1Y1htTUc1QnFuSDBSaEIzQTc3TXMx?=
 =?utf-8?B?dmxORWVnM0IyRVBHb0pvT0Rva2RBNXpjYmZ5TlR6andzaXY1c3pnZFNYa1RY?=
 =?utf-8?B?djFVL0NqblF6bTR5TFVEM2h2U0hISEU2eU9iak9DaFlnT01HbnJ3RXdyTk5z?=
 =?utf-8?B?NjdQUkM0eWxTMjhWeXRuWU9ZbjFnbFNrMExobjBDakdCeEE2RzJVUStrY1Ju?=
 =?utf-8?B?MWtkRVo5Qk5wQlRGeFlGcnBkRE03eHVsY2tqenZBVEJ1N25zNjdFU3EwZzc0?=
 =?utf-8?B?eElrT095REQ2OEQxUmVVUVp0czI4alRKNXoxRkJGMXdMamVHOXFKdEsxQkVG?=
 =?utf-8?B?VXZvMXBFMlhWTEVsNWp6NzluanhiUjBjZmR3cUhLVkpaNHBnV1g4RGdUMlhj?=
 =?utf-8?B?NVE2czVOY1Y1K01BZ2tGRmQ2UnFPbER1YU9Ld1ViSm5wcit0aDBJYTdSbThv?=
 =?utf-8?B?cis3UVYxZ2l1djBaTjBpaVc4SjlLSmkxQWFyaXVUVnhtMElIR1dNRldYN2FQ?=
 =?utf-8?B?T1JvSHo5SlhnVHpvRWN5a3VoYzg1dEhTWTJYV3VWMzdrSUo2SWhIRVozOU1E?=
 =?utf-8?Q?PCRG+xoVMW+NYWaIL8CP4IQADSRe0LlS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHYrR1N6WjBqUFRPOExiaGl1ZE9qSGNIS0s1Tjh3Tkx1Y3hiR2UyYjhiZFl6?=
 =?utf-8?B?Qk1VbXNoZXpUM0tST3A1T0Z2b05xYTZEWVU5U3N4c0hLdloyWVdwMyt4aGFD?=
 =?utf-8?B?SUxKR3cvbS9KZFI0QUdUTU5MWXVacVdpeWVWeGpjaEFlTU0rV0thTUo1YUlu?=
 =?utf-8?B?czQ4cm1RUU5UdDV1UURZenRjblZ6b3MvQW55bFpTSzB2dDFZR2M2aFJYQkQy?=
 =?utf-8?B?OGJpUGNpdUV6OWg4STZCQnRsS01RK25mSzJQOU1zTk82SGwraGo4aVZ3ZGRV?=
 =?utf-8?B?bE82ZXBiVUVjSlZsV29kYlhJU3pSS2JBMjdjRzZEWmE1NlBFNWt4YjVkbjQy?=
 =?utf-8?B?WVYzRVhEL3JkZzBtYWZaOGZORnYyMXpTekJkWmdoUkRiYkhKeGVCTEUvN3lF?=
 =?utf-8?B?UDRkUkU2dFFDZFZ3QytDWDN3Mmx6U3VyWmZzMllrVEdCOVAyR2kycEtsT2Y2?=
 =?utf-8?B?a0l0S01BaGtWUjVzRUR0Z3JSN04yVitXa0k1d0dzM1JCbHpOQmVtUFJQc2ZO?=
 =?utf-8?B?TWNNNkpYdU5lRVkwTGV1TlFJRUU5a0h3aks1L3VscFFNcHc2djNHY1JUaXVM?=
 =?utf-8?B?aU1PY1F0S3dsUExsd05qa1J0RERUVWZMVGdFWkRNbGhPdjFGRk9VdXNzRSt5?=
 =?utf-8?B?NkU4bk1va3pmckI3ZWsxelA4RWVuaDFkUnBkc2NKTW9NWEV2VldUMDYwTXRR?=
 =?utf-8?B?TXJWWmk2UFFQV3B0NEg0cXZLQ1pFVUZYQkxhV3VwVmJZbWdzanBZbEtLZHJ5?=
 =?utf-8?B?ZGpXN04yWFB4TGMxdE1IUHVNbGEzb1ZBbUxxUnRDT3p5dVpEUzdkQnhxNUlG?=
 =?utf-8?B?V0hYa29kRndDM1puU3dHcGhXYWc1TWNPT0xTTDZBV1pxSVJYQjBQcjNzQk8y?=
 =?utf-8?B?K0tZK1pPSlByVnpOeGlUZWpSdTBsWmc2c1F3UndvUUVBK1FpbFk1enlrKzRw?=
 =?utf-8?B?bzJGK09kc1owWWhyMHIzcU5jUDYvcVlJQ1VjTnluZ1hNMDJDRFJkRVZjWEgw?=
 =?utf-8?B?cFQveEhacmtkbXYzdW5RS2Q0NkgrZmwzRXBQcExKN01pSjVnQnFqM083Mjlt?=
 =?utf-8?B?bXJQM3lvelp5dk5Ba3VlejAyVlZWNEhrQ1p4YmxHUjVnQmhrTkp6R1R5VE9s?=
 =?utf-8?B?b0kyWGd1VGp3VmprcVhJVC9sU05qUVBjT2RlaGlQLzFuck83dHozbTR5OExk?=
 =?utf-8?B?VGVxVFFIRXQrVGRtYTlha1lyaTJDWTFsTmVOT1d5QitjaVk1TFNVVDJ6YmtB?=
 =?utf-8?B?RFpqbjRMQ1FyeDdnL2dXRjNHNDd1WlhmN3h5YzQ3czlWeDBSQVE5UXlIRlc3?=
 =?utf-8?B?Q3lwWkFtaEFDWnZpZjVRemxRSWFxdnQ2WDB1bnlVbURNM2VaV1MvcEs3M0V1?=
 =?utf-8?B?RDJKdzJCaXZXZkhEM0tmS3IrendIZm5NdDlHdUpzOGRtSEo2ZmR5aXF6cnZs?=
 =?utf-8?B?YlJKTjVHalpzK2pmVE1hRks0NVNPR2dVenl4Qzk0NmwweVBJRC9xODVFbTQ0?=
 =?utf-8?B?MUQrTUJEKzB6aGg0emNGM1FMRjNpY1hocnowUjBLSWNOc2o4MzVhWDhBMllT?=
 =?utf-8?B?djdWdHJzNTkrQjhpaW8vbG9yY2F3QkwraG1MZ2dwZ2l6VENDNk5rZzczbGM0?=
 =?utf-8?B?ZW9HeVZPbCsxYTVoSG00cDhHNzR4WVFoWGI5RzloU1plUlBsSXJQTi9WSlRW?=
 =?utf-8?B?bjZ2R1NBd0E5OW9tejFONE9ERU10NlptM3diZHd2SVphRmhIVHFyelE1QzEw?=
 =?utf-8?B?ZlYvRVNPZWQ3RlBYL2h4eHRRalBjc08rOTRmbjN3WlZpM1IzNDBtT2s3RDUv?=
 =?utf-8?B?Z0JubnIrMThMbnRNZm1ibEMwWTBHRXVHMmxKK1Z2WmpDN0t6NWcxQldGcjVj?=
 =?utf-8?B?MVdDV2daSWNtUlJJeXNXalpUc1Ezam9GdHgwQ1k1SDlBVkZJVFFjSGVXaVJo?=
 =?utf-8?B?dG5XNThJOTFKRHNrcHVSWjZDV2pVOXZYRldvbUVOd0VheS8yOWl0dHVVdmlC?=
 =?utf-8?B?dkF2OWtud2NQNHRXeHFzOXhzUW82ZE1QNmxDVHFQQ1pUNW9BN0xMNGQ4M3NG?=
 =?utf-8?B?RnZtZEU4R0txb1l5eHVhNmpSNVdWd3ZaNWJycHgveHBrczNscEZiNVkyL3Nl?=
 =?utf-8?Q?Sxi7ha87M7WEWOEVi93gPoaO2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfff1c9-4cee-43c7-db5e-08ddffa1643c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 21:44:39.5038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bV2iATVy269Mo7qqNtaozN/YRtCLFdZKn6idmmLvKZBmfHDzW/hT8CRpLC0cw61ukV0g4IezOkM+sjHlYapZCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6069
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

All MTL+ devices supports these correctable and non-fatal error
notification over the IRQ. None of current supported platforms
support error counter directly in the HW.

But since we are already supporting the error interrupt for
these errors, let's incorporate the counter inside the driver
itself and start using the drm_ras generic netlink to report them.

Keep the CSC_work only for discrete devices.

Cc: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  22 +++
 drivers/gpu/drm/xe/xe_hw_error.c           | 155 ++++++++++++++++++++-
 2 files changed, 175 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
index c146b9ef44eb..860fc3b8a3c4 100644
--- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
@@ -16,5 +16,27 @@
 #define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
 								  DEV_ERR_STAT_CORRECTABLE, \
 								  DEV_ERR_STAT_NONFATAL))
+#define   XE_SGMI_DATA_PARITY_ERROR		BIT(25)
+#define   XE_MERT_ERROR				BIT(20)
 #define   XE_CSC_ERROR				BIT(17)
+#define   XE_SOC_ERROR				BIT(16)
+#define   XE_SGCI_DATA_PARITY_ERROR		BIT(13)
+#define   XE_SGUNIT_ERROR			BIT(12)
+#define   XE_SGLI_DATA_PARITY_ERROR		BIT(9)
+#define   XE_GSC_ERROR				BIT(8)
+#define   XE_SGDI_DATA_PARITY_ERROR		BIT(5)
+#define   XE_DISPLAY_ERROR			BIT(4)
+#define   XE_SGGI_DATA_PARITY_ERROR		BIT(1)
+#define   XE_GT_ERROR				BIT(0)
+
+#define DEV_ERR_STAT_NONFATAL_VALID_MASK \
+	(XE_SGMI_DATA_PARITY_ERROR | XE_MERT_ERROR | XE_CSC_ERROR | XE_SOC_ERROR | \
+	 XE_SGCI_DATA_PARITY_ERROR | XE_SGUNIT_ERROR | XE_SGLI_DATA_PARITY_ERROR | \
+	 XE_GSC_ERROR | XE_SGDI_DATA_PARITY_ERROR | XE_DISPLAY_ERROR |	\
+	 XE_SGGI_DATA_PARITY_ERROR | XE_GT_ERROR)
+
+#define DEV_ERR_STAT_CORRECTABLE_VALID_MASK \
+	(XE_CSC_ERROR | XE_SOC_ERROR | XE_SGUNIT_ERROR | XE_GSC_ERROR | \
+	 XE_DISPLAY_ERROR | XE_GT_ERROR)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 8c65291f36fc..615d10cd83f0 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -3,7 +3,13 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <linux/atomic.h>
 #include <linux/fault-inject.h>
+#include <linux/find.h>
+#include <linux/types.h>
+
+#include <drm/drm_managed.h>
+#include <drm/drm_ras.h>
 
 #include "regs/xe_gsc_regs.h"
 #include "regs/xe_hw_error_regs.h"
@@ -46,6 +52,93 @@ static const char *hw_error_to_str(const enum hardware_error hw_err)
 	}
 }
 
+struct error_info {
+	const char *name;
+	atomic64_t counter;
+};
+
+#define ERR_INFO(_bit, _name) \
+	[__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
+
+static struct error_info dev_err_stat_nonfatal_reg[] = {
+	ERR_INFO(XE_GT_ERROR, "GT Error"),
+	ERR_INFO(XE_SGGI_DATA_PARITY_ERROR, "SGGI Data Parity Error"),
+	ERR_INFO(XE_DISPLAY_ERROR, "Display Error"),
+	ERR_INFO(XE_SGDI_DATA_PARITY_ERROR, "SGDI Data Parity Error"),
+	ERR_INFO(XE_GSC_ERROR, "GSC Error"),
+	ERR_INFO(XE_SGLI_DATA_PARITY_ERROR, "SGLI Data Parity Error"),
+	ERR_INFO(XE_SGUNIT_ERROR, "SG Unit Error"),
+	ERR_INFO(XE_SGCI_DATA_PARITY_ERROR, "SGCI Data Parity Error"),
+	ERR_INFO(XE_SOC_ERROR, "SoC Error"),
+	ERR_INFO(XE_CSC_ERROR, "CSC Error"),
+	ERR_INFO(XE_MERT_ERROR, "MERT Error"),
+	ERR_INFO(XE_SGMI_DATA_PARITY_ERROR, "SGMI Data Parity Error"),
+};
+
+static struct error_info dev_err_stat_correctable_reg[] = {
+	ERR_INFO(XE_GT_ERROR, "GT Error"),
+	ERR_INFO(XE_DISPLAY_ERROR, "Display Error"),
+	ERR_INFO(XE_GSC_ERROR, "GSC Error"),
+	ERR_INFO(XE_SGUNIT_ERROR, "SG Unit Error"),
+	ERR_INFO(XE_SOC_ERROR, "SoC Error"),
+	ERR_INFO(XE_CSC_ERROR, "CSC Error"),
+};
+
+static int hw_query_error_counter(struct error_info *error_list,
+				  u32 error_id, const char **name, u32 *val)
+{
+	*name = error_list[error_id].name;
+	*val = atomic64_read(&error_list[error_id].counter);
+
+	return 0;
+}
+
+static int query_error_counter_non_fatal(struct drm_ras_node *ep,
+					 u32 error_id,
+					 const char **name,
+					 u32 *val)
+{
+	if (error_id >= ARRAY_SIZE(dev_err_stat_nonfatal_reg))
+		return -EINVAL;
+
+	if (!(DEV_ERR_STAT_NONFATAL_VALID_MASK & BIT(error_id)) ||
+	    !dev_err_stat_nonfatal_reg[error_id].name)
+		return -ENOENT;
+
+	return hw_query_error_counter(dev_err_stat_nonfatal_reg,
+				      error_id, name, val);
+}
+
+static int query_error_counter_correctable(struct drm_ras_node *ep,
+					   u32 error_id,
+					   const char **name,
+					   u32 *val)
+{
+	if (error_id >= ARRAY_SIZE(dev_err_stat_correctable_reg))
+		return -EINVAL;
+
+	if (!(DEV_ERR_STAT_CORRECTABLE_VALID_MASK & BIT(error_id)) ||
+	    !dev_err_stat_correctable_reg[error_id].name)
+		return -ENOENT;
+
+	return hw_query_error_counter(dev_err_stat_correctable_reg,
+				      error_id, name, val);
+}
+
+static struct drm_ras_node node_non_fatal = {
+	.node_name = "non-fatal",
+	.type = DRM_RAS_NODE_TYPE_ERROR_COUNTER,
+	.error_counter_range.last = __ffs(XE_SGMI_DATA_PARITY_ERROR),
+	.query_error_counter = query_error_counter_non_fatal,
+};
+
+static struct drm_ras_node node_correctable = {
+	.node_name = "correctable",
+	.type = DRM_RAS_NODE_TYPE_ERROR_COUNTER,
+	.error_counter_range.last = __ffs(XE_CSC_ERROR),
+	.query_error_counter = query_error_counter_correctable,
+};
+
 static bool fault_inject_csc_hw_error(void)
 {
 	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
@@ -97,6 +190,29 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 	xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
 }
 
+static void hw_error_counter(struct xe_device *xe,
+			     const enum hardware_error hw_err, const u32 err_src)
+{
+	struct error_info *err_info;
+	unsigned long err_bits = err_src;
+	unsigned long error;
+
+	if (hw_err == HARDWARE_ERROR_NONFATAL) {
+		err_info = dev_err_stat_nonfatal_reg;
+	} else if (hw_err == HARDWARE_ERROR_CORRECTABLE) {
+		err_info = dev_err_stat_correctable_reg;
+	} else {
+		drm_err_ratelimited(&xe->drm, HW_ERR
+				    "Error from non-supported source, err_src=0x%x\n",
+				    err_src);
+		return;
+	}
+
+	for_each_set_bit(error, &err_bits, 32) {
+		atomic64_inc(&err_info[error].counter);
+	}
+}
+
 static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
 	const char *hw_err_str = hw_error_to_str(hw_err);
@@ -118,6 +234,8 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 	if (err_src & XE_CSC_ERROR)
 		csc_hw_error_handler(tile, hw_err);
 
+	hw_error_counter(xe, hw_err, err_src);
+
 	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
 
 unlock:
@@ -162,6 +280,36 @@ static void process_hw_errors(struct xe_device *xe)
 	}
 }
 
+static void hw_error_counter_fini(struct drm_device *dev, void *res)
+{
+	drm_ras_node_unregister(&node_non_fatal);
+	drm_ras_node_unregister(&node_correctable);
+}
+
+static void hw_error_counter_init(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	char *name;
+
+	name = kasprintf(GFP_KERNEL, "%02x:%02x.%d",
+			 pdev->bus->number,
+			 PCI_SLOT(pdev->devfn),
+			 PCI_FUNC(pdev->devfn));
+	if (!name) {
+		drm_err(&xe->drm, "Failed to allocate memory for device name for drm_ras\n");
+		return;
+	}
+
+	node_non_fatal.device_name = name;
+	drm_ras_node_register(&node_non_fatal);
+
+	node_correctable.device_name = name;
+	drm_ras_node_register(&node_correctable);
+
+	if (drmm_add_action_or_reset(&xe->drm, hw_error_counter_fini, xe))
+		drm_err(&xe->drm, "Failed to add action for hw error counter fini\n");
+}
+
 /**
  * xe_hw_error_init - Initialize hw errors
  * @xe: xe device instance
@@ -173,10 +321,13 @@ void xe_hw_error_init(struct xe_device *xe)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
 
-	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
+	if (IS_SRIOV_VF(xe))
 		return;
 
-	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
+	if (IS_DGFX(xe))
+		INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
 
 	process_hw_errors(xe);
+
+	hw_error_counter_init(xe);
 }
-- 
2.51.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE928AFCDE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 01:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF0E11376A;
	Tue, 23 Apr 2024 23:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="keHTHPXz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C454510FC0A;
 Tue, 23 Apr 2024 23:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713916199; x=1745452199;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YcFIGq8Q1mJaBf0PsL1QgjdAMQrD519Cg6yoFev3jRs=;
 b=keHTHPXzCeYu6sZ95FIcA67Dltufsxhrf4zdjJ9VBi5KMA3uDlOXanwo
 BsYpmXVeMLA9GxgTmLG5rB1BTDLIrgNQ1FhJ5ttkQQa/TXuSNjjPI15me
 OCgEy/4BbmFowxmPSzYrLG0xlccIvXM6M1EVHJMkPEUsfOsI9XdltX5uV
 1eaF62P+Q7Q3xd1FB1ME6vQFNuTGOSQSbyT81GtbMYGZ8gwmXoigUrgz4
 5CzaXIFZ6hnQVk9T5WmJC5/jFo+uKGx7qbvSKRO+irfNgKjKIjwSW8hT/
 yXnz649/BTtCps9KziTgSF3hw5eVfGOmIR7a10fLMdCTKNwkCB/2YP25I w==;
X-CSE-ConnectionGUID: E0zyC09LTcytYtwBnKMReg==
X-CSE-MsgGUID: jhaqKiVASvSSz/MhCmf63w==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9400343"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9400343"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:49:58 -0700
X-CSE-ConnectionGUID: fdH3nOUESPOcjXzf5NBqPw==
X-CSE-MsgGUID: +09/pSwoSL2CSLwCmhJ+kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="55729876"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 16:49:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 16:49:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 16:49:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 16:49:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iybnyFRuJl6Kr23SJbkQJztgqt3Xujm0KPAmICgw0ZTTpbeW7mQN1jWVGy3aEPOzd0+gWW9hn64R8kNPEQGuocooPR7g+SPl9GyZR9aKlRsGY0MfkvsPbJHvCVKLTcM21fdQv6PKVEJc9GvHpsqYKx2couKLENSvcRkqwuzjUQnpm13L5cijDnhrVAmJh9fVlCn1KbOQXqKrQppOMTzgGuXXkqS/USLZYTuirtLr6qOtV4vXEqZXF13GryItBZpfx0bgaMB39W2jTzCKxg+GB69UKDaMRLI4SZ/KwJkLJDERAK/qjRM34/9g4xKDN2vK1N/SGBTGVt9RLMTZ6NpbFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CW4NbqKE/WsOYtyYFG1h+EBfS1o442hhMmavb1PVRIM=;
 b=GwU2ro04xWffbULii4vG3h8rRqMyJxE+SOWZPCyESY11wpVzCqwygKOIUNba8CNtz+AF0hGZq8mY38nk5flehGqm4i+uVCwNvMnp6r/KCQM4UItH7SZ+9oJf0We8/1BW8mzImJxFqo9Cjtybkct6fusGwaDx72E9y5g2UFcwbqVZekqc9hSWjUqRfKuLQu6VMhBmmyxn71PTPAI4NTLHHHAsqoe32ZQVu9SXNCzuREdB6LasQX1+FH2lcDBuksEy8CEmFjb8qKb0DZG+pRD5b8w9DkYLPFZjfVIw6EY6K5pHp6yLAUQGrNayEZ5XB+DcUG0+zOwIsZbFfzIaAqQjnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB8569.namprd11.prod.outlook.com (2603:10b6:510:304::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Tue, 23 Apr
 2024 23:49:55 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b7ca:3c22:811c:2d1b]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b7ca:3c22:811c:2d1b%7]) with mapi id 15.20.7519.021; Tue, 23 Apr 2024
 23:49:54 +0000
Date: Wed, 24 Apr 2024 01:49:51 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <airlied@gmail.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 4/4] drm/xe/FLR: Support PCIe FLR
Message-ID: <2sls3mnsjhd3zo2e7qel5zsc5zgrtv7sby3xvsh2yf5elnvjks@mulhpzx3lxjk>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-5-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240422065756.294679-5-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: 3539ad7c-2857-435f-58ab-08dc63f012cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHhwLzRDTmwxZ0FzYUkwUWUyV1ZCaDZpM3NmR3NDZWhHUmg5azlKM2RKeWZG?=
 =?utf-8?B?N0hoVC9rVXVaTlFLYlJqRGZza0kwamwvYVF1VlJuSDlCQ3RjSFRDVkc2RkFl?=
 =?utf-8?B?OXFWa2RGelJsS0UxSklxTVZuMmkraTFYeXM5SnRYU0RWWVc0UjRhVHVWSjlk?=
 =?utf-8?B?QVY2N1hISXNsWEd4U29oKzVocDhWY0gwa1RrUnNNZ2tmL01GbnlDYXJ3NnF1?=
 =?utf-8?B?ZkRsM3NyMjN3SGx4LzgzWVV5aWJBQ3VMMEpLMTRPMFN6V3RsbzdXaGpqbDk5?=
 =?utf-8?B?U0xwYXhORWxaaHhpL0g1bEZwZjVzQ3V5WUgxeTFyTU55VDVYNmJVdXNrTFhS?=
 =?utf-8?B?L0VaZktMN1BhZURDVDMvZU5OZzJtdVdrYTBaaVdaeVhRa1RrVEZKb2tGMmMr?=
 =?utf-8?B?K0xwUEFrMVhxTjVUTVdHZThxRlBFYmNZdk5waC9ST1BvOFdUTlhMWWx3OU82?=
 =?utf-8?B?MFY0K0NCMmhRY0FJVUY1Z25VUVdlRDl4OHdqdHJjdHJlQ3pTNzdab09JYXha?=
 =?utf-8?B?dGp4Q1NJR0dmUUU0R0xmeGRBZHVHUVJCcEpyNldnWEZhT2tBVU0xdG9BWXpn?=
 =?utf-8?B?WGd3cExYZFFNeCtOaS9ZVFFLMWszUVRvZ0NLWVA4NXlaZmVUMVNFUWZxdFp6?=
 =?utf-8?B?NzdtNXNIcVZEM3pVOUhmb3RGc1BLN1BzS1VvaWY0MGtLYnI4cHFVMVpTZkw4?=
 =?utf-8?B?c0pjbjNHWUkyVnFxYXdmc2c0cFRzOVFNNFJuUWJoNWo4VlpwOC9OWVJ1cHg5?=
 =?utf-8?B?dnY2T2VsRXpmUStLRVpUeExvZEhkUjhUTnR5cDlpOHltd2NpbTg4TFpZaUk2?=
 =?utf-8?B?eDIwYkNBV0ZBMWNaUmpLZy9nTXZBVGI1NC8wV3FsdWdQMjlBakkvY2plRUg0?=
 =?utf-8?B?bWduTiszMmNXUElvaTk3T3ZNVmtadXVWWTVDKzNDeWcvSmd3Y2IwR2tPVG5E?=
 =?utf-8?B?Mm9kRHlTN0hMMUthU3JNSTBKLzZsRFpzY3BPL0hvWWdEMnFYcEp4d1RLKy9h?=
 =?utf-8?B?d1BJK1JMWHZKNmZHTzRzcmR4WHlYaFJsMUExMEZZVVJxdTl4MlgzMmVvUU5Y?=
 =?utf-8?B?WHpuUldMWUhjTTFLQ0w1V2JTZmZra0dadis1NVRqL1M1RG5IUzJTUk5jM2ZW?=
 =?utf-8?B?S0NDWU02OGJKS3BKdzBtcUhwRlVieDJ3WTFUaG5oRlhBa2pVbWhyZ2Q2TTlk?=
 =?utf-8?B?WWhxcVI3QmdYZzBxZmZvNlRTTEhRaTFXek1EeDM3WWVnbFdRZzVDanNZVzZE?=
 =?utf-8?B?aGtCeVhVTjZ3Z1YxNGhPeTA3N1dnZU5qdStDbFVseWZ1SFJwdGsyS2IySXhh?=
 =?utf-8?B?T01jT3o2b1V1UjdMY09TOXY3UHQ0UkxiOWkwbEtCdTNFZWltNFNoRTRqdXUy?=
 =?utf-8?B?VlR6T3N5KzlSQVVIVWR4Z0lIYjdxQnZ4ak93UjQvYXJMRDk3eFplMXBEQmVC?=
 =?utf-8?B?VWd2Q01RSWU5ckdkYncyelArWS90M2QrbXlUU2dwZzJJd1l6T0locXBjdytL?=
 =?utf-8?B?OTlqZTRhZW40NlpJY2xrRFgrTk94ODdJcDFzN0ozOVNtWU41b1JPUFkwY0Vt?=
 =?utf-8?B?SHF3bEtJK01TOWxrOTFOS2l3WWRQa1B3ZmlsYTFsMjJYTnpkU3ZPZ3BJWUFW?=
 =?utf-8?B?ckdodUlSbnJkMVVtalRpLzRKUUY5L0VTeHBXUnRLaGZkd0JiMjVTaHZuRVZ6?=
 =?utf-8?B?ajlOMHFrT3NSaThSQVVjUk1aa3puenkxRElNanFRc24xOUM2aHpzb2JnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckovVlBnRDQ4b05hNkp1Q1ZkWThTWldva1c2L0RHdkhBZzF6RGl4NTBHSzNK?=
 =?utf-8?B?a3dyUkM0bllsbmQ4VXMvcyt6bmpoVmxIbWtVS1Z5M2EybTN2djNrb2taTHVx?=
 =?utf-8?B?Mnh1WWtIUlJHbmxvbW9BSTJaVjU1LzArQk5yemR4UlRCbldhYmJuVDNSb09O?=
 =?utf-8?B?L0Zaa3lxaS9PdFlXY0pjc2hVd3doZ1h3QXR6Ui96VFNkZ0IxcHFLM1lBZU5J?=
 =?utf-8?B?QnRIVS96eVRidkVLWFJVUFVmUm5MMUJ4ZXVKNlg3WGZuT1NlWE92OW4rSUxh?=
 =?utf-8?B?MTcrUmdGS3MyNk5sdFJEdnhYSktyU0hVU1hETmE3bHRnaTNwcWk1cnA1Ylky?=
 =?utf-8?B?ajR5QjFoRk1BdWhBY0FOZGVsWTlKTGY1dGo4ZzhwcUpwVVZYUE9WczJBS2th?=
 =?utf-8?B?U0NXV1VzY1d1ekprckhocExMZVdRd0lwaG1HQXZVZ3daS2pxQmo2MG5sYXRO?=
 =?utf-8?B?blEra0ZDdjlkUUhtMUN5UStneHNGcDNYWE5Ra1NrYWFOd2I0WW0yUXpaZHJY?=
 =?utf-8?B?OGE3bStYYTdmQnZja0orc2htTDVxVUg1TmdXMUYwV3BLOFR5S21IZ0Y1Ym5F?=
 =?utf-8?B?bldwSUJzTjVjSEVteFcrb2ZkTzlITkh6YXpVZEdMWGNVbVQ2L1RLcXBhcW9y?=
 =?utf-8?B?T3NrNVdNdVNSd3ZHbDUvTjE0bjZ4MTJwK1padUFVY1NNV0FSSTZVdlAwenMy?=
 =?utf-8?B?K1NkYXdtU3I2ZVd3K0ZGbTNqUDZXZFFsRDVoL2wvNHVtUVRvV2QyMHhoaEUy?=
 =?utf-8?B?V0dWK2NERHNHYjMwUS9TaDVWRGlvODA0NnMxR0tDdnFCUHgrUjFwNnVHaFR5?=
 =?utf-8?B?NGttS0F1K2h2aktrTVIvbmh4NG9hVFJhZjhUUTB3TTBla3J1ZFB2UmNXSU9l?=
 =?utf-8?B?UGNlR3RmQk5odzMvcWtkbzRMNStWR3ZQQzI4Zi8zMkhUOW91TTN2a0JCZVlx?=
 =?utf-8?B?dklNZjlQV2ZaWG5iVGN2RWpMaXpmdWJlenMveEVEZDRXYTFEUGVIZVNESE9s?=
 =?utf-8?B?VVJlUzhjb0F2c0tTVEdLTW1taGhJK1JIK04yVVNJOUxUSzMxRGRPWGFZbXFr?=
 =?utf-8?B?SDFWV3E2aytBNExLbUpOUkZZYjNEWERrQWc1dU1DVEQ0ck1DdXc0ZU1GMTJI?=
 =?utf-8?B?Ykh5VzQxZndvN1dHaEdqVnU5Zi9yejN4L3Zlayt2S0pOdWhEczh5QXNWS3NG?=
 =?utf-8?B?T2pCTmFJQmxEVHREaWlWczdBd2ZlZ3ZIeHNyWS9JaWZRcWt3Vmw4d0tZT3N1?=
 =?utf-8?B?TkRnbC9zNGJONHdUV0IzM0dETnd6dnJ1RFVlcGlIemxXV0l0V3F0eC9HZDNv?=
 =?utf-8?B?MTdsRkxZVFZGR1ZoR3lyUjA3OTR1UzY2QWE3U1N3WTRoZDNNZmttekkwcjlR?=
 =?utf-8?B?MlorWTZsRFhkUHJ5SUpRb3BZQ0s4MVVGZnNCK29TekhCeXRZY01hV1JOa0lS?=
 =?utf-8?B?YWZLd3dpSGhEVVFUUEljRmNzaDdjaExDS2FCQ3VJWmtDUVJoSzJhOEVKVmhW?=
 =?utf-8?B?ZXd2RUwvNGJ6ei9xdkgxVGlIejc4aGpOSGx2R2dMNHdMdEhlMGMyY1M5VWk1?=
 =?utf-8?B?djZ0SFdrclQvZzgyWXBUeXdoSm5zS3NtWkxzSmdzaVRXVVBvWEwrYWxQeXNP?=
 =?utf-8?B?V01HOFZxNWhndHZFbzdrNWlaYk03aTZVb0U1cHh3K2JZN0RyMHVtb3FaMDVW?=
 =?utf-8?B?RGxPU2FDSzR0Tk1jTzFtN2FWelBCNHVMbEFmWkdCeEJKT21FU0lBaEJpVm5G?=
 =?utf-8?B?b2ovNElpaG9WN01JUmRHYzh0OWplNWF3ak5IVndoS1A1UUdMbUhRT2ZwQnhx?=
 =?utf-8?B?d0p4VHdBcmVrRUdXajREVHo2R252dWNkeGdiMG9sbjdTamQ1SUNwc1lqUTI2?=
 =?utf-8?B?bWlUQm1GdlF2WlJCM25OSFFlaEdhTXR0RGQrWWJlTlk2RFF3d29BMDVMYmdG?=
 =?utf-8?B?M0V5akg4NVFsWkc5cHFjUTV1dnV0M0dIZXRHZE16T3hkK1BWVjN6OTN6T3BL?=
 =?utf-8?B?cVFhTHE0ZXM4QVlKT3F0VGc5dlA1LysxamxQRFROUk5VZ29LOU12OURMOS9Y?=
 =?utf-8?B?T203SXFIbGNnQzdQU3p2MVhDNGJ6RmFZSGowTHF5eFFyV3dwUnFjSFdqeVdQ?=
 =?utf-8?B?c0o0eEhZWFloR3BEd3NLQUlaZ3ZPWWZRQW9lcy81ZUFJWHpyTlBsQVFVN0FR?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3539ad7c-2857-435f-58ab-08dc63f012cf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 23:49:54.1487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vu5tJ0wAgGYzmrb8TJwreXnuMuc2s8REatKbboS828PkG7IuEyiN7ewFWf+ixK/QSYLY7ccgXGO4PGcBGr2fLHq2Xrs/WDjpNXJy3+WtFYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8569
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

On Mon, Apr 22, 2024 at 12:27:56PM +0530, Aravind Iddamsetty wrote:
> PCI subsystem provides callbacks to inform the driver about a request to
> do function level reset by user, initiated by writing to sysfs entry
> /sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
> without the need to do unbind and rebind as the driver needs to
> reinitialize the device afresh post FLR.
> 
> v2:
> 1. separate out gt idle and pci save/restore to a separate patch (Lucas)
> 2. Fixed the warnings seen around xe_guc_submit_stop, xe_guc_puc_fini
> 
> v3: declare xe_pci_err_handlers as static(Michal)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h |  3 +
>  drivers/gpu/drm/xe/xe_guc_pc.c       |  4 ++
>  drivers/gpu/drm/xe/xe_pci.c          |  9 ++-
>  drivers/gpu/drm/xe/xe_pci.h          |  2 +
>  drivers/gpu/drm/xe/xe_pci_err.c      | 88 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci_err.h      | 13 ++++
>  7 files changed, 119 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8bc62bfbc679..693971a1fac0 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>  	xe_module.o \
>  	xe_pat.o \
>  	xe_pci.o \
> +	xe_pci_err.o \
>  	xe_pcode.o \
>  	xe_pm.o \
>  	xe_preempt_fence.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 0a66555229e9..8c749b378a92 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -465,6 +465,9 @@ struct xe_device {
>  	/** @pci_state: PCI state of device */
>  	struct pci_saved_state *pci_state;
>  
> +	/** @pci_device_is_reset: device went through PCIe FLR */
> +	bool pci_device_is_reset;
> +
>  	/* private: */
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 509649d0e65e..efba0fbe2f5c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -902,6 +902,10 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
>  		return;
>  	}
>  
> +	/* We already have done this before going through a reset, so skip here */
> +	if (xe->pci_device_is_reset)
> +		return;
> +
>  	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
>  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a62300990e19..b5a582afc9e7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -23,6 +23,7 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_pci_err.h"
>  #include "xe_pci_types.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
> @@ -738,7 +739,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  	pci_set_drvdata(pdev, NULL);
>  }
>  
> -static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  {
>  	const struct xe_device_desc *desc = (const void *)ent->driver_data;
>  	const struct xe_subplatform_desc *subplatform_desc;
> @@ -986,6 +987,11 @@ static const struct dev_pm_ops xe_pm_ops = {
>  };
>  #endif
>  
> +static const struct pci_error_handlers xe_pci_err_handlers = {
> +	.reset_prepare = xe_pci_reset_prepare,
> +	.reset_done = xe_pci_reset_done,
> +};
> +
>  static struct pci_driver xe_pci_driver = {
>  	.name = DRIVER_NAME,
>  	.id_table = pciidlist,
> @@ -995,6 +1001,7 @@ static struct pci_driver xe_pci_driver = {
>  #ifdef CONFIG_PM_SLEEP
>  	.driver.pm = &xe_pm_ops,
>  #endif
> +	.err_handler = &xe_pci_err_handlers,
>  };
>  
>  int xe_register_pci_driver(void)
> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> index 73b90a430d1f..9faf5380a09e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.h
> +++ b/drivers/gpu/drm/xe/xe_pci.h
> @@ -7,8 +7,10 @@
>  #define _XE_PCI_H_
>  
>  struct pci_dev;
> +struct pci_device_id;
>  
>  int xe_register_pci_driver(void);
>  void xe_unregister_pci_driver(void);
>  void xe_load_pci_state(struct pci_dev *pdev);
> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
> new file mode 100644
> index 000000000000..5306925ea2fa
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_err.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/pci.h>
> +#include <drm/drm_drv.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_printk.h"
> +#include "xe_pci.h"
> +#include "xe_pci_err.h"
> +#include "xe_pm.h"
> +#include "xe_uc.h"
> +
> +/**
> + * xe_pci_reset_prepare - Called when user issued a PCIe reset
> + * via /sys/bus/pci/devices/.../reset.
> + * @pdev: PCI device struct
> + */
> +void xe_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	struct xe_gt *gt;
> +	int id, err;
> +
> +	pci_warn(pdev, "preparing for PCIe reset\n");
> +
> +	drm_warn(&xe->drm, "removing device access to userspace\n");

Warn? Shouldn't it be info?

> +	drm_dev_unplug(&xe->drm);
> +
> +	xe_pm_runtime_get(xe);
> +	/* idle the GTs */
> +	for_each_gt(gt, xe, id) {
> +		err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +		if (err)
> +			goto reset;
> +		xe_uc_reset_prepare(&gt->uc);
> +		xe_gt_idle(gt);
> +		err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +		XE_WARN_ON(err);
> +	}
> +	xe_pm_runtime_put(xe);
> +
> +reset:
> +	pci_disable_device(pdev);
> +}
> +
> +/**
> + * xe_pci_reset_done - Called when PCIe reset is done.
> + * @pdev: PCI device struct
> + */
> +void xe_pci_reset_done(struct pci_dev *pdev)
> +{
> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +
> +	dev_info(&pdev->dev,
> +		 "device went through PCIe reset, reenabling the device\n");
> +
> +	if (pci_enable_device(pdev)) {
> +		dev_err(&pdev->dev,
> +			"Cannot re-enable PCI device after reset\n");
> +		return;
> +	}
> +	pci_set_master(pdev);
> +	xe_load_pci_state(pdev);
> +
> +	xe->pci_device_is_reset = true;
> +	/*
> +	 * We want to completely clean the driver and even destroy
> +	 * the xe private data and reinitialize afresh similar to
> +	 * probe
> +	 */
> +	pdev->driver->remove(pdev);

Do we really want to do that?
First of all, that fairly unusual - none of the other PCI drivers makes
changes in the device/driver model during reset, which makes me wonder
if this is really what the user expects.
I would expect that the device is reset, but the driver is not unloaded
and previously created FDs are still valid.

Note that messing with the driver model at reset also makes it difficult
to do a proper cleanup if SR-IOV is enabled, as PCI-core expects drivers
to remove VF devices during driver->remove.
Removal of said devices depends on pci_cfg_access_lock, which is already
held for the duration of the reset (which includes calling reset_done),
which will cause a deadlock.

In current form, it also causes WARN if there are open FDs to DRM
device during reset.

[29357.277699] sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:02.0/tile0'                                                                                                                            01:06:58 [142/47263]
[29357.286158] CPU: 7 PID: 3479 Comm: bash Not tainted 6.9.0-rc5-xe+ #78
[29357.305870] Call Trace:
[29357.308342]  <TASK>
[29357.310453]  dump_stack_lvl+0x139/0x1d0
[29357.314305]  ? __pfx_dump_stack_lvl+0x10/0x10
[29357.318680]  ? __pfx__printk+0x10/0x10
[29357.322450]  ? kmalloc_trace+0x1c1/0x3a0
[29357.326394]  ? sysfs_create_dir_ns+0x162/0x210
[29357.330861]  sysfs_create_dir_ns+0x195/0x210
[29357.335154]  ? __pfx_sysfs_create_dir_ns+0x10/0x10
[29357.339965]  ? strcmp+0x2f/0x60
[29357.343134]  kobject_add_internal+0x2af/0x600
[29357.347517]  kobject_add+0xfb/0x190
[29357.351028]  ? __link_object+0x1c7/0x280
[29357.354976]  ? __pfx_kobject_add+0x10/0x10
[29357.359093]  ? __create_object+0x62/0x140
[29357.363111]  ? rcu_is_watching+0x20/0x50
[29357.367055]  ? kmalloc_trace+0x1c1/0x3a0
[29357.370998]  ? xe_tile_sysfs_init+0x4b/0x100 [xe]
[29357.376016]  xe_tile_sysfs_init+0x91/0x100 [xe]
[29357.380868]  xe_tile_init_noalloc+0xaf/0xc0 [xe]
[29357.385936]  xe_device_probe+0x60c/0x750 [xe]
[29357.390674]  ? __asan_memcpy+0x40/0x70
[29357.394461]  ? __drmm_add_action+0x1ac/0x210 [drm]
[29357.399413]  xe_pci_probe+0x5dc/0x680 [xe]
[29357.403882]  pci_reset_function+0x108/0x140
[29357.408100]  reset_store+0xb5/0x120
[29357.411623]  ? __pfx_reset_store+0x10/0x10
[29357.415751]  ? __pfx_sysfs_kf_write+0x10/0x10
[29357.420149]  kernfs_fop_write_iter+0x1b8/0x260
[29357.424620]  vfs_write+0x5ce/0x660
[29357.428067]  ? __pfx_vfs_write+0x10/0x10
[29357.432028]  ? __rcu_read_unlock+0x60/0x90
[29357.436181]  ksys_write+0xe4/0x190
[29357.439612]  ? __pfx_ksys_write+0x10/0x10
[29357.443657]  do_syscall_64+0x7b/0x120
[29357.447348]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[29357.452423] RIP: 0033:0x7f4f1ff14887
[29357.456030] Code: 10 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[29357.474761] RSP: 002b:00007ffe54e95068 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[29357.482343] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f4f1ff14887
[29357.489487] RDX: 0000000000000002 RSI: 0000559eb4076e30 RDI: 0000000000000001
[29357.496630] RBP: 0000559eb4076e30 R08: 0000000000000000 R09: 0000559eb4076e30
[29357.503775] R10: 0000000000000077 R11: 0000000000000246 R12: 0000000000000002
[29357.510947] R13: 00007f4f2001b780 R14: 00007f4f20017600 R15: 00007f4f20016a00
[29357.518174]  </TASK>
[29357.520539] kobject: kobject_add_internal failed for tile0 with -EEXIST, don't try to register things with the same name in the same directory.

-Michał

> +	if (pci_dev_msi_enabled(pdev))
> +		pci_free_irq_vectors(pdev);
> +
> +	devm_drm_dev_release_action(&xe->drm);
> +	pci_disable_device(pdev);
> +
> +	/*
> +	 * if this fails the driver might be in a stale state, only option is
> +	 * to unbind and rebind
> +	 */
> +	xe_pci_probe(pdev, ent);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pci_err.h b/drivers/gpu/drm/xe/xe_pci_err.h
> new file mode 100644
> index 000000000000..95a4c8ce9cf1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_err.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PCI_ERR_H_
> +#define _XE_PCI_ERR_H_
> +
> +struct pci_dev;
> +
> +void xe_pci_reset_prepare(struct pci_dev *pdev);
> +void xe_pci_reset_done(struct pci_dev *pdev);
> +#endif
> -- 
> 2.25.1
> 

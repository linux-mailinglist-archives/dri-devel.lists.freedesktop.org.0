Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ADCBD2DC2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 13:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8A810E43B;
	Mon, 13 Oct 2025 11:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrV4yyKQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E16210E268;
 Mon, 13 Oct 2025 11:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760356621; x=1791892621;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hAQ3j4l3N9PxvgIdAV6KtsnOoq0KU90rZaXILpg3DPg=;
 b=nrV4yyKQt1sxYraiQQDzi4mx3LTXDn1e0jD68Sq9bEG10JxxHqhmaZSN
 3BhvyhdP/H/IYaRHsUZ4uatIEfktuacaaPG8NEMF0pYGxqdKzsJfksqOF
 CILyKSDNw4m0BHtzWCnUgSoHkig9ZLPHzf6PYPkhSNc8WRkmwmasks0ay
 vmF9D0Q9GBguS9Rl2m8A98FhJBU8oUiYO2ynRtJCHjZoJ0q+P8uejNnND
 /dMADZIa7KeGpV3kkgWFO9TTHi5tRWnjKUa6m9xulEGZktYqaQJX0Jxkp
 SnVVRrPZe5zkqNZZ5fwDfm8LpBL+ivEbsh25WeDz8pYO9j5dubl2OSjvi A==;
X-CSE-ConnectionGUID: T2hP739SR6KSrE6BhD2whg==
X-CSE-MsgGUID: pbC3i3K7TYSe6LiDRCNCwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="61699586"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="61699586"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 04:57:00 -0700
X-CSE-ConnectionGUID: ZFZRIMfNRHaenfW6ay5fwA==
X-CSE-MsgGUID: 6vCewGToRBGutBR+FqNFXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="212204840"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 04:56:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 04:56:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 04:56:58 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 04:56:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=om6D2rSTWhJtot+LFAkkkOvtyXHS1mvfRJltXdVQIu7YJKHoz0eq523QWmYQQt5oRzKggeycuoGeCMtejZLG5brRsicVx1//SnO+toTesMDxDdfN2wcWUlK71+tRYN/7Jc0gIWzfDK89izWgJjPkscAyWXnUjFESo6vseEpOhwuCswhMUgHbl98GwznyQPrY+F2nN/wvv+/CAZp1S8EKTXGgAqwAC1YLTR19G3Zhy91Mgo6kabyezWx+Gm/qhOXs0RCpPjEmfDQr5lXiR+HpKds3BizEmEUDPGKEmdDDdARiWRLbQpaXttbeeksopD4pAhs9m6up3cxpk1k4E6Y6ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHC3WfALx4ZIJS5TJxLtn5XF1LRBDBSLIDzgS4hML3k=;
 b=KY0O7O0Km3V8K/mwCjLzJ7XEayPY8Y+NqEMgEZHBoE3TT73hrx5q43458KakeeDlqGIg8dcKERs7l1rdCKZ965KH2EiKKss2iaGgO2F7M9GC2uDJ6bcjkvMqHlUDTxQw7vSxB7WAM+wCuZNCxllFqM+xZWAKwyHH7q7cxa8juaevBCYulx+i6lImIUBEWkM9dtO0QXXA/rVvfcNr+ke83fb0m4VVYLf8VjQme+9HPqjlb//5dWtNayrlXBxUYriA2WoZCWHmCaZFr95kI3fWrKON+rbJWP7KNGfRishlyBvnuI95f79AUZVkuRGD428yJpYm/qpvt6g9TvusXvv0zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA1PR11MB7892.namprd11.prod.outlook.com (2603:10b6:208:3fc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 11:56:55 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 11:56:55 +0000
Message-ID: <c84fe346-08bf-4412-9ea3-d88f025c7774@intel.com>
Date: Mon, 13 Oct 2025 13:56:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/26] drm/xe/pf: Handle GuC migration data as part of PF
 control
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-17-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-17-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0190.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::47) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA1PR11MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d67cc97-52d3-477a-ecae-08de0a4f9ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUFpcmlxL1diRU9PcEpGM2JUd3pja0V0N3pmMmREeXdwOEpuekdHVExPWC9L?=
 =?utf-8?B?Vm5jSkVjRzBxVDJibEJieGl6UENBWWIzZ1NVWTdheEhwWm9aeVlubmcybWMx?=
 =?utf-8?B?a0JvWU5CeGFLZ1hFaVdZZ2tpRGJCRktobGZiZnBZNVlkOWhxN2wzVDM0b2J4?=
 =?utf-8?B?bVpYYWI2Nk4zZGZXblhaeG5UQUswdXA4VXJtdEJPZ2w4YkpkN2tQNkErUlZt?=
 =?utf-8?B?dTFPZ0lXaDNqSlJsZ3dRZk44dFA0SitleEY2d2FUdzlUbkdNbEViTVE0SmxW?=
 =?utf-8?B?TkFQTm82Mm13WXhlZHYvTFdxMXQxbXA4bk5HSVh2c0JFNVJYS294dkdCU2hH?=
 =?utf-8?B?VW9CdXNUVVpWei9TTHNta0FVUnpIck5kdERvamhRVm5pVWs2ZHlzNHJnZ1VT?=
 =?utf-8?B?RmJWaXlzWnd1eXZsM2NieXVURXUrUXF0YW5WY2pweWwrWi9qTmFlN3VKcXpB?=
 =?utf-8?B?eUFuUm9IdEgvSzU4dHZheFh3S1JBckEwVnVwL0ZVb1JFL3NDd0dQMGU0amhx?=
 =?utf-8?B?VnFRREJ4a1hLZHNEcmhVSE45ejlLcTJ0NVFUUTZIdS9MQ2wxQkR3aTg2Znk2?=
 =?utf-8?B?WXdDZ1lYV3hyVytPUms4MERKSW8zTGF6UjJPNmJqZ2Y2cFhqeVBuMDg2REhr?=
 =?utf-8?B?WG1FRXJ3TDlIVHQ0cDIzM25hUlpESkk4VG5lUGQveGh6bHBjczJ2SnBhcG15?=
 =?utf-8?B?OGJiWFVTNjJMZlM0UTFoOXhVdGw0K3VhU2lpb0duVnJiUUxYaHVic0FneU5E?=
 =?utf-8?B?Znp4cDdDRWExMWJaRG5qRkVNWWs2SXZRTDFnckhBTFEyR0FxMkk1QWpsaUhM?=
 =?utf-8?B?RkJTVHErZmhoWTlXQVk3NWNGVzh5TFluQjFSaGlHakZ3WXJtMEdKMERKMEVQ?=
 =?utf-8?B?Z3ZFTUJWalkxb1ZrWmNEWG56N2cxcGRxajh0T1JhaXdwWGVzQ0piK3ZtcW90?=
 =?utf-8?B?VHlRd2FaYUJEQTg2akVEbmRvRW1sN1RGTkd0d0hmYy9xZU1YdS9PWUI2V3pX?=
 =?utf-8?B?eXI0cVMrNEhjVXNGVzFRZHBCck1iV05XV1JjM3Ftc1Rwa2JHMEpmUHBJU1dw?=
 =?utf-8?B?RytYamsyMVVYTXVwTkJIZjMyeFVFVjVETXVNT1Rkd1IzOTVYd0NWWEQrTjls?=
 =?utf-8?B?RG9DMUtSZ3JxQW1JdjVsUDlMdlZjZnFLNk9uRFJTVE52Y0luYXZLU25mM1dx?=
 =?utf-8?B?RlU2Sk56TkE4M1NpMmRnTEdGd1ZaMWI5eU5NTUtmd0Z1N1VrWHlmMnpreVhx?=
 =?utf-8?B?cU91ZXgvRVZJV1lzYS92RUFGSk1Mc1ZuWFZGNFIxNGZaQmVQeEVIUitvWm9Y?=
 =?utf-8?B?QWRjdDZWdENUSkR0UEloK1lnc081UDRnUHY4Q1F5V3ZwUmpCb2UxQ2pyQnZG?=
 =?utf-8?B?aXZMTFp6TS9LcEJiWjlrT2NJQVBXWmliWnVLZjdGaU0zK25VbWxUeW11OFVh?=
 =?utf-8?B?TDVLMGVoeVJhWHVwZTUrU1J1L01VanAweU11N2FPd041TXVKTXpWNWpDNWcx?=
 =?utf-8?B?bTY1ZWFCd2pXT0phdTdra2tEUHN0WHJETC8wcHNVTUhydmxiYUYvcHkyZWE1?=
 =?utf-8?B?aHpYRHEyTE1pOW1mRWNjZWhUaWZwcjNhM2JXdzE0SHRjNDFHK0wxSm5vdFZh?=
 =?utf-8?B?VDg5QnI5WE1NcWFIWDR1NXZadDNqTEJZbUcxN1NmQ2E5Rlo3U0k2OHhPanB0?=
 =?utf-8?B?dlpXY2JsNjJmY1BGZk14LzB5NmV2YUlDZFQxa1RhQ2dwSk5xV3Y5Y25GUWZX?=
 =?utf-8?B?amIxT2tYd2JVcTRTNkl6eXU4NE9ucGNhRDJVektqcXVCZVc1akxGaXVyT29P?=
 =?utf-8?B?QjFiQWVPbUZTQkJ3ZHM2bnRuU2xyakxBNEJhUVdFYmREa1hSK3BvZTRobEtR?=
 =?utf-8?B?a1JQdDB5cG1ZZzVmL1RNWWI3cDRKZDNSZ2VPZjlPY0hONUtHMUFYcm9RdnZ5?=
 =?utf-8?B?TU1QTU02SHNmK1pvUzg1cE9XQ2p1ZXRFaW5nVlhlRXVmalVLR2d3QUh3YnZX?=
 =?utf-8?Q?geRbWSWQTrJwYpyQxEPuoayYApXg/w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFQxZ2ZKWTUrM3haa0hNQ3VSbWpEN1RGZGZTblN2ZHA0S0dkRlZMbTVHRjZG?=
 =?utf-8?B?cTJUUmNUcWtadGwvV0xaVHdKZmw3bis4MWtFMDE0LzZSdnRvYXd6NDFvZXpz?=
 =?utf-8?B?UEo1TEFCMEk1aW54dWh2MjI0L1huZ2NaOXJyK2h0d1JvaVlrcTIwK2VBb3Ja?=
 =?utf-8?B?clJnamFDa3JlN3IxTmFadEl1ODhMS3krRDJoV1RHQ3BCS2NMaFVsUk00SVQ0?=
 =?utf-8?B?REZOVzBZaUZkV0FLMUtnSERTU2l4VzNSNmtmbXE0NnJHNHdSb1o1NzR3aW8y?=
 =?utf-8?B?b0N4RllTdStvK08zSHN0ODN2VXVvRzEyeDdPbzl2NldOcndtaTRTdHd3Wkd5?=
 =?utf-8?B?SVowQVJSaVJHTDdlbVZBbjNKYkVZYWtVMzJsdXlMTWxYNVJyMFVpa09idFhS?=
 =?utf-8?B?cHdIbk5TREMrMXpRazdWVGZkcVNBM1J6a2NaUWVnelNqZmRrZU91eTc1enN4?=
 =?utf-8?B?UERvTFArejkzN1FlMWdIWjNDVktxN3VLREdSTEtmanVqeFhZMDNjZWg5MWdP?=
 =?utf-8?B?YzFFK1E2QmdKcGMvTGpyaG1wS0lhdWg5VUJVcGc0RnhmQk10N0lDdENwcHE4?=
 =?utf-8?B?UFBrNjhpRG9ucEZHaW8xY3g0ZkMxTEV6TWJWbzRlOFlnY0d2V1E2cEt0d2tY?=
 =?utf-8?B?TVh4SlgycHFUU1ArUFNkMnhheFYwL0daSStZUTg2WVNLdzV3Y2s2aXVDVjZF?=
 =?utf-8?B?bFlERkNRVkFXU2NQK0RpUnlUalZpUVlTNlkyeUdqbmJlajl5N054YjAwbFNB?=
 =?utf-8?B?S2R3ajlBWVNzb3lBRWI5VWsvR0xpY3RjZ3dZTWovanZQeDNjZkRHQzlya201?=
 =?utf-8?B?QmNUclNseE1tdkduVmlSRXpyQ21lUGY5ZGVhWnVrTTl6TnhaOEw1cUhtTEZv?=
 =?utf-8?B?c00rRjBmVmtFL2hDSnZ1cEJ1bmFBK0lWdXVreE5PcXVMeEVWVGVzTVdsdjFt?=
 =?utf-8?B?MTQ5VFBTL0hzaDhYT2xHQXdaQjl0ZjZqSVUvWFdYWE5sTTRQdGc1Wmp3NXhC?=
 =?utf-8?B?OWVhblZkbGtITkkyd2Iyd2NSR3Voc2xRa2gwc2lpOTBHdHhJUXplRVpJOUpj?=
 =?utf-8?B?U2N1K3ltNXpua1YwQzRMSlhtT0dFeE1MMTUrekdiMmgzRE5waHBJN1Z2MHVB?=
 =?utf-8?B?WXhFenA5Vzh4S3dINDhDbGIwNy9acFVDdGdCMGdWSmk5S2JLSHdMN1ZvUDhS?=
 =?utf-8?B?TG84TmhjcHlLVmZoL3lTTlF4MkZ4cWx3aEhLVVpXY3RXR2RsaVIvSFRNZmRB?=
 =?utf-8?B?K0RUTmV1OGdCcmRsMWcvZWxDcVNzZ0oxN3JLeTFQa280L2FtNGZMS25pby9S?=
 =?utf-8?B?VTBxazNEajhUYkIzdkI3SmFLSGdkckpHUFBIcUtyWExxUFdQRS9ZZ2hIUXdl?=
 =?utf-8?B?Q2Q3U292eU5ISEc2UHBsdENvT3graHhxRnJzeDVLbDRJUDF0LzM0VGU1a3ZX?=
 =?utf-8?B?U1A1QXk3d2ZkekVuS21zUzI1bm1MK3hxQjh4a1hnbzZ4MmhFTm0zRGQwRStQ?=
 =?utf-8?B?dmE5UXpIR3praDhwUm9WK1dsZVZ5cnpBZGkrdGMyYk1hM3RMQTZTUGROZFZR?=
 =?utf-8?B?TEpwaklISG1GbXlka3BueHZseWJTdGx2OVpQZlhmaE9JRmxMOHZicTFtcS9T?=
 =?utf-8?B?Q3dYMzJ4YU9lb1hEbSszNndXUVp1WnJZemkvQ2IwK1A2R2ZJdk14S2lRN21S?=
 =?utf-8?B?RzJ0dGJMNnNpMDhteHhvRkswQWVuNWVlSlVuQjlDaXdRVGE1djhmK3dWZ1Jz?=
 =?utf-8?B?c0pRdjFtRkZZaXNkRXNtcFIyLzFQbDdvOFVIVGNHYTdZMkdLQTZmRzZneGVx?=
 =?utf-8?B?NnJEZ1VKMUN4KzF1STdkQ1o0V1Zxa0Z1ZHVmWG9mbUFjMStpcWVIZnQxbEJz?=
 =?utf-8?B?ZW1wRWRRSStDTGp5SHEwK2wvKzdYd3hKenp3ZVNCWWlvek9IWCtGcnB3c29u?=
 =?utf-8?B?bUZzWDFaRXVVTW5NcXFsZEt5aHl3TmJYZXh2Y284Mkp5c21WWjJIUTZ2Qk9U?=
 =?utf-8?B?UHJ2QVg1UG8ybkk4L1pibmxiNnFLYW9YYm1Ia3o0UUgzcWR2aWhzTEh6QVZ6?=
 =?utf-8?B?UlEyd0pvUytpZlg0bmt1UUgvcThxSmo1WE1VVWdndHAzRHU1YmVuZWIxeXBw?=
 =?utf-8?B?UDZ6MzVmV0NUQkd0ck9oNjdYdC9PTFhScHE0T0ZBUTUzOWp1M0d6OGNLaFdy?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d67cc97-52d3-477a-ecae-08de0a4f9ae6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 11:56:55.2009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q06quxH4NI7IgElGKH1+It3x60++Ikm21Y5OabCMcYjiJZK+25u4wzeDLDZb1Pc64RU6ii/VOWvBgj40BxuxszAt1zqiBlgte/JH8NkgM4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7892
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



On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> Connect the helpers to allow save and restore of GuC migration data in
> stop_copy / resume device state.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 28 ++++++++++++++++++-
>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  8 ++++++
>  3 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 6ece775b2e80e..f73a3bf40037c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -187,6 +187,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
>  	CASE2STR(PAUSED);
>  	CASE2STR(MIGRATION_DATA_WIP);
>  	CASE2STR(SAVE_WIP);
> +	CASE2STR(SAVE_DATA_GUC);
>  	CASE2STR(SAVE_FAILED);
>  	CASE2STR(SAVED);
>  	CASE2STR(RESTORE_WIP);
> @@ -338,6 +339,7 @@ static void pf_exit_vf_mismatch(struct xe_gt *gt, unsigned int vfid)
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_FAILED);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED);
>  }
>  
> @@ -801,6 +803,7 @@ void xe_gt_sriov_pf_control_vf_data_eof(struct xe_gt *gt, unsigned int vfid)
>  
>  static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  {
> +	pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
>  }
>  
> @@ -820,16 +823,35 @@ static void pf_exit_vf_saved(struct xe_gt *gt, unsigned int vfid)
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
>  }
>  
> +static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
>  static bool pf_handle_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  {
> +	int ret;
> +
>  	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
>  		return false;
>  
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC)) {
> +		ret = xe_gt_sriov_pf_migration_guc_save(gt, vfid);
> +		if (ret)
> +			goto err;
> +		return true;
> +	}
> +
>  	xe_gt_sriov_pf_control_vf_data_eof(gt, vfid);
>  	pf_exit_vf_save_wip(gt, vfid);
>  	pf_enter_vf_saved(gt, vfid);
>  
>  	return true;
> +
> +err:
> +	pf_enter_vf_save_failed(gt, vfid);
> +	return false;

return true - as this is an indication that state was processed (not that it was successful or not)

>  }
>  
>  static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> @@ -838,6 +860,8 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP);
>  		pf_exit_vf_restored(gt, vfid);
>  		pf_enter_vf_wip(gt, vfid);
> +		if (xe_gt_sriov_pf_migration_guc_size(gt, vfid) > 0)
> +			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
>  		pf_queue_vf(gt, vfid);
>  		return true;
>  	}
> @@ -946,6 +970,8 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid,
>  				     struct xe_sriov_pf_migration_data *data)
>  {
>  	switch (data->type) {
> +	case XE_SRIOV_MIG_DATA_GUC:
> +		return xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
>  	default:
>  		xe_gt_sriov_notice(gt, "Skipping VF%u invalid data type: %d\n", vfid, data->type);
>  		pf_enter_vf_restore_failed(gt, vfid);
> @@ -996,7 +1022,7 @@ static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>  		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP);
>  		pf_exit_vf_saved(gt, vfid);
>  		pf_enter_vf_wip(gt, vfid);
> -		pf_enter_vf_restored(gt, vfid);
> +		pf_queue_vf(gt, vfid);
>  		return true;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> index 68ec9d1fc3daf..b9787c425d9f6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> @@ -71,6 +71,7 @@ enum xe_gt_sriov_control_bits {
>  	XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP,
>  
>  	XE_GT_SRIOV_STATE_SAVE_WIP,
> +	XE_GT_SRIOV_STATE_SAVE_DATA_GUC,
>  	XE_GT_SRIOV_STATE_SAVE_FAILED,
>  	XE_GT_SRIOV_STATE_SAVED,
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index e1031465e65c4..0c10284f0b09a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -279,9 +279,17 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
>  ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
>  {
>  	ssize_t total = 0;
> +	ssize_t size;
>  
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  
> +	size = xe_gt_sriov_pf_migration_guc_size(gt, vfid);
> +	if (size < 0)
> +		return size;
> +	else if (size > 0)

no need for "else"

and isn't zero GuC state size an error anyway ?

> +		size += sizeof(struct xe_sriov_pf_migration_hdr);
> +	total += size;
> +
>  	return total;
>  }
>  


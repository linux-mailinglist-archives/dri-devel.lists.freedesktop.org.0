Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F7AA3BE73
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 13:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD61910E7D5;
	Wed, 19 Feb 2025 12:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="imk18UY1";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="L3xs3zav";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E95A10E7EA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 12:47:31 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JChusQ018665;
 Wed, 19 Feb 2025 12:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=Zc/GfR3n6Q0f2P//LR07SU12m
 lyRXAvYCqVoZMjWVjw=; b=imk18UY1b/b1NQoH0at5HKr6kDhIRDbhzZRTYDzIf
 NsPOtnAl9zUr/C0xlU8nthHaLEkcIAnLLn7OmAH9phZ0FWf+wIOwniuPhZELVUo+
 mccfMiSUBEIU3r/Z4kHr1qNOhHgAZZE10CVFil6aQlpndGyumSEQsi7ETFCSj6t0
 XeTVKLV/IcG2trAStdxct6tJMynmkPTcZwGMoI5f0X+SBXH8ZRHqLPqwEP4xB0ta
 EUwZAoLn1NFsFP+ADBvnB4bcIaUdWFCEqlMnoh+YokXKE3cNdenLgC/QqLSJby/7
 RoVr/GEdm8lGlEDWCz5AU1EYOTieUJgqHy1nhAVZwD18g==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazlp17011027.outbound.protection.outlook.com [40.93.67.27])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 44w4c9rcb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2025 12:47:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlnCKwHFDx12v0zbAs9c65Fg6IcbFxo4ywxSScKBi8AMGw/l0QqoJ7JFR1oxwQds05DrfByvAcNxRpp1b7cx+lYO3xpMFXStyscsvgKlGGYH4JRFNoMWpUMbRaN5C+V13Oi2cjbQkILZacN8pk6ISGnPZLTl3ADvxrcKa2jlDONqyO/RBqV1AvDLgsLZg8DaHrWzBz8O3ciOKgYYy5BZknVhezASdle0PTqAuxZ+XPBjBtUDWCWZ2R/p+eAnan2qhMRIdJGueQY867OLF4F7KRl92VnLJ8lF84Jgmwbn5BUNv89rTfMr0yfv5+BQ1T6Gw9/RbaAr31p7bufoDXd/pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zc/GfR3n6Q0f2P//LR07SU12mlyRXAvYCqVoZMjWVjw=;
 b=aS+jU399B+3/QDsS3czCHhsUADjEpTzHUUDqFYRSKapBHLjlStkqXgJazyO7XRilqLFO2D2RQjYxu4YfawLLK94MUEtYviXXe+oWxXqCDxk/JQLL5Mpd6h5SByDhYwscXuAW3PT7013BLU6egjOx/ociogdFEOShEvqZqWQ6FMJ/qfJOwwtsW9faG2YRDynVotisjMDRX86ShAdbAITpdYsRymdYtQ79K7qhw90wtYIIkAWH6iMOLqdXU0A3Bzr27uPNN6PIapHmXgwDT88iThev6whHfDH9FCMwcp9T9IeXy4KGdQwIbqLsuVa4m08oQSbYCOT8GdBfM/85ifn+Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zc/GfR3n6Q0f2P//LR07SU12mlyRXAvYCqVoZMjWVjw=;
 b=L3xs3zavAqzsWj9MREbAHUQovWG/7i0Jz6ww43cFIPoOyuJOMsF0oeE0XjI79Aiwk8Kl+r5+A2MsRf27p+RYaputbi1BXgjVyG0bME48v1PTWfqoFYkvP6ZWblUzqutrXVH6shAuBrDffh/8opyNd3lMKRSkbasQo269wbpikqU=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWXP265MB2741.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:8a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.15; Wed, 19 Feb 2025 12:47:21 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%7]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 12:47:21 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Brendan King <Brendan.King@imgtec.com>
CC: Frank Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: avoid deadlock on fence release
Thread-Topic: [PATCH] drm/imagination: avoid deadlock on fence release
Thread-Index: AQHbdlDh9OB+iYwh7E+6h49ySZ/jwrNOrDIA
Date: Wed, 19 Feb 2025 12:47:21 +0000
Message-ID: <fd658c0a-78b0-4a30-bfe4-99107675700a@imgtec.com>
References: <20250203-fence-release-deadlock-v1-1-6e1de1260b38@imgtec.com>
In-Reply-To: <20250203-fence-release-deadlock-v1-1-6e1de1260b38@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWXP265MB2741:EE_
x-ms-office365-filtering-correlation-id: 7f3ec055-917f-4e5d-2ac1-08dd50e38d40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?YlZOYXNGa2ExYkNBOE90ZFpleUEzUllxWGhSdmhiYVQ4VTNmeXQ5ZXkycUVN?=
 =?utf-8?B?U2FvelQ5Mkdud3Y4QzZRVlNMdkI3ay8ycTk0TFFtMGlBTGdHRzdXV0N3ZmFt?=
 =?utf-8?B?VURXM1QrcDlJVjdhZXQ1RlN3bUU4ZTdTOE56dHFFcTNjZFNsakxtM1VacUgr?=
 =?utf-8?B?d0RXVHNtTEdvUDJYZlNScVRxckdSSitBQklzUm0wTnY3cXlXS0JJdHdGSmN1?=
 =?utf-8?B?SFlkczFkV0hRb3RtQTd5MHh3ejYvODZvUEZhaWhBdVlESUp2ZXpCTlVUeC9Y?=
 =?utf-8?B?U1RlaUt5ODZRaE8zeUVydTg4bHJGTXRTa2h4dVhxaUhnSjhTS2M5SmlneWYv?=
 =?utf-8?B?L1FYSHVnWFpLS1k2YlBYeUZFbENoVTZEY1FqVy85UUJCQmpPa3hDQ3FiVndv?=
 =?utf-8?B?bGtMQlNiUFhKcE5QWnZHdXBncFRlb3BaQnFzSnFVUVRCaGVhQlJpbTIzbUVB?=
 =?utf-8?B?M3A0aTMzYWIzaG9rYTVPaDFaL0N3NG5YM0dsTGxYTGIvaUIvbWFIazhLeXpq?=
 =?utf-8?B?UllhQ3VzVkVQR0Vuc1JuT2lhb3Y1bFlxK0lmTDVtRUNnS254WHdXWG1pN2tF?=
 =?utf-8?B?NUR4WVpWclhqa3VRTWhxbzUwN3RyMWNxb3g1VktnT3l5Ty9Ub1BlM1RQYm55?=
 =?utf-8?B?WVpycXoxY2JrdllLZTczY0Zva2xPWm1hc0lvNG9Ic2JpZDVlcGhTM2pweXRI?=
 =?utf-8?B?WTBiNHpobUFBc3RxNzNoVDYvRkNIb3pQRHByRW1EQ0Q3a2Q5WGNnY0xNY3ZY?=
 =?utf-8?B?bW0veEp1bEtkSFJnd256bEdOb1daanE3aWlmK3hGNXU2d2RSbTVGQWRLMTdn?=
 =?utf-8?B?NHV0QWFBMVlwbytjZytMREw5U3phZFV0aS9YZHJmV2FwL3ZUWWhKTHN2T04r?=
 =?utf-8?B?RHdsb2kyTjhOUUo5QTlERDVCYUJCek94NXBBd2FUZ25TS3U5aUNDRUFyeTUy?=
 =?utf-8?B?MHV0ekNjL2Y1eUNURytNcVYyN3ZzTDk0bDN1cWJpTVM1YTNHdFVhSlNSSXJ5?=
 =?utf-8?B?b25EM1B0emd1Rzhva0NsdFlwNURoc1g5Sms3TFJoMWpRMVJVcnZqNytnRXNx?=
 =?utf-8?B?QXZBZEQvZVZBYlJWWHNOMWR0QThBVDFkNU1rS2FMRkU0MHpPbkdaelBjNG52?=
 =?utf-8?B?LzVOcmZwUCtGL1UxZ0lTUU5wK0twL3o5R2hCWVV0c3NyRWVSK1FUK1hHeTlO?=
 =?utf-8?B?OHdtQUM2emlGeEY3MTgvQlljTWNUVnU5ZmFZM1F2aENhVHFLcTJWN0lBWHd2?=
 =?utf-8?B?ajh4Sjc3Y21QUFVpcjZNaGhzUmVhQkhjNC9COUl0Nng3ZHI2SGZxdWswTmlx?=
 =?utf-8?B?dHZRbWV2VGhrWjhUbnMyZ2laNnRxTkdJektodGlOS1IrSitGbTFEOXo1Tjc5?=
 =?utf-8?B?L0c1ZkVIRkI0NmpjV3NVQXBnSU5TMUtMYlJVSFRHdDJ0cytXRWxyUEtWSVRy?=
 =?utf-8?B?Z0Z3RWVsVnhESENUaVU1ZXZKa29YMGIrT1VMZ1RqQUNYZXRzL0poNmprbkg1?=
 =?utf-8?B?VjNmRyt2RnF1T0wrWEZQRFRkOVZJeUV0TkVVNWNzVEFrU1RiWFZKNGk0QlRq?=
 =?utf-8?B?OEhSZHloMndWNm15NTA3RnYwaW16U2VmN3V6Tk04U2ZNVUF1dWR6YVdNaUFT?=
 =?utf-8?B?VThRZjFBWDE5UklMa0pQWlFVRVBVdXBmQkUzWGVEZVZRYS9KNC9vRHJyNzNG?=
 =?utf-8?B?ZjBBbnF6MjA3MUljbzMzVzZEektKelRQTjdkREVZRXQ5d01MNk9nZ3cxSHhK?=
 =?utf-8?B?Zndza1JZMDA2Skx6TnlUekxCWVc2bGxRbWdpUURIY0hFWm1xanZVMDZPNzdW?=
 =?utf-8?B?Rkg3VGE2dFk2V2RHZ1A3RWx4OFp4Um12NXRtRlcwY0NGZVRmVkhUMnN5eDYr?=
 =?utf-8?B?c0RYMlZqbGk0aHRaVHpsbWFQT1BlTnd1TENoOC9LR3o1ZWwwcVcxNHhibkJO?=
 =?utf-8?Q?e+cWOZ2dVj7pMe5l1FxMWPBse2ocNvPX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4053099003)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDdoazh0em5BZ2lhRkZhZ1NuMzh0WDgrNHNlazZNZGFVMTFCWjFiUzY3RlUx?=
 =?utf-8?B?Vml5NVlRc2ZhV2NtVEVvVUtoeHhFejY5bzhqTE5NdFZNUStSbjdTTm5KbTE0?=
 =?utf-8?B?eTdWQ3VpZ3lzSGp0R2greC9yZG8zMGNnbk54cTR1LzBDaEtXZGpkS0dMZklI?=
 =?utf-8?B?QTJYWU05TG9qY05LWEowUXVxcTZxa0N1eGxYTFFvSXFRYlpuNHhoblVjWGd3?=
 =?utf-8?B?Yms0cndMMW9wV0FkMUNvN2tuWjNxb3JHVXFHS0lIV1g3cWhDeTd0eWx1TFZO?=
 =?utf-8?B?OGgyWU1FdUIwQWJ3VERUb2kyakM3Z0RvUFVvVFRmSXdjN3ZkY3Iyd2llVHZu?=
 =?utf-8?B?dHEyQ2h6UzJXQ0Y0T2dGbE4zSlFuTTBQUzBQSHh3VVVwcXpiNjV2a2RDdXBN?=
 =?utf-8?B?UVBzSmRNTTE3MHUvYXFoNnJzU2pmUzU0aXF0Y2hjdDVCOHUwa1VqbHJML2JL?=
 =?utf-8?B?d2UrTTJ6K09Tb1NGTlk5eUdLeVBGa1piRDNGNEFSOHJLVkV6U2xjWlFwYk5M?=
 =?utf-8?B?cDZxUDZ3YXFlZnJyTVhYMUwzaGQwZ05WRkNGWHk2Q09BMktCTUc4cnIzbTNO?=
 =?utf-8?B?cW1jZ1c0cW90MjBHa3JGM0lGYlZ3d2NwSjlGalV1c1RKVDI4dGluazR1am9u?=
 =?utf-8?B?MlFFTWI4bUNoQWhLMWR3K0Erd3k3UzZSTzJDTVZwQmJyVW01eXpyY0NCRVEx?=
 =?utf-8?B?c1RVajdlTm5udjJBWFN5ZklZQ0hPbXRaWjF1SldWajQ1SlhldklQSnNNaGVi?=
 =?utf-8?B?Y21PeTA0Q1FkUGxBSTU0REMzVmJnb3BEVUxHbXhSS0ROb1B3Ym5ialpMeHJP?=
 =?utf-8?B?NUdWU0p6RGphRnVlbVdid004WmlFMlVBbFI4b1lHeWhwbzRHZnk0SVNZRHI1?=
 =?utf-8?B?V0xiSDhDVnhUY24wZ0NYM0hEZm1nMG1JUURUU3F1R3l2TnhQZ0hjOG0vKzB2?=
 =?utf-8?B?RXdDZ20rZzY3S1ZUV2JpYU5ZY1pzT2REQUoyckw4MWJPU2FPWk9FWGs2MkQ0?=
 =?utf-8?B?SWJUd1lVS1NPSW1acGxrMVcveDZ2eVIyUjdLb0RLZjlGbkF1Ni9UeVFhQ3BO?=
 =?utf-8?B?ZFFCTkMweEhJWHM4M3RtMG1mWS85NVNhUVJrVnoydWVyRDF6VTQ3YjM4N1JL?=
 =?utf-8?B?VDBwOXVPUFJxcHdkWEZ1b1lhZVExeWRodjdPYTJQNVdvcGxzTXRSS05YQU54?=
 =?utf-8?B?b1gwcHZOZFFMbEpzbUZRa1dDOSswK1VSZXZ1MENVT0ZmdXpudWwyQU45OWVG?=
 =?utf-8?B?K2JCN20yTlFHSWcrZkxLSDZQczlhMkl6bTJPSXRKdkd0bnlpOEp2ZjUrQzk5?=
 =?utf-8?B?NHdGOTBQanV6TEs0aDlRZlJvbTh2RzlOYWF3bVRIUS9JV25oc1VBby9YLytY?=
 =?utf-8?B?U2NGaGZ6MXBDOHVkdng2MnQrakFSWmVNUmNIRVhxTktmeFJ1c01ZMnJkSG1X?=
 =?utf-8?B?dGZydjRoanBHZm8vWlI1MU5DRjRjd0JYQWFaNnRFdy9OYWVzWVBSMmlzbklo?=
 =?utf-8?B?OVhWdm8wQ1lGb0xzVU1HZUhjOG4xSkc0T3BrbnhHVmVOclduMHVmU0Zjc0Fa?=
 =?utf-8?B?WTl0bW9idEVtaTB1WDRhRDcybGIrQ1ZTN01yUVFKT2hHTFpFVTRubzJrOUdh?=
 =?utf-8?B?bjZVY0xyOTZHRHFJL3lqSTU1SVh1MjNKSmVIa0hVUmcxWnVNVmhXc09ISUFw?=
 =?utf-8?B?L1FQMzFEUGVGem00TG14ZkJuOTFXSDc2UEgzYkJkVWtZU2twT1ZJWEt3djBU?=
 =?utf-8?B?cUpQY0gzSUZiMnBoNllkR3NzdHY1eCtoYXl4YWV3T3NLSERBeUo3YjlFb0kz?=
 =?utf-8?B?Q0NPa0ZuZjAwWGdzSmdsQUh4VXBHM2t0QzUyeURqQmV0LytkTDdnY2YydXFF?=
 =?utf-8?B?MzcyZjFFZWp2QWNIV1Yyck50ZGgwaUVIWDdlNkJHaTFoZG8vODlxdGQ2bS9R?=
 =?utf-8?B?Y2htUENkejBWRGZldGZRa1lRUzlIOFRUNnp4a3ZWQnRCRjJiQnk4QjcxUUFm?=
 =?utf-8?B?MzFaSjVmRVc5bzdic2cxSEpWRWt1bjJmYzcyUXZidmRxSkpyQVpRRktselR3?=
 =?utf-8?B?ZkZsenUzMnJJNU5oeGI3cG5qMWZQeGx5U0FzRm9VVDNPcU1YekgrOVNTTHRv?=
 =?utf-8?B?YmFVZnZsaWJqeW1LdTVHUVVFeVNCSTVPVzRuMkUxZ2NpaEZNRTBHdUdHYitv?=
 =?utf-8?B?a1E9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CskkyaQJf3BODIa095WgXkVB"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3ec055-917f-4e5d-2ac1-08dd50e38d40
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 12:47:21.3806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NdRLWcuP82FujwEkNT11qQSsmKzW2A3MbxmY8s3y53sl3p95EPdqtGnmZo6idcTzB30VOg/5vToasfpDZ2vEWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2741
X-Proofpoint-GUID: WrjY5Ec98J8Lw_jYj8IjWuJDW2pX_4EP
X-Proofpoint-ORIG-GUID: WrjY5Ec98J8Lw_jYj8IjWuJDW2pX_4EP
X-Authority-Analysis: v=2.4 cv=U59oDfru c=1 sm=1 tr=0 ts=67b5d2db cx=c_pps
 a=AREp/cWza2rSvMr2Me63bQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=VwQbUJbxAAAA:8 a=6NLva-DxTYvlfYFjiGQA:9 a=QEXdDO2ut3YA:10
 a=c2Mp0ynPsk6dSsE-F5kA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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

--------------CskkyaQJf3BODIa095WgXkVB
Content-Type: multipart/mixed; boundary="------------lP93bN7rA0CHnu9d5bvalqp4";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Brendan King <brendan.king@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <fd658c0a-78b0-4a30-bfe4-99107675700a@imgtec.com>
Subject: Re: [PATCH] drm/imagination: avoid deadlock on fence release
References: <20250203-fence-release-deadlock-v1-1-6e1de1260b38@imgtec.com>
In-Reply-To: <20250203-fence-release-deadlock-v1-1-6e1de1260b38@imgtec.com>

--------------lP93bN7rA0CHnu9d5bvalqp4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 03/02/2025 15:32, Brendan King via B4 Relay wrote:
> From: Brendan King <Brendan.King@imgtec.com>
>=20
> Do scheduler queue fence release processing on a workqueue, rather
> than in the release function itself.
>=20
> Fixes deadlock issues such as the following:
>=20
> [  607.400437] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=

> [  607.405755] WARNING: possible recursive locking detected
> [  607.415500] --------------------------------------------
> [  607.420817] weston:zfq0/24149 is trying to acquire lock:
> [  607.426131] ffff000017d041a0 (reservation_ww_class_mutex){+.+.}-{3:3=
}, at: pvr_gem_object_vunmap+0x40/0xc0 [powervr]
> [  607.436728]
>                but task is already holding lock:
> [  607.442554] ffff000017d105a0 (reservation_ww_class_mutex){+.+.}-{3:3=
}, at: dma_buf_ioctl+0x250/0x554
> [  607.451727]
>                other info that might help us debug this:
> [  607.458245]  Possible unsafe locking scenario:
>=20
> [  607.464155]        CPU0
> [  607.466601]        ----
> [  607.469044]   lock(reservation_ww_class_mutex);
> [  607.473584]   lock(reservation_ww_class_mutex);
> [  607.478114]
>                 *** DEADLOCK ***
>=20
> Signed-off-by: Brendan King <brendan.king@imgtec.com>

Hi Brendan,

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Would you mind sending a V2 with "Cc: stable@vger.kernel.org" so this
fix will get picked up for stable backporting?

Cheers,
Matt

> ---
>  drivers/gpu/drm/imagination/pvr_queue.c | 13 +++++++++++--
>  drivers/gpu/drm/imagination/pvr_queue.h |  4 ++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/=
imagination/pvr_queue.c
> index c4f08432882b12f5cdfeb7fc991fd941f0946676..f3f1c5212df7432161919dd=
c510cececacbbe143 100644
> --- a/drivers/gpu/drm/imagination/pvr_queue.c
> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> @@ -109,12 +109,20 @@ pvr_queue_fence_get_driver_name(struct dma_fence =
*f)
>  	return PVR_DRIVER_NAME;
>  }
> =20
> +static void pvr_queue_fence_release_work(struct work_struct *w)
> +{
> +	struct pvr_queue_fence *fence =3D container_of(w, struct pvr_queue_fe=
nce, release_work);
> +
> +	pvr_context_put(fence->queue->ctx);
> +	dma_fence_free(&fence->base);
> +}
> +
>  static void pvr_queue_fence_release(struct dma_fence *f)
>  {
>  	struct pvr_queue_fence *fence =3D container_of(f, struct pvr_queue_fe=
nce, base);
> +	struct pvr_device *pvr_dev =3D fence->queue->ctx->pvr_dev;
> =20
> -	pvr_context_put(fence->queue->ctx);
> -	dma_fence_free(f);
> +	queue_work(pvr_dev->sched_wq, &fence->release_work);
>  }
> =20
>  static const char *
> @@ -268,6 +276,7 @@ pvr_queue_fence_init(struct dma_fence *f,
> =20
>  	pvr_context_get(queue->ctx);
>  	fence->queue =3D queue;
> +	INIT_WORK(&fence->release_work, pvr_queue_fence_release_work);
>  	dma_fence_init(&fence->base, fence_ops,
>  		       &fence_ctx->lock, fence_ctx->id,
>  		       atomic_inc_return(&fence_ctx->seqno));
> diff --git a/drivers/gpu/drm/imagination/pvr_queue.h b/drivers/gpu/drm/=
imagination/pvr_queue.h
> index e06ced69302fca47fc26451dfb09ebbb24b57f52..93fe9ac9f58ccc020615485=
e86be438548dcee43 100644
> --- a/drivers/gpu/drm/imagination/pvr_queue.h
> +++ b/drivers/gpu/drm/imagination/pvr_queue.h
> @@ -5,6 +5,7 @@
>  #define PVR_QUEUE_H
> =20
>  #include <drm/gpu_scheduler.h>
> +#include <linux/workqueue.h>
> =20
>  #include "pvr_cccb.h"
>  #include "pvr_device.h"
> @@ -63,6 +64,9 @@ struct pvr_queue_fence {
> =20
>  	/** @queue: Queue that created this fence. */
>  	struct pvr_queue *queue;
> +
> +	/** @release_work: Fence release work structure. */
> +	struct work_struct release_work;
>  };
> =20
>  /**
>=20
> ---
> base-commit: 3ab334814dc7dff39075e055e12847d51878916e
> change-id: 20250203-fence-release-deadlock-a0753c07bfdd
>=20
> Best regards,

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------lP93bN7rA0CHnu9d5bvalqp4--

--------------CskkyaQJf3BODIa095WgXkVB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ7XS2QUDAAAAAAAKCRB5vBnz2d5qsLca
AQDSf4dd5NrTl/6ZEytAXqsI/7m/gVxSbh/x3RhA9ruHEgEAux5PI4zxtEC1mYj2J8AaInRYwRrK
gflhd8F4W8YE8QM=
=/CoV
-----END PGP SIGNATURE-----

--------------CskkyaQJf3BODIa095WgXkVB--

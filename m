Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05026AFB7DC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 17:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EEA10E4DB;
	Mon,  7 Jul 2025 15:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=asem.it header.i=@asem.it header.b="GbgbJUCs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2082.outbound.protection.outlook.com [40.107.101.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6297610E4CB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 15:48:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8pZrxITJZaHSDoVYQz8roTyKpycPexypHnY6JfC8GS1PnBkfgE/J7R/B+sVAEppY9FaeawNWbXj19DQ1I7fenoooiSpSxG4IlwBaLf8ih7J62rdmNIgNUm8+XpP6/A2sfBzITkoce5iKh2z+CyzD0cyF3Vk5vzb1GXhuHEtFFYqIjY8iaoEdv9lxrV0+EMkpTGKbvKNMssXPIkp6uw+BP+ZTPoDJXnvK7xAsRJHeNAZkEThsLTdcUGaZqDmt0hXhTm/vmZZWd+L2j26QIV6uAp1Qd4RRiQV5+yFn+B7LTIZ870sdK7JHZt7G1roBv8SxYy9rOostYC/H7iJ076qvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gt+ky5Bjc7QQJnseKz6CNWETlksIugyp1V/l3sNbZjk=;
 b=AQZzgejUo978QYGG9UhUN5M5As+JT/neQqbiuajHzOO7C65o3v+sR1T8SBbeDB1ROCL7591RFg6Qv8FOnv5XRubTiJnT2HFOyXininsLtjKvI+vvnugOlxfvOPY0GIfxK/nh2cRzmzy5LbNkyreolSvyTM/wUng9fSA3HhEw7CzPWGxOIlm+qkiksMnKC+cCL5Wfer8qC/Ho5WAcbrIqvYwmLd5u6ZRwl9ACBePHBscCBhelYD4rQHjI1PXBa8SeaK7pV1Pfbya9BHmswPmbHcuzlZdyZ0lcWKqafN707Rbz08CrI2JFOo37zjs47it4ueI/Vb0QWYGvFJBpyLiAGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gt+ky5Bjc7QQJnseKz6CNWETlksIugyp1V/l3sNbZjk=;
 b=GbgbJUCsYVrvxWxj3kv65t2/G2sXjzQz82HUJ/Tl/G9QSQ0hut14lVcFZTmS7iTCJJqfu7uPehYwA5rF7+sS/FagY9/HTKPNvwpF21LSvLkFmx8JgI5/6wDtAInjsZuhqi9AiWRa1oZM7Wg886CL11RoT8xX/29/Et8VymPHuAwj8+vL8s1F6HulVlRR8YkyOXDiT2yedMPQkEj6YfBT7Djr+n50/cZWzYj+eQdVsukCPFLeGRelj1d633i8HBih7V2cPs1iGicH/5ZGRw7O3/IHQ/dIMWVQKIAGBng5mymcxKwZ4wBB0Jmpz/3QbN++9Yr4JGZVQ2zrJOxP4i3HhA==
Received: from PH0PR22MB3789.namprd22.prod.outlook.com (2603:10b6:510:29c::11)
 by CH3PR22MB4492.namprd22.prod.outlook.com (2603:10b6:610:197::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Mon, 7 Jul
 2025 15:48:49 +0000
Received: from PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::e21a:e0c7:aff:b839]) by PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::e21a:e0c7:aff:b839%5]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 15:48:49 +0000
From: FLAVIO SULIGOI <f.suligoi@asem.it>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@baylibre.com>, Lee
 Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo Han
 <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>
Subject: RE: EXTERNAL: [PATCH 1/2] backlight: mp3309c: Drop pwm_apply_args()
Thread-Topic: EXTERNAL: [PATCH 1/2] backlight: mp3309c: Drop pwm_apply_args()
Thread-Index: AQHb6mm4+axLigqtv0CvH5FmWjyaB7Qm2BHw
Date: Mon, 7 Jul 2025 15:48:49 +0000
Message-ID: <PH0PR22MB37897034EE96135001A5D492FA4FA@PH0PR22MB3789.namprd22.prod.outlook.com>
References: <cover.1751361465.git.u.kleine-koenig@baylibre.com>
 <2d1075f5dd45c7c135e4326e279468de699f9d17.1751361465.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <2d1075f5dd45c7c135e4326e279468de699f9d17.1751361465.git.u.kleine-koenig@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_e14c1950-b3a8-4278-88f1-6df69d73b9d5_ActionId=247de25a-a100-4440-bf7d-2a1e7b3ddde4;
 MSIP_Label_e14c1950-b3a8-4278-88f1-6df69d73b9d5_ContentBits=0;
 MSIP_Label_e14c1950-b3a8-4278-88f1-6df69d73b9d5_Enabled=true;
 MSIP_Label_e14c1950-b3a8-4278-88f1-6df69d73b9d5_Method=Standard;
 MSIP_Label_e14c1950-b3a8-4278-88f1-6df69d73b9d5_Name=e14c1950-b3a8-4278-88f1-6df69d73b9d5;
 MSIP_Label_e14c1950-b3a8-4278-88f1-6df69d73b9d5_SetDate=2025-07-07T15:47:30Z;
 MSIP_Label_e14c1950-b3a8-4278-88f1-6df69d73b9d5_SiteId=855b093e-7340-45c7-9f0c-96150415893e;
 MSIP_Label_e14c1950-b3a8-4278-88f1-6df69d73b9d5_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR22MB3789:EE_|CH3PR22MB4492:EE_
x-ms-office365-filtering-correlation-id: 56044e72-75e1-4411-a4c3-08ddbd6dc401
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RlFuL1BZaThwdnNEcDN0ZGtSY1pxNGI3ZE01K2UyV3hvNThwWDV0dlVuNmtV?=
 =?utf-8?B?Q0hiakcvWWVqWllwMlpTMEQyZHZpb1BnbGFkSElVVit4bGhEbkNTaVVOSDZZ?=
 =?utf-8?B?bWpQV2hrNCtDMVhOT1JDcSsrK1JqUEh6UnUrNlFpRDBLbDNTNW5NZEZUMklJ?=
 =?utf-8?B?UXp0Uk54OEc5ZFRFTm1ONDZHa3N0K1IrdUZ4ejBEN0cxVERxM1lVdEVheG15?=
 =?utf-8?B?YU9zdE9VMm5yZjhhMCtUQTdjRXFmNHBGVkZuYTQwNlFta0g2cXczVDFpRG9O?=
 =?utf-8?B?bjF5MUowQlNwdU9zSmNSc1E2OEs2K3k2b041VmxPVVAzYzVVUXo0d25RVjZF?=
 =?utf-8?B?Mm9PTHUrR0xWbm9WZzVRdEphNzhRVTBXQnRMdk1GQ3kvMDFWRHcrYkJLanFp?=
 =?utf-8?B?aG93c3BJWmlHSDFPZEV6QW9mK3ZnaWVqdjFGaW00Njg1OW9VY0Z2TkZtcVNj?=
 =?utf-8?B?UXNsTEx0SHJEZG5sUUh5dHpYR1oxQStZSVphRzB6dWwxbnluSGhUM3B0bzdK?=
 =?utf-8?B?R1BRWWtNRUlac3NhTmJpOVFpNVYrOTZab2FXWHY3Y3NxWGxDVnU2V240Q3Jz?=
 =?utf-8?B?R0N1MWVKaUgxM3VSaG1GMHprbzZkSW8vSFlNS0dHeER5Uko2VUlJYlNtcFNM?=
 =?utf-8?B?Y3NjYjlDc3o5TkJXeXh5by9TTk4ybG5URGQ0akIrck4yVThGMnMyaDU4MlRP?=
 =?utf-8?B?Wk0wdmZ4RVZLY0FBaXVpYTM3NW11ZE0rUnBpamxGQkZKcTgzRmdLNFNySXg5?=
 =?utf-8?B?WHFDcWRDeWFzTHQ4Zm1MQXdIYkFFdTZSMWtaVGJVdzFhTC9JMTdzdUkxQkg1?=
 =?utf-8?B?M0tsN3FvRitBdmxsSGJjdmdOVGUwVXcvbVdrRm43UHI4NUJ2ZExGa0tMdmM3?=
 =?utf-8?B?YWd6RGJvU3hEbFQrVVVvN2JUMmtGR1NsUTFRNkZCSnBuVC8vakJHZVZydW9D?=
 =?utf-8?B?UWY5VXVuVHh5ckVsbkEwV1R4TnNMTGhDY1ZrZDZyeHhTOEFUVVJsZkFWdVI2?=
 =?utf-8?B?OGVqSE9hNmVYaWtsRUk3RDkvZ2Y1dkpuUVdzOXF6NzlTZUdudmYwKzZJcEZj?=
 =?utf-8?B?N3c0RG9pR3hjSXpoRXJIaWQxUWUxM2ZmRTBIQWNwMk16Z0UvbGJ0UGUzQTRn?=
 =?utf-8?B?NTQzL3Iyempsd3NNaC9zbFR1K3kxWlRzRnJ1Rk9mRWRvYW9iaUh0NnkrQUFh?=
 =?utf-8?B?SzVWT2IyVzFpd25qcVBGanlta25OQ2gxek9EWkpCS2dENURRaXNzMGdDOXFE?=
 =?utf-8?B?dXBMeFp5RzllWWlLUVlRS2JiK2tHUU9JbndVbzdscnZtbTlPZWd2K3p5Mmlj?=
 =?utf-8?B?OXlMYUJHbC81eXY0eVREcjRNZDZoQ0xHUGhuVWV6Yk5VK2xMLzlVSER6ZFBa?=
 =?utf-8?B?eFlRRU5LVHFuZWJJMWxCeGxpcmxYdTBudm9lN25MblU4YmpwQllSWGJaRlhK?=
 =?utf-8?B?WSsyWHlkNkRKMG45cUNzdWpkdHV5eURiTE9YODZId05IaUJuVTM0U1RSMUly?=
 =?utf-8?B?azl1VUZHUi9QTTM5Z0UxMytCMEtRcmNHWXRKQVVvWlVrSFVYWU92RUorTUZJ?=
 =?utf-8?B?eW1BSk83YUQ0anlPT3hDVHp5dGZrcHU1bHhWTC96eFJhWEdZcWxFRWR6dlps?=
 =?utf-8?B?T2xDR1duRjdmSm1rODQ5cFlPNnE0WVpaZXFlT0hIMWVibFBPWnlqaGFwQUI3?=
 =?utf-8?B?TWN4djJwcVlOMnk5dUhBS3dIMnVla0trMmJKQS8zY2Y0ZW1Jd0R2ZTZyaUpE?=
 =?utf-8?B?bUFsVzlGMjVjQlhyVGlQOCs4V0VUTkpoYlM2VG5lbmM0VnF5M2RJZnBiTVNn?=
 =?utf-8?B?T1pCYWpUaTFOdXZRMDhjbkdZRUEvS0NneGd0WVZXTEpuOWU2OGE4bnI4dmlB?=
 =?utf-8?B?UEFBd3FNN1hyejlMdGwrYnNtcFdoZkpiTTRHT3M5MkYzWHFkQm9mcCtSVUFn?=
 =?utf-8?B?aGM3NzErQ1dTQ2ZGanc4akNFeUZ1NUFCbHJ5ZThZSzZZL0RDbEZYSlMyRzJW?=
 =?utf-8?B?dGFDSVRWaE9nPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR22MB3789.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGhJc2RoU2FXOVhRQUtrb3JvY2wycXB5bTZQaDdGKzlMVG41WU4wNEl5cHpR?=
 =?utf-8?B?emtxZ0VtOWZtR0hyaFFGMlhEV3o1L1pWYnpFeHhhbXRzWVdObTZjeDNmajZ2?=
 =?utf-8?B?WUJmeGFoUnB5T2lTaDNpTHJzbStKdUVBZ1A3ekhmTHkzMlQ1REZFODZKbFFG?=
 =?utf-8?B?VzdRYnBJMzdVNnpZdW5HVkVjejZUcXFNN2Zmd0dCTUNtSlR6VGNzOVdZMDJY?=
 =?utf-8?B?OUw3MzltMDNWcXNYbmhIZjlMTXNJdEI5SmRXTlViS1BsaitKQnJZYUcrbHFz?=
 =?utf-8?B?ekJ4Tlc5cFFwTm1JcnRtTnBYOVpWRGU3RWM4MHRPbmNzNnU5bnZrb1NRTjA1?=
 =?utf-8?B?Q05kbnh5VEU3YXFqZWRnSGMvT251ZGU0OVFYUy84NlZER0xpQXZQZFZjWFJr?=
 =?utf-8?B?S2Z6NXF0TDJTdkpQdFl3RXptNDRvSGlvZ3NOK1VWYm4vK3VkdUIwbzR1NGNE?=
 =?utf-8?B?VktCMnowd0gzTnlzVVFvNkVqMWxBOFBodVJvNllodjZEb29rQWNTTk9FdllH?=
 =?utf-8?B?TjdlOHBLLzlZNWZTMnBsNkE1aFdRQWhCa3RzRTBSYmNWbUdicnZDYmc1RTV1?=
 =?utf-8?B?YmM3UXJueFJYZk1ma05PTUdJVVFpM2RSUENJZnJYNVBDdlYyUkhSZTdmUC9a?=
 =?utf-8?B?SWpUTzFmbkFvWG4yZHRnWk05R2kxckxOVGo5Sm56Wkp3ZjRxdDVtcTI4SzJU?=
 =?utf-8?B?QkdtNHF4RVkybW84RkpGL2dFdjN4YjVEWnNCUi9JZ1lGZ3AybnJERkxzL3RB?=
 =?utf-8?B?RjRjWGdSTnJ5aU9qaElTQXNwSUg1VkJtQWpkWUZRbXZVcXUxcmowYlZSSyts?=
 =?utf-8?B?K0dTSGhwZzM4Y3pTR3N0WTI4ZTh5QlB6aHp2ck1pSCt0a2lFUy9nNEdpdFB3?=
 =?utf-8?B?MlhBMWhsRC8xMVAzaGo5R3M0bWRkSDRjMkNlZ2tydmxyaWxCOVkzc1JBNFJQ?=
 =?utf-8?B?YWZSSVo3SFhncGNsTitMdU9xMGJXb201R3oxeU42UmkxdHE2SFNjVUQ1bERQ?=
 =?utf-8?B?UnFUc3ZKaGU4NEE4OHBVMmp2aE9VSEZ0aDhyS2hJMlI4OS9PdEhmSGRRRm01?=
 =?utf-8?B?bDlkNzB3T3E2aW51US9jUzFDZDYyeVBkWW05RU15ZFpoNlJSUjZUWFJ1b2J5?=
 =?utf-8?B?Nkp2MzRyZCtMSDgyRkRVb1o4VkxHMVZVL0UxT0VmakJFMFNrWWRrekZReTlo?=
 =?utf-8?B?Wk5BemtXUjZ1VTRKVCszTGFuS0ZrTGRicWI3WmpaODNmckxaSzYycXlvaDh2?=
 =?utf-8?B?Wmo5RHpoMzhLN0tGenRWOUtZb1B6d2dOQ3NNYmVxZndFcG56WTRBOXQ4Lzcv?=
 =?utf-8?B?dzREd1pxVUtwTkRpZTFFbmNiaThnQUVLMG9RR0RHWFZmSmxBbWNKL0hoZTBz?=
 =?utf-8?B?UnJkc0pFangyUzdOUkUyYTF6bElFQzVhWDZLN3IzQ3crMzZXQU5yMzQzMXBL?=
 =?utf-8?B?Tzd4cG5LZEJPaXk1ODRIVFV5QUtyZEZ4bFhIanlCSDBXSkl3N1htUDRvZ0s2?=
 =?utf-8?B?ZGhPQUxJWGVNVk5sdEZuTXpSSWpRNjZnRmFqUVhYQ1ltcG05OFo0YVk4b3pX?=
 =?utf-8?B?MVFpSXNYUUNIRVNkZFpsMEplMkdSTkZJQTVqclZKT1BqNUp0Y1NFTis2YnJa?=
 =?utf-8?B?MlZGVDFpQXE3c3FWWUI1S3VibjNRZlJBdnBiTXdWQVdtanl3eEgxdnQ0cWRu?=
 =?utf-8?B?SnN1Wkp6ejdmWHJIajVDRFVlaklFOHFuOVZ3ZE9LeTRwTlpyaURpZXpLbDll?=
 =?utf-8?B?OHNXbXEwMTkwSFltZEpBa1BTUit6UXFQWkVvOEpNeDFqMDZyZTBGU0RFY3Vv?=
 =?utf-8?B?cWR3aSsvZFRISFVIT3lBSGpad28vTnRiNVBPUkZSZVNRSHpsN1V4V2tTNG8y?=
 =?utf-8?B?QnJSMTVGSlBZSTNHY1NncForSjFzTEhhUGFVbnpYUFRHeXZzSW5MczEzZDN0?=
 =?utf-8?B?ZnVpQklMR0dIZEtINEptc1hVTHN5YWhyQnRIRktsdGE0ZmIvajBlZlVLc3hY?=
 =?utf-8?B?akFranczTk1GMzBob1laNzN0NGVocktOaFRyZVBMdHhzY0pjLzlZSEw5NVpI?=
 =?utf-8?B?NUFBM0w3Z2xkeXpCTk8yczc3L2hSL1hMSzF3Sk01dXBaNkVnU3p5UUxPZEV6?=
 =?utf-8?B?Wlo3MThFbzFNNmVnNGQ4dnB0azZGc3Vid1A3eTFOc3pOMGpJUjQzNWZPZmkx?=
 =?utf-8?Q?uHn4Zfw8SKoxhoMeaxW6DU4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR22MB3789.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56044e72-75e1-4411-a4c3-08ddbd6dc401
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 15:48:49.3530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 855b093e-7340-45c7-9f0c-96150415893e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: erUdYQC6vfOlXK6eZ0rIEJn37MWwVnmwSjbFA/+E64PzDdnXLSd4WCvMtnHye1S/oYxvmKh7PkA8hmfJXIKKBUWXkw7UPGMCmlOXzs3m+EROtyHva+ttQLgOvlELVQsR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR22MB4492
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

SGkgVXdlLA0KDQpJJ3ZlIHRlc3RlZCB5b3VyIHBhdGNoIG9uIG15IGJvYXJkLCBhbGwgb2suDQoN
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBVd2UgS2xlaW5lLUvDtm5p
ZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4NCj4gU2VudDogbWFydGVkw6wgMSBsdWds
aW8gMjAyNSAxMToyMw0KPiBUbzogRkxBVklPIFNVTElHT0kgPGYuc3VsaWdvaUBhc2VtLml0Pjsg
TGVlIEpvbmVzIDxsZWVAa2VybmVsLm9yZz47DQo+IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsdEBr
ZXJuZWwub3JnPjsgSmluZ29vIEhhbiA8amluZ29vaGFuMUBnbWFpbC5jb20+Ow0KPiBIZWxnZSBE
ZWxsZXIgPGRlbGxlckBnbXguZGU+DQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOyBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBwd21Admdlci5rZXJu
ZWwub3JnDQo+IFN1YmplY3Q6IEVYVEVSTkFMOiBbUEFUQ0ggMS8yXSBiYWNrbGlnaHQ6IG1wMzMw
OWM6IERyb3AgcHdtX2FwcGx5X2FyZ3MoKQ0KPiANCj4gW1VzZSBjYXV0aW9uIHdpdGggbGlua3Mg
JiBhdHRhY2htZW50c10NCj4gDQo+IA0KPiANCj4gcHdtX2FwcGx5X2FyZ3MoKSBzb2xlIHB1cnBv
c2UgaXMgdG8gaW5pdGlhbGl6ZSBhbGwgcGFyYW1ldGVycyBzcGVjaWZpZWQNCj4gaW4gdGhlIGRl
dmljZSB0cmVlIGZvciBjb25zdW1lcnMgdGhhdCByZWx5IG9uIHB3bV9jb25maWcoKSBhbmQNCj4g
cHdtX2VuYWJsZSgpLiBUaGUgbXAzMzA5YyBiYWNrbGlnaHQgZHJpdmVyIHVzZXMgcHdtX2FwcGx5
X21pZ2h0X3NsZWVwKCkNCj4gd2hpY2ggZ2V0cyBwYXNzZWQgdGhlIGZ1bGwgY29uZmlndXJhdGlv
biBhbmQgc28gZG9lc24ndCByZWx5IG9uIHRoZQ0KPiBkZWZhdWx0IGJlaW5nIGV4cGxpY2l0bHkg
YXBwbGllZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWlu
ZS1rb2VuaWdAYmF5bGlicmUuY29tPg0KDQpUZXN0ZWQtYnk6IEZsYXZpbyBTdWxpZ29pIDxmLnN1
bGlnb2lAYXNlbS5pdD4NCg0K

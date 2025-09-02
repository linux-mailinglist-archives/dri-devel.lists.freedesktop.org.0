Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3AFB3FB31
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42F410E645;
	Tue,  2 Sep 2025 09:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="N4KlK53K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazolkn19013081.outbound.protection.outlook.com
 [52.103.51.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6D310E645
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:51:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNOsGMx53nwsfWey7JfMWGArDkncc4paznKWPtQyzoF0dRuF4orJX0xEel0kEK0bL1ZZ+ZcG7ojWr6q171btutCtAM4aaEuKzKpGjNiBpt6ufTFF9J/cFAykoBxRgXyEzkuTlYp9FzLVnUOAA9P+r19cRnkcbAWkqkHJegtcmsIkNdH+Bp2H/UX0QewKcyoFidJYty/5TX0AeKUwlRDJMCQ2zg0j0xne1kHl5f1qDeQU/OjVM2sMYDWZfFjI3NjCntaS5pl7RaxNl/aiUj25n/QB4DvZpt057QJ8lCDl003Kgs5BkT+4chUlAs8U717OPjJmIVY/PMNi47Pvp+UHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ou+ejlbwKEycOi5pbYhqsHOOTXpcajXPOBZgjTIwuVE=;
 b=ct/Tsw92T2bc+0b0VTvNeK4ZK3Nbxy1nXZKK9q8HiBNeW52lS2DTgsZ5SXSBy5ueQ91xSD1Cg7hBzrgO9L5cj5QJi9aTgfOD+trm+RqhwPGpHHkL0+/andsOXw209Dlxr7PIkQ1dOfQmKw+SQKyKzRvKzYr8LgQS0t6m4nA/50B+f0HTAJ5sHS80x8YM6Hz+XZXSKEPep/ENxB1OIlZZ+Fk9UzfJAtkimPxy8axVzk7bqP8oKWk9N57td4V90yhjlsP1drF7+FgqZdhyd5t/n0ngxe5gBGtVxUZI68Ybo+R33zW9CxYYABF8URyg8e3Myb9VbM3GIDs3qe9JpDlP+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ou+ejlbwKEycOi5pbYhqsHOOTXpcajXPOBZgjTIwuVE=;
 b=N4KlK53KcL7xyWcYDW/c/xQ3o9KcGXLlGJXfskeIvr73YhcVD0YcneT0pMuHg85dj2vvxCjGpcpkYIzz1VhDnhizhxmXAlx7eP7WSVlwRVPBNIHecXNcpyMRL+eBnedGOQwe5U5nqAuZa4GjtJcDhYpY7jzFHnMC33ccaGDbkIDUJAMhP2/u6UFQ+xcmDBI2NpaVmeMsJRPIMIUxjAKPc/0A4UfmUEzI6oxHpINU2ptbXs6n4hT2EbMcwBtBpgqshey0WaJisyloXPo4jWJtkhE5EuXTvGq8TugVDB2gk89r2BE8QfeQKRB5IV8OGvMG3xj6tQxRDFrfNETcZlkXpA==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by DU0P189MB2372.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:47c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 09:51:42 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 09:51:42 +0000
Message-ID: <AM7P189MB10091286D1F4DF0E43D42510E306A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Tue, 2 Sep 2025 11:51:40 +0200
User-Agent: Mozilla Thunderbird
To: neil.armstrong@linaro.org
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andersson@kernel.org, andrzej.hajda@intel.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, kishon@kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, rfoss@kernel.org,
 robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, vkoul@kernel.org
References: <20250902-topic-x1e80100-hdmi-v2-1-f4ccf0ef79ab@linaro.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: bridge: simple: document the
 Realtek RTD2171 DP-to-HDMI bridge
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20250902-topic-x1e80100-hdmi-v2-1-f4ccf0ef79ab@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0063.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::14) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID: <61c63fa6-ed5a-4527-8993-1aab87ef3a94@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|DU0P189MB2372:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aedb500-aeab-4fca-4c29-08ddea065178
X-MS-Exchange-SLBlob-MailProps: iS5pQZgsAQAQzPBsqL0qQYWYJhuVqIOi7Ibv0XfYq88sG79TTKYJ76VPBjhCbykGrNf/iZLDnw3d6OAgD+tPsa3E8suhNlYeYDUHl/okvqO3eWLuUQ0gJ//XTkPMryrsY+zqqFFJ+p7nkZT2KE5yyE/I7ta/nQcioFqQGF2UW1Ob3wHqIotceVrsP3KhW2ICa5RBiqpfi/DAVYplnFsqu0kAdQ+TTcWfwwAVMrL0BjV/foSReyRnVfS11whxANhpbnW6q9NisbW6Ojw1L5H/KLpb2s0tA4thkAmgSx9f7vEBc+NAEJu2HCHXJlgPoFz82Af89sGMMsmrYVs2tm+YhTJQyfluDCTuD2Ih2ck4rcBPyqvx44MFGlkx29wYfC0jueG1IbYDHqYS0H9Nr3xaPklBWxRLmr6yTnx+2otk1um5X6Vmr1p9XwxJTnC59k5b9GL5ChP9cE4F3nORGmSkF3qfhHPHJQydzZzREIxyhQfwuyo1TOwPpmxRQG4akA+1LQB9pOZ/t58Iuq0RePvwkO3yNm/afKDKXa74vD/KXlE3BeksFms2qYKrbJ2/lAFC+I3ZxlRghy9EYXJ8dfDCFc0r3n0XdaBBYn6n+Jet8vHByFtsHqAtqi0Wie+MRGfwH1wbfJcbxjmxDEFEcj7OsiKmtE34On8Pf02XvuGaaHG77Tsee/b+KNApodpHCs97/wTGQ8kxAsQkd83FQUmI0waDPS/zlh8WRR9X3594ov86svsR5nBuKg6DvcjGhghqUJY3WdGh/fGi45id4DExOjJ63Qsc9uRLFOOlXGJWdU3WbW86197pNu0je5VNan3J
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199028|6090799003|23021999003|15080799012|8060799015|19110799012|5072599009|1602099012|51005399003|40105399003|440099028|4302099013|3412199025|10035399007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFNKSXNTMDNrcFd5bW5XU0ZjNDRJL3BSM0Y3N1N4WTY4Ky9IditzQXhiMk5j?=
 =?utf-8?B?eGU0QW5MVFFIMFZRaThReFNHWHl0c1JSYjBXU0htWE8vNzNocUdWVzFkSklL?=
 =?utf-8?B?eXZZUlk4RC9Ucy9IZ2dSb29MMFpGdnBvaUhXZkJieWtkaWQ5cFY4NTNpQzR4?=
 =?utf-8?B?NmpXNUwyckNMSUxjaUlMSjF5Z2tUZGtKTEd6aUR4dERNOWlQNlprcXZ0dmR1?=
 =?utf-8?B?bnE5TE1CenQrMmhUK20zTGg3MVZ3UWc1SjFCK3AwV1ZyQjZpK2VnTGtuaXdt?=
 =?utf-8?B?NndvdWNYcENRcGlpbTJjYWYycW1HQ0NncGV6VVRvMDcxRlhWVnFWOUZzMUJo?=
 =?utf-8?B?eURkcXZ0em5wdGVsOWlyakpuakk2cW45U1ArNVR3ZEFwNTYraEV3QVdXNnl3?=
 =?utf-8?B?S2xaK2hlZVFzc05qcVFmTERwVjRqOHJWRmhIeTd1eDBzdWQ1dlR4bThCSllk?=
 =?utf-8?B?TWZXT2hFSXFFSURrb3dpdWNPdkM1a21UMlZqa0xtS2ZTbG9aTm44a0dFaGlM?=
 =?utf-8?B?VGU5RjkzZ0VqUGNoeVZHRm9FdXo0Q1BKQzNpVy9nTUNwUFIyMWdCVS9CaEhW?=
 =?utf-8?B?L3M3SWZOcnhBT3djSVZ2RnJpK1dFQW1NcGdVVjBlOXZJSWFydjZFVUt0OEc2?=
 =?utf-8?B?WUhLWC9xclZzTmNDcEJrR1FWS0ZSazQ2bVdCY3VETUFGV0hFeGl4c2pzZzM4?=
 =?utf-8?B?QkdHQThBT1B3b09KOUJKeEljYUN3VVVVOGt5SlBkYVArNldxNUFPTE5Bc3BP?=
 =?utf-8?B?a21NZklrVUg1anlTZW5McEl2YjdFRW5rVDF1RmowcFRlQktKNjF2MUdxS2JO?=
 =?utf-8?B?c2M5MkVYamVLTlVDdXRhZnNoNmkrem5vbmtoS2Nwb0VsL00zZTFnR2hocmFO?=
 =?utf-8?B?RzczVGtPaW9ndGg5QlRRNldQOGFhbGhjTFliWFkzdFg2djc3blE1TDN2eXk1?=
 =?utf-8?B?SGtoR3hmaDdZeGlIaXh5TDIyWEZ4UWJsaDk1aWkyeEJQLzZ1eFE4MzVJaVlP?=
 =?utf-8?B?TEVWRGIwTDBxaVUxRVlST29MUVM2L2RUYVIxUUlCOWpoOW1TZVRXYzRVMkdF?=
 =?utf-8?B?ZDZWeFFSVTZiblV1N1hPMEtoeGVzdDE1bm1kMUh3RytmUEhadVpmRm5FV3I4?=
 =?utf-8?B?TGNhU1VmZVRjU3o0eTdBMVg3dVc3N254eU5PdGNYYmQ4MWJEckNBZWxOQTZ5?=
 =?utf-8?B?a0JCMjByTkdqYks3L1lvV0tKTTNYK0NTTXNvckFwQm9HbFhGYW9idlByV3dI?=
 =?utf-8?B?bHhNVE53aUd0OURneHpVVmI3THgyZDJsNjNteSs2VEc4VmcyT1RZNWo3NXRw?=
 =?utf-8?B?MDFaV3kram0zcXVIUkpZOVlpQ1RjeURodDRYRXM4N2JBMHZBa2ZRRmRVa0Vh?=
 =?utf-8?B?NFRDY0tpK2FmMFMwNDBmZit2ejJJd1RuUlFWM0lTNWVRaE9EVDBTZHlFMXFt?=
 =?utf-8?B?RVBEdE03Uk84Yk5UZUdlaG15WUF0cXdaNFNUV3V2VDR1Vk9tcExiSFl0UGh3?=
 =?utf-8?B?cEtKQ1lLWC9LeEtxVUVudHBLY3lEUGMvRXRBSXlDcUFsR2tML2hPY3VZQ1lq?=
 =?utf-8?B?Z1JUdmVBRDdVcDZzbEVXM0twRThHeU9Wd1N6S1ZhQ2dvd3JNUHFJYVRaSEt2?=
 =?utf-8?B?L09iU1I1b2VGQTVvUmlsbVB2V1lhWXdHQmhpaDROeVlwdyt0MVd2Uk9uRXdV?=
 =?utf-8?B?Tmp1SGxuRVhGNHZaZnl1YStPYm4xUjV4TEZ4bVp4VnRVUXRPOXVUSnE2ditk?=
 =?utf-8?B?N3pQNmJyck1YRXJRTUFEWUdCSTdZdnNaM1lXRWlua2lyOWNSWFIrcFlFdU9a?=
 =?utf-8?B?RjZ4VTRsU2ljcWFTSjlEUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHB5cmFCazJwZTRkcXo1b0VXUWVIUmUyck1wT1M0WTAwbVA5V3ZOZ09DMG1s?=
 =?utf-8?B?ME8wZzU4bUJ5VGRHWlg2Z3Z5OGJVcFVTZ0lzOFJzMUkwVG5UQkRXN0JjS1NL?=
 =?utf-8?B?V0pWSXRnYU8zNXFqRy9SQzdTNmd0Q1RHb1FWbDRBSTlxR2FjbVpabis1T1JS?=
 =?utf-8?B?OUVVQkhhL3pHQS9IeFpoeVZVS1h5Tk1BK1V0djlZQ0p1L3dCQ3NBKzhhNlY3?=
 =?utf-8?B?VUFqajhTTkt4QkZqTFp0TldpN2JyWVVGSEsvSlljNVpqdWQzTlY5ZGUxbm1W?=
 =?utf-8?B?SWQ0R2N5Q05UelExRlA1ZGRxNUVZZEQ4b0RpNERqUG40N1ZLeWtXOXAzcUVr?=
 =?utf-8?B?NGlZMkN4SWJaakJ0YW1XL2x5TXFRYytJSHpGYnJacW5zbWt2RmZmR1l1dUhS?=
 =?utf-8?B?S3hJWkVUSFVKcjAyVitOeXYwcTdpMzlVcjl1TTJxWGRpVDlrVmU2QzNUQWN6?=
 =?utf-8?B?QUZXZGtqRnJXVU0rak9hUTRDUEdCMUR3QUpHSjd3Z0xXd0dnemIvNUIyajBa?=
 =?utf-8?B?UGdwR1QrbHZ2OEtpd1BFb1lHYXRiTGxydVdIbU9WZlEzMlVaL3pYaWJLM0h1?=
 =?utf-8?B?eC9mRGhjalhGWkcwRkcyUGxhK3NqeFg0QWFHMnRaWWMxU2t5ZFZNTHhHN2RU?=
 =?utf-8?B?RGNPUmFLcjhzZVpwanlONUJNdjVEN0JLQktzOWhITkRCREN4N1B6cVVBM20y?=
 =?utf-8?B?TTRRU3FxdVA2MUliVElPSTBidVIyQ0F3WDRxbjFKWTM3RkNUb3JuNWtEN1A0?=
 =?utf-8?B?OER4TnJzU01BUDNnVnVEdGJpN1U5ZUtlSTQxZU1hUDV3OTBjeGlzejRPVHQ3?=
 =?utf-8?B?ZXVtMUJ0UFd0ekJZZ3loWEdoNGVjRkFGekt3T0FNS1kzS0JDc21kd29qdFdh?=
 =?utf-8?B?cElEOWw0ZlVycnU5eDdPUnErNGFRTXRYSjcwR2IzMk92b3AyYmM3bTJoZWM4?=
 =?utf-8?B?U1lYaHVHUWxOcnh1b2RMaHBndGFGeW5qM3EwSGQzVTljb3V3Y01BVVlDNEp1?=
 =?utf-8?B?djU1OUZmd1lHMUMvYU91T1V0TmowbnloSFBJblM3cGtmOG1QajVwYm9jVWVL?=
 =?utf-8?B?cFNrM3NPcVdVUFI2ZDM4NDRCWE9QRGpDK2R1YkQ0WHlLbTdqaXVJenk4b29F?=
 =?utf-8?B?OE9mWml4UlYwcEs5N3JJMGdMTmhoMTY5U2FmSXlSSnYzQjBFdDlZczhZTjVY?=
 =?utf-8?B?eGkxMzc2UjFCeUVjbWdaRENaVm5xeGo2bHBQWGE4dTU5ZVpaaDFFalZ5d3ZH?=
 =?utf-8?B?eTBzNzlLbk9UUjJvbCtyNXVDU2VsMG8xNzdZSGdGcC9TRkNZWUYxZ2JXcjV2?=
 =?utf-8?B?S0VLcUwyNG5WeGgzYlFvYnpHZWdUOU9UbitZZDEwdGdubDIrQWJBNlpHUGZo?=
 =?utf-8?B?SGNUYzNGTGMwVHhlM0RwVjZjcXVGdjFObHhUSWhiLzhsblA5NCtPV05kRlYv?=
 =?utf-8?B?aEgvSDFPZmtrOE9Qd25YTmN1RDI1WmljcEwzSDRJSk5DRXVjYldGOGRoNGIz?=
 =?utf-8?B?NEdITjg5ZXRqR0dGb2xIUXRNMkZoYno0K0Uwd21jNmkzeWFCNnQ1MVk4M202?=
 =?utf-8?B?TWtsMXpndmc0enN5VU15ZjM5L0JqQW5lMlpEdXl6blJtV1pCMGlxT2traE1G?=
 =?utf-8?B?Y0Y2V3lzbllaanhTUHVJRnV4SDVxMEVDeFBIeHN4YjMyRlZ3MGZOQ09aK2FB?=
 =?utf-8?B?VkFYZnNwMUhiL2NYakVIbkRGNTZNdmJ1ZlNXOXI1bEo4MWhCSjZwMEdWaisz?=
 =?utf-8?Q?rrgHnZ8Lhl7QreuqanO37gj/Kb7a9u4/X4oodKr?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-2ef4d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aedb500-aeab-4fca-4c29-08ddea065178
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 09:51:42.4545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2372
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

Hello Neil,

> The Realtek RTD2171 chipset is a transparent DisplayPort 1.4 to
> HDMI 2.0 bridge.
> 
> This chipset is usually found in USB-C To HDMI Adapters and Docks,
> or laptops to provide HDMI display output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> index 43cf4df9811a5897843685727a49fd5a90096391..003a1c934f863864400d689cd784990cbc1de3de 100644
> --- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> @@ -28,6 +28,7 @@ properties:
>        - enum:
>            - adi,adv7123
>            - dumb-vga-dac
> +          - realtek,rtd2171
>            - ti,opa362
>            - ti,ths8134
>            - ti,ths8135
> 
> -- 
> 2.34.1

I think this has to be rebased on the latest next since [1] got merged. 
I think we also need to consider maybe using a fallback compatible, 
because I think there is going to be a couple of simple DP->HDMI bridges 
on the mailing list.

Link: 
https://lore.kernel.org/all/20250822063959.692098-6-andyshrk@163.com/ [1]

Kind regards,
Maud

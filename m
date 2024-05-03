Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86BA8BA733
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 08:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AD810E879;
	Fri,  3 May 2024 06:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=asem.it header.i=@asem.it header.b="CXTeauON";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A2B10E879
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 06:47:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEFp73WuPXcgZLkGAc5tYkv9z0drj1pHy9Pg19vumo4fWY4rcXI2qHmdWy0/6cCjkl8xtc5c7v0jeX6AkmSG4pMuKTXNAsNbLKuRJgfgicXY4wLS1Jh3ctnBKW7NAqIiwzpdPN0t92hp8jAdWDFvS9MdJEYnT0KwyicMPGNM5nSVYMrUborLu8cifogca4eLkOC6RasaMdo4ZC5wybHXf0UrCSGJOrCHofZUx0m4iDXv50ccVqRaKup/iY92yffC1wf/PWpl9AWNRMlxCMjb/GvNl+1/Wkz9euj5565qf5P/80RNj20/+MQNWM06ntBJ4m0e5JJ162OIT0M4a110/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLoGxi3h2OAtjI/kNZWbq+KGFr8d0pKT1zrQSpu16Ic=;
 b=oJAuipagR2Rsd/xUWlwQ2FrDCh6Wk+KyR+LHlTq5bFKYt7PaagxceizESBz9OKrLXe8vV8NhECsGSLluZsGKxq9v8h3dS8DbnnqXZxmVtzSbI7KNiau4yqTWHfdwdKBe49+ahPixTDxjtrYZJcFCzhCHF/qOU5W3m+LlJ1EudoRd20gpjF/m+opxmQYLHq/34WKlfeypz5Vh9R1A/38Mh/esogr9ULnRwGor65aID1KZjG2lz1F26JYX31E0I2OJeWT+CP1ThWsAxQ7vJDy93ScovZ/ddrVhmD07z3xF5YvxJKXKmVQHueRSKyG4x2VQgrXzO2zk58AG0O6ym+Ikkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLoGxi3h2OAtjI/kNZWbq+KGFr8d0pKT1zrQSpu16Ic=;
 b=CXTeauONgRBcQJWCn0i0aieLJwptNP4JQ6F3p/5tgQAkpQQFa4tSGDrYwSn8IFUMzhOB0GUA2AT+xFRASwG95ymzLUDUrNqMryY/qtyslxdhb/cN5CY36rk5YbRtyDzExrJIupM9+/HEcgB1F0uvgWAmRXYgzYPNkqYnMQai4hwCELi+H1n+vvibl0fVfpELqZS13nff54PZ9tHitW2rSJ4+9cXPMRXj/aeLVIMP27oRJZF93vW+bKuxeR5OKmtVZDCEi2QGJU4kA8kBmU/3DyFR4/BYr62AFscc8OA7LHyzYyOAw7GGV+q0ZL/rp7oiIPr1hElgJQlUFJ7d9H/3XA==
Received: from PH0PR22MB3789.namprd22.prod.outlook.com (2603:10b6:510:29c::11)
 by SN4PR22MB3303.namprd22.prod.outlook.com (2603:10b6:806:217::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 06:47:12 +0000
Received: from PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::e21a:e0c7:aff:b839]) by PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::e21a:e0c7:aff:b839%4]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 06:47:12 +0000
From: FLAVIO SULIGOI <f.suligoi@asem.it>
To: 'Lee Jones' <lee@kernel.org>, Daniel Thompson
 <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Helge Deller
 <deller@gmx.de>, Dan Carpenter <dan.carpenter@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: EXTERNAL: Re: (subset) [PATCH v1 1/1] backlight: mp3309c: fix
 leds flickering in pwm mode
Thread-Topic: EXTERNAL: Re: (subset) [PATCH v1 1/1] backlight: mp3309c: fix
 leds flickering in pwm mode
Thread-Index: AQHanLCP5TSeO9WjhUOCMksauhdR0bGEJ9mAgADpMWA=
Date: Fri, 3 May 2024 06:47:12 +0000
Message-ID: <PH0PR22MB37891FE6DC843E8EF05BDF7DFA1F2@PH0PR22MB3789.namprd22.prod.outlook.com>
References: <20240417153105.1794134-1-f.suligoi@asem.it>
 <20240417153105.1794134-2-f.suligoi@asem.it>
 <171466849494.1206441.17324969195592920195.b4-ty@kernel.org>
 <20240502164853.GB1200070@google.com>
In-Reply-To: <20240502164853.GB1200070@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR22MB3789:EE_|SN4PR22MB3303:EE_
x-ms-office365-filtering-correlation-id: 2237bb17-7ee7-40d9-6b4d-08dc6b3cdcb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?SnI5eGJrRW8xZzVDbkFBTEFGSEtyaElUMm1TWHRnRXlIVTBONllsR0R2OE01?=
 =?utf-8?B?WFlsYjFKdFBaenl2ZUR1U2s3cmEwRVp4RTh3VjRyU3ZpSzJqSk8zYlpMTHhY?=
 =?utf-8?B?T0lqNmxoVFEyVVdzbEsxTmFhM0U2d0NYRUlrYVFZbHBhNGNEUFRwMTlEM09D?=
 =?utf-8?B?N2hDYzQyb09pSFRFNjd0OUFpV0sxSm1zMzllU1VJSVNtS2JVcG40c2pLdk5G?=
 =?utf-8?B?bU5SRzVEUmdIRkZ2SkhEQnluRFRvaTk3c0lOK2xHQzd0N1Z6eGdzMXRJak1T?=
 =?utf-8?B?MDNXTG9VTDlGVURkVVgxT2dYNWpQb2JEVWtINlh3NTFxemg2NlBDRmw4VU9B?=
 =?utf-8?B?R3MvQ3BzN3BMZ1BTcTk1b2hWZ3FxV1g2ZzdGQWlDUjRNcTRnWEpnRnlWYUc2?=
 =?utf-8?B?eVZHaHhNcmx4UlprNlczcDg1K3Z3ZWpTNkRmNXFVZDJjNldiblVJV1JBOUJB?=
 =?utf-8?B?amlNQVpTZzZ2SFZ1bGRVMnhlSUt2ZEl4cS9OaE05U2hpYkZ2akhHS3NtL2hu?=
 =?utf-8?B?ejhNaG01VFZ1MXVhTGdvUTh4Q3Z4UGJxNVFuTWRGTUpyb0V3b1hPdTFpa2pN?=
 =?utf-8?B?cjBmTndiSU43SFJjd2V6TEZBb2wzcVcza2NxSGsrWEpOTEZtVXRpdTI5SFBX?=
 =?utf-8?B?MFhNK0J5emhwd3c4TndQWGdHbDVhQ1QwR0Q4ZnVaZ0tmakRpZ09yK2o2VE1h?=
 =?utf-8?B?aTlXd1V6YlFNM2ZMZTUzb2ZlN3FTcWRZbk9NNk8xNVdiSitPYzhaK3ByL25F?=
 =?utf-8?B?dlNUWkFtU0hzRUFsUkZPSnZYb24wY0lROEVIbWlvT0Z4Nk1pUGppNnpubk55?=
 =?utf-8?B?UVZGUWFEKzFQVDZpMUV6RjhzeDB6YURqejk4K3FJb3NJT3VQR3IyOE5ENE1E?=
 =?utf-8?B?SG12T3ZHd1NpSXdPaUp5NG1ZOS9aS0QwQlRBODlESGx4QjJyZUZNYVdaTEtU?=
 =?utf-8?B?RHhRQnZjdTEyR3QvMGtsV2tkbFNjNUNDKzYrakd5S1dpdWxzTVJmT1Vic0VW?=
 =?utf-8?B?M1RKanp4TzZ0RGtJRkkrV0Y3OStlS3h5WkRwNUR4VEVjMzF4cFJldlhIcEsv?=
 =?utf-8?B?ZGZRRlVnQ2FXeENiUmdHeDUyS3cvK2FOQitqTWZJSVBod3czdHBMWm0xRHRE?=
 =?utf-8?B?YTU1UVJnbzV3UmlCMUNPKzVhTjY0VHMxRlkrQ3o4eTRPYXRndTM0UFFFbS9W?=
 =?utf-8?B?MTBEUEcyNnE4dksxTDI4cFY0OU1iS2ZLYXNnOU9KM1RJM1RrNmpCZVBydnFC?=
 =?utf-8?B?Q01HcE04ZThvK0VCMGJnNTBzYVlmbUNwbmxnYVJGNit4N1drUi9kUkJKKzQx?=
 =?utf-8?B?LzBHUStaT1VuNnVzRy83Vkliazg5a3UyR3RPcVJTYUlaMWZBU1BzUlVYT3Ro?=
 =?utf-8?B?Z09mN2ExeUdTbXRKdkxqYk5pbnNNWXV3aURuWVNoUzRwN1h0MU9IM01sY2pI?=
 =?utf-8?B?dzZNWXZsSzdOd2xJU3ZEdFh2Y2pCUlhlQm5hQjFCL1FwV1Urckl1YmNHQmV4?=
 =?utf-8?B?OVduaEMySU1lQ1Y1a1pxUFhHeUdjVTJGN0hxTmJZaHNxRFNiMGZ6ZXpoa0xV?=
 =?utf-8?B?VHBhQ2orZCtmSEVQdjFiZlNuV0JsbDkydlNLVkdLUmk1c2wzWkhPV1NJbVdH?=
 =?utf-8?B?SkNKRUE3TGkwTEs1dExHQkZKK1pqMjdwUk1teXU3b0NBbUF2R0k3cFlMT1Fq?=
 =?utf-8?B?aVNLNkRvbmsrS0dnS09IcTFHK3ArVFo4SUg3Wnk4Ni9CVWUxaTQ4d3FUak5l?=
 =?utf-8?B?eGcvYk0vaDZHY0Zxd0doUlpNSFpjOXV6eWxKVU9tQWk3NmhLdXdQL25sTEVv?=
 =?utf-8?B?MUpUUTczcGx3NVFLa3gwZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR22MB3789.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGl6NDIxemgyK3dDUHh5NGVvMWRZUkF1cjdzcFNTaFRNc3FMeVJ3am4vVnpX?=
 =?utf-8?B?ZHRvblMvaVRaQitQUFU5bFRYVzJiaDRwampqeCtFeGRBSmFxdXlna1I2VzZG?=
 =?utf-8?B?MVVScVFPNEUvYmM2N29DckJtY2VyeGY4dEg2OUFXRTlXQ1BkL2JYRnVJdWwy?=
 =?utf-8?B?V29ZS2s4SmdDY1p1NVJJRHJmMmk4ZnRyQjdBcWlVT2d6MGpndEd5b2RZZVhj?=
 =?utf-8?B?R0RjNnBEdEFGM1J0UVVYZEJJZ1g1M28vRWY5b1ZsaGs2T08xa0hzRzBJT2Nu?=
 =?utf-8?B?RHoxV2RGUWxhZzgrSXZTajZyczJGSVZQekJWMWQ2bVFpSDZqVVJ4K0FIenls?=
 =?utf-8?B?RUxpOXljOEZDaDFjK3d4QWxNODlZV3R6ako3c25HSCt6aWNOalh5WU1PQS9X?=
 =?utf-8?B?aGkvWHgwWE8rdjRZMnpjY0ZUNkVWdlR4YjBEa0Z3OURCeDhWY29Hc3RRdFBj?=
 =?utf-8?B?NU04Uy82VmZiQnRGVXpPVHBpT0lyYWpZdkZaTzRFc2RLNmNMV1RFZ1JUYVhF?=
 =?utf-8?B?a2pHekdEQjcwWGNEa1BINnIvWnU0dkNUR1Q3Sis1aW9jUTBrblNYMXRYRmJz?=
 =?utf-8?B?eitvM042SDVYNHFZS2k5bTFKNndEaEUvR2t2U2QyZ0ovaGl2STk4U3YwL1JR?=
 =?utf-8?B?ZFRCN05HL2JJM1V0VFdJbFBLVmZHUlNEWEVaS3RSZDIyd3NLb3UxYnBuUDB1?=
 =?utf-8?B?LzBFY3FzUVV0L0d5OCs5MkF3bXFsa3N4a2V1OXhUQ2dCRzRSbTVKcUdpRGdq?=
 =?utf-8?B?RGk3UlBsb2ZLODgwSko4Y0tickFTTTFtUXJqM3ZSQjJ5TkszZmNEZHc3L3lz?=
 =?utf-8?B?aUx3ZWFFWTJZT2ZXYndDWmxNKzI5VGhQaWFhUTBrcWZOalU3OWxDQk5ad3Vm?=
 =?utf-8?B?OHZTNlVyWGdxMjBtSjV4bHNIaTcvRFZmUnA3T0orc1B3SkQ1RUdTV2k3dlU1?=
 =?utf-8?B?MjdGSWlYTWJFdC90Uk1SejRCVlJ4bHdhYVRJN3hhUVlvZ01LT0dmY1JvWjky?=
 =?utf-8?B?cXZwUFd6SE12R3VYNUNDR3YzRVRicDNGMzZTYlV6WVNLOTIzWHlWeEVNSHg5?=
 =?utf-8?B?WkRsNncyVXdIZVhlRDcwdXExanlsTEpqRDh4K1BDZFJtUmRCWW1JMVdROHhm?=
 =?utf-8?B?WCtHYi9OUldKS2hRU1MvNG5OQUQyWUJKTWZYbnVaZ2xZSkRvZ0RhVTlvMFhv?=
 =?utf-8?B?VTFTakRwNWw5U0FpMitVbjErRWkvcTNYM0ZMcTEyZU1aMmFEazJ4ZGk1SFVo?=
 =?utf-8?B?UFFWT0NaTWYrSXRTV0QvaFJCT3pxMXRVKzhEKzBaVS9vSGVQVHo2ZkhTYnhT?=
 =?utf-8?B?RmhMalA5Z1lEN1VqcjFUYzJLWG1WeXhaejZsNEprRWkzcEVML3VSVkRPR0lr?=
 =?utf-8?B?bmFMdVJ2b21IMU1tL0prMFMwbVpqVGt2YWZRZ2F2M2tWQ3FaQWdXa2VGNGRl?=
 =?utf-8?B?S0tlY2tab3kzV0EyZjVHaVM2YndEelUzdHN3VUs3RW5TOGZLM0hGT3FZNFN2?=
 =?utf-8?B?TEcyZTE4NVpuT3RQU3hZOHBDVGdtSGN3Z2IrRlRrc0g0L2lBK1k4M0N2ajly?=
 =?utf-8?B?UFAvcGpiTXoxbExzN3NEcnJ2dmVwNkNhVUZlTU9hNzZOT2tjTmdBM25EbVE2?=
 =?utf-8?B?dStJL2lBVVZSbFdNWDF3SW1HckRyVUl5ZWlMUTNCeDdCVGpsOGlUckZweEdy?=
 =?utf-8?B?MGNBcWJTNld2SDhJSGxQd281RG1TNTlwdmQrVkdTS3gxNWtqWGRwejFCd3VE?=
 =?utf-8?B?SmFpVEtDUXA1L0xjZ0h0TVRzWk1BTk5jd3NuU3hIWldZWUgyekIzR0NQSCtT?=
 =?utf-8?B?eVJwVXptS0VOMDhNdXdjRnRrTStiMktuYmdiTmpickJkOEkrTHp4Mkh5TEJL?=
 =?utf-8?B?VmNmUjlnWWcxT3JCTldpSURucXNOQjl5LytKZVRJWmdzQmFRWWJDMC9YU004?=
 =?utf-8?B?L3U2VmRBaHZHekdPeVJ1ejNsOWRCeXQySjdEZWcxMFBuOWs1VGFlSy9PN25h?=
 =?utf-8?B?VDFYZ25MZitRSkZwOUdlajIvVmEzd29FMFUxZmlQNzVGNUhmZzliVjRCVXVz?=
 =?utf-8?B?VFFYNlVkTTJWT3hPUlhsK1ZFSVJHVlVGS3Z5dkRnWC8wV09QbWljdFhHeUZk?=
 =?utf-8?B?ZlA0aURDdFFnbW0rMTZORG0vZ2Y2MFRSaDROajgzRjdpdU9HRHBBYWo3ejNq?=
 =?utf-8?Q?nlhuh/nBRqoTwHC5Ei5ZZQc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR22MB3789.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2237bb17-7ee7-40d9-6b4d-08dc6b3cdcb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 06:47:12.4703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 855b093e-7340-45c7-9f0c-96150415893e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pWbbCNG1dgAe3LVIqq4Ha+lM1pwNoTvfFFG+ylpMJIwngSrp5cdz0njDueBnLEDzvX4I6uIy1O7ThtCPpZYFFqvck04I8dXQZv7Lsu9NZqLQ7NXzj7ParDpGq4pyK7g0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR22MB3303
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

SGkgTGVlLA0KDQouLi4NCg0KPiBTdWJqZWN0OiBFWFRFUk5BTDogUmU6IChzdWJzZXQpIFtQQVRD
SCB2MSAxLzFdIGJhY2tsaWdodDogbXAzMzA5YzogZml4DQo+IGxlZHMgZmxpY2tlcmluZyBpbiBw
d20gbW9kZQ0KPiANCj4gW1VzZSBjYXV0aW9uIHdpdGggbGlua3MgJiBhdHRhY2htZW50c10NCj4g
DQo+IA0KPiANCj4gT24gVGh1LCAwMiBNYXkgMjAyNCwgTGVlIEpvbmVzIHdyb3RlOg0KPiANCj4g
PiBPbiBXZWQsIDE3IEFwciAyMDI0IDE3OjMxOjA1ICswMjAwLCBGbGF2aW8gU3VsaWdvaSB3cm90
ZToNCj4gPiA+IFRoZSBtcDMzMDkgaGFzIHR3byBjb25maWd1cmF0aW9uIHJlZ2lzdGVycywgbmFt
ZWQgYWNjb3JkaW5nIHRvIHRoZWlyDQo+ID4gPiBhZGRyZXNzICgweDAwIGFuZCAweDAxKS4NCj4g
PiA+IEluIHRoZSBzZWNvbmQgcmVnaXN0ZXIgKDB4MDEpLCB0aGUgYml0IERJTVMgKERpbW1pbmcg
TW9kZSBTZWxlY3QpDQo+ID4gPiBtdXN0IGJlIGFsd2F5cyAwICh6ZXJvKSwgaW4gYm90aCBhbmFs
b2cgKHZpYSBpMmMgY29tbWFuZHMpIGFuZCBwd20NCj4gPiA+IGRpbW1pbmcgbW9kZS4NCj4gPiA+
DQo+ID4gPiBJbiB0aGUgaW5pdGlhbCBkcml2ZXIgdmVyc2lvbiwgdGhlIERJTVMgYml0IHdhcyBz
ZXQgaW4gcHdtIG1vZGUgYW5kDQo+ID4gPiByZXNldCBpbiBhbmFsb2cgbW9kZS4NCj4gPiA+IEJ1
dCBpZiB0aGUgRElNUyBiaXQgaXMgc2V0IGluIHB3bSBkaW1taW5nIG1vZGUgYW5kIG90aGVyIGRl
dmljZXMgYXJlDQo+ID4gPiBjb25uZWN0ZWQgb24gdGhlIHNhbWUgaTJjIGJ1cywgZXZlcnkgaTJj
IGNvbW1hbmRzIG9uIHRoZSBidXMNCj4gPiA+IGdlbmVyYXRlcyBhIGZsaWNrZXJpbmcgb24gdGhl
IExFRHMgcG93ZXJlZCBieSB0aGUgbXAzMzA5Yy4NCj4gPiA+DQo+ID4gPiBbLi4uXQ0KPiA+DQo+
ID4gQXBwbGllZCwgdGhhbmtzIQ0KPiA+DQo+ID4gWzEvMV0gYmFja2xpZ2h0OiBtcDMzMDljOiBm
aXggbGVkcyBmbGlja2VyaW5nIGluIHB3bSBtb2RlDQo+ID4gICAgICAgY29tbWl0OiBjZTYwY2Rk
YzJhYmY2MTkwMmRmY2E3MWQ2MzA2MjRkYjk1MzE1MTI0DQo+IA0KPiBBcHBsaWVkLCBidXQgaW4g
ZnV0dXJlIGl0J3M7IEkyQywgUFdNIGFuZCBMRUQsIHRoYW5rcy4NCg0KU29ycnkgZm9yIG15IHF1
ZXN0aW9uLCBidXQgZG8geW91IG1lYW4gdGhhdCBJIGFsc28gaGF2ZSB0byBhZGQgdGhlIEkyQywN
ClBXTSBhbmQgTEVEIG1haWxpbmcgbGlzdHMgaW4gbXkgbWVzc2FnZXMgcmVsYXRlZCB0byB0aGUg
bXAzMzMwOWMgcGF0Y2hlcz8NCg0KPiANCj4gLS0NCj4gTGVlIEpvbmVzIFvmnY7nkLzmlq9dDQoN
ClRoYW5rcyBhbmQgYmVzdCByZWdhcmRzLA0KRmxhdmlvDQo=

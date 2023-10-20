Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 656E17D07D8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 07:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E31F10E050;
	Fri, 20 Oct 2023 05:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 20 Oct 2023 03:48:01 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E373D10E57C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 03:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1697773681; x=1729309681;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WDY0FTp2ZikE3tLXRRLHiHh2Buy/VZUeVWnEHB5QqVc=;
 b=Ip+ZRYITgpmmNpVT8yZqStkFVJgnAokoA/Lh1+h/fJ6EskOIyP8hyvV8
 +lTc5c4w/XytehWx20b6LS2lrj/wEJliwWYdNSRh1M9I2WoTQm1eETOaD
 8W7hwvQFh7aHngHgWzmhbEBgYtIEr+e1/zZB/2kS0n89tj3KjRBiFyakF
 vND95BY15VYt6m0q4f8fXc2VIA3pXLelA/Y5VJb0tuqu25kBZfN7jlY3W
 YD49OwATJPwXdv5gKrRTHyTptbP3AIdBxhKvvlsQLyZXJK8MlbXHdaWEp
 /PZu/wi9lEMl+R5JApbKa9y74Fm3TkciGb94a7wwLIt54EYglWUTH9oo6 A==;
X-CSE-ConnectionGUID: O8OmyiQHT7qwezqsuXrZ7A==
X-CSE-MsgGUID: /wBFQawMQQOY3CAnb+7NyQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="177465860"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Oct 2023 20:40:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 19 Oct 2023 20:40:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 19 Oct 2023 20:40:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2/vUucPdivXWL8v55wbDdWIaq6EyH/16jeswDbF1Eqlxf0zfUTdYIfobUJ5YZaxVHMh4d70rP4XcJxByboT9sNpRWMOnwJ+GiLDTrXJVBs3Uin4RqEeb33dGDn1ptuexp+u1GwDao6HHw7o+VuJUUM3VAN45qC7Ysl6BrS8gVG9Niq6bDrnWW9wC9TvPlLBS+3KAj9XdSiKxZqQaryKJFVol9w4ZgmFQnUhOutIEi73At2GJtNiquJSaASH8RpYfPyAximOJWhy2b9sZW9qhkQ5BxKvHA6BqaFekUz9CtqkQzGCwcoozjRZvXWlufHkTw2+ZyjQgiCgz1Hczpm/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDY0FTp2ZikE3tLXRRLHiHh2Buy/VZUeVWnEHB5QqVc=;
 b=GdVv/SxoRkQ05ZjwwQMxc2694Au/H51fqmdIOwgCieMEiHZyef53SIkgpe7BsnJeFqFkmIXzvqWx0ezID9hdQfqO4L+Y2vYXbIDW453+5JEhOLFRd6Kcgw0GOSNvprzVVoTmszXuFkG+mrS2zei0S2wQxjwAgEu9vHZBN1UIOge0ZeRcowKMVFaWr2j90XGtpLQy+9GrAj3jjU6ldFKsKmfAsCooSvOq5BY7Kkf6wbM9fIrRnHY6iRUtZ0XEUKkPMtfeylTSqRWW0bsKTmCCtjI9YbiaxYcaY5c+F8Z8nlP4c+npVUz53oHAD2Od36epAVYEGHk1Q4JjOBXHZQ40CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDY0FTp2ZikE3tLXRRLHiHh2Buy/VZUeVWnEHB5QqVc=;
 b=ZJeHgCCNi0teJ0PwxcbSkV9oOD/HeLPR3r4zauwf9dir/79N4guV+wOVxs9yubNFPipaYRMoQWjQYG1ItpeJEKR6eHC+8SQJ9ta/57f34ZDimjCcT0PQVnobuLvjfUAzAWFPXBAK/1ubAIDQmMu61hnlYfDjfRqAEKkGDKxiSqA=
Received: from DM6PR11MB4185.namprd11.prod.outlook.com (2603:10b6:5:195::29)
 by CY8PR11MB7394.namprd11.prod.outlook.com (2603:10b6:930:85::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 03:40:40 +0000
Received: from DM6PR11MB4185.namprd11.prod.outlook.com
 ([fe80::adb4:769c:92c4:ad61]) by DM6PR11MB4185.namprd11.prod.outlook.com
 ([fe80::adb4:769c:92c4:ad61%7]) with mapi id 15.20.6886.034; Fri, 20 Oct 2023
 03:40:40 +0000
From: <Hari.PrasathGE@microchip.com>
To: <Manikandan.M@microchip.com>, <sam@ravnborg.org>, <bbrezillon@kernel.org>, 
 <airlied@gmail.com>, <daniel@ffwll.ch>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/7] drm: atmel-hlcdc: add flag and driver ops to
 differentiate XLCDC and HLCDC IP
Thread-Topic: [PATCH v7 1/7] drm: atmel-hlcdc: add flag and driver ops to
 differentiate XLCDC and HLCDC IP
Thread-Index: AQHZ926rSs9hsGTn/k2ftTqXrewlYLBSH4OA
Date: Fri, 20 Oct 2023 03:40:39 +0000
Message-ID: <fb5cda1a-011e-43ec-9ac3-4bf4ff81a49b@microchip.com>
References: <20231005092954.881059-1-manikandan.m@microchip.com>
 <20231005092954.881059-2-manikandan.m@microchip.com>
In-Reply-To: <20231005092954.881059-2-manikandan.m@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4185:EE_|CY8PR11MB7394:EE_
x-ms-office365-filtering-correlation-id: 70fdbf85-ecb0-4099-8149-08dbd11e5485
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t9pbGZp+3fD3JU3EzOmZ1RYtyPLKBUCWgBkWokqGEKOP2tNEnm/sI+PyLrYS2F2ofs1ckZ3zZakGuu5UJHmNPDMNDkG4DeJzbid0JNvMotxTniRH1gFEOlz+qfwKI1zM1fBigip3im3o/OU205cRhMgtbuAUlZtTuH3Kpuq0l9A/c7dVqxmUM9FR1WnuSYy+FqzmdjD2kzT1z98UKbfgK7OCGI18oiF42CUxGOgFADSQA7M282l7MVRzE6N/Vd9RywjvpHuZnBK2WU9VvKwi6OiYuXGnRFOdfuHgRzJrf2W6wqgHkhd3yXzQFaogSwfcryifMO09VKZsag0zlc+sB1AfE/pE5Agyc8Ve2kb9HOj2bjmNfgMYzX/QHmXwFnx0wOIbpqleO+V1d/buw7CoLim1s56n4OuodTT8wJmifACEGuyJEUcrI3hBpCiR4D2BUl7RHohccnvwGbv3dSV4Se+xNeUcM+ABgs13BD/UAGsQYu1TMq5DEmC84FTOwZMtKa3VwfCK7Wn587ypSyJ/YwVM3fznaIh7a5HFR9rLm5KljlfqkoJGUYBJykAHKyOldyPI8o6/GyeC/28gfJHL5dPTSkm/kc3p6mK7GsSZhCa/0VndRtAW8HnMBpKNOi9pNg5lv/jlmVnFGoqeH1cQlwUBGnUxp4SpE5lcJs6fbQA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(38070700009)(26005)(31686004)(921008)(38100700002)(66446008)(83380400001)(31696002)(66476007)(41300700001)(5660300002)(76116006)(8676002)(64756008)(66946007)(4326008)(91956017)(8936002)(54906003)(316002)(86362001)(6506007)(53546011)(66556008)(966005)(6486002)(110136005)(478600001)(71200400001)(2906002)(107886003)(122000001)(36756003)(2616005)(6512007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K29RWTZwaVY5VjZlb1ljSTd2Uk1MUlZFSnd4VDZkOGFZMkxJS2haVU1wSFpk?=
 =?utf-8?B?QTdRN0lLNnlDQWI5bm9yZENubVp2M29nVUhPMkJBbWphS3d1YmJZdURmVmxE?=
 =?utf-8?B?SGpHSU9tdCtZbys3UkRoaG1YcWVZWUY1QUZXa3VkVmZSWEdnNC9HK1F2SG1I?=
 =?utf-8?B?SVNpdVRLSE1YV3Q0bmViM2xFajlqYXpsZVRoemhqdzVQVlNUR0loclpwMVhB?=
 =?utf-8?B?T0Rhb1Y4ZFhremhISnVOKzMrdVdvS2FyQWY1T1kvUDM1cC9NZU51QkhXcWZZ?=
 =?utf-8?B?aEhCcjNhVjlGODFLaDVyRFZjRFBtVmJwSm03bmN5NzRuQkpCZ1YrOWZvZ0Rt?=
 =?utf-8?B?SGc1NUNpa1NnV2o5c0w0ZFRvSjEvYmhya2J4SjJmQUVKNkVTeE1zdWpCMG5u?=
 =?utf-8?B?MGszNk4xQ2EwT2xhQ0lISkVkS3JoTGlMakZDM3Rpbks3WDZkeTlvM0hnb3NR?=
 =?utf-8?B?a0xHd0xGMGtTR3BOaitoM0J3LzJ6YWJpeUhQQVkrR3RlVkhNQ2ZRcEd4OEp2?=
 =?utf-8?B?R3V1TnBNcDkxU3FLUHpyM2VlRUVHUjJ5aDhSVWp0WW5pWnAxWXF2WENOd3RJ?=
 =?utf-8?B?U1IrQjJIeERiSFlldm1ERTJtVTduUjhvK01Gd1NWMG1SSitMTEIrcnhJaXhs?=
 =?utf-8?B?TGlkN1pPNmxCcTI4MHpRVy9hT2F1YysxR1ZoK3hOU1lGcWdLcG1ObE9ad3Jo?=
 =?utf-8?B?NHUvb2ltWmgxNXBTWk9IMjg1YmRia0t6RTdicE1WOU1mRkNKOThrV2dnTHJS?=
 =?utf-8?B?bitJNS8vSzQ1TTV5SUVhVDZmdGlPeFZUbEdzYWZCdE9ZaklKL2U2U2o1N1Bl?=
 =?utf-8?B?R2hXSjZaeW5BY2EyZ29NVkFJOVA1b2x6TnVVOEt6VEU4ZzZHU25WWmpqaEky?=
 =?utf-8?B?b2dXRk5PYmRRb1hyWTB5dWZzY0pRMFdOdVg3b0VCNTlIRklicmI5K3lKbzBv?=
 =?utf-8?B?d1RKY1lLOUhvY3g3K1poSTR1QS9sTkFXaHhnQVQ5dm1oc01xcW55SmNidUxP?=
 =?utf-8?B?a3RCeDNvZnR0S240Wm1BMGlQbEg2OHhDdXVocDBra0dlMHc1aEx6eHZKY1BM?=
 =?utf-8?B?bitXOHNMK09xcmZuWFpidTdDUERMNjZkSlRncVUzWGh6Y1cvMkZsZk56STd0?=
 =?utf-8?B?MWZxelNsUmowTWJWTEZad0JHVlJWT0ZNZi9NNTUxbXBBbnJQd0JRbEVlNThN?=
 =?utf-8?B?Tnd0clByNUFmRmEzcnFiU1FiOUlod1JueXV6N3hQaDNpNzZVZ0VNejhIdnFN?=
 =?utf-8?B?QTVaem5zb0xMUXh2QUlDclQySXYvWGhWb3pyZ1BoRDhJYk9JakI0QkUrOVRO?=
 =?utf-8?B?ZGhmaWtkZVNBQXl5bTRDb2laeXJHcXh0ZG1IQUF5ejAwWmZiMHNROW11aFJB?=
 =?utf-8?B?a1FRNlVmYkpDNHJhVERBS0pMaXA4VDhuNlpIRG1PaVE1c1VXemlKVk9WbnBQ?=
 =?utf-8?B?S2hVcmZqRDIrazNqV1ZPUWprSWR3U2FtMlFZZ3JKcW5vWloyaGVQcExId3Vi?=
 =?utf-8?B?dU9Ta0l3bTVNekxxSmFVRkxJbk9ZZW9QWkZKZ3Brd0IyNkQvWjJQS3RKM05P?=
 =?utf-8?B?TDZPam51LzczVWZ0eitvQ3R1aFJ2S2hSVDdWWVNKSkJXbmVETXBsZW5adVpD?=
 =?utf-8?B?WWliQWNMQWpNOU1HWXNndk1RWEVBRHFiRGtVS2xrUnYwRWd4SjRuQzFlb3Na?=
 =?utf-8?B?WER2SS9hZnlCcjRxNGEzSHM1VTkrZklEczJDcUlNQXErZk05N1FIVnZ1SWVt?=
 =?utf-8?B?blpPZXJjRllNazZtSWxqTEFiNEYrVlEwSjhjZ0dqR1Uxc1V0T3lOYzBjRTRK?=
 =?utf-8?B?a0Z1VUxOWWZCVVJhNVBWc1FUU3JFSklBVkJxSkRSTFdmNEVWM0Q5S3pIUlRj?=
 =?utf-8?B?aFEwa1E5cWFXdzYzMlQ2cThvSDYxKzFudUJxakdWTk40U1Q2b2tJTHRFUzNT?=
 =?utf-8?B?NTlKZHRxam5BK0dVeXRhd2VQazNBN01sZHcwcWVzZ2F0R1pTdjNkc3lra1VX?=
 =?utf-8?B?SldGc25ocGlkS3JOMDB0UzcxWUZmR05iRHErd1c0alFGWnFTV3pHR3hUUG45?=
 =?utf-8?B?bXFZMkMyRFZUdGdtVjFqTnhHWG1pUnpQMlhrV1FnWUJIeWlZMzFxV0Zyd2Jz?=
 =?utf-8?B?bzdUa3duVEE1d2sycnl0YzJBMkJwTlpXNDUxL0JITEE0VHFrYndIazd6ZzJC?=
 =?utf-8?B?clE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <83B3F3271A36114D8F38EA5FE9DD46A6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fdbf85-ecb0-4099-8149-08dbd11e5485
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 03:40:40.0061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 39HJajQAZr8Q7jNVHgNz5HARLF9EkoZzz6xzrRZTpDewhUPJ7qOp3vpjbkVWj+f/r64iRwVp9nru5Rn+5yEAbufG5FpfLONxn3/Auc/Pjh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7394
X-Mailman-Approved-At: Fri, 20 Oct 2023 05:52:28 +0000
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com, Dharma.B@microchip.com,
 Durai.ManickamKR@microchip.com, Varshini.Rajendran@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVhciBDb21tdW5pdHkgTWVtYmVycywNCg0KSSBob3BlIHRoaXMgbWVzc2FnZSBmaW5kcyB5b3Ug
d2VsbC4gSSdtIHdyaXRpbmcgdG8ga2luZGx5IHJlbWluZCB5b3UgDQphYm91dCB0aGlzIHBhdGNo
IHNlcmllcyBteSBjb2xsZWFndWUgc3VibWl0dGVkIGZvciByZXZpZXcuDQoNCkkgdW5kZXJzdGFu
ZCB0aGF0IGV2ZXJ5b25lIGlzIGJ1c3ksSSB3b3VsZCBncmVhdGx5IGFwcHJlY2lhdGUgeW91ciAN
CmZlZWRiYWNrLiBJIHRoYW5rIGV2ZXJ5b25lIHdobyBwYXJ0aWNpcGF0ZWQgaW4gdGhlIHJldmll
dyBvZiB0aGUgDQpwcmV2aW91cyByZXZpc2lvbnMuDQoNCkkgc3Ryb25nbHkgYmVsaWV2ZSB5b3Vy
IGZlZWRiYWNrIHdvdWxkIGhlbHAgaW1wcm92ZSB0aGUgcXVhbGl0eSBvZiB0aGUgDQpjb2RlLiBU
aGFua3MgaW4gYWR2YW5jZS4NCg0KUmVnYXJkcywNCkhhcmkNCg0KT24gMDUvMTAvMjMgMjo1OSBw
bSwgTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNv
bnRlbnQgaXMgc2FmZQ0KPiANCj4gQWRkIGlzX3hsY2RjIGZsYWcgYW5kIExDRCBJUCBzcGVjaWZp
YyBvcHMgaW4gZHJpdmVyIGRhdGEgdG8gZGlmZmVyZW50aWF0ZQ0KPiBYTENEQyBhbmQgSExDREMg
Y29kZSB3aXRoaW4gdGhlIGF0bWVsLWhsY2RjIGRyaXZlciBmaWxlcy4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIDxtYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNv
bT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2Rj
LmggfCAzNyArKysrKysrKysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2Rj
L2F0bWVsX2hsY2RjX2RjLmggYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxj
ZGNfZGMuaA0KPiBpbmRleCA1YjVjNzc0ZTBlZGYuLmQ1ZTAxZmY4YzdmOSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmgNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmgNCj4gQEAgLTE3Nyw2
ICsxNzcsOSBAQCBzdHJ1Y3QgYXRtZWxfaGxjZGNfbGF5ZXJfY2ZnX2xheW91dCB7DQo+ICAgICAg
ICAgIGludCBjc2M7DQo+ICAgfTsNCj4gDQo+ICtzdHJ1Y3QgYXRtZWxfaGxjZGNfcGxhbmVfc3Rh
dGU7DQo+ICtzdHJ1Y3QgYXRtZWxfaGxjZGNfZGM7DQo+ICsNCj4gICAvKioNCj4gICAgKiBBdG1l
bCBITENEQyBETUEgZGVzY3JpcHRvciBzdHJ1Y3R1cmUNCj4gICAgKg0KPiBAQCAtMjg4LDYgKzI5
MSwzNiBAQCBhdG1lbF9obGNkY19sYXllcl90b19wbGFuZShzdHJ1Y3QgYXRtZWxfaGxjZGNfbGF5
ZXIgKmxheWVyKQ0KPiAgICAgICAgICByZXR1cm4gY29udGFpbmVyX29mKGxheWVyLCBzdHJ1Y3Qg
YXRtZWxfaGxjZGNfcGxhbmUsIGxheWVyKTsNCj4gICB9DQo+IA0KPiArLyoqDQo+ICsgKiBzdHJ1
Y3QgYXRtZWxfbGNkY19kY19vcHMgLSBkZXNjcmliZXMgYXRtZWxfbGNkYyBvcHMgZ3JvdXANCj4g
KyAqIHRvIGRpZmZlcmVudGlhdGUgSExDREMgYW5kIFhMQ0RDIElQIGNvZGUgc3VwcG9ydC4NCj4g
KyAqIEBwbGFuZV9zZXR1cF9zY2FsZXI6IHVwZGF0ZSB0aGUgdmVydGljYWwgYW5kIGhvcml6b250
YWwgc2NhbGluZyBmYWN0b3JzDQo+ICsgKiBAdXBkYXRlX2xjZGNfYnVmZmVyczogdXBkYXRlIHRo
ZSBlYWNoIExDREMgbGF5ZXJzIERNQSByZWdpc3RlcnMuDQo+ICsgKiBAbGNkY19hdG9taWNfZGlz
YWJsZTogZGlzYWJsZSBMQ0RDIGludGVycnVwdHMgYW5kIGxheWVycw0KPiArICogQGxjZGNfdXBk
YXRlX2dlbmVyYWxfc2V0dGluZ3M6IHVwZGF0ZSBlYWNoIExDREMgbGF5ZXJzIGdlbmVyYWwNCj4g
KyAqIGNvbmZpdWdyYXRpb24gcmVnaXN0ZXIuDQo+ICsgKiBAbGNkY19hdG9taWNfdXBkYXRlOiBl
bmFibGUgdGhlIExDREMgbGF5ZXJzIGFuZCBpbnRlcnJ1cHRzLg0KPiArICogQGxjZGNfY3NjX2lu
aXQ6IHVwZGF0ZSB0aGUgY29sb3Igc3BhY2UgY29udmVyc2lvbiBjby1lZmZpY2llbnQgb2YNCj4g
KyAqIEhpZ2gtZW5kIG92ZXJsYXkgcmVnaXN0ZXIuDQo+ICsgKiBAbGNkY19pcnFfZGJnOiB0byBy
YWlzZSBhbGVydCBpbmNhc2Ugb2YgaW50ZXJydXB0IG92ZXJydW4gaW4gYW55IExDREMgbGF5ZXIu
DQo+ICsgKi8NCj4gK3N0cnVjdCBhdG1lbF9sY2RjX2RjX29wcyB7DQo+ICsgICAgICAgdm9pZCAo
KnBsYW5lX3NldHVwX3NjYWxlcikoc3RydWN0IGF0bWVsX2hsY2RjX3BsYW5lICpwbGFuZSwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYXRtZWxfaGxjZGNfcGxh
bmVfc3RhdGUgKnN0YXRlKTsNCj4gKyAgICAgICB2b2lkICgqdXBkYXRlX2xjZGNfYnVmZmVycyko
c3RydWN0IGF0bWVsX2hsY2RjX3BsYW5lICpwbGFuZSwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IGF0bWVsX2hsY2RjX3BsYW5lX3N0YXRlICpzdGF0ZSwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIHNyLCBpbnQgaSk7DQo+ICsg
ICAgICAgdm9pZCAoKmxjZGNfYXRvbWljX2Rpc2FibGUpKHN0cnVjdCBhdG1lbF9obGNkY19wbGFu
ZSAqcGxhbmUpOw0KPiArICAgICAgIHZvaWQgKCpsY2RjX3VwZGF0ZV9nZW5lcmFsX3NldHRpbmdz
KShzdHJ1Y3QgYXRtZWxfaGxjZGNfcGxhbmUgKnBsYW5lLA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYXRtZWxfaGxjZGNfcGxhbmVfc3RhdGUg
KnN0YXRlKTsNCj4gKyAgICAgICB2b2lkICgqbGNkY19hdG9taWNfdXBkYXRlKShzdHJ1Y3QgYXRt
ZWxfaGxjZGNfcGxhbmUgKnBsYW5lLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBhdG1lbF9obGNkY19kYyAqZGMpOw0KPiArICAgICAgIHZvaWQgKCpsY2RjX2Nz
Y19pbml0KShzdHJ1Y3QgYXRtZWxfaGxjZGNfcGxhbmUgKnBsYW5lLA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgYXRtZWxfaGxjZGNfbGF5ZXJfZGVzYyAqZGVz
Yyk7DQo+ICsgICAgICAgdm9pZCAoKmxjZGNfaXJxX2RiZykoc3RydWN0IGF0bWVsX2hsY2RjX3Bs
YW5lICpwbGFuZSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qg
YXRtZWxfaGxjZGNfbGF5ZXJfZGVzYyAqZGVzYyk7DQo+ICt9Ow0KPiArDQo+ICAgLyoqDQo+ICAg
ICogQXRtZWwgSExDREMgRGlzcGxheSBDb250cm9sbGVyIGRlc2NyaXB0aW9uIHN0cnVjdHVyZS4N
Cj4gICAgKg0KPiBAQCAtMzA0LDggKzMzNywxMCBAQCBhdG1lbF9obGNkY19sYXllcl90b19wbGFu
ZShzdHJ1Y3QgYXRtZWxfaGxjZGNfbGF5ZXIgKmxheWVyKQ0KPiAgICAqIEBjb25mbGljdGluZ19v
dXRwdXRfZm9ybWF0czogdHJ1ZSBpZiBSR0JYWFggb3V0cHV0IGZvcm1hdHMgY29uZmxpY3Qgd2l0
aA0KPiAgICAqICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlYWNoIG90aGVyLg0KPiAgICAq
IEBmaXhlZF9jbGtzcmM6IHRydWUgaWYgY2xvY2sgc291cmNlIGlzIGZpeGVkDQo+ICsgKiBAaXNf
eGxjZGM6IHRydWUgaWYgWExDREMgSVAgaXMgc3VwcG9ydGVkDQo+ICAgICogQGxheWVyczogYSBs
YXllciBkZXNjcmlwdGlvbiB0YWJsZSBkZXNjcmliaW5nIGF2YWlsYWJsZSBsYXllcnMNCj4gICAg
KiBAbmxheWVyczogbGF5ZXIgZGVzY3JpcHRpb24gdGFibGUgc2l6ZQ0KPiArICogQG9wczogYXRt
ZWwgbGNkYyBkYyBvcHMNCj4gICAgKi8NCj4gICBzdHJ1Y3QgYXRtZWxfaGxjZGNfZGNfZGVzYyB7
DQo+ICAgICAgICAgIGludCBtaW5fd2lkdGg7DQo+IEBAIC0zMTcsOCArMzUyLDEwIEBAIHN0cnVj
dCBhdG1lbF9obGNkY19kY19kZXNjIHsNCj4gICAgICAgICAgaW50IG1heF9ocHc7DQo+ICAgICAg
ICAgIGJvb2wgY29uZmxpY3Rpbmdfb3V0cHV0X2Zvcm1hdHM7DQo+ICAgICAgICAgIGJvb2wgZml4
ZWRfY2xrc3JjOw0KPiArICAgICAgIGJvb2wgaXNfeGxjZGM7DQo+ICAgICAgICAgIGNvbnN0IHN0
cnVjdCBhdG1lbF9obGNkY19sYXllcl9kZXNjICpsYXllcnM7DQo+ICAgICAgICAgIGludCBubGF5
ZXJzOw0KPiArICAgICAgIGNvbnN0IHN0cnVjdCBhdG1lbF9sY2RjX2RjX29wcyAqb3BzOw0KPiAg
IH07DQo+IA0KPiAgIC8qKg0KPiAtLQ0KPiAyLjI1LjENCj4gDQo+IA0KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBsaW51eC1hcm0ta2VybmVsIG1h
aWxpbmcgbGlzdA0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVs
DQo=

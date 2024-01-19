Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9508323CF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 04:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB4510E94C;
	Fri, 19 Jan 2024 03:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0065010E94C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 03:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705635201; x=1737171201;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rsO7z/UCfKG6ME8iEqZNrhhFIuWHujmeLlY7bq7+4fo=;
 b=q+++PyHP6KvOBUN5ekUmxiVvBaqjcFYP3i33ptPaa7iyPvXiWPP8A8Gs
 BTTrzKCswQho//PvJ3CZF3ucUvAgnMJxyWXDC8WmhoMjPZ06UKvWFUbK6
 PBQ22A5pyblWn3CwpojU+Tcbric40J/5GBYFgVKwUEo5OeILrgmTq9gM4
 NBH8/dtDU5jk96WXJvpL1HmDRwhUPh9JXvx/bnnxv6O9X4V1L+iCgs5ZE
 rnwlyxWcbvjaryo+/c/zduZJoRA9gXsetj+FCHv5NJifcjDEdqeuiGMx3
 BJe1Ksn3DJjVUHoTJPeIYys1e/DJGITMS/p1GO/Bj7gKoo0+LHjBKJCqE g==;
X-CSE-ConnectionGUID: TRvl59QQTjalhLKcxtg5AQ==
X-CSE-MsgGUID: sXgIA36vRQWY0Bw3KFIpxA==
X-IronPort-AV: E=Sophos;i="6.05,204,1701154800"; d="scan'208";a="15457930"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jan 2024 20:33:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 20:32:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 20:32:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcwjD9oWJfBdIcViryc4q+IJbxyn9BtYsju8VHzGnddpl4Ui53xsbCIBC4UXV3Hr/kqwhKp939QoTS3U5Is0dMoM/Ktkp8R4ez8ot24CMlh+kzoDrPlBxGepSkRkq5CP/77+8dsSMYElEy0+djLGkDaPFyfSJ1f3QXtR3xYtLlXhZ3gKlyVMNaXKWT01NJ1jOyrlDuwRG3Zm++fnkyFEQ14bGOuUfFIF3rrtippda3nRo+nCrJLpZUSH58eHhMUs1isWGLj2Rq+CW6CcVPiLH99hSCq48xUQqbGHxqnlBvFMvvDaroWKERLZCoNbw0VAf47w/N15vtgFILFiG3x02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsO7z/UCfKG6ME8iEqZNrhhFIuWHujmeLlY7bq7+4fo=;
 b=nwSmvHUYbtrvKzRZmWkrkbTlTXgoUtxeoeqzq3LNDUsVWj/GE5tVKLdyH0MS0J7sMQpxZ2BqoaNpejJC1v+03nxWHoMFIW/+P3kLpksv1PXnSO93Gh0XtfVJQju3I2HvZsQBl4EKsxad3RRJzFK/Wtw/cLy+f9qXLv4FJ9/+D+zlY8pKr9iwxn8lxn5vIty4RyaNScRsNbYHFL7ib3vG44x8Kx9h0dooSbKiJDUrcLOXvMqnUDisS9UsDEo+Xpg0r/72qy5kN5eE83Ksg62JlHAy3IS/7VWXDKGzQpgbaN9Ssp7QwN+nalihviezZCtl558WpRZ3idEeFlKpOuQQPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsO7z/UCfKG6ME8iEqZNrhhFIuWHujmeLlY7bq7+4fo=;
 b=cQCh+O3fhYoHzmDQkJCelowYAGEWb0RUD4pO8E6oGQrBp6NyazwpOqibnWBvf9MageD4XeT0OMLwNbft0SRtQwlhG9sBYRKDbjv1jQ+ecNTS5FVrUXz98cyhKRsFuynSKUNijzvyvMYH/6wvQxeSxreTlQmlv5FfYqhV8NosR6Dh5b1az21bpHcG9BpkecIte0JN20KUH3eQMhle58ULxpB7VXMaWU+5OewidDqgu0Q202i+hsr1ACRsM1BkKnep7aY9B3XNcgDM2HPzpctBk1krP+7Utiyh/63NJLCOjQlY/J1X94R+ATbnKR6ft2ZPP68ejCKYnxj4nPZw4rn3lw==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by SN7PR11MB7590.namprd11.prod.outlook.com (2603:10b6:806:348::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Fri, 19 Jan
 2024 03:32:51 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7202.020; Fri, 19 Jan 2024
 03:32:49 +0000
From: <Dharma.B@microchip.com>
To: <conor@kernel.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT
 schema format
Thread-Topic: [PATCH v3 3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT
 schema format
Thread-Index: AQHaSfB9G+vm5oXSwEmW6mjsJvC8kbDftWKAgADHFQA=
Date: Fri, 19 Jan 2024 03:32:49 +0000
Message-ID: <c33868c8-dc42-4800-885c-5e5f24c2044e@microchip.com>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118092612.117491-4-dharma.b@microchip.com>
 <20240118-recent-glorified-fd35d72e006e@spud>
In-Reply-To: <20240118-recent-glorified-fd35d72e006e@spud>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|SN7PR11MB7590:EE_
x-ms-office365-filtering-correlation-id: db765055-4cca-4ee7-4b8b-08dc189f4fe0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JyxJNR66qT3rIpzxoHXI4Zkd/SG/x4j13sbloM0wVZLru65DCmSbdbJHvU2bYYVQfyRIq5ROKLHoDQ6fmyy/lLRXu5FRk/y+iuz4Hc/lpsWvw28Lnn/IXGzYqp0/yaDfuLeXlCXpIivBiHyILt5fBrUCTlWD9ZIR1zRMJY5NxKMEa0rUMiDerLyHbpS7FRqzxZ0ADXY+si41M5JD+CAt8ZjtGZ/bZzVLJrFqqGzOpjKhoiuwevAoWEgyOO+6Sl8Z3auzSYk9lbNhWed5xu4Nwm6RN/m7wH1DSSl2WVDzD14QNZOAqTKjPq0Ww+Z4pjrGlmBzMDNoq8F6WZN3r6n+UFoJxIu/LCRIb7VQ1AZf7LDpMhuHN9B5Zr/X3xwzX/Z/+BGoE1DULOkjXHNb+gSYasUlElsfPqVGZH2MGLdKwTy93FgV3H8kIOeV0viFwp16HLW43YkExGWzXSgQ94as6tOcFIz24SYLwJz0bBqTFnF+U9JUBMURatGmwnEO3dKsPvlUknHRyr5kRzNMy18ZOWFiG+eCX9nZXKjhc8zQW/OcvB2+2oCtQTMjPV52U7clfFOUOsoe9NoqrICj4aUStltjdeJxHP3weB4Do10vWfUbOM2v/UXrMrdRVKlixHOSRmv0ECorcyi2zz2OA7pF77LTnj7KXCX27vo8AZwMMynBj0wv5jAc9PJl7qfKRc0p
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(54906003)(71200400001)(6916009)(64756008)(91956017)(6512007)(8936002)(6486002)(478600001)(6506007)(66946007)(316002)(66476007)(83380400001)(2616005)(107886003)(26005)(76116006)(66446008)(53546011)(8676002)(66556008)(41300700001)(5660300002)(4326008)(7416002)(2906002)(38070700009)(36756003)(122000001)(38100700002)(86362001)(31686004)(31696002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnJlNm4xL0E5L2VOemVwY3U0d0cvR2xlRUw1bHUrMzMrdDlNdEpsc3poVHRr?=
 =?utf-8?B?a3ZRMVNURmpQWXkxZEFXK0NSbmRaS2lxcEtUQUgvYWpsa25QNEM2c2ppYlho?=
 =?utf-8?B?a0VNcXVuck9yZ3RKWEovNXUvNHhpU2M1NlJmT2lBSVFDbjNSMDJkUWpkbzdR?=
 =?utf-8?B?Qm41UlYyL3Fza0ZRUjVYOSsxdkZsRGd2M202UUJ4ZExONXkvL2w0UDZlUHRV?=
 =?utf-8?B?YkxPZUN1WnluUlIreEpuQmM3cWVybVV4b3VBSXZRek5aWjQ2bmtZSldTc3J3?=
 =?utf-8?B?b3A1YURxMjFoeFBIL1BZSTBRMDVlaXc4TGJNbmpoUE1vZmJkdVFWSldZbnNt?=
 =?utf-8?B?cHpnYW5Lb2RVSUtka3RIWC9uZlNRSHNtZUJpTFBXYTFvei81SnFscG4rTnpP?=
 =?utf-8?B?OWtCN1lIYzhVN005amdVVzhzVWJPcDM3Ymp4cndqaXYvUGZncHFZcHJZMnpa?=
 =?utf-8?B?ZHB4enlHRUNzaFp0MFVOU0FGN0NCUXB5VHIyZXUrRFYva1E0M01RS1hzUnBt?=
 =?utf-8?B?bElLbGpBaWcvK0pBZVhVSlpyY2pZNHJWaHRzQVVOcTAxVnZwM05EMFRseVVQ?=
 =?utf-8?B?RWZaTzdtY1N4VWp6WWVSaFNaSUdrSlllS2tSZ3NZZTJ1UG9PR3dZdnNHRmFx?=
 =?utf-8?B?VDFLN3Nzb2RXMnlSMTkxSTcxQWhYOFhTVS9iT1llaVdHYTBuSzRZbGtScFNr?=
 =?utf-8?B?dW5HZ1EzcHZnRDRsNkk3bGx0Snlnem9wTzk5VXhqTnhJem9sbGZFeDFsckpM?=
 =?utf-8?B?SytpeGQwYVFwbytFK0VNRERoaWVIWlFXWWJpZ0poZTFyZXlhZEhiMmJNbFo5?=
 =?utf-8?B?bmFlanRSSWsvS00wcHg3YlRYL3JjT3JnS3c3clRQdnZBZkhQNlFSTENjSFVO?=
 =?utf-8?B?ZHl6VG5ua2pKcmpQRzhBcUNQSWhLYm5vT2MxdjhRLzlQaG9yMzJ4NlZwcGYy?=
 =?utf-8?B?MjlzaGhDVEc4UGJvYzBaRGpRRElqa01yUDBPaENZRGdJdnFCcE4xUWdqdXlM?=
 =?utf-8?B?a0M0RUpDVzBCekhEbHJvZXBKOTV4ZGN1bVFHcVdEWEx0UG9nYzZvNWY2Z0dV?=
 =?utf-8?B?NExKaTFtR2dreC9XRFk4NEpXZkdIQ3hteVlEUUJna3ZjOXlJWkVZR2JOaXV2?=
 =?utf-8?B?SHI1dVhUcExpem1WK0VqTnFBNm5uZmZqQlRXcHV1SHIxQzI4RHFzQW0zZm1O?=
 =?utf-8?B?VFRYaWt6blB0TWVzWktRbTZabUd0SW1qZWR0SDg1OEFSalg3c3VZRkNkV2ds?=
 =?utf-8?B?N2VSRFhKQkR3akxmMllUVUhNdkxONndrMTVDRlRNa1ZXamRheTdSZ3RlQmcw?=
 =?utf-8?B?eXhzbFF1MjhUa1YrRkNvbG1OMXJlNVo0WWN6cGVYSk04SW9VajhSaEcrbk1x?=
 =?utf-8?B?cVdDTXozWkM0VEpyMGVRZm5CeXJ3Z0sxUGVLbjd5bThqcnh0MTUzZmwxaUpj?=
 =?utf-8?B?VXdnM3JZSDdxSVJSQ3hYNDBJZ0dYeDY4MEdTZlpDT0srVFZBRzdPODlrODE0?=
 =?utf-8?B?bitYSmQxdDBUa0RnNUNZNTkyV2FtVm1uY2sreXlxMDB6aUVBVkZNUTFyMkN3?=
 =?utf-8?B?ODZRcWlXMnRERnQxeHZFVE1PcXNxQ3AycVVPVGRHNDJsVzBlR0E1S0ZISVp2?=
 =?utf-8?B?ZUwzU1padUZyVnpxTmpXTFAvOTg4czlkNzlRbjUxRm5GelNhU1Vna1o5WWNK?=
 =?utf-8?B?VVA3U1FGa29zUXk3Vkdydi96MWJsU3VWZTdUUmRRZmdQbTZEQkhLL04xaG9Z?=
 =?utf-8?B?Y2t3dGNVWURFSHNTNER0c1VlMGdkb2x1VGNCd0ZPK3lwdXVTdUhQQWFuN2wz?=
 =?utf-8?B?WXlUNThXNzQ0WXVzcnZKYzQyOHMzUGR3eHlLNkZOT1hSVk55N2lPVmNsN2pG?=
 =?utf-8?B?ck5uVTNoUk56QXZqWUNDK1dBa3oxWC8xcTNvVHJPZ1lIYWc5eFFyRXJWTXlu?=
 =?utf-8?B?ZmtVeUdNK3ZuTTJTRXpiL2ZsV09uSnRQRmo1Nm1FVnRjSTZkRnJFTzBIL205?=
 =?utf-8?B?U1FDcDd4VEpFNWlZa3ZOYUVRNXIyaHJidEhud1BOSTlabmdTdy9iVDM3ZHpk?=
 =?utf-8?B?L1FnT3BpTGdIZktBZng3TC9sWXRLT3N4WVgwWHc4NXFTSjd3TkFoMnBXRkxC?=
 =?utf-8?Q?I59BIcFiivS/IY/SZ66BuA+51?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B9754DB2FBF8545A162086635C00E18@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db765055-4cca-4ee7-4b8b-08dc189f4fe0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 03:32:49.8344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l65z/K0eYFlJNNTshfAm05R/+7Mhf7DO4vqn28NPim5yu7gppgWlqLz1VTklJVU+srrT3EGwnl2hcXdjCbCsQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7590
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
Cc: alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
 Linux4Microchip@microchip.com, dri-devel@lists.freedesktop.org,
 Nicolas.Ferre@microchip.com, Conor.Dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, airlied@gmail.com, sam@ravnborg.org, lee@kernel.org,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTgvMDEvMjQgOToxMCBwbSwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiBPbiBUaHUsIEphbiAx
OCwgMjAyNCBhdCAwMjo1NjoxMlBNICswNTMwLCBEaGFybWEgQmFsYXN1YmlyYW1hbmkgd3JvdGU6
DQo+PiBDb252ZXJ0IHRoZSBhdG1lbCxobGNkYyBiaW5kaW5nIHRvIERUIHNjaGVtYSBmb3JtYXQu
DQo+Pg0KPj4gQWRqdXN0IHRoZSBjbG9jay1uYW1lcyBwcm9wZXJ0eSB0byBjbGFyaWZ5IHRoYXQg
dGhlIExDRCBjb250cm9sbGVyIGV4cGVjdHMNCj4+IG9uZSBvZiB0aGVzZSBjbG9ja3MgKGVpdGhl
ciBzeXNfY2xrIG9yIGx2ZHNfcGxsX2NsayB0byBiZSBwcmVzZW50IGJ1dCBub3QNCj4+IGJvdGgp
IGFsb25nIHdpdGggdGhlIHNsb3dfY2xrIGFuZCBwZXJpcGhfY2xrLiBUaGlzIGFsaWdubWVudCB3
aXRoIHRoZSBhY3R1YWwNCj4+IGhhcmR3YXJlIHJlcXVpcmVtZW50cyB3aWxsIGVuYWJsZSBhY2N1
cmF0ZSBkZXZpY2UgdHJlZSBjb25maWd1cmF0aW9uIGZvcg0KPj4gc3lzdGVtcyB1c2luZyB0aGUg
SExDREMgSVAuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogRGhhcm1hIEJhbGFzdWJpcmFtYW5pPGRo
YXJtYS5iQG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+IGNoYW5nZWxvZw0KPj4gdjIgLT4gdjMN
Cj4+IC0gUmVuYW1lIGhsY2RjLWRpc3BsYXktY29udHJvbGxlciBhbmQgaGxjZGMtcHdtIHRvIGdl
bmVyaWMgbmFtZXMuDQo+PiAtIE1vZGlmeSB0aGUgZGVzY3JpcHRpb24gYnkgcmVtb3ZpbmcgdGhl
IHVud2FudGVkIGNvbW1lbnRzIGFuZCAnfCcuDQo+PiAtIE1vZGlmeSBjbG9jay1uYW1lcyBzaW1w
bGVyLg0KPj4gdjEgLT4gdjINCj4+IC0gUmVtb3ZlIHRoZSBleHBsaWNpdCBjb3B5cmlnaHRzLg0K
Pj4gLSBNb2RpZnkgdGl0bGUgKG5vdCBpbmNsdWRlIHdvcmRzIGxpa2UgYmluZGluZy9kcml2ZXIp
Lg0KPj4gLSBNb2RpZnkgZGVzY3JpcHRpb24gYWN0dWFsbHkgZGVzY3JpYmluZyB0aGUgaGFyZHdh
cmUgYW5kIG5vdCB0aGUgZHJpdmVyLg0KPj4gLSBBZGQgZGV0YWlscyBvZiBsdmRzX3BsbCBhZGRp
dGlvbiBpbiBjb21taXQgbWVzc2FnZS4NCj4+IC0gUmVmIGVuZHBvaW50IGFuZCBub3QgZW5kcG9p
bnQtYmFzZS4NCj4+IC0gRml4IGNvZGluZyBzdHlsZS4NCj4+IC4uLg0KPj4gICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZmQvYXRtZWwsaGxjZGMueWFtbCAgfCA5NyArKysrKysrKysrKysrKysr
KysrDQo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9hdG1lbC1obGNkYy50eHQgICB8
IDU2IC0tLS0tLS0tLS0tDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgOTcgaW5zZXJ0aW9ucygrKSwg
NTYgZGVsZXRpb25zKC0pDQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWZkL2F0bWVsLGhsY2RjLnlhbWwNCj4+ICAgZGVsZXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXRtZWwtaGxjZGMu
dHh0DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZmQvYXRtZWwsaGxjZGMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZmQvYXRtZWwsaGxjZGMueWFtbA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4
IDAwMDAwMDAwMDAwMC4uZWNjYzk5OGFjNDJjDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2F0bWVsLGhsY2RjLnlhbWwNCj4+
IEBAIC0wLDAgKzEsOTcgQEANCj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MCBPUiBCU0QtMi1DbGF1c2UpDQo+PiArJVlBTUwgMS4yDQo+PiArLS0tDQo+PiArJGlkOmh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21mZC9hdG1lbCxobGNkYy55YW1sIw0KPj4gKyRzY2hl
bWE6aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+PiArDQo+
PiArdGl0bGU6IEF0bWVsJ3MgSExDRCBDb250cm9sbGVyDQo+PiArDQo+PiArbWFpbnRhaW5lcnM6
DQo+PiArICAtIE5pY29sYXMgRmVycmU8bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAuY29tPg0KPj4g
KyAgLSBBbGV4YW5kcmUgQmVsbG9uaTxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4NCj4+
ICsgIC0gQ2xhdWRpdSBCZXpuZWE8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPj4gKw0KPj4g
K2Rlc2NyaXB0aW9uOg0KPj4gKyAgVGhlIEF0bWVsIEhMQ0RDIChITENEIENvbnRyb2xsZXIpIElQ
IGF2YWlsYWJsZSBvbiBBdG1lbCBTb0NzIGV4cG9zZXMgdHdvDQo+PiArICBzdWJkZXZpY2VzLCBh
IFBXTSBjaGlwIGFuZCBhIERpc3BsYXkgQ29udHJvbGxlci4NCj4+ICsNCj4+ICtwcm9wZXJ0aWVz
Og0KPj4gKyAgY29tcGF0aWJsZToNCj4+ICsgICAgZW51bToNCj4+ICsgICAgICAtIGF0bWVsLGF0
OTFzYW05bjEyLWhsY2RjDQo+PiArICAgICAgLSBhdG1lbCxhdDkxc2FtOXg1LWhsY2RjDQo+PiAr
ICAgICAgLSBhdG1lbCxzYW1hNWQyLWhsY2RjDQo+PiArICAgICAgLSBhdG1lbCxzYW1hNWQzLWhs
Y2RjDQo+PiArICAgICAgLSBhdG1lbCxzYW1hNWQ0LWhsY2RjDQo+PiArICAgICAgLSBtaWNyb2No
aXAsc2FtOXg2MC1obGNkYw0KPj4gKyAgICAgIC0gbWljcm9jaGlwLHNhbTl4NzUteGxjZGMNCj4+
ICsNCj4+ICsgIHJlZzoNCj4+ICsgICAgbWF4SXRlbXM6IDENCj4+ICsNCj4+ICsgIGludGVycnVw
dHM6DQo+PiArICAgIG1heEl0ZW1zOiAxDQo+PiArDQo+PiArICBjbG9ja3M6DQo+PiArICAgIG1h
eEl0ZW1zOiAzDQo+IEhtbSwgb25lIHRoaW5nIEkgcHJvYmFibHkgc2hvdWxkIGhhdmUgc2FpZCBv
biB0aGUgcHJldmlvdXMgdmVyc2lvbiwgYnV0DQo+IEkgbWlzc2VkIHNvbWVob3c6IEl0IHdvdWxk
IGJlIGdvb2QgdG8gYWRkIGFuIGl0ZW1zIGxpc3QgdG8gdGhlIGNsb2Nrcw0KPiBwcm9wZXJ0eSBo
ZXJlIHRvIGV4cGxhaW4gd2hhdCB0aGUgMyBjbG9ja3MgYXJlL2FyZSB1c2VkIGZvciAtIGVzcGVj
aWFsbHkNCj4gc2luY2UgdGhlcmUgaXMgYWRkaXRpb25hbCBjb21wbGV4aXR5IGJlaW5nIGFkZGVk
IGhlcmUgdG8gdXNlIGVpdGhlciB0aGUNCj4gc3lzIG9yIGx2ZHMgY2xvY2tzLg0KTWF5IEkgaW5x
dWlyZSBpZiB0aGlzIGFwcHJvYWNoIGlzIGxpa2VseSB0byBiZSBlZmZlY3RpdmU/DQoNCiAgIGNs
b2NrczoNCiAgICAgaXRlbXM6DQogICAgICAgLSBkZXNjcmlwdGlvbjogcGVyaXBoZXJhbCBjbG9j
aw0KICAgICAgIC0gZGVzY3JpcHRpb246IGdlbmVyaWMgY2xvY2sgb3IgbHZkcyBwbGwgY2xvY2sN
CiAgICAgICAgICAgT25jZSB0aGUgTFZEUyBQTEwgaXMgZW5hYmxlZCwgdGhlIHBpeGVsIGNsb2Nr
IGlzIHVzZWQgYXMgdGhlDQogICAgICAgICAgIGNsb2NrIGZvciBMQ0RDLCBzbyBpdHMgR0NMSyBp
cyBubyBsb25nZXIgbmVlZGVkLg0KICAgICAgIC0gZGVzY3JpcHRpb246IHNsb3cgY2xvY2sNCiAg
ICAgbWF4SXRlbXM6IDMNCg0KLS0gDQpXaXRoIEJlc3QgUmVnYXJkcywNCkRoYXJtYSBCLg0KPiAN
Cj4gVGhhbmtzLA0KPiBDb25vci4NCj4gDQo+PiArDQo+PiArICBjbG9jay1uYW1lczoNCj4+ICsg
ICAgaXRlbXM6DQo+PiArICAgICAgLSBjb25zdDogcGVyaXBoX2Nsaw0KPj4gKyAgICAgIC0gZW51
bTogW3N5c19jbGssIGx2ZHNfcGxsX2Nsa10NCj4+ICsgICAgICAtIGNvbnN0OiBzbG93X2Nsaw0K
DQoNCg0K

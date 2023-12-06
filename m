Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3844D8072B2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 15:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD5310E72C;
	Wed,  6 Dec 2023 14:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F252F10E72C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 14:42:39 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B67P2rU007353; Wed, 6 Dec 2023 14:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=FY+RfghaWHEzxCQ2fO2FEED2X7lHHsBpyDefpNh5sEA=; b=
 DQuoh8GNB/5GLEv9Lzga5VPEYifs9gjjIc0YyAgj8GlfGXt7yhNzbDu9ONZKNje1
 X31oWBao/jI7AQ6jat4zaQ87OD0mOPH0zoNCO9afDb60pydmR3cxdzpZQd98CP1D
 kyhNqPD760OWneDg0BYI/g4pEK9J5cImeovs4yvec4Ck7BCte5g0YWEY4lWVi9NQ
 E5Kxx+5ilQRpHiNvicn3kLX6/UN1PqUJq9YN2/u/nJt/NlOWhs8pnwu0fCjsVo3C
 GBjm9E1u4w6lgnAkEvK/kaYb0h2J03vbXfWmltPj7bqWXIhjXWMvmF/M2mXe9xHH
 WAq+jKL9Dhlp6nsfOni2Vw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3utd358e9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 06 Dec 2023 14:42:19 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 14:42:18 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 6 Dec 2023 14:42:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+1t33ozR1O+ZviufN43UwQ/17cEDKfEcyC3oZpmMv8DbN/e6vfbGxe7usVrbZXDoO/zKzGSZ4akpyocHPp/pti85yjBYhdWys/YfUXLITQYJpJQcMZ1oFG06u6HqezDpzkzQu70UHzucg6lvkUPpYgEVfLfv4u0Ole46tjOWREGmxyY/qUy+vy3beg5zmE6kUPgt0j2AsDKaaVy5c3g+XPfJt58cwv2Q8YObAJitr4Nti5RRocDsgHBqbf7NYZf6SknEaKQwats4SGRBwjf48h+MSXwrzAeLA5nAAkOMJJpZUceSKfNFdy2X1K8F60Oi+bFnZRBjIwfTH+j6W6dXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FY+RfghaWHEzxCQ2fO2FEED2X7lHHsBpyDefpNh5sEA=;
 b=ZoDJmeQpxUTuIkLwutM3wIG5vZspUQNov9sqFTrgWHmrQIRMnKBSI2hCpqf91xG7g4HUQ4vuoVvVwIa/IyJidIjNcx/SrscElXQHO3WCMmU7/WzfA31m4r41/3KfarUi943Quef2nruPP5aT5/6OOefAIMVaELbI3uWXKH45givojZUqIBKu+vLCaC0nzBvYv3RwhvHdde+ZUz1m2g0HxhWLmxWEzrBEqOXDgE/waoW4Nm4KOyPF+e28x3GVsJmDucqNvedRPUXfwuq7WiscRQSI7TrbrghFT7YOCPOpk5anbmKu/4GsLpxqVEtHrCmP+DCl7Ad7Fm5MJ01ymg4Dnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FY+RfghaWHEzxCQ2fO2FEED2X7lHHsBpyDefpNh5sEA=;
 b=V+KJLVaQdXwozMI/FQfnt1MQtgBedZAkkKHLmD/zVM+fg2t4CqgUw3yMzAN8G5z3ssXUpeA+v/nULcLFC6kHjUg3CxaySolRvcBL2lGJKbFUg64PWQB3I5SaEqGL5Ayzz5mTQv5BJzub+0u0eTeKcm+38jwzggHM2JhrCdoxWoU=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LOYP265MB1792.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 14:42:17 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba%3]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 14:42:17 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: Donald Robson <Donald.Robson@imgtec.com>, "dan.carpenter@linaro.org"
 <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/imagination: Move dereference after NULL check in
 pvr_mmu_backing_page_init()
Thread-Topic: [PATCH] drm/imagination: Move dereference after NULL check in
 pvr_mmu_backing_page_init()
Thread-Index: AQHaKFJoYLStFTrtckSeP2dGEpkpIA==
Date: Wed, 6 Dec 2023 14:42:17 +0000
Message-ID: <48c059b9542fb453998dd77a676d2ce08fefdd4f.camel@imgtec.com>
References: <13f4278e-af9c-4092-9196-bc0e6b76f1eb@moroto.mountain>
In-Reply-To: <13f4278e-af9c-4092-9196-bc0e6b76f1eb@moroto.mountain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LOYP265MB1792:EE_
x-ms-office365-filtering-correlation-id: fcd21261-44ac-4d57-07d8-08dbf6698b74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KSXcM7sZd3a2nJSj8Pt4C5hIx/nsdshRHawumUbqt09BB1tj5fnK4L4T8yQREUbnHWnd1+wy/T3zbE0ZaGc2AhpGJy0miiTuJ3eqTqxaP9JoQF03LAucEwi2MBedmC3l+LilqjltAoPxwWqnTOdVBZCsHncabPXAfD3k75pwyykTOf9ozyLsVuo2EbQVuiV8mJnVZTY+ULrxIbva3GKanpfc46A+SK28LgAp89KnT/J0lr2H0PitaqLgXikcgk+P4N/MSTDPTY/kdqjiy5Lz5HOMh9RQaGc1JG7aDjiDcu5OdXVNsGlUVU3eI5qX+fjpCWQDov1vNG6fcv6zFl8ObTfs7KvBBLqwZorEn3sThnqjChSgogIJmPrDw6xGvWnrDPMTaN6tq7IKbc1cuBpPa49DLdl0fMJvo8lUiNNGqNtIr0yV2UNOUaZbzByx5+nvjAWMd2zhZkbCtNwryz2D0eBtmOrqH7C2vy2U5oQ211JPwyfvQegQQTEVeA2+RbKjWcv7zhZKRoemv3X/EG4fIDLHH+3cvXxps5bnhSGA6EAGqc3oriPLYz6S9KyWmfKrCOk7tH5rqQOhEurFOF3WuSab+R+6cgoIVSqfRRGMbaiJZ7ff0Ps5/ZCmd00Mm2bV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39850400004)(346002)(396003)(366004)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(6506007)(6512007)(26005)(122000001)(54906003)(64756008)(66446008)(76116006)(66476007)(66556008)(66946007)(316002)(38100700002)(110136005)(71200400001)(83380400001)(2616005)(478600001)(6486002)(4326008)(8936002)(8676002)(86362001)(5660300002)(2906002)(38070700009)(36756003)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2xZcnVVUmVzTmlGdmJXNGRPR1hPM0MrWjgrYkhvK3Y1bVVhZ3djVm5vN3Jq?=
 =?utf-8?B?d2M5cnhkUWZKSU5kQUFVQ0JHbkRkZzZoNkJ4ODg2REhBSTBlMjFuYWdPZ1cy?=
 =?utf-8?B?Y1BGR1FLWVhxQXZaTGlTaVo5NFY5RzBKSTVXOFlGeU5iZVZkT0p1M01lQ3Ax?=
 =?utf-8?B?amRMdUZkR2lERkpBdUFqL0oyM3MrWVRreXFJbEVwUlFXR21MR0tWSm1kT1Bs?=
 =?utf-8?B?cXU0TEFMeHJnTTlJMTFkOVJnRlNnV09ya3RPekVCb1VhOWtiYmNRWmJZdzFT?=
 =?utf-8?B?S1BKeWdIRWp4N00yM1JUN1Q5N1c0UHQ1ejBYQzYzbWVGVGMzNGR1dll4OHZ1?=
 =?utf-8?B?M3pKODF1WThMVEZxbjhMTGRiWHgySTBHVHRnOU82UXNDYXZVVHRBOUVKbTBD?=
 =?utf-8?B?bllqb3ovWU54c2Z0RjY4Q1Y5VndGcU1IS2xJTTVBNDdHOUJvM1NWeDAxdzBC?=
 =?utf-8?B?STVadWlFS2lEbWV4REFGeHhUZGVDVU4ya2NCQzNVMjNNQUsvWWprTUpRcHRt?=
 =?utf-8?B?WEZWZStnQXhYYWtNQW5ZYlRuUXZGMGVyQzRwWjZmM0FtWkZxZjRpUGRvK2NL?=
 =?utf-8?B?TkhEazM5Q2kxRFBjQnZ3VVBDWHpYNFd6RHNLTDRvVUdWQVF0UTV3cDZsMUpu?=
 =?utf-8?B?MzMxeEI1MXgyY3Z4VW0yYTBUeVpzZmlzS1QzZ3lGbXVrOVBEcUJSOUVMREJm?=
 =?utf-8?B?SmVPR05Md1A1UnN3b0JMQnlRSFFrcDF3QUpqMGkxYlh1YmtuTExiT1lMOUty?=
 =?utf-8?B?aTVGR0pPWGFMckVPOWpZR0xTbGVaM2lnRm0vdHB5YmlsMEZPNXJWSzBFM2Nn?=
 =?utf-8?B?dG0vY0RkNktoSUlENGQ0RC96QzZ6OS9NaHlmb3BnNVVPREVVSzdyS2s1YkpI?=
 =?utf-8?B?WUVMMnRoZmc2VzlWMEsyVTdXenhZS3ZuOVBXQ2NBS3Q0aHdERk5YL1E2aUhX?=
 =?utf-8?B?V1kydmxJaTd1OW5WaHN0ZU9VSy84N1NOaWpxdDZMMURRS2ZKWlkyTkttUWJF?=
 =?utf-8?B?NkswTmJON1l1VDlZTUMvMjNKVVREMG5rajFjTDdDRXgrRUI2KzI3YnhuaGlW?=
 =?utf-8?B?VjRqQ1NVeE1kWUZyVStGQzNtMmZMS2dBcGRSMnVpcStMOFYvd2Q2UkdvS0tZ?=
 =?utf-8?B?cy90b2VId2ZZVWh4YnRSWllKZUYwOU92eGxTRG1uRk5ZYUFuUTJsZzhrK1lF?=
 =?utf-8?B?STloZE1SbzU3L0xOWnJIVC9qMjFyd1BodkFuZ1hFVXFuNnJkM3JBSjBCa3Ja?=
 =?utf-8?B?RmtUZFZFUzlhOFo2dWk1alRDYUFXV05lVitUYm9iVENYcTB3Sjd0dHRnWWhs?=
 =?utf-8?B?UG80R0crdnZyYlJ6T2VRd2hsZmpDOUlaQ1RqRHlCMUxXcnBiZmxtaUVRNVNG?=
 =?utf-8?B?SjB5cnB3bGEvYkFwMzlRSWhWeEd3VUhjRFVNZ29RR2d2aC9yc05FNXd4dUdW?=
 =?utf-8?B?NXFtTHZqRDYzMitsdWlaQXloaGoxN2VGU3BsMXNQbWZtbUJ3THV0ZXhPNlBa?=
 =?utf-8?B?encyeUFCV2czMldUcEx4TmpoUnNreUZRbjhTQ2lJa1BnU2htVXR1dzlidkdu?=
 =?utf-8?B?cURIZ1cxUURheHhNc2pndHdPSVhFcng3OFVoTFFVRGFpTENidlAxNmdMKzUz?=
 =?utf-8?B?cXRMcGRRUXpoRmZTelJ5UHRNaVJsQy9xa21Pbk5HY2xwS3R3bDJFTDZOWEo1?=
 =?utf-8?B?dlRCS2hkLy9kNEVVMFpURllsOE5LZWNYQmNUaXRXd0RZVFZEL2VKcXpMVmtH?=
 =?utf-8?B?ZzMzNVhJU1ByNlc4RFE4ZTZPQ0hmd3E5WkhhUU1RczkvRDNUSzFPbXAxZkx0?=
 =?utf-8?B?WlJXMy9PVGtUelF1QW84dUFXNjV2b21ZL0pMZDNYMjNwUjNtaXREd3p5aDRS?=
 =?utf-8?B?K2dlL2NtdThSZHJMRDNSUXRuL0NHWW80TnpIdFVwQ3p2SXN1N2VmbmxhbVJk?=
 =?utf-8?B?ZTZWTk9aOTNrWEM3bUcwcnR4L2YzOEZWdXhlNzdmb0ZLd2tvb0hHUjZ6L1dq?=
 =?utf-8?B?anN5QkQwUS9UZFNMQy94TXJkYjAya25JWFlzaTQ1cDlNajgvUGhPaFFObnpu?=
 =?utf-8?B?b3dWZUdtdWk0Q21kVzZMZ2FTTzhDVmNNbHhWa3dkQ0hRbFVoY3h3cUNrYlNL?=
 =?utf-8?B?c0hYbGZreGk0a2FBai9tYTRuanBHSVNLNVd3VWNoUGFuajdXeSswUWVXeUY2?=
 =?utf-8?B?QWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B46404E3CF687499F2BC3CBBD649CA7@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd21261-44ac-4d57-07d8-08dbf6698b74
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 14:42:17.4359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R+lrDMYHyqV2M1g6JDUkViBAcqWLOLiC5u+M+08nUgGhgmZEdWMYa1gNki241G94EU/a6wtPbqEsVzAQvQ6/zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB1792
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: oTinOv9L6s1wVgmsFJo_y2qEQVyMbadH
X-Proofpoint-GUID: oTinOv9L6s1wVgmsFJo_y2qEQVyMbadH
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
Cc: Sarah Walker <Sarah.Walker@imgtec.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Matt Coster <Matt.Coster@imgtec.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuLA0KDQpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCg0KT24gV2VkLCAyMDIzLTEyLTA2
IGF0IDE3OjM3ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0KPiBUaGlzIGNvZGUgZGVyZWZl
cmVuY2VzICJwYWdlLT5wdnJfZGV2IiBhbmQgdGhlbiBjaGVja2VkIGZvciBOVUxMIG9uIHRoZQ0K
PiBuZXh0IGxpbmUuICBSZS1vcmRlciBpdCB0byBhdm9pZCBhIHBvdGVudGlhbCBOVUxMIHBvaW50
ZXIgZGVyZWZlcmVuY2UuDQo+IA0KPiBGaXhlczogZmY1ZjY0M2RlMGJmICgiZHJtL2ltYWdpbmF0
aW9uOiBBZGQgR0VNIGFuZCBWTSByZWxhdGVkIGNvZGUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBEYW4g
Q2FycGVudGVyIDxkYW4uY2FycGVudGVyQGxpbmFyby5vcmc+DQoNClJldmlld2VkLWJ5OiBGcmFu
ayBCaW5ucyA8ZnJhbmsuYmlubnNAaW1ndGVjLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9pbWFnaW5hdGlvbi9wdnJfbW11LmMgfCA0ICsrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX21tdS5jIGIvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0
aW9uL3B2cl9tbXUuYw0KPiBpbmRleCBjODU2MmJmYzBkY2QuLjRmZTcwNjEwZWQ5NCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9tbXUuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX21tdS5jDQo+IEBAIC0zMTYsMTIgKzMxNiwx
NCBAQCBwdnJfbW11X2JhY2tpbmdfcGFnZV9pbml0KHN0cnVjdCBwdnJfbW11X2JhY2tpbmdfcGFn
ZSAqcGFnZSwNCj4gIHN0YXRpYyB2b2lkDQo+ICBwdnJfbW11X2JhY2tpbmdfcGFnZV9maW5pKHN0
cnVjdCBwdnJfbW11X2JhY2tpbmdfcGFnZSAqcGFnZSkNCj4gIHsNCj4gLQlzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSBmcm9tX3B2cl9kZXZpY2UocGFnZS0+cHZyX2RldiktPmRldjsNCj4gKwlzdHJ1Y3Qg
ZGV2aWNlICpkZXY7DQo+ICANCj4gIAkvKiBEbyBub3RoaW5nIGlmIG5vIGFsbG9jYXRpb24gaXMg
cHJlc2VudC4gKi8NCj4gIAlpZiAoIXBhZ2UtPnB2cl9kZXYpDQo+ICAJCXJldHVybjsNCj4gIA0K
PiArCWRldiA9IGZyb21fcHZyX2RldmljZShwYWdlLT5wdnJfZGV2KS0+ZGV2Ow0KPiArDQo+ICAJ
ZG1hX3VubWFwX3BhZ2UoZGV2LCBwYWdlLT5kbWFfYWRkciwgUFZSX01NVV9CQUNLSU5HX1BBR0Vf
U0laRSwNCj4gIAkJICAgICAgIERNQV9UT19ERVZJQ0UpOw0KPiAgDQo=

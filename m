Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF1D52155E
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 14:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C2610F5CB;
	Tue, 10 May 2022 12:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC2F10F5CB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 12:26:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxbQ7PyCqYNqXbNJaHT6KxfvvpMLQqblCMwVcwD0I7Ew4IDh2llKKpI848p91vGDxoQMKYTSqIBZVK9MKFMsvWWeMYCmCuKptYD2hxuzOlrSnXf2KO1dDl5szPAB7Ap6+4OSxYUbDwDDlfKWYkcTTH79Xq9TJ62Py6m2JG8FWCf+VHM2Bt/5PHoeD/TlHTMZ02nvufEUtwCT9z+0DPNV7pbRm1yPQ5FQgQFqu4Y6xuPJx97bVjKvwNrLIWeSnZRHUnOAyenj2Hqec/E/3fBtnMrUwrmTK12+0EyDRa+rfZCNnjjtZhNAYLB8iqzZvNl5ijmdKadYzw97XQliKD8qbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cku33R4hQFh/zzJ37xEe1xN862Yd+55Lp9R4xndLDMY=;
 b=og5OZJdgJBBfRJDahalOijI2xTOGZeqX1XcrjaBApTNNQ90RVsA7zHyhD8xeC7jsgPLFMnHUiOuZPt/4i3IO/1IlpF3g/W5s2lbI3ZuDYmp6rv7gSZdVr7bjsw89pCvu+Iob3uDQBNGelkPMJjFDEtBuAEhllkurrGM4918DyCsew4g4h8blD+jbvl6bqeFFUd4R0HEwQ0TPGBwcoAjpFeel3fO0r4IHp3dArmdCRSasEHMsCvA+u+WhUQWe9VXbkXHORpS6n/cINhTJ1D4CdECjsAHH1+4XYxHWMBwmnOcna4iMWgp/kK8cahGEsJriwMhcdQvUYGdg0VSBzp5uSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cku33R4hQFh/zzJ37xEe1xN862Yd+55Lp9R4xndLDMY=;
 b=vMA0kHf0RHrGj96EYiqW9PfGTuh59iDJCfbmJ7zISvXILhq96VSGJdCXqBVn11GbnHQluhMDvRIIasYHtBrLyfixtS2EzM7VkI8gqouLjvB8FQVvU4quCqqgc3qZtKxxcsMG28eAtCzeTzw7jZF6MaWhHdH/Egyw1FDpM8umbO4=
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by SJ0PR05MB8775.namprd05.prod.outlook.com (2603:10b6:a03:38b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.12; Tue, 10 May
 2022 12:26:05 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::1105:32c5:7d56:5430]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::1105:32c5:7d56:5430%4]) with mapi id 15.20.5250.012; Tue, 10 May 2022
 12:26:04 +0000
From: Zack Rusin <zackr@vmware.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: 5.18 vmwgfx seems to break booting VirtualBox VMs
Thread-Topic: 5.18 vmwgfx seems to break booting VirtualBox VMs
Thread-Index: AQHYTYGHtZBezSHFMEi22ECSmBgwWKzqxK2AgCvHXICAAN5IAIAAts0AgAAWGgA=
Date: Tue, 10 May 2022 12:26:04 +0000
Message-ID: <5F7AE997-3B4A-4E62-A1F7-ADC80D4EE0DB@vmware.com>
References: <2bd4b06e-7577-d7d7-5f2e-264005b316a1@redhat.com>
 <84c30eb2dcdc330ea54aa1fedba9ae0eb0826068.camel@vmware.com>
 <087a0754-422c-0d88-a5ed-c03f2b5906c2@redhat.com>
 <41AD6A60-9C2C-4545-8A62-114B07C0383F@vmware.com>
 <3d8f7aa0-0846-436d-7fe1-e8f8af7eaff5@leemhuis.info>
In-Reply-To: <3d8f7aa0-0846-436d-7fe1-e8f8af7eaff5@leemhuis.info>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ed3c062-1b85-4207-e161-08da328040b1
x-ms-traffictypediagnostic: SJ0PR05MB8775:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <SJ0PR05MB8775B918A769494CAF2EF2F8CEC99@SJ0PR05MB8775.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UEb3jSFA+H+56wflf70utTfNW0sCHrU4zQ2k6wgu1zHz8gCwuruDiAEUv4Q6m8FyjcqXFU3FJ/cYoQT4r6WgI/Zjn+BoWVsIAmNm8npXNPJwF2GvbKWKaWa5jwJ+AIVLoddGsStUdiLiPjm9trHFrMwzAkUGaRO18KvZdndvpRUyK0A6L+SYccf6+R2po0CRoOZidLQLKQGYUpyc1qCAG6KJxdUiviZNQ6xr6Mk+v2ZBb8jizr8brFQ8SLDb/N444rLEEJu+oHXllcPPQ5FgHeMIFzQrnAf5MRGQQz1vwocb9G9irq1N/s9I3F7GuQUYjZ63J53enLCXgdcxsJbeQHC1ZAHy2LtMJCXfJcXF7alarkiAtvHcoijbRZOv3cPKBELTgaXXoq1xoi5Ty2KiR1ccxO9UaflpyueDFQaJ3zSByNVaSVddKnmZHxXmC8Q9ETMdpoSxngFiYa/NcuBw5k1WPTPpaD7rBao3C0TONLrMxi480FqUinkyDZH/MyvwoyRJIJ8gsGXPPKDm0ivk6fyb2PT/VPKbgtodz24qVAerSUjOdpCnxqG1WkWirEwGLlKSdQO8E7s/6cgfMSjKjIUxnA6x6wHfK9A9WolPV4MX6n0WqWo4L4rKVYhbNYdiuXlm4uf9U3PE1e2ABQOljbjh/g4dtjPyY2Nq+CzP6tNvjfcyabSq7Dh126eYvVqrSPnv5YNtBm+vnk1EZlVr7dtAYlafHGxqPoYQjeD8f5VzaLTN+W50xtj3+IWxTTHXazME7lHVw3mOWU7x/utc+JxXz9g79JVQHsiiy/cLNKaYCvYJD4jh+RJOwG8X5npXU+Pmw89CbYhqxvxmZ+oU2kEhz6Pl+c8CdavAFWll+gA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(2906002)(5660300002)(33656002)(91956017)(66946007)(66446008)(66476007)(64756008)(66556008)(8676002)(4326008)(76116006)(38070700005)(6486002)(186003)(45080400002)(966005)(107886003)(83380400001)(38100700002)(86362001)(54906003)(8936002)(6916009)(2616005)(26005)(6506007)(53546011)(122000001)(316002)(71200400001)(6512007)(508600001)(40753002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bG00OVhqdGpoVU5PcDBuMklQbzA5MXo5VzZNanMyd2ZiNVFESmVaTUZXdmZk?=
 =?utf-8?B?OHEwM3ZqSXFvSDFlWWUrN3VkdXBEOFVRcTh5Vjc5ZTNHRDdkWDRrREkyYk9W?=
 =?utf-8?B?aHBqaURHOHdMSk9kc3Q1Si8vb3FkQUlmdjJQenlpbWo2ZnQwbEFVMXdCSy9n?=
 =?utf-8?B?Qkw3YkdhL1krY3ZFVW1iSVJ0YVJycXg2Z1MrRzU2dW5XSlgyenJsc2IrWFl5?=
 =?utf-8?B?bEtxOTRUcUlmQ2hVellIUE8vTWJuU3g4OVhickVwRk5GVHY2MmJIRCs4VXVH?=
 =?utf-8?B?RnNSbS9LVHFHQjVwell1bko2M25VZnpEK1piOTE0YWI5MEorclpialdCRVBn?=
 =?utf-8?B?NUQzUk1QZ3ZJSDl5OXVRQ2FLdUlnbmY0eGIzei9HcVVab245TjhBZm1DMzRk?=
 =?utf-8?B?Mlh1M0d1ZjI2WENQblN1cDV4eUxNblAxOFA0Z1dxak9vUTFRdnVwOVFEQUVW?=
 =?utf-8?B?KyttdkVMc0RqbVFFam9pR28vb1ErQmRvMElOQ0NaUk41T3J2aVZtRURUVnlX?=
 =?utf-8?B?RjNIVk16SzVBSjZEL04vTE5meXNmdmRpaktJRC8xbFNjRmdvbUZ2azg4R2RH?=
 =?utf-8?B?SXFsNjhXUlA0Ukh3UjB5cXpMZUZjUkJRdzBxQ1g3ZURhT2JxM0NvZzlkYU5P?=
 =?utf-8?B?UHowTXZTSDZQaXpVVW1KQnJmK1IrR0RlSEFMZ01waHZmMCt4NkUzT2YrMVhT?=
 =?utf-8?B?dEU3N3BJR3VXWW5FRmJnaGkwdVZOZnhhaXpob2tBeVNhU1o5SlBjNzhScndG?=
 =?utf-8?B?T1I2RnprSm5hSkYwRDBoNjZqaUVleVprNjVYSUNUM3BFV3VKeGZEdDZJUVRP?=
 =?utf-8?B?RE0rN0FRWnpDek9tVmZ1K1RtQkpUVkQyV1JQbHArZXM5THV1cEx5Y0s0M2xT?=
 =?utf-8?B?SERpeFlWeTFvOEFodk9ZZFlteEhlbEZkZkdBYWlUZkl2ZkNZVjZFdW8xQUpN?=
 =?utf-8?B?RFp0aVlVYTFaV25TcE5JQVVLQSt6TFFWTXFNanlIa2l5c2JFL3V0SHM4dTZj?=
 =?utf-8?B?bkNKcTU2cTllNjM2WEh5MHQxd04xcURsWUdaci9lYUlZQ3RvRmwwQzY1emdQ?=
 =?utf-8?B?VEJJUlFNSnhvc0htVG9FZUd4YlFLL2hyblh4ZFdsWDRrMndFSHk2SGw1TUt1?=
 =?utf-8?B?RTE2dFFBdzhzOWg2MDNQWUU0QUkwTUcxTmFPcXlYODBTSUlkK2NDMDlxbEpX?=
 =?utf-8?B?VFU3WGs3dDZjb1lMa2Radnl2azl0SGt3cVdYdmdYRUYvVWNGblNWNWRLSGg1?=
 =?utf-8?B?UTJoZzVZU2o3cG10OUF1QVpRald0bC9OR1UwUWgzcHl1TXJpdkN6Z1hhTjc2?=
 =?utf-8?B?a3RoMVQxWDFmT04yU09BRGplMXpiL1MzWHVCeHRjc1hRSG1qakVYRUlGOFNF?=
 =?utf-8?B?Y203djQzQ2d2ZjdHUkM5Y29hL0t6SUl4bVV5dXA1RzlWWjUwdU1lRisrMVB0?=
 =?utf-8?B?UGp4ejF6R2NUMVRySmtBUVE5SmtXWWdyVVpRbyswV0ptOUE1dG9aK09haUxU?=
 =?utf-8?B?UEdqUitDUGRwTm15ck5WOXVOaElMNmxodlZWNldTZmY1NWJlV2lvdXZ2WEtZ?=
 =?utf-8?B?SW9veFBGYzI0ZEx5K2dsOGVsMkRpMVE5T2MrMzBKWkV1ckRlV0NLM000dVZI?=
 =?utf-8?B?Q3YwQ2RFZkd0L3FORGt4K2NFeUg1MXRJdWdZNzVpZzRtT1R2TG1BRXczbU5N?=
 =?utf-8?B?SEsvRXVaMitwRFp2Z0E0a2JBazUrU1pCZC96cUNEZ0ZoREI4MTlSR1pyeFpx?=
 =?utf-8?B?RXVTY1JzblFpejRYbUZ6cWRoQlBhWG5FaEY4OW0zL240c21VR1ZpRDJuRUxp?=
 =?utf-8?B?OElTaWhKSmJZTXNpWHBReU9hSEE3MUZ4WUtVa040Q3FPTUpBNHZaa1FDNWt1?=
 =?utf-8?B?b011M1BrK3g4Mk5KY0JrNzNRSC9zTHNjcTBmS0RMRC8vcEZUV29TU0JwYkdq?=
 =?utf-8?B?SWp1VjNMcG9NTnpyeTdHMXlQbVQ0a1BKUHNKZVEvMlFXcnY5YmpoRkM3dFRP?=
 =?utf-8?B?YmhHNnVyVENza3hZdVFGQ3UzWFlyS0FhUzFuaG5nREpKeU1kSTVvUHRaakxm?=
 =?utf-8?B?OUVlcE5jaXY3UHoxa2hGQzBQanhGTzl5RHo5NnpFdnFNTWhxQThuSGZZaFlF?=
 =?utf-8?B?elRQckNLMHdBZDAwQU8rWkdSei9kQlFRN01RSnAxdWJrSzNkL3BjcXgrOVlR?=
 =?utf-8?B?RUdaYlFLUHU4d2NVa0JpRmhxYVc4Zy8wdEV3OFAxMXRycldITVYzQWNPcWhP?=
 =?utf-8?B?THV4blYwajZ5c0FNeVBPaUtWRkhxcFRSa0lheVNySkZueFpJWSsvcW82dGFL?=
 =?utf-8?B?UmcyN21iNXJVeDhXSWQzUXZ4WkFmSXdHNk9DM0d6Y0hFZzR1ME5sdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B29781B14D7D3449390752DEDA11030@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed3c062-1b85-4207-e161-08da328040b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 12:26:04.8948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5UEVJ9zq2IiYiV3jxVw77Nyn5DCD91zZd3qevMkMRfw3m0HrrIR8YOHdkCmluphfUVjDJ4iq5Ie5ewkM3RK8IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB8775
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gTWF5IDEwLCAyMDIyLCBhdCA3OjA2IEFNLCBUaG9yc3RlbiBMZWVtaHVpcyA8cmVn
cmVzc2lvbnNAbGVlbWh1aXMuaW5mbz4gd3JvdGU6DQo+IA0KPiBIaSwgdGhpcyBpcyB5b3VyIExp
bnV4IGtlcm5lbCByZWdyZXNzaW9uIHRyYWNrZXIuDQo+IA0KPiBPbiAxMC4wNS4yMiAwMjoxMiwg
WmFjayBSdXNpbiB3cm90ZToNCj4+PiBPbiBNYXkgOSwgMjAyMiwgYXQgNjo1NyBBTSwgSGFucyBk
ZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4+PiB3cm90ZTogT24gNC8xMS8yMiAxNjoy
NCwgWmFjayBSdXNpbiB3cm90ZToNCj4+Pj4gT24gTW9uLCAyMDIyLTA0LTExIGF0IDEwOjUyICsw
MjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiBGZWRvcmEgaGFzIHJlY2Vp
dmVkIGEgYnVnIHJlcG9ydCBoZXJlOg0KPj4+Pj4gDQo+Pj4+PiBodHRwczovL25hbTA0LnNhZmVs
aW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZidWd6aWxsYS5y
ZWRoYXQuY29tJTJGc2hvd19idWcuY2dpJTNGaWQlM0QyMDcyNTU2JmFtcDtkYXRhPTA1JTdDMDEl
N0N6YWNrciU0MHZtd2FyZS5jb20lN0MyZGNhMmE3YzczMWM0MmM5Y2RjNjA4ZGEzMjc1MzRlMyU3
Q2IzOTEzOGNhM2NlZTRiNGFhNGQ2Y2Q4M2Q5ZGQ2MmYwJTdDMCU3QzAlN0M2Mzc4Nzc3NzYyNDM5
NTUwNjclN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpv
aVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3QyU3QyZh
bXA7c2RhdGE9aU40SlBUUkRKYVVxVSUyRmNpUVNDZEdXZzQ1eURBOGlaRUF5S0JXQjgwSVo0JTNE
JmFtcDtyZXNlcnZlZD0wDQo+Pj4+PiANCj4+Pj4+IA0KPj4+Pj4gDQo+IFRoYXQgRmVkb3JhIHJh
d2hpZGUgVk1zIG5vIGxvbmdlciBib290IHVuZGVyIHRoZSBWaXJ0dWFsQm94DQo+Pj4+PiBoeXBl
cnZpc29yIGFmdGVyIHRoZSBWTSBoYXMgYmVlbiB1cGRhdGVkIHRvIGEgNS4xOC1yYyMga2VybmVs
Lg0KPj4+Pj4gDQo+Pj4+PiBTd2l0Y2hpbmcgdGhlIGVtdWxhdGVkIEdQVSBmcm9tIHZtd2FyZWdm
eCB0byBWaXJ0dWFsQm94U1ZHQQ0KPj4+Pj4gZml4ZXMgdGhpcywgc28gdGhpcyBzZWVtcyB0byBi
ZSBhIHZtd2dmeCBkcml2ZXIgcmVncmVzc2lvbi4NCj4+Pj4+IA0KPj4+Pj4gTm90ZSBJJ3ZlIG5v
dCBpbnZlc3RpZ2F0ZWQvcmVwcm9kdWNlZCB0aGlzIG15c2VsZiBkdWUgdG8NCj4+Pj4+IC1FTk9U
SU1FLg0KPj4+PiANCj4+Pj4gVGhhbmtzIGZvciBsZXR0aW5nIHVzIGtub3cuIFVuZm9ydHVuYXRl
bHkgd2UgZG8gbm90IHN1cHBvcnQNCj4+Pj4gdm13Z2Z4IG9uIFZpcnR1YWxCb3guIEknZCBiZSBo
YXBweSB0byByZXZpZXcgcGF0Y2hlcyByZWxhdGVkIHRvDQo+Pj4+IHRoaXMsIGJ1dCBpdCdzIHZl
cnkgdW5saWtlbHkgd2UnZCBoYXZlIHRvIHRpbWUgdG8gbG9vayBhdCB0aGlzDQo+Pj4+IG91cnNl
bHZlcy4NCj4+PiANCj4+PiBJIHNvbWV3aGF0IHVuZGVyc3RhbmQgd2hlcmUgeW91IGFyZSBjb21p
bmcgZnJvbSwgYnV0IHRoaXMgaXMgbm90IA0KPj4+IGhvdyB0aGUga2VybmVscyAibm8gcmVncmVz
c2lvbnMiIHBvbGljeSB3b3Jrcy4NCj4gDQo+IEhhbnMsIG1hbnkgdGh4IGZvciB3cml0aW5nIHlv
dXIgbWFpbCwgSSBvbmNlIGludGVuZGVkIHRvIHdyaXRlIHNvbWV0aGluZw0KPiBzaW1pbGFyLCBi
dXQgdGhlbiBmb3Jnb3QgYWJvdXQgaXQuIDotLw0KPiANCj4+PiBGb3IgdGhlIGVuZCB1c2VyIGEg
cmVncmVzc2lvbiBpcyBhIHJlZ3Jlc3Npb24gYW5kIGFzIG1haW50YWluZXJzIHdlDQo+Pj4gYXJl
IHN1cHBvc2VkIHRvIG1ha2Ugc3VyZSBhbnkgcmVncmVzc2lvbnMgbm90aWNlZCBhcmUgZml4ZWQg
YmVmb3JlDQo+Pj4gYSBuZXcga2VybmVsIGhpdHMgZW5kIHVzZXIncyBzeXN0ZW1zLg0KPj4gDQo+
PiBJIHRoaW5rIHRoZXJl4oCZcyBhIG1pc3VuZGVyc3RhbmRpbmcgaGVyZSAtIHRoZSB2bXdnZngg
ZHJpdmVyIG5ldmVyDQo+PiBzdXBwb3J0ZWQgVmlydHVhbEJveC4gVmlydHVhbEJveCBpbXBsZW1l
bnRhdGlvbiBvZiB0aGUgc3ZnYSBkZXZpY2UNCj4+IGxhY2tzIGEgYnVuY2ggb2YgZmVhdHVyZXMs
DQo+IA0KPiBXaGljaCBmcm9tIHRoZSBrZXJuZWwncyBwb2ludCBvZiB2aWV3IGlzIGlycmVsZXZh
bnQuIElmIHRoZSBMaW51eA0KPiBrZXJuZWwncyB2bXdnZnggZHJpdmVyIGV2ZXIgc3VwcG9ydGVk
IHRoZSBWaXJ0dWFsQm94IGltcGxlbWVudGF0aW9uIHRoZW4NCj4gdGhpbmdzIHNob3VsZG4ndCBy
ZWdyZXNzIHdpdGggbGF0ZXIgdmVyc2lvbnMuDQoNCkl0IG5ldmVyIGRpZC4gdm13Z2Z4IGlzIGp1
c3QgYSBkcml2ZXIgZm9yIFZNd2FyZSdzIFNWR0EgZGV2aWNlLCBpdCBuZXZlciBzdXBwb3J0ZWQg
YW55dGhpbmcgZWxzZS4gDQoNCno=

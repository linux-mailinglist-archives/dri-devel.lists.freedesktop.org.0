Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2235B53DD9A
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jun 2022 20:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B1F1124DB;
	Sun,  5 Jun 2022 18:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072C2112564;
 Sun,  5 Jun 2022 18:16:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFPjzIQ4653NrfXzyrbDmC53mc7GvZWbV8I+I8UC1JiXCSdFShmF1gwcuQ1tIWhmm5PSriNVHwVIh7PoYFoc/G7OwXrPdvjBIJMca7SPg26R3Dr+zW6DfeKUbTqu9/C7FPziKKUomz3zx8LXgpDfYGVIS7lPXTmmDWWLv2/PKXaAO40DmfTB/xAlZskeBa8pXZ1UTRp8K5JW/t79Gw97krYd9IYJ8sLzrNEktbd8Ercz1qniHM2XOkVVPfWH/kFVPds9QH5aBzfkOyhJy8k24YNGzJZOjhTM0NdSnGEvF2/OUdNWW8IFOiXae4F4Pkg5T385jwSv7Q/baBhKp362Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNGwY1p6uIpkp8U2oIHOpld5EYu8K/08RfYV0oGzEJA=;
 b=GdLM3o2GfzxYJafYMdOXL7LcLLMJBiX62BvLNtVcBSZbu+DH6PYvUK+I46gylkDpduOeZD6Pku72hqJb5WDNfpm8sjxtAwjcUA8farZY/m3USuVHKktaKJlsPQDWEtcS77ws5pSypnwNFJbKYn71qNlC6fHb4nPaQBL9j9E5e1ckyobdYpNsGYVDWHV14uoQTHLgNMv3Wg71h9S6SqClzTv91LiQGPZh/3V2BlF3LpAwIbICxXneUj4EIHxF6UEGhyTYajWwD5a28GB2a+NptBEJ0B6nLtwwD2q/HczP4tPA3gkBxRrwE6eghYOupldJDdqpld6mSEm/lQCxw6faUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNGwY1p6uIpkp8U2oIHOpld5EYu8K/08RfYV0oGzEJA=;
 b=VP+VEiuIuJD7BbZfJ3zKhKh5gSWICsxgMjg93/n2+3GKTFTDVLoRydg6wCgTX3Ur5ccMqaiaCpclDkK+8w6Bz3xLDlE6kyeAtQQXam+AQLpZxjdyt1q7xjJ++cTFt6mzvAKcXlm2IurfdouFsF46D8EbljZo/J6uGRIy2CbQ+Bo=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by MWHPR05MB3469.namprd05.prod.outlook.com (2603:10b6:301:43::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.9; Sun, 5 Jun
 2022 18:16:20 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::10c6:987:f526:83aa]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::10c6:987:f526:83aa%3]) with mapi id 15.20.5332.009; Sun, 5 Jun 2022
 18:16:20 +0000
From: Zack Rusin <zackr@vmware.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Thread-Topic: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Thread-Index: AQHYdpeKjA+fIeSl9UGD1Oezsoj+Fa09u26AgAADaYCAAAGbAIAAAasAgAAE/ICAAAXJgIAAAWOAgAACrgCAAATmAIAALVWAgAJrx4CAAIr7gIAACtEAgAAexIA=
Date: Sun, 5 Jun 2022 18:16:20 +0000
Message-ID: <EE5BAC79-2FB9-4AAB-9F68-D702C970FEA2@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wgIEdQpY_K8Qlq_xWBLy4DHOGwKi0P2c8a5dnTXM4dKOsA2hydYyT9DC6T1ldVZmi_mduaTPi4fnidg1msOofUUKkbnal0-Vv3VuTnfZh0s=@emersion.fr>
 <E53D9148-350D-4430-B4EF-689BBC1A9506@vmware.com>
 <GWQv37zd56Jok0LiKDGflZUSaHMYyk9Uad7M6-6-gqjeUGoT5dJOfsB9XDS4UuVEcZSI34GOTFa4XA0Cf2A1sGNhvbIsE16V7CyhxFne0d4=@emersion.fr>
 <00204913-BCF7-4D42-856D-675342B2B3E9@vmware.com>
 <GpX_UKNDfd2A3OuFfb9ga63xIKRP4vKVT2HTWBRw9mX0gsN743hR9bmx4be0OMukhdVmh0p3djW7Zj-ECCr4Q5-NRiPbWMLWAnTiZaPQVMU=@emersion.fr>
 <1E185B64-591E-47A5-A4D9-55E1BC3105CC@vmware.com>
 <VdFbe3wmVv8sSzgW8rsWsOaP3vTRyGGs86yIrHzf95_hCzy2ZNc90dY1TNUcVCo6057K1hsY0y_kVoFRfZ23hgUKMIpSoRAh5MAh5RmBUZI=@emersion.fr>
 <40CAE3E3-9C74-4DC3-B0FD-8F00C7C29291@vmware.com>
 <UJ7PkcvdPsH-Mg3A4gJZWwCVK560WK9iiZC9N4Soh-1ISTHTDBRiZaS4D4Y-y_rZYzMUeQXbZsLT0-37Lly0zhp9HocepA7iCjE9_0mQZmo=@emersion.fr>
In-Reply-To: <UJ7PkcvdPsH-Mg3A4gJZWwCVK560WK9iiZC9N4Soh-1ISTHTDBRiZaS4D4Y-y_rZYzMUeQXbZsLT0-37Lly0zhp9HocepA7iCjE9_0mQZmo=@emersion.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5d9ff36-3224-41ae-91a4-08da471f7da6
x-ms-traffictypediagnostic: MWHPR05MB3469:EE_
x-microsoft-antispam-prvs: <MWHPR05MB346908DA219A45209ECE1E24CEA39@MWHPR05MB3469.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pz3b+sD38GrrCTSLkbn6b7mlwgG6d7gWCsmoWZDMicAi7kukSmbFHZyahL4P1FaQB5MUobMAZJCIECA9242wotVXGytVeTt/Rpv6mjX3vp8RCXmMEsbE3AO+pvqsKeGAh8rerLGR4nrhCAyn+SciNXGXk+plnfOZKVriLlbTZ4Sdc4G1Y9ilu0yRs+kZrAuXMWziZu8el4ZiUEM/ppCFoG5umM6W2ea10oxZ9SSRtiMy8vHYf/A6lvf8hSJn+Kkf2ZE6IT7QzZ0KErn7WbINzfJyPNvdKUMqThQdnSRY9Gnh42y5tmuQLk316DZAjDzw6a99iUr8sDjHt4VNm2ACGwm6FbpY9UiCPa6yoilT4Ayc6qC/wz80ZI61oWYtCOqDqggA3boUhBIuN2jSIPZQdwT6dH6AjPlN6g2ZD708mBksCAEPAmBL7VrOi9jK1IZ9kn8vj43Dy9mwHw46SN3WxAflL4FJg8i8NGFkZngadMPqD2iuz5jNAk96DmH9NcVIjGmjOD/jUuMzpvjbGJFVQlm70VUAJIeS58nB79sVBtY5cgj983BgywEg5ThJTTYUi1Ny6NcoqJ2yfZUoS6yGx8ljLM6O8gCv2WQK6FG0ucjExHW3dA6uA4QCsw5tbTDF2rnt7Hej9rp2a0/ZTDdXJbV0b3105rKKrb1urHv9MZDn0RC329tlNStic7OKOY4TLe35kH27LFaUsu7j9Kl/ExghMw+XXRJ9r8Ci8iZ/PhZtwb8U37oYRz/VmWckLyA+PiggfqANM6LI8cAF1LvbFdFZ0ui8fdFia6+fV+atRBw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(91956017)(83380400001)(6506007)(76116006)(8936002)(66946007)(66556008)(53546011)(36756003)(38100700002)(122000001)(186003)(508600001)(6512007)(26005)(2616005)(5660300002)(38070700005)(6486002)(66574015)(8676002)(4326008)(54906003)(316002)(66476007)(2906002)(71200400001)(86362001)(6916009)(33656002)(64756008)(66446008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDE2VjVwTERmTk9SUk9WK0s2QWpoNElHR3VxZktKblk2bEppTDk3a01JWDdp?=
 =?utf-8?B?Ry85bTdjSEJWUTRwOVp0UkVPRkVBb2NTTU1rcVp4N3hIUDk3TGV3ZWZ1STdK?=
 =?utf-8?B?VUIzUGloVU1zR2gycm52S0pJMUpaK1BIU0JNc2VDMldWZ0phQUViS1NiL2M3?=
 =?utf-8?B?azVWdVZDNWN5aVlGMHIrcGpCK2o3QU5qSHYzdmxsY1RibHg5ckJObFJBQVVs?=
 =?utf-8?B?SFRkcmVQR2JhMndYcFFRNVJvVDJPNGlzdkkzMHRhOEpTK3BuUW1YY2hjTWhU?=
 =?utf-8?B?Zm9ObzZkTkgvN0ZnS3JzdXRLb3lYZGYzNitEbjZyVmZQSGlwT3lRL0oxUExP?=
 =?utf-8?B?cDFKV29QNndHWkUyUHMrR1RKd1J4RmRFZGNHQ0dESzcxKzhUaWhQR2JwemdH?=
 =?utf-8?B?WEFyUlJUdXNVbTU5c2FuaG52SFBzK0d4STd2dWQ0em1KdWFtN1IyZlJzeWxi?=
 =?utf-8?B?WmJhN1dPVWl3ejFud2hzcTZxMCtTTDBGYytrNEhLTFo1VCtjbWRvQnlaQmU0?=
 =?utf-8?B?czFVTUI0aEN6ZHloUlVZY3V3dXFuNHQ4OXRZRnVJdkN0eElnY3Z5cDlWeFJl?=
 =?utf-8?B?WWFIV3ZsMk96RmRnR1dZR1lUcUx0Tzd0Zlp3TkU3eTd1VnFVWjVqQ2hRZUQ2?=
 =?utf-8?B?M25FbERpcDYyK24ydmlSVGpBdGViN0pDdkdRQ1RuTGxadGRwMFNjN09uRnZo?=
 =?utf-8?B?d2hzUHdUbGpQN1ErV1BlaEMxSEFrcUJaTFpiTEdEek1YUGdYenBpbmd6SSts?=
 =?utf-8?B?R2FnWm5ONDNDRkNpTHE3bFg2V0E1UWthN0RjYmdWeFZER2lTK05YZFlTZzhn?=
 =?utf-8?B?aE1Lb2VmT3NJUXBDbm1jczh1TGpOdGgwc1RWa3VWaWgrQlJScThDa3FmQ3dW?=
 =?utf-8?B?RzRjU3RCTkRxUHVWU1BoNWtyc0FzaG5YajlrR09PdWtVUytHUjkyVFVYUWR6?=
 =?utf-8?B?bUdRVWlTZXV0ZGRBdkFxQ3NjVVpOZHU2SEtYWDd0cUczbDE3K0xrNGVDUFR3?=
 =?utf-8?B?SE5BQzllaUlkZE91UUliTUN2bVdueUdFVVJySS9uNDBQalNMN28zTm50VE1Y?=
 =?utf-8?B?Zm5Talgzakx5L1JHSlJxaFRWUlV4OS85TTZaYXNrNG1JM1U1M2RBY1BuWDE0?=
 =?utf-8?B?YWtkeHNKdmgwS2tvQ1RVdnBpT2dvNVNGWXdNN3JqNFlHOGRSbDNzTkR2VmdH?=
 =?utf-8?B?N0dydEVPcUhCMjBaYzdlVzNRdmdRaVoxbGtQQlMyM3VjdUZ2UmszY0ZZUDZM?=
 =?utf-8?B?TmN3RnU4bmN3MG5iblN4VXp1VnljNTNtd1V6ZStHaS96Z09IenAvMXNRYW1L?=
 =?utf-8?B?ZWpaU3Fmc1NjRWkxTXNSN2FXSEhnM0dQSzl3ck1FTjM2NVBOM1JvUnhCRXl5?=
 =?utf-8?B?V1g5akVTUExoY0ZodUhqR1pBQVpCSkdjMUUvZjRya0JudkVielphbitmTHJq?=
 =?utf-8?B?U0xyN1YxRWRicG9IQ1NZbTJLWjJqNy9RZjF3Vjd3NzFiK0FUU245eFZ6blhv?=
 =?utf-8?B?czE3RTA0SGRoN1RScUJ4R3pMODhaZjl0OCthM2Nudms3TVhiU3EydFdoYy9n?=
 =?utf-8?B?dDlLSDRmNHVDa05YTk1IOVl2b0F5YmFwTTIvbmtQZ2xmUU12SnF3aHBRb2FM?=
 =?utf-8?B?NkdlUmtlRERhZ0RSMnJPVG03OVBKcTJVTGJybGxhN3l3NDNnTkF2RnhhZHR4?=
 =?utf-8?B?dnJhTXA5dFZacGxyeitwYVpUeUFZUlJ3Mmo2MW1LNzJER1prWitqcVFGYU5x?=
 =?utf-8?B?SzBJaEoyYk5vc0pMOFhJR2dGcjIyYkNIUVVYZEFPQWFNLzRGRmRZaEtGVGxo?=
 =?utf-8?B?OFozNVdRY3BQK0V3TW1WK0ZsK1JtWURycWxydWg4YUFYWStUckt2T1E5SW9P?=
 =?utf-8?B?SFJOLzRBNEp2KzRUSmpOVEpWYkdNdFh1SSsyQWs2akNGV3p1SVBaODh0U0w0?=
 =?utf-8?B?NG5aZFkwVWVSMzR6eFV5SjJSYW9NMW1RYWRWSFZrZWMrbThwRjd5N0puL040?=
 =?utf-8?B?cnVrM3Z1K1FsZjYrZUNNUXRZUEc1MjI5Z1NXY2RuSmlBc3lleW1kYVUvclB2?=
 =?utf-8?B?QnZDTnFYdS9qYXd3VTd3dnFSakFEQVVzSGZCOE1sbHdKNyswU0ZZWUJaYmhI?=
 =?utf-8?B?dzRCUWxtZnppVlhDUnZuV1dybW5DZkhPSTJaZ1BORUVLNHVRc1hJR2ZQbTR2?=
 =?utf-8?B?bXNmR1lKdGtFWUlrbGVNU2t5cnpvOXZxZXdkZEQ1dFF1cVpKK3Z6S0xrVEho?=
 =?utf-8?B?bjAya0NvdDljYUQ5OTJHUVNqeDMzc1JGczNSK1R4dDgydUQ4dnBxa1JpU3NL?=
 =?utf-8?B?NE9nbVc1OFZGejgrcmtoYkthWVpxcGN6UHpjbTV1clhWRmIvczFDZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CF8A98A29B4004DAE1C127069A9672E@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d9ff36-3224-41ae-91a4-08da471f7da6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2022 18:16:20.3504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qMQ7asi8W89tPhcccMnF69hI+DV4gx1OCJ4ENVgLQHgFU8C/4Y61CnKe5Xxi8QoVuWZuRW4aBpoGp2byrk5JFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR05MB3469
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
Cc: Martin Krastev <krastevm@vmware.com>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+IE9uIEp1biA1LCAyMDIyLCBhdCAxMjoyNiBQTSwgU2ltb24gU2VyIDxjb250YWN0QGVtZXJz
aW9uLmZyPiB3cm90ZToNCj4gDQo+IC0tLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLS0tDQo+
IE9uIFN1bmRheSwgSnVuZSA1dGgsIDIwMjIgYXQgMTc6NDcsIFphY2sgUnVzaW4gPHphY2tyQHZt
d2FyZS5jb20+IHdyb3RlOg0KPiANCj4+Pj4gQWxzbywgbGV0IG1lIHBvaW50IHRoaXMgb3V0IGJl
Y2F1c2UgaXQgYWxzbyBzZWVtcyB0byBiZSBhIGZ1bmRhbWVudGFsDQo+Pj4+IG1pc3VuZGVyc3Rh
bmRpbmcsIHVzZXIgc3BhY2UgaW1wbGVtZW50aW5nIHNvZnR3YXJlIGN1cnNvciBkb2VzbuKAmXQg
Zml4DQo+Pj4+IGFueXRoaW5nLiBKdXN0IGxlYXZlcyBldmVyeXRoaW5nIGJyb2tlbiBpbiBkaWZm
ZXJlbnQgd2F5cy4gVGhlIHJlYXNvbg0KPj4+PiB2aXJ0dWFsaXplZCBkcml2ZXJzIHdlbnQgYXdh
eSBmcm9tIHNvZnR3YXJlIGN1cnNvcnMgaXMgYmVjYXVzZSBpdCBtYWtlcyBpdA0KPj4+PiBpbXBv
c3NpYmxlIHRvIG1ha2UgaXQgd29yayB3aXRoIGEgYnVuY2ggb2YgaW50ZXJlc3RpbmcgYW5kIGRl
c2lyYWJsZQ0KPj4+PiBzY2VuYXJpb3MsIGUuZy4gdW5pdHkgbW9kZSB3aGVyZSB0aGUgZ3Vlc3Qg
bWlnaHQgaGF2ZSBhIHRlcm1pbmFsIGFuZCBicm93c2VyDQo+Pj4+IG9wZW4gYW5kIHRoZW4gdGhl
IHZpcnR1YWwgbWFjaGluZSBzb2Z0d2FyZSBjcmVhdGVzIHdpbmRvd3Mgb3V0IG9mIHRob3NlLCBz
bw0KPj4+PiB5b3UgZG9u4oCZdCBoYXZlIHRoZSBlbnRpcmUgZGVza3RvcCBvZiB0aGUgZ3Vlc3Qg
YnV0IGluc3RlYWQgbmF0aXZlIGxvb2tpbmcNCj4+Pj4gd2luZG93cyB3aXRoIHRoZSBhcHBzLiBJ
biB0aGF0IGNhc2UgZ3Vlc3QgaGFzIG5vIHdheSBvZiBrbm93aW5nIHdoZW4gdGhlDQo+Pj4+IGN1
cnNvciBsZWF2ZXMgdGhlIHdpbmRvdywgc28gdG8gbWFrZSBzZWVtbGVzcyBjdXJzb3JzIHdvcmsg
eW914oCZZCBuZWVkIHRvDQo+Pj4+IGltcGxlbWVudCBpcmMgb3IgYmFja2Rvb3JzIHRoYXQgc2Vu
ZCB0aGF0IGluZm9ybWF0aW9uIGZyb20gdGhlIGhvc3QgdG8gdGhlDQo+Pj4+IGd1ZXN0LCB0aGVu
IGhhdmUgdmlydHVhbGl6ZWQgZHJpdmVycyBjcmVhdGUgc29tZSBzb3J0IG9mIHVldmVudCwgdG8g
c2VuZCB0bw0KPj4+PiB0aGUgdXNlcnNwYWNlIHRvIGxldCBpdCBrbm93IHRvIGhpZGUgdGhlIGN1
cnNvciBiZWNhdXNlIGl0IGFjdHVhbGx5IGxlZnQgdGhlDQo+Pj4+IHdpbmRvdy4gVGhhdOKAmXMg
YSB0cml2aWFsIHNjZW5hcmlvIGFuZCB0aGVyZeKAmXMgYSBsb3QgbW9yZSB3aXRoIG1pY2UgdGhh
dCBhcmUNCj4+Pj4gcmVtb3RlZCB0aGVtc2VsdmVzLCBndWVzdHMgd2l0aCBzaW5ndWxhciBvciBt
YXliZSBtYW55IGFwcHMgZXhwb3J0ZWQsDQo+Pj4+IHBvc3NpYmx5IG92ZXJsYXBwaW5nIG9uIHRo
ZSBob3N0IGJ1dCBhbGwgd2l0aGluIGEgZGVza3RvcCBpbiB0aGUgZ3Vlc3QsIGV0Yy4NCj4+PiAN
Cj4+PiBBcmUgeW91IHNheWluZyB0aGF0IHRoZSBjdXJyZW50IGJyb2tlbiBiZWhhdmlvciBpcyBi
ZXR0ZXIgdGhhbiBzb2Z0d2FyZQ0KPj4+IGN1cnNvcnM/DQo+PiANCj4+IFRoZXnigJlyZSBicm9r
ZW4gaW4gdmVyeSBkaWZmZXJlbnQgd2F5cy4gWW914oCZcmUgYXNraW5nIG1lIHdoaWNoIGJ1Z3Mg
ZG8NCj4+IEkgcHJlZmVyLiBVbHRpbWF0ZWx5IHRoZSBjdXJyZW50IGxhY2sgb2YgaG90c3BvdHMg
bGVhdmVzIG1vdXNlIHVudXNhYmxlDQo+PiBidXQgSSBkb27igJl0IHNlZSBhbnkgcmVhc29uIHRv
IHRyYWRlIHRoYXQgZm9yIGFub3RoZXIgc2V0IG9mIGJ1Z3MgaW5zdGVhZA0KPj4gb2YganVzdCBm
aXhpbmcgaXQgKGVpdGhlciB2aWEgZmFsbGJhY2sgdG8gbGVnYWN5IG9yIHVzaW5nIHRoZSBuZXcg
aG90c3BvdA0KPj4gYXBpKS4NCj4gDQo+IFNvZnR3YXJlIGN1cnNvcnMgYXJlbid0IGEgYnVnLiBU
aGV5J3JlIGEgZmFsbGJhY2suDQoNClRoZXkgd29yayB3ZWxsLCBvciB1c3VhbGx5IHdlbGwgZW5v
dWdoLCBvbiBuYXRpdmUgYnV0IG5vdCB3aXRoIHZpcnR1YWwgbWFjaGluZXMuIFRoZXkgYnJlYWsg
YSBsb3Qgb2YgZmVhdHVyZXMuIFRoZSBuYXR1cmUgb2YgdmlydHVhbGl6YXRpb24gaXMgdGhhdCB0
aGUgZ3Vlc3QgZG9lc27igJl0IGV4cGxpY2l0bHkgZ2V0IGFjY2VzcyB0byBhIGxvdCBvZiBob3N0
IHNpZGUgaW5mby4gSWYgeW91IG1vdmUgdG8gc29mdHdhcmUgY3Vyc29yIHlvdSBhdXRvbWF0aWNh
bGx5IGxvc2UgYWxsIHRoYXQgaW5mbyAodW5sZXNzLCBhcyBJIG1lbnRpb25lZCBiZWZvcmUsIHlv
dSByZXdyaXRlIGh5cGVydmlzb3JzIHRvIHB1c2ggYWxsIHRoYXQgaW5mbyB0byBndWVzdHMgYWdh
aW4sIGVpdGhlciB2aWEgYmFja2Rvb3JzLCBpcnEgb3IgcmVnaXN0ZXIgYWNjZXNzZXMpLiBTb2Z0
d2FyZSBjdXJzb3IganVzdCBkb2VzbuKAmXQgd29yayB3aXRoIG1vZGVybiBoeXBlcnZpc29ycyB3
ZWxsIGVub3VnaCB0byBiZSBhIHJlYXNvbmFibGUgcmVwbGFjZW1lbnQuIA0KDQo+Pj4+Pj4+IE5l
dyB1c2VyLXNwYWNlIHN1cHBvcnRzIHNldHRpbmcgdGhlIGhvdHNwb3QgcHJvcCwgYW5kIGlzIGF3
YXJlIHRoYXQgaXQgY2FuJ3QNCj4+Pj4+Pj4gc2V0IHRoZSBjdXJzb3IgcGxhbmUgcG9zaXRpb24s
IHNvIHRoZSBjdXJzb3IgcGxhbmUgY2FuIGJlIGV4cG9zZWQgYWdhaW4gd2hlbg0KPj4+Pj4+PiB0
aGUgY2FwIGlzIGVuYWJsZWQuDQo+Pj4+Pj4gDQo+Pj4+Pj4gQnV0IHdlIHN0aWxsIHVzZSBjdXJz
b3IgcGxhbmUgcG9zaXRpb24uIEhvdHNwb3RzIGFyZSBvZmZzZXRzIGZyb20NCj4+Pj4+PiBjdXJz
b3IgcGxhbmUgcG9zaXRpb25zLiBCb3RoIGFyZSByZXF1aXJlZC4NCj4+Pj4+IA0KPj4+Pj4gTm8s
IFZNIGRyaXZlcnMgZG9uJ3QgbmVlZCBhbmQgZGlzcmVnYXJkIHRoZSBjdXJzb3IgcG9zaXRpb24g
QUZBSUsuIFRoZXkNCj4+Pj4+IHJlcGxhY2UgaXQgd2l0aCB0aGUgaG9zdCBjdXJzb3IncyBwb3Np
dGlvbi4NCj4+Pj4gDQo+Pj4+IElpcmMgdGhleSBhbGwgdXNlIGl0Lg0KPj4+IA0KPj4+IFdoYXQg
ZG8gdGhleSB1c2UgaXQgZm9yPw0KPj4+IA0KPj4+IFRoZSB3aG9sZSBwb2ludCBvZiB0aGlzIGRp
c2N1c3Npb24gaXMgdG8gYmUgYWJsZSB0byBkaXNwbGF5IHRoZSBndWVzdCdzIGN1cnNvcg0KPj4+
IGltYWdlIG9uIHRoZSBob3N0J3MgY3Vyc29yLCBzbyB0aGF0IGxhdGVuY3kgaXMgcmVkdWNlZD8N
Cj4+IA0KPj4gDQo+PiBBaCwgSSB0aGluayBJIHNlZSBub3cgd2hlcmUgdGhlIGNvbmZ1c2lvbiBp
cyBjb21pbmcgZnJvbS4gTm8sIGl04oCZcw0KPj4gZGVmaW5pdGVseSBub3QuIFRoaXMgaGFzIG5v
dGhpbmcgdG8gZG8gd2l0aCBsYXRlbmN5LiBCeSBkZWZhdWx0DQo+PiBwb3NpdGlvbiBvZiBhIG1v
dXNlIGN1cnNvciBkb2VzbuKAmXQgdGVsbCB1cyB3aGVyZSB0aGUgcG9pbnQgdGhhdCBpcw0KPj4g
YWN0dWFsbHkgdXNlZCBhcyBhbiBhY3RpdmF0aW9uIG9mIGEgY2xpY2sgaXMsIGUuZy4gYSBtb3Vz
ZSBjdXJzb3IgaW1hZ2UNCj4+IHdpdGggYW4gYXJyb3cgcG9pbnRpbmcgdG8gdGhlIHRvcC1sZWZ0
IGFuZCBhIG1vdXNlIGN1cnNvciBpbWFnZSBwb2ludGluZw0KPj4gdG8gdGhlIGJvdHRvbSByaWdo
dCAtIGJvdGggYXQgdGhlIHNhbWUgcG9zaXRpb24sIGFzIHlvdSBjYW4gaW1hZ2luZSBpdCB3aWxs
DQo+PiBiZWNvbWUgaW1wb3NzaWJsZSB0byB1c2UgdGhlIGRlc2t0b3AgaWYgdGhlIGNsaWNrIGRl
ZmF1bHRzIHRvIHRoZSB0b3AgbGVmdCwNCj4+IGVzcGVjaWFsbHkgYXMgdGhlIG51bWJlciBvZiBj
dXJzb3IgaW1hZ2VzIGluY3JlYXNlcywgeW91IG5lZWQgaW5mb3JtYXRpb24NCj4+IGFib3V0IHdo
aWNoIHBvaW50IHdpdGhpbiB0aGUgY3Vyc29yIGltYWdlIGFjdGl2YXRlcyB0aGUgY2xpY2ssIHRo
YXTigJlzIHRoZQ0KPj4gaG90c3BvdC4gWW91IG5lZWQgdG8ga25vdyB0aGUgcG9zaXRpb24gb2Yg
dGhlIGltYWdlIGFuZCB5b3UgbmVlZCB0byBrbm93DQo+PiB3aGljaCBwb2ludCB3aXRoaW4gdGhh
dCBpbWFnZSBpcyByZXNwb25zaWJsZSBmb3IgYWN0dWFsbHkgYWN0aXZhdGluZyB0aGUNCj4+IGV2
ZW50cy4NCj4gDQo+IFllYWgsIHRoYXQncyB3aGF0IGEgaG90c3BvdCBpcy4NCj4gDQo+IEJ5ICJ0
aGUgd2hvbGUgcG9pbnQgb2YgdGhpcyBkaXNjdXNzaW9uIiwgSSBtZWFudCB0aGF0IHRoZSB3aG9s
ZSBwb2ludA0KPiBmb3IgVk0gZHJpdmVycyB0byBleHBvc2UgYSBoYXJkd2FyZSBjdXJzb3IgaXMg
dG8gaW1wcm92ZSBsYXRlbmN5IChhbmQNCj4gcHJvdmlkZSBvdGhlciByZWxhdGVkIGZlYXR1cmVz
KS4NCj4gDQo+IEF0IGFueSByYXRlLCBJIGNvbnNpZGVyIGJyb2tlbiBhbnkgZHJpdmVyIHdoaWNo
IGV4cG9zZXMgYSBjdXJzb3IgcGxhbmUsDQo+IHRoZW4gZG9lc24ndCBkaXNwbGF5IGl0IGV4YWN0
bHkgYXQgdGhlIENSVENfWC9DUlRDX1kNCg0KQnV0IHdlIGRv4oCmIFRoZSBjdXJzb3IgaXMgYXQg
Y3J0Y194LCBjcnRjX3kuDQoNCj4gb3IgbWlzYmVoYXZlcyBpZiBpdCdzIG1pc3NpbmcgaG90c3Bv
dCBpbmZvLg0KDQpUaGF0IGRvZXNu4oCZdCBmb2xsb3cgYXQgYWxsLiBIb3cgY2FuIHRoZXkgbm90
IGJlaGF2ZSBpbmNvcnJlY3RseSBpZiB0aGUgaW5mb3JtYXRpb24gaXMgbWlzc2luZz8NCg0KTWF5
YmUgd2UgY2FuIHJlZm9jdXMgdGhlIGRpc2N1c3Npb24gYmVjYXVzZSBpdCBzZWVtcyBsaWtlIHdl
4oCZcmUgbW92aW5nIGluIGNpcmNsZXMuIFlvdXIgcHJvcG9zYWwgZm9yIGEgZmVhdHVyZSBjYXAg
YW5kIHJlbW92YWwgb2YgdGhlIGN1cnNvciBwbGFuZSBkb2VzbuKAmXQgZml4IGFueXRoaW5nOg0K
LSBjdXJyZW50IHVzZXIgc3BhY2Ugd2hpY2ggZG9lc27igJl0IGZhbGxiYWNrIHRvIGxlZ2FjeSBr
bXMgd2l0aCB2aXJ0dWFsaXplZCBkcml2ZXIgaXMgY29tcGxldGVseSBicm9rZW4gYW5kIG9idmlv
dXNseSB3aWxsIGFsd2F5cyByZW1haW4gYnJva2VuIG9uIGFsbCBhbHJlYWR5IHJlbGVhc2VkIGtl
cm5lbHMNCi0gbWFraW5nIHRoZSBzYW1lIHNvZnR3YXJlIGZhbGxiYWNrIHRvIHNvZnR3YXJlIGN1
cnNvciBicmVha3MgYSBtYXNzaXZlIGFtb3VudCBvZiBpbnRlcmFjdGlvbnMgaW4gVk1zDQpzbyB3
aGF0IGFyZSB5b3UgcHJvcG9zaW5nPw0KDQp6DQoNCg==

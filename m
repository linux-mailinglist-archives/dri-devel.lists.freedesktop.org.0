Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13AA473FBA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 10:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E3B10E66E;
	Tue, 14 Dec 2021 09:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD80210E673;
 Tue, 14 Dec 2021 09:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnmD4I5ICSKel5Tv2m57XRaaR5apNv6+3R3B8RLEKBl55IdEDkf+TYPWF496sBbSgda7Ommal3Txik3nb9NljXf6yhv4kmEfk5+1qztmvmYUUSTZ/c/KAJKvj5TQOa1pmTMvZWoFEhfDA6e2rqeEMF2fsXEsX/kel+DNttrepX1Y4XNqi/nE6+NEvkk58bIu/vNPdpQQgTihj5Dgdti10bJ9q7PH7kyxvyT/5crchJmrnb6Qq36xdrHILeAbV2gk/iKSUAuh95jqeeeVpQJTjeFjVSY7iKPS5viLJXDHRNFSVvBXWJL5nqo17froHWU+k8+Ap2unc+Jha0fQgBmZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRyvUI+XbwwJ1oQiobpn94/gixD/U0jWx6/4euBBOTg=;
 b=LA1ETFdPubHG4jk/oq2ugQRfOApocDTBZ6BEXzwRojMpH1cCQ1LulmyM1fz86wkAEAQZ7zuFDYVDx+vUrGvJV0cMy9//hYmKtkgKW9UiS1OVLhWIFsb9Xy01af/NQ98iSCfksQdNBhE0u1mNEIh48M848VWzBAfzrcIQdK+vlHvjbDMs45hchS0VLv7NNwB8SRt5XMueCuksDszeejc1kHV/fRFgFAQE0CHcrlvrEAs0/rhV/7w6j6JbaLTPd3aDLrnvxZ5zbfqNRUeqwn1Dvpk7XJJw711mfa0hMImKv/cCy06zd0ekUnDWFpz2wkzRCccRsUQ/04JXLErMQojvbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRyvUI+XbwwJ1oQiobpn94/gixD/U0jWx6/4euBBOTg=;
 b=LXfigc/lxLPgTcb5WwwmZ6A8o1+gMpxNgw40GO00Dkx4l0surP8vmSJ/xoqCtB7Uqkcjh+dK/EbHsuTaTTLgPITKdo1PVgE3jQx4/pILbdDavL7uqM9glAdkK5ThJ6snpsXH+/q09Krge3eX0hstgN+7cGMyQe38WpQlHB7Uboo=
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 DM6PR12MB3082.namprd12.prod.outlook.com (2603:10b6:5:11b::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Tue, 14 Dec 2021 09:44:37 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::5d07:e475:316c:d187]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::5d07:e475:316c:d187%5]) with mapi id 15.20.4755.027; Tue, 14 Dec 2021
 09:44:37 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Subject: RE: [PATCH 1/3] dma-buf: make the flags can be configured during dma
 fence init
Thread-Topic: [PATCH 1/3] dma-buf: make the flags can be configured during dma
 fence init
Thread-Index: AQHX7+uOznD3+/hXdUSwR6bUq1yPLKwxoUaAgAATxkCAAAPTgIAAAcng
Date: Tue, 14 Dec 2021 09:44:37 +0000
Message-ID: <DM5PR12MB25040492913BA8FCA15F18D4EC759@DM5PR12MB2504.namprd12.prod.outlook.com>
References: <20211213063422.2232155-1-ray.huang@amd.com>
 <5adca96a-e2bb-833a-e470-807a22b9b2fc@amd.com>
 <DM5PR12MB250468603570AFC28C211F56EC759@DM5PR12MB2504.namprd12.prod.outlook.com>
 <152dd115-1155-20cb-879a-d4756146edb0@amd.com>
In-Reply-To: <152dd115-1155-20cb-879a-d4756146edb0@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-12-14T09:30:36Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=394b6481-03a9-4254-b42c-971e64ce9ecd;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_enabled: true
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_setdate: 2021-12-14T09:44:35Z
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_method: Standard
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_name: AMD Official Use
 Only-AIP 2.0
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_actionid: 16060451-0173-4802-bc67-8c954368c76f
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c6945a9-94c2-486d-dd53-08d9bee65812
x-ms-traffictypediagnostic: DM6PR12MB3082:EE_
x-microsoft-antispam-prvs: <DM6PR12MB3082B2206D2647EABF3526F0EC759@DM6PR12MB3082.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yOp+4xivK81jOlzOOx4dLldc2Pajr8KMZEHtniq7YNIkeIzYfKk5/+y+XwhdFhSX2zyukg+h9gXww441ZCl+4UG8jUw5B3EY+BhLowprq2wr7gxcMri5ND72raeMela2xsT++lFIQf6DHkgYM7JB6jH8QxzlApEgTvFcbEoMXhq4+3RBsyuNu/1oZ6b8mAN0eOdF44XnN0PIo/3NKXGSL4te/W6wdZi6r5WiWjTwarcecJZS1yec3no/xX3Jm/cjcy1tF1Y9CRZtn9atC0Yz+yJm9sLQ2dncpt9oWCx/kQd1QpMkBWrFjdYNSDulF65OCph+yvHQnVjBeBxZj4R8BLzT50JJt5M4VxEgy5uU9U37NxPkZAiU3mKWw6F0qed2CDOUg1f/UEkQry06Ti0OXydwFaf2oLsh6iqXkLOBX4g+uuXsum/gW3FsjuK3eYuKwBINTXa9xjT4VT0brejPvbWKMCuXgW2leW4ImezSCJSw5D29wRe5/hYWTwhSWMk83GzVF9pHFBghp/hUvzwaCiCmvd+eFVOiHcVIAzkkj4pbzmQPhza3DJBXVFOwv15VQJBSFBj/fZ23JwK3XYxQjzIUWg2psqiEhf0zOQCzRDmGr46GMZWJF+AzNZCdi0lpWZkfCsaWQTeS80oq6RrkKQf1whdY3J0abbO7J2VIl+Wxxv0hR/F1e6WW6VsOpn/P/ewonT6/PxXaLg7dX9j/jQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2504.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(66446008)(66556008)(71200400001)(66946007)(53546011)(64756008)(66476007)(110136005)(76116006)(52536014)(38070700005)(316002)(55016003)(186003)(508600001)(4326008)(54906003)(86362001)(26005)(38100700002)(83380400001)(2906002)(7696005)(33656002)(5660300002)(122000001)(8676002)(9686003)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S28xUU00amJZV0ZBd1BJeTdxOTc0VURWbE5IdVRkemVxbTJDQk51Z1gzajZs?=
 =?utf-8?B?NHlyOGFJUitUWFdIeGJSTXFSMGlBc1ppTzI1b2VDc2kxNzUxSFVOcnZ0L0ll?=
 =?utf-8?B?eVhERlozOTRabG9ITDV6dDNIUld2NTZJQ2J3TDJjcWlzSjh1ZkdFZ3cwc1Zn?=
 =?utf-8?B?V3Nrek8zS1VWZjg0enRCZWFmNGQxd3llSmRFQ3VKWTZaZWdHK25USS9paXBy?=
 =?utf-8?B?QUpiN05BUGlza0p0Z1VKVWJXbHlxZFdNKzhXWm9HeHNVZ2pUQVB0Tk1kOVhh?=
 =?utf-8?B?bTZnd1EvNEZWdHJlQU14TjczbExaVjlkL1pnU29ObFQ3cVZERnVWRTFNY2JP?=
 =?utf-8?B?aDh0Ym9IQS9lWWxOWmlRNExJUmg5cEUvVys5SDJ0VXFPTUxJeHJQWXBoV2ky?=
 =?utf-8?B?U0pHVnZONmsxSlJvTkRGdHRRanAvS2x2NjhDYi9sSGZpZzlvenlDZDRNRFdW?=
 =?utf-8?B?R2ZxMFEzZUNvQVRHZFNwVUxsSmlmaTlJUUc1RzgxRGppT092czlNdDJ1OGtw?=
 =?utf-8?B?S1dlb0kwdGV2NFVzSWZ1R29XSjd5MzhPQVpsMDNOa09veExLVTVRYll4dWVO?=
 =?utf-8?B?WjZYMGVxRlV4UVN1N04vYUxmYnVHazdzTUNXVHI0eWduazd1Uk9QYzB2dXVv?=
 =?utf-8?B?NllOam1EMTN0dTR2aktFR3FzckNpM1c2MGpaaXJyNTJMckZuOFQ4bE15WGhx?=
 =?utf-8?B?MnZqMjRTOFBsV3NZQzljMzlwYWM0dnV6dUFSSVBxaEtiYit4VXlOVmRJYlBm?=
 =?utf-8?B?N2dzNlpBcnNhU0V4Q2w3eVIvaVBwZXFManlrd0d5Qm5jZHNMMGFhRkREcEJu?=
 =?utf-8?B?czFJVFVaQ3FFaFVhcGJYdDlEVjk0VzYrb3ZWV1k2TW5SbHdkYVhKZGxxa1Nz?=
 =?utf-8?B?b3I3c045SHZLdi9mN0hYNTRZaUJXZUVTK1g1QVYrcDRrZnFxL2lDNTUzaVZm?=
 =?utf-8?B?dm9MMXo4R1FLVm81WWxHdElqVWlrSmI0dE9BWmh0OGxLaU9UREgwS0ljZUtk?=
 =?utf-8?B?cDJpNHFQczRkRTRoazJ0QW1QZ1NuTi9nRFRDUmJJQXhtS1YwcnJKVEk5WGxG?=
 =?utf-8?B?ZFVReFAyVHpDR2tsdkZDUExjTUdLZU40WW9SK0g1c2pjbEYzKzZvVVVERHdH?=
 =?utf-8?B?dXA0UitRRDQxcXZNT2ZNQWtVdzVHclo3Y0xGaXdyaHh2bmV2WmI5aGtXMmFU?=
 =?utf-8?B?VGRhU0haNGFNVWRIQ1ZRalo0YjZRaTIvbU45V0tXK0JYY2RoenFzTlZIM2NL?=
 =?utf-8?B?L1ZvMzR0aUJzMndYYjgwSFZJbGx6N2gxbnI1UDRSVjBtL3dub3ZuZW9pZWtn?=
 =?utf-8?B?N3ZJMUl4UzE1dzhad1FoY1dHV2E4K3VmaDNwbUo0WVdmKzVRY2pXaEZxaHQx?=
 =?utf-8?B?OXRZOXIvdjBjOHR4dnZSVEhYUVJhQ0xhN0dRVTVFVkZNN3pKc21rRDdVUGkz?=
 =?utf-8?B?Mml6L2QxTGRNR0NiaDhBRWwxNG5FbDl3TFpUWjF4OUIreE1UVmVqRnhPc0lz?=
 =?utf-8?B?K0JITlM5Nk4xK0RQWndMT3l0ZU1LUnhKeDRsYVo4MjBzNElNbWJJdWpKenNv?=
 =?utf-8?B?alI1WEY2YU9tTkRJT3VQRlI5UEp1MERRUDRGeFdvSlRYMmZtZGJZaWpkRFVF?=
 =?utf-8?B?NGh6WE9vbE1tRHc0NFZ1cEdsMTRITjIzMzRjUjJHSHUzYUdtRWJLOWtXU3lj?=
 =?utf-8?B?ak5NbHQvREdGV1pnYXdZWWtGSmNKMkhNbDNOOEM2UlI0QzBSMVVJekViNXpp?=
 =?utf-8?B?TER5aUJXUEVsd25uZ1BQWWdRbDdoY0ppSVNjR0taN280OG1JQ1dyWThnSFdl?=
 =?utf-8?B?T1FTbVZrSXYraHZPV01id2Yyd3pZb1BCbWtMRVg0RVYxb1FvaVNlL1JSTE1B?=
 =?utf-8?B?dTZsUzlnd2pVVmU2SS92WTBYN2NVblMxVHYyWTl4NU9tNXVPT1A0VGlIZS9m?=
 =?utf-8?B?MGhBVDRHb29sVGhFUUJrcEk0Z3p6LzhOUllLc1FEWThkMGk0Y3A2MXdsSENJ?=
 =?utf-8?B?RVpqVlh0eERFZ0JlcnB3RTBsOHJ5TUdEejRUL1EyUG5jdWdFWEtoQ3pzODZ4?=
 =?utf-8?B?ZmdmVXJIMm1rdUsrd1A4R0ZhNE1XTXhMZ1dnTmVQckFpQUZIYUNHb25uTjFQ?=
 =?utf-8?B?VGszZWtYanNDNEVMLzk2bnZyOVlMYk9ob2lZZXJBTlJ6SGtCM3RFYzV5eHdT?=
 =?utf-8?Q?VHvpZ9pobt+Ap+L5O871avM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6945a9-94c2-486d-dd53-08d9bee65812
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 09:44:37.8241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8yte7XhN8zrtp0+mo0ut75AI51mhyw543ZsIxPjjXws0/VsnA3edt81mE2XrLQ23SdStGB8T+4hyNrw58JMToQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3082
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
Cc: "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiBT
ZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxNCwgMjAyMSA1OjI0IFBNDQo+IFRvOiBIdWFuZywgUmF5
IDxSYXkuSHVhbmdAYW1kLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+OyBTdW1pdCBTZW13YWwNCj4g
PHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPg0KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgRGV1Y2hlciwNCj4gQWxleGFuZGVy
IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgTGl1LCBNb25rDQo+IDxNb25rLkxpdUBhbWQu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvM10gZG1hLWJ1ZjogbWFrZSB0aGUgZmxhZ3Mg
Y2FuIGJlIGNvbmZpZ3VyZWQgZHVyaW5nDQo+IGRtYSBmZW5jZSBpbml0DQo+IA0KPiBBbSAxNC4x
Mi4yMSB1bSAxMDoxOSBzY2hyaWViIEh1YW5nLCBSYXk6DQo+ID4gW0FNRCBPZmZpY2lhbCBVc2Ug
T25seV0NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBL
b2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiA+PiBTZW50OiBU
dWVzZGF5LCBEZWNlbWJlciAxNCwgMjAyMSA0OjAwIFBNDQo+ID4+IFRvOiBIdWFuZywgUmF5IDxS
YXkuSHVhbmdAYW1kLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+ID4+
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+OyBTdW1pdCBTZW13YWwNCj4g
Pj4gPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPg0KPiA+PiBDYzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsNCj4gPj4gRGV1Y2hlciwg
QWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgTGl1LCBNb25rDQo+ID4+IDxN
b25rLkxpdUBhbWQuY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvM10gZG1hLWJ1Zjog
bWFrZSB0aGUgZmxhZ3MgY2FuIGJlIGNvbmZpZ3VyZWQNCj4gPj4gZHVyaW5nIGRtYSBmZW5jZSBp
bml0DQo+ID4+DQo+ID4+IEFtIDEzLjEyLjIxIHVtIDA3OjM0IHNjaHJpZWIgSHVhbmcgUnVpOg0K
PiA+Pj4gSW4gc29tZSB1c2VyIHNjZW5hcmlvcywgdGhlIGdldF90aW1lbGluZV9uYW1lIGNhbGxi
YWNrIHVzZXMgdGhlDQo+ID4+PiBmbGFncyB0byBkZWNpZGUgd2hpY2ggd2F5IHRvIHJldHVybiB0
aGUgdGltZWxpbmUgc3RyaW5nIG5hbWUuIE9uY2UNCj4gPj4+IHRoZSB0cmFjZV9kbWFfZmVuY2Vf
aW5pdCBldmVudCBpcyBlbmFibGVkLCBpdCB3aWxsIGNhbGwNCj4gPj4+IGdldF90aW1lbGluZV9u
YW1lIGNhbGxiYWNrIHRvIGR1bXAgdGhlIGZlbmNlIHN0cnVjdHVyZS4gSG93ZXZlciwgYXQNCj4g
Pj4+IHRoaXMgbW9tZW50LCB0aGUgZmxhZ3MgYXJlIGFsd2F5cyAwLCBhbmQgaXQgbWlnaHQgdHJp
Z2dlciBzb21lDQo+ID4+PiBpc3N1ZXMgaW4gZ2V0X3RpbWVsaW5lX25hbWUgY2FsbGJhY2sgaW1w
bGVtZW50YXRpb24gb2YgZGlmZmVyZW50IGdwdQ0KPiA+Pj4gZHJpdmVyLiBTbyBtYWtlIGEgbWVt
YmVyIHRvIGluaXRpYWxpemUgdGhlIGZsYWdzIGluIGRtYV9mZW5jZV9pbml0KCkuDQo+ID4+IFdl
bGwgdGhhdCBkb2Vzbid0IG1ha2UgbXVjaCBzZW5zZSB0byBtZS4NCj4gPj4NCj4gPj4gTm9uZSBv
ZiB0aGUgZG1hX2ZlbmNlIGNhbGxiYWNrcyBpcyBjYWxsZWQgZnJvbSB0aGUgZG1hX2ZlbmNlX2lu
aXQNCj4gPj4gZnVuY3Rpb24gKG9yIGF0IGxlYXN0IHNob3VsZG4ndCkuIFNvIGRyaXZlcnMgYWx3
YXlzIGhhdmUgdGhlDQo+ID4+IG9wcG9ydHVuaXR5IHRvIHRvIGFkanVzdCB0aGUgZmxhZ3MuDQo+
ID4+DQo+ID4+IFNvIHBsZWFzZSBleHBsYWluIHRoZSByYXRpb25hbCBhZ2Fpbj8NCj4gPiBPbmNl
IHdlIGVuYWJsZSB0cmFjZV9kbWFfZmVuY2VfaW5pdCBldmVudCwgd2Ugd2lsbCBjYWxsIGdldF9k
cml2ZXJfbmFtZQ0KPiBhbmQgZ2V0X3RpbWVsaW5lX25hbWUgY2FsbGJhY2sgZnVuY3Rpb24gdG8g
ZHVtcCB0aGUgbmFtZXMgaW4NCj4gZG1hX2ZlbmNlX2luaXQoKS4NCj4gPiBBdCB0aGF0IHRpbWUs
IHRoZSBmbGFncyBhcmUgYWx3YXlzIDAuIEhvd2V2ZXIsIGluDQo+IGFtZGdwdV9mZW5jZV9nZXRf
dGltZWxpbmVfbmFtZSgpLCBpdCB3aWxsIGNoZWNrIHRoZSBmbGFncw0KPiAoQU1ER1BVX0ZFTkNF
X0ZMQUdfRU1CRURfSU5fSk9CX0JJVCkgdG8gc2VsZWN0IHdoaWNoIHdheSB0byBnZXQNCj4gdGhl
IHJpbmcuDQo+ID4gSWYgdGhlIGZlbmNlIHNob3VsZCBiZSBhY3R1YWxseSBlbWJlZGRlZCBpbiB0
aGUgam9iICh3aWxsIGJlIHNldCBhZnRlciB0aGF0KSwNCj4gaXQgc3RpbGwgd2lsbCB0cmlnZ2Vy
IGEga2VybmVsIHBhbmljIChwbGVhc2Ugc2VlIHBhdGNoMikgYmVjYXVzZSBpdCBnbyB3aXRoIGEN
Cj4gd3Jvbmcgd2F5LiBCZWNhdXNlIHdlIGNhbm5vdCBzZXQgdGhlIGZsYWdzIGF0IHRoZSBzdGFy
dCBvZiBkbWFfZmVuY2VfaW5pdC4NCj4gVGhhdCBpcyB0aGUgcHJvYmxlbS4NCj4gDQo+IFdlbGwg
dGhlbiBJIHRoaW5rIHdlIHNob3VsZCBmaXggdGhlIHdob2xlIGFwcHJvYWNoIGluc3RlYWQgYmVj
YXVzZSB3aGF0DQo+IHlvdSB0cnkgdG8gZG8gaGVyZSBpcyB1dHRlcmx5IG5vbnNlbnNlLiBZb3Ug
Y2FuJ3QgbW9kaWZ5IHRoZSBvcHMgc3RydWN0dXJlIG9uDQo+IHRoZSBmbHkgYmVjYXVzZSB0aGF0
IGlzIHVzZWQgYnkgYWxsIHRoZSBmZW5jZXMuDQo+IA0KPiBJbnN0ZWFkIHBsZWFzZSBqdXN0IGR1
cGxpY2F0ZSB0aGUgYW1kZ3B1X2ZlbmNlX29wcygpIGFuZCBzZXBhcmF0ZSB0aGVtDQo+IGludG8g
dHdvIHN0cnVjdHVyZSwgb25lIGZvciBlYWNoIGNhc2UuDQo+IA0KPiBUaGlzIHdheSB3ZSBzaG91
bGQgYWxzbyBiZSBhYmxlIHRvIGNvbXBsZXRlbHkgZHJvcCB0aGUNCj4gQU1ER1BVX0ZFTkNFX0ZM
QUdfRU1CRURfSU5fSk9CX0JJVCBmbGFnLg0KPiANCg0KT0ssIHlvdSBtZWFuIHRoaXMgZmxhZyBp
cyBub3Qgb25lIG9mIHRoZW0gaW4gc3RhbmRhcmQgZG1hX2ZlbmNlX2ZsYWdfYml0cyBhbmQgaXQg
QU1EIHNwZWNpZmljLCBzbyB3ZSB3b3VsZCBiZXR0ZXIgdG8gZHJvcCB0aGlzIHRvIGFsaWduIHRo
ZSBkYW1fZmVuY2Ugc3RydWN0dXJlIGRlc2lnbj8NCg0KVGhhbmtzLA0KUmF5DQoNCj4gUmVnYXJk
cywNCj4gQ2hyaXN0aWFuLg0KPiANCj4gPg0KPiA+IFRoYW5rcywNCj4gPiBSYXkNCj4gPg0KPiA+
PiBDaHJpc3RpYW4uDQo+ID4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5o
dWFuZ0BhbWQuY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiAgICBkcml2ZXJzL2RtYS1idWYvZG1hLWZl
bmNlLmMgfCAyICstDQo+ID4+PiAgICBpbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oICAgfCA3ICsr
KysrKysNCj4gPj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVu
Y2UuYw0KPiA+Pj4gYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgaW5kZXggMDY2NDAwZWQ4
ODQxLi4zZTA2MjJiZjM4NWYNCj4gPj4+IDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9kbWEt
YnVmL2RtYS1mZW5jZS5jDQo+ID4+PiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMN
Cj4gPj4+IEBAIC05NTIsNyArOTUyLDcgQEAgZG1hX2ZlbmNlX2luaXQoc3RydWN0IGRtYV9mZW5j
ZSAqZmVuY2UsIGNvbnN0DQo+ID4+IHN0cnVjdCBkbWFfZmVuY2Vfb3BzICpvcHMsDQo+ID4+PiAg
ICAJZmVuY2UtPmxvY2sgPSBsb2NrOw0KPiA+Pj4gICAgCWZlbmNlLT5jb250ZXh0ID0gY29udGV4
dDsNCj4gPj4+ICAgIAlmZW5jZS0+c2Vxbm8gPSBzZXFubzsNCj4gPj4+IC0JZmVuY2UtPmZsYWdz
ID0gMFVMOw0KPiA+Pj4gKwlmZW5jZS0+ZmxhZ3MgPSBvcHMtPmluaXRfZmxhZ3M7DQo+ID4+PiAg
ICAJZmVuY2UtPmVycm9yID0gMDsNCj4gPj4+DQo+ID4+PiAgICAJdHJhY2VfZG1hX2ZlbmNlX2lu
aXQoZmVuY2UpOw0KPiA+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLmgg
Yi9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oDQo+ID4+PiBpbmRleCAxZWE2OTE3NTNiZDMuLmY5
MjcwYzViYzA3YSAxMDA2NDQNCj4gPj4+IC0tLSBhL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLmgN
Cj4gPj4+ICsrKyBiL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLmgNCj4gPj4+IEBAIC0xMzEsNiAr
MTMxLDEzIEBAIHN0cnVjdCBkbWFfZmVuY2Vfb3BzIHsNCj4gPj4+ICAgIAkgKi8NCj4gPj4+ICAg
IAlib29sIHVzZV82NGJpdF9zZXFubzsNCj4gPj4+DQo+ID4+PiArCS8qKg0KPiA+Pj4gKwkgKiBA
aW5pdF9mbGFnczoNCj4gPj4+ICsJICoNCj4gPj4+ICsJICogVGhlIGluaXRpYWwgdmFsdWUgb2Yg
ZmVuY2UgZmxhZ3MgKEEgbWFzayBvZiBETUFfRkVOQ0VfRkxBR18qDQo+ID4+IGRlZmluZWQpLg0K
PiA+Pj4gKwkgKi8NCj4gPj4+ICsJdW5zaWduZWQgbG9uZyBpbml0X2ZsYWdzOw0KPiA+Pj4gKw0K
PiA+Pj4gICAgCS8qKg0KPiA+Pj4gICAgCSAqIEBnZXRfZHJpdmVyX25hbWU6DQo+ID4+PiAgICAJ
ICoNCg==

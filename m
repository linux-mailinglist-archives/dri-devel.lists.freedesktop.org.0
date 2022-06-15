Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF6C54C0D8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 06:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF4E10F66A;
	Wed, 15 Jun 2022 04:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2077.outbound.protection.outlook.com [40.107.95.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DB410F079;
 Wed, 15 Jun 2022 04:43:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8e/rgveuMSNoDy1FEzAdUnr7BHa5TphLaY5lL1GvrZ4cwbmeNiXg7wZLUIO3U48Hg13m+YIGFscxyu78pwUyFFd/7AqZzp05J8G666QyXmiQy5pRk8EEASTCuh2FMgrTgrM1gA7UB3SPRWvn90merb+OO7VgECxF8+V7BxH58zFcsRk3L38xxqvX1yFdVFWlZauo8s6bnuqxaFh6uGpev1h7d0iytROU+9uoyUpktpP+sWM9MgyTEvlpazSKiGR6WXqcQZJGcrEE8ecByWd2g0GdbX8SoBv4w5w+H2w/xovazP2ChPz1/1H+MEHA3c8HKAeqWb6yOM7iakVMGlsug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAtYWHsjExgxz18+Yz45WwvfUnJt9pOtdIBATJq/zgc=;
 b=Ix7NKZo7QELLSUF6KObLGiVW8nlVQqp0KrfhjzPD9CjzxnJEvQ2dprQ1E2F8XI+xk+P890t1BwOCcmFMA6CSJJNnSEMQHBZnH3stxJTx4xkKZ37N+2ZEawdrlRLsiVN7XhzwXZvcp02HK1DWZiybL0dqaQ85owPsDg1hsNJqims84lTwEg6ORDTelPen2MMHSnO0obwiQF34FxFB5D5yWVpsOb6w6W82NRYOL4hoQO89iqk1Ls8KVc7c8VjSccytIFPe7aPZ5/XSZ9cky5yHONaV0TE8oI3ndFFg3nh9qmmb6fdzE0JYdDxjwNoY85sj1maNGK97uCwSdxMKdl+D7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAtYWHsjExgxz18+Yz45WwvfUnJt9pOtdIBATJq/zgc=;
 b=gOMOjWKr8KmaCPRka9fZOOh12mltUOM3xQpLy94UN2gyi/SURPO04fzvLh7r7FMUxECxB+OmeG8QYqX4pKWFAYzKXp5FbmbN2kCEr3+Xq0dHDxPCyF/+0KukuPyRsH/dRKtw1ymyp7Mw+kmHAzKN+9mr9roT0ZVKbD0aJ/UJo4M=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by BY5PR12MB3889.namprd12.prod.outlook.com (2603:10b6:a03:1ad::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Wed, 15 Jun
 2022 04:43:36 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::68dc:88ad:eb33:1813]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::68dc:88ad:eb33:1813%7]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 04:43:36 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [RESEND RFC 06/18] drm/display/dp_mst: Add some missing kdocs for
 atomic MST structs
Thread-Topic: [RESEND RFC 06/18] drm/display/dp_mst: Add some missing kdocs
 for atomic MST structs
Thread-Index: AQHYeqWlZ05AFBuhLEu+h9vIg83+Y61P62gA
Date: Wed, 15 Jun 2022 04:43:36 +0000
Message-ID: <CO6PR12MB548907FE2E64F8D8CC5D5227FCAD9@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20220607192933.1333228-1-lyude@redhat.com>
 <20220607192933.1333228-7-lyude@redhat.com>
In-Reply-To: <20220607192933.1333228-7-lyude@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-06-15T04:43:33Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=7b67daca-b1eb-45b7-813a-88c7a8ec4e7c;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29d22bb6-21e4-491b-c29e-08da4e899c3c
x-ms-traffictypediagnostic: BY5PR12MB3889:EE_
x-microsoft-antispam-prvs: <BY5PR12MB3889C5AAD9C03A66CDD56960FCAD9@BY5PR12MB3889.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uTSZ59zEFh+7UNc0elDzwYai02GUhWhOStUTkX2lbdFmv20TMEla4eMq7GBtwW+MDv4ycaqPwdpbSJJ4gN1Y2GwTHztS8f9Y1eEXtjSSv4B9C49Oy6jc146ehOL6ZY1i3bL6H6dB1UFJMO63SZckQW1kURxlpsRoyro0FzFjVRhlM1ZKIrzIc7lBoACPgg+/SVNMf/eK1w1jLzidrAh9ghlhbRMPmMjvjMkt4Sy1ZHoAg8tl0xN9QhR+uvYe3zxHA0C3OxoWqDlTYCuKhgyRYBw22zmL6dX3h9MiDrV+08Qw0Idh4qvWQMh9T1FNz8OnbmA312KzsZM2WtFYufHP6F7gbEbnbjGHMVKSyAxfriBXVPMaWUCor+U5ZzR7v8a+QG2stLQSnjYHYPD9z4HbxbFa3vlhjHFxv08aRpTIWLSIdteaQQ13QIsT+wHMNpwVmYS/BDXeGJGzWzAo9TaA3t7vscwOZLa/gQmtqgiplu8X73SjKLIYjM8PoIVfzvDwR2YTOyd+ZoJ5Cwrd+31uWmCXT9wlbtC4KNG6Dwtoi4zcVQ9rrIcW53d6db8u7pukRMOstvPc7K3vozZOHzjV845b0So8XjgrDdz3P3o0+SmQYtzAnNPYIACz3DG72l48tO1J5dAvZK6w/xbJJh+vEyeasBLJpi/VDRdV09DzU3BJPrT+pnlMs0Ov5ivIyG0t+U7RG+7PVrJuY3E95fuktg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(66556008)(66446008)(508600001)(64756008)(86362001)(76116006)(110136005)(66476007)(4326008)(8676002)(122000001)(38070700005)(83380400001)(54906003)(71200400001)(316002)(66946007)(186003)(33656002)(53546011)(7416002)(9686003)(26005)(7696005)(6506007)(38100700002)(52536014)(8936002)(55016003)(2906002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejIxWVJ1RGZCL25kVEp6ZkxnZmw5RWNDeEk1d2Y3anBkRm04b01Hc2NWUXJ4?=
 =?utf-8?B?MjA0cWZxQ3c1Q2VKak52UWVWWXovaEFlV25NdjlZaFozcndtZkxDN2NMSkk2?=
 =?utf-8?B?NklERE0vbEMzN05KS2tFbXlNREZsU2JnTjltcVNlY2xXOUliU0gxL3BWNlhi?=
 =?utf-8?B?NVBXOEI2MTJRcE9KS2gzQ3IySmkzb01YWUhkNXRJcklrdGlLQnVhcGNrMFBy?=
 =?utf-8?B?SDd0NnJFSk01LzlWcEVmNFlLcDF6U0d0RlJRUGlwR211djVNYy9lR0xRdjVD?=
 =?utf-8?B?Q3plTFhGN09CMVc0V3FOYnVIWTR0U1lrNzIyRkpZa0pEcWYraitpQ3NVSDN3?=
 =?utf-8?B?bHNRSWNhTXhBVDJsMTY1T2JOWEFaQllFUTFnQjF4d0xtZVd3Nmp4VnRudGR3?=
 =?utf-8?B?WWRabVgzdkpaNGwwT0pwQzZzN3cvVHlFdnhZZ0FUMHcrRUhCSTF1eEJZNE01?=
 =?utf-8?B?OEdHZFAydW1sVnJxYU5Ka1BqVUtPQzRxcVQ4Rm9VeTNLeE9QYWxYd2pFUVg5?=
 =?utf-8?B?a2lJNitvYWFtSG1SVUxoVWpoNHJYcS8zSHlMT3F2Sk5mTVNtOVlBUkxpZWl0?=
 =?utf-8?B?TCtZVWRVdTFLandFQXRtVWozOUlyak15c1NPY3kxUENaMkgvRUcrOGFrS1FO?=
 =?utf-8?B?R2d2WTBOeVVDSXAyUWJldTFVMjB0cm5BVVRpQkVLeUNWMVpKZG5oSm1pa2N1?=
 =?utf-8?B?TXQvTjEvRVJ0V3NFaGJNNDM1ZEhCL0RqYy94WTYvRGE2ZGVpNzAyV2hBZXow?=
 =?utf-8?B?eUtjb1lsQ2RyM1ZHQ3E1VSswSWZobTgzL05qd0Z0eTZJSjAxOXEyS3VsVm4z?=
 =?utf-8?B?VmhCcis0ODlJWnZObUpuWnRpR0RiTFN4ZGVXV2VPS0lmeFBIdWNYSTRIOGpW?=
 =?utf-8?B?SFFRSEZkZzVMRE9JUjZiUjA0Z1hHaU50V2dMeDZkOFc1Z3hYUW1RV1BpRjE3?=
 =?utf-8?B?VzBOZGkvRVM0UTkvQTlKVE1EV0xwTW5yWDBCM2JPY0RRRjV4SXF5a0g3a2Vx?=
 =?utf-8?B?L0tveEpCbTZOcTZCQk10MHFPdm9OSk91Q1FhSUp5bnZuQ1BWcVNVRzNXdlJX?=
 =?utf-8?B?ZXFCeUVTdDJMN0pSMnprU0VwZW5ZYnhoQjUya3VzT09EV0ZMRkFHTGVQU1hP?=
 =?utf-8?B?eVBIR2VGc2c0Vi9uTllueW1LZjA0MisvZkdqeDVpa1pUQ2NPT3JtZHovOHVv?=
 =?utf-8?B?QjlWMGNsUEJFNERHYnorQTE1WXB1bG92MmhWeGs1L21WQml5a2lGUHhuYS9B?=
 =?utf-8?B?VnNwbElOREdhZ2FkWnc0R3ZRN1hNUldBUHZ0dmZ2bUhZY2RxUjVubExyNHZS?=
 =?utf-8?B?ZVRJVUUza1dyVEJTRk1QRU1zS242QitOMWpXS1UxYXAyMnpBVk5TRkJwZG5M?=
 =?utf-8?B?Znp3OUVhTzhGWjJrT1NNWUFYU2k0VkN2ZHFVK3ZSQ1ZEWnNXS1ZFMWp6T25y?=
 =?utf-8?B?aUJIUS91MERydjNqTk1qSy9LbUZaMVpvblZveVFsQlREYnc0a3FhUnZQV3dY?=
 =?utf-8?B?M3BGMlJyWUlROXFKM2hmQkJPVklMWXJuVm96MHJCTWxPdE80RjVDNHdMbGhh?=
 =?utf-8?B?bXF1YSs3TERzWDRsdXVaL1JPMktCNG51aGd1UUpJN3VKTEw2WWU1bHlqa2hk?=
 =?utf-8?B?ckMwa0orUkdKYlR2YmFaRVVkamJ3V0J3NkFJWWRDZ25hdEl4T2pCSzZ3N0Ru?=
 =?utf-8?B?WVRqRlFhRUhwQXJSTlpYMnhpU29PUjcvNWhXem05cUI4Tkd1QWVudTBWOXpk?=
 =?utf-8?B?anFTSzBRdmdudyt0UDJSdHR2NEZVQm5xQUw0cFRXZzluNWJnOWY5cmNBZTlY?=
 =?utf-8?B?MnRVM1NDQi9uN0l5VEMxcncxdVRwUVAvSytKRkNaMUhKTWU2Zm1YYkJpOWk3?=
 =?utf-8?B?RDUrMzFzWTk3UmZ6ZFRldTV3cmpnOE5LNUZWQnZzNzF5Q2liY2w5TkdXVkZM?=
 =?utf-8?B?amxTZXZqWVIzUnluRGxTRDNzandsMGdobXV3VHpQNldTL2lqWkpBYzdGWHE1?=
 =?utf-8?B?cmFYWXdMT3k0d2xGMlgzZkNrUERGeWIySkEwUUpNd0k4V0plS0dhYmlZaHls?=
 =?utf-8?B?ZThLeWk2OTFEY2pNalRPaWdRRnVRZTB0RFo2SEozQVBkWjU4ZmdMeTRYR3dX?=
 =?utf-8?B?d3lGQm4ycEJGSjlQTkdZcjJuS1Z4MEJjMmpQVVdLMjAxWHN2RDNtQTE1TGtQ?=
 =?utf-8?B?cUREVFhVQXMvZnZIbE8xYnBDY1lhMSt1Vm1XL2VrSGx4N1lMMXZyLzlmVnZZ?=
 =?utf-8?B?YVFXelJhS3NmcThjd1RBRlNmTmdITVl4QnlTZVRVWEJ5WlJHVG9ZRTc3V2JI?=
 =?utf-8?Q?6nK7UDJ6OWxHuLo1VM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d22bb6-21e4-491b-c29e-08da4e899c3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 04:43:36.4747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1WH15bG3mW63BijYMgQhhtwebt5ln+gvYC3Ke7GyhJX0AumSisANPaiVMvWXzALnVx6eQQAiAPL2knSwNcQXSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3889
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>,
 "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTHl1
ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDgsIDIw
MjIgMzoyOSBBTQ0KPiBUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGFtZC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiBDYzogTGluLCBXYXluZSA8V2F5bmUuTGluQGFtZC5jb20+OyBWaWxsZSBTeXJqw6Rsw6QN
Cj4gPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPjsgWnVvLCBKZXJyeSA8SmVycnkuWnVv
QGFtZC5jb20+OyBKYW5pIE5pa3VsYQ0KPiA8amFuaS5uaWt1bGFAaW50ZWwuY29tPjsgSW1yZSBE
ZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPjsgRGFuaWVsIFZldHRlcg0KPiA8ZGFuaWVsLnZldHRl
ckBmZndsbC5jaD47IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPjsgRGF2aWQgQWlybGllDQo+
IDxhaXJsaWVkQGxpbnV4LmllPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgVGhv
bWFzIFppbW1lcm1hbm4NCj4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBEZXVjaGVyLCBBbGV4YW5k
ZXINCj4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBMYWtoYSwgQmhhd2FucHJlZXQNCj4g
PEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+OyBvcGVuIGxpc3QgPGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6IFtSRVNFTkQgUkZDIDA2LzE4XSBkcm0vZGlzcGxheS9k
cF9tc3Q6IEFkZCBzb21lIG1pc3Npbmcga2RvY3MNCj4gZm9yIGF0b21pYyBNU1Qgc3RydWN0cw0K
PiANCj4gU2luY2Ugd2UncmUgYWJvdXQgdG8gc3RhcnQgYWRkaW5nIHNvbWUgc3R1ZmYgaGVyZSwg
d2UgbWF5IGFzIHdlbGwgZmlsbCBpbiBhbnkNCj4gbWlzc2luZyBkb2N1bWVudGF0aW9uIHRoYXQg
d2UgZm9yZ290IHRvIHdyaXRlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1
ZGVAcmVkaGF0LmNvbT4NCj4gQ2M6IFdheW5lIExpbiA8V2F5bmUuTGluQGFtZC5jb20+DQo+IENj
OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBDYzog
RmFuZ3poaSBadW8gPEplcnJ5Llp1b0BhbWQuY29tPg0KPiBDYzogSmFuaSBOaWt1bGEgPGphbmku
bmlrdWxhQGludGVsLmNvbT4NCj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4N
Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+IENjOiBTZWFu
IFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4NCj4gLS0tDQo+ICBpbmNsdWRlL2RybS9kaXNwbGF5L2Ry
bV9kcF9tc3RfaGVscGVyLmggfCAyNA0KPiArKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vZGlzcGxheS9kcm1fZHBfbXN0X2hlbHBlci5oDQo+IGIvaW5jbHVkZS9kcm0vZGlzcGxh
eS9kcm1fZHBfbXN0X2hlbHBlci5oDQo+IGluZGV4IDhhYjRmMTRmMjM0NC4uZWIwZWE1NzhiMjI3
IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcF9tc3RfaGVscGVyLmgN
Cj4gKysrIGIvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHBfbXN0X2hlbHBlci5oDQo+IEBAIC01
NDIsMTkgKzU0Miw0MyBAQCBzdHJ1Y3QgZHJtX2RwX3BheWxvYWQgew0KPiANCj4gICNkZWZpbmUg
dG9fZHBfbXN0X3RvcG9sb2d5X3N0YXRlKHgpIGNvbnRhaW5lcl9vZih4LCBzdHJ1Y3QNCj4gZHJt
X2RwX21zdF90b3BvbG9neV9zdGF0ZSwgYmFzZSkNCj4gDQo+ICsvKioNCj4gKyAqIHN0cnVjdCBk
cm1fZHBfbXN0X2F0b21pY19wYXlsb2FkIC0gQXRvbWljIHN0YXRlIHN0cnVjdCBmb3IgYW4gTVNU
DQo+ICtwYXlsb2FkDQo+ICsgKg0KPiArICogVGhlIHByaW1hcnkgYXRvbWljIHN0YXRlIHN0cnVj
dHVyZSBmb3IgYSBnaXZlbiBNU1QgcGF5bG9hZC4gU3RvcmVzDQo+ICtpbmZvcm1hdGlvbiBsaWtl
IGN1cnJlbnQNCj4gKyAqIGJhbmR3aWR0aCBhbGxvY2F0aW9uLCBpbnRlbmRlZCBhY3Rpb24gZm9y
IHRoaXMgcGF5bG9hZCwgZXRjLg0KPiArICovDQo+ICBzdHJ1Y3QgZHJtX2RwX21zdF9hdG9taWNf
cGF5bG9hZCB7DQo+ICsJLyoqIEBwb3J0OiBUaGUgTVNUIHBvcnQgYXNzaWduZWQgdG8gdGhpcyBw
YXlsb2FkICovDQo+ICAJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydDsNCj4gKwkvKiogQHRp
bWVfc2xvdHM6IFRoZSBudW1iZXIgb2YgdGltZXNsb3RzIGFsbG9jYXRlZCB0byB0aGlzIHBheWxv
YWQNCg0KSGkgTHl1ZGUsDQpXb3VsZCBsaWtlIHRvIGFsc28gaW5kaWNhdGUgdGhhdCB0aGUgdGlt
ZXNsb3RzIGlzIGFsbG9jYXRlZCBmcm9tIHNvdXJjZSBEUCBUeA0KdG8gaW1tZWRpYXRlIGRvd25z
dHJlYW0gRFAgUnguDQoNCj4gKi8NCj4gIAlpbnQgdGltZV9zbG90czsNCj4gKwkvKiogQHBibjog
VGhlIHBheWxvYWQgYmFuZHdpZHRoIGZvciB0aGlzIHBheWxvYWQgKi8NCj4gIAlpbnQgcGJuOw0K
PiArCS8qKiBAZHNjX2VuYWJsZWQ6IFdoZXRoZXIgb3Igbm90IHRoaXMgcGF5bG9hZCBoYXMgRFND
IGVuYWJsZWQgKi8NCj4gIAlib29sIGRzY19lbmFibGVkOw0KPiArDQo+ICsJLyoqIEBuZXh0OiBU
aGUgbGlzdCBub2RlIGZvciB0aGlzIHBheWxvYWQgKi8NCj4gIAlzdHJ1Y3QgbGlzdF9oZWFkIG5l
eHQ7DQo+ICB9Ow0KPiANCj4gKy8qKg0KPiArICogc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lf
c3RhdGUgLSBEaXNwbGF5UG9ydCBNU1QgdG9wb2xvZ3kgYXRvbWljDQo+ICtzdGF0ZQ0KPiArICoN
Cj4gKyAqIFRoaXMgc3RydWN0IHJlcHJlc2VudHMgdGhlIGF0b21pYyBzdGF0ZSBvZiB0aGUgdG9w
bGV2ZWwgRGlzcGxheVBvcnQNCj4gK01TVCBtYW5hZ2VyICAqLw0KPiAgc3RydWN0IGRybV9kcF9t
c3RfdG9wb2xvZ3lfc3RhdGUgew0KPiArCS8qKiBAYmFzZTogQmFzZSBwcml2YXRlIHN0YXRlIGZv
ciBhdG9taWMgKi8NCj4gIAlzdHJ1Y3QgZHJtX3ByaXZhdGVfc3RhdGUgYmFzZTsNCj4gKw0KPiAr
CS8qKiBAcGF5bG9hZHM6IFRoZSBsaXN0IG9mIHBheWxvYWRzIGJlaW5nIGNyZWF0ZWQvZGVzdHJv
eWVkIGluIHRoaXMNCj4gK3N0YXRlICovDQo+ICAJc3RydWN0IGxpc3RfaGVhZCBwYXlsb2FkczsN
Cj4gKwkvKiogQG1ncjogVGhlIHRvcG9sb2d5IG1hbmFnZXIgKi8NCj4gIAlzdHJ1Y3QgZHJtX2Rw
X21zdF90b3BvbG9neV9tZ3IgKm1ncjsNCj4gKw0KPiArCS8qKiBAdG90YWxfYXZhaWxfc2xvdHM6
IFRoZSB0b3RhbCBudW1iZXIgb2Ygc2xvdHMgdGhpcyB0b3BvbG9neSBjYW4NCj4gK2hhbmRsZSAo
NjMgb3IgNjQpICovDQo+ICAJdTggdG90YWxfYXZhaWxfc2xvdHM7DQoNCkkgd291bGQgcHJlZmVy
IG5vdCB1c2luZyB0aGUgdGVybSAiYXZhaWxhYmxlIiB3aGljaCBpcyBhIGJpdCBjb25mbGljdGlu
ZyB3aXRoDQp0aGUgaWRlYSBpbiB0aGUgcmVwbHkgb2YgRU5VTV9QQVRIX1JFU09VUkNFUyAtIGZ1
bGwgUEJOICYgYXZhaWxhYmxlIFBCTi4NCk1heWJlIGJldHRlciB0byBjaGFuZ2UgdG8gdXNlICJm
dWxsX3Nsb3RzIj8NCg0KTm90IHlldCBmaW5pc2ggYWxsIHRoZSBwYXRjaGVzLiBXaWxsIHRyeSB0
byBnbyB0aHJvdWdoIGFsbCB0aGUgcGF0Y2hlcyByZWNlbnRseSA6ICkNCg0KPiArCS8qKiBAc3Rh
cnRfc2xvdDogVGhlIGZpcnN0IHVzYWJsZSB0aW1lIHNsb3QgaW4gdGhpcyB0b3BvbG9neSAoMSBv
ciAwKQ0KPiArKi8NCj4gIAl1OCBzdGFydF9zbG90Ow0KPiAgfTsNCj4gDQo+IC0tDQo+IDIuMzUu
Mw0KDQotLQ0KUmVnYXJkcywNCldheW5lIExpbg0K

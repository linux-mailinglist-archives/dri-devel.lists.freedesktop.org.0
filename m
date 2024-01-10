Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E30829661
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 10:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CCE89811;
	Wed, 10 Jan 2024 09:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E9010E754;
 Wed, 10 Jan 2024 09:41:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Slc9NDuZZMCdq9Vtw1xvWYZRr2fEOHbrEm2cz6cpP1WXD/4vcUMixhoiPcEw5ZTTmcaKzOSQH7C3redzus5wxf9NR8iRzDE8jzfas+gArIKbScr4uXgDUomhTnWI6vHzBO8EsNO3PG0AefRihlYy3adwas2BX17LxURy1FI406/HrIkYALRV2dA4fW8p3KHRkRa43FP7lUlsxn2p9VW4T2xlDmo/Iedf+Q3Rzl84/mJE09PSmn2hFQVsLrMEgi8q+964WytqiQeRrS7t/OmAcJ4Dk5YN5cefssiv4L5fiwP1JSUqVFO4DkqrTDr5Q6E0JBnLyZxdr7Y18FTV/u6h/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9AISwOA2FCWlsY3oj6A1VNUOazNHpsPsVmCAFvh0sY=;
 b=Ul9yj8YZS2xTHXzLrHwMbtpU2QEw9G/C2DlzyK1HJi5U8Vp1pDQR743ykvhtGMORGXtWM08paML6vzNt/hJQL0gIhqtGsdHc44hjnZmW9NkpDgT0oBpm8Lgd7XGSirxjL1+luCh5FPEtk4vohM2CFnTAu0gXv5JR+b2pO2j28mcd+Of0pytGkqRa//t/vslSaeMnQJ1L9ywHGUok99eNuRk4ew20xO/mzkF+dfSwcWJdCEoyXabXmNoUQxpX3z3yXd6zGJ2s+VKcxj38V1bDNX1LHfJFjhKXK+fPjB+MH8OjsCqom7Zz7hCjPjclnF2wNnUUwKuGjoNpfHvDosmJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9AISwOA2FCWlsY3oj6A1VNUOazNHpsPsVmCAFvh0sY=;
 b=X0kR892TSgiJXDvvbWRiMl5HOPoYZYEBC4wlBcUGhakYJ++afrsVILT6DsTdyjF1/rTbztExV/t+e/RfY13PCRD9vNwExz5/8fD/w2g2AqZv373LtVImrFb9glAXCBt4taVXJ5gJT774bM1SVGJnWToVSvNs0YT8TlIH3lggAnY=
Received: from IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12)
 by DM4PR12MB7718.namprd12.prod.outlook.com (2603:10b6:8:102::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 09:40:55 +0000
Received: from IA1PR12MB6532.namprd12.prod.outlook.com
 ([fe80::660a:3ae2:f8e:a372]) by IA1PR12MB6532.namprd12.prod.outlook.com
 ([fe80::660a:3ae2:f8e:a372%7]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 09:40:53 +0000
From: "Zhang, Julia" <Julia.Zhang@amd.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>, "Zhang, Julia"
 <Julia.Zhang@amd.com>
Subject: Re: [PATCH v2 0/1] Implementation of resource_query_layout
Thread-Topic: [PATCH v2 0/1] Implementation of resource_query_layout
Thread-Index: AQHaOGQzWQVLcFat0EGw/ib7OOa7O7DTZzeA
Date: Wed, 10 Jan 2024 09:40:53 +0000
Message-ID: <IA1PR12MB6532F4DDB5BA825922A85E70F2692@IA1PR12MB6532.namprd12.prod.outlook.com>
References: <20231221100016.4022353-1-julia.zhang@amd.com>
 <CAAfnVBm+oo=dnDuqp1hYVj+OrQHHp5NPUHh2oxmEVjNrsDDUTQ@mail.gmail.com>
In-Reply-To: <CAAfnVBm+oo=dnDuqp1hYVj+OrQHHp5NPUHh2oxmEVjNrsDDUTQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: BL1PR12MB5350.namprd12.prod.outlook.com
 (15.20.7181.004)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6532:EE_|DM4PR12MB7718:EE_
x-ms-office365-filtering-correlation-id: f720e060-5f15-48f9-c09d-08dc11c03d44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dPwU+2uZ89jpWqLsnIB/Kp6EeqzYyZUvrWNu39OjyjdvjVpmy/cgCRNVmP2bsbw7WB+JEJ4oTdkv3tUTVgMuEnJ4p0UflX9cfDI35Sa6NNsv0PNnI+Y0NFjL6jbYNNG96n2TZSex55xAdGuf7IaBNSPO5pAUPu+8dP7ia1pRiD+91chOGJzLqbW6KtK8k/UZaT469DBfy3yO+MNb5FQgd8TKig/7I1MwP8B+g6FyGSrkOgWvNxlTJtM8Oi9Mq1TcR843zEV/jJYR8Ahcvt9CuIIW1dagcm/2UowXmj1OIwY0as81v/+IjJiJML2gm3s19nkvx7BYlOjeykXdW+6AyEViEhBDklwkD2/Q5cFhWX6vsPYNdGb46ToHeFPAket7dsPaKePOmAJheBFe9mxb8kRKud3TOPftGmwe4PSDNxRj9GuPunhfkP0fhFHuaEgueNl0zFtCstfI3OuPto4fe+huBPU4/qrUNtE7V+zIYmPQf7l5F3a5K1f90LSOpcS1OFhfIuytlGZLXSIEwqLhecHzgLBjyvjKiRse4Jtl+bu1nBEZNQ5V/oUi+tN+MBHKfb4ww+2kMorz5vi+9fGapCpp1tthhTWFvFMY8YX7mr0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6532.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(26005)(9686003)(6506007)(53546011)(7696005)(122000001)(5660300002)(71200400001)(7416002)(4326008)(52536014)(41300700001)(2906002)(478600001)(54906003)(316002)(66556008)(64756008)(8676002)(110136005)(66476007)(6636002)(8936002)(76116006)(66446008)(66946007)(966005)(33656002)(38100700002)(38070700009)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFU4Q1dMcXd1VXlRemF5Ui80UmMyV0JmYys5MjlSZkJ5UXZGOTEzWHozK2Ry?=
 =?utf-8?B?eVFsUFArd1ZJNkFWQWswMVF1NnliOWd0ZzBDTytZQlZtdEhpaFg0aFhhMXJR?=
 =?utf-8?B?Uk5SOXp0bTU0THpjcVBNdGdmRExVSWtUcTlmNTNtREgwTXhDeGk4c09palpw?=
 =?utf-8?B?dlZxRjZiaUprV1pRMWhaaGtTbEdYUnRvMWVsb016bGREdThHWDhzR2dydVd3?=
 =?utf-8?B?UVBlblZKV2h1UWxodGFwM0d0T1Jma0l6TGZ0QmNMTEV4bGRoc0hqOXY4N1Ir?=
 =?utf-8?B?V0xjeHRtZmJQWDBnTkV1T0Jhb0o5Zys3Y1cwMm94dzBUQWpaRFBLbGY3d2s5?=
 =?utf-8?B?RnlyMTNLc2pWdzE0UWpQcXBvZ3lxcjhWMGJXak9lV0VzNjBiZmhLWTFvZ1J6?=
 =?utf-8?B?Mk1xVjF4ZEZuWjZjeDRvN05zZW9SZm81Nyt3UGZJcVAzNVZyUUFSd1lGYVhh?=
 =?utf-8?B?VzJsUStHWWFXbE5RYUpJaHhtOEJON1hqc0tuOVc1NGFMVi9QWnRiWjVpdDZm?=
 =?utf-8?B?V1l0eUZsYmxSYTlRelgzN1hURGlVK0orNnM5UkRDWHNxVVJtcmJzczJUekFC?=
 =?utf-8?B?QzNXWmtYOTdQQVFqdnNtdGNWck1tM1ZWZjRQNmNpTitEdUxEaUtRNyt2REVM?=
 =?utf-8?B?Zldqc3k2ampIcjF6a2VJS05wQ2J2OTFKZWVDTHZheW56QTBjL2FDZVVrY0l4?=
 =?utf-8?B?cjJoLzZRNFY4OXdyeFgzM1kzWDJ5UEQ5Y0kzcG55NXZFUTM0Q2s4SE8yVmpC?=
 =?utf-8?B?OXdZMk1qMWFVdGpEN28vY0tKV0NEaXJuaGhlMUZZYVY0UTlGRlIyVE4rMWMv?=
 =?utf-8?B?cVNMdzcxVE5uaFkvWFN4M2QrZytwci8yWmxPSHk5OHdMNEI1Q0hUK3ZFd0s1?=
 =?utf-8?B?UkxNVzZPR2plOGMrWWwwNFJHR0Y3V2FxaURGNE11bnZlc0VFcUR2TmdPZWFY?=
 =?utf-8?B?c1NaVjlIdHZWVFpVSStsRFZJRnVONlZ3RmpIcWswakZXOEJlNFFGRmlsNXFj?=
 =?utf-8?B?eWdUdU5GbjczVGQydWd5cTJwMGV4VGU3U3puZmZ3eVZlMmtxZUJ2NEtaVThZ?=
 =?utf-8?B?N3FQcndVU09tekVXNDE2VkxEbUlYQ3dqRXJya3hnRHZnYlp1UjdaMnMyNkJa?=
 =?utf-8?B?a0VaZWJGTHBJdktFbUVpZHc3YXRxU0JGV1hwTWl4YkxESzNoN3VIV3NDa2hD?=
 =?utf-8?B?Q0tWY09lTC95U0EzRjZoOGZYUkdkd0RJbU1QUkZPS1JCd3FNemFQY1lIVEhk?=
 =?utf-8?B?Z1dsejRmeStHSndOdHhORW1yVlBKZmhsUGdPeStObXo1NlE0eDl3dldZRHZW?=
 =?utf-8?B?WlAraklwZzJFSzJjcmdmcnZGSld4YXVjY2NTMDhTWS9oQ0huVHBWN3Y5OWNx?=
 =?utf-8?B?cU1MSmxKUktHaURyZ2hURGx3U3QrL29Ya2pQT1BHUWhHalpRaHhrMzgzM1dy?=
 =?utf-8?B?akpUMEl4WnVtR1pWSWExN1U4NTM4QjZxVW45Q1BWRzYyQjJVaXVVVExveXNs?=
 =?utf-8?B?YllES29JekkwcVR1UFhtaHZQM3JIdWxwdnFxWWEzQ1YrSm9nekd4UlgrQ0I3?=
 =?utf-8?B?VmxscGhmMDBWVzJlblcrVnpJc0pYNlFKdWdoL3JERkJ3aWN0RXIyR0s3cGYx?=
 =?utf-8?B?bXFVc0ZHMURvQk53MDJBWDRTQmVGb2dSUGZ5N2VGcmZVdkJmRElmay9OR3FZ?=
 =?utf-8?B?TlkwaWsvWVFRRFk2TzVMV1VkenpUdTZZWGViSDZMRFN0VEVHWDhZYjZzZTRp?=
 =?utf-8?B?NFBGWTE5NjlxWllGQXN5U3pKbmM5WEhLdUZieU40aWlKbUJtUVh3YVNjMkdL?=
 =?utf-8?B?dHpQOVd5YXFWUDZwUlB3ZzcrYTRxVCs5VEtCOHZOVm1UN1FwWVZjTDVxYjVa?=
 =?utf-8?B?UlhxY0xKRzE2dDArb2gzQWVuWG02U0pWUExuem9GNXFGaHpjcEtxc2J4Ykd2?=
 =?utf-8?B?eU81anVZZ29MVEFGWDZPekhLaCtjSlkwV2RaK3g5MXJVeUNxWDl5Wm16ZWFh?=
 =?utf-8?B?aXZUb24rM1I3TGRaUG1acCt2RjY4VDl2dXd0NXh0aEJNN0diQWpmNWxMUEpy?=
 =?utf-8?B?YWQ2SGpQeHJlR2YwSFJGcWxrcXdhOHZqQm5kUE8rRlhibUhpb2lHS3IydjVj?=
 =?utf-8?Q?sIss=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79C495E88B4D6C418B6C3059F4130CF9@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6532.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f720e060-5f15-48f9-c09d-08dc11c03d44
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2024 09:40:53.9055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2vjF35eWFr+tC79kQ55aTBqvBBxtgKDBy65MxdXAjY6qjMrQdXop6uUyNz1L8Cr2lP7bXYKIq5PTJVfJTradng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7718
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
Cc: "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Olsak, Marek" <Marek.Olsak@amd.com>, Erik Faye-Lund <kusmabite@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "Huang, Ray" <Ray.Huang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Huang, 
 Honglei1" <Honglei1.Huang@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, David Airlie <airlied@redhat.com>,
 Chia-I Wu <olvaffe@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBzZWUsIEkgd2lsbCBpbXBsZW1lbnQgdGhpcy4gVGhhbmsgeW91IHZlcnkgbXVjaC4NCg0KT24g
MjAyMy8xMi8yNyAwOToyOSwgR3VyY2hldGFuIFNpbmdoIHdyb3RlOg0KPiANCj4gDQo+IE9uIFRo
dSwgRGVjIDIxLCAyMDIzIGF0IDI6MDHigK9BTSBKdWxpYSBaaGFuZyA8anVsaWEuemhhbmdAYW1k
LmNvbSA8bWFpbHRvOmp1bGlhLnpoYW5nQGFtZC5jb20+PiB3cm90ZToNCj4gDQo+ICAgICBIaSBh
bGwsDQo+IA0KPiAgICAgU29ycnkgdG8gbGF0ZSByZXBseS4gVGhpcyBpcyB2MiBvZiB0aGUgaW1w
bGVtZW50YXRpb24gb2YNCj4gICAgIHJlc291cmNlX3F1ZXJ5X2xheW91dC4gVGhpcyBhZGRzIGEg
bmV3IGlvY3RsIHRvIGxldCBndWVzdCBxdWVyeSBpbmZvcm1hdGlvbg0KPiAgICAgb2YgaG9zdCBy
ZXNvdXJjZSwgd2hpY2ggaXMgb3JpZ2luYWxseSBmcm9tIERhbmllbCBTdG9uZS4gV2UgYWRkIHNv
bWUNCj4gICAgIGNoYW5nZXMgdG8gc3VwcG9ydCBxdWVyeSB0aGUgY29ycmVjdCBzdHJpZGUgb2Yg
aG9zdCByZXNvdXJjZSBiZWZvcmUgaXQncw0KPiAgICAgY3JlYXRlZCwgd2hpY2ggaXMgdG8gc3Vw
cG9ydCB0byBibGl0IGRhdGEgZnJvbSBkR1BVIHRvIHZpcnRpbyBpR1BVIGZvciBkR1BVDQo+ICAg
ICBwcmltZSBmZWF0dXJlLg0KPiANCj4gICAgIENoYW5nZXMgZnJvbSB2MSB0byB2MjoNCj4gICAg
IC1TcXVhc2ggdHdvIHBhdGNoZXMgdG8gYSBzaW5nbGUgcGF0Y2guDQo+ICAgICAtQSBzbWFsbCBt
b2RpZmljYXRpb24gb2YgVklSVElPX0dQVV9GX1JFU09VUkNFX1FVRVJZX0xBWU9VVA0KPiANCj4g
DQo+ICAgICBCZWxvdyBpcyBkZXNjcmlwdGlvbiBvZiB2MToNCj4gICAgIFRoaXMgYWRkIGltcGxl
bWVudGF0aW9uIG9mIHJlc291cmNlX3F1ZXJ5X2xheW91dCB0byBnZXQgdGhlIGluZm9ybWF0aW9u
IG9mDQo+ICAgICBob3cgdGhlIGhvc3QgaGFzIGFjdHVhbGx5IGFsbG9jYXRlZCB0aGUgYnVmZmVy
LiBUaGlzIGZ1bmN0aW9uIGlzIG5vdyB1c2VkDQo+ICAgICB0byBxdWVyeSB0aGUgc3RyaWRlIGZv
ciBndWVzdCBsaW5lYXIgcmVzb3VyY2UgZm9yIGRHUFUgcHJpbWUgb24gZ3Vlc3QgVk1zLg0KPiAN
Cj4gDQo+IFlvdSBjYW4gdXNlIGEgY29udGV4dCBzcGVjaWZpYyBwcm90b2NvbCBvciBldmVuIHRo
ZSB2aXJnbCBjYXBhYmlsaXRpZXPCoFtmb3IgYSBsaW5lYXIgc3RyaWRlZCByZXNvdXJjZV0uwqAg
Rm9yIGV4YW1wbGUsIFNvbW1lbGllciBkb2VzIHRoZSBmb2xsb3dpbmc6DQo+IA0KPiBodHRwczov
L2Nocm9taXVtLmdvb2dsZXNvdXJjZS5jb20vY2hyb21pdW1vcy9wbGF0Zm9ybTIvKy9IRUFEL3Zt
X3Rvb2xzL3NvbW1lbGllci92aXJ0dWFsaXphdGlvbi92aXJ0Z3B1X2NoYW5uZWwuY2MjNTQ5IDxo
dHRwczovL2Nocm9taXVtLmdvb2dsZXNvdXJjZS5jb20vY2hyb21pdW1vcy9wbGF0Zm9ybTIvKy9I
RUFEL3ZtX3Rvb2xzL3NvbW1lbGllci92aXJ0dWFsaXphdGlvbi92aXJ0Z3B1X2NoYW5uZWwuY2Mj
NTQ5Pg0KPiANCj4gaS5lLCB5b3Ugc2hvdWxkIGJlIGFibGUgdG8gYXZvaWQgZXh0cmEgaW9jdGzC
oCsgaHlwZXJjYWxsLg0KPiDCoA0KPiANCj4gDQo+ICAgICB2MSBvZiBrZXJuZWwgc2lkZToNCj4g
ICAgIMKgaHR0cHM6DQo+ICAgICAvL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAyMzExMTAw
NzQwMjcuMjQ4NjItMS1qdWxpYS56aGFuZ0BhbWQuY29tL1QvI3QgPGh0dHA6Ly9sb3JlLmtlcm5l
bC5vcmcveGVuLWRldmVsLzIwMjMxMTEwMDc0MDI3LjI0ODYyLTEtanVsaWEuemhhbmdAYW1kLmNv
bS9ULyN0Pg0KPiANCj4gICAgIHYxIG9mIHFlbXUgc2lkZToNCj4gICAgIGh0dHBzOg0KPiAgICAg
Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC8yMDIzMTExMDA3NDAyNy4yNDg2Mi0xLWp1bGlh
LnpoYW5nQGFtZC5jb20vVC8jdCA8aHR0cDovL2xvcmUua2VybmVsLm9yZy9xZW11LWRldmVsLzIw
MjMxMTEwMDc0MDI3LjI0ODYyLTEtanVsaWEuemhhbmdAYW1kLmNvbS9ULyN0Pg0KPiANCj4gICAg
IERhbmllbCBTdG9uZSAoMSk6DQo+ICAgICDCoCBkcm0vdmlydGlvOiBJbXBsZW1lbnQgUkVTT1VS
Q0VfR0VUX0xBWU9VVCBpb2N0bA0KPiANCj4gICAgIMKgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X2Rydi5jwqAgwqB8wqAgMSArDQo+ICAgICDCoGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9kcnYuaMKgIMKgfCAyMiArKysrKysrKy0NCj4gICAgIMKgZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMgfCA2NiArKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiAgICAgwqBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfa21zLmPCoCDCoHzCoCA4ICsr
Ky0NCj4gICAgIMKgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmPCoCDCoCB8IDYz
ICsrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgICAgwqBpbmNsdWRlL3VhcGkvZHJtL3ZpcnRn
cHVfZHJtLmjCoCDCoCDCoCDCoCDCoHwgMjEgKysrKysrKysNCj4gICAgIMKgaW5jbHVkZS91YXBp
L2xpbnV4L3ZpcnRpb19ncHUuaMKgIMKgIMKgIMKgIHwgMzAgKysrKysrKysrKysrDQo+ICAgICDC
oDcgZmlsZXMgY2hhbmdlZCwgMjA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0K
PiAgICAgLS0gDQo+ICAgICAyLjM0LjENCj4gDQo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 619D05931A0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 17:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8E1CBA36;
	Mon, 15 Aug 2022 15:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85D4113A1A;
 Mon, 15 Aug 2022 15:18:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYVIgIkRt9dLglfSVOiwYt3mE8hoznE8et5GxV/pSFxDgR7luAgCoorj9aRlBAwaz2oq4sx05U3pY76zgi8z0q+sX2xdezmbzXWXPZwzyQz2wT0RQJR+4WS0MV35Qypsv6m7jkzQmzGjNNwYHEnmEc6C0urNr0hb7mIPM8Md1opgX3KGCdcHj0STzHK9Dj+e4Y19s1qg5dlxngV5OoRYy5kn7a05xzfbRd0B+eU4nm7EeFkNvHx8YvG60baRPpUS4EhRqpYQN1cXo2khISwGZD3x2cRzjAfLBQWKd3hIpkncovUP+EGdKql1Gp4yImXaO1djcOPV3X1h3TOreQITUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cn7EMQcyBNQmt/6N+rvZro/PQUXV3kPOSmbMlbB2fGk=;
 b=VftiLZ25b0nyuXdROK6DeHqF686r2+rdjgaXm1IV/ZJwgFQnm/yxWdKdkkkD5YYywoa2NMxWU2JT0aws/Lvu9psgt3vFv2lnNyfgYNkvLtrELCHEvtNrLnVuuDrtWy5EftgeC/2BF7yu+0OwmWElrOz2yDp0SF5McMghMXgB7dRMoi4Dyonb0tPa+VPxZuxdNqT0n/pRXcjJ1naet3GL+nHsdNH+VBwXczb2iA3xjJSpRvQfmxh0zbuIpfWgI9MXGZTkewpIZ/SZ7oovJ5bWVO1GFfdin50UXu0ORjVo80ujyakqK60QoPXrfP6FT9f4fBBS4hOMrSnCNeDn1MPRxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cn7EMQcyBNQmt/6N+rvZro/PQUXV3kPOSmbMlbB2fGk=;
 b=MoGWcK2kH2E5gDlQEHHOzWKGbOzBUVSaPvNy3p2qvRTzzcbBfr3eur/K/GMaSC7C94J/0tVeitRbCCG9O4fSvCbZjY3O6MpDjE4yASSZDRPI+lbAniXLzyhzSGUNo4XItEOLC0Tygv8T77kfnoLNazaiuOkEDTiFv22xtN+TAGw=
Received: from SJ1PR12MB6194.namprd12.prod.outlook.com (2603:10b6:a03:458::12)
 by BYAPR12MB3110.namprd12.prod.outlook.com (2603:10b6:a03:d7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 15 Aug
 2022 15:17:57 +0000
Received: from SJ1PR12MB6194.namprd12.prod.outlook.com
 ([fe80::bc88:3db6:f931:98fc]) by SJ1PR12MB6194.namprd12.prod.outlook.com
 ([fe80::bc88:3db6:f931:98fc%5]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 15:17:57 +0000
From: "Dong, Ruijing" <Ruijing.Dong@amd.com>
To: Khalid Masum <khalid.masum.92@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: RE: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in
 vcn_v4_0_stop
Thread-Topic: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in
 vcn_v4_0_stop
Thread-Index: AQHYsHTWuO318jhUpE6H84biXg/lfq2v+0DggAAWYACAAADcQA==
Date: Mon, 15 Aug 2022 15:17:57 +0000
Message-ID: <SJ1PR12MB6194C83D51101ACD97B55F0295689@SJ1PR12MB6194.namprd12.prod.outlook.com>
References: <20220815070056.10816-1-khalid.masum.92@gmail.com>
 <SJ1PR12MB61944B1D53330D5E9531158695689@SJ1PR12MB6194.namprd12.prod.outlook.com>
 <86088c17-585c-4a53-312d-ef339b824538@gmail.com>
In-Reply-To: <86088c17-585c-4a53-312d-ef339b824538@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=473a2d11-e256-40f4-80bc-480dadcde3b9;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-08-15T15:14:23Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c661f133-1706-4d35-55fd-08da7ed1557b
x-ms-traffictypediagnostic: BYAPR12MB3110:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a1hBPteBWI4VyPQdQoXwHeY0gp58lpWCmRb94a9FAmzVN8n6ivYc2hibEOhMFNQrbnLEcQkPnXZryekPcvgEjY8+AjPt6uzkIAsAJwIz0wbKgzRgDaHTPabADoKBfDXxKt5mht7X3HOz16lz/9GcVotJY7oNDtu5ZFuXd/yxplmj4Qb9pgqoTEyXiCrS9wW8o7Q7FH/0Grxgpgrf/VNAcDIQIBDU0hIFrpxVhiEFpOifefoZ/zWfq/ttffJGfc18s4CDlEraYiH58uRdjkGtRomDsb/N+RJEhDbOBqkiaDFLPAvg0tWIVqIPSN8CzUbyMhNyvLaTDERNUO2YI3h5HYQGDnBJxTuLxWecY+7dRKNeM2qEGud1ohwHP/TWSh6cjnAsGYrAI59SmDm0QIsukX1NI2/fwvp7X3sGtVknPZ8VvG5QHES81XVMvUDicisnf57yQ2XdMTATy6PWGqeUnjdN4EiAL939vkqSzX3jHBzhcAT08L7oi9R8NHPWS37DYViwbrR60m/fMZKd445NPwcnrBrlWQtRB4we56ZVmpZIwXf3Ba3SkW3eo/VsTz7RYN3BWHMN8+L8QvO76Jr6Xubhfn7QBe3D13zAY1gK398pu95D9kmAM2JmUON63HGOaKp6Y8vsG/CXFoQblWJRucT81vsDzGShXUMsR7QgPNltSKQurBorUHj4hqXdFGrUy7dsIaChQCO1Zts8B3CXwZJ/3kEnXlvw/YBzmqaLrWzJQzIGK8RCDW36P7AfIsSxBEtpJmX6XOpGPrxWmR0zd7AHrgyTHXgae1R38PBULWc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR12MB6194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(4326008)(5660300002)(8676002)(83380400001)(54906003)(26005)(316002)(41300700001)(71200400001)(186003)(33656002)(52536014)(7696005)(64756008)(76116006)(66556008)(9686003)(8936002)(53546011)(66446008)(110136005)(6506007)(478600001)(66946007)(86362001)(66476007)(2906002)(122000001)(38100700002)(55016003)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akFLYVplaGhhc2hYZ2tqaDBnV1krb2swNDVRSVo5RHpzS3lVNEFiblZYaTMr?=
 =?utf-8?B?K29pNERrMmYwUFV2ZDhybnBJWTFORVN1NEZlTk8xMEpEZ0dBNjh3T0w4M3Vt?=
 =?utf-8?B?UUZLdW53QWMrTi9Dbk8rMnZuTUtiY000YWxPTmJtZkVjV2VCY3hhYlBFQ0Iv?=
 =?utf-8?B?QW1qaGpCMWtvejdyejVKakdCVlA2RnloeWtNNEt6WHZWSWZvOVYyN2xKR0w0?=
 =?utf-8?B?S1ZGL0tCK0w4Y2FOYXJ3aU9aNW10aHA0ZFk5RE5ZeUJrYlh2KzliTkpCODll?=
 =?utf-8?B?L3BBZkNNOTZMMVkrZ2hIdUo0ZWU0WkxQY3pWYWJ1Y2pIb1RSUEQrWmtPc3VD?=
 =?utf-8?B?akZaL285My9JblQ1NFVvelJxeGphNDZQNFpaUVduUnI4a2NZNVY5UE1tOVpi?=
 =?utf-8?B?dFVqN1dJNXRheDlzOVRhZEhrT0ZIWGE3dkZmM0orelk4cWZpV1d1ZVVLbzYw?=
 =?utf-8?B?aHkyNE8zNGRNUGlINDdlSkNPREp5UEJ5RE5ob3c4bDBrYUdmeE55T0ppczky?=
 =?utf-8?B?dWJ3dFFXSkZ5NXliS3VZcjNJMDlWdnhBWnFVcWtZZElrSnpjbFdkSHorZXNs?=
 =?utf-8?B?QmEzNVh4YytRY2tMaFRaaVJCK1NkQ0pQSWxkQkkyWnpaOUxHVEdGQ3JGN2I4?=
 =?utf-8?B?MmNPOWpqVjV1ZkFadEFQWjA4YktRV0oyVzBmdVBlR0JwUFZoaHBjcDJtUFZ6?=
 =?utf-8?B?WUVqbjBGb3podGpPeFZqalA2cm05cFgvT0RJZjRLSTZDckdKbzJYNGVIZWdF?=
 =?utf-8?B?VUhNM2pCUGdLbWdjdzRoR2J5V2Exd1I5MzJYNlNyNW1JUWowMXdaRWhtVGFS?=
 =?utf-8?B?cFdRZU1UWnNrSTIwSE5vOXRsVHl4dG9Ia2NoNTZXd3JMOFkzWlZJUU5tSkda?=
 =?utf-8?B?Y08rVUpLZHFiY3lDMjNSekFucEZ6SFgvU1ZzNDlsVktRQTRpQ2VvMzd1aEV3?=
 =?utf-8?B?b1EvL0hEU0NzTEx6SEZHQnUvank0aVdlNTRMbXZHNnh1Yi8zVE1YTFgwQmRW?=
 =?utf-8?B?eXFrRUZlbFhIQ3E5cjZMY0JobG5pZGl2QTRKWW9CSEdraDh1YVVwSXM5Qkl2?=
 =?utf-8?B?czRHcElKZ0tvQjJTR1BlcEZzS0wxU0ErOUtCNjZKb1Q0OGtwSytoMzMvVjNk?=
 =?utf-8?B?cC9nTXQwb3FSSFVUYThFWm1ST1FIQ25mdUNBUzNqTzdMTGpRUjRFQzZ6ZGpn?=
 =?utf-8?B?SWVIU0FYQWZ4RmJDVFhXMlJBeXkrZ09FejhPZjJpc0ZNZVVVRHB6bEpRWWoy?=
 =?utf-8?B?M3kyUGF6SzBEQktzNzRTVFVRSDRrem9aSGtKN01NRWJ4cDRQY2dQQU9YKzlT?=
 =?utf-8?B?VXFiOThIWC9GcmtaRHhFelpQdU9wb1JoWW9KNzBhTlVuQjBLbEl3YUNpdUEw?=
 =?utf-8?B?ajZuV0t6ZDErOGI2L2hlc0M0NzZjSE5DcXhBVVc3WnpMbE9KTitZL20vRTgz?=
 =?utf-8?B?Z0NOQ015K25WNEZSSUFqZmpTcHlIZVNyWVdqd2VrdmxiN0t5dVJkcXdxR1Yr?=
 =?utf-8?B?ZnNrajkrOEdIcGgwOVBtRkswaU1BT2crblRJb0s2c2w4SFA3b3FQYzNEREI4?=
 =?utf-8?B?VzdlRkRERGJJQ1BhY0JLSG9oQnR0ODJVZHBmdnNSN0ZoV3lUbVFLZHNGVTIy?=
 =?utf-8?B?KzBNbDhkMVZXRmpTZzZOMDlSQ3QzK3FacUV1RXI1L0lxeEJ3VjVRdzI3eno2?=
 =?utf-8?B?aUthbkZyd3d1TXhweG1OckJlai91eWtEUHhwdVlpN29yd1hoTEVDanZHSlpq?=
 =?utf-8?B?Skd2WHRmTVorZTE3K0lqM1J6M2NRRzRCS2dBVDAydEdUb0pKSlY5NWlkOWV2?=
 =?utf-8?B?QXlLU202enBHMzBsajdwZHlzL0laNlNNTTR1cDk0QmtuK2U1R085TlVvYW1Q?=
 =?utf-8?B?cmUwNUx4OHAwTnZQTldDK0JWUHRjMURQVmJlVzhMWGdaeE95elZxRVJZMXZG?=
 =?utf-8?B?TC96azRMRHI4MERjZDFUVmMrYmNLYmhmN3NNcVlQMzYwQjVBOEE2R2p2MmZr?=
 =?utf-8?B?V0JIWmlNbFBvUW4vQVU3V1NVZFZscSsvOFZDem1MWWh5aHdiVWExam1qb0xZ?=
 =?utf-8?B?VUx3S200Rmk5dzVDdmwzbEc2Z2l2YmNNVGRvR1FrbVh4eTAwckI4cE5WZ3dE?=
 =?utf-8?Q?r4os=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c661f133-1706-4d35-55fd-08da7ed1557b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 15:17:57.3288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0GKj57mHAynYdQ80VoQcsPxL4r0UqD1gbPnTrQKwdFVHEZjrgUlVuShjV5xGGBZQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3110
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
Cc: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Jiang, Sonny" <Sonny.Jiang@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCklmIHRoZSBjb25kaXRpb24gd2Fz
IG1ldCBhbmQgaXQgY2FtZSB0byBleGVjdXRlIHZjbl80XzBfc3RvcF9kcGdfbW9kZSwgdGhlbiBp
dCB3b3VsZCBuZXZlciBoYXZlIGEgY2hhbmNlIHRvIGdvIGZvciAvKndhaXQgZm9yIHZjbiBpZGxl
Ki8sIGlzbid0IGl0Pw0KSSBzdGlsbCBkaWRuJ3Qgc2VlIG9idmlvdXMgcHVycG9zZSBvZiB0aGlz
IGNoYW5nZS4NCg0KICAgICAgICAgICAgICAgIGlmIChhZGV2LT5wZ19mbGFncyAmIEFNRF9QR19T
VVBQT1JUX1ZDTl9EUEcpIHsNCiAgICAgPT0+ICAgICAgICAgICAgICByID0gdmNuX3Y0XzBfc3Rv
cF9kcGdfbW9kZShhZGV2LCBpKTsNCiAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsN
CiAgICAgICAgICAgICAgICAgfQ0KDQogICAgICAgICAgICAgICAgIC8qIHdhaXQgZm9yIHZjbiBp
ZGxlICovDQogICAgICAgICAgICAgICAgIHIgPSBTT0MxNV9XQUlUX09OX1JSRUcoVkNOLCBpLCBy
ZWdVVkRfU1RBVFVTLCBVVkRfU1RBVFVTX19JRExFLCAweDcpOw0KDQpUaGFua3MNClJ1aWppbmcN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtoYWxpZCBNYXN1bSA8a2hhbGlk
Lm1hc3VtLjkyQGdtYWlsLmNvbT4NClNlbnQ6IE1vbmRheSwgQXVndXN0IDE1LCAyMDIyIDExOjEx
IEFNDQpUbzogRG9uZywgUnVpamluZyA8UnVpamluZy5Eb25nQGFtZC5jb20+OyBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZw0KQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNo
ZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+
OyBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsgRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgWmh1LCBKYW1lcyA8
SmFtZXMuWmh1QGFtZC5jb20+OyBKaWFuZywgU29ubnkgPFNvbm55LkppYW5nQGFtZC5jb20+OyBX
YW4gSmlhYmluZyA8d2FuamlhYmluZ0B2aXZvLmNvbT47IExpdSwgTGVvIDxMZW8uTGl1QGFtZC5j
b20+DQpTdWJqZWN0OiBSZTogW1BBVENIIGxpbnV4LW5leHRdIGRybS9hbWRncHUvdmNuOiBSZW1v
dmUgdW51c2VkIGFzc2lnbm1lbnQgaW4gdmNuX3Y0XzBfc3RvcA0KDQpPbiA4LzE1LzIyIDIwOjE1
LCBEb25nLCBSdWlqaW5nIHdyb3RlOg0KPiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gR2VuZXJh
bF0NCj4NCj4gU29ycnksIHdoaWNoICJyIiB2YWx1ZSB3YXMgb3ZlcndyaXR0ZW4/ICBJIGRpZG4n
dCBzZWUgdGhlIHBvaW50IG9mIG1ha2luZyB0aGlzIGNoYW5nZS4NCj4NCj4gVGhhbmtzDQo+IFJ1
aWppbmcNCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hhbGlkIE1h
c3VtIDxraGFsaWQubWFzdW0uOTJAZ21haWwuY29tPg0KPiBTZW50OiBNb25kYXksIEF1Z3VzdCAx
NSwgMjAyMiAzOjAxIEFNDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsNCj4gbGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZw0K
PiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29l
bmlnLCBDaHJpc3RpYW4NCj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFBhbiwgWGluaHVp
IDxYaW5odWkuUGFuQGFtZC5jb20+OyBEYXZpZA0KPiBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
OyBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBaaHUsIEphbWVzDQo+IDxKYW1lcy5a
aHVAYW1kLmNvbT47IEppYW5nLCBTb25ueSA8U29ubnkuSmlhbmdAYW1kLmNvbT47IERvbmcsIFJ1
aWppbmcNCj4gPFJ1aWppbmcuRG9uZ0BhbWQuY29tPjsgV2FuIEppYWJpbmcgPHdhbmppYWJpbmdA
dml2by5jb20+OyBMaXUsIExlbw0KPiA8TGVvLkxpdUBhbWQuY29tPjsgS2hhbGlkIE1hc3VtIDxr
aGFsaWQubWFzdW0uOTJAZ21haWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggbGludXgtbmV4dF0g
ZHJtL2FtZGdwdS92Y246IFJlbW92ZSB1bnVzZWQgYXNzaWdubWVudA0KPiBpbiB2Y25fdjRfMF9z
dG9wDQo+DQo+IFRoZSB2YWx1ZSBhc3NpZ25lZCBmcm9tIHZjbl92NF8wX3N0b3BfZGJnX21vZGUg
dG8gciBpcyBvdmVyd3JpdHRlbiBiZWZvcmUgaXQgY2FuIGJlIHVzZWQuIFJlbW92ZSB0aGlzIGFz
c2lnbm1lbnQuDQo+DQo+IEFkZHJlc3Nlcy1Db3Zlcml0eTogMTUwNDk4OCAoIlVudXNlZCB2YWx1
ZSIpDQo+IEZpeGVzOiA4ZGExMTcwYTE2ZTQgKCJkcm0vYW1kZ3B1OiBhZGQgVkNONCBpcCBibG9j
ayBzdXBwb3J0IikNCj4gU2lnbmVkLW9mZi1ieTogS2hhbGlkIE1hc3VtIDxraGFsaWQubWFzdW0u
OTJAZ21haWwuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25f
djRfMC5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNu
X3Y0XzAuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92NF8wLmMNCj4gaW5k
ZXggY2ExNGMzZWY3NDJlLi44MGI4YTJjNjZiMzYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3Zjbl92NF8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdmNuX3Y0XzAuYw0KPiBAQCAtMTE1NCw3ICsxMTU0LDcgQEAgc3RhdGljIGludCB2Y25f
djRfMF9zdG9wKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgICAgICAgICAgICAgICAg
IGZ3X3NoYXJlZC0+c3EucXVldWVfbW9kZSB8PSBGV19RVUVVRV9EUEdfSE9MRF9PRkY7DQo+DQo+
ICAgICAgICAgICAgICAgICAgaWYgKGFkZXYtPnBnX2ZsYWdzICYgQU1EX1BHX1NVUFBPUlRfVkNO
X0RQRykgew0KPiAtICAgICAgICAgICAgICAgICAgICAgICByID0gdmNuX3Y0XzBfc3RvcF9kcGdf
bW9kZShhZGV2LCBpKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgdmNuX3Y0XzBfc3RvcF9k
cGdfbW9kZShhZGV2LCBpKTsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0K
PiAgICAgICAgICAgICAgICAgIH0NCj4NCj4gLS0NCj4gMi4zNy4xDQo+DQoNCkFmdGVyIHZhbHVl
IGlzIG92ZXJ3cml0dGVuIHNvb24gcmlnaHQgYWZ0ZXIgdGhlIGRpZmYuDQoNClNlZToNCmRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92NF8wLmMNCg0Kc3RhdGljIGludCB2Y25fdjRfMF9z
dG9wKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSB7DQogICAgICAgICB2b2xhdGlsZSBzdHJ1
Y3QgYW1kZ3B1X3ZjbjRfZndfc2hhcmVkICpmd19zaGFyZWQ7IC4uLg0KDQogICAgICAgICBmb3Ig
KGkgPSAwOyBpIDwgYWRldi0+dmNuLm51bV92Y25faW5zdDsgKytpKSB7DQogICAgICAgICAgICAg
ICAgIGZ3X3NoYXJlZCA9IGFkZXYtPnZjbi5pbnN0W2ldLmZ3X3NoYXJlZC5jcHVfYWRkcjsNCiAg
ICAgICAgICAgICAgICAgZndfc2hhcmVkLT5zcS5xdWV1ZV9tb2RlIHw9IEZXX1FVRVVFX0RQR19I
T0xEX09GRjsNCg0KICAgICAgICAgICAgICAgICBpZiAoYWRldi0+cGdfZmxhZ3MgJiBBTURfUEdf
U1VQUE9SVF9WQ05fRFBHKSB7DQogICAgICAgICAgICAgICAgICAgICAgICAgciA9IHZjbl92NF8w
X3N0b3BfZHBnX21vZGUoYWRldiwgaSk7DQogICAgICAgICAgICAgICAgICAgICAgICAgY29udGlu
dWU7DQogICAgICAgICAgICAgICAgIH0NCg0KICAgICAgICAgICAgICAgICAvKiB3YWl0IGZvciB2
Y24gaWRsZSAqLw0KICAgICAgICAgICAgICAgICByID0gU09DMTVfV0FJVF9PTl9SUkVHKFZDTiwg
aSwgcmVnVVZEX1NUQVRVUywgVVZEX1NUQVRVU19fSURMRSwgMHg3KTsNCg0KSGVyZSwgYW55IHZh
bHVlIGFzc2lnbmVkIHRvIHIgaXMgb3ZlcndyaXR0ZW4gYmVmb3JlIGl0IGNvdWxkIGJlIHVzZWQu
IFNvIHRoZSBhc3NpZ25tZW50IGluIHRoZSB0cnVlIGJyYW5jaCBvZiB0aGUgaWYgc3RhdGVtZW50
IGhlcmUgY2FuIGJlIHJlbW92ZWQuDQoNClRoYW5rcywNCiAgIC0tIEtoYWxpZCBNYXN1bQ0K

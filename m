Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978BE6A7D93
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 10:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D95710E27A;
	Thu,  2 Mar 2023 09:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F0910E112;
 Thu,  2 Mar 2023 09:22:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SB/lQj9kypXwKQWEbM3UwKX+TvcksDBnVUkqB9zWRlvPt9oF2OemEOVPW0RNqPN8zj2qAlhlj+eA1fvetRrO9+KR1jdj623TAkYwyZpEtOImAIdsmn0IgICK5bV53Kvf6w8ch6Sjpzd06IpKM3B8YcRxBCWDIvYptlZIyvs9T5QBZTB52kUc6YF5cQh7PZI7lWYjz9tq26i+Gda+NQ6IHoiB1AIgGk7vL7d16jpodREvcv5MCyRCpzCOnDOFBWCBvsfv9/8+jufSi19qTc3xXYqKtOBEywbEYYwJcyzM+pCm/6OFPVFiR4UN7xliBb0VEUBq2fsy6a9qwpIPosqD0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giIE+jzb3LEL5qZmToxgSQ3Z9fIfY87qzZknOluOq8g=;
 b=hAaLUmW0dxJaxk2RX2ye/9PcxEOEt9H9AVAHfQ2mkCoLEslSxdSkpTIb2rls6rAZ8FczLwpc6V5lkdeaF6KY7uZ3EdjA9ORIRGLmfjD8YBP5L6aLv6Sruwby6n5kmheGha66tZmMVcefQf+kpCXNCObHyk4PqGGKpPWQj3/Aq/ACc6VVOw/KK8nIBNqHMvemLoElKpdusEjAuTAS69rs/UbC3JxQwsN9CkhxVMmC65IYC/bqUNfdV0XPRGuJDDxj7DxRW2ykbqN5RYfR4WtlrrFyQCrvC0u9WL0x1vlrTyJlsF0PRldxHrJffnocEwDU7/pEWmke/g0OAXMdy8atoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giIE+jzb3LEL5qZmToxgSQ3Z9fIfY87qzZknOluOq8g=;
 b=Dfdhcz4Ma1xviBkGWiq0Tm/BTB3wlbWD6Uf3UDpGyYbUgqxV5YNspNwGyG+YQUSG+ycKJWs/1EWWTYnB6mA8t6lsY4IUjATa66CoAGg0LawPwG2plStsEy3EWc7W0v1lTI24eovpNt2TyT8+na87wXcnDUGjjTtkek6mF5UV1UY=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 CH3PR12MB8404.namprd12.prod.outlook.com (2603:10b6:610:12d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 09:22:52 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3334:46b8:da25:16ad]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3334:46b8:da25:16ad%5]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 09:22:52 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Jeff Pang <jeff.pang.chn@gmail.com>
Subject: RE: [PATCH] gpu: amd/pm: mark symbols static where possible for smu11
Thread-Topic: [PATCH] gpu: amd/pm: mark symbols static where possible for smu11
Thread-Index: AQHZTOf7sfy0Ni/LJkabQbEllAFZj67nNw/w
Date: Thu, 2 Mar 2023 09:22:52 +0000
Message-ID: <DM6PR12MB261965B861DD6BC8DB76631CE4B29@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230302091614.62093-1-jeff.pang.chn@gmail.com>
In-Reply-To: <20230302091614.62093-1-jeff.pang.chn@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-03-02T09:22:50Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=eac7134e-08bc-43d4-bad8-4e70b0c2b1be;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|CH3PR12MB8404:EE_
x-ms-office365-filtering-correlation-id: 4e9ddb81-f1bb-41f0-197c-08db1affb334
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L28HvAq4wYNNoidrUHSRLeAktJ/rriYVaQlskVfB1D7go7tHEl2bTC53bZVHhaHPXsIfZX0mdXSR7Fp00IVHXR7wD1Aax3Wj0Sw04bzRW2piFhRiZKHorvLNpiZXNvoTvnAK0lUyCKJrhXDNxeerNx8ymBp3X8sji52LnlrTOA3iuxoh8q/i5efVulhEnb7IPNSmQgLNAl/hVTgIQMAhdcpwbDdCrPy2oRkBKR81REKxL6ksDBppeJutsPxNadHUoLeMqkbmeYodXl1PI3qWlSjSzzF3EWybsJHnkWR+b+Mx0ZRDzC6ub+vKWOx9iVKM4X3Fgd7hQul8Vx3nj4C1hTkbWqt9VlM9k+ogjF8bqGQyAbKeSJHmCACcYLvOBp3eunvSIT9s5n+3qaj/ka/P1nCkCju8KDdvDBAquMQ0hZosz0DmxtpNH8zTFK10T/COHQcqzbOk7wG+ctf4WE9W1ndE2b85PGHRXS3p5/5f8EVqiF+u0QJx2bIPCgcY7XmFovrQ4DRz5OARJB3ApuXy6J1nYau8HKyd67SnflkB32fM+NGfIvMkCNra4QdD3utbDfKTlzqnQ51+QGgrtQhdDOnWwOV0chpCeI6+5xdPOZ7FOMgq//6JFCrgrmmPCwvawBZTgWDQxGyLFIbxQyv72A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199018)(83380400001)(38100700002)(122000001)(5660300002)(478600001)(8936002)(52536014)(66556008)(33656002)(86362001)(38070700005)(55016003)(26005)(186003)(9686003)(53546011)(71200400001)(6506007)(966005)(66946007)(64756008)(66446008)(66476007)(8676002)(7696005)(2906002)(6916009)(76116006)(316002)(4326008)(41300700001)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTBpY3A1YzlIN2xsNXVua3hmR1pZQ1ZMd0tMdW9iRUhacmNuUHNkSzB1UEVR?=
 =?utf-8?B?RTd0NXVxaHcwRThGdFIzcStNejl6UTlOdVJySHhlU3NvdzdrTGRBV1JHdk01?=
 =?utf-8?B?ZFNzc0xFVmN1Y1RDSFoyQ0N1M20xQ2ZSa2Y5WERLUWdhQ0pmZUR4ZkVNVGph?=
 =?utf-8?B?N0pUaHZ0SE5QTkVaU1FNOXEzY2Y4Q0pDK3BKbjVyU2tBRlRKY0dmS3dMZkpu?=
 =?utf-8?B?YXdxckNjSEdHSzJHd3gySGdmODJOUmgxK2JQQkxISXByRStjTXU0U3NsZENO?=
 =?utf-8?B?OUhsM1AzY3hHMlpkRFdPMytiQXp0LytpUXhXaFp2Rk1wS1p5N3dRQXJsWGZO?=
 =?utf-8?B?REVwcGFtSitSa1RnTlljenRseTdJWVJSamRBZWdIV2NKWm0zdGk2eTRRbUJ4?=
 =?utf-8?B?M1djSC9EK2p6ZGN4bUlQWG5VWEJlTjZCMFQySU93L250aUYyaUR3ZTI1WDV5?=
 =?utf-8?B?SytYTTZNenJ6VHEwZmlEK1lRQkl4ZUlLTlgzdXVleEJPSWpIenMvVCt6Qm5l?=
 =?utf-8?B?YVNCMExQL25mc2VBdGhVMy9VWUI5V2NqYlJ4dW5YODhFeHNpK0xjdUxERC9v?=
 =?utf-8?B?R1VjTjYxdnBOaWN4akhFQ3ZlRGpka1FMZldlcUFlRXpFTGdPQWxxZWJtVEts?=
 =?utf-8?B?bmJVSGwrRXllbDdQeVdBRWhCZ1k5VFZKUmtHRnFkWHVkUytXK3VmZk4ycnli?=
 =?utf-8?B?Sjk0MVNHODFjVUQrUGVwenlmV1ByeW91NnBnWjNteEljMWt1MlpuQkZ1Qjgy?=
 =?utf-8?B?RWIrcEdrUXhTU1hUV2ErRTYwb05IT2s0T0xYWkZzT05YVEdKcS9rY1Z3UytD?=
 =?utf-8?B?OFptTk4wTlJmYXBiZWRWQnVudnQxTHZWZGxCMUU0Njh2Y0hFNUwvQUdHZG4y?=
 =?utf-8?B?OGRUSFJHTEU2VzRaYlVJMEF0QWpGR0dHOHRjV2VvdDNEOHRwb1VPTVBtR2Nz?=
 =?utf-8?B?MndUaDZ0NUo2bU5TWEVCRUlTYmtBYWw5VERWaVp2TFRra2pHRjJhbk1BalI0?=
 =?utf-8?B?Sk1XbWpiUjBWTVZZbTBodjNYTXpuMnZPOVM1bFRDMHY3d2pLcDFrVWlBQVlP?=
 =?utf-8?B?SFBoVTJWVlBjdjZoVy9oVUg3MXQ3OENhenhUYXBYdEwrdmJkc3BZN05uMFcy?=
 =?utf-8?B?T2V5eHZnaytWbWdML2xOTW85MGlHdE05dW90Z2dXU3RWQ3RuYnVSVmhxQ1BZ?=
 =?utf-8?B?clJGZHRJRk9KTlQvOUgyOGt4MC9YZXIwWTV3SmpPd3d0L3M4R0JXWjlJaXVi?=
 =?utf-8?B?ZHdGM1U3cDJDQ3B0Vks2dHFqSjE1azhWazlJTnJzSXFPSnFXeExlTXEwQmh1?=
 =?utf-8?B?S0lUUnhzTjRoTXdtMXZkVSs0aHpBT2RaUlUwVDNrbHA1L2kwYy9sUzZUMVp5?=
 =?utf-8?B?MGd3T3VDbHYvS0VsMyt1bmRxeGUyd1lhTXpQT3gwVFd4ZHhOeUl4TXErYVl1?=
 =?utf-8?B?T2daWnFnc1F6UlRvbWdQU3krenBuK2ZiSmtaWVgyK1ZndWIxSDJndERyT0di?=
 =?utf-8?B?RmcvZ1pPT2tscEJONWZ4QmdySDBLZyt5blZUMW5BbVZzYWMrOVVZcVRWa0lx?=
 =?utf-8?B?ZWVCMjFPOXpxazVEOWlEVXZGZG1ydDJ2STdJcHpWQUtBZ2xyNkMxQ1hiSkNK?=
 =?utf-8?B?Y3B2ZjlxSkNkTitPU0QwN3pQOXgrYzQ1THVVTFlyS2NSOVFxNmQ4VVdrTVM2?=
 =?utf-8?B?TjZmK2JzUURmeFpTSHhLbEM1aDA2ZWRRVDNLL3dDd3F3YW02OCs0NlU4QXlK?=
 =?utf-8?B?Ylh4Smh5cGphc2JpZnZiZytWQUVoN1hBZ1ZzeUVwVTFqTGlHTnZRbTJtR3JK?=
 =?utf-8?B?Q2NoS0pEczRUU3NlTUxNYzhFYmtVWXAySmtMbXA4aDEyZXRQQTk5T1l3Y2pN?=
 =?utf-8?B?L0JGQ2w0MTYzWVRTTmlIWUNkMjk1eTVDeVhVaWJJSnNLbVp6Y2hPdXZ6Vndt?=
 =?utf-8?B?eSs1eU4rZ1puNnlva1JNN05ESXdpeTdRb1RKbTFwM2xOc3Jta2ZMQlBFWWp4?=
 =?utf-8?B?aGE3UHIyT29DUHh1RllveTBBMmZVazRRNGhHdHVwcTkxWkE5R1NiaXhDZUps?=
 =?utf-8?B?RnFKV3hXZVhueEpTaFR6SjJPSWZUZHU2REhVUC93NklFd1A0S040ZXVzbHlu?=
 =?utf-8?Q?CrdQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9ddb81-f1bb-41f0-197c-08db1affb334
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2023 09:22:52.8263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E7Ncvz9ssq6IAskDz8r4BtCdyCADBQATxxZYJohxUBGB7cSaf5dzgC/Oq7QlEjvK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8404
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNClRoYW5rcy4gQnV0IEkgdGhpbmsg
dGhlcmUgd2FzIGFscmVhZHkgYSBwYXRjaCBmcm9tIEt1biBMaXUgdG8gYWRkcmVzcyB0aGlzIGlz
c3VlLg0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvYW1kLWdmeC8yMDIz
LU1hcmNoLzA5MDAyOS5odG1sDQoNCkJSDQpFdmFuDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IEplZmYgUGFuZyA8amVmZi5wYW5nLmNobkBnbWFpbC5jb20+DQo+IFNlbnQ6
IFRodXJzZGF5LCBNYXJjaCAyLCAyMDIzIDU6MTYgUE0NCj4gVG86IFF1YW4sIEV2YW4gPEV2YW4u
UXVhbkBhbWQuY29tPg0KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOyBKZWZmIFBhbmcgPGplZmYucGFuZy5jaG5AZ21haWwuY29tPg0KPiBTdWJqZWN0OiBbUEFU
Q0hdIGdwdTogYW1kL3BtOiBtYXJrIHN5bWJvbHMgc3RhdGljIHdoZXJlIHBvc3NpYmxlIGZvcg0K
PiBzbXUxMQ0KPiANCj4gSSBnZXQgb25lIHdhcm5pbmcgd2hlbiBidWlsZGluZyBrZXJuZWwgd2l0
aCAtV2Vycm9yPW1pc3NpbmctcHJvdG90eXBlcyA6DQo+IA0KPiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9wbS9zd3NtdS9zbXUxMS92YW5nb2doX3BwdC5jOjE2MDA6NToNCj4gZXJyb3I6
IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYdmFuZ29naF9zZXRfYXB1X3RoZXJtYWxfbGlt
aXTigJkNCj4gWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVzXQ0KPiBpbnQgdmFuZ29naF9zZXRf
YXB1X3RoZXJtYWxfbGltaXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90IGxpbWl0
KQ0KPiANCj4gSW4gZmFjdCwgdGhpcyBmdW5jdGlvbiBkb24ndCBuZWVkIGEgZGVjbGFyYXRpb24g
ZHVlIHRvIGl0J3Mgb25seSB1c2VkIGluIHRoZSBmaWxlDQo+IHdoaWNoIHRoZXkgYXJlLg0KPiBT
byB0aGlzIHBhdGNoIG1hcmtzIHRoZSBmdW5jdGlvbiB3aXRoICdzdGF0aWMnLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogSmVmZiBQYW5nIDxqZWZmLnBhbmcuY2huQGdtYWlsLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmMgfCAyICst
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hf
cHB0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0
LmMNCj4gaW5kZXggMDE2ZDU2MjFlMGIzLi4yNDA0NmFmNjA5MzMgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTEvdmFuZ29naF9wcHQuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmMNCj4gQEAgLTE1
OTcsNyArMTU5Nyw3IEBAIHN0YXRpYyBpbnQgdmFuZ29naF9nZXRfYXB1X3RoZXJtYWxfbGltaXQo
c3RydWN0DQo+IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90ICpsaW1pDQo+ICAJCQkJCSAgICAg
IDAsIGxpbWl0KTsNCj4gIH0NCj4gDQo+IC1pbnQgdmFuZ29naF9zZXRfYXB1X3RoZXJtYWxfbGlt
aXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90DQo+IGxpbWl0KQ0KPiArc3RhdGlj
IGludCB2YW5nb2doX3NldF9hcHVfdGhlcm1hbF9saW1pdChzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSwNCj4gK3VpbnQzMl90IGxpbWl0KQ0KPiAgew0KPiAgCXJldHVybiBzbXVfY21uX3NlbmRfc21j
X21zZ193aXRoX3BhcmFtKHNtdSwNCj4gDQo+IFNNVV9NU0dfU2V0UmVkdWNlZFRoZXJtYWxMaW1p
dCwNCj4gLS0NCj4gMi4zNC4xDQo=

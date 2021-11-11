Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C15644DAAC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 17:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F046EA00;
	Thu, 11 Nov 2021 16:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74246EA00
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 16:44:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfhYYU+ik7minPVxzV4yrwv4Frtnp0ISrIl8XTraYrQ8TEQcXYhbhJO3xfjuB+zHpbCRwfLMjCStaTSETx/qg2roiQ3UbOpi9GQK1c6+n6g9JvitbV03AIAylCMdI+StgvjBlSmte670WrtPVknoaK2Nxs9X5T/l0dc2t40wikNNyWYrFaBMyDDr0Oml7SfFzmftjO85/mRdUfA49Zz7eQDsJu8SWgZo/6vvwkwV5bnSonH6+wTs0dEaS/KctAAr09OVVKM2Zx1pG+Xr1WWYkqRaw72OSmd1tE75jfDd7rYx9+3xz6qECbA94fa8uBYYeq9eMr/VNyn6xpPlCN7W0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRx+oKv9FsshKF+a7pQpwWW+Jig21E314AItawnaFQI=;
 b=GnjpeXhrNgjHYJWbAxMkMHc2+74Wjly/wfTvh26l1oPVdgzNesdfWX5hbep2QchYtswKqyWcH3ZfLr67NKhxHOQrYcawiduW6oPTipIji0tJSyFpmBJVSEMrHF5ZpkA9fw5krR/AN/c4g6YmCXtXMU0uld720B1db+Ny/WZz4jOzdFXCoK1sormYUFz33fN1/xDvOlMNFbDbUldWvpgjvsfTjaaCrHzcTVs/MrNdwDKesisrd4LTodB/pVFG5zUSpd5XGgPWRCeV9FHp5c871PN4rdeDCvtX8ZL1+YQc42qPgH/Z/+B0RDWq2ygCGbjLM2BmAsY8wDISnmSOqsGESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRx+oKv9FsshKF+a7pQpwWW+Jig21E314AItawnaFQI=;
 b=FNHxNRf5bI55B3ymhURtAS4JUBuou96d7Pf1BuWcDo6SUDjGeoGTuPGxbz5tbYA/2Y4y3muFfbHmgeBXa5q+MMtx21pfCwYIuTVKiujzyMNp2OAYObrNQc+4jIr/c2BRMZf9hlkeRAsgJNZJY52i4ctx5BAPyDtuhJ6kMthHL54=
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by BN6PR05MB2867.namprd05.prod.outlook.com (2603:10b6:404:28::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.7; Thu, 11 Nov
 2021 16:44:15 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::bc64:fd08:4d7e:1271]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::bc64:fd08:4d7e:1271%3]) with mapi id 15.20.4713.010; Thu, 11 Nov 2021
 16:44:15 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4] drm/ttm: Clarify that the TTM_PL_SYSTEM is under TTMs
 control
Thread-Topic: [PATCH v4] drm/ttm: Clarify that the TTM_PL_SYSTEM is under TTMs
 control
Thread-Index: AQHX1kJWZtuSj3tf+Eqi7iDCZwvZFKv+ijSA
Date: Thu, 11 Nov 2021 16:44:15 +0000
Message-ID: <61aa563096a20dca80b4cc48037998b932c2e4fc.camel@vmware.com>
References: <3687c5f0-edb9-3cdb-2bb7-e45549a1cfb8@amd.com>
 <20211110145034.487512-1-zackr@vmware.com>
In-Reply-To: <20211110145034.487512-1-zackr@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd2a4fa8-2935-4d6c-4b64-08d9a5327f96
x-ms-traffictypediagnostic: BN6PR05MB2867:
x-microsoft-antispam-prvs: <BN6PR05MB2867751045388686B50F2861CE949@BN6PR05MB2867.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Of2PbDsLe91WcJr6U5NUiaHW1cRBPjaO7hOxokQt10v9Hxavu+bLZl/rBQkDZpZDTdBLyeKos3EUFgdhPGL4e9L2BcPZC1o17aFil700JChBsFLhJupoMzaAhNz653XDXJnf7kurFQxEgPvyJGxs4qiry1X7xMUyk3fCUnyX/IPd6IuLg7RENlp61BCdjcdrzJbpBmVa4nfs6SEVh1Edi9cGcGpiCH1SuhkGClvoQoFv4/S0mnYQJ7c9klhwrD8gQXWj2oHI/CN3OiTntUi7pynESBt7CMRKgMhwQNTt8PNQ6v27TQYkvfszscOA8d1T5Twqu0AskxIMWZ21oYw+P2+SiT82GvyfE7ZfZYF1i0KhQhDAQ7k/IxbTyrZsgreJMJz8PqBFnMMKBGyWP2SEH0CoYOmkqM8aqdcUoy1K7smQw0s7Co/rkW6IqWF4FMU76+mVIROOpJKqijfXwhpPiYkK2lYSQuP5KAqSnLay/CLzEOjLvSbGAmAesqFscv0INaUh9MOgV22sTpL2lVZfEF4W9pL2+aWpMbmS24BfNxE9nKVgMUmS3L55K5mpDuNnMoUPu7phQlHp/B+d94kKZH8R+GHs5D0ZqxdeOXqaNSR6cbCxe6mvTKiewvl/mQUVdW8ltpb0vaAvHqaoWytnj4o5ecCnhH1Mkq+/b7r892Dz/BSaSsTcdIt7uzOZsbaABzuAxE5jYmNeuXg7mU2TsWP56P5B5B5BTv0M9QGlLXKcmHAO8OcRdCJULLUOFjcVv3Rc9RVz4roFilWoNmOz9vbZKx9i1KMX8ObLD6+PfMI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(54906003)(64756008)(8936002)(66446008)(6512007)(66556008)(2616005)(26005)(186003)(6506007)(2906002)(38070700005)(36756003)(66476007)(76116006)(91956017)(66946007)(38100700002)(966005)(4326008)(8676002)(122000001)(71200400001)(508600001)(4001150100001)(5660300002)(86362001)(6486002)(6916009)(4744005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z05BWjZUcGxxYnRkTFNPNHFGZXdFdFV2ZnFYSzFOeitwZXIwZERYcEFMZDBS?=
 =?utf-8?B?YjZRdmliU0RqMHdJY0ticlA5dnJnMmJHdVMvNytsZWxhTnVxWENXRG0rWXB1?=
 =?utf-8?B?MjJNSEQ3U1ZLM1EwcHh5bGtlMTk3bFJuUkVDQ0d4SFd2US9Md3J3Z0FJT1JL?=
 =?utf-8?B?ZXVRaWNPZFJaZk1xd0ZTaGJhWk14clRIUFR5NEpFQ1VaVVBxTFpDNk1tNlhQ?=
 =?utf-8?B?ak5pOUNNM1QrSUdoVGJZUkFzdXpYNFBLdTdUcFJpZjlqK2EzVVFacjBCN2NO?=
 =?utf-8?B?NFFTTUt4TDR0M2l1TzFoWW5FUG03QmFnMmZGQzVWcFgxMXRtZzJ3SkxXaWRX?=
 =?utf-8?B?YVlBdjlscHZkUUVlOFdodGR0VENYZXlnWExWZmZ2eUkwcUNxOG9pdEJ2RzE5?=
 =?utf-8?B?bFRseUZhUlcyUDBEeEgwekkxRFFHd2tXZWNmdW9WdElpVisyZzZvSjhidjBi?=
 =?utf-8?B?WUFIUldpT2VvOS9xQ1JZODNPRHpHaEhGQUhIbTNUdmlRczVwcDZyUno0Yklr?=
 =?utf-8?B?a3l1b2JzN0M0anp2K2JaNUhwQ3dteWxEL2FueGtIaDZWbVhmTmtjWXB4WXY1?=
 =?utf-8?B?WVpwYzRUZEIwcUl1L01ydTZHMVFwMzZsOXZhZExRWjE0c1ZQVjRPL2tHMytt?=
 =?utf-8?B?ME4vY092NHZVeHhmQjhtUXFNazZPU0hpUzhCcjE2c0V2ZGkvamJQNW5JZHdN?=
 =?utf-8?B?Ly80UnJqNmhMenM4UGowQmREV1NDRFg2eVVpTDQwTGJUMVE3YktLdG9ITjhU?=
 =?utf-8?B?Tmx1ZVoyWVNZS0s4eEt1ODNrU1c5aVJlaDJ6VktpVG9NUllySVZzRG1hMU9F?=
 =?utf-8?B?NjlRYk9lM1pCcmpoU2U4N2Zua1BjaWE2Y0RwVHZGc0laNHNkdXh5QmJNM3g2?=
 =?utf-8?B?RzUyQmFBK0Jyc29IcTRRaEFpU3Uzakc5Y28yZFRIUi83aFJ4MUpUY1FUZVBP?=
 =?utf-8?B?L0puRXFiK09EaXp5bVFtM0VZUEhYTmdkQU9iU0VKT0VxTHdiLzY2V3V5MEtY?=
 =?utf-8?B?T0RnTlBxV2pQVXBrZEhrd3VxSFArLzBrZ09mTmtIdjFLMUZmVm5iU1pRNkZE?=
 =?utf-8?B?bGFXaUVWdnUvWlhYTDRNL0hKa1U2eFdJaEplQlpocEJaUVlaQmwxZ2hVdGVB?=
 =?utf-8?B?NkQzck5XYXl3R3N1aDVEQ0c2UXlsU3RrZlc2TENtRWxWM2JhbmQ3MGNRTjND?=
 =?utf-8?B?dnpvRWFiLzRvMHJQWlg0QnZITU95M3FmTWhLL1l5Rnc1eUZnZTBhK3V6S3g5?=
 =?utf-8?B?U004SXhnc0U2K1VaNWxIK1h3SldtR0tITXFOY2lhaDluQzFNZWpTa1dTRXc0?=
 =?utf-8?B?SVdkaEZnb1lPNVhLR0NlZ0NnZXkwdmJlaFd6cVE2bUJxQ0o3Ylk4clJGeGJU?=
 =?utf-8?B?R2JVVjQyU3VhRDdvLzlhWmk3cTRRNTcxN3laemNwcEpUODRsdUpPMW84c1l2?=
 =?utf-8?B?OU1iOTdWYWZGMXlSUUJFcHc3VVBYaTllTUFsSkE1SVdJZVRZVDQvQTU1Vkpv?=
 =?utf-8?B?UlVWNWhaMFprc0phL2lralczZGM1YzRoUWFyYmt3VXBNd21XMlJBYmpuN2Ft?=
 =?utf-8?B?MWR3UlpFU3dYRHU5a1RYZTZBa3ZjTTVOY0dxM2JxaDI2WlQ5L1hJVjMzTEFF?=
 =?utf-8?B?UUNydmlVRjZtRlkxRElYTXN2ZHZ5S1ZiM2Y4UEE5YjNMd2dqandiVklPOGRG?=
 =?utf-8?B?anBNWWZCVnc3UzI3WHVSaVVVRHFMVHFkZWMyRDhVRkZVcm9zVlBJRnpoek1W?=
 =?utf-8?B?dURUZzB2R21RRUFFL3ZoN3JGNkgrL3dCSEpIUXBJeDNKTjhZMUJ1T2VSN2Vi?=
 =?utf-8?B?WlN2UE9aM0xDUDRHL0NPNHEvMnRlUzJJVWNHUEtJKzFmZUY2UzJvd1lGVEY3?=
 =?utf-8?B?RWNNZmdpZEp1TlJURm15OStqM2V3dUxQSkFxUm02WW12K3JycktpcXFmSTBs?=
 =?utf-8?B?TmJzZWNmOEduMWtSRlIwZlNNdEsxSVZnTElQL3Zqa0JjQVpqaG9KK2xFQlhj?=
 =?utf-8?B?TlFkTHZwWm5wYk9INmlOZnp3Z0dwUG1xNFUrakFzZ2F2RWZvRU1NT3l0L2Y4?=
 =?utf-8?B?VWtPTGs1WE15c2FqTmhXZFFITlFzNTRMSzE4MzkvTXVDMlN5ZHVyZHZiM1hy?=
 =?utf-8?B?eWhReEcwQ0EyZy9Zb1hKMU1FUXNxYzJBakRqK1RtRzN4ZDRHN1FRRk1qUC9a?=
 =?utf-8?Q?kfMhiVvsF3DeiU6bQvUk/IQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <001E24377633BC48B2ECDC57E8B82986@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2a4fa8-2935-4d6c-4b64-08d9a5327f96
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2021 16:44:15.6240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w60u8Yzn9B4WFVZ6V1+cKVzCsm21g02d6Iu/YfHh8mrSPeuP8H2x4X3v+XLMwsCjBpbiHzzFtxiY5vyFr93biA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR05MB2867
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
Cc: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTExLTEwIGF0IDA5OjUwIC0wNTAwLCBaYWNrIFJ1c2luIHdyb3RlOg0KPiBU
VE0gdGFrZXMgZnVsbCBjb250cm9sIG92ZXIgVFRNX1BMX1NZU1RFTSBwbGFjZWQgYnVmZmVycy4g
VGhpcyBtYWtlcw0KPiBkcml2ZXIgaW50ZXJuYWwgdXNhZ2Ugb2YgVFRNX1BMX1NZU1RFTSBwcm9u
ZSB0byBlcnJvcnMgYmVjYXVzZSBpdA0KPiByZXF1aXJlcyB0aGUgZHJpdmVycyB0byBtYW51YWxs
eSBoYW5kbGUgYWxsIGludGVyYWN0aW9ucyBiZXR3ZWVuIFRUTQ0KPiB3aGljaCBjYW4gc3dhcCBv
dXQgdGhvc2UgYnVmZmVycyB3aGVuZXZlciBpdCB0aGlua3MgaXQncyB0aGUgcmlnaHQNCj4gdGhp
bmcgdG8gZG8gYW5kIGRyaXZlci4NCj4gDQo+IENQVSBidWZmZXJzIHdoaWNoIG5lZWQgdG8gYmUg
ZmVuY2VkIGFuZCBzaGFyZWQgd2l0aCBhY2NlbGVyYXRvcnMNCj4gc2hvdWxkDQo+IGJlIHBsYWNl
ZCBpbiBkcml2ZXIgc3BlY2lmaWMgcGxhY2VtZW50cyB0aGF0IGNhbiBleHBsaWNpdGx5IGhhbmRs
ZQ0KPiBDUFUvYWNjZWxlcmF0b3IgYnVmZmVyIGZlbmNpbmcuDQo+IEN1cnJlbnRseSwgYXBhcnQs
IGZyb20gdGhpbmdzIHNpbGVudGx5IGZhaWxpbmcgbm90aGluZyBpcyBlbmZvcmNpbmcNCj4gdGhh
dCByZXF1aXJlbWVudCB3aGljaCBtZWFucyB0aGF0IGl0J3MgZWFzeSBmb3IgZHJpdmVycyBhbmQg
bmV3DQo+IGRldmVsb3BlcnMgdG8gZ2V0IHRoaXMgd3JvbmcuIFRvIGF2b2lkIHRoZSBjb25mdXNp
b24gd2UgY2FuIGRvY3VtZW50DQo+IHRoaXMgcmVxdWlyZW1lbnQgYW5kIGNsYXJpZnkgdGhlIHNv
bHV0aW9uLg0KPiANCj4gVGhpcyBjYW1lIHVwIGR1cmluZyBhIGRpc2N1c3Npb24gb24gZHJpLWRl
dmVsOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjMyZjQ1ZTktODc0OC0x
MjQzLTA5YmYtNTY3NjNlNjY2OGIzQGFtZC5jb20NCg0KDQpQb2xpdGUgYW5kIGdlbnRsZSBwaW5n
IG9uIHRoYXQgb25lLiBBcmUgd2Ugb2sgd2l0aCB0aGUgd29yZGluZyBoZXJlPw0KDQp6DQo=

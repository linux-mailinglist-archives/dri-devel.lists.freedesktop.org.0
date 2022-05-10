Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF70521A5C
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 15:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8013710E677;
	Tue, 10 May 2022 13:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88ABA10E677
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 13:57:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAZ6uFDKpm1ilZC8kppP0292BCBFyCamCDWlOW+m6qIirZSm0mN3revXWIydbyeFRqeb7cu94xlx2JTssoZzLt/S7mIbl9jgDgQcIgl/IfM/LFtbHRlJp+kDAdYUIHJF+IPhVXDgo20wObQbdghxIthfFKxm4qq38Y8apgzB0NY9LdKWK9RCNT7DgsT5JY4XC4TBjR5g1Ahb66OkoVwQJZgkVfBw+m8+nFb4ydd1mEDUjsWcUwVjyb6kUJZEZJQo+X7x+ZgyfBKJeQq1uvmdUh9FD2EbfRTFK94RSQVllp6C+SIXMqildUBYUugvxmnOcnd2jtxAd3ySTPeOZ/5XFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJYNxfCPFPOHGh9RqdlPk4iU9G9qs4+ZbMN2/qDjX1o=;
 b=fYqpHP9toyz6n5MDMisKSRRXgDqyuVvbTL/vBXem16fI15MhRatbQ1dmyGIAdNExf3T/hED1SuLA3Z+Efy18XU086Si+18oAjO9QxRsJjSShbNsqB5jSRqLnj+z3HNlm9P/2QDdnqHwOnQvujm2NX29fFSM2PKEGd9C+dlWPNk6KA7rsbnjO306Zo9i51kxwWdbYwus7ptcXAxN+msBd1DP+bIU6EddL11YRMHHWyO2RJ+vtc/vlqF6mdBRy4nhqhIXBoQtaJEpUwZsvjxE4+AqzmQqqpxnoBvB5zu8lVTCdKUPdo5j82C6Cl+LVPMzSktnWWTuTiXbOceTsarPI1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJYNxfCPFPOHGh9RqdlPk4iU9G9qs4+ZbMN2/qDjX1o=;
 b=XF/XlttU/p9r1IIynMFx9REe8Kz2Oa74ebFCV/C2qH6bhHVXj/Ct7+BlJ1syUWuXj6EBKOv6d4TCttuEbqW4Bw892Y0VYZ+zBwtaA4gZBgMKFMCW2eQhWYaMMbltewEOpigrb3qIrCFj+vpE+gFcnfNv/YxRT4VLc0RqOzX4WAY=
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by CY4PR05MB3045.namprd05.prod.outlook.com (2603:10b6:903:ff::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.12; Tue, 10 May
 2022 13:57:44 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::1105:32c5:7d56:5430]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::1105:32c5:7d56:5430%4]) with mapi id 15.20.5250.012; Tue, 10 May 2022
 13:57:43 +0000
From: Zack Rusin <zackr@vmware.com>
To: "regressions@leemhuis.info" <regressions@leemhuis.info>
Subject: Re: 5.18 vmwgfx seems to break booting VirtualBox VMs
Thread-Topic: 5.18 vmwgfx seems to break booting VirtualBox VMs
Thread-Index: AQHYTYGHtZBezSHFMEi22ECSmBgwWKzqxK2AgCvHXICAAN5IAIAAts0AgAAWGgCAAAUNgIAADQ2AgAAFOgCAAAJHgA==
Date: Tue, 10 May 2022 13:57:43 +0000
Message-ID: <7f71e5d3ff625fd1ef5b33e5db1bff568c8272c0.camel@vmware.com>
References: <2bd4b06e-7577-d7d7-5f2e-264005b316a1@redhat.com>
 <84c30eb2dcdc330ea54aa1fedba9ae0eb0826068.camel@vmware.com>
 <087a0754-422c-0d88-a5ed-c03f2b5906c2@redhat.com>
 <41AD6A60-9C2C-4545-8A62-114B07C0383F@vmware.com>
 <3d8f7aa0-0846-436d-7fe1-e8f8af7eaff5@leemhuis.info>
 <5F7AE997-3B4A-4E62-A1F7-ADC80D4EE0DB@vmware.com>
 <ddf6eadd-c96f-f52c-55e8-7a2095c2d965@leemhuis.info>
 <1a406c301679d0311c63dffb1f2959660b21e6e5.camel@vmware.com>
 <236d9fca-8689-aa9a-ac25-b5696296b073@leemhuis.info>
In-Reply-To: <236d9fca-8689-aa9a-ac25-b5696296b073@leemhuis.info>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.0-1ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 473a0e41-cec9-4039-5f2e-08da328d0e4f
x-ms-traffictypediagnostic: CY4PR05MB3045:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <CY4PR05MB30452551214CD38570A2BBF6CEC99@CY4PR05MB3045.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tW2DlSNZYbWY0WhnMVXzjWN06SD/XCuePRadUBVdYmqwe4zeWjmAdj597GPPCcUJ4R47cgk9rhE+IPul1+kyMkMmBdca8LStQ2J+foc6U6qW2NTwP/LXpIgrlonhRTvvbp4WRSCS45/fWZ3PtoXzXUQhslMyJFPPVdp0pLpnux7x+rx/DvY+j50Tjs8s7ZpUMEB85KwPtrxy3gvmBjLXFletGE4SVmwN6vnLRRPbr4ax6g2fIYD4h25VG2ZVcV2mvr24/yntjGKEAfSzCNz2paW1aNlM8kQcU9hFpkseDLuny2D2C4exZqYmikGewHYwVSF1qE4bic83/BBDRQ2ap0SX21VvJJeSd+PAve3IhwwqXwqbW78Olo/Di6pkki87/CxBTwMLa86MHn0mjoafHlc83f8+WcohVLnKmyBnmdRujtO7nKOEblKKiDpQknw33NtV2+7/AcwK7SU6hKDn1t8NBFZf7fR7HW7/mWn1e5V+Cl2aCHyAcdHl7trX2Y2/pX+tHN5s2TKcW2cVy/5WmQCoty2o23ULa8O+qY+Tu9/JsluWOtnoHdIlVBB3BNa+ENSayIkvrrOO57Ilbsr73Gnha0ifjpxPzLQ0D0hv2rPBiZpKKdxsniAmFMQ96TB/kDigauB9OL63Nj28HobA7PcE/d0WdVBVSBg17W4nE2uIP6xz6TrCE2l7LxauP5gkuDofk++jxWgDj8Jqx1PQZfswJ8IJDEScxpGkxhT/CL2JojP9dnITVkZH7VgP9CrFQesjyyXyUEHCMDmV524Rvl0iSnCxil87FeV46I2mcsO6lqsnnUXF9A/0pjtgt7jS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(83380400001)(91956017)(316002)(122000001)(2616005)(36756003)(8936002)(76116006)(66946007)(66556008)(54906003)(64756008)(4326008)(6916009)(8676002)(66476007)(66446008)(38070700005)(38100700002)(966005)(6486002)(71200400001)(45080400002)(26005)(6512007)(107886003)(508600001)(2906002)(5660300002)(86362001)(6506007)(186003)(40753002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0ZCQUZDMlZlUFFZeUkydDcwNWsyWTg0VEJPTnllcjMyTWttYnlKbWYyTHox?=
 =?utf-8?B?WjJiRForS0hpcTBJbkxySVRHT1VFanNaNHNQUkpsVGREUjA5cmx0ZnJPWXA2?=
 =?utf-8?B?eG1iRWVrTU5CSUx2ZGtwTjd3M0wrVUY0QkxCYXlBNW9oMVB3QnlIWU1NQkdw?=
 =?utf-8?B?UzYxTGl4UzZWTUVRdVl3ZWRJaGNlYjRjSFp5U3hmVFVMRkZKVHQvaWtWSS92?=
 =?utf-8?B?aFV5dU5hamlDMVhmOVhiYm4xZzZUNUZrTmo2VUxYR1pxdGRMYWJQMDBNaTYr?=
 =?utf-8?B?eUE0RXZzQkQ5NlZaU3R4YjgzcThJV1pIN1pwV2JveXdDcjYzQTA4K1Y1d2Z6?=
 =?utf-8?B?MCtvMzlpWkhEV3VUV3pmQzJKN2VQeEpqTEhqLzZiZFk0QTFQbGN5YUFjTUh0?=
 =?utf-8?B?Q3AxZzJta2lxanBBQm03SzJUZWFDV3NSTkFtckJ4R21JWEthQUtqVHk0QXU3?=
 =?utf-8?B?YjJpTFNpL1pWU3dtQ05HbDNUQ2EzUE5VRWVjZnhScW80cjRLd1VxUVpORllS?=
 =?utf-8?B?d2Uxa2RacW9oVkJYSlhucTJQV0dvbzB0dTZ1QWIyNGxvRWZuVUwwTTRCSWd3?=
 =?utf-8?B?Y2QrNWtPTnBKK3VIU2dzQWhwT0xpekVLcDBsWTlRTzdWMldFWUh3dG5WZEMz?=
 =?utf-8?B?RytCUUdOQWdPMG1kS0VjbUJkV00reUdrSW1qUy9UL09GeXZ6a0JSSlBtMkFw?=
 =?utf-8?B?R1hReW9mUGZVTTBrQzZ3dUtSZlNPTzJSSmVaK3BLQjQ0Z3RsNnhMNzRsOTJ3?=
 =?utf-8?B?M1NUSk15Y3kyaDBaUWFyZ0dHV0ZpR2lncitiNVF5SUhiaFJPWU90ZFo2WjM1?=
 =?utf-8?B?V2RSOFBCRjhvN0lua2kvTDhwMjJQZ1lXNGVuQnBQb21DRHE4SVVKOEU4RHpl?=
 =?utf-8?B?MSswNTkwTlhRUEVGQkkxTWVNUHJaS1MzOHMvMmxrR3VGM0xGUm1tLzF4bDRi?=
 =?utf-8?B?Y1VzT0pzaFEwU3gxSEVKS1E5ckxPMnlQQnV6TjdGcTZKOHVtSFRudUt4UFNO?=
 =?utf-8?B?amFTaGhQY1ltZkZ4OW5uRitYRjFCcmNWQnh0TmRIS1dob0RRazBsQjBSSVp3?=
 =?utf-8?B?Q2ZnVllTQkVFeGFIRDNWNXBxcWw0SHdQNEIwOGNSK3JDWThnNUU2UHVkaGFo?=
 =?utf-8?B?eTVhRmozOTRxR0tTandZMjk2L1Bad1IxeXBiU1lYTUNBbGNjY2xMRUVuency?=
 =?utf-8?B?Y0x0Z25WbmgzRXRYNWZtY1YyTzEyTVlEV2dxZnhZYW01TXp4NXVPc29NamdX?=
 =?utf-8?B?VGh4Qlg3cHlqWUVVNWNMVmdHSWJ5M01DVnBURGZlckVNTWE4QTR0VkF0VzJY?=
 =?utf-8?B?ZjY5NEJDTU1DeXNOYVYyV0svS3VHWURvWm5lYWt6VGx5UlZoeGlZNWJUWWxt?=
 =?utf-8?B?dFU5TnM1ZHdLVzM1YnYrM0U4cGRuNGQwa3h3ZXZsWTlQOHZGOGJBQjNqbXhh?=
 =?utf-8?B?a1FXdXgvTE5MaTlQYUVXL3cyb0NYN3hNRVR2SFFEWGZUTWtMaXZaZHhIVElD?=
 =?utf-8?B?T0QzMzIzdTlZQ2VPd3V4a0hMVWIxbmJBdk9JQWhxdk13bkNiM0J4aVh3RGNv?=
 =?utf-8?B?aGY0cU5JUFhjWGtvUTJNV0o3TlhIU25zY2tlM3hiQyswMzhqczkvVEVjOVZK?=
 =?utf-8?B?djAxbi8wRG54QlpnMDNLa0JZNDdWZWdkdDhBdFNuY0tCMVRGS2JTMEFNR3ZN?=
 =?utf-8?B?S2VLaVpIYUpnb3pDT1IzUEl2ZlNDWWI0U2NXM3I2OU9WV3B5STJhR3V2OERv?=
 =?utf-8?B?WWtLekZzUWRsKzc0SWF1eFRBbmkvbFRyUkxsb1NJOFUvTXJnOWxocFp5eE5T?=
 =?utf-8?B?azJVWUxnMlNGL3JOK0tOVFhSZVRDa2RzMDUzeEIwbFhTZjlmUnJjNjVKS1l6?=
 =?utf-8?B?ZVdUdk5PL1FJbUk2Q3FrdFJUaFVnNWpqWFdPZjVhTmQ0b1Zld1l2NU4yYnQ2?=
 =?utf-8?B?bWlzUE42d29PbkJ1WjVGOTdsWmJMU3hUVHNOV1BQQmN0cHBNQkMrdlBKNGRL?=
 =?utf-8?B?RFR4TzdDR2IvMTlqY1dZU1ZzL1hrSi8yMGhOMzVweEhRTVhiVjVhV0JSa1Rq?=
 =?utf-8?B?b0c2ajdXWkx3MDBpNytIN2tPN21IT1B4U0s0L3U1TXgyOGpBVnowVStGRWFt?=
 =?utf-8?B?OC9Jck1IM29aaUp5LzM4aFZ2Vkc2elEwSThJc3VHVHNyNDlORmg5UWU3OHli?=
 =?utf-8?B?UG4wSWEzcWt5bFBkTFlZaHJYNFh4TXU1R0xkRmROeHJHWktLN2YzTzU1U2NY?=
 =?utf-8?B?cVlDSGhCNVdsQUQ4WDhweTVyanB2OElwZzFWbE1PSkcwbWY1UWZSVmtYMHc5?=
 =?utf-8?B?ZFJoL0lha1hKSnJINW5xRm5HN21uOW9VSUZNS0NhclVKbFpsWnlNUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8054B2D1D21E3548836533F9115C72DB@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 473a0e41-cec9-4039-5f2e-08da328d0e4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 13:57:43.8050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: erqjO1SC4cDNC6IyVUjMCJBh5gzGAJAACJBu0EMlCWBMNIBxXO7tSMju83ezkqDl4EFT1LGn2tKnnW9eZHhLRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR05MB3045
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
Cc: "hdegoede@redhat.com" <hdegoede@redhat.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTA1LTEwIGF0IDE1OjQ5ICswMjAwLCBUaG9yc3RlbiBMZWVtaHVpcyB3cm90
ZToNCj4gT24gMTAuMDUuMjIgMTU6MzAsIFphY2sgUnVzaW4gd3JvdGU6DQo+ID4gT24gVHVlLCAy
MDIyLTA1LTEwIGF0IDE0OjQ0ICswMjAwLCBUaG9yc3RlbiBMZWVtaHVpcyB3cm90ZToNCj4gPiA+
IE9uIDEwLjA1LjIyIDE0OjI2LCBaYWNrIFJ1c2luIHdyb3RlOg0KPiA+ID4gPiA+IE9uIE1heSAx
MCwgMjAyMiwgYXQgNzowNiBBTSwgVGhvcnN0ZW4gTGVlbWh1aXMNCj4gPiA+ID4gPiA8cmVncmVz
c2lvbnNAbGVlbWh1aXMuaW5mbz4gd3JvdGU6DQo+ID4gPiA+ID4gT24gMTAuMDUuMjIgMDI6MTIs
IFphY2sgUnVzaW4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+IE9uIE1heSA5LCAyMDIyLCBhdCA2OjU3
IEFNLCBIYW5zIGRlIEdvZWRlDQo+ID4gPiA+ID4gPiA+IDxoZGVnb2VkZUByZWRoYXQuY29tPg0K
PiA+ID4gPiA+ID4gPiB3cm90ZTogT24gNC8xMS8yMiAxNjoyNCwgWmFjayBSdXNpbiB3cm90ZToN
Cj4gPiA+ID4gPiA+ID4gPiBPbiBNb24sIDIwMjItMDQtMTEgYXQgMTA6NTIgKzAyMDAsIEhhbnMg
ZGUgR29lZGUgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+IEZl
ZG9yYSBoYXMgcmVjZWl2ZWQgYSBidWcgcmVwb3J0IGhlcmU6DQo+ID4gPiA+ID4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiA+ID4gPiA+IGh0dHBzOi8vbmFtMDQuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0
bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmJ1Z3ppbGxhLnJlZGhhdC5jb20lMkZzaG93X2J1
Zy5jZ2klM0ZpZCUzRDIwNzI1NTYmYW1wO2RhdGE9MDUlN0MwMSU3Q3phY2tyJTQwdm13YXJlLmNv
bSU3QzE4OTZmOGJlMTk3YTQ0NWU2YTk2MDhkYTMyOGJlYzE3JTdDYjM5MTM4Y2EzY2VlNGI0YWE0
ZDZjZDgzZDlkZDYyZjAlN0MwJTdDMCU3QzYzNzg3Nzg3MzgwNDM1NTMwMiU3Q1Vua25vd24lN0NU
V0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklr
MWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJTdDJTdDJTdDJmFtcDtzZGF0YT1ZbzU0SVdwWGo5
WEJ1NjhGTE8wSXhHNjFvU0NLa1VuVkQ1blhBOHNXMWc4JTNEJmFtcDtyZXNlcnZlZD0wDQo+ID4g
PiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gVGhhdCBGZWRvcmEgcmF3aGlkZSBWTXMgbm8gbG9uZ2VyIGJvb3QgdW5kZXIgdGhl
IFZpcnR1YWxCb3gNCj4gPiA+ID4gPiA+ID4gPiA+IGh5cGVydmlzb3IgYWZ0ZXIgdGhlIFZNIGhh
cyBiZWVuIHVwZGF0ZWQgdG8gYSA1LjE4LQ0KPiA+ID4gPiA+ID4gPiA+ID4gcmMjDQo+ID4gPiA+
ID4gPiA+ID4gPiBrZXJuZWwuDQo+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+
IFN3aXRjaGluZyB0aGUgZW11bGF0ZWQgR1BVIGZyb20gdm13YXJlZ2Z4IHRvDQo+ID4gPiA+ID4g
PiA+ID4gPiBWaXJ0dWFsQm94U1ZHQQ0KPiA+ID4gPiA+ID4gPiA+ID4gZml4ZXMgdGhpcywgc28g
dGhpcyBzZWVtcyB0byBiZSBhIHZtd2dmeCBkcml2ZXINCj4gPiA+ID4gPiA+ID4gPiA+IHJlZ3Jl
c3Npb24uDQo+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+IE5vdGUgSSd2ZSBu
b3QgaW52ZXN0aWdhdGVkL3JlcHJvZHVjZWQgdGhpcyBteXNlbGYgZHVlDQo+ID4gPiA+ID4gPiA+
ID4gPiB0bw0KPiA+ID4gPiA+ID4gPiA+ID4gLUVOT1RJTUUuDQo+ID4gPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiA+ID4gVGhhbmtzIGZvciBsZXR0aW5nIHVzIGtub3cuIFVuZm9ydHVuYXRlbHkg
d2UgZG8gbm90DQo+ID4gPiA+ID4gPiA+ID4gc3VwcG9ydA0KPiA+ID4gPiA+ID4gPiA+IHZtd2dm
eCBvbiBWaXJ0dWFsQm94LiBJJ2QgYmUgaGFwcHkgdG8gcmV2aWV3IHBhdGNoZXMNCj4gPiA+ID4g
PiA+ID4gPiByZWxhdGVkIHRvDQo+ID4gPiA+ID4gPiA+ID4gdGhpcywgYnV0IGl0J3MgdmVyeSB1
bmxpa2VseSB3ZSdkIGhhdmUgdG8gdGltZSB0byBsb29rDQo+ID4gPiA+ID4gPiA+ID4gYXQNCj4g
PiA+ID4gPiA+ID4gPiB0aGlzDQo+ID4gPiA+ID4gPiA+ID4gb3Vyc2VsdmVzLg0KPiA+ID4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+ID4gSSBzb21ld2hhdCB1bmRlcnN0YW5kIHdoZXJlIHlvdSBhcmUg
Y29taW5nIGZyb20sIGJ1dCB0aGlzDQo+ID4gPiA+ID4gPiA+IGlzDQo+ID4gPiA+ID4gPiA+IG5v
dCANCj4gPiA+ID4gPiA+ID4gaG93IHRoZSBrZXJuZWxzICJubyByZWdyZXNzaW9ucyIgcG9saWN5
IHdvcmtzLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEhhbnMsIG1hbnkgdGh4IGZvciB3cml0aW5n
IHlvdXIgbWFpbCwgSSBvbmNlIGludGVuZGVkIHRvDQo+ID4gPiA+ID4gd3JpdGUNCj4gPiA+ID4g
PiBzb21ldGhpbmcNCj4gPiA+ID4gPiBzaW1pbGFyLCBidXQgdGhlbiBmb3Jnb3QgYWJvdXQgaXQu
IDotLw0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBGb3IgdGhlIGVuZCB1c2VyIGEgcmVncmVz
c2lvbiBpcyBhIHJlZ3Jlc3Npb24gYW5kIGFzDQo+ID4gPiA+ID4gPiA+IG1haW50YWluZXJzIHdl
DQo+ID4gPiA+ID4gPiA+IGFyZSBzdXBwb3NlZCB0byBtYWtlIHN1cmUgYW55IHJlZ3Jlc3Npb25z
IG5vdGljZWQgYXJlDQo+ID4gPiA+ID4gPiA+IGZpeGVkDQo+ID4gPiA+ID4gPiA+IGJlZm9yZQ0K
PiA+ID4gPiA+ID4gPiBhIG5ldyBrZXJuZWwgaGl0cyBlbmQgdXNlcidzIHN5c3RlbXMuDQo+ID4g
PiA+ID4gPiANCj4gPiA+ID4gPiA+IEkgdGhpbmsgdGhlcmXigJlzIGEgbWlzdW5kZXJzdGFuZGlu
ZyBoZXJlIC0gdGhlIHZtd2dmeCBkcml2ZXINCj4gPiA+ID4gPiA+IG5ldmVyDQo+ID4gPiA+ID4g
PiBzdXBwb3J0ZWQgVmlydHVhbEJveC4gVmlydHVhbEJveCBpbXBsZW1lbnRhdGlvbiBvZiB0aGUg
c3ZnYQ0KPiA+ID4gPiA+ID4gZGV2aWNlDQo+ID4gPiA+ID4gPiBsYWNrcyBhIGJ1bmNoIG9mIGZl
YXR1cmVzLA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFdoaWNoIGZyb20gdGhlIGtlcm5lbCdzIHBv
aW50IG9mIHZpZXcgaXMgaXJyZWxldmFudC4gSWYgdGhlDQo+ID4gPiA+ID4gTGludXgNCj4gPiA+
ID4gPiBrZXJuZWwncyB2bXdnZnggZHJpdmVyIGV2ZXIgc3VwcG9ydGVkIHRoZSBWaXJ0dWFsQm94
DQo+ID4gPiA+ID4gaW1wbGVtZW50YXRpb24gdGhlbg0KPiA+ID4gPiA+IHRoaW5ncyBzaG91bGRu
J3QgcmVncmVzcyB3aXRoIGxhdGVyIHZlcnNpb25zLg0KPiA+ID4gPiBJdCBuZXZlciBkaWQuIHZt
d2dmeCBpcyBqdXN0IGEgZHJpdmVyIGZvciBWTXdhcmUncyBTVkdBIGRldmljZSwNCj4gPiA+ID4g
aXQNCj4gPiA+ID4gbmV2ZXIgc3VwcG9ydGVkIGFueXRoaW5nIGVsc2UuIA0KPiA+ID4gDQo+ID4g
PiBOb3cgSSdtIGN1cmlvdXMgYW5kIHdvdWxkIGxpa2UgdG8gdW5kZXJzdGFuZCB0aGUgaXNzdWUg
cHJvcGVybHksDQo+ID4gPiBpZg0KPiA+ID4geW91DQo+ID4gPiBoYXZlIGEgbWludXRlLiA6LUQN
Cj4gPiA+IA0KPiA+ID4gSSBkaWRuJ3QgbWVhbiAic3VwcG9ydGVkIiBhcyBpbiAib2ZmaWNpYWxs
eSBzdXBwb3J0ZWQiLCBJIG1lYW50DQo+ID4gPiBhcyBpbg0KPiA+ID4gIml0IHJhbiAoYXMgaW4g
YXV0b21hdGljYWxseSBib25kZWQpIG9uIFZpcnR1YWxCb3ggaW4gb25lIG9mIHRoZQ0KPiA+ID4g
bW9kZXMNCj4gPiA+IG9uZSBjb3VsZCBjb25maWd1cmUgaW4gVmlydHVhbEJveCBmb3IgdmlydHVh
bCBHUFUiLiBBbmQgdGhlDQo+ID4gPiBsYXR0ZXIgaXMNCj4gPiA+IHRoZSBjYXNlIGhlcmUgYWZh
aWNzLCBvciBpc24ndCBpdD8NCj4gPiANCj4gPiBJIHdvdWxkbid0IGtub3cgdGhhdC4gQnV0IGlm
IHRoZSBjbGFpbSBpcyB0aGF0IGFueW9uZSBseWluZyBhYm91dA0KPiA+IHRoZQ0KPiA+IHR5cGUg
b2YgZGV2aWNlIHRoZXkgYXJlIGNhbiBoaWphY2sgZGV2ZWxvcG1lbnQgdGhlbiB3ZSdsbCBuZWVk
DQo+ID4gTGludXMgdG8NCj4gPiBjbGFyaWZ5IHRoYXQsDQo+IA0KPiBGZWVsIGZyZWUgdG8gYXNr
LCBJIGRvdWJ0IHRoYXQgd2lsbCB3b3JrIG91dCwgYnV0IHllcywgaW4gdGhlIGVuZA0KPiBpdCdz
DQo+IExpbnVzIGRlY2lzaW9uLg0KPiANCj4gPiBpLmUuIGlmIEkgY3JlYXRlIGEgUENJIGRldmlj
ZSB0aGF0IGlkZW50aWZpZXMgaXRzZWxmIGFzIGENCj4gPiByYW5kb20gQU1EIEdQVQ0KPiANCj4g
VGhhdCdzIG5vdCB0aGUgY2FzZSBhbmQgdGh1cyBhIG1pc2xlYWRpbmcgZXhhbXBsZSBhZmFpY3Mu
DQoNCk5vLCB0aGF0J3MgZXhhY3RseSB0aGUgY2FzZS4gVmlydHVhbEJveCBsaWVzIGluIGl0cyBQ
Q0kgSUQgYW5kIGNsYWltcw0KdGhhdCBpdCdzIGEgVk13YXJlIFNWR0Egd2hlbiBpdCBjbGVhcmx5
IGlzbid0Lg0KDQp6DQoNCg==

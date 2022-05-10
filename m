Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8BF521858
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 15:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E531910F98E;
	Tue, 10 May 2022 13:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C0710F98E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 13:30:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgZq+foSDho3CCjGk8w9m+p6O3nRNuEkRui0kzsD1MRPfafK/v+uHNhGjYYX3aLFJeGEedIM2sbhgACvuZT4dtEWHU43Yyu9DhfzFefIp49ilxS61BwTGwN/YKNRBwVNytiqYHFwgfhNqK2ApjqerkTUnoZmvcq0ekP3YDWabCrcGQUmyG61efSpAGZG2Jwxh9Z8TLve5s7SGRi5t4N/TpVY5zF9LOsuhMiH5OVDCYb5z/ZW0Oy4eeLAG6CDLevYBPmWq36va0r1rGdhyRHhctDTwRohREwQmy9rlivihrsSwbO6q6ZYoezRpXLHhj3X2XjpGFSGDlO16cSnWwR+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wssLhKsmDygPVfn/c+Ysk/BuyBPjWZbWOZ0dKhdpEnE=;
 b=RgDHVcdT0dl6YfihPLb/0erwKNIE2lQ/A08WZx77vvEplM6E3YnH0ghof8T6ucABzKj55ovvKScAY9eNTrXrP3vQjPfhNjNCa3i1WyFOLhsC7HkgQXX/7nht2lM0alUPhf8yF/mxGGZy/GQ3JKpZDlejR3ePIrggKYX7j0esS8eyAafkjmL2ATiOSJRPAJrSPqYKyAsVY9409bSua4W1gcafN3sV9C4VrYyeJfFS0PyuasO4sefv9MfWB0bBH4WLsHKfQBYqQvC/CIMuMY2qiCxpdOFGWnBEe4gX5Ri1mwowHDMWQjo5lbLKGCqB2zTigwPBi3cHNC7U2e9f1A3oXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wssLhKsmDygPVfn/c+Ysk/BuyBPjWZbWOZ0dKhdpEnE=;
 b=1lZdOgEyMkRnhmjTzR+BuxhCn0uT01tW4uj9Ppf74MWJ7h7AFtdQJFeh9X3P07Or8nODSnpEacC/3apc7TWmv9oaOS7YillcJZTLlBxVg7XR+BqR1k8jOoc5qoJxRpn6UskmMAavywwGjrlgKLew+8Wk+oDTKrAZMRvlk1TACgM=
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by BN7PR05MB4273.namprd05.prod.outlook.com (2603:10b6:406:fd::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.12; Tue, 10 May
 2022 13:30:52 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::1105:32c5:7d56:5430]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::1105:32c5:7d56:5430%4]) with mapi id 15.20.5250.012; Tue, 10 May 2022
 13:30:52 +0000
From: Zack Rusin <zackr@vmware.com>
To: "regressions@leemhuis.info" <regressions@leemhuis.info>
Subject: Re: 5.18 vmwgfx seems to break booting VirtualBox VMs
Thread-Topic: 5.18 vmwgfx seems to break booting VirtualBox VMs
Thread-Index: AQHYTYGHtZBezSHFMEi22ECSmBgwWKzqxK2AgCvHXICAAN5IAIAAts0AgAAWGgCAAAUNgIAADQ2A
Date: Tue, 10 May 2022 13:30:52 +0000
Message-ID: <1a406c301679d0311c63dffb1f2959660b21e6e5.camel@vmware.com>
References: <2bd4b06e-7577-d7d7-5f2e-264005b316a1@redhat.com>
 <84c30eb2dcdc330ea54aa1fedba9ae0eb0826068.camel@vmware.com>
 <087a0754-422c-0d88-a5ed-c03f2b5906c2@redhat.com>
 <41AD6A60-9C2C-4545-8A62-114B07C0383F@vmware.com>
 <3d8f7aa0-0846-436d-7fe1-e8f8af7eaff5@leemhuis.info>
 <5F7AE997-3B4A-4E62-A1F7-ADC80D4EE0DB@vmware.com>
 <ddf6eadd-c96f-f52c-55e8-7a2095c2d965@leemhuis.info>
In-Reply-To: <ddf6eadd-c96f-f52c-55e8-7a2095c2d965@leemhuis.info>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.0-1ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 285fe7b9-0d15-452c-bcd7-08da32894dce
x-ms-traffictypediagnostic: BN7PR05MB4273:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <BN7PR05MB4273BA39EF15DA8D5182326ECEC99@BN7PR05MB4273.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xO75kCCrmJSuT0x0aIiujxMxGahRszP9wNyc7ITIGmE6I4v+M516PCwqXhriItVqNYQbDs6s0TxYbzEbxopPSonDVX2yix+2A91xurHX9imNmUBd6snRAga8/bERFO5/+5rpW/68Mloi7m5DGXc1FqwUbDC0DWPoIN/RMwqluLsQUPbsK1kCyqFtvrqtv6LA3muyJWr6EjQMI8wY46k0TCFAT7KKMdhV/E/E8ohcEbwn2XGuuaX4YBO2ZmBtNGLL5rzEAqkjVVGR8fq3+BvgP0yqPR8LpunIz1gzGzlErGbUamsJaiCuwrcKAg3bMesU5JSXe+MQZUpnQsh+WeWn85LATTM4bIsl7SJIk+E/S0hrUQrsTeo11zuVWuSerCNcGKX07T6YaYqFMO05UoG/lnNVgYjO4iBCP7E57yPTfm+3GOHUtTTs3nGItwmFOE9BYZq3Eai2MixJBErlu9aJC/sGy+HBHnS1dhxdsBNlZGTrjXBTuC77xyazh5apP0iPdIi+AbKFZh98CPeMWhGpYMcNTlVFX9DRgq3o+LjaI1jwmmdWIpI9kJFywgANRjYl+EMqKKsLQlV8OZUVWbIbzJ1GAXwnmV24aCjkkg4P4CAEEOocDFFmAhbBRmwTMx1CaCv20cDromvdUP8Q2/0lxYqvvJuY16JtsFBq+LbtpEivnKiXU53oUJULPdYAAW+Bcby60r3cgoyBbCTj01Q7v3RSuvKwgDvUv29MyABTdV+Hqd5ES0ED06+yLJ2rk2DLUKB3Yih4apaTck7tN9l+CtCchv3w58gbmp21MkAyW+gcf+aMjt/+0iieEvcYCuxm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(5660300002)(38100700002)(45080400002)(71200400001)(8936002)(38070700005)(508600001)(966005)(6486002)(316002)(6506007)(122000001)(53546011)(91956017)(66476007)(64756008)(66556008)(66946007)(76116006)(66446008)(6916009)(54906003)(8676002)(4326008)(83380400001)(186003)(36756003)(26005)(2616005)(107886003)(6512007)(2906002)(40753002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TE8xRjU3YlkrNHVmNXcrNTlLYXVCWHRIWTU4VHF0YWNaWlZ6YmFoczNDWlds?=
 =?utf-8?B?K0RpdkJ4b0c3dGc3ajhkS1dTcXkwaS9oMkhtdTZGTUdNRlJVeDY3aGpEN256?=
 =?utf-8?B?UThseEZPdjlDZTZTUzhNbFA0a1BFd2tjMDF2WjB3U0RiYnYrU3pzUGNCN1RL?=
 =?utf-8?B?eVZiQ0k4T1V2am0wVU10ekxqTmhHRko2bmM2aTdmYVhySUNzZUtQOElvWXNq?=
 =?utf-8?B?bFpmQ0JVWXhSUDFlZWhKalhWSjhFcURWdGVScVlHNFVPMVp1cktHeWdtMUR4?=
 =?utf-8?B?YzdzMEN6WTZUSm5PeVdQSzVSV1B0SVFoNGRhSm01SWRyM3FZTWhOaGR6VHlU?=
 =?utf-8?B?bnlsY2JBZ1l5cE1FWjNLUXRqUUxvOGFrU3dQMDdYbFU0eHpRUGk5TmU0SVlY?=
 =?utf-8?B?dTZvbmlxanY1RHppR0x2R0VIVTZZdDF2Y1M4V0Rtc0JFU1NnVEZlQXRsbWRM?=
 =?utf-8?B?RlVRVWM0ZklWNktBUjh2VjNsbGw0bnpGNXRaN0hwanVBZ0xZUXBDOHNBeERm?=
 =?utf-8?B?bUpCYXRLZENhd1VDQ1E1RjhIdWJQRWczazc0NUpNWGVXMXNRSHhvOTUwcWYz?=
 =?utf-8?B?VXhQSlF1d2VXclpWMmJlQkRjbjVBMXdMQjJwU2pTbmFhUFNwem1LY3Jhd2pT?=
 =?utf-8?B?YjhEOC83UUZiTGxXc2lBdFIvdVJKeWZWYUkwTER2K090N0d6NGNNdUxqQysv?=
 =?utf-8?B?T012dHVudTJhSCtVNHB2Zk9GeTVnMEJ5VnQ1TUJsdmY4aXZiOXd1RjM4Ri9I?=
 =?utf-8?B?WXRxSlZxZEc0bEZHK1oyS1hoQ2hWYzZISUQ1NFVVdVhnTnl1dXhFdWhQKzUx?=
 =?utf-8?B?aEhFQWluTjgrNXlQc0NXY3dyeFA2M2laMytTaUk1TkJ0Rm5xclM2ZjZJOFdn?=
 =?utf-8?B?ODBZeW1pQnVuUmxQOHNMNWZuV3NnSkdkK1JybjZRaktKWlVsdy9Yb3NaOTF1?=
 =?utf-8?B?WGxocy9JSWxra2wwckxNa3RvSzVUNExUYjBVQmMyaGRLRTJGUnJqd0V5QnNm?=
 =?utf-8?B?R1hpck1RZEVwSm5rL0s4bS9oYWxjNnlBN1pybEhDWDd3bjMvNnIxU0Z2SHpQ?=
 =?utf-8?B?WGxPdWFieVVHbzBwQ2prbC9GWjNqbW5aUW5hOURNeEV6aWF1aHA0WWU4QUNu?=
 =?utf-8?B?SUVZSUlVbzNQcUg5VGxKVXRuMGpRL3BnV05ITENDakYxQis1U1dzSXpCamJK?=
 =?utf-8?B?Tm1yYTJoMHdjRTlidElLQzc2UmZ1N0xlRktoV1BvMmpla1prK3V2ZEt3TkpR?=
 =?utf-8?B?QmF4Kzh5eUpMa0JuWFIwK2FLNklYajNtamZaaG9CYlVGMUhMLytCVTNNa013?=
 =?utf-8?B?cSsxK1QzWVRQaGw5aTFSOUsxZFRlR0RmYTJYMmtyTGpWcEc5QkREQ3NhSC9m?=
 =?utf-8?B?WXJEZUZEZVc4T0lyMFMvNHVYc0lwNGFaU0thc21KUkZ6S2FIRjVKaS8vMjVG?=
 =?utf-8?B?T3l1MkZLZnRJazZzV1BjbllqWVJ6WWVuTDVSS1p6N25EMzF3S01VV3VRM0Ns?=
 =?utf-8?B?cHExRklFY2hnaXdQcjR0TWJNK2Y3dlg0dy9wMFE1UktPaklzcFlIN04vb3hW?=
 =?utf-8?B?d25WSzdzQnRSRkgyK2lFYSsyVGs0VEZSSTdNR1FxNHdlZWFBV1JKSCszdjJN?=
 =?utf-8?B?Mkw5RzROTS9XVDFjVVp4YmJQdG9yU2Q2K3J4ZjJhVkJBOHR3SURjMktRbG9v?=
 =?utf-8?B?ZnE3djN5cUxXQnhOMHFFeVVMQzJMclRaYXdYY1hMY1BiUGllREozMFk5ZUtP?=
 =?utf-8?B?Rkl3VkhVMUhJbmVBakZtZUtuenpEcFVLM3RydXBvS0FBYU5TWHhPa2tpT09w?=
 =?utf-8?B?ckhqNFBqMEpYalFxall3c1RRVkt3VWdDTUdacnRmVWllZHZabXpGSlJ5S3BE?=
 =?utf-8?B?WE1menBRbmQwTThTTUM4SXpHMDBmd0l2SU1lRThwVFpiSEkyVEVSNUNNbWV0?=
 =?utf-8?B?TW5ZK3U3VTNSRHpvTkFyNXd3RSs1YnVlRHdYR0poSEUvZ2c3Z0lyeEQwWWd6?=
 =?utf-8?B?a1ZGSEo5cHZDa29LTTJaL1hnTTcvNyszZjlpNjV5MGgxVUU0ZkJqSitzMDN5?=
 =?utf-8?B?eWx6TDhkdXVOVDVueGlNQzZnQ0pQWFhXMGxTVjQ1TGNibFVndk9ueU9JMmZW?=
 =?utf-8?B?WjhVaTdvYjBBNU1keWl4RGd4cFQzT0xVUjcrSkUzd3FoOGVldjNTbzIyYUdM?=
 =?utf-8?B?RU1ZSUt5eUVNN25YRnNvaG5pcWMrczhrbkIzaWpTWmZqRG5oMXE5VnR6ekFS?=
 =?utf-8?B?QlNmckhEWWpnbnVCWmtvRXlCR0w3dFNwOStvWkxGWm85Q0JmK0c5c1pmY1ZD?=
 =?utf-8?B?QzZ0d05HWmwvclRuTTl3MEY1RG5JYzliR0VaeDZXdDFMK3JDV1JwUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDCE772B4132224A847F55E9528EC6E1@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 285fe7b9-0d15-452c-bcd7-08da32894dce
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 13:30:52.3024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uBoVpS2NuhOFqcLuw2bFXvQJILKZgFcCuZP35KwskCZdNhU8mBJSE3+pcoqX/yNGvCKi00tliVo0mHMXHzNn9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR05MB4273
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

T24gVHVlLCAyMDIyLTA1LTEwIGF0IDE0OjQ0ICswMjAwLCBUaG9yc3RlbiBMZWVtaHVpcyB3cm90
ZToNCj4gT24gMTAuMDUuMjIgMTQ6MjYsIFphY2sgUnVzaW4gd3JvdGU6DQo+ID4gPiBPbiBNYXkg
MTAsIDIwMjIsIGF0IDc6MDYgQU0sIFRob3JzdGVuIExlZW1odWlzDQo+ID4gPiA8cmVncmVzc2lv
bnNAbGVlbWh1aXMuaW5mbz4gd3JvdGU6DQo+ID4gPiBPbiAxMC4wNS4yMiAwMjoxMiwgWmFjayBS
dXNpbiB3cm90ZToNCj4gPiA+ID4gPiBPbiBNYXkgOSwgMjAyMiwgYXQgNjo1NyBBTSwgSGFucyBk
ZSBHb2VkZQ0KPiA+ID4gPiA+IDxoZGVnb2VkZUByZWRoYXQuY29tPg0KPiA+ID4gPiA+IHdyb3Rl
OiBPbiA0LzExLzIyIDE2OjI0LCBaYWNrIFJ1c2luIHdyb3RlOg0KPiA+ID4gPiA+ID4gT24gTW9u
LCAyMDIyLTA0LTExIGF0IDEwOjUyICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOg0KPiA+ID4g
PiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gRmVkb3JhIGhhcyByZWNlaXZlZCBhIGJ1ZyByZXBvcnQg
aGVyZToNCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IGh0dHBzOi8vbmFtMDQuc2FmZWxp
bmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmJ1Z3ppbGxhLnJl
ZGhhdC5jb20lMkZzaG93X2J1Zy5jZ2klM0ZpZCUzRDIwNzI1NTYmYW1wO2RhdGE9MDUlN0MwMSU3
Q3phY2tyJTQwdm13YXJlLmNvbSU3Q2I5MjI2YmIxMzY4ZTRmMzM2NzFhMDhkYTMyODJjODVkJTdD
YjM5MTM4Y2EzY2VlNGI0YWE0ZDZjZDgzZDlkZDYyZjAlN0MwJTdDMCU3QzYzNzg3NzgzNDU1OTY4
MTYzMCU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9p
VjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJTdDJTdDJTdDJmFt
cDtzZGF0YT11cUxncmMzZll3OTNxdTFHd2R2YzFZaENzRmplakF5JTJCNEIlMkJTZ0t6TGlsMCUz
RCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gPiA+IA0KPiA+ID4gVGhhdCBGZWRvcmEgcmF3aGlkZSBWTXMgbm8gbG9uZ2VyIGJvb3QgdW5k
ZXIgdGhlIFZpcnR1YWxCb3gNCj4gPiA+ID4gPiA+ID4gaHlwZXJ2aXNvciBhZnRlciB0aGUgVk0g
aGFzIGJlZW4gdXBkYXRlZCB0byBhIDUuMTgtcmMjDQo+ID4gPiA+ID4gPiA+IGtlcm5lbC4NCj4g
PiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IFN3aXRjaGluZyB0aGUgZW11bGF0ZWQgR1BVIGZy
b20gdm13YXJlZ2Z4IHRvDQo+ID4gPiA+ID4gPiA+IFZpcnR1YWxCb3hTVkdBDQo+ID4gPiA+ID4g
PiA+IGZpeGVzIHRoaXMsIHNvIHRoaXMgc2VlbXMgdG8gYmUgYSB2bXdnZnggZHJpdmVyDQo+ID4g
PiA+ID4gPiA+IHJlZ3Jlc3Npb24uDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBOb3Rl
IEkndmUgbm90IGludmVzdGlnYXRlZC9yZXByb2R1Y2VkIHRoaXMgbXlzZWxmIGR1ZSB0bw0KPiA+
ID4gPiA+ID4gPiAtRU5PVElNRS4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gVGhhbmtzIGZv
ciBsZXR0aW5nIHVzIGtub3cuIFVuZm9ydHVuYXRlbHkgd2UgZG8gbm90IHN1cHBvcnQNCj4gPiA+
ID4gPiA+IHZtd2dmeCBvbiBWaXJ0dWFsQm94LiBJJ2QgYmUgaGFwcHkgdG8gcmV2aWV3IHBhdGNo
ZXMNCj4gPiA+ID4gPiA+IHJlbGF0ZWQgdG8NCj4gPiA+ID4gPiA+IHRoaXMsIGJ1dCBpdCdzIHZl
cnkgdW5saWtlbHkgd2UnZCBoYXZlIHRvIHRpbWUgdG8gbG9vayBhdA0KPiA+ID4gPiA+ID4gdGhp
cw0KPiA+ID4gPiA+ID4gb3Vyc2VsdmVzLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEkgc29tZXdo
YXQgdW5kZXJzdGFuZCB3aGVyZSB5b3UgYXJlIGNvbWluZyBmcm9tLCBidXQgdGhpcyBpcw0KPiA+
ID4gPiA+IG5vdCANCj4gPiA+ID4gPiBob3cgdGhlIGtlcm5lbHMgIm5vIHJlZ3Jlc3Npb25zIiBw
b2xpY3kgd29ya3MuDQo+ID4gPiANCj4gPiA+IEhhbnMsIG1hbnkgdGh4IGZvciB3cml0aW5nIHlv
dXIgbWFpbCwgSSBvbmNlIGludGVuZGVkIHRvIHdyaXRlDQo+ID4gPiBzb21ldGhpbmcNCj4gPiA+
IHNpbWlsYXIsIGJ1dCB0aGVuIGZvcmdvdCBhYm91dCBpdC4gOi0vDQo+ID4gPiANCj4gPiA+ID4g
PiBGb3IgdGhlIGVuZCB1c2VyIGEgcmVncmVzc2lvbiBpcyBhIHJlZ3Jlc3Npb24gYW5kIGFzDQo+
ID4gPiA+ID4gbWFpbnRhaW5lcnMgd2UNCj4gPiA+ID4gPiBhcmUgc3VwcG9zZWQgdG8gbWFrZSBz
dXJlIGFueSByZWdyZXNzaW9ucyBub3RpY2VkIGFyZSBmaXhlZA0KPiA+ID4gPiA+IGJlZm9yZQ0K
PiA+ID4gPiA+IGEgbmV3IGtlcm5lbCBoaXRzIGVuZCB1c2VyJ3Mgc3lzdGVtcy4NCj4gPiA+ID4g
DQo+ID4gPiA+IEkgdGhpbmsgdGhlcmXigJlzIGEgbWlzdW5kZXJzdGFuZGluZyBoZXJlIC0gdGhl
IHZtd2dmeCBkcml2ZXINCj4gPiA+ID4gbmV2ZXINCj4gPiA+ID4gc3VwcG9ydGVkIFZpcnR1YWxC
b3guIFZpcnR1YWxCb3ggaW1wbGVtZW50YXRpb24gb2YgdGhlIHN2Z2ENCj4gPiA+ID4gZGV2aWNl
DQo+ID4gPiA+IGxhY2tzIGEgYnVuY2ggb2YgZmVhdHVyZXMsDQo+ID4gPiANCj4gPiA+IFdoaWNo
IGZyb20gdGhlIGtlcm5lbCdzIHBvaW50IG9mIHZpZXcgaXMgaXJyZWxldmFudC4gSWYgdGhlIExp
bnV4DQo+ID4gPiBrZXJuZWwncyB2bXdnZnggZHJpdmVyIGV2ZXIgc3VwcG9ydGVkIHRoZSBWaXJ0
dWFsQm94DQo+ID4gPiBpbXBsZW1lbnRhdGlvbiB0aGVuDQo+ID4gPiB0aGluZ3Mgc2hvdWxkbid0
IHJlZ3Jlc3Mgd2l0aCBsYXRlciB2ZXJzaW9ucy4NCj4gPiBJdCBuZXZlciBkaWQuIHZtd2dmeCBp
cyBqdXN0IGEgZHJpdmVyIGZvciBWTXdhcmUncyBTVkdBIGRldmljZSwgaXQNCj4gPiBuZXZlciBz
dXBwb3J0ZWQgYW55dGhpbmcgZWxzZS4gDQo+IA0KPiBOb3cgSSdtIGN1cmlvdXMgYW5kIHdvdWxk
IGxpa2UgdG8gdW5kZXJzdGFuZCB0aGUgaXNzdWUgcHJvcGVybHksIGlmDQo+IHlvdQ0KPiBoYXZl
IGEgbWludXRlLiA6LUQNCj4gDQo+IEkgZGlkbid0IG1lYW4gInN1cHBvcnRlZCIgYXMgaW4gIm9m
ZmljaWFsbHkgc3VwcG9ydGVkIiwgSSBtZWFudCBhcyBpbg0KPiAiaXQgcmFuIChhcyBpbiBhdXRv
bWF0aWNhbGx5IGJvbmRlZCkgb24gVmlydHVhbEJveCBpbiBvbmUgb2YgdGhlDQo+IG1vZGVzDQo+
IG9uZSBjb3VsZCBjb25maWd1cmUgaW4gVmlydHVhbEJveCBmb3IgdmlydHVhbCBHUFUiLiBBbmQg
dGhlIGxhdHRlciBpcw0KPiB0aGUgY2FzZSBoZXJlIGFmYWljcywgb3IgaXNuJ3QgaXQ/DQoNCkkg
d291bGRuJ3Qga25vdyB0aGF0LiBCdXQgaWYgdGhlIGNsYWltIGlzIHRoYXQgYW55b25lIGx5aW5n
IGFib3V0IHRoZQ0KdHlwZSBvZiBkZXZpY2UgdGhleSBhcmUgY2FuIGhpamFjayBkZXZlbG9wbWVu
dCB0aGVuIHdlJ2xsIG5lZWQgTGludXMgdG8NCmNsYXJpZnkgdGhhdCwgaS5lLiBpZiBJIGNyZWF0
ZSBhIFBDSSBkZXZpY2UgdGhhdCBpZGVudGlmaWVzIGl0c2VsZiBhcyBhDQpyYW5kb20gQU1EIEdQ
VSBhbmQgY3Jhc2hlcyBhcyBzb29uIHlvdSB0cnkgdG8gZG8gYW55IHJlZ2lzdGVyIGFjY2VzcyBp
cw0KQU1EIGdwdSBkcml2ZXIgZGV2ZWxvcG1lbnQgZG9uZSBub3c/IENsZWFybHkgYWRkaXRpb24g
b2YgYW55IEFNRCBncHUNCmRyaXZlciB3b3VsZCByZWdyZXNzIG15IGRldmljZS4NCg0Keg0K

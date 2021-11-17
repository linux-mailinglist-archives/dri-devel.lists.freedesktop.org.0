Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E78454176
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 07:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5576E49D;
	Wed, 17 Nov 2021 06:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2122.outbound.protection.outlook.com [40.107.255.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5073E6E49D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:55:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPd7K1vvfxiw37mbxR1vtbpCu8bPh6Fktql1Fcvowo4uvnh44n950eavwBxu3sZsHMb/5W7MTl0c9GevMtVeQmXYmAqBHFpIXG4XMjPJeyQg9Gr8sFPDpwIrmNVSrOIXbKnDLzJbIx7nzjPGPMbHbq0YzYvo4KzOoyJmgSU/WC5xQqqjrfoMzfVKnUHToByiKcX2D8zqvA0oCs+HUqr9ffVa9OR8RBgLkSCxq6JkDcbGcNsCnExXtSnKsb+f23+kkh01ihrt+AHWteCtqAGu//8LiNI/IMW6jOA9PxGQchWPiFA7Q2qIEMMwKM9f2gNj3VOgMRCh69qUChfXH7EXHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEtVItAk+m3zPDwdPi2NqD/7t4CS0DDJD076rj2oK5E=;
 b=mO5IqgpvAINHwU/NGvPzKtJfvtKvvk3L8wh6igmWBLKpsPdVG59FKDKJ3d1OiKRzZ5ESyPdv95WfHATpcNjxZYSHmO3Dq5+kpPSxGi7xgqYOqRFjPtS7zen54fyqjorALJZo8RzzXsPaj2UEjiG4gOnmdE6VXlqpuOe7j8QtIp84IqapmkZBCbbwersrZp9iySgzZzT5hXbqAfe+hnVwRuQ+YsHgtAS6pQmtYs0q+it91HRmAgQwM8g5gA6ZTk9JBal5N6DmmrOWm8q/y1BWSD9Kgkyvt9cvDLrYpUfZRrUHgQqxhZjBUcaEOnBVW/6DPMNkn5C4mUrmY9AoXWQj8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEtVItAk+m3zPDwdPi2NqD/7t4CS0DDJD076rj2oK5E=;
 b=Au1LnQ+k8Kk12K8FqRt/5oC04p2y0A6D2jxvbKPFqn4hPfd2y0KvHa9FpAFEGYeL1PFDS+1EB6WuyX2ltIYF3Py1Jttib5zSVMxwx0y/jvA2OaPV2GWXO/vs1N/DpMzptnxBTE/IHqWFSIl2RYBpFFIs5yFO5XFo13mNDcSlFROWuLtUAnutRrqxNBbrKxqUw6ddd/PoSYA5jfCxG6P8WlSTqrLMmTT8o2IV8tXO7L13LXAYc8IKQos95Fkhtct4/8D9bGswAzFTx8TYM0gZ+Dqd67k7BQuENiH6zjS9NehqkckrVr4G8MTaQC4upTUsQHCjaNSRq26IRnEMsfxEGA==
Received: from HK2PR0601MB2033.apcprd06.prod.outlook.com (2603:1096:202:8::16)
 by HK0PR06MB2627.apcprd06.prod.outlook.com (2603:1096:203:53::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 06:55:28 +0000
Received: from HK2PR0601MB2033.apcprd06.prod.outlook.com
 ([fe80::2979:fa3:bd14:dc6f]) by HK2PR0601MB2033.apcprd06.prod.outlook.com
 ([fe80::2979:fa3:bd14:dc6f%9]) with mapi id 15.20.4713.019; Wed, 17 Nov 2021
 06:55:27 +0000
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH v3 0/4] Add Aspeed AST2600 soc display support
Thread-Topic: [PATCH v3 0/4] Add Aspeed AST2600 soc display support
Thread-Index: AQHX23ZV3FbGLGPBb02J95IPEh0OCqwHO4IAgAAKprA=
Date: Wed, 17 Nov 2021 06:55:27 +0000
Message-ID: <HK2PR0601MB2033D57AED42522155074B96E19A9@HK2PR0601MB2033.apcprd06.prod.outlook.com>
References: <20211117054518.3555-1-tommy_huang@aspeedtech.com>
 <CACPK8XdUHZBAwcwT96Su+Fa_nenYSa75vCNpskh864Cvx04y8Q@mail.gmail.com>
In-Reply-To: <CACPK8XdUHZBAwcwT96Su+Fa_nenYSa75vCNpskh864Cvx04y8Q@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca467435-9c34-4975-cf6b-08d9a9973d05
x-ms-traffictypediagnostic: HK0PR06MB2627:
x-microsoft-antispam-prvs: <HK0PR06MB2627EB1B4248818A2AE41317E19A9@HK0PR06MB2627.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kPDImR6kC71rQ2blqDTaUe8lhpxxhjKYhjGpNOoGijSOsL2J7Lnk4SG7hjJlVw5SyjopjXN2NbuTnnva/epmy72sjz5aXO5T4UaLJvD1dNe+VGUqJt3mrEEDZpmxa2btAm0oXwcrPY+JC59uGMq7OJNI2d+WDMnhYN/MNR9i7X8iFBuJ6Tb98z1Yc9os2NYv8DM/ssFG7SD9E05jfn4Oz62k1liSZ4QFh7OesYwa4g8GZ2BHMMJyM0GcUaKyWGlwan4d31sKkW2fk40nq1GTPhP67P3+fgAZpfYnU1P6DNlBRzBtsIunDcBELqPV/DrHgKtSDB//A5o8dbGI5lvHyV5TftJgn+NaRkwqX9cQGtTvC9273gognEDS4LsQCqbs4zFjeAM7DPkvE3aJykRNqJGmmqAkfoLJ74l1WSa7H2ZVAKTuroDAiyGPQzfiuu8gOTGWmDasZmnt51yIQqXxMKHgc+vKjseujA+Gn+6QnTTBEcC2S0i+FSCktneSNBlX3tJWX4VXYTo2dJpCE8siebWJA6rvPq5Xgol251xkuKVi/WhXi4J4rOYe60eQbrvreNMC7M66QEglShbpXrK2518PxDYy3llLHWSPFnXAe1HZbWWkbr5w51kjzk8bBJbUfmvkQHirwXhBjF/LNT+819SMqEqrysKqUvgLKeg52G9/XciIIy+zBekuMPS7z9jGnfMIE5XxB1Qp8u1XylkzfQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR0601MB2033.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39850400004)(396003)(376002)(346002)(8936002)(38070700005)(33656002)(122000001)(186003)(66446008)(55016002)(38100700002)(4326008)(76116006)(66946007)(66476007)(64756008)(316002)(66556008)(2906002)(8676002)(83380400001)(107886003)(6506007)(53546011)(7416002)(5660300002)(6916009)(52536014)(7696005)(508600001)(71200400001)(9686003)(86362001)(26005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3BRanNCelNuZ2hTNVJ2T29taDZIUmJwY3Y1Rll4YVg4UlE3VGNHZWFFei9X?=
 =?utf-8?B?SkVZOGJRS3dHaytqNUFCUmJBOVNHRzhod0ExUGZ6SVBKUVJwM3RpRjlhUWUx?=
 =?utf-8?B?aFl4cUpuQVhBVnJDTW5MdjM5N2ZJWlVQLzdvVWw1MmlQM1hTcEt5bVRpMHhF?=
 =?utf-8?B?NXVHNnl4VU40YmF1RGY1UkpMUFBvVjFCNEVIQW5mUWlHQXk0SGJVZzhKZllT?=
 =?utf-8?B?Z2NpejNqVWg5WHg5QWtnU3hHL3hWMnpDVlFnM284ZG5nM0lGWlh1NGVraDRT?=
 =?utf-8?B?WXdGUG9OZ2RzUEs5YUs3QjNxTHhPUzdGRXI4bTI3V1lkVURJU254bHlrNGpG?=
 =?utf-8?B?WEtVVUJad3loY0o4TUhlSlpLQkRRRUxmT3pvT3Brbm5oaVQvY255WnpyY24r?=
 =?utf-8?B?TEwxNEk3bUE1QlpyUE1yeTViM0xCSW1ybllBUVZ2VXdXckVLaXc5TFZPS0hk?=
 =?utf-8?B?OCtLQ0I1emF6YU9rbEF5R3V5QU81U3NYMmhOVzdOdm5Yb2c3T0hnTnB4emQ0?=
 =?utf-8?B?OHFCNjV4MmNTazNFNmxFQVgvcFhSMjkvWFU1Ukp1THQzQ2pzTGdvclNFMURz?=
 =?utf-8?B?dzQrT1hLaDJUeFJCOHNSbkpNTzJyNDBmMEFBVkt3NCtmQ1kvMTVGL0dTUW9y?=
 =?utf-8?B?Ylg1YW1hVmhwS0V4Qm52bWoxcll0d3dUbW8rbDJIUG8vZlRkTUNOSzdQUHcz?=
 =?utf-8?B?eUNtT3ppVEpGZ0hkbnQvQ3U5NzFoVkdibjRtVjEyOE4vck9hZFJ3NjFLdjVq?=
 =?utf-8?B?aHM2UXc5S1B5RnpSN2tDUm9ESDlENW0zZ2tJR0N0a0lmako3VGkwRzBaeUFU?=
 =?utf-8?B?NlJqbE84UjBCRlp0SlNSZGxEdGpVajMyYkt3S2JKY1htM25wbUc4MFdJSDNL?=
 =?utf-8?B?emw3ME5BYy82TVdmVmUwcDNqN2x4aXZMaVkwMnZmUTQ5MjdlMEpiSk1zQ2s0?=
 =?utf-8?B?NDFTSHdrMkVCai9nU25DTTltK1l0U1lkbkJzUWZqZm1vQUxqemE5aEhUU3NX?=
 =?utf-8?B?eUQ4ZktMRFp4ckJrMHVYOXUyWlhIblBlUXI0TzVLcDRGYTVmVmlVSXRuWkc0?=
 =?utf-8?B?eWlQK2VBYWVtZkxtTHhQbXR1QW5EUTEwZkdxSVlmZFVFQlN6UERGQVZhdC9j?=
 =?utf-8?B?eUczVldvTGVxbDZSZWFDdFBHd0h1QVpscE9Wd2g4Q3pPeGZ3Y0RmZnNRTk1z?=
 =?utf-8?B?SE5XcWpmZ0pNaGZnUGdTdU1OZHNjUEJjWDE4Z3p5WStwUUpUYVhqRHNIWnJV?=
 =?utf-8?B?bkpyQmtOR2xFMjlncWNBYmN5dU84OTM4YU5VY3U1Z0U0MUVBUlNMUnhGSmxk?=
 =?utf-8?B?a01wU0Y1bjREMGdrM2Q4VjNvOWs0NE9hNlc5bEdKWVRMRVFKZ0dONUNmdTNr?=
 =?utf-8?B?eTd4eEdrdjZxVXgvU0ZlVXZLREZoc1RHM2FjVjNiN09udk13Z3QyanZjTXp5?=
 =?utf-8?B?SlZPdk1VZlBnQ200SXpQZ0hRR25LdjlNcElSeTNYVWlkbFlnZkJXSTVuSUNO?=
 =?utf-8?B?MG50MjlwaktXWTMwbHBsRHdHNFcvdHNpS1ovdFlxZkdhNVNqQ3pxaWtOeXJt?=
 =?utf-8?B?UmNnZkcvOWhZUGMwSzJBMkphOXFpWlFwV3lqb01iSGFmSmlQcTlZRkdDRkF2?=
 =?utf-8?B?ZEpSWVE0YWVUYW91Wjl2VnBDWDB3dDQ4TUxmaVVISVlDNHhHVFVZeXJsVGlF?=
 =?utf-8?B?bFdrdkxwOW1rdTIrTXk5dWJnaVM1d1RIWHU5eSt6eXVxNXZTTzk0ZnJiUFVi?=
 =?utf-8?B?ZFFxa2lWNlliS2ZrUThKL2RYenE4OFd1Q1lEeENyRE1sQk05SkEwQlVvQmhQ?=
 =?utf-8?B?NEJFVFdpNi9PWGZGOUIrM2JOMU02S0VlSWgwRzdJWnpZRVlBUTlnRExURFZH?=
 =?utf-8?B?Q1VuVmNVQzVrbnVvK3d1NEVZcDNranZ0TzZmMTRLZGlDNmptUXgwMXQwZDlK?=
 =?utf-8?B?YU5tUUV1cm5uUVZ3MEZWOGpuYjhWNWJCVEVNODFlVnBhQXpUUEoxb1UyYWJ3?=
 =?utf-8?B?N1ZyZmJWeEp6Zy8wcEZsUmtEdDlRaGNKdGtyYlpCMWxHMmJNRmhUYkZmc3Rs?=
 =?utf-8?B?NjJoays1dlo4YW1UcjB1NEZ3M0M2STNqU3YyNk81QllhTkRNMzE0dDRGU2Nt?=
 =?utf-8?B?TGdYMmx2KysxcjAvSzd6cVdUcno3QzFPNXJrU3Z3UXJtdGR6bTlZaWF4NTEx?=
 =?utf-8?B?ekVKYzhnclRnR01CdjcxMVgwbXBKTnpIRXAxdy9DTy9WeTh0dHl1SU5RVVZz?=
 =?utf-8?B?NUJTSERzR2RSQzNRTnE1WFo0V1ZBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR0601MB2033.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca467435-9c34-4975-cf6b-08d9a9973d05
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 06:55:27.5583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 80aX5Rjj0AiHjUZx1jzlY29uxTSR+tTykfHiyVVRoCT6/P0FVY/6fpPxkIh/UGADcxdjQFBuuR2Vx3gBRaGa7J3TnLbSGvhqcaIH8/rfiZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2627
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9lbCwNCg0KCUdvdCBpdC4gSSB3aWxsIGNoYW5nZSB1c2VyIG5hbWUgZm9yIG5leHQgcGF0
Y2ggc2VuZC4NCg0KCVRoZSBhc3QyNjAwIGlzIHRlc3RlZCBvbiBteSBwbGF0Zm9ybS4NCglBbmQg
SSB3aWxsIHRyeSB0aGlzIG9uIHRoZSBhc3QyNTAwLg0KCUJlbG93IGlzIHRlc3Rpbmcgc3RlcHM6
DQoNCgkxLiBBcHBseSB0aGUgcGF0Y2ggaW50byBwcm9qZWN0Lg0KCTIuIEFkZCBiZWxvdyBjb25m
aWcgZm9yIFZUIGFuZCBMT0dPIG9uLg0KDQoJQ09ORklHX1RUWT15DQoJQ09ORklHX1ZUPXkNCglD
T05GSUdfQ09OU09MRV9UUkFOU0xBVElPTlM9eQ0KCUNPTkZJR19WVF9DT05TT0xFPXkNCglDT05G
SUdfVlRfQ09OU09MRV9TTEVFUD15DQoJQ09ORklHX0hXX0NPTlNPTEU9eQ0KCUNPTkZJR19WVF9I
V19DT05TT0xFX0JJTkRJTkc9eQ0KCUNPTkZJR19VTklYOThfUFRZUz15DQoJQ09ORklHX0xESVND
X0FVVE9MT0FEPXkNCglDT05GSUdfREVWTUVNPXkNCglDT05GSUdfRFVNTVlfQ09OU09MRT15DQoJ
Q09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEU9eQ0KCUNPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xF
X0RFVEVDVF9QUklNQVJZPXkNCglDT05GSUdfTE9HTz15DQoJQ09ORklHX0xPR09fTElOVVhfQ0xV
VDIyND15DQoNCgkzLiBUaGUgTGludXggbG9nbyB3aWxsIGJlIHNob3duIG9uIHRoZSBzY3JlZW4s
IHdoZW4gdGhlIEJNQyBib290IGluIExpbnV4Lg0KDQoJVGhhbmtzLA0KDQoJQnkgVG9tbXkNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9lbCBTdGFubGV5IDxqb2VsQGpt
cy5pZC5hdT4NCj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAxNywgMjAyMSAyOjA2IFBNDQo+
IFRvOiBUb21teSBIdWFuZyA8dG9tbXlfaHVhbmdAYXNwZWVkdGVjaC5jb20+DQo+IENjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+OyBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+OyBSb2INCj4gSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgQW5kcmV3IEplZmZlcnkg
PGFuZHJld0Bhai5pZC5hdT47DQo+IGxpbnV4LWFzcGVlZCA8bGludXgtYXNwZWVkQGxpc3RzLm96
bGFicy5vcmc+OyBvcGVuIGxpc3Q6RFJNIERSSVZFUlMNCj4gPGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc+OyBkZXZpY2V0cmVlIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz47DQo+
IExpbnV4IEFSTSA8bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPjsgTGludXgg
S2VybmVsIE1haWxpbmcgTGlzdA0KPiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IEJN
Qy1TVyA8Qk1DLVNXQGFzcGVlZHRlY2guY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDAv
NF0gQWRkIEFzcGVlZCBBU1QyNjAwIHNvYyBkaXNwbGF5IHN1cHBvcnQNCj4gDQo+IE9uIFdlZCwg
MTcgTm92IDIwMjEgYXQgMDU6NDUsIHRvbW15LWh1YW5nDQo+IDx0b21teV9odWFuZ0Bhc3BlZWR0
ZWNoLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiB2MzoNCj4gPiAgIFJlZmluZSB0aGUgcGF0Y2ggZm9y
IGNsZWFyIHNlcGFyYXRlIHB1cnBvc2UuDQo+ID4gICBTa2lwIHRvIHNlbmQgZGV2aWNldHJlZSBw
YXRjaA0KPiANCj4gVGhhbmtzIFRvbW15LiBBIGZldyB0aGluZ3M6DQo+IA0KPiAgLSBTZXQgdXAg
eW91ciBhdXRob3JzaGlwIGluIGdpdDoNCj4gDQo+ICBnaXQgY29uZmlnIC0tZ2xvYmFsIHVzZXIu
bmFtZSAiVG9tbXkgSGF1bmciDQo+IA0KPiAtIFRoZSAiQWRkIEFTVDI2MDAgY2hpcCBzdXBwb3J0
IiBwYXRjaCBpcyB0aGUgc2FtZSBhcyB0aGUgb25lIEkgc2VudCwgeW91IGNhbg0KPiBwdXQgbWlu
ZSBiYWNrIGluIHlvdXIgc2VyaWVzIG5vdw0KPiANCj4gLSBXZSBzaG91bGQgYWRkIGEgZGV2aWNl
IHRyZWUgYmluZGluZ3MgZG9jdW1lbnQNCj4gDQo+IENhbiB5b3UgY29uZmlybSB5b3UgdGVzdGVk
IHRoZXNlIGNoYW5nZXMgb24gYm90aCB0aGUgYXN0MjUwMCBhbmQgdGhlDQo+IGFzdDI2MDA/IEhv
dyBkaWQgeW91IHRlc3Q/DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBKb2VsDQo+IA0KPiANCj4gPg0K
PiA+IHYyOg0KPiA+ICAgUmVtb3ZlIHNvbWUgdW5uZWNlc3NhcnkgcGF0Y2guDQo+ID4gICBSZWZp
bmUgZm9yIHJldml3ZXIgcmVxdWVzdC4NCj4gPg0KPiA+IHYxOg0KPiA+ICAgRmlyc3QgYWRkIHBh
dGNoLg0KPiA+DQo+ID4gSm9lbCBTdGFubGV5ICgyKToNCj4gPiAgIEFSTTogZHRzOiBhc3BlZWQ6
IEFkZCBHRlggbm9kZSB0byBBU1QyNjAwDQo+ID4gICBBUk06IGR0czogYXNwZWVkOiBhc3QyNjAw
LWV2YjogRW5hYmxlIEdGWCBkZXZpY2UNCj4gPg0KPiA+IHRvbW15LWh1YW5nICgyKToNCj4gPiAg
IGRybS9hc3BlZWQ6IFVwZGF0ZSBJTlRSX1NUUyBoYW5kbGluZw0KPiA+ICAgZHJtL2FzcGVlZDog
QWRkIEFTVDI2MDAgY2hpcCBzdXBwb3J0DQo+ID4NCj4gPiAgYXJjaC9hcm0vYm9vdC9kdHMvYXNw
ZWVkLWFzdDI2MDAtZXZiLmR0cyB8IDE4ICsrKysrKysrKysrKysrKysrKw0KPiA+ICBhcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQtZzYuZHRzaSAgICAgICAgIHwgMTEgKysrKysrKysrKysNCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL2FzcGVlZC9hc3BlZWRfZ2Z4LmggICAgICB8ICAxICsNCj4gPiAgZHJp
dmVycy9ncHUvZHJtL2FzcGVlZC9hc3BlZWRfZ2Z4X2Rydi5jICB8IDE1ICsrKysrKysrKysrKysr
LQ0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gPg0KPiA+IC0tDQo+ID4gMi4xNy4xDQo+ID4NCg==

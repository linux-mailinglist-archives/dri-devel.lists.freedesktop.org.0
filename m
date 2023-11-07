Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B30EE7E48EE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 20:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8940E10E65E;
	Tue,  7 Nov 2023 19:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF0910E65E;
 Tue,  7 Nov 2023 19:02:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMnVXTSTkv5uhwuFQYr404GtxZFmHLAWsnl4MUJgK576GdgSB3YlGM3QDlUI1Bsvo72KCkG9XhbD/Ayerqkb4dJFIJji3qk2clUb6QDt95WQKEh8G3Jot0QncaNXqT+1NbfKpUPQiWi9eK4us5wffaaFkoTocFwvtG69FBD3ioopGsCwvhvqBPhAkFNjGqSlm5/l6ZmfapILIzFU0wehIFa172rqJSxqZJYJ9eG43LB1z6TJe5hF3QZTnTN5+3/uDrZL+MWj8gk+93TBNkqErgpDKtVQ2Jp+8/G8c6abS8kfzg9xTswnGtJGe3QWCeEpEqey6sd927c3C7+liRi0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfrwG+RfBUN0GYY96Jwsp0RDKfckdITH0swG3OYBHBM=;
 b=Dug4eTnmIWBc6MyTrH1lLoBKkT9TjNq+R5btL8XBKGDCaPK3cMISV+/Fu+65UpDHSyTmjAHwUd1W9C6IL+SqLXhuyrFZ4Amchd8bVwCroNb3svgP3uUm9OdhRQTNPE9xMgwECUPeaxZTZSfPRIijjzaUbNyhIv91TORqdoCyZrr8Ea4UXZktgnzJUv8nIkbY8Ke/armMLOdcXiYG0+iMySJWW3qgF6HMygCql0PAUujRb3HuAJuz2+IMr7lUQfY7diBh3tRn43CF2kP1AlLjFv4pZp6gdxQp4wRxU8q48W00BL6TMxBQyI4u0esD8q4ZGWaUioXq0n/39UnXWrzLuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfrwG+RfBUN0GYY96Jwsp0RDKfckdITH0swG3OYBHBM=;
 b=iUL6WVmZn//AFIP8iLXP4ADsgIUS0kC4aqLz5d25ZLhrjwreRVeJ0liWqQk1nbKA4Kmx6rvP9vrhFicpiQcdKyiGZPmkKg5vGzfENbBSli4VGk8HKmDsv9iXgktZODQ6ylTvzj9EWutvnu/0mS4JF2JJvX9jElZS1cG+dYIzOrckN4VVKATMbfLd8+trRpC6P6BXl/yId6JLqxt4f9V9eVs7FJo7g4jVzbsQ16TeX0/U9oORnpasDWksgC3qLN27V+4s7n8siopFLNSXpzEK7ctnKSXEFMLLrriAIKQIIHHAT16mASEIcnhdYBayhMNegdb7UEcSlA6EohDmno1DPw==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by CY5PR12MB6479.namprd12.prod.outlook.com (2603:10b6:930:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Tue, 7 Nov
 2023 19:02:45 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 19:02:45 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [Nouveau] [PATCH 3/3] nouveau/gsp: add some basic registry
 entries.
Thread-Topic: [Nouveau] [PATCH 3/3] nouveau/gsp: add some basic registry
 entries.
Thread-Index: AQHaC7nrqx09z4mpykGvaUaC4Zd97LBvP0CAgAAA+ICAAAJOAA==
Date: Tue, 7 Nov 2023 19:02:45 +0000
Message-ID: <769bb600f28f24d4bf9251e36fd3b13dba50d928.camel@nvidia.com>
References: <20231031051943.1957328-1-airlied@gmail.com>
 <20231031051943.1957328-4-airlied@gmail.com>
 <5b0b5a7fefa8aac31659e7ade0811f835c576511.camel@nvidia.com>
 <CAPM=9tyvAPf2iNZ6utEN9FuE_wo17u4D9uCMXJSd0+w3VPHcLw@mail.gmail.com>
In-Reply-To: <CAPM=9tyvAPf2iNZ6utEN9FuE_wo17u4D9uCMXJSd0+w3VPHcLw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|CY5PR12MB6479:EE_
x-ms-office365-filtering-correlation-id: 688a05fa-93cb-42a9-6977-08dbdfc4205d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QxFAbHTvBiedqCv2K4M1bukyd5OK+nWCE9OO21l11FCtvjmuv3w8i9OVxiQH4JA2towh9guIORtzYtMr/ybN2jAt+UOX/DCjXS7Eg/TxN74d1WR6D16W/50UQoUq/J+qFGMNGZWhT9Dx0PQ+J98DUp2cJqsBhG4sL3oQpLuD0832g7tZyDDabu96uFS1yr+e+64sEXiS4CURLkVXOYKgwohbNz5Ty4Z2turUY6SeTLS95u4P0TxlxVoeuAtuLwhGrciD1TSZubo9rN7/P2E5HvDGwoFG0jkhipOqPRP72oXneTLek+MR+NaoYSHwP7hc7aiaAysXTEMZRC637CkbjslAjYE2vPyDhjZFiitIpO8hSILB/hPFoOo6CjdHBOXXBXL3Wp3kngQah0kFJ5MH+NF45XYlT2EOrXBcYQDjB9A+eueQmf5j8u1cFrZeT9eU01xHrV/1U0lyoE97AvMOlclNQ+Z23u4exucI92ImklLte66lrbnSMOcyhSy9vmXiH7wqfPLk2aRD/soZb9vQX4yCozLrVhEylik8CRv7rIXwhHJV73grMM7oz/Nn0hMk22F32Lgylo7sgrRVsp+YumIPEnIB4T7fAS3Fg2d4XaMXJVDQIfQcVA4oY7ITjNhP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(396003)(346002)(376002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(6512007)(71200400001)(6506007)(26005)(2616005)(54906003)(76116006)(316002)(6916009)(66446008)(478600001)(66476007)(38100700002)(66556008)(4326008)(8936002)(36756003)(66946007)(8676002)(2906002)(122000001)(558084003)(41300700001)(5660300002)(86362001)(64756008)(6486002)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTZnU1lBcVV4Rmc2M1VNMTNqRDRMamdadk5zYW5NeXFsNzR4MHMwbFkxOWI0?=
 =?utf-8?B?VUhYUGthNFVxT1NHRXkwQWJSRGhBZzhwL3loSXJ2OVNFb29aU1Ercnd1YkVF?=
 =?utf-8?B?azlvTHJGMEp3ZFg1UFpZVHJxWUxvYkwxRnVrL0tJMTM1Rmx4NmFVTWFuQ2VB?=
 =?utf-8?B?SDNiVmI3WFJsSXdva2NFRzF5YTc2SGRMM2dRRFJUaVI0N0FsVmFYbHoreVBj?=
 =?utf-8?B?dnBQV1JJSmJNemVIQkUwK25TeTZobkdTOFJGYnhyUmRiLytaMVFQN1IvYUtk?=
 =?utf-8?B?VVNaMFl4NEl5clRKTEt1TkxLRzZPSUR5Z0VWRDJjVUtSV0VyTVY3clVKMmtE?=
 =?utf-8?B?SlhkTlRmbGVrdGJEQktuUFZvZllmOXNCMnZ2Z3NVTmFqZW5RMGgvc2M0NVZR?=
 =?utf-8?B?UjZVWjBjU1ZIWFpQSUhNQ3ZrOXRXYkx5THJDaWhOdHNPVFhKVS9yQXlIWU56?=
 =?utf-8?B?TjN0T0lKNkdyVVNpSWRheVpFWEl0L29ja0lzSDhpNFEvVmFlamRRTTNsMG5B?=
 =?utf-8?B?b1ZZeDJObkNBMUtpTk40WlU4dmlGVDVZV1dHSU5Yc0ZzNUdWSXFKSk54RzZK?=
 =?utf-8?B?Q1VpOGhMUkhvaTNTNk8xSC9vNWxMWGVTMlJmNS9xK3hJS2VPQm9HRFcxMlVD?=
 =?utf-8?B?RStiNGJBaldHMTN2V3hpdnM3RkZ2YUZ3VkwySEVKYnlUb0p5bko3SjJVaFIz?=
 =?utf-8?B?Y1JrdDR0NDZmU1JsRmpTMTNhaDZzTHBsWGRvdnhTU0RzbTdnQVU1L1puMjNC?=
 =?utf-8?B?VG16UEJhbS9teDQyN3dtZnZwam5yaE5TcHV0ZTFxaHJDdkNZdnEybHJRa2Q4?=
 =?utf-8?B?STZJK09NcUNnVWk0VWJtSXFWVWRLM0xmYlhxTkRtQm4ycTFWdy9GeGpEZUJU?=
 =?utf-8?B?NS9FRENYbUFOcFR3Q3hlMzVYSTcvMFZYTDRXam8yTVI2QTVXcFdNcVBQYk5m?=
 =?utf-8?B?bk5VcXJrQ1JsMUFnR0gwMDNDWWFzZk5wMUhZTThZVXhEajNUOHd1Qno2Y2gz?=
 =?utf-8?B?RkxJVVYySFh5UG5jWWlLK21wSUtYODVnLzVvcVJROG9ZUDZHK2pRUUIyV2hu?=
 =?utf-8?B?RFI1NTV1RzFaNHQzYnJpTWtTZXBzMVF4Yjh5R042S3dsd1hYQmEvYTE2azlF?=
 =?utf-8?B?YUVWR3E2MXllZE9BdmVVK3BOcWZ6WVRSMmk1YUFIeEFQcUIyUXJiUnhrT1N4?=
 =?utf-8?B?Z1pzR2tWTmhYVVFEeXdHLy9oVWNDOVB2YXUrdlVFZVNSUW02N0tadDhtcVZn?=
 =?utf-8?B?a3Z3TVlKb0xjVlJXU2FVczlYSzE4ZWVEYjM3amtTN1RMRVg2UEZMSzBBa2xm?=
 =?utf-8?B?ZVVxOHIzT3RqcnpCREg5TGFzNCtFRUlNMGtJaDRqS1ZJTVBCYVRIS3Vidklo?=
 =?utf-8?B?OElyNElFSlZqVTZldVZ3WFpWS0t5L0xFZ1R0cDRnWDhpTlpMSXhmYWhnWFlQ?=
 =?utf-8?B?THlGbEQzWmRtcTYvQkowSkFzTGZJWGEyWXZJaWNSZ0FlVGE1TkJMV0t4SmpV?=
 =?utf-8?B?UXZtbDcwc1M2UWJEazBjVUdiM0dQbGNNZFBZSzQzb1EvdzY2WnpBenlZalN2?=
 =?utf-8?B?N2JMbFovQlFwcUxWNFM4S3FLUE84ZGJ5VUpLeFFDanYyZ1FNYmlXZmxXU1h2?=
 =?utf-8?B?dkdqbndxN3R4VDc4YkdLYzBtWmlHVURlQXZ0MVZRRXFsRHZRTVR6aWFFZi9Y?=
 =?utf-8?B?WllSazQ2blY4Um4rTUhqMWxsUnpGTFRvdnlZd291WmgzVjZOdDZVckFMRVVH?=
 =?utf-8?B?emtCZlFacUMySXVjTjNMWnZJNXdta1BDeUlydldZUnEzcDR4N3hSb0FOL3N1?=
 =?utf-8?B?QVc4QVpIOTRvekhaLzlqNEZiSlhjZFgxSnZHL2sreEQ0cE9wUUsxNnpkYTRR?=
 =?utf-8?B?RGJ6OGNIandmVzVVRld6d2VGaTQ4cG1BWEtMZWtZdGw3bzFPSkJTL3FNNEFV?=
 =?utf-8?B?Y0Vkdy9XL2ppZmFOQ1AwTFgwc1ZoTyszU1dxUzA1MHdVWHkxWUYyV29lckhB?=
 =?utf-8?B?Vkl6YjVSZHZtdlROVFpnbW1xajB3Y3A0RkRtTDl6a0E0QXU2WnhKbmxsTzFV?=
 =?utf-8?B?TXRSTmh4YU8yUXUxeUoxUmdqdy9mZm5jU3g1VXE3TUVFL1Q1bkE1d2c1WU5k?=
 =?utf-8?Q?XlbcQMgo9JuCA1LIx9gu3qX+j?=
Content-Type: multipart/alternative;
 boundary="_000_769bb600f28f24d4bf9251e36fd3b13dba50d928camelnvidiacom_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 688a05fa-93cb-42a9-6977-08dbdfc4205d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 19:02:45.2195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0fs5lQxWAVrQeNRO6Kg2nJApzRedJOYPa1tLFUPF2IhzwsEE6OkSZxg5TO3l+/w1Peb5lPhC9Q/QsnbyYQ1TeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6479
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_769bb600f28f24d4bf9251e36fd3b13dba50d928camelnvidiacom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIzLTExLTA4IGF0IDA0OjU0ICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCnll
cyB0aGF0IGlzIHByb2JhYmx5IHRoZSByaWdodCBhbnN3ZXIgZm9yIHRoaXMsIGlmIHdlIHdhbnQg
dG8gcmV1c2UNCnRoZSBzdHJ1Y3RzIHRoYXQgd2UgZ2V0IGZyb20gdGhlIG52aWRpYSBkcml2ZXIu
DQoNCm9rLCBJJ2xsIHN1Ym1pdCBhIHBhdGNoLg0K

--_000_769bb600f28f24d4bf9251e36fd3b13dba50d928camelnvidiacom_
Content-Type: text/html; charset="utf-8"
Content-ID: <0792F340755E9641B83A7566FB8919E0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5PbiBXZWQs
IDIwMjMtMTEtMDggYXQgMDQ6NTQgKzEwMDAsIERhdmUgQWlybGllIHdyb3RlOjwvZGl2Pg0KPGJs
b2NrcXVvdGUgdHlwZT0iY2l0ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4OyBib3JkZXItbGVm
dDoycHggIzcyOWZjZiBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxkaXY+eWVzIHRoYXQgaXMg
cHJvYmFibHkgdGhlIHJpZ2h0IGFuc3dlciBmb3IgdGhpcywgaWYgd2Ugd2FudCB0byByZXVzZTxi
cj4NCjwvZGl2Pg0KPGRpdj50aGUgc3RydWN0cyB0aGF0IHdlIGdldCBmcm9tIHRoZSBudmlkaWEg
ZHJpdmVyLjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+b2ss
IEknbGwgc3VibWl0IGEgcGF0Y2guPC9kaXY+DQo8ZGl2PjxzcGFuPjwvc3Bhbj48L2Rpdj4NCjwv
Ym9keT4NCjwvaHRtbD4NCg==

--_000_769bb600f28f24d4bf9251e36fd3b13dba50d928camelnvidiacom_--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C72817DD75D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 21:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E43110E5BF;
	Tue, 31 Oct 2023 20:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAA710E4DE;
 Tue, 31 Oct 2023 20:02:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGn0zIb8U7qz/CN5pAl52p2V/wR25GFGX8q1MWnxNPvPM658rzT14DY5nM/jwOXTw/EX/oXExTYE4pswx2ROkJnBKRA0XUHHgJGBEZwvrn9SVBXyyYSqwxUjmM9ncHhNh2KiBaV4zHDSdROlVjx9pzwCVCRW2gPigpHO14+5tJpS9s/VQki0kl1s2NJHvDNGMPPE2IZIANtKS6aXM2SBcBPqJHtVrNLBbGkmG3frMFQxc2p5BYtRXspYID2FYcP3gwI4joJtGru9i6ghdjYxb4valLWxj+CUYakzVn9odnWRlICnAYJZ3N8+5TYqcNRLn6HGsMk2k1L/aQ+hXcy8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wx1iQf/fP+Y+Ez+vwXF4Lf3eZw2duNWSOOhkG+d6M4=;
 b=RB/ViDyw/E3ExL8qbzSqfp9Q+79Xm7GSoPYZ/0fnXfqrZh5ycyvEm4zeMYfsH1WlUql4PNVITlpFC3ud5y0D3C130gQd0LXCa4nTXJzZ4YJLp8eckZ9ru/jG8msLRjrBkSp216hdU6QkjumxdNLRf+e4x28SD1wVHYHAIGEiT0NyQBlnuoMT9kV/O6F9AO2mnMCQXRW8nBs9mrP7wfoTa2QRG8N4Y9TW2H7HDanYT7wBZ6WyUkRv2bJR1DLZvXK7gNruRaFe+KUrrc17EPGsj5erxyBmzMkErgvPI/2CmOk/7nOURJdR0njsrCu5cWaxZ6LWb133UQdxgb/9S9t0xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wx1iQf/fP+Y+Ez+vwXF4Lf3eZw2duNWSOOhkG+d6M4=;
 b=Cy41Y5tLDtnlWyl4wHRwgVKpMbPSNtIvp+zCfRluJKReo2QuT3lniyEU8PC50F8+A7Z8BMVDh3sc1u+Q99oAxjOUQ61UrkvRt9rULgEOs/AE+/La+jZee8H5mzn9seIKUIg8juxDjnJL8Y6dfXpino1Jtm9JiizFLvNI5fNKvmo90f5zYYOumX416IFcpLa/eDNIgUTLmDUSpHm5/ZsYEssOgppMRIcj/SQwtdeR8LyFi8W/0R81+K2D3uWjQ2AMPYbSX59hCUXCrQl1FysHgNrHos8yGpzslkuEoEJUgaOLm0w2gVItS8QobbErw4rB/mzbDJ0tZgFqDpXZq9dEQQ==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by BL1PR12MB5923.namprd12.prod.outlook.com (2603:10b6:208:39a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 20:02:42 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%6]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 20:02:42 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [Nouveau] [PATCH 3/3] nouveau/gsp: add some basic registry
 entries.
Thread-Topic: [Nouveau] [PATCH 3/3] nouveau/gsp: add some basic registry
 entries.
Thread-Index: AQHaC7nrqx09z4mpykGvaUaC4Zd97LBkSa9kgAAJRYA=
Date: Tue, 31 Oct 2023 20:02:42 +0000
Message-ID: <1b84e30b689947e48d14aecb6787944d98699999.camel@nvidia.com>
References: <20231031051943.1957328-1-airlied@gmail.com>
 <20231031051943.1957328-4-airlied@gmail.com>
 <CAOZdJXXXf3RUc3d1STyZtAENHe_DqC7sXoWZZhk7p2wo=t7SVA@mail.gmail.com>
 <CAPM=9twkLVo4aF5exWLXVfRxewcDvb17k9O3L1uB3-KG4g4FMw@mail.gmail.com>
In-Reply-To: <CAPM=9twkLVo4aF5exWLXVfRxewcDvb17k9O3L1uB3-KG4g4FMw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|BL1PR12MB5923:EE_
x-ms-office365-filtering-correlation-id: 520438cd-56fd-45bc-71ec-08dbda4c578a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8fGla7EskdIShGIWc0mqPXDgGrxJedWilpsWmctop/6PcuBv8J5JZws6PDqxPvCQzygwERecGlEI3XPyJQRK9WlNKF7FlBlCZhCsV43BZmwNbtzU/KaFBTEM7TIMYivCM2bNb02Gb7/Qg5dh9i/P89Xz3TNP67ti7K36gIFNrwYrw6HqAC3AFp9gXNdb+0+Mf/v9iLdwHXnPvMFkkspB8HofYXz7pIQdkyvTYvZyhyA7xWU15JFFt57Foa8hdsIE7FBXyNFXc6NZ91QWzZOwgIj9RovAQaaMq1yCNmlXhowEDUulz0Vrskd4q1pKBngLbN0uEjZ5h6EwMOxCo9G0SBOQdXtxOcixBZv3xrxE2GK9o1sCgCJVBd2YPp2NOqI22LWJye9ojwBk9l3qsnD2foGEQ5z01glOawFOhdK0HRIy90Ayth7p/tYSGT9pi1zmfyAuLkAzUUV3Mlt3IedQudWjunX33OGaUWMEVyNagPLrsd9OcWLEeY9sUXYWIvCnLZyBelS7ObRPaArrunM0AJtvZEf6hy5UQoVIgXehH+HKHyHnmuR6fydlLbjo8gH4zzK7z/04x1QmIaIr+7P29jA+dEcfowPEW8UfD3++j06hkZU14qkmJnQMD2rYwuYM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(376002)(136003)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2616005)(6512007)(26005)(38100700002)(6506007)(71200400001)(478600001)(4744005)(6486002)(8676002)(41300700001)(66946007)(66476007)(66556008)(76116006)(6916009)(66446008)(54906003)(8936002)(91956017)(316002)(4326008)(64756008)(5660300002)(38070700009)(36756003)(122000001)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGVUcDBkSGFuY0JhQWV2RnBzNUxGdUpsMXFEaE52bXBHSjN4ZVdnam9RNXJ6?=
 =?utf-8?B?RnV2WVZ0dmJ6Vjl6UWVZRWdMNzkyZHNuZDROaUVISE11TGlMTEJjc3R5ajlU?=
 =?utf-8?B?bmdOU2lOTktCaCt1UnQxeU9CNUpnQllBemI5VURrdDdySFhGVUxSaGY5M2JX?=
 =?utf-8?B?cnJpYUtIbVJyU2VYYld1OFAvanZ3Y1c1ZUpBVkdVdVNIQVNCeUhDdWFkSnY3?=
 =?utf-8?B?RWQzMmJTemVya0NiMS9JYlZzbExTcVlpOE9FN294MTBrUGVNemt5WVVQT3I2?=
 =?utf-8?B?c0luMUZvK0FnbkhJYmc0YmdiRmw1ZFZteEdIWWRBQzFEYjVHbDhoenFDdW9x?=
 =?utf-8?B?dmJxWTNSUTFzOGY3MlZMQjVFbEtNVkhDdDRHODNjd1R6a1J6eGgzaS9zS0t6?=
 =?utf-8?B?SUZ6ZXEwVzVncDUzTHhLTFFHZ2U3aGQ2VUNlN1M0RXBTSkIxVGZ1UnQrYitG?=
 =?utf-8?B?d0J6cnJrdnk3blpYL0Q4djFzTzBRVjNPVjNlaTFQYWxoaUVkcnVCdnloR0lw?=
 =?utf-8?B?TjRaOU5jM3JGbDROZFZGRldFTHdRaFZ1b09Ga1ZqVEJWNWswOVczdklxbHFG?=
 =?utf-8?B?Um80aDlzY1NVZXBIMEMreUN3RDgxbEZON1lwVzJ1M1VYOXkzMnZlMG42OTR0?=
 =?utf-8?B?c2JBT0cyY2l5T01DQTZ0R1JOTDI0YnpScElKLzNjRGJvbHZCOEdCSGZqMmI4?=
 =?utf-8?B?K3ljSFByMStvdWJieE4xV1lvd3k3NnVZWXBGNkdSbVUwUVpmcEFSTkxVRnJE?=
 =?utf-8?B?TFpKQ01xWVRkY0tYUkhhbkpCMkc3YkwxQjRWWTVRWGUrVmpNQytpZ3YzZWl5?=
 =?utf-8?B?RnJlQW11ejNyMGkrR3UrWmRsVzVVL0FuL3pld2hTeGoyNGJuaWpZNlhIN2t6?=
 =?utf-8?B?OUYyU0xIS1Zpa2J3YWFna2hzZThBdlVzVTRLd1VQWGJJVDNjQ2hGSDVqTlA0?=
 =?utf-8?B?a1N1OE1jNy9OcDc0Q25UQzVveEpSRUVXV2FkLzlIMFQ1SDAzUGFwOTlVNEh4?=
 =?utf-8?B?Z1pTSTZaYXI1Q0wzNWtVR3hyV3pKTVl0aUJucDh5MC93QS8yQWdEUGRhdlRH?=
 =?utf-8?B?T0w1T3cwMUpJT3RhdTdLUTA1ejhGckN0eUpVeUJGRll3T2FsaXFDK1FyV05s?=
 =?utf-8?B?b0hFNzhyQStoQWgvNnh4Rk1mNnY5OWwxbk55ekZieUltQlJVNVhXWXNHQm90?=
 =?utf-8?B?RmFJS28rRDNGclNWa211SG1TaWRFQUxTOFZWZEUwajZuYlhTMm9qakFhYWV4?=
 =?utf-8?B?MUZKbkZmeCtMTHIrUi8weGNRMGJzSVEzMkFibGF3WTI2Z1grVzNZTkxiTzlT?=
 =?utf-8?B?NlhPdU5KeERESjBGQU8zVHlQYndsREprTC9JcGR4SEt2OWxBWUlqWlNVbER4?=
 =?utf-8?B?Ujl5UG04WXBGN0t1VGhPRjFrcGkrOVVMYUVtOWN6ZWVBekNMOC8yaHF5V0Y1?=
 =?utf-8?B?cXhTZU9UWXlhNTA0N3VZelY1Yjd1eHJmeEZ5bTh4T1lZY1BDaDVrR3JORVli?=
 =?utf-8?B?T1U4RmlZNkRYMHkxcmU3Z2pXVHdYV3pUVGxHNFdkUXN4bEZ3SW9jY2wycSs0?=
 =?utf-8?B?NE9lSUErSlFoUjB2eFZpeTVvYWx3QW4rellJVW1VcUFqc3Fsa2ZxZ09LNmxx?=
 =?utf-8?B?OWloMzlKNGkvQ1kwZldvTC9EZElWNFVaTzFZRHFqRHZicHlrS3RvYUpsc0cw?=
 =?utf-8?B?VDM5ZWI1TW05RnVjOGJWSkhVa295NkNRQ1ZGZ1IyN2FNVHVacWI1VTdpdDdP?=
 =?utf-8?B?K2FQNUVZVUdKb3h5blN6QzNrSkdabkxpZlBLR0dwTTdWZzRpeHYzWFFvR1FE?=
 =?utf-8?B?VDkxYXE3VGRGVmp4bmsxL3Z3M0VUTmF4NWh5NjRJNGE3Q3pIS0djMUNVVy9s?=
 =?utf-8?B?SG9XKzlTKzg1REV1ODdPaTNBL0xaSm0ySE0vd2dlMndiVHE1ajRpTEg1NFlw?=
 =?utf-8?B?eWtCbDVsUVVlZjhmQld1eG1wTnAwWm1VWGpkdDloOXBXbGRYRDI5WlgxNTF4?=
 =?utf-8?B?OHB4eWJlV3Y2aStGZXJrdUt3UUgrK0h2dFpEdllvMHJKaFNTOHdIb25maUtt?=
 =?utf-8?B?Z0hlekloVWFoUXVOZGwwbEl5ZTlJTGo4dlY4cnJlNW9zY00ra3JvUkFMaTVv?=
 =?utf-8?Q?wwaHU0Lfu3im/o1by/pJgqdMX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79591E86A21D1F49863F6897B5AE5D44@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 520438cd-56fd-45bc-71ec-08dbda4c578a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 20:02:42.3882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X7GwWBxNPyKGbw5FnGGDsXitvko7h1VY9EX12i4qB/PGeedHfG0kBTjTtDVlaxQPnCBlNxbJHrWnjcVuY/gqiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5923
X-Mailman-Approved-At: Tue, 31 Oct 2023 20:48:30 +0000
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

T24gV2VkLCAyMDIzLTExLTAxIGF0IDA1OjI5ICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4g
PiANCj4gPiBzdGF0aWMgY29uc3Qgc3RydWN0IG52X2dzcF9yZWdpc3RyeV9lbnRyaWVzIHI1MzVf
cmVnaXN0cnlfZW50cmllc1tdID0gew0KPiA+IMKgwqDCoMKgwqDCoMKgIHsgIlJNU2VjQnVzUmVz
ZXRFbmFibGUiLCAxIH0sDQo+ID4gwqDCoMKgwqDCoMKgwqAgeyAiUk1Gb3JjZVBjaWVDb25maWdT
YXZlIiwgMSB9LA0KPiA+IH07DQo+ID4gDQo+ID4gI2RlZmluZSBOVl9HU1BfUkVHX05VTV9FTlRS
SUVTIEFSUkFZX1NJWkUocjUzNV9yZWdpc3RyeV9lbnRyaWVzKQ0KPiANCj4gR29vZCBwbGFuLiBJ
J2xsIGNoYW5nZSB0aGF0IG5vdy4NCg0KQlRXLCBJIGxvb2tlZCBpbnRvIHRoZXNlIHR3byBvcHRp
b25zLiAgQmFzaWNhbGx5LCB0aGVzZSBvcHRpb25zIGVuYWJsZQ0KInNlY29uZGFyeSBidXMgcmVz
ZXQiLCBhbHRob3VnaCBJJ20gbm90IGV4YWN0bHkgc3VyZSB3aGF0IHRoYXQgbWVhbnMuICBJdA0K
ZG9lcyBlbmFibGUgc2F2aW5nIG9mIFBDSSBjb25maWcgcmVnaXN0ZXJzLCBzbyBwZXJoYXBzIGl0
IHByZXNlcnZlcyB0aG9zZQ0KcmVnaXN0ZXJzIGZvciBOb3V2ZWF1IHdoZW4gR1NQLVJNIGRvZXMg
YSBQQ0kgcmVzZXQuDQoNCkFsc28sIGxpa2UgSSBtZW50aW9uZWQgb24gSVJDIGVhcmxpZXIsIEkn
dmUgZ290IGEgYnVuY2ggb2YgcGF0Y2hlcyB0aGF0DQpwcm92aWRlIG1yb2Ugcm9idXN0IHJlZ2lz
dHJ5IGNvbnRyb2wsIGluY2x1ZGluZyBzZXR0aW5nIG9wdGlvbnMgZnJvbSB0aGUNCmNvbW1hbmQt
bGluZS4gIEknbGwgcG9zdCB0aG9zZSB1cHN0cmVhbSBvbmNlIHRoZSBkdXN0IGhhcyBzZXR0bGVk
Lg0KDQo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB67511081
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 07:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515AA10E909;
	Wed, 27 Apr 2022 05:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2052.outbound.protection.outlook.com [40.107.96.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F035C10E4B2;
 Wed, 27 Apr 2022 05:26:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R46OoWeaNf3zMrikWdqFM/HZlIery+J4er9EArkwx1GthFMiP5yFtX5Wc0En6NCqp2l27RhcTubGxMb/OLCXM86o2dVzxwXBtlKfxZq94xcXmqBP1ecoHHNzzIWJ9clRY6NYUv93L5PWSWpvW010HeZSVN/z6YtePOiS9bduBoPGb2tgp6WQuPvS4KUDaPduUmSCPGiNaSmBaDmPUznRbDtYZVcFMbIU+45Q/+WdDLCPiAehI5mZ8iPDqDQa05VZLDrnPaEY+4tgPkf+icc6OW1K5Bnswtp1uhl370oyQDiNMxzRR3wNsZ1kspQebTAS5XPKhKLXBtZPNFKgzjk/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhwdtjIkPgGThYpNVrX/lQV/hn2gl8eVhhwLvsKhjjs=;
 b=cdn/wLWTnsIZBNBpmUvHFA9AXrQ88FGm0x/3dtWJW7BygD82156WODFak5keqoSJBreoDkDT2Mbl5a0Pv1NMZ/opeHpOkGj3iSon9gnUyebOctzkICbrmjmhgvtWN/GdktDVoaJI7VvIATobAmE7lcYRVl2mgSM9jfGy9uJ87VFVU/QWrVdWmMUB2Tkse9hppZ9myU0dkutwrX34bgmlw9abGNVGYdgLZLJTKrFRTaDBES6kPQHwlFy3qYO7SQIjcv93Y0+0Fb7LzEqLde6Y4DbzyrkoG5n3n3/3wYxUJmidDlG0P8aEiGqg0uF0NeLsN7IyNNwB/2YzkceiZcKgbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhwdtjIkPgGThYpNVrX/lQV/hn2gl8eVhhwLvsKhjjs=;
 b=LvfARY5QvBG/ai7ihKPNKnXQNdL9KjpiARwZPGbEGva0Y6dfd6TcRbq3nLI7TIIdeJ3dxnSUcuMo8EotiCJO+5bs/cGSYD2VHkFbZDeYD7VnxGWGGHX2WteN5+Yb2+VSgbYJLHab7C2HIdWC9oSy8VtdSmKialNPTcG2cA/FtlI=
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BY5PR12MB4273.namprd12.prod.outlook.com (2603:10b6:a03:212::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 05:26:30 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::812:88d6:77ae:1d87]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::812:88d6:77ae:1d87%8]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 05:26:29 +0000
From: "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Mike Lothian
 <mike@fireburn.co.uk>
Subject: RE: [PATCH v12] drm/amdgpu: add drm buddy support to amdgpu
Thread-Topic: [PATCH v12] drm/amdgpu: add drm buddy support to amdgpu
Thread-Index: AQHYSkLuyQZC9+Z8JUaKDa0xeTQlh60CcEKAgAASsgCAANb5EA==
Date: Wed, 27 Apr 2022 05:26:29 +0000
Message-ID: <MN2PR12MB4342E68B6E2200F29DDC37BDE4FA9@MN2PR12MB4342.namprd12.prod.outlook.com>
References: <20220407054651.3924-1-Arunpravin.PaneerSelvam@amd.com>
 <CAHbf0-H5uE4RtZwY0L8Wz0VG6QnU1+E3yhg3fDFVc3n__=nrNQ@mail.gmail.com>
 <c0facbf4-0e14-fde5-4334-499135a36f0c@amd.com>
In-Reply-To: <c0facbf4-0e14-fde5-4334-499135a36f0c@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-04-27T05:26:07Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=c1bb1533-41d7-4baa-8fd7-a215993d3cba;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-04-27T05:26:08Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: c57d7ff6-3d02-4633-beb9-afa3db4e0408
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd316140-3aa3-4b13-afbb-08da280e7bc4
x-ms-traffictypediagnostic: BY5PR12MB4273:EE_
x-microsoft-antispam-prvs: <BY5PR12MB4273E09C4DC7CFA70A763287E4FA9@BY5PR12MB4273.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3MAjMadz/HHK4J7pJud2C8eSzWaFeAqcaO967kNmK7j/5iLJbkxfwsq+B3y9O1ZEYN6781+b7++vJ+Vb1mecIdb/E8bR2rU49stSpvf/KiFGjLd9o1tdck5IAEbiIdowjhuL+pBLyD2bHWUWTVhQ3spph70MwB9LOeEOrO1IpiNRRLUjBJInGDjISaHhyLiw8laGAglAtGtxhFlPRF337BTambmyJOlHcTfKpG94B9sayop1zLHYGB3FQR26A4D9ub7f8PA/neye+egASYDcOyG2vVsJhtuT1auoa5mpz1QWHCrrOittWfhVySEK0kkta1fSyzGWsw0QlpJ+BQ85OwUYmNqT1QmrdITjSHrN5gzd7FZ92fFksDfnUxz3ARQtdZe0FkkZvIr0+DFXTVADg/iOHJhotqFe9Nch0PPAH+kD5L+YAsCr0VA2iMUV86IRyq8y6UgG7WDkzm1/DYuAF5eGKsNSUsDjqIeP5hwFerDCPiWwkOB1nU8VDSIfys2VhUzwRV1yP23cH5QBVUbs+uYyE0pmUaeC3YARYEFNgogFW3ODMPTGpqrsOqF+ox9hhXjBWZvMRr0wkGdo0jem2D8Q6iqjJXOYtmP9csvmajW+F/WJAFX7l+dbkgxS2Jc1hKkOyndFRZEjnTcKSGLM1bfGIfEzXKhWWlZvH7YLTcs32Uk99mlHSk4jXFg4pLPO8TYF4FeKlRoGJP42Y87J5uRk7Nx/FQrXgEWmE8YA0vbTTL5b1Xyu/o0tSEgtBi9a8BjGFnsu+wry5n64fs4419O0cGA6vWnquVrnvY2y7ko=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(6506007)(55016003)(33656002)(4326008)(110136005)(9686003)(5660300002)(55236004)(53546011)(26005)(71200400001)(508600001)(45080400002)(966005)(54906003)(66556008)(66476007)(76116006)(7696005)(52536014)(122000001)(66446008)(8676002)(64756008)(83380400001)(66946007)(86362001)(186003)(316002)(38100700002)(38070700005)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWhYYVVvOUxWQ0NES0xYZjhrOHJEcGVOVHJuaVBwemVQcEpVUm5BbUpSekhK?=
 =?utf-8?B?eGVRZnRpMVQ1bW1WWjZJeWo4cGs1S3VYZFVjZE13bTdoZGtvb1AwYjdhWGpI?=
 =?utf-8?B?dnVPRXhmekdtb2RMZ2dLQU1ReUtJK2p6TWxOQVJxQzV5eDg3OFp1Z3R6cC8y?=
 =?utf-8?B?T1NIMURydVVSbis1Q1NjNlNRZWtqd1g3YkVLMGd3STRhZ0FueENjNmxlVjla?=
 =?utf-8?B?QzlDWFQxZXRIL0poUi9tejJhNm5iQ3VHUXJvSUhVOUQ0RUkzQnhKRU9uS28z?=
 =?utf-8?B?LzFheGJPaithZDJuaWx4RnVaSUdkU0pTNnU1TE5EUG5LVGl6cXNnaTFVa0Vi?=
 =?utf-8?B?VFh6cTZ5ZzhQc0xaWU92dzg5cFdGV09BaXBuckNNVnQ0d25RSWNpUkY0MDNq?=
 =?utf-8?B?TWEwaUppaGkzTmlvZVFucGRQQ0RvZFF3MXovcEpMUlZodEkrdlE3RllLdzZz?=
 =?utf-8?B?N2dmdWtiZGw3OUk2REpDUHhpemY0K0x3U0dYdGVoV1lCNFhpRnlYcVZlU1dP?=
 =?utf-8?B?ZmpROGUyWktzcnRqRFRoME1FWENxcWJoMVFtRFNvM1BnMEN5aUdtT0hYNE14?=
 =?utf-8?B?Zys0dEJxdW1hZEJkWjFZTkhRcjRMQnJLVDZYaWZhMXV6VTV1SndqTUxmanVC?=
 =?utf-8?B?ZUhDVWlsa3lLeDZjY29QSU5KLzRISVUwMkt2b1pVUXlNR1N2cUtxWDZhMDRU?=
 =?utf-8?B?TGJNSU4vTEhYU25lbnUxUjU3bUQ2dUtHY1NNakFXdWpJTjhpdnhxc2xoSnQr?=
 =?utf-8?B?TEpZTkcvejVSZngxUWd2SU5MZGtjaEVmNW9QNlpiMXhob1NKVWdzRldkMmZ6?=
 =?utf-8?B?c2hzK1NIbm8wUW4za2ZIeUJaKzhvWmMyUGtERS8xMU55Yk8zRTVUTUorSEZI?=
 =?utf-8?B?NWNqbnl4VTVtVTBDWmgxUytHYmZPck9xb0hBTW9WMWZLT0lJRThuOFh1end0?=
 =?utf-8?B?S2EwN2h4RDk2QjE4RmRSczBVR2VmR2RBVFhhdUZ2UnhYSjdHTEpCRjhnWlUw?=
 =?utf-8?B?N1JDVGRxU3BTNUtnczBhaUlzZkM2NHljMzBoRVVuWmRqb3phRmY3bGpWY0RV?=
 =?utf-8?B?aURTQkNQYTNyc2xEU2VhSnNuUk91RE1jUkRFS0lpcHJ1dXhWclhQTXJtaUda?=
 =?utf-8?B?RDhxKzlPT1I4NkIxeUt1cElVakdiczBSWmp0RlRrcVc1Z083T2JsUXlxcGUy?=
 =?utf-8?B?aHVUUkxPZEtPdnc4TVlEZWt1TlJMS0VnMlVrcHdOQTFEb0dvS1V3V2hNdmZs?=
 =?utf-8?B?ZExNaklTSkhNRms2TkN1UVd1UVBEaXN5Y0x3c2I4ZEFQUVJNd29vNFRpNFVv?=
 =?utf-8?B?cVRBM3ZmN2ZER0RYaFJDV0FvMHowNmxKQ3FnYTJlZ25tOWJEaFZhck0xRHFJ?=
 =?utf-8?B?UUVJWm5jVWhYMm56R3ZRUWRPclUvS1ZYQWs5d3FxMlUxMnN2c2RvejF3R04r?=
 =?utf-8?B?L1hMdmp2N0FPd29LUkpjb2xJK1FOK1J6QXdlUDNBUllFNThCd0Q0c3g2RWF3?=
 =?utf-8?B?UXI4RnJXQmZGVlVUOVc0QmdzMkhFM0l6WGV0MjBFTVdXL2RKU294SUU1UkxW?=
 =?utf-8?B?NjdmTmVpUm8rb2NzZGJ5VnlaeDlYV1E3SWxrT1RuRG1oVm5VZmVZV0JQSEJa?=
 =?utf-8?B?ME8wSDZDc2FxSEtPRFdzYzJMRm50RDZKdEJJSWZmMlhFTHJNUTNVdE9Jb3Fs?=
 =?utf-8?B?amMrYUp5MjNONUxWb3lWTDhvYTF1Uno5Ukd3WFQ0WDNlNUUwOTBhT2VBQTk3?=
 =?utf-8?B?cEZaU1JjTXJoWkl4RmRhVy9MUEhMTHJIZllVNWVvUlFBcHY4TkFyTFM3NElV?=
 =?utf-8?B?VHpuZlQ0d0oxVWZFdVZDQ1NQaDl2K2hoOGVFbjFnMVRlQVF4NEVaNzd2anBB?=
 =?utf-8?B?RGVWOU9semw0V0JuVWpwbEdpOSthMUwvVzJ5ajFPV1lVWE1ZV0M0WXlDYnRH?=
 =?utf-8?B?b3Joay9BdWFWUjViNy9VSlpQWUpIWGh3cjRmZi83K0NubTVtY25Cbi81UFYw?=
 =?utf-8?B?WDNWWEVjM3ZqNkV4dnlYT2RJVkNYeTY0ZE91THZTdjN4UGFVUHdPUHN1TVZO?=
 =?utf-8?B?QW8yZXRHSnNxNW15K2V2a0lwc1JOeXpST0x5OGs3RVgyeEJueUhERVFlL0gx?=
 =?utf-8?B?UnhtODFjM1NGN1ZWUElPSnRzMVRjUFlzWHlQaUI3Y1Rhc0gzSVRsaVpiNXdj?=
 =?utf-8?B?cExFK1dEbXZLeDczQjB2WmFhTUc0dWZWQ2pEN0tCKzlLTEV2bWJLSThiK2xH?=
 =?utf-8?B?aFc1VmRoZ28zN0FXSzRFZ3FqUDU4VEY1WDkzRThNWVJRWkJKaVFHc05SN2tC?=
 =?utf-8?B?ZW1pd045cTRwNTRjaWZObktPRnR6MEttMHlyaWl0NS84eFJjU0dOdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd316140-3aa3-4b13-afbb-08da280e7bc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 05:26:29.7331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zN6BG9ds518S8RB5EKZzK5zO6LFURmmTeTOhRrXhnS8pTlSDWuxLJXguJvjoRcNCZpPna/8RoORDXq9IERVasQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4273
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "matthew.auld@intel.com" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkhpIENocmlzdGlhbiwNCg0KSSB3
aWxsIGNoZWNrIHRoaXMgaXNzdWUuDQoNClJlZ2FyZHMsDQpBcnVuDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1k
LmNvbT4gDQpTZW50OiBUdWVzZGF5LCBBcHJpbCAyNiwgMjAyMiAxMDowNiBQTQ0KVG86IE1pa2Ug
TG90aGlhbiA8bWlrZUBmaXJlYnVybi5jby51az47IFBhbmVlciBTZWx2YW0sIEFydW5wcmF2aW4g
PEFydW5wcmF2aW4uUGFuZWVyU2VsdmFtQGFtZC5jb20+DQpDYzogaW50ZWwtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNo
ZXJAYW1kLmNvbT47IG1hdHRoZXcuYXVsZEBpbnRlbC5jb20NClN1YmplY3Q6IFJlOiBbUEFUQ0gg
djEyXSBkcm0vYW1kZ3B1OiBhZGQgZHJtIGJ1ZGR5IHN1cHBvcnQgdG8gYW1kZ3B1DQoNCkhpIE1p
a2UsDQoNCnNvdW5kcyBsaWtlIHNvbWVob3cgc3RpdGNoaW5nIHRvZ2V0aGVyIHRoZSBTRyB0YWJs
ZSBmb3IgUFJJTUUgZG9lc24ndCB3b3JrIGFueSBtb3JlIHdpdGggdGhpcyBwYXRjaC4NCg0KQ2Fu
IHlvdSB0cnkgd2l0aCBQMlAgRE1BIGRpc2FibGVkPw0KDQpBcGFydCBmcm9tIHRoYXQgY2FuIHlv
dSB0YWtlIGEgbG9vayBBcnVuPw0KDQpUaGFua3MsDQpDaHJpc3RpYW4uDQoNCkFtIDI2LjA0LjIy
IHVtIDE3OjI5IHNjaHJpZWIgTWlrZSBMb3RoaWFuOg0KPiBIaQ0KPg0KPiBJJ20gaGF2aW5nIGlz
c3VlcyB3aXRoIHRoaXMgcGF0Y2ggb24gbXkgUFJJTUUgc3lzdGVtIGFuZCB2dWxrYW4gDQo+IHdv
cmtsb2Fkcw0KPg0KPiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2su
Y29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRsDQo+IGFiLmZyZWVkZXNrdG9wLm9yZyUyRmRybSUy
RmFtZCUyRi0lMkZpc3N1ZXMlMkYxOTkyJmFtcDtkYXRhPTA1JTdDMDElN0MNCj4gY2hyaXN0aWFu
LmtvZW5pZyU0MGFtZC5jb20lN0NlMThkMTU4NzY5ZmM0N2IwOGVlNzA4ZGEyNzk5OGU3ZSU3QzNk
ZDg5Ng0KPiAxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3ODY1ODM4NDQx
NTc0MTcwJTdDVW5rbm93biU3Q1RXDQo+IEZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxD
SlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTYNCj4gTW4wJTNEJTdDMTAwMCU3
QyU3QyU3QyZhbXA7c2RhdGE9aFF1NjdXcmRVd1puNiUyQmRYemlHejg0bk1HZXBJNiUyRm5sQg0K
PiA4WEZDRktDbnBBJTNEJmFtcDtyZXNlcnZlZD0wDQo+DQo+IElzIHRoZXJlIGFueSBjaGFuY2Ug
eW91IGNvdWxkIHRha2UgYSBsb29rPw0KPg0KPiBDaGVlcnMNCj4NCj4gTWlrZQ0K

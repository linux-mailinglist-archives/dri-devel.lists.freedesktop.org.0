Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EEC70FED0
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 21:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6487B10E609;
	Wed, 24 May 2023 19:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56C810E581;
 Wed, 24 May 2023 19:56:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQMWAA1GPm2k5qT5OhGVKRBeWuHayhTc6/W72v2F/Oh0t3tjdwox5FiLRbni19cNiF72gx5ZlKdhK46oWWMM6L1gIOEuABvx9IxfsUG9AAnwmytHDkp1oUbXxaU4dLHMZox5ntQDeOac9DxlGX/BB9A1qKb5YhiOfYxQl1sXT8uQL4PkKa6DC5mQGPTIt2lZywok7rD+nt30/Jgf0/0EfPgmV0wmZxBD88BpxOflGeJfuoYNu3NTwanpBIM9nGird3B+YE/UXSqmassMrsVkB4isoE5HYBDFhGWAbg6M7Aum5++yXBcYrjwhGIZrn/F5R98w4rUdh6+bMgo434Yrdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgnDfdrsShMOhKDW+s26tMajriXoXBPUKe6SYicC63c=;
 b=E/e+X2ovVDcKewwhJfJ5L2FQOfDwZh+e76eJ0W0bTAdfyNf3Ue59k5xsrDxpvGR3p5vOMZrdALDelcMsxuysP6Eywzjz0OPeZMun8soiRxYDZgHVoXGVsbyr5Os1oJbetRML3chTFlW61ON6j/vj6J8ga4nsP+mLAFjVhpQdy7iXxXDg8/WOpRZxxBR6IDhka7QB6g4mOyxqYP/MEPF4mdzEjR+BQyrOlSvQQaGgHVIsZYyFBqRsyIjMiorLY9M+oc8eMSIWtk5k1nnH/fKrxUzC8F/YRgYEkdyEcNkurNCRN2oaT4i2Vy4ZOdLN0VnFBOUBm8FZtNh+hGFYsjQr+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgnDfdrsShMOhKDW+s26tMajriXoXBPUKe6SYicC63c=;
 b=qzy3ox/tPywYLBGF5msInle3GkYJFAY5t43/H1I1SxcsHSOHG6LEhF0X4zcC1+ZG/KaorM80BOxtHugU2KQhKtaCKojlWtFKFsms3qYrqU0ls3WbGP9Gv5vg6X62pGE3cTpGAc4vAgky1OOar8vqE+1HtitYvL1zFopu3kvwJLQ=
Received: from DM6PR12MB3996.namprd12.prod.outlook.com (2603:10b6:5:1c1::31)
 by DM4PR12MB6469.namprd12.prod.outlook.com (2603:10b6:8:b6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Wed, 24 May 2023 19:56:12 +0000
Received: from DM6PR12MB3996.namprd12.prod.outlook.com
 ([fe80::e436:6d53:7445:88b8]) by DM6PR12MB3996.namprd12.prod.outlook.com
 ([fe80::e436:6d53:7445:88b8%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 19:56:11 +0000
From: "Ho, Kenny" <Kenny.Ho@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>
Subject: Re: [PATCH v2] drm/amd/display: enable more strict compile checks
Thread-Topic: [PATCH v2] drm/amd/display: enable more strict compile checks
Thread-Index: AQHZjnTJnX7VvV3da0++c1L8pnaweK9pzTWAgAAALZaAAAUMAIAAAV+AgAABQQCAAAFvRQ==
Date: Wed, 24 May 2023 19:56:11 +0000
Message-ID: <DM6PR12MB3996F0065337656E5369277C83419@DM6PR12MB3996.namprd12.prod.outlook.com>
References: <20230524191955.252212-1-hamza.mahfooz@amd.com>
 <CADnq5_Mz6aPFYGnr8J8C8UeTpbo7JDg+uvjqAxo7o4vmTGej2A@mail.gmail.com>
 <DM6PR12MB3996C4248CBC968A7B08341583419@DM6PR12MB3996.namprd12.prod.outlook.com>
 <BL1PR12MB589849F37FBE98A3A06A316185419@BL1PR12MB5898.namprd12.prod.outlook.com>
 <3fefc712-913a-a391-bc7b-c0c75eff1c3d@amd.com>
 <CADnq5_OdWbg6zKjPrRwd2QSDnHgFuThF+OQHM=tVWj-2ySCu_A@mail.gmail.com>
In-Reply-To: <CADnq5_OdWbg6zKjPrRwd2QSDnHgFuThF+OQHM=tVWj-2ySCu_A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-05-24T19:56:11.110Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB3996:EE_|DM4PR12MB6469:EE_
x-ms-office365-filtering-correlation-id: bf5e762c-630d-43c6-6a08-08db5c90ec8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IWbiTB7CM5b5MwwJBHjThbsTzCrDF2i5ERxqrbDT9q+tNMu4pGyHpqBPkUk+XGuLNpecWfX5I6+3djn1hJPzLlCBscpHAp4byiBFs/swEjLwBNSdPUWCntnHb/0lud601uztWDEybf0i1LcNvAEw7Man1Qvn8N4lPSfAEmPE8TzXb9JZLXnprIC7yFCZ0BID0EibzAU/sCuzie1skSj/RUmpk79dkMK7eLAToeJZvXRil1Y13xwDtDVq5dUzGl0q0gdasME/6WtwNQuLx3zO4bA+Xz34P7QnCGNahgTMaIpGKDMmo/4tcFow03/tJatg5IyDSsWVYziUZMucolILK5bbKcLExzWBO4pNy+Ugkfq81T+0nLDNIudX1uKoOCLRr/pdO/CU7t/spPyRcD7p5QnntW+8h075FsnLC9Aj0NoRKgdw8OoxVVMyW03YvJHgeZ+waHzn7RJtXdiLvZw6cqA6Erd05HJlDWpsAwX5/2+hZgj0CIvMvumWvXeqS8uEsiGh+w8RhYHnN0kxvMHOsolqlVvRsDOu7ThwQnOrBqzzqGQbUOa4IJ/U4EgH83nu/buNRocBixgkgZAacPudoaCSwTxG4DPHuJ2yeRYRjXREYBFI/HLNEBT22GsMt95uy34ndr4YVE5WttgZNBrvTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3996.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199021)(38070700005)(966005)(7696005)(41300700001)(54906003)(110136005)(316002)(55016003)(66446008)(4326008)(6636002)(66476007)(91956017)(64756008)(76116006)(66556008)(66946007)(71200400001)(8676002)(8936002)(52536014)(5660300002)(478600001)(86362001)(38100700002)(122000001)(9686003)(6506007)(26005)(33656002)(53546011)(186003)(2906002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2t4cHY5QWZIZ0ZWN2U1bXNmUTBvSFB5WVBZQ0EycjVJY2h5c0wxbENYMldM?=
 =?utf-8?B?VDFSeU8wY2FCdU15TXVIRU1NbDZzV2pITjkwQXNwMFpEc2IxOWROQWdwRERI?=
 =?utf-8?B?SnFDZHFTSDY4clk5UTcwNmxDcjZ5NGtCQ0hHQnBTMC9xUzhVMGtrSHpjY2ZV?=
 =?utf-8?B?cTI4dFRxMlNsY3VrcVlKVW9wT3dtRVJsMzF1TkgvYjBTN0VDVXZFQkF6U2pa?=
 =?utf-8?B?Q3V6VXVEK1NWeWZOVzhrVWYyVmovS2tYQlBla3JTdHh4Z0ptcWJqbDFiMHB6?=
 =?utf-8?B?TFNlaXk2TThqOTNlQ1VHQy84MEpZL3BKQy9kNjUrMlUwbUtzUnVRZ2VXd25w?=
 =?utf-8?B?eFJqWDdZaHdSYUNYaWtER0ZRVjAvK2lPUE5UcGF5L3doNjZldHVXMFZqaGpp?=
 =?utf-8?B?YXR4c25KQXkxaDRpTFFSTVRyNS83V25rNnRnU0NLVUNRTkMzYUlyaWVJemFp?=
 =?utf-8?B?MkdwVGN6YVpqY0N3YjlrWWNkcmhmVDgwYTRiTkhHanBSOU55WEI1VmR2TG9F?=
 =?utf-8?B?aHNoNGozbElLL3FxV05OeTN2MTJMRXpTYzZoKzRnbUFadXoycHlVa0FYcFBs?=
 =?utf-8?B?Sm5SYmtyOVNKcXZsclhQT0xhMlIwNWpNdGxGdGhZUzRuRWw4UGVqTDhhMTd3?=
 =?utf-8?B?cGZWbFllYndhNHQzVHB5MkEzREdjT0hpMXpRVTB4cmtHRDcycjdkSHloYmxp?=
 =?utf-8?B?eHhUbjFRbnR0S1haRURONFBaRlVYKzhaSWVKcjRoYnVuOEMvd0ZINzVoZlBn?=
 =?utf-8?B?eUFYaWcySnBMWVNad3AvcjR6ZlprMUxsb0xXZ1lUcktGMUdqckNkVXlkYjk5?=
 =?utf-8?B?SzN5WUdvQnlXTUI4VFc0ZGQ3TGhIK2o3V2FCV0dvak5FYzAvS0NtZGVGdEh4?=
 =?utf-8?B?ZFYwSHVoZGJhTjNHUS9tV3VuS3FFUFh5QmVQaGNISm5CZ1JiNzRBcFA3MnJE?=
 =?utf-8?B?UGJwaEMrUDZUOUtCV0hWeW9RdzhNbS9JTGY3UkVIcjdCNVhXS1FrM0pkbmV5?=
 =?utf-8?B?aGp2KzB4blpDblFnbDVrenA1L3RzSVhmWWIyQk0zMnlGR0VnTU95MHJURFJG?=
 =?utf-8?B?Qi9MbXhSNW5LSDBZMXFMWlBJL1FpTEJjdVZTenBDckhVbldVeW0wSW1UcUVr?=
 =?utf-8?B?UTh4dklqd284N0VPVWY4RG45YzhxOXNWMmtlL2RVNTB0amVCUW03aGcxMWVO?=
 =?utf-8?B?RkVnci9XbFNJWWpTVzRQWnB6R2NaRnVTVGd0SHp4WVd3aCttb2krb2VGeGlB?=
 =?utf-8?B?ZXpRR0ZBTkhtQk5EbUlVUWNBNWl0R0Fwenh1aG5nVzRDYjBSS3hvakJYY1Zu?=
 =?utf-8?B?YVgxc0tFSTAzd09qQXNXMkplbDQ4cC9BVlY2YkpjdUgrY1I4eE40b2lONW5Z?=
 =?utf-8?B?SVM5Y1hLT3FJeUs2Qk9RQWZBeFBXek52RnY1V0hsTjI0VEVEK1o0MlRBNktG?=
 =?utf-8?B?ZHZkQS9Xb3R1UzZQSUhWK1hXUjM1SWtEZGpaUWp3TEI0MTNoSm9MeUh1QWdR?=
 =?utf-8?B?TmRiMTFzNEgxazZKVWxidTVZWUVCcDdhTnltdGJNMWVGYWpjdHViaWhiSmx3?=
 =?utf-8?B?Ym93eFN6aC9HTjc3SzVvKzljb2ZzZm1Yb2V3NWUwVU41OUpkcmZNa3VoblVY?=
 =?utf-8?B?dHB5VEd0VGM1NlVPY2tRaU82ZURRZWt4OHBtVGczZ24rVnhaSWR1b2xFODdo?=
 =?utf-8?B?WUZlK2E5R3ZRMHZxeEhnTXg4cFh6T24xTzFqckhEQXlpT2RlQ0hCcFRWS0Z5?=
 =?utf-8?B?WjlsTGxKMkluNlk3NDlzWHBPNjNxZHcyNTFWUUs1VlVPUnJJOGUzVkQxT0Nm?=
 =?utf-8?B?bnRNQkdTUXpJMlh0UVdyNWdTc1BuSnhQN01mSC85YXljQ0xvZThTYlVYM0V2?=
 =?utf-8?B?ck1FVWxBd2lkdUxyWkdDb1RLUGgrdVlNTmpwQzZNcnVFY2VsZVR2bjl2eS8z?=
 =?utf-8?B?UDFYZEZsWDNySXFaS0NEOHFxTjFSd1EveXlQY1JNNTNacjVncERYb2Jtb3gv?=
 =?utf-8?B?MkJLbnJ1UUVPbVEwQXFKbVRVcUNIVnJrWWhlSG4yYWZWb2xIRW1JSVNPbHp5?=
 =?utf-8?B?T01uei9FdGdWeTl3K0RrbUdTQmEyT0tjSEZkUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3996.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5e762c-630d-43c6-6a08-08db5c90ec8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2023 19:56:11.6217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M/pNykPG/8A88eM3aUUJF3VPkeuZud8lusUsTbwF92AdBgsTqPML1KtzSjkesjsl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6469
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Russell,
 Kent" <Kent.Russell@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Mahfooz,
 Hamza" <Hamza.Mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkkgcmFuIHNvbWUgZXhwZXJpbWVu
dCB5ZXN0ZXJkYXkgdG8gdHVybiBvbiBDT05GSUdfV0VSUk9SIGFuZCBoZXJlIGFyZSBzb21lIHJl
c3VsdHMgKHN1bW1hcnk6IGdjYyAxMiBzZWVtcyBvayBidXQgZ2NjIDEzIGdpdmVzIGEgbG90IG1v
cmUgZXJyb3IsIGJ1dCBub3QgbmVjZXNzYXJpbHkgaW4gb3VyIG1vZHVsZS4pDQoNCkJ1aWxkIHdp
dGggZ2NjMTMgdXNpbmcgRmVkb3JhIDM4Og0KaHR0cDovL3p1dWwubGludXguYW1kLmNvbS90L29z
Zy9idWlsZC83MjJhZDc3YWZmZWQ0Zjk4OGQ3MjA1MWE4NDk3OWU5Zi9sb2cvam9iLW91dHB1dC50
eHQjMjkyNA0KDQpCdWlsZCB3aXRoIGdjYzEyIHVzaW5nIEZlZG9yYSAzNzoNCmh0dHA6Ly96dXVs
LmxpbnV4LmFtZC5jb20vdC9vc2cvYnVpbGQvOWU5MGYwOGJiZWIwNDRhMjk5N2E0MWI2Y2RjMTNm
MjkvbG9nL2pvYi1vdXRwdXQudHh0Izc1MzQNCg0KS2VubnkNCg0KPT09PT09PT09PT09PT09PT09
PT09PT09DQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4NClNlbnQ6
IFdlZG5lc2RheSwgTWF5IDI0LCAyMDIzIDM6NTAgUE0NClRvOiBLdWVobGluZywgRmVsaXggPEZl
bGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQpDYzogUnVzc2VsbCwgS2VudCA8S2VudC5SdXNzZWxsQGFt
ZC5jb20+OyBIbywgS2VubnkgPEtlbm55LkhvQGFtZC5jb20+OyBNYWhmb296LCBIYW16YSA8SGFt
emEuTWFoZm9vekBhbWQuY29tPjsgTGksIFN1biBwZW5nIChMZW8pIDxTdW5wZW5nLkxpQGFtZC5j
b20+OyBXZW50bGFuZCwgSGFycnkgPEhhcnJ5LldlbnRsYW5kQGFtZC5jb20+OyBQYW4sIFhpbmh1
aSA8WGluaHVpLlBhbkBhbWQuY29tPjsgU2lxdWVpcmEsIFJvZHJpZ28gPFJvZHJpZ28uU2lxdWVp
cmFAYW1kLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcg
PGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPjsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsg
RGF2aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJp
c3RpYW4uS29lbmlnQGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBkcm0vYW1kL2Rp
c3BsYXk6IGVuYWJsZSBtb3JlIHN0cmljdCBjb21waWxlIGNoZWNrcw0KDQpPbiBXZWQsIE1heSAy
NCwgMjAyMyBhdCAzOjQ24oCvUE0gRmVsaXggS3VlaGxpbmcgPGZlbGl4Lmt1ZWhsaW5nQGFtZC5j
b20+IHdyb3RlOg0KPg0KPiBTdXJlLCBJIHRoaW5rIHdlIHRyaWVkIGVuYWJsaW5nIHdhcm5pbmdz
IGFzIGVycm9ycyBiZWZvcmUgYW5kIGhhZCB0bw0KPiByZXZlcnQgaXQgYmVjYXVzZSBvZiB3ZWly
ZCBjb21waWxlciBxdWlya3Mgb3IgdGhlIHZhcmlldHkgb2YgY29tcGlsZXINCj4gdmVyc2lvbnMg
dGhhdCBuZWVkIHRvIGJlIHN1cHBvcnRlZC4NCj4NCj4gQWxleCwgYXJlIHlvdSBwbGFubmluZyB0
byB1cHN0cmVhbSB0aGlzLCBvciBpcyB0aGlzIG9ubHkgdG8gZW5mb3JjZSBtb3JlDQo+IGludGVy
bmFsIGRpc2NpcGxpbmUgYWJvdXQgbm90IGlnbm9yaW5nIHdhcm5pbmdzPw0KDQpJJ2QgbGlrZSB0
byB1cHN0cmVhbSBpdC4gIFVwc3RyZWFtIGFscmVhZHkgaGFzIENPTkZJR19XRVJST1IgYXMgYQ0K
Y29uZmlnIG9wdGlvbiwgYnV0IGl0J3MgYmVlbiBwcm9ibGVtYXRpYyB0byBlbmFibGUgaW4gQ0kg
YmVjYXVzZSBvZg0KdmFyaW91cyBicmVha2FnZXMgb3V0c2lkZSBvZiB0aGUgZHJpdmVyIGFuZCBp
biBkaWZmZXJlbnQgY29tcGlsZXJzLg0KVGhhdCBzYWlkLCBJIGRvbid0IGtub3cgaG93IG11Y2gg
dHJvdWJsZSBlbmFibGluZyBpdCB3aWxsIGNhdXNlIHdpdGgNCnZhcmlvdXMgY29tcGlsZXJzIGlu
IHRoZSB3aWxkLg0KDQpBbGV4DQoNCj4NCj4gUmVnYXJkcywNCj4gICAgRmVsaXgNCj4NCj4NCj4g
T24gMjAyMy0wNS0yNCAxNTo0MSwgUnVzc2VsbCwgS2VudCB3cm90ZToNCj4gPg0KPiA+IFtBTUQg
T2ZmaWNpYWwgVXNlIE9ubHkgLSBHZW5lcmFsXQ0KPiA+DQo+ID4NCj4gPiAoQWRkaW5nIEZlbGl4
IGluIENDKQ0KPiA+DQo+ID4gSeKAmW0gYSBmYW4gb2YgYWRkaW5nIGl0IHRvIEtGRCBhcyB3ZWxs
LiBGZWxpeCwgY2FuIHlvdSBmb3Jlc2VlIGFueQ0KPiA+IGlzc3VlcyBoZXJlPw0KPiA+DQo+ID4g
S2VudA0KPiA+DQo+ID4gKkZyb206KiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiAqT24gQmVoYWxmIE9mDQo+ID4gKkhvLCBLZW5ueQ0KPiA+ICpTZW50Oiog
V2VkbmVzZGF5LCBNYXkgMjQsIDIwMjMgMzoyMyBQTQ0KPiA+ICpUbzoqIEFsZXggRGV1Y2hlciA8
YWxleGRldWNoZXJAZ21haWwuY29tPjsgTWFoZm9veiwgSGFtemENCj4gPiA8SGFtemEuTWFoZm9v
ekBhbWQuY29tPg0KPiA+ICpDYzoqIExpLCBTdW4gcGVuZyAoTGVvKSA8U3VucGVuZy5MaUBhbWQu
Y29tPjsgV2VudGxhbmQsIEhhcnJ5DQo+ID4gPEhhcnJ5LldlbnRsYW5kQGFtZC5jb20+OyBQYW4s
IFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsgU2lxdWVpcmEsDQo+ID4gUm9kcmlnbyA8Um9k
cmlnby5TaXF1ZWlyYUBhbWQuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4g
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgRGFuaWVsDQo+ID4gVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBEZXVjaGVyLCBB
bGV4YW5kZXINCj4gPiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IERhdmlkIEFpcmxpZSA8
YWlybGllZEBnbWFpbC5jb20+OyBLb2VuaWcsDQo+ID4gQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29l
bmlnQGFtZC5jb20+DQo+ID4gKlN1YmplY3Q6KiBSZTogW1BBVENIIHYyXSBkcm0vYW1kL2Rpc3Bs
YXk6IGVuYWJsZSBtb3JlIHN0cmljdCBjb21waWxlDQo+ID4gY2hlY2tzDQo+ID4NCj4gPiBbQU1E
IE9mZmljaWFsIFVzZSBPbmx5IC0gR2VuZXJhbF0NCj4gPg0KPiA+IFtBTUQgT2ZmaWNpYWwgVXNl
IE9ubHkgLSBHZW5lcmFsXQ0KPiA+DQo+ID4gKCsgRmVsaXgpDQo+ID4NCj4gPiBTaG91bGQgd2Ug
ZG8gdGhlIHNhbWUgZm9yIG90aGVyIG1vZHVsZXMgdW5kZXIgYW1kIChhbWRrZmQpPyAgSSB3YXMN
Cj4gPiBnb2luZyB0byBlbmFibGUgZnVsbCBrZXJuZWwgd2Vycm9yIGluIHRoZSBrY29uZmlnIHVz
ZWQgYnkgbXkgQ0kgYnV0DQo+ID4gdGhpcyBpcyBwcm9iYWJseSBiZXR0ZXIuDQo+ID4NCj4gPiBL
ZW5ueQ0KPiA+DQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4NCj4gPiAqRnJvbToqQWxleCBEZXVj
aGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+DQo+ID4gKlNlbnQ6KiBXZWRuZXNkYXksIE1heSAy
NCwgMjAyMyAzOjIyIFBNDQo+ID4gKlRvOiogTWFoZm9veiwgSGFtemEgPEhhbXphLk1haGZvb3pA
YW1kLmNvbT4NCj4gPiAqQ2M6KiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8YW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+Ow0KPiA+IExpLCBTdW4gcGVuZyAoTGVvKSA8U3VucGVu
Zy5MaUBhbWQuY29tPjsgSG8sIEtlbm55IDxLZW5ueS5Ib0BhbWQuY29tPjsNCj4gPiBQYW4sIFhp
bmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsgU2lxdWVpcmEsIFJvZHJpZ28NCj4gPiA8Um9kcmln
by5TaXF1ZWlyYUBhbWQuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiA+IDxs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiA+IDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPjsNCj4gPiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5E
ZXVjaGVyQGFtZC5jb20+OyBEYXZpZCBBaXJsaWUNCj4gPiA8YWlybGllZEBnbWFpbC5jb20+OyBX
ZW50bGFuZCwgSGFycnkgPEhhcnJ5LldlbnRsYW5kQGFtZC5jb20+OyBLb2VuaWcsDQo+ID4gQ2hy
aXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQo+ID4gKlN1YmplY3Q6KiBSZTogW1BB
VENIIHYyXSBkcm0vYW1kL2Rpc3BsYXk6IGVuYWJsZSBtb3JlIHN0cmljdCBjb21waWxlDQo+ID4g
Y2hlY2tzDQo+ID4NCj4gPiBPbiBXZWQsIE1heSAyNCwgMjAyMyBhdCAzOjIw4oCvUE0gSGFtemEg
TWFoZm9veiA8aGFtemEubWFoZm9vekBhbWQuY29tPg0KPiA+IHdyb3RlOg0KPiA+ID4NCj4gPiA+
IEN1cnJlbnRseSwgdGhlcmUgYXJlIHF1aXRlIGEgbnVtYmVyIG9mIGlzc3VlcyB0aGF0IGFyZSBx
dWl0ZSBlYXN5IGZvcg0KPiA+ID4gdGhlIENJIHRvIGNhdGNoLCB0aGF0IHNsaXAgdGhyb3VnaCB0
aGUgY3JhY2tzLiBBbW9uZyB0aGVtLCB0aGVyZSBhcmUNCj4gPiA+IHVudXNlZCB2YXJpYWJsZSBh
bmQgaW5kZW50YXRpb24gaXNzdWVzLiBBbHNvLCB3ZSBzaG91bGQgY29uc2lkZXIgYWxsDQo+ID4g
PiB3YXJuaW5ncyB0byBiZSBjb21waWxlIGVycm9ycywgc2luY2UgdGhlIGNvbW11bml0eSB3aWxs
IGV2ZW50dWFsbHkgZW5kDQo+ID4gPiB1cCBjb21wbGFpbmluZyBhYm91dCB0aGVtLiBTbywgZW5h
YmxlIC1XZXJyb3IsIC1XdW51c2VkIGFuZA0KPiA+ID4gLVdtaXNsZWFkaW5nLWluZGVudGF0aW9u
IGZvciBhbGwga2VybmVsIGJ1aWxkcy4NCj4gPiA+DQo+ID4gPiBDYzogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiA+ID4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJy
eS53ZW50bGFuZEBhbWQuY29tPg0KPiA+ID4gQ2M6IEtlbm55IEhvIDxrZW5ueS5ob0BhbWQuY29t
Pg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogSGFtemEgTWFoZm9veiA8aGFtemEubWFoZm9vekBhbWQu
Y29tPg0KPiA+ID4gLS0tDQo+ID4gPiB2MjogZml4IGdyYW1tYXRpY2FsIGVycm9yDQo+ID4gPiAt
LS0NCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvTWFrZWZpbGUgfCAyICsrDQo+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+ID4NCj4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvTWFrZWZpbGUNCj4gPiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9NYWtlZmlsZQ0KPiA+ID4gaW5kZXggMGQ2MTBjYjM3NmJi
Li4zYzQ0MTYyZWJlMjEgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvTWFrZWZpbGUNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9N
YWtlZmlsZQ0KPiA+ID4gQEAgLTI2LDYgKzI2LDggQEANCj4gPiA+DQo+ID4gPiAgQU1EREFMUEFU
SCA9ICQoUkVMQVRJVkVfQU1EX0RJU1BMQVlfUEFUSCkNCj4gPiA+DQo+ID4gPiArc3ViZGlyLWNj
ZmxhZ3MteSArPSAtV2Vycm9yIC1XdW51c2VkIC1XbWlzbGVhZGluZy1pbmRlbnRhdGlvbg0KPiA+
ID4gKw0KPiA+DQo+ID4gQ2FyZSB0byBlbmFibGUgdGhpcyBmb3IgdGhlIHJlc3Qgb2YgYW1kZ3B1
IGFzIHdlbGw/ICBPciBzZW5kIG91dCBhbg0KPiA+IGFkZGl0aW9uYWwgcGF0Y2ggdG8gZG8gdGhh
dD8gIEVpdGhlciB3YXk6DQo+ID4gUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4NCj4gPg0KPiA+IEFsZXgNCj4gPg0KPiA+ID4gIHN1YmRpci1jY2Zs
YWdzLXkgKz0gLUkkKEZVTExfQU1EX0RJU1BMQVlfUEFUSCkvZGMvaW5jLw0KPiA+ID4gIHN1YmRp
ci1jY2ZsYWdzLXkgKz0gLUkkKEZVTExfQU1EX0RJU1BMQVlfUEFUSCkvZGMvaW5jL2h3DQo+ID4g
PiAgc3ViZGlyLWNjZmxhZ3MteSArPSAtSSQoRlVMTF9BTURfRElTUExBWV9QQVRIKS9kYy9jbGtf
bWdyDQo+ID4gPiAtLQ0KPiA+ID4gMi40MC4xDQo+ID4gPg0KPiA+DQo=

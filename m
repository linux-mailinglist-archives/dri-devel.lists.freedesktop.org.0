Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E8F5932AB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 18:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C68CC30FC;
	Mon, 15 Aug 2022 16:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EAACD3FB;
 Mon, 15 Aug 2022 16:00:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HsSbp3ejNFAmZ16At+YUMKtP+Gy8JSdx5rQXBkknGqJyluRN7d4xk+LGtE9GnwlcpbjG5EqlO7qrVI9xwYnYHGH6BuFJQ8siBw/+jBJN0WvUt7Dzv+KKlXK9KN3Df03yU4UkH57qrQQOohsLWpU6v3whgSCh6lxDh2duYL18qlUmYJe9Fg6EknMzaMj7hgBKLGv5GCZcet6nhjlcQJSW9G4VtGqx9TBeArlgq53jgNXKsJ9HHbC/SJ9P69Wfuh1wrLOuUQMD8EeqBC8d69ty3uqWSWCLQXf2MKGW7HCO/6baZH7J/nsSrl6TPF9suIZAJsFqdWqdIqbHcXhaO1B/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7snYUgrV261aVg+yAsfGOUl3YJClmwL1Km/dJSBgVnw=;
 b=UmgAPGOyliUwnmTnoUQq2e3G6zLtb+oHFAWmiPgyhpMmbrhHRrmIe2lRzZyqzV+jrefm7z3UjjewYXaWWsjKq6ri2SLM9BxtiGneFu+HqYvpn0NwwwxVu3yumaMIVhgDWUSu28PibGm3HqS+3UNaMj676hnCGZ38Yc3Ad6SCepykUCQOquEAy/2O1JDsyDcLzx0f/d8iMTFGAYloLry2VM7tZxAtCnrEdruUJmm3oZtbvUVAMEygFyuYjFS8SSUPiGZZjqwXm/bwDIpCBdW9CoaB+Zc7FCERz70zdJ35THxKWKGc0ELNR0e5rQQpibQbGaAgAUm62a2ZrO075FXOAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7snYUgrV261aVg+yAsfGOUl3YJClmwL1Km/dJSBgVnw=;
 b=aB9N/lBD17y/97OXoTzN+snjO32d8J7x88eCTsB5oiyNJygBO9rNEeHVDtioVpOwxcrzLzfDcoDIrqNJ0cP/CI56+KUgPVRRaTg/xadGlot7vMDIBh+bTEVRGlgyPwsP2Yqvemmotk2J5YgQiXMIcX+Khr0t04jAsOZCqWcDbRg=
Received: from SJ1PR12MB6194.namprd12.prod.outlook.com (2603:10b6:a03:458::12)
 by DM6PR12MB3868.namprd12.prod.outlook.com (2603:10b6:5:1c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 16:00:19 +0000
Received: from SJ1PR12MB6194.namprd12.prod.outlook.com
 ([fe80::bc88:3db6:f931:98fc]) by SJ1PR12MB6194.namprd12.prod.outlook.com
 ([fe80::bc88:3db6:f931:98fc%5]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 16:00:19 +0000
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
Thread-Index: AQHYsHTWuO318jhUpE6H84biXg/lfq2v+0DggAAWYACAAADcQIAACwsAgAAAujA=
Date: Mon, 15 Aug 2022 16:00:19 +0000
Message-ID: <SJ1PR12MB6194033EC36251B95A6737A095689@SJ1PR12MB6194.namprd12.prod.outlook.com>
References: <20220815070056.10816-1-khalid.masum.92@gmail.com>
 <SJ1PR12MB61944B1D53330D5E9531158695689@SJ1PR12MB6194.namprd12.prod.outlook.com>
 <86088c17-585c-4a53-312d-ef339b824538@gmail.com>
 <SJ1PR12MB6194C83D51101ACD97B55F0295689@SJ1PR12MB6194.namprd12.prod.outlook.com>
 <f8734af1-6e31-75c9-9556-9519709284f1@gmail.com>
In-Reply-To: <f8734af1-6e31-75c9-9556-9519709284f1@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=4e257e2e-ec4f-4482-9d48-fc86a03a369a;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-08-15T15:56:30Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6ad411e-dca7-48a2-bcfa-08da7ed740dd
x-ms-traffictypediagnostic: DM6PR12MB3868:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xwKSYzFOR4qNLDOu0lOJ9PNyBhVxGbwfLtSiin9QCAeH/DSlh5YCmnj1eDSRNXStN1CTjJcCnbkCrUmRvKv3/Kutg+I91IyuLOdefIG11J9ufJlid3nFi9hHlJf2Ne/IaaAEL8ydFMpARGT0bL3Hod35iAV2yRJQL4NAnhM73o/kRBF3kAvIYqlfbR+IkTPWIiq7p9Dt8F5h6bA7Q6+3yS2mwp4+VpRrsu8gM4j4WBVb0GM7iZema4DoFsuUZabqRE+yvS2dfLeLmEEfGbIRtkVhLL1dAlXR+/BdZLfYiV6ZkuXSDi3lPqwhB1WgSBi4brTYBw4mYfp4h/+QbeuDQZwUUp4wborAGvE5tEhtWBxArkSTL9QycB+NzRQPTcxXPKnhEyxmAM70tdu0N7EDTGOFr/eR6Yd2TbBnmqHSjSkQOr8/JNpgGhz/61hbFHQ/vP+GXtIuJ4YPa2NjmCv/jPFnPs2xpbNi3yTfhS/dlJEIC76iTgnpWeLy1ETkv7cycQMH5FyEcMA8DovUwHpRKOS2/vm3v5kncDein0N88IL21qMPLCSGnL7r/ptndZgtbn1lQogIMWJMbewNqC4B82B7q25SAni4qPPs/TehLuCGXI+Rv1ZUvAB8mOwSYKX1Z5FkbInOS4dKW8z0iFB2WdWbRwaAzqTI39Tzu41v9gE/YGbTotyN0t/oxqgVfyjhxykRPym2233Et/7IiFIygup0ZFSSNzRxVNepKIsjXRBlYkRttpgWZwK4eBGQyBiVYRwJgMHkke8oVzjUOqeffLxSDrMzzwRJ1gwwR/CDQxY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR12MB6194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(9686003)(26005)(2906002)(41300700001)(7696005)(52536014)(55016003)(8936002)(6506007)(110136005)(53546011)(86362001)(71200400001)(54906003)(478600001)(66556008)(38070700005)(33656002)(83380400001)(186003)(76116006)(8676002)(66946007)(66476007)(316002)(5660300002)(122000001)(64756008)(38100700002)(66446008)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3J6QmE3d1h3ckF0MGtIOVNoeEl6clFXNWQyRnNrLzV3MFJFcktyeVVjdVAv?=
 =?utf-8?B?N2dzdkxjb0xQZzM1V0l1S2dtampqVG5zUll2Z2U0eTNES1B5V1ZmYjNzSHlO?=
 =?utf-8?B?SWJrTGt1K29NLzVidk5wODNzYU1nVXBLdFd3S3dDa3lhZ01XdTBmMjVzbjZx?=
 =?utf-8?B?NzRIVlpYaW9oTnAzRlVoTkxxWEVhUDR0dXZQNXdUYmFWNFArbkZvclpxWXBa?=
 =?utf-8?B?cEl4OEV3WWtrdzlJL3RDa0dLcmV0ZXZoYVJzSVZpeGd4SkI5VCtORDJxelFo?=
 =?utf-8?B?YWxWak5NK3ZyOFZnTnIram5yUERGa1NKeHIvaDRWU2d4eVVkWXVvMVdCaVlD?=
 =?utf-8?B?SnRMQmM5c3hZNnBNS3o5MXBCTnFLZlM4cWNXV0M1NHR6RWFTRXdMOTRWNW8w?=
 =?utf-8?B?d0ttQnkrbzBXQWZrZkkrNWV4L0NRemMzTUZwRU9XMm4vK05qSzEvd0IzT3V1?=
 =?utf-8?B?VDF5dG04L1JRSHRkNmlOZlhZUGJKd1FSOWxlNHNlcGdDalpuckZHWW13cCtJ?=
 =?utf-8?B?c2lVMjgySkYxV0xNWFF6ZTYwWVB6QlNpWklCUC9zcCs3ako3c3NiNnlydGkz?=
 =?utf-8?B?MHRnaUlRK2NZRmxnNDlCWEN5ZDNkUTdyWmJiTUk0WTgxcDdXK3VMNFlaQjBr?=
 =?utf-8?B?L0pwUGlWTmkrUHl3K2hKMUFEQU5ORlp5MlZUK0FhVVhhNU44dloxTXZFdGwy?=
 =?utf-8?B?aW5wZ0Nzc3RaTEZkMWFjQW1pSXJ0aUFBdEl3Ulh0RGgxbjlUd3FQbTZMZUNC?=
 =?utf-8?B?aDZ6cWNmYndqT2w1M2lIUzlpTEV1clRSWVdhZmpoamZxeW9MbWt5L3lvUDVv?=
 =?utf-8?B?N1o2enJBY1NwV3VhVlU1M2hWalN1S3lHTGlpRUJVUGxraWQ1eTNYWlZYS3NR?=
 =?utf-8?B?ZzZVYkI0SkpROXQvMm9vc0loTnJkZTFHQnpXUDkyMXFMcWZ1akgzNHdndkYv?=
 =?utf-8?B?VDF4TG5oNm9McnpCODBqek9TVEZqYVJlelpBak1ZWFFQQko5YzBHaEM0NHRX?=
 =?utf-8?B?R1BSaEx4eGEvQjNmL0pWd1BKN0dTeWtjb3lkVlFuV1Z2VHdRUDhJenVGSFdn?=
 =?utf-8?B?YXlydEluQnpPVlBjcXVaeXRzMkZBUnk2Q0V0MFllWElsM2lEY3N6UjNZVVJk?=
 =?utf-8?B?MDlCWmY2Ny96b1hMWllIY29kMG5wL3k5ejhPOExDei8rT2lGNW1MYjdZYkVF?=
 =?utf-8?B?NmNyUHFOUzVYaENXaldjRmo2K1BZN3BvanlNK3E5aWEyR0hPMjRhL0V1dFRN?=
 =?utf-8?B?MW9BNnoyeVdsN0lNVVoxcTFzRTJqbStEbytEbUV6bnFJeFZrV001cVdGNk9s?=
 =?utf-8?B?MU03Q29tM25NRXhwR2p3RTVsQTR1ejNaZ0cyYUNQS2crZHF2VHlZMko1dkd6?=
 =?utf-8?B?Vi8rVDlML1NWamVBRlVKMUc0SWZXRUVjMjBoME1wUWg5L1owMW53V1QrWkVi?=
 =?utf-8?B?K1o5NllQQmZKa1N4V2V6VFZiOHZuUUUzOU5MbXUrTjQxbHVYVDVBOXFsbFRK?=
 =?utf-8?B?YzJ4U2JGS2dXeVoydWRHTDQzTE5iUXlkS2k5K0taMTZMUi8wSWl1Mk9aQ3Fm?=
 =?utf-8?B?aXFObElCMXNxVXZhRVZyKy9TN0lnbExQM0xuQmNYVG9TbExvcDQ2VHZvOUc5?=
 =?utf-8?B?Sm5CNlAyOVBEVi9ZWk1xN0hkejZGNDEwQWkzd2dHaDV5M3ozQVhGODZWNnR4?=
 =?utf-8?B?algyQnduajZ4dXBWTXJjb0k2em13QmFlb096R1dTRkNXRzMxb04vaWFXR245?=
 =?utf-8?B?ZENGTzgyUGtBaG4xaDZ1clpkTG1zS3ZuV1BGNUFubllnakZhLzdtRUdkZjdN?=
 =?utf-8?B?cmczV2FrVElBbTVJSUFETmhJNDhOMDZJS2MvalVSS0VQcFAwOTdET2Vxb1BJ?=
 =?utf-8?B?N2E5OWVESFI4NkhmK0plTmNHWWlyOVRJU2d0SWZiRjhmY0Z0QUVhaStVTXQ0?=
 =?utf-8?B?andBV1hOR2hTdDBxd2taaUl5b2lQb1pyVlc1dFpyRzZnanR1Mzc2QlpVM0lh?=
 =?utf-8?B?aHQ0MUdYWUorMTlDREpIWTFWc3FmN1AxaGpvM0xxYjNKSk8vQ0greDNNSWUz?=
 =?utf-8?B?Zk9SUGM2dVFIM2wzMitqMmIzWmVRTmtLMVg4MmhtTDdGT1hoRCtETjR1TS9j?=
 =?utf-8?Q?FaaA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ad411e-dca7-48a2-bcfa-08da7ed740dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 16:00:19.7063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6SqgSDGlbbr9wTBi/+DN8uYLccxanejjrsODKiy3GKjfM0OJKrwk7F/IQrZVJIz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3868
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNClRoZW4gcGxlYXNlIHVwZGF0ZSBj
b21taXQgbWVzc2FnZSwgdGhpcyBjaGFuZ2UgaXMgZHVlIHRvICJ2YWx1ZSByIGlzIG5ldmVyIHVz
ZWQsIGFuZCByZW1vdmUgdW5uZWNlc3NhcnkgYXNzaWdubWVudCIsIHRoYXQgbWFrZXMgc2Vuc2Ug
dG8gbWUuDQoNClRoYW5rcw0KUnVpamluZw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogS2hhbGlkIE1hc3VtIDxraGFsaWQubWFzdW0uOTJAZ21haWwuY29tPg0KU2VudDogTW9u
ZGF5LCBBdWd1c3QgMTUsIDIwMjIgMTE6NTQgQU0NClRvOiBEb25nLCBSdWlqaW5nIDxSdWlqaW5n
LkRvbmdAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnDQpDYzogRGV1Y2hlciwg
QWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4g
PENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5j
b20+OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+OyBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+OyBaaHUsIEphbWVzIDxKYW1lcy5aaHVAYW1kLmNvbT47IEppYW5nLCBTb25u
eSA8U29ubnkuSmlhbmdAYW1kLmNvbT47IFdhbiBKaWFiaW5nIDx3YW5qaWFiaW5nQHZpdm8uY29t
PjsgTGl1LCBMZW8gPExlby5MaXVAYW1kLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggbGludXgt
bmV4dF0gZHJtL2FtZGdwdS92Y246IFJlbW92ZSB1bnVzZWQgYXNzaWdubWVudCBpbiB2Y25fdjRf
MF9zdG9wDQoNCk9uIDgvMTUvMjIgMjE6MTcsIERvbmcsIFJ1aWppbmcgd3JvdGU6DQo+IFtBTUQg
T2ZmaWNpYWwgVXNlIE9ubHkgLSBHZW5lcmFsXQ0KPg0KPiBJZiB0aGUgY29uZGl0aW9uIHdhcyBt
ZXQgYW5kIGl0IGNhbWUgdG8gZXhlY3V0ZSB2Y25fNF8wX3N0b3BfZHBnX21vZGUsIHRoZW4gaXQg
d291bGQgbmV2ZXIgaGF2ZSBhIGNoYW5jZSB0byBnbyBmb3IgLyp3YWl0IGZvciB2Y24gaWRsZSov
LCBpc24ndCBpdD8NCg0KSHlwb3RoZXRpY2FsbHksIHNvbWUgb3RoZXIgdGhyZWFkIG1pZ2h0IHNl
dCBhZGV2LT5wZ19mbGFncyBOVUxMIGFuZCBpbiB0aGF0IGNhc2UgaXQgd2lsbCBnZXQgdGhlIGNo
YW5jZSB0byBnbyBmb3IgLyogd2FpdCBmb3IgdmNuIGlkbGUgKi8uDQoNCg0KPiBJIHN0aWxsIGRp
ZG4ndCBzZWUgb2J2aW91cyBwdXJwb3NlIG9mIHRoaXMgY2hhbmdlLg0KPg0KPiAgICAgICAgICAg
ICAgICAgIGlmIChhZGV2LT5wZ19mbGFncyAmIEFNRF9QR19TVVBQT1JUX1ZDTl9EUEcpIHsNCj4g
ICAgICAgPT0+ICAgICAgICAgICAgICByID0gdmNuX3Y0XzBfc3RvcF9kcGdfbW9kZShhZGV2LCBp
KTsNCg0KUmVnYXJkbGVzcyBvZiB0aGF0LCB0aGlzIGFzc2lnbm1lbnQgdG8gciBpcyB1bm5lY2Vz
c2FyeS4gQmVjYXVzZSB0aGlzDQp2YWx1ZSBvZiByIGlzIG5ldmVyIHVzZWQuIFRoaXMgcGF0Y2gg
c2ltcGx5IHJlbW92ZXMgdGhpcyB1bm5lY2Vzc2FyeQ0KYXNzaWdubWVudC4NCg0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiAgICAgICAgICAgICAgICAgICB9DQo+DQo+
ICAgICAgICAgICAgICAgICAgIC8qIHdhaXQgZm9yIHZjbiBpZGxlICovDQo+ICAgICAgICAgICAg
ICAgICAgIHIgPSBTT0MxNV9XQUlUX09OX1JSRUcoVkNOLCBpLCByZWdVVkRfU1RBVFVTLCBVVkRf
U1RBVFVTX19JRExFLCAweDcpOw0KPg0KPiBUaGFua3MNCj4gUnVpamluZw0KPg0KDQpUaGFua3Ms
DQogICAtLSBLaGFsaWQgTWFzdW0NCg==

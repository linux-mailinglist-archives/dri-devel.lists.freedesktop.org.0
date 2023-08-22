Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6E67845C5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 17:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A672610E393;
	Tue, 22 Aug 2023 15:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D3410E391;
 Tue, 22 Aug 2023 15:39:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzkIg2pN+Ugoscc0CgG4MWQnxLVlY8TVuSDQsbAXOIeAtsy9ZltSxNXSQ5rnuVrzUpwqOBvW4HOqonNTqvev7SYsOjVT2/ltRgmjL88/8MpMGgbz89oPTaAiAXEXgzBTAcP9I/Wxwu7qorqgY73Hw34cLuxe8Xpouws3TrJaWsqkFgWu+Yk1PDiA0IJ00lqav44wb05hBZOvFZGp+vc7KvHUxvKAOigiNssH6iA+EY3uC/7G3/86edVXJSnz+FI/rOuSFSAUntS+hj5lzPfMa2KDHTD4zSvoIvNgSyyaeAmibuXzoxMrGBFjL6T7gBO8yLYs35z4+zqVnTdkfDxGVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOSIkAfz+sIs+9rXwuNiWdMvhgYU/dRm/C+7HeuuPmc=;
 b=jh0JZTh5Kw0J3I9YFLoPLcdbK4/GddiB4SpIG6fSnQjb0viC9eXyNcCb1iRmfwcZjVrIUn5/qf8R4eRdZ6Qp3TozvyTWJW7dI2H8KIOJWb1cX4mZyGK9YitaGBawogAR8YcDfwwf39/fRsEDxWQecTuZBOII6Amo+Gmi1WidY2qjJAtxtVMsHnZhS7V29+a08VY9semjIiN88F0tl4quBqJUc7gvjrBRw2PlvoN1Ybx/e9jBIs8I0k1BmOm0djfuO3jRcfoijqOsk3d78ubeGlDmtU01p6vQZzcMfjE+ENDxjz6MWnTugFg9cKmtsidFW1hEbe26TRn790inMqB+QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOSIkAfz+sIs+9rXwuNiWdMvhgYU/dRm/C+7HeuuPmc=;
 b=R5jXaDjxI2Lmeo2jnvXSaObWKiYIjNXWjXiHTVd3FAOrA3VnXI46WZpefxBHY1lgJhBpxTqJDZAoc+vA75CZ8XUhf/njFkQ32wy6RMY806AgDMZFuIQzR3kJilA+yymI3R2WkGuu0afES/zlUilVobpGdbRYpRCEDYQ3sKmulNM=
Received: from BN9PR12MB5146.namprd12.prod.outlook.com (2603:10b6:408:137::16)
 by PH7PR12MB9075.namprd12.prod.outlook.com (2603:10b6:510:2f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 15:39:30 +0000
Received: from BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::858f:e2c1:3f1e:fefe]) by BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::858f:e2c1:3f1e:fefe%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 15:39:30 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Sasha Levin <sashal@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH AUTOSEL 6.4 11/11] drm/amdkfd: disable IOMMUv2 support for
 Raven
Thread-Topic: [PATCH AUTOSEL 6.4 11/11] drm/amdkfd: disable IOMMUv2 support
 for Raven
Thread-Index: AQHZ1OzllPBwJJxnfUGAZu/Pwn6Z+q/2c8Ig
Date: Tue, 22 Aug 2023 15:39:30 +0000
Message-ID: <BN9PR12MB51467557D8E5FEA426BBC7BEF71FA@BN9PR12MB5146.namprd12.prod.outlook.com>
References: <20230822113553.3551206-1-sashal@kernel.org>
 <20230822113553.3551206-11-sashal@kernel.org>
In-Reply-To: <20230822113553.3551206-11-sashal@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=efe47be6-ed58-4635-87b4-bfcf698e0e1b;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-08-22T15:39:22Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5146:EE_|PH7PR12MB9075:EE_
x-ms-office365-filtering-correlation-id: a15e3079-7306-4238-78cd-08dba325fa14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /jmYrSYp/na1XKdj/af5IaNjUJ79jxrb8coipo74q7IUd2ZR34q1KZivm7zV4BR+mvONoxz7YLoRxsyUTC2tjU4hIgCD4StF5WaLzWEy90V5ZYwM6oBBhNTwSmQuQrcJqmhU2VDUIfVqKJZNi6PwYphq8R3ZluITESPYHjKLnDgz2G9eJnxKsBsK4fztMP8Ex6zdESfUgNobSyV+QLocq8NSObjUjyWTsYUnoAYL8YFmLGoEgJk9fggXhb3MgsZAFJoRI1OUJ2Ynzh6mYdJSrqAHmGMzB8yqLQ1IeqIjmiYl/Ipb35DvBpUK7SAXLLSTpiypGKYOCX1Ik6NsJjY8rgwWLuw5iL/a8XTOKz5DhbMp/9sdwzStQf61JlcKAiL29z0o1ZbWTd+mQog6y40ft0aUoGbyk2VkO4M1WhIQMn6WkgMEZn6k+7DG16J+IOzBlWa3BcZHvJlGVN7NAJhol2u323OukUV9ojWHIiTBQXmHb64LgLFwLgpkMSy1ssw2ZaRAzmViS880Z3uSOR/fsoIWv2+1PI50ZpDzGBHKCFkv5CSrHL1ifZty41kkljxflqtPqFkiYu8PSQ+9DW+jPMmT+gybtGpRNL5hxJYqw+x7+OhL/kaT8M0ZCiK1gn/c
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5146.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(1800799009)(186009)(451199024)(66446008)(54906003)(66556008)(66946007)(64756008)(9686003)(66476007)(76116006)(316002)(110136005)(8936002)(8676002)(4326008)(41300700001)(122000001)(478600001)(71200400001)(55016003)(7696005)(6506007)(53546011)(38100700002)(66574015)(2906002)(83380400001)(86362001)(38070700005)(5660300002)(26005)(33656002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MW90WUIxMEZjYklic2tKb2dLajMyR2pCQlVHOFowbVlIdUpvdkpzLzFqMGFx?=
 =?utf-8?B?RGtWNzdSbFNBTk5QUVN2MnR4SW9ScC84cFh5bE83K3NobnlvRCsyOTVOdk1Z?=
 =?utf-8?B?SWJOeFRCcWtGK1A5MFptcG1XbGp5aFBaZjA3bzdFb0pRaGUvTzd3MHdZaUxD?=
 =?utf-8?B?VWhXcWd2MnoxWndNRnVhOHB3OE5ETm1GYmtseTJTSjZlYWFKeTFiUWhrZlN0?=
 =?utf-8?B?SDJWMVFpWEVnMDFzTXgyNy81RzlHTXljOEh2YWt5SWNlK2R5N212YkR6cTRj?=
 =?utf-8?B?NkhLU3AwOUdObkY5SnVYVlhYU1NqNDlZWW5SUHZWWXpCS1hBTDgyVHVPYy9E?=
 =?utf-8?B?VmNWUUtYWXRma0xQNWYvVmFQTmFUbGdEbVhVUFdhRkJTMFgrRFpKOCs4WGND?=
 =?utf-8?B?dm8rdnNMYk1paDU1Y1VhemZxTmNENS9Mc0g3QmhqcnNpQ2lWSXREUWRBZUtW?=
 =?utf-8?B?cTg4NHFTV1poYWJpd29zRThRazIrZURBYm5HeCtrWlFrYVdwenZqQzRVbnN6?=
 =?utf-8?B?ZG10NU9xWHkybUJ5RzhKUUdBbHhnNlpsdFhoZVp4dlowenNzdjVNQi95RW1z?=
 =?utf-8?B?dGF2ekh5QzdzYWF2MitKQkhIanUvUkNEWml4d1FBVytuNkpaZFNXcForQ0Fk?=
 =?utf-8?B?RUFUMkJQWHhXY05hR01nK25KT3FDYVh3RnlhNzQrbkZJdDI2ZXg2Z1pzbUVq?=
 =?utf-8?B?SXBCN1hIQUdRdmNQOFE1MjhzSnVqOGg2NUl4c0tpd05sSUc2V2ZxTEY1NTdw?=
 =?utf-8?B?TjlPdFZhVXBBN0t6bTBFWStCZGgxeVBaK0dkMDBMUVhLYkNyWTdmeGIrRGFn?=
 =?utf-8?B?MnBSU2J1cnM3alhIclVGalJUZkpuVWxSZDE3WEg1SThwbkJPWWRzMU5mTkxp?=
 =?utf-8?B?VTlEUTFvRVVSeHE3ZU1qV25CcWRBeUNPNTljUmZ1TWhQZm0vV0JQK3hYR055?=
 =?utf-8?B?OWxUVjNDRDhoSFFJVTFnTjlaZDRkUzBrT0JzcmNDbkJHemkydFVvUVYyQnJo?=
 =?utf-8?B?dUFXWFRObEQvOHJpeDlrT2xvMm0xWEFRdVFhdDByMlhpTUNUNFNlTWZ4b08y?=
 =?utf-8?B?cm5tMllwV0FzaktSN1JmKys3M1pnMmpoMUJ2d0Jna1U5OFZESmhtVnh6QWNR?=
 =?utf-8?B?VVkrazVnN0RxQkRtUlhGRys5d214M09RTGM2dTZzK3pDQlVIYldPa3NTRVQ3?=
 =?utf-8?B?MFRPYXFPRThFajErak95TWhiNWorZGlBRUp2Uy9ZUjlyYXJjd0g5aFMxYzh4?=
 =?utf-8?B?VVBCeXFrcW9icE9xb1hDSTl5TEdSVEkzQUhHbzlDcjVveDhoNXpVbXhjTTRM?=
 =?utf-8?B?ME5iTEJGOSt5SHY0cEtLVUxrMVowOTNpSnJUeHVERWZhTk5rMHZvR0lxWHJB?=
 =?utf-8?B?MFBmTFVQbjhZLzBGNU1IWlVyVHBGQnVlcFFyVjh3U211dDYxUlpMWVYrTGF5?=
 =?utf-8?B?T010Mmt1Tm5McHl6MWZ3MlNNREY3bjRrbTJJVmY0REpNa2hKcVhqZkcwd2d6?=
 =?utf-8?B?RE5CYWE1SnlDRytjUDMvL0dDVFU5NVV6TmdFKzNuMkRtRWJZK1Z4dERaUVN2?=
 =?utf-8?B?SkdVd3lzT2ZkeFdQV21nTE1mQkJFdGZkdTZ0N2JtZjlMS0dSNW9SNFRPc0Fl?=
 =?utf-8?B?YUFNSHNyc3llUGZXNDFIblB0cnRLaFFPS3dsdis4SVNQZ2FMR3JyUE9NSzYy?=
 =?utf-8?B?aWcwM1NrNEVYK2t4eDgvR3NQbWI3UDFScmVMNkJUV016SE92VklKTlgwb1hs?=
 =?utf-8?B?dDRVVisrV2FjMGJtaWxhbCt1aWdlTEw2YnoyUms2MTh3c1hySWd0UWJwcDlt?=
 =?utf-8?B?ekhyN1hibk9xRmFBSytCTThWenJmSFVhRUpDNXExSGFabmlyaGJEcm1MY01K?=
 =?utf-8?B?U1pwVTJXQVpHTTcwOThBbWhwdDBZUGNvNlE5RzAyWEYrdWY3ZFF3aStyeDZh?=
 =?utf-8?B?Ly9aTDF2b2hCaUt0NlBNYkEwSUhJODNuNnFnNlpZbllERXVhZFZ6dDVUaVIr?=
 =?utf-8?B?MW44aDR2Rklid01nNmZtNGwwRkc2K2ZkZHV4dHJOTzU4NnMvYlVSekNXVlEx?=
 =?utf-8?B?UlB3SzBvQWpMYWlpMkt1RFl1RS80QVVzaHBJVVJOTzNDUWdwSXVnUmhGQVJ6?=
 =?utf-8?Q?cNvs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5146.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a15e3079-7306-4238-78cd-08dba325fa14
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 15:39:30.7689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ql24c9fC1a+XMxfe+yHwDs+RPB2BWukf2YxrTz5ohIVSK8g6kKcGjWBaKLE9l5iMNJUYGQd/X8JTJme65wfGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9075
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTYXNoYSBM
ZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyMiwgMjAy
MyA3OjM2IEFNDQo+IFRvOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBzdGFibGVAdmdl
ci5rZXJuZWwub3JnDQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+OyBLdWVobGluZywgRmVsaXgNCj4gPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBL
b2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsNCj4gTWlrZSBMb3Ro
aWFuIDxtaWtlQGZpcmVidXJuLmNvLnVrPjsgU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3Jn
PjsgUGFuLA0KPiBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT47IGFpcmxpZWRAZ21haWwuY29t
OyBkYW5pZWxAZmZ3bGwuY2g7IGFtZC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0ggQVVUT1NFTCA2
LjQgMTEvMTFdIGRybS9hbWRrZmQ6IGRpc2FibGUgSU9NTVV2Mg0KPiBzdXBwb3J0IGZvciBSYXZl
bg0KPg0KPiBGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+
DQo+IFsgVXBzdHJlYW0gY29tbWl0IDA5MWFlNTQ3M2Y5NmNlZDg0NGFmNmJhMzliOTQ3NTczNTli
MTIzNDggXQ0KPg0KPiBVc2UgdGhlIGRHUFUgcGF0aCBpbnN0ZWFkLiAgVGhlcmUgd2VyZSBhIGxv
dCBvZiBwbGF0Zm9ybSBpc3N1ZXMgd2l0aCBJT01NVQ0KPiBpbiBnZW5lcmFsIG9uIHRoZXNlIGNo
aXBzIGR1ZSB0byB3aW5kb3dzIG5vdCBlbmFibGluZyBJT01NVSBhdCB0aGUgdGltZS4NCj4gVGhl
IGRHUFUgcGF0aCBoYXMgYmVlbiB1c2VkIGZvciBhIGxvbmcgdGltZSB3aXRoIG5ld2VyIEFQVXMg
YW5kIHdvcmtzDQo+IGZpbmUuICBUaGlzIGFsc28gcGF2ZXMgdGhlIHdheSB0byBzaW1wbGlmeSB0
aGUgZHJpdmVyIHNpZ25pZmljYW50bHkuDQoNClRoaXMgaXMgbm90IG5lZWRlZCBmb3Igc3RhYmxl
Lg0KDQpBbGV4DQoNCj4NCj4gUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVo
bGluZ0BhbWQuY29tPg0KPiBBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPg0KPiBUZXN0ZWQtYnk6IE1pa2UgTG90aGlhbiA8bWlrZUBmaXJlYnVybi5j
by51az4NCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIHwgNyAt
LS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0KPiBpbmRleCA5YzgxOTc1NzNkZWU3Li4y
MjRlMDU3ZDJkYmJmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZS5jDQo+IEBAIC0xODUsMTEgKzE4NSw2IEBAIHN0YXRpYyB2b2lkIGtmZF9kZXZpY2VfaW5mb19p
bml0KHN0cnVjdCBrZmRfZGV2ICprZmQsDQo+DQo+ICAgICAgICAgICAgICAga2ZkX2RldmljZV9p
bmZvX3NldF9ldmVudF9pbnRlcnJ1cHRfY2xhc3Moa2ZkKTsNCj4NCj4gLSAgICAgICAgICAgICAv
KiBSYXZlbiAqLw0KPiAtICAgICAgICAgICAgIGlmIChnY192ZXJzaW9uID09IElQX1ZFUlNJT04o
OSwgMSwgMCkgfHwNCj4gLSAgICAgICAgICAgICAgICAgZ2NfdmVyc2lvbiA9PSBJUF9WRVJTSU9O
KDksIDIsIDIpKQ0KPiAtICAgICAgICAgICAgICAgICAgICAga2ZkLT5kZXZpY2VfaW5mby5uZWVk
c19pb21tdV9kZXZpY2UgPSB0cnVlOw0KPiAtDQo+ICAgICAgICAgICAgICAgaWYgKGdjX3ZlcnNp
b24gPCBJUF9WRVJTSU9OKDExLCAwLCAwKSkgew0KPiAgICAgICAgICAgICAgICAgICAgICAgLyog
TmF2aTJ4KywgTmF2aTF4KyAqLw0KPiAgICAgICAgICAgICAgICAgICAgICAgaWYgKGdjX3ZlcnNp
b24gPT0gSVBfVkVSU0lPTigxMCwgMywgNikpIEBAIC0yODMsNw0KPiArMjc4LDYgQEAgc3RydWN0
IGtmZF9kZXYgKmtnZDJrZmRfcHJvYmUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+IGJv
b2wgdmYpDQo+ICAgICAgICAgICAgICAgICAgICAgICBnZnhfdGFyZ2V0X3ZlcnNpb24gPSA5MDAw
MDsNCj4gICAgICAgICAgICAgICAgICAgICAgIGYyZyA9ICZnZnhfdjlfa2ZkMmtnZDsNCj4gICAg
ICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAtI2lmZGVmIEtGRF9TVVBQT1JUX0lPTU1VX1Yy
DQo+ICAgICAgICAgICAgICAgLyogUmF2ZW4gKi8NCj4gICAgICAgICAgICAgICBjYXNlIElQX1ZF
UlNJT04oOSwgMSwgMCk6DQo+ICAgICAgICAgICAgICAgY2FzZSBJUF9WRVJTSU9OKDksIDIsIDIp
Og0KPiBAQCAtMjkxLDcgKzI4NSw2IEBAIHN0cnVjdCBrZmRfZGV2ICprZ2Qya2ZkX3Byb2JlKHN0
cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2LCBib29sIHZmKQ0KPiAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKCF2ZikNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZjJnID0gJmdm
eF92OV9rZmQya2dkOw0KPiAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+IC0jZW5kaWYN
Cj4gICAgICAgICAgICAgICAvKiBWZWdhMTIgKi8NCj4gICAgICAgICAgICAgICBjYXNlIElQX1ZF
UlNJT04oOSwgMiwgMSk6DQo+ICAgICAgICAgICAgICAgICAgICAgICBnZnhfdGFyZ2V0X3ZlcnNp
b24gPSA5MDAwNDsNCj4gLS0NCj4gMi40MC4xDQoNCg==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D632D3826C3
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 10:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B5A6E8EA;
	Mon, 17 May 2021 08:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5C26E8EA;
 Mon, 17 May 2021 08:22:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7QXlZBvKwFKp1y64Y1c3i7MNnG63qihCyScBFs3DFPLljjAxBqS5U6wDnSjUcqev6yqMPVKJTaw6hkANIMel7365nDItT45zYV2qBsakZiHXpJKaD0DJSVXmJwnZm13jO6y7QBzFno7AD97ajSR4nj7DDGRhFCp6spEbnoYykk7FUtxnWpHO1tUtP4p3mG9u4Pbu/Y1rJsJdinQKb2b8AZb1qIxkVYefeYrhUt47JGMFHL9wo7m89O6psnN2RUSAzKQQDf34LcjLT5z070cryy/n7ZYhZ1cpcCaHs+GLTD7SA7ovfu/0uCjeHtQKRGX//qipXbnEMEBE8HgYqRDwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0ERB0v+O04n0+NPzPFpx2SbGXpa2N0jA0T5cTCZEuw=;
 b=MCoKnwA4zPYNFNib5iKw7f8HqvvqgiyZGvxruZEI5ltL5W259xEzorKTFTIvIhY5hPn+rqGz+x8WBor7XR4ZxQ35aFJhsiYrjrbWjijlEzuJocJCi9BcvH5KiddGENbM/I3PL+aPCveJ6y+RbVHCH1THG+8T+CcvF4eenSWM3QfHXcsw/hmTVBMzFUa5oKbnYtvSiSFQ/f4r/m0ySEqCavaKE6TAHR79IcG/fUk39VcpOLgXSxGPedkee5TpxYc4MtE7XmjXtmipS4nAaMS4zaJhtKuCULAThwV7NVFs2nyGIp/pAQSGmgfQLdtAXTQG1uQAE80/ZBw4VDV4EnSLOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0ERB0v+O04n0+NPzPFpx2SbGXpa2N0jA0T5cTCZEuw=;
 b=qhB6xMcbDoKney3P6vrRNrAW/EKFhI+yrzV6hCKUFd2IijhOUmWrgMDdSjwresiZlfsYdIg2dx5Djxf/qVFCWvI+132eYJHOTAY4xuOFjqeqFnj1IuIwNj0VPgCfNwI/R7XR9kIMbiKjUGoG7qmpCTtR7onWSuUB60bf+k5MR4E=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM6PR12MB5518.namprd12.prod.outlook.com (2603:10b6:5:1b9::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25; Mon, 17 May 2021 08:22:43 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::4543:6802:6acc:c92d]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::4543:6802:6acc:c92d%5]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 08:22:43 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: Yu Kuai <yukuai3@huawei.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSBkcm0vYW1kZ3B1OiBmaXggUE0gcmVmZXJlbmNlIGxl?=
 =?gb2312?B?YWsgaW4gYW1kZ3B1X2RlYnVnZnNfZ2Z4b2ZmX3JlYSgp?=
Thread-Topic: [PATCH] drm/amdgpu: fix PM reference leak in
 amdgpu_debugfs_gfxoff_rea()
Thread-Index: AQHXSvPpcLPz3EMHG0SAziNVEtRCPqrnVRtv
Date: Mon, 17 May 2021 08:22:43 +0000
Message-ID: <DM4PR12MB5165A5E838057D0D49E601BB872D9@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <20210517081632.1563569-1-yukuai3@huawei.com>
In-Reply-To: <20210517081632.1563569-1-yukuai3@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-05-17T08:22:42.888Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD-Official
 Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ddec04b4-a47f-48eb-85db-08d9190cf1c3
x-ms-traffictypediagnostic: DM6PR12MB5518:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB55188E200CFD605D60576598872D9@DM6PR12MB5518.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hswYKjpNLnwvcWtrmSF3SuaUhbPs1qcUGtAs5+rZFZ5+Cb24qbErJ1sddOJC4i+Lz55Mc20mRbQ52Y/d4VolYQMjNH8Gyg1aAuJT+b63LlVKohpI3m3hsLs0QTM8ohfJDh6M9OVQ355NVGFs0xO0pDlsGpooP8zpm4IwwEFomkaICRyTapMcY9pqgts9pFtL5djIJO3TGTtX+KmEH1yUF11uCTVoZH++1wXFyKkidQJrSLlTMSACf86D2lTtS71Iy1QDjd0qZ2+/VoDoKDvNWBV4B1LeqHSLsiQMuptSvVzclkQGEDSfpiXE6u+lrRoI4fYsq7x2/FCSEUlyf3Fd7yGRWXKORsBdpjEHVNiYFb1CYf01TjQfRMpxPBZYlgZAGhvS9LQQYdPqoASs+5trnpzRP6rikfL+AtFC1PWvKgpJqk2Pv9LlGt6sCtwhECvG1r1GXujizzaBS5iHyRtl80DmtBSNhdcfsYpOghvX5mxk3tXAuwmyfsC5KneQR/2Wl1ytq1PdiM7fh0EIiqUPjGRjaXk40GGvYRNKaujME/3u8Tp1GqBmDD0SAzTH5Kb8tRT4wB+NnMsaKa1GwOH6hnz6nYLL5rLDAhX7H2RBu6k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(71200400001)(224303003)(9686003)(55016002)(83380400001)(8936002)(6506007)(38100700002)(33656002)(122000001)(76116006)(66446008)(26005)(7696005)(64756008)(2906002)(478600001)(186003)(86362001)(66946007)(66556008)(91956017)(316002)(110136005)(4326008)(66476007)(5660300002)(54906003)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?ZHZ1ZS8vdWpQSlM3akZVMjlGMlJKRTlIY216N2xyTDdVK1BEODg3WFN0Y0R1?=
 =?gb2312?B?YnBNQzVNNHoybFdlWHk2QlM4YW8rR1MraEt4R3dkOFc4WWwydk1RS3JkZlBZ?=
 =?gb2312?B?ZitVTHBlTTc5cXFpa1VRNERnSDIyVnhhRGpyalBHOFBZVVA4c1g2bks3NHJr?=
 =?gb2312?B?ZXJiUHJqOEZTMGVkRi9uc1Y5R29TSGRDYWRCcVEwRnJsUHo0eHdDajJqdXNT?=
 =?gb2312?B?VzFOR3FXSHo0MXd3Y0tCUUkwQjNWNHU1dU1HTWpnLzhkWTY3NXFLRGIvQmpH?=
 =?gb2312?B?SkJoT0lnNVhuYU0ycEVBWHFqbmR6WUcvc0tqRk1SZFIvU0l1a3FUU1ZxaGsz?=
 =?gb2312?B?Q0MxSlh2QzZlWk1yVDM0Z0RiVHVVL3Y0dTRCVGdyL3k0b2hWSDhHOENrdU9q?=
 =?gb2312?B?V3d3dVhueHdSeWpIWTJWcTlLUW1oUHBCZHQ5eDJQN2Q0RXN0MnF4U3p6NzUz?=
 =?gb2312?B?ZVpJMDg4NnZiWkJFWk5zWFRsREtvVHp1K3M5YVB5TDRhMEdqR1VJcElTOXBW?=
 =?gb2312?B?N1IzM21JRUtJdEEvcTBDWkJPRmxPTHZqMzZBeWFWTS9KRlJ2bXE4NDNrTDBE?=
 =?gb2312?B?S29QenJnWnBhY0ZYeG5zai9EelVDTThibUpHNjdYcGE4d1pHMjdGZWdIYTN3?=
 =?gb2312?B?QURzYXZHUnpyRU9qZExrcUZsT2N3RTg2VERRd2lFVks5bUFEZzhOZWQrQlNT?=
 =?gb2312?B?elpzdDVDcXR0eUxPNWJ0K0IwbWt5ZlprWVhkcE4xNXdXbldHNE1FNUtmQVdZ?=
 =?gb2312?B?Qm9MWkJVM2wwS3Q3QVpOTTNSTC95S0NDYjVNT0t5TVZYbzFHRlRRanB3VSt0?=
 =?gb2312?B?dmY5NHRNTVRmZjZQakN4akF1MUdlaFZjaWd5SEVwbHpnNmdGbkVCNjlMa3lP?=
 =?gb2312?B?UFNwUExWY2pBL3N1cXd4QlZzMmNidFh1WE0ydzhiNW9HYmRJa1BQeFZVbFdr?=
 =?gb2312?B?bGlydHFVbEVPSXNGeTVuak80bnBmQ0VIUGRrdjhNbWN5L2dLYTB6U2IyQjhs?=
 =?gb2312?B?Y0N4SC9VYkJzeVlyWUpEVjNBTlJHM04vcUlGU08zZ2J2VGxHb21BQXowYjJ0?=
 =?gb2312?B?YllJSys3NTZkOW95VkRsMm1Xa0Q5Vis4Ykw0M2VMdHZLRDRncENLZ21zTE81?=
 =?gb2312?B?OXAzb2lXMkFCdmc1eHNXOVIzb2dGMDVoS3BGMDNKK3k0WEJxL2VOTDdTelV5?=
 =?gb2312?B?bW9scEZDWXFHSFZ1TUxzZkkxSjhkSnNjTlFVQm94OGhUNXB0SU84VnpDQXFY?=
 =?gb2312?B?SGM4bjRBOVhOVEprWWF0d2V2a0hWNXd0ZXU0MU9xY1Q0emR4Q3R4bG1oNUIr?=
 =?gb2312?B?NHRjaHFpWFBtRFhOQVRzQW9nQnl5RTlBaS92NHVrblVmb0gzK1dQRlBhVzQy?=
 =?gb2312?B?SnI2VnBkT3dCWFRyZkpOUThEOVUrbUVIVHNaKy9pNnVEUlVRcnZlMW1aNXA0?=
 =?gb2312?B?SkFDQnhmMHdOQzQxMHZ0eEZNZlQybGxSekVKNGJERXM2ZWJ0Y09mZHpXTWRC?=
 =?gb2312?B?SzYxaDl5blRqRG56M1pCMlE2TTR6N2VCWFVWN3M3b09BQklmMzJkK1FLTnVk?=
 =?gb2312?B?c3VhMmM1ZHcvWHpBb0tla3JXR21oTXlRVjdESWlRT1c0ZjhPYTJ2YmRSRXBU?=
 =?gb2312?B?bENFT2tRQU4xa0VlUGJKSHNJSStYbjZnQXVxcHNHckx2Ymd1TndPZGNlZnM1?=
 =?gb2312?B?UmdrSG8rQWpvZFNZTFFnbHB4aUFVWndHVWVaNlhieWhKeDRsZDAvQ3EwUGV0?=
 =?gb2312?Q?fhGycR2Wp/Ei2fWfepGS4gHknd2Hzs3l9J5nQq9?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddec04b4-a47f-48eb-85db-08d9190cf1c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2021 08:22:43.5403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r5BO6aGwLe4i/p9cW9/4gsZpZcY3NjWZ5aLoeyWerG79EXkPVx4Dok0TdGaI5C/+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5518
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
Cc: "yi.zhang@huawei.com" <yi.zhang@huawei.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KdGhhbmtzIEt1YWkuDQpCdXQgY29kZSBiZWxvdyBt
YXRjaGVzIHRoZSBvdGhlciBjb2RlIGJsb2NrIGluIHRoaXMgZmlsZS4NCg0KICAgICAgICByID0g
cG1fcnVudGltZV9nZXRfc3luYyhkZXYtPmRldik7DQogICAgICAgIGlmIChyIDwgMCkgew0KICAg
ICAgICAgICAgICAgIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGRldi0+ZGV2KTsNCiAgICAg
ICAgICAgICAgICByZXR1cm4gcjsNCiAgICAgICAgfQ0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQq3orz+yMs6IFl1IEt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4N
Creiy83KsbzkOiAyMDIxxOo11MIxN8jVIDE2OjE2DQrK1bz+yMs6IERldWNoZXIsIEFsZXhhbmRl
cjsgS29lbmlnLCBDaHJpc3RpYW47IFBhbiwgWGluaHVpOyBhaXJsaWVkQGxpbnV4LmllOyBkYW5p
ZWxAZmZ3bGwuY2gNCrOty806IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyB5
dWt1YWkzQGh1YXdlaS5jb207IHlpLnpoYW5nQGh1YXdlaS5jb20NCtb3zOI6IFtQQVRDSF0gZHJt
L2FtZGdwdTogZml4IFBNIHJlZmVyZW5jZSBsZWFrIGluIGFtZGdwdV9kZWJ1Z2ZzX2dmeG9mZl9y
ZWEoKQ0KDQpwbV9ydW50aW1lX2dldF9zeW5jIHdpbGwgaW5jcmVtZW50IHBtIHVzYWdlIGNvdW50
ZXIgZXZlbiBpdCBmYWlsZWQuDQpGb3JnZXR0aW5nIHRvIHB1dHRpbmcgb3BlcmF0aW9uIHdpbGwg
cmVzdWx0IGluIHJlZmVyZW5jZSBsZWFrIGhlcmUuDQpGaXggaXQgYnkgcmVwbGFjaW5nIGl0IHdp
dGggcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCB0byBrZWVwIHVzYWdlDQpjb3VudGVyIGJhbGFu
Y2VkLg0KDQpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+DQpTaWdu
ZWQtb2ZmLWJ5OiBZdSBLdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+DQotLS0NCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMNCmluZGV4IGJjYWYyNzFiMzliZi4uZWI3ZjlkMjBkYWQ3
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMu
Yw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYw0KQEAg
LTEwNTgsNyArMTA1OCw3IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9kZWJ1Z2ZzX2dmeG9mZl9y
ZWFkKHN0cnVjdCBmaWxlICpmLCBjaGFyIF9fdXNlciAqYnVmLA0KICAgICAgICBpZiAoc2l6ZSAm
IDB4MyB8fCAqcG9zICYgMHgzKQ0KICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KDQot
ICAgICAgIHIgPSBwbV9ydW50aW1lX2dldF9zeW5jKGFkZXZfdG9fZHJtKGFkZXYpLT5kZXYpOw0K
KyAgICAgICByID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChhZGV2X3RvX2RybShhZGV2KS0+
ZGV2KTsNCiAgICAgICAgaWYgKHIgPCAwKQ0KICAgICAgICAgICAgICAgIHJldHVybiByOw0KDQot
LQ0KMi4yNS40DQoNCg==

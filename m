Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A31A29FCC8
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 05:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F1E6E950;
	Fri, 30 Oct 2020 04:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F011D8999A;
 Fri, 30 Oct 2020 04:45:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gn+WBxHZMb7jMdH9VljMPKalynl/YJ1t556JT1bt2SKTHSFarx30/mDyFB+pgFQTWm1sOf8MuQS+CUOdC4pHg+mkgbSI+jpTXZamkCaJxD9pab5NaKY6C/AxjhkTDEXPRZLVFUSfHnl+g5oEdUhcD2HIqWrArwCs3P23sIlrdEb40pCCEOXhxofgiFWBbzT0dweMsNcS3mx2puUIZjW0URr9LAONyIXd9WRIFkV90z0Xah+LJ53tXSMGU0tWkDOCqY3C1RGnuECs50705j7MFN9BZoAI9dXZthlelhV7rNkPFf5nBMt7QwiKnJsmXDMV6Qtfotts8DkTAK3ZcAbF5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQHI7HT2gUinxda9aqX4EAhsLJxlHh0PcaBpKssJdb4=;
 b=IjE9BmbRX5L4e7xKT2ihYDEWRjGri6eL2LZqRSr11EuJaXHO1TVODlX0DL4Go2XiGupqVt6Iit1dHFH+7LLNte1DinpnWAvMxnpQJ9Ef53TWCKkiLdfiZR3cLB+uH39mG8OiPCFaHKCInJrAtPG4sjKNHmaQmpQZUH+1FlnlbGp0+UTxGqKLw80LEW8MXOFjqUywlY2FpQrYI+NFihOXJ5xrvFVnjnxPsv0+cQFtFkVvfoxpenRJDsHBhwOLQv0yx4R8pCvNeasoD3mRBp4KtiDc+4AKfUp9bF/JUkEW1upraV7fr1sJKBUcuDogPlIQGRwZ/klHsw+NVjNMXKD9AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQHI7HT2gUinxda9aqX4EAhsLJxlHh0PcaBpKssJdb4=;
 b=VaOTWtQ8F2vxz0wfwoUtW5bX+TiXEZnWP3cccqhX6qK4gjPcLY2FLEBiImvF613ygZClMVHSCahkEGhLibcRCQbK5E8P2Ky96CNtWkkDg4N/K1csE16/EC/luGGd1WqmQcZunxjtjqdb91dHTEcHhyWm2kO2H7o2HuY/yG04LUY=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM6PR12MB3961.namprd12.prod.outlook.com (2603:10b6:5:1cc::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19; Fri, 30 Oct 2020 04:45:15 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::5a6:dfb2:fdfd:2d91]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::5a6:dfb2:fdfd:2d91%6]) with mapi id 15.20.3499.028; Fri, 30 Oct 2020
 04:45:15 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Zou Wei <zou_wei@huawei.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH -next] drm/amdgpu/swsmu: Remove unused static struct
 'navi10_i2c_algo'
Thread-Topic: [PATCH -next] drm/amdgpu/swsmu: Remove unused static struct
 'navi10_i2c_algo'
Thread-Index: AQHWrfX0VD7yExP0hkWstg5tYf7e+amvkozw
Date: Fri, 30 Oct 2020 04:45:15 +0000
Message-ID: <DM6PR12MB26196C6095848FC78B4AE530E4150@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <1603972794-64534-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1603972794-64534-1-git-send-email-zou_wei@huawei.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=b4dd2746-006d-4a7d-b886-605aeb27b10b;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-10-30T04:43:40Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3eeb7b72-3526-40b4-2cdc-08d87c8e9855
x-ms-traffictypediagnostic: DM6PR12MB3961:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB39611758B51A957F08F098D5E4150@DM6PR12MB3961.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JS+aDj9MCyro83+vQl/4UyoMYiKrWq6+oiP7eWnU8FAa7kxrIt66W7JJTOOxq8arvBGHfQ8nQfdSgCgdVc3cjJrxvt2bbmhkRUVekoj5N2g6QpKtxYcweS+UB8jgvqG0bFWQFP6YQ77a174facMX0mXDpsvxD88YamYTmOrADtzM+rqLO0xtslxk1kqiE/nKAN4vYASmW9aEYq7uATOeA1YElZw24v61snyS/ZgpISL+mYTvoC+s8ITJt/5uF+kmCXND/+0NSpcGEHu0Gq+NELuJ5QLHNgNAc0JadJNRLi37UXX/jZzLr4CPeVtkIHEHMsoEN/mejhh5MHRabG7WqwkaDMTtqbfWb6gMeX3yHo2AGRm2b0y+Tn4MhzhLYdesTgVZHWpS6zuAL71pAw+hjpxTChUBmT+ZeZd0u2ibTos=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(45080400002)(52536014)(33656002)(53546011)(54906003)(7696005)(64756008)(66556008)(66476007)(6506007)(66446008)(5660300002)(26005)(4326008)(8676002)(966005)(71200400001)(8936002)(478600001)(316002)(110136005)(9686003)(186003)(2906002)(66946007)(55016002)(76116006)(86362001)(83380400001)(70780200001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ChDLdiS9XI0PuGcd8cuixgrqpfCcOojDq9hYmT0SU4HMQjEqjU8tAJOoVG0WXsGawRBrK6oz2V0pe+z45vPDaY0GMPyXLO4eiQA4mUedvHV6LlHGOoz0aS+h70M42D5inigtkot8pdCCcbDxtM6rQDhi1HtDKwgLxlvY/3vnMuMS9Q9Js7gRF+y2V36Hpu/+p8ltt4eZZYgIwghFrwzbaE8jN1C5LhhB8ed4WWgUx5U57SyvnRJPT3iA0xJWH7UFSfLe4HHcLkoFFldaXj34Fjo0XE1qWBSe4bHQOAVNFMoLFbnB9zpPgFzlpnVchbA0Lwpjcjb5U84MBlmxf7cnES1JdHePOIWpzeTiM62wjCM/Fg7K1k37Vn9dD/ujUmkWWdSEtt5gI+Jm/dckCiZV/9w4Pmgr/rAn1Ck65fpkZUFRTLdJeipxSzRVPnAzCxWhmTPnEKb2XlNc4HvBU3ctN6YXft1MPQia2NLlKibwU69+eakHbB2Eaxowi6meSXDt8csQGe5o4jBcHAZie0MtolYkIMIydOY2D55qPSX8Z4kuS+LFSnxLtU6GlZ/G1lA3Zjbko64W3HW2NXA6Pm1mcwaP5KyjaCOYdwig5SMRXAgII7VpsCuodMODjG5AFWQw0nJ1f3hUkYPsA0toxG1oww==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eeb7b72-3526-40b4-2cdc-08d87c8e9855
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 04:45:15.4225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u/9MOabZSGDcDc1MyO8rgLEX9weMgmK+nBiikg7fS48Joxa6FtGQXw+39e7QzZLY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3961
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpP
dGhlciB1c2VkIEFQSXMgc2hvdWxkIGJlIGFsc28gZHJvcHBlZCB0b2dldGhlci4NCm5hdmkxMF9p
MmNfZnVuYygpDQpuYXZpMTBfaTJjX3hmZXIoKQ0KbmF2aTEwX2kyY193cml0ZV9kYXRhKCkNCm5h
dmkxMF9pMmNfcmVhZF9kYXRhKCkNCg0KUmVnYXJkcywNCkV2YW4NCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnPiBPbiBCZWhhbGYgT2YgWm91IFdlaQ0KU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMjks
IDIwMjAgODowMCBQTQ0KVG86IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJA
YW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBh
aXJsaWVkQGxpbnV4LmllOyBkYW5pZWxAZmZ3bGwuY2gNCkNjOiBab3UgV2VpIDx6b3Vfd2VpQGh1
YXdlaS5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDog
W1BBVENIIC1uZXh0XSBkcm0vYW1kZ3B1L3N3c211OiBSZW1vdmUgdW51c2VkIHN0YXRpYyBzdHJ1
Y3QgJ25hdmkxMF9pMmNfYWxnbycNCg0KRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1
aWxkIHdhcm5pbmcocyk6DQoNCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3N3c211
L3NtdTExL25hdmkxMF9wcHQuYzoyNTI3OjM1Og0Kd2FybmluZzog4oCYbmF2aTEwX2kyY19hbGdv
4oCZDQpkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XSAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBpMmNfYWxnb3JpdGhtIG5hdmkxMF9pMmNfYWxnbyA9IHsNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+DQoNClJlcG9ydGVk
LWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4NClNpZ25lZC1vZmYtYnk6IFpvdSBX
ZWkgPHpvdV93ZWlAaHVhd2VpLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dz
bXUvc211MTEvbmF2aTEwX3BwdC5jIHwgNiAtLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgNiBkZWxl
dGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211
MTEvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUxMS9uYXZp
MTBfcHB0LmMNCmluZGV4IGVmMWE2MmUuLmJlYzYzZjIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL3N3c211L3NtdTExL25hdmkxMF9wcHQuYw0KKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wbS9zd3NtdS9zbXUxMS9uYXZpMTBfcHB0LmMNCkBAIC0yNTIzLDEyICsyNTIzLDYg
QEAgc3RhdGljIHUzMiBuYXZpMTBfaTJjX2Z1bmMoc3RydWN0IGkyY19hZGFwdGVyICphZGFwKQ0K
IHJldHVybiBJMkNfRlVOQ19JMkMgfCBJMkNfRlVOQ19TTUJVU19FTVVMOyAgfQ0KDQotDQotc3Rh
dGljIGNvbnN0IHN0cnVjdCBpMmNfYWxnb3JpdGhtIG5hdmkxMF9pMmNfYWxnbyA9IHsNCi0ubWFz
dGVyX3hmZXIgPSBuYXZpMTBfaTJjX3hmZXIsDQotLmZ1bmN0aW9uYWxpdHkgPSBuYXZpMTBfaTJj
X2Z1bmMsDQotfTsNCi0NCiBzdGF0aWMgc3NpemVfdCBuYXZpMTBfZ2V0X2dwdV9tZXRyaWNzKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LA0KICAgICAgIHZvaWQgKip0YWJsZSkNCiB7DQotLQ0KMi42
LjINCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFt
ZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6
Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJG
JTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1kLWdmeCZh
bXA7ZGF0YT0wNCU3QzAxJTdDZXZhbi5xdWFuJTQwYW1kLmNvbSU3QzFiODkxYmRjZGRkMDRjNjVk
Y2M2MDhkODdjMGNlZDI1JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdD
MCU3QzYzNzM5NTc0MjkyMTk5NDg4MyU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1D
NHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0Ql
N0MzMDAwJmFtcDtzZGF0YT12Nk80RVZKdlVHZyUyQnlhczNReEljdk8xNiUyRmF2ZlpjdlhmZWlJ
aDhTZlpZbyUzRCZhbXA7cmVzZXJ2ZWQ9MA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==

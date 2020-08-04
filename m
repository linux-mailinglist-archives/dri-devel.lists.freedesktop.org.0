Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACA223B98A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 13:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAE26E45D;
	Tue,  4 Aug 2020 11:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB746E45D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 11:29:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIA02C4x8NZLD1xeco6GwHtdY/ObskpgZJry/5uP6W51okoDpGoQDPK9+3OUDyEXBr7qosEzGyP9lwcA5Vk0w57qt5r0fAxYH0FIzPtC5erNW3cHLCfX0Ky+nPojlHxKm6SSer7RY4G7lhgm2o0b9evNgloM43Yt5HShLTwH3e74NI2d35cEy2i8CIPtwxJ68g1VWWSMQxf3VSgESjVWu6X1kofXoqVlkwnnutBCKrU5okpYTSs+V0ndHetmzVTt62EY5Ozw/FvUDBAJcB8tjERmtiGL8U1TMG3a2hAD4QJUWZLMy19xAY9AZcM20KsPCws+tZmXLWoNu99lwEKm6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yCHtlCgwh28RY2JKEDD8w2MpJ/JGjdj6WbnBt2vrwM=;
 b=KXYZ30i6rDS5fo0J2oBFLonu47bETcP0we5HUk8GApWslhd2ZoaiNuUKayq/C3BT+lOtSz/qvA4X4H/YHrqXrEIGewdAQP+ejKTq0hVRWZXm6xStLv4YPcgYoCwi4rTL9RNK3VbNdX8ppgv68DOSLHbVQYG3tj3vVzvESfbEaY4ugireMx19CiGv0YvemYbb29VZgi5O62uQaWAQ4hGdnnJgFl+oX7CaagBWluAvcDD3utiOlXp8VsHzKyNDgl0jWUqx2vakoKpgciJID6wvbVia2CwxDQKW72dWqt28Sq081CD7A055mUOBj0c2VALXnZO+Vk+YtrjIo3A2uNCtqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yCHtlCgwh28RY2JKEDD8w2MpJ/JGjdj6WbnBt2vrwM=;
 b=MxfH/yUX+LXIZtCdba0EZgpnvzicxdNq+wC0JpuLrb+Gqyc6h12D1UL73tpgwR5MtocCI3xthcv/UKmF+aBauwRHBT8nB4cAChv610/h5Q4BEm+D4VbxqomXYZxAoajuExZbgpcF7li3ZKPjs1c//VP0H5oqPGrhoVX/ALTxw+k=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Tue, 4 Aug
 2020 11:29:58 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 11:29:58 +0000
Subject: Re: [PATCH 43/59] drm/ttm: rename manager variable to make sure
 wrapper is used.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-44-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c15eb92c-19f8-f0bd-f0dd-965ef036a396@amd.com>
Date: Tue, 4 Aug 2020 13:29:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200804025632.3868079-44-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::6) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.12 via Frontend Transport; Tue, 4 Aug 2020 11:29:56 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4405cfbe-9b03-4269-41e7-08d83869b79b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-Microsoft-Antispam-PRVS: <MN2PR12MB414231A09ADC960F2E146042834A0@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n3pJWcqRtxn6C8HnCFfiQM42/I+ITrDMLpWxlUkbYCNCGqhtOzdOIZ0nu9D8CGA8U00TIxKLcIcsHB1e/UQC4ctHWl+5umyjEdE3P7RWk87vS35ok3hPHRQmJ23pOKHjQ30wxgYnfqUXWRF4/xI6OmS5xHByCOTB9llOlhNwGzk3kYGW31bqaz0wCHsZSCReEnRS/7FsHBb7LLPdQNwyM7QtOvwyrM2Pggkq/FX7Vvun5YmRUewiLvcQRo5XyI0RfgWSLTo47JdmnHHkzCz3c2eMRp/ccbqxcR9gpSAgK7QFmOY/rMBhz0qOZsXF90+un7VY2SfL5w81yp+q91JpddSFOjgjPnCBLH8XpK1fiex4gbyZk1JhtpCr5nzf2UCS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(2906002)(2616005)(83380400001)(6486002)(36756003)(31686004)(316002)(6666004)(66574015)(16526019)(186003)(66946007)(4326008)(8676002)(31696002)(86362001)(478600001)(5660300002)(52116002)(8936002)(66556008)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Qg9hhBSbAHHxAflqXuWKPJ7mLuuaELZHWGCAyQ99EME4rxvjOorYtZCe9OkmosdWdW2oqapKO53VdKy4+HkBLMb5EHDzjMIamO17bYazzNSgLhnk2hY8xKyVVMKICmlJFCFEtTN/R1yV7ROrQpga5Z2X2CSZT+iNkTbyOhrhTdBi+eSaIDgCM2W44hG70h0fAOVDKtCuqgQGdm+Mu6tOyrnvbQoTrxxyqznOK1E8kkuN+NyevfP+PtrJmuTxVVyiURYdFc3Nz36FpiFLkM99TmD2jzF85C+aC6hEOvaVhNP/R4HBB61hK5dyTz6KP0qHFhWDj/3FOlosVCZXi5LY990Cw2wtZBvIK/A4VO0BIeuiQ+6VklOD9G5MLYxHSQq3pTPql2ggHNbX4aglsHZSz1yZVFtSIza4dHwojkl4FFSROuT7DsR/wyUK0Lmb502//IVENuvrLdb2axfW71gQqEz2sNe339udZbnXQQf1oOPyPpwqf099ryiv15SzILFBDPA6N1mHw9Td1YlDwtN9Do1EDzz3TAUOp4mAlsusYtATDM5LnSn4bU4zAxjv4reNc+Ya0IYs9ZPUQfoSbZ5FxYy2kiEQy6WqGLDapNVchMnEkO22d/iuEtIB/cKkp1ArVH4OqaPbVIgtGYSvlnNpm/QiK+O50kMZUSpdPPyPOAiRIxaHX4Gop8ISFw/n23KoZQnLhbCluPCyi67b7gp49Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4405cfbe-9b03-4269-41e7-08d83869b79b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 11:29:57.8430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvrBXW7dfR0KKLa18DrhgqjULUkwzmDoiOS8jKc8hn4TIumsNDX/zRFj/Cextem4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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
Cc: sroland@vmware.com, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDguMjAgdW0gMDQ6NTYgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gT3RoZXIgdXNlcnMgb2YgdGhpcyBzaG91bGQg
bm90aWNlIHRoaXMgY2hhbmdlIGFuZCBzd2l0Y2ggdG8gd3JhcHBlci4KPgo+IFNpZ25lZC1vZmYt
Ynk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMgICAgfCAyICstCj4gICBpbmNsdWRlL2RybS90dG0vdHRtX2Jv
X2RyaXZlci5oIHwgNyArKysrKy0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IGluZGV4IDg3NzdjMzIzZTdk
ZS4uM2EzYTRkZmIwZmZmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gQEAgLTE2MTcsNyArMTYx
Nyw3IEBAIGludCB0dG1fYm9fZGV2aWNlX2luaXQoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYs
Cj4gICAKPiAgIAliZGV2LT5kcml2ZXIgPSBkcml2ZXI7Cj4gICAKPiAtCW1lbXNldChiZGV2LT5t
YW4sIDAsIHNpemVvZihiZGV2LT5tYW4pKTsKPiArCW1lbXNldChiZGV2LT5tYW5fcHJpdiwgMCwg
c2l6ZW9mKGJkZXYtPm1hbl9wcml2KSk7Cj4gICAKPiAgIAl0dG1fYm9faW5pdF9zeXNtYW4oYmRl
dik7Cj4gICAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCBi
L2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiBpbmRleCBlODBkZWVlM2FlOTkuLjAz
YjI1M2QxNGU2YSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5o
Cj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+IEBAIC00MTUsNyArNDE1
LDEwIEBAIHN0cnVjdCB0dG1fYm9fZGV2aWNlIHsKPiAgIAkgKi8KPiAgIAlzdHJ1Y3QgbGlzdF9o
ZWFkIGRldmljZV9saXN0Owo+ICAgCXN0cnVjdCB0dG1fYm9fZHJpdmVyICpkcml2ZXI7Cj4gLQlz
dHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgbWFuW1RUTV9OVU1fTUVNX1RZUEVTXTsKPiArCS8q
Cj4gKwkgKiBhY2Nlc3MgdmlhIHR0bV9tYW5hZ2VyX3R5cGUuCj4gKwkgKi8KPiArCXN0cnVjdCB0
dG1fbWVtX3R5cGVfbWFuYWdlciBtYW5fcHJpdltUVE1fTlVNX01FTV9UWVBFU107Cj4gICAKPiAg
IAkvKgo+ICAgCSAqIFByb3RlY3RlZCBieSBpbnRlcm5hbCBsb2Nrcy4KPiBAQCAtNDQ3LDcgKzQ1
MCw3IEBAIHN0cnVjdCB0dG1fYm9fZGV2aWNlIHsKPiAgIHN0YXRpYyBpbmxpbmUgc3RydWN0IHR0
bV9tZW1fdHlwZV9tYW5hZ2VyICp0dG1fbWFuYWdlcl90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNl
ICpiZGV2LAo+ICAgCQkJCQkJCSAgICBpbnQgbWVtX3R5cGUpCj4gICB7Cj4gLQlyZXR1cm4gJmJk
ZXYtPm1hblttZW1fdHlwZV07Cj4gKwlyZXR1cm4gJmJkZXYtPm1hbl9wcml2W21lbV90eXBlXTsK
PiAgIH0KPiAgIAo+ICAgLyoqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874CEF7523
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 14:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330926E916;
	Mon, 11 Nov 2019 13:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690055.outbound.protection.outlook.com [40.107.69.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37C26E12A;
 Mon, 11 Nov 2019 13:38:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CX9ncJ3LcPluIUM9pX+e/bEAPOW5v7QRJH5/KiPMAzMVuarr6Xji5/E3xSnAliHaSm/IsEvZJFTaJntNQ6Fkp+87pxkt9QvBM7DLBA77wRjuJuSfIuYi0e9HvQKudz2vdoK1hrsRj7IBOHCyJJaUH1WxLp+5V3BgU1FbkGpfY1KODSP9DtZi54HHNA8qdvzj3Ck8Vt0S0qD6u/gB9BWxtcY+AlArEUAH6p+w/azaXX18HZ6IO1hckaVhWY8/Rzr7iJoj25Y0gnMN//ImEuW5mohxO0SSjEO50PoayIcSA6lqsyghr/tT3YkFtA6tMPpiMK5deD0D8QhwfTz0FS/moA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uj2Qxwf3mbDDRGyd1MWlhc7wK/G4blXWm54Q6HY5Pek=;
 b=kr9fPzQDAzXmkaSHid3lp40pXPqLIAzK3EqPbClIoqjoKjyLPCqBjHOor+kb5DZ8DSJeVdXYOUYkVX8E0mF9VTHkavUi/g632QutLIHd9HGv6jIKzi3jpt7pfKFUKikV/Gt92J18GclfbCTCciDGlMPJOdTTK154RzCcCTv76ngcKPUlXT9K5QPDoG1rICK83aY5ttoo1mfxtdPW0V/2RpvybewM2hczuOH5GmsFxEs9WZput7EO8t70E0cnwAf3nOIw/nZ7iK20aFixnWJ/MLZW7moRO9BECbxD8pHwMg60ZfZIRZ4mh9jUJ8VustzDc9/EFjZAqP3fvdHqKP4ueA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB2920.namprd12.prod.outlook.com (20.179.93.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Mon, 11 Nov 2019 13:38:01 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::f950:f7be:9139:7c26]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::f950:f7be:9139:7c26%7]) with mapi id 15.20.2408.025; Mon, 11 Nov 2019
 13:38:01 +0000
Subject: Re: [PATCH] drm/amd/display: remove duplicated comparison expression
To: Colin King <colin.king@canonical.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Charlene Liu <Charlene.Liu@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20191109154921.223093-1-colin.king@canonical.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <0700f347-8590-7ab7-411d-0ae08fe9263d@amd.com>
Date: Mon, 11 Nov 2019 08:37:56 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
In-Reply-To: <20191109154921.223093-1-colin.king@canonical.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::29) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 29520764-70d2-42a1-531e-08d766ac5eb9
X-MS-TrafficTypeDiagnostic: BYAPR12MB2920:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB29203C87FEB51EDDC90F2A73EC740@BYAPR12MB2920.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 0218A015FA
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(189003)(199004)(3846002)(6116002)(2906002)(6436002)(8936002)(81156014)(230700001)(81166006)(229853002)(6486002)(99286004)(8676002)(58126008)(316002)(110136005)(66946007)(6246003)(50466002)(5660300002)(66556008)(66476007)(31686004)(14454004)(478600001)(52116002)(2486003)(23676004)(66066001)(76176011)(65956001)(4326008)(47776003)(65806001)(6666004)(14444005)(25786009)(11346002)(446003)(86362001)(36756003)(31696002)(305945005)(486006)(7736002)(186003)(476003)(6506007)(2616005)(26005)(6512007)(53546011)(386003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2920;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cnhoeMt1UjS7XOhdbjD7hO8wWTSsN/GlCtNMZnctoZQiKoexS+w+xQ1kXbIxTIxpZ0lVRvapPcBaLIYBM+G2VUovf7/epVikHPqwqMU2c3eyipdXY4kpQHduv3Y9InI2odLXSBjEYg9p8JAjkfGkZSBJrxQ2zAY7pi5h5WUTf36t7YhOn4gVMIWEWJhfEwgc1rDLlDL9GeyKNxnRW+axXMva4dU/HZrUVhKibFiKcugcK3D5WT+9Cp2iGW2SeGy8jlIZt9oxj8LYxAh7OrqDoFezUpJwsJ/zJqkppE4yWefx9wLspYt6LkyOLiEb8HzMIGVQoL0IuHPEnIImzi+21VCXKVDxPEFScTKjx/mMp8/UFD2/D11QPlSf0ISlQpHNErj8ElxSy2jxrq4InmT4zZ5za3j1EWxPeIU0P5W7yZ80oL05eOjsFwg4MgPP5z0d
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29520764-70d2-42a1-531e-08d766ac5eb9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2019 13:38:00.9943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srPZb1CArSf/Ki9QmGi0t29J0n5myVI+EJcS+AKzxghiEXfqF44xWpsEJp3I68VfIh3aw/Lsl2tRc83U/7+5wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2920
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uj2Qxwf3mbDDRGyd1MWlhc7wK/G4blXWm54Q6HY5Pek=;
 b=cXokiSRGRI64x4fkXWnx2MwkPdtrYG88S1B8Lrn1sGkOcKLu7XeDEK+4GeNdfnrI3zTc7DVXovoS0tDSHWMWf4+PTOjfpBKWvR19o8rWMIU+sBcQ2iTpupE44Id+P7kcODO79hXRa3lvps2v9CRrbGcD813zPy+D7YMQnyZ5Xw8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0wOSAxMDo0OSBhLm0uLCBDb2xpbiBLaW5nIHdyb3RlOgo+IEZyb206IENvbGlu
IElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gCj4gVGhlcmUgaXMgY29tcGFy
aXNvbiBleHByZXNzaW9uIHRoYXQgaXMgZHVwbGljYXRlZCBhbmQgaGVuY2Ugb25lCj4gb2YgdGhl
IGV4cHJlc3Npb25zIGNhbiBiZSByZW1vdmVkLiAgUmVtb3ZlIGl0Lgo+IAo+IEFkZHJlc3Nlcy1D
b3Zlcml0eTogKCJTYW1lIG9uIGJvdGggc2lkZXMiKQo+IEZpeGVzOiAxMmUyYjJkNGM2NWYgKCJk
cm0vYW1kL2Rpc3BsYXk6IGFkZCBkY2MgcHJvZ3JhbW1pbmcgZm9yIGR1YWwgcGxhbmUiKQo+IFNp
Z25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+CgpS
ZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQu
Y29tPgoKVGhhbmtzIQoKTmljaG9sYXMgS2F6bGF1c2thcwoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgfCAxIC0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5j
Cj4gaW5kZXggMWZkYmExM2IzZDBmLi4xZmEyNTVlMDc3ZDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKPiBAQCAtMTQ5MSw3ICsxNDkxLDYgQEAgc3RhdGlj
IGVudW0gc3VyZmFjZV91cGRhdGVfdHlwZSBnZXRfcGxhbmVfaW5mb191cGRhdGVfdHlwZShjb25z
dCBzdHJ1Y3QgZGNfc3VyZmEKPiAgIAl9Cj4gICAKPiAgIAlpZiAodS0+cGxhbmVfaW5mby0+cGxh
bmVfc2l6ZS5zdXJmYWNlX3BpdGNoICE9IHUtPnN1cmZhY2UtPnBsYW5lX3NpemUuc3VyZmFjZV9w
aXRjaAo+IC0JCQl8fCB1LT5wbGFuZV9pbmZvLT5wbGFuZV9zaXplLnN1cmZhY2VfcGl0Y2ggIT0g
dS0+c3VyZmFjZS0+cGxhbmVfc2l6ZS5zdXJmYWNlX3BpdGNoCj4gICAJCQl8fCB1LT5wbGFuZV9p
bmZvLT5wbGFuZV9zaXplLmNocm9tYV9waXRjaCAhPSB1LT5zdXJmYWNlLT5wbGFuZV9zaXplLmNo
cm9tYV9waXRjaCkgewo+ICAgCQl1cGRhdGVfZmxhZ3MtPmJpdHMucGxhbmVfc2l6ZV9jaGFuZ2Ug
PSAxOwo+ICAgCQllbGV2YXRlX3VwZGF0ZV90eXBlKCZ1cGRhdGVfdHlwZSwgVVBEQVRFX1RZUEVf
TUVEKTsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8072109BEA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 11:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38EF89CB2;
	Tue, 26 Nov 2019 10:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790074.outbound.protection.outlook.com [40.107.79.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B3C89CAF;
 Tue, 26 Nov 2019 10:09:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7Dl7aVR7ysR0iwO7ZXXDeKPLPnUQEJfT8necFTMQw2zi+AgjyWr4qq6eBEK6luCLrtH5izBfHv6hR1hsNVg9aYQ6iBeemdRL1SSQ+tRyEiWLk/k928KAC9rQaZCaNmq4Ap2NMpo7M6pN0KJ5Be6Fgm4l9gU9CDDI5xOobVA/fEyfFRjTQT3g11LPvA4F3Ifp1oYltA1iHObM2fyttax/tP2UCmmFzD+6sNML42YJb2rGJK14v2XpcUsScuIFP+XqVZ3dFhYOlepMDYjClcxz96uj1qFZNSGLuC0WM4rKxDrUJCcez3L7HJdoovnLvOhMRWfhUyl4+R0qLOl4tBx3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJ+MGMXb0UedodssqnjhqVgVK7bUeLr+Cr4qM01sjpM=;
 b=Wa2IWLW31hrcbNhKAt/PuUJTdPWCQ4C9HlyZiO3TBfIcP2r9hxsXcbWPqMn1XNIyvj8V8wO+UaODZYVlAsPh7RSk7Fd8SC4tPWPSXMkCtTdpJbwtYoltzLvvPb/QMc0pou99NeSi41cWdtsb/tBHaskNjmPHxLG6c7K5JKsbLz9fOClgCr7Tun2aQ2HHqav9gJ/dGWppTzhP3j/tQNCPrWBwMG/IWH2vV62uuvrkKXVMuHkrzkiV5cjpcPZTgsR/EnRJOxhpRh5prwXmSXpNLe/fGIKGBSIuCy14nyGkJLp+tKSsrNJ8QZUSCtgWSnloDrsdqYdsEHfcJT/2rQWbvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1163.namprd12.prod.outlook.com (10.168.240.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.22; Tue, 26 Nov 2019 10:09:53 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 10:09:53 +0000
Subject: Re: [PATCH] drm: radeon: replace 0 with NULL
To: Jules Irenge <jbi.octave@gmail.com>, alexander.deucher@amd.com
References: <20191126003514.133692-1-jbi.octave@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9a585a20-b885-680f-d561-8713afe53fa1@amd.com>
Date: Tue, 26 Nov 2019 11:09:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20191126003514.133692-1-jbi.octave@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: BN6PR19CA0079.namprd19.prod.outlook.com
 (2603:10b6:404:133::17) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7389ca2b-be8c-4bcb-40c9-08d77258c7a4
X-MS-TrafficTypeDiagnostic: DM5PR12MB1163:|DM5PR12MB1163:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1163CE0AB5D8D01D1C4B5D7883450@DM5PR12MB1163.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:428;
X-Forefront-PRVS: 0233768B38
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(189003)(199004)(6512007)(31686004)(305945005)(65806001)(11346002)(65956001)(58126008)(8676002)(8936002)(81166006)(81156014)(6436002)(36756003)(2616005)(14454004)(6666004)(66476007)(66556008)(66946007)(186003)(86362001)(31696002)(4326008)(229853002)(2870700001)(2906002)(47776003)(66574012)(6246003)(76176011)(2486003)(23676004)(52116002)(4744005)(7736002)(6506007)(386003)(316002)(5660300002)(6636002)(25786009)(14444005)(99286004)(446003)(50466002)(46003)(478600001)(6116002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1163;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TrF5NH/184EvolwwmWfSAojMjAPP86MnekjMtl2wUBrutXgLZfNMieJ8OwszPQLgIe+phZfTwwjkP6PhH7aeDVeOqCVEJLcVl3V/e/odWqGkG1XE4p/oLEwj+Rga01qKtKsxDsoXYgfpSjTga8QtyWlALbfNFM9mY0Evion6ntg+tp1g2Ko61WpqULEvFNezKjN8uj8TGb6A1W8/uY17RR2SHcsCgY1HWaDxiPR5nfIsXk7sC0qTYL/BM7TlQV92B0ku7nj6qvyL76uzMK1tO2k5RnNT4Dp9N2cnFnx6JqpsbRqRxcVyP5rc8R/4LE0O1OULTgQ6CUP9NJSWelgQ2zJ4ZW6Rjxh84H0VCQtUhQo2V4QpU4xV9m4EU1Eox6kKm5WFhbXbr/s0rIbCQCZmgUgkV82SsoFdYR8x3vUPj03QZSKjYQA0a15+rPEDb4Dk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7389ca2b-be8c-4bcb-40c9-08d77258c7a4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 10:09:53.0192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1QCdniQXbxhLrhbtzVe4+UJLZIKH7hHkGDjSvrSYio3pmrMOlyiliwRC1N/Thuv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1163
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJ+MGMXb0UedodssqnjhqVgVK7bUeLr+Cr4qM01sjpM=;
 b=y0bxBgC+0o6R/WL8cqvLe8IKorK5ZCaTw5IsCjn33Yy6H57RYqi9Dh0JVQhpTpO6cO6aywBJaKOprBo3HopgV/UWQDQaHwW+/mQqi1q22dPICLn8/4MWLv8BYYxq8E8XlYXyWRLNDAFaFP6MdJFgPLvmvpFp3HeZKSj4+HnulDM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjYuMTEuMTkgdW0gMDE6MzUgc2NocmllYiBKdWxlcyBJcmVuZ2U6Cj4gUmVwbGFjZSAwIHdp
dGggTlVMTCB0byBmaXggc3BhcnNlIHRvb2wgIHdhcm5pbmcKPiAgIHdhcm5pbmc6IFVzaW5nIHBs
YWluIGludGVnZXIgYXMgTlVMTCBwb2ludGVyCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxlcyBJcmVu
Z2UgPGpiaS5vY3RhdmVAZ21haWwuY29tPgoKQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9hdWRpby5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fYXVkaW8uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F1ZGlvLmMKPiBp
bmRleCBiOWFlYTU3NzZkM2QuLjIyNjljZmNlZDc4OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9hdWRpby5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fYXVkaW8uYwo+IEBAIC0yODgsNyArMjg4LDcgQEAgc3RhdGljIHZvaWQgcmFkZW9u
X2F1ZGlvX2ludGVyZmFjZV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQo+ICAgCX0g
ZWxzZSB7Cj4gICAJCXJkZXYtPmF1ZGlvLmZ1bmNzID0gJnI2MDBfZnVuY3M7Cj4gICAJCXJkZXYt
PmF1ZGlvLmhkbWlfZnVuY3MgPSAmcjYwMF9oZG1pX2Z1bmNzOwo+IC0JCXJkZXYtPmF1ZGlvLmRw
X2Z1bmNzID0gMDsKPiArCQlyZGV2LT5hdWRpby5kcF9mdW5jcyA9IE5VTEw7Cj4gICAJfQo+ICAg
fQo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

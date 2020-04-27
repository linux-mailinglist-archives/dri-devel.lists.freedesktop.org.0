Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F9C1B9945
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3928E89F63;
	Mon, 27 Apr 2020 08:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7769F89FCE;
 Mon, 27 Apr 2020 08:03:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kd8ihO8ufh3dd+aQa379CafF5LbUFV3KRtK/fmtqwXClld9LWqdftSYRJ+4qO7Kpkr4tND5FDNssUGqUdCodyDu+dz/s8bh+3lYt6kbhXn/oOUR0vrnl5uM8HcfFpZRz0IXdy+dPVPv+1Ozli9EcJu8IO5EZKPZiG+ncQL3ZD/DbNjEf7EAE9uoL1IGe3p5WoEXpTmirUQG5NbqUk1sPGd1a3yEq81YSWLandMLVO+U3LftL18nBPc7oDtRPJJCJKB3MYQRIKPQ6VKEUlrzZPWd4RnD1Go48koZ+zipnFvWdqCPpaTnDJKPcJtzxdVsr8EVvYcfLtZHfiXyyXRU2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uOBREzV+JpRFrnzhXP6qrDXJeMxIcrPYvMmZ1F7gnw=;
 b=ROYpGu3GSA7jheK9oO0oLEoa4/tgXJgtcnS46dVdmMpfk9FJK20R7PoHSAPU0FfY3VOiJQwHPAoFhvBKOaKmbIbftI1O4oAEQ2SJ2ac3ygFgD95xQoSX5/pP3+ZWjV5M5VEHK19JwHgHaXxPP980w4xFi9oRGrekWPH8vcqB25cNmGNBdRWSVlxw1lOwrVFz+zjp2LqXKTl88s23Q2UIlmYzKp77t12GnqSBTMmJeeGtxilRo6cCSoSRh5pt2sz/9Zm5emJPTy+q7QjFSXvXp2Zj6fzcEtZkWWUJ/lHDThk5gukt95i5akyeit5T1Bb8msplXPYDFNisCQjF9+OCIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uOBREzV+JpRFrnzhXP6qrDXJeMxIcrPYvMmZ1F7gnw=;
 b=JOJcf3DCkT61yHqsyN1m7Z92O8lcDzQlAhtPfIZ9NE2FXilzdFI67neff6eGWDUSnL0kA/yBTTgpLqEmtBahbFN85DaH9WRUoqsSk/MWywcd9ZFUUnpgnF002RAa7k6FmoxCRmZvsqKUmwg1G4LRvwlCiUdV2TQRF56ZPF/ecjY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4564.namprd12.prod.outlook.com (2603:10b6:5:2a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Mon, 27 Apr
 2020 08:03:30 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2937.023; Mon, 27 Apr 2020
 08:03:30 +0000
Subject: Re: [PATCH] drm/amd/display: remove conversion to bool in
 dc_link_ddc.c
To: Jason Yan <yanaijie@huawei.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, David1.Zhou@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200427063726.21363-1-yanaijie@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d7546d27-a17f-8dcd-c396-79476a3972c1@amd.com>
Date: Mon, 27 Apr 2020 10:03:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200427063726.21363-1-yanaijie@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0083.eurprd05.prod.outlook.com
 (2603:10a6:208:136::23) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR05CA0083.eurprd05.prod.outlook.com (2603:10a6:208:136::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Mon, 27 Apr 2020 08:03:28 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 94ddf153-171c-4a47-8eb2-08d7ea817942
X-MS-TrafficTypeDiagnostic: DM6PR12MB4564:|DM6PR12MB4564:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4564C32B4AC4D0B0D16C0F1783AF0@DM6PR12MB4564.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-Forefront-PRVS: 0386B406AA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(81156014)(6486002)(31696002)(8676002)(8936002)(2906002)(66574012)(36756003)(86362001)(316002)(6666004)(31686004)(2616005)(186003)(5660300002)(16526019)(66476007)(52116002)(478600001)(66946007)(66556008)(921003);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8A9n2qtL/UNZYLxGc1cbOOFgpXB6ln12RBQc302TYu6vzO4W6zKL4eUQjJtJ0krckhK4rzAdacKWJnSp5u9i8/Ocp6/Auo6NffKZ8Bg7TUTnL/0cBuVE9gsRmbDMfz21Pxbigs14IID8DgSIP9Qoqzkea74K/wIAfEOC1TPNiKIY8ypUBeGLZxFzxCfUHvSxseFcPJTkGhPYL3p1spWxXBlDfXF7CFsij+u886wDEZK2RVr21eL4iPijojzf9FA0PCBLCPCNpyF6rjl0YkyQZ9AX4zR1Nh8PPTbpAJs4U0BdlttL2JhUfMxCjzgjiar8Kg7s8RAK0GGbDzD2nH1Sk7LTGmrIKYbFVEzDptglexvfSMFi009FWx3WsG8CBdjGp2arLlo175+kza21aiCCMSrKxKLISHfJPB3uS6FjPzhAwtjiv7gdRVd8xzSkLFNkVFsbh1HDmjOEuEJaiCObEWxG3oM4Ec7cFBEluFnN8Vc=
X-MS-Exchange-AntiSpam-MessageData: YN9SriQVKpha0XN/7+/INhEN/ili7MSWG04091jWZPDbsYi5Zebc0zysIz7avvWNa5EBeUQnQVK/mcU+xdOKgpcAjmpe1RRF5APQNlS/crtO9j3g4pp65WnDy+R/mxzEGZuFX5ZYfddZWEWkQwqA1iT3N5uPGKTzPaDISLPiNsOUz5ZkhfmOLfw7qswTEByq8dyky6ciw+xJ1s8SXs8ZO7A7l2n/uT5zNHdXdokKFc4P2ZhHbJoIoFnq9ZFQ8xc19+W3fAvxEs8shEG9jKEPZxPzlCJeLNg0JNIBPoZmgYzHDTQgoldeT3EcZZJkslM0kdlJ3L9pw4ZAoyBgJz0zhJO92Bxi6Fq9ulGMD79IeXhy1TkMn/uT9rL177R3RKNZDCpuYjcRol1THMF1Dy7OEsWcJvkftuDbiuRAi8DXLp2TUw0TxrdAC0QpTN3kOLT2/M0YNFGcDA+K3JC6LeGLM/RE2F52tl9DGUyNm1m3HNdvNpkknZKBleBYl2ie1xB7RPXOmeF8oHHj7BWG9eHsu8D3I15ssNfcOCRvswoSYv3ikCN6MHZbB9pQIqrYk0JSp3QhP3sxvPVF1pOEy/DQavmb0dn7JIUz0jxHvfh7HYVBz6L4eghocotHu2bxV/lJwE1B+6Td80NnkNBVzimtqmjq9vmhAfV9Sl1G4PPjU6h4QlrzAbvpOKXCWwtTGFE/KH0mtR816po7nH3F/c1FUUssXn0e4yOc1ojMniNHzu9BWEE6uCsw6272Vf9A4+ExziC0kYFJU/wHUdD0QR6Nd8465Vk6BdUknKhhJobT8GPY/8rAHy4rLgouiDLfWsUupbZI+3CzU5Ct6CexuUV0XJB5ir70DidfrjiOu3k1GA0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ddf153-171c-4a47-8eb2-08d7ea817942
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2020 08:03:30.3793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRi7ArVtqAvv+y3iujiNfwU/oD/OsvguhTfr3mdxpPz1L42NMg0AOWSDlSpOQnym
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4564
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjcuMDQuMjAgdW0gMDg6Mzcgc2NocmllYiBKYXNvbiBZYW46Cj4gVGhlICc+JyBleHByZXNz
aW9uIGl0c2VsZiBpcyBib29sLCBubyBuZWVkIHRvIGNvbnZlcnQgaXQgdG8gYm9vbCBhZ2Fpbi4K
PiBUaGlzIGZpeGVzIHRoZSBmb2xsb3dpbmcgY29jY2ljaGVjayB3YXJuaW5nOgo+Cj4gZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kZGMuYzo2MDI6MjgtMzM6IFdB
Uk5JTkc6Cj4gY29udmVyc2lvbiB0byBib29sIG5vdCBuZWVkZWQgaGVyZQo+Cj4gU2lnbmVkLW9m
Zi1ieTogSmFzb24gWWFuIDx5YW5haWppZUBodWF3ZWkuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RkYy5jIHwgMiArLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kZGMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZGRjLmMKPiBpbmRleCAy
NTY4ODllZWQ5M2UuLmFlZmQyOWE0NDBiNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RkYy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kZGMuYwo+IEBAIC01OTksNyArNTk5LDcgQEAg
Ym9vbCBkYWxfZGRjX3N1Ym1pdF9hdXhfY29tbWFuZChzdHJ1Y3QgZGRjX3NlcnZpY2UgKmRkYywK
PiAgIAlkbyB7Cj4gICAJCXN0cnVjdCBhdXhfcGF5bG9hZCBjdXJyZW50X3BheWxvYWQ7Cj4gICAJ
CWJvb2wgaXNfZW5kX29mX3BheWxvYWQgPSAocmV0cmlldmVkICsgREVGQVVMVF9BVVhfTUFYX0RB
VEFfU0laRSkgPgo+IC0JCQlwYXlsb2FkLT5sZW5ndGggPyB0cnVlIDogZmFsc2U7Cj4gKwkJCXBh
eWxvYWQtPmxlbmd0aDsKPiAgIAo+ICAgCQljdXJyZW50X3BheWxvYWQuYWRkcmVzcyA9IHBheWxv
YWQtPmFkZHJlc3M7Cj4gICAJCWN1cnJlbnRfcGF5bG9hZC5kYXRhID0gJnBheWxvYWQtPmRhdGFb
cmV0cmlldmVkXTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C031B9941
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A154489E3B;
	Mon, 27 Apr 2020 08:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3DE89E3B;
 Mon, 27 Apr 2020 08:03:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyJxDqDnHBWUQ4EvpTgD0hzsjXwbHx8bU5gDq0S+MXw4HIX9JBfekyZsGBYaJrS3ftJYYRBzbqyhDOZdsU7NHHz+8Zj1lWhtChORJ+AmrcltVxcRRDU5NT5iXpRRSr8Vhkc1nypAP2CXuftlaHak6yDn3r6S+spcAjtZAcROB1yMtX48hHRELn6eqS3SFqPyblRZ5PEGtEFIezyddVzKUnrtiVIgHqwNO2grgz0jXFApxw8uPhj6C7+kqLa7Yq7nGfbY20Bgh1jtEHwhtm9DXUf0Y2GVeb0dbz6M5P3YvJGQrHQR3r63psum+i1TNYiaMNOOEAyzgiK2nVA3k+oiwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUJpiCvBIjVdptoZ6PoWKXT3H34NREru1KVcUJp6mRw=;
 b=D53mZLjiAbVv6X3zwsGjuuPQgFMLtYJsH9wQ7TI+Fy1ezA3Ss78IEZSh/nYmxGB4lBvQndSw0fps/sLsVHb9TFEZpQKCXdWJ983xNwkBNReD1vtMKgpo5NQOmdjS+EHKqji2o5yxN9BFhHzmCZ9fD0MFMjDSE/tPWtxfLEdvwSY7LreXvmWXUBlrK4T5QDq4ooZoBXRtSyzamKWrrKMqGAHRm3ydyca/5q4J9K507schAq5zB5amFpoc2CS3Bg3ZP/ZHCkRortWHSUwLXUpYpWCsFpnr5L+7tFnFbfLLSiQyCAyGHx4Is7qIxds4lwr2BFQE/FhYjjdecf2qQhjaZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUJpiCvBIjVdptoZ6PoWKXT3H34NREru1KVcUJp6mRw=;
 b=qv+C+vLl9XRIQPtWE95Jpt6JFj/2R8b+5iZ+MgLZ4wahOdzbACVv0SMIWTBFx2vtUeBlw6kbfoIx5UvvnWG7ktScCn1AwYPPK57Tb1rh5J2cZIgjJvHTgopLkWKRRNYHabG1zsX5HHfSl7jQ7sfeToFZHZuROS0svpwABud8V60=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4564.namprd12.prod.outlook.com (2603:10b6:5:2a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Mon, 27 Apr
 2020 08:03:07 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2937.023; Mon, 27 Apr 2020
 08:03:07 +0000
Subject: Re: [PATCH] drm/amd/display: remove conversion to bool in dcn20_mpc.c
To: Jason Yan <yanaijie@huawei.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, David1.Zhou@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200427063715.21255-1-yanaijie@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ca33223e-efd8-cc26-1dec-c7975a5001ca@amd.com>
Date: Mon, 27 Apr 2020 10:03:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200427063715.21255-1-yanaijie@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0112.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::17) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0112.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Mon, 27 Apr 2020 08:03:05 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6e868423-f432-440c-dbc3-08d7ea816b78
X-MS-TrafficTypeDiagnostic: DM6PR12MB4564:|DM6PR12MB4564:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB45642AE20BB700FA363194B583AF0@DM6PR12MB4564.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
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
X-Microsoft-Antispam-Message-Info: jm/b4dOw/t0lz6iDWBL1rzDJTgRwxK4E9yKXh7pA0ICEHmhp6lFQa3XJEd2n7yjOjFye+L2RYcexlRYc6QqwARk0HYLTpWAoTmZL4LtfL1kPu+5QC2UUZjHZHJ+RAum30DPUhqegZgvu1j19bDXk4tvE0Yzk93RJTJEywOu50deq1KCWf+fgg4NLHaNy/tyaAXi7rI/0NcU1ph2Ggf5iyXnJyzynHT8ZRI2mFHviTSy12p1ilYr/pkkse91EdgEkVitvtxv1LwkSi3PgWVtFyEeqxjTZ4+NJs4KnuX5uNq3yPKb9Er+VtrryPZRW1YsTVVarQfoq8pRK6K+EgT15a5LI3T7DtVXUDuzSl3QyZH9yWRTDq6Q/ko7j1oMNuxvuxVJaVaxtz1IfMjN6S3hhzk1OXWckswc/BAs3uX4d/dSU4DII/q7R/mH+kowgHcfqerZ2UurAoRmPhbeh3z48L708ybbevPMSJ52vyo9YlUU=
X-MS-Exchange-AntiSpam-MessageData: qASlr0Ye8AqdAkoS2NIKgJQXUk/runSvDFCOv3RUn1nEREOhAwrzQonrrmvuv/KrZLtHBZqostB8ary8Wz0oTP/q5SbvkYwQhtO7/dqdXvBGC3/zqLt9jjzgBVMi9F0K9XLiSxkFnF9z/NjGwe4VSHUW5u3PWwMZELEiNYPDPGpH8at5CPA4gr6FpKmZq9xVG80+6UOiUOxwJDzek5gs6Lg/QyG14qDBYjPyCXq9PY3p5ksp/EZ8RX1BalgSfCg9EwLBgcx4NVcYBDljkvI7+METLY2JDr2yPqVjgcC0MiAUskfBkcRaucbWgCtVLFSRqmqO0KhJ6tiTsn1qVdYLakdr/qpa6PKet7GniW6T7QMNKCxQWmoCsG6K540cEqLZnw75UW30dRfiUiglDZmeCSAgq0qVglLmgbPIKiUVToJNWbYZeRFr1PYWQPq+YFeopu7hek80I99mqiV59o/rX/LIxmZhAm3fE5qHaOxN07uuQSCR+nnXiaMBZzjy6ldSJ/zSYf2AOP6l8Xr+9amPKWB142e7YyxxQp3PuGsUrYwhqSZP0mRs/sg5O1ll6mEx+uz3ioLcdUv1/9dCEJB9VU4mV/vcnxfgr/69ZqvdMrWwAaXRUiDPAQmCMCY99aM9F5beBrT2Nz2srbKgFOlsMtmEM5GZZATdjmvACJFueMC+2OurAKdT4cJQcU4ZEhjLfcvnxbFzUsOaQscPKQi2IHR12ncw6inqSRKed5XMax3KPKxflwCSb6wKeqq8dr+zlsRdZzY7O+RhHrzcevgwcnP/ZhY5UHBVhfM/2D3thh8rdw2RFhLPXEgPVUao+wnItCPyGwfFD1n71vLH9PxW/4DZ3dESnt6fLpLz2QqWpCM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e868423-f432-440c-dbc3-08d7ea816b78
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2020 08:03:07.4363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgOFxI3Sl4GLzLN3dM6eGISWiinah5MGh7Uw+X/Jv5GwnI19vRDOuyU7puRVBcna
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

QW0gMjcuMDQuMjAgdW0gMDg6Mzcgc2NocmllYiBKYXNvbiBZYW46Cj4gVGhlICc9PScgZXhwcmVz
c2lvbiBpdHNlbGYgaXMgYm9vbCwgbm8gbmVlZCB0byBjb252ZXJ0IGl0IHRvIGJvb2wgYWdhaW4u
Cj4gVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIGNvY2NpY2hlY2sgd2FybmluZzoKPgo+IGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9tcGMuYzo0NTU6NzAtNzU6IFdB
Uk5JTkc6Cj4gY29udmVyc2lvbiB0byBib29sIG5vdCBuZWVkZWQgaGVyZQo+Cj4gU2lnbmVkLW9m
Zi1ieTogSmFzb24gWWFuIDx5YW5haWppZUBodWF3ZWkuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfbXBjLmMgfCAyICstCj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfbXBjLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfbXBjLmMKPiBpbmRleCBkZTlj
ODU3YWIzZTkuLjlkNzQzMmYzZmIxNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfbXBjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfbXBjLmMKPiBAQCAtNDUyLDcgKzQ1Miw3IEBAIHZvaWQg
bXBjMl9zZXRfb3V0cHV0X2dhbW1hKAo+ICAgCQluZXh0X21vZGUgPSBMVVRfUkFNX0E7Cj4gICAK
PiAgIAltcGMyMF9wb3dlcl9vbl9vZ2FtX2x1dChtcGMsIG1wY2NfaWQsIHRydWUpOwo+IC0JbXBj
MjBfY29uZmlndXJlX29nYW1fbHV0KG1wYywgbXBjY19pZCwgbmV4dF9tb2RlID09IExVVF9SQU1f
QSA/IHRydWU6ZmFsc2UpOwo+ICsJbXBjMjBfY29uZmlndXJlX29nYW1fbHV0KG1wYywgbXBjY19p
ZCwgbmV4dF9tb2RlID09IExVVF9SQU1fQSk7Cj4gICAKPiAgIAlpZiAobmV4dF9tb2RlID09IExV
VF9SQU1fQSkKPiAgIAkJbXBjMl9wcm9ncmFtX2x1dGEobXBjLCBtcGNjX2lkLCBwYXJhbXMpOwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

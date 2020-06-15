Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 758431F9D91
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 18:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3926E3BB;
	Mon, 15 Jun 2020 16:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C3B6E3BB;
 Mon, 15 Jun 2020 16:35:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGHYkQNphPUg8W20Xnx5L0ZudkmpeUswxX4uw7NXdHT9mZDujjD6Iwk4LpdYMDunjXH83pf1En5tsnWAfKgkh8c29JIqZJxVQnwyuFRoQP/1uV9Lb6L8RKOA3FTI9f7UxEPLT2gBQhaApD4shfA2m1xFhjoVrMgYLhfxwnzjdK8Qljx4GrVi7pkR6XsWadeaXSsCjoxGj98UTeOQoB7qqFI/B1Y57/ivUQaXELIbW47fU2CG9xluCnVMpi+qZvHlEZYHqKoccgKPzYtCTVJ8dzebEYFChf0cvV0iGPM5FRq9/Nl7tbEyVYstYzPlAYJG3gHG5Oa6DWy3bADFvNBOug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmok/xa2O4QOcISBi7dlrFq9xdyFXDL5LHVHvoX+Xm4=;
 b=PV6DraLxBjyN08C6M3WFLnP60HV/PHlKAplOe9knKffbhJtDlCNeCCViB+a1TpIVvyAdwI2tmeOXASZmVixINiUQygxfWI6MElyNidetd3Mtt178KtCFEFGw1nf9a1cb1YFbrh8k6a3T5hW1ALO/e+Rh1I/tdebgWuJNIhhpB6cxPNtZXsm5KKdYlkmDH43RlV7m5irdP2Nu/x4OxJ5CKbi92pqkm2BOUVP7hWcWlr1Wef9TnfOxKs6A+M/MK3W+S6XKAfXuOoEKY8NyEM+NhVl3HneKa4RrlGcnSMpc/o/e4HGwe8QjtNeQDpK53y2J00Wzj2dPpZWF14BfeYjaZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmok/xa2O4QOcISBi7dlrFq9xdyFXDL5LHVHvoX+Xm4=;
 b=Vi70jFo0IFfP1iRvxO/vQk9fpkNNGmb7C8twzhtSDy4RCNQsJpI3e3OG3y1/DRVyix8k0LrdE05UTG+8d3gXhBFVNfZLJw+uOKsGhPakM/GvxnVAU+In7OygoH8/RBZSxXsNkhdQ8V21qJRLZfRBGbtJ5JP7ReABwLMskF7LQFg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3872.namprd12.prod.outlook.com (2603:10b6:208:168::17)
 by MN2PR12MB4288.namprd12.prod.outlook.com (2603:10b6:208:1d2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Mon, 15 Jun
 2020 16:35:16 +0000
Received: from MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::8843:c094:fb2a:d60a]) by MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::8843:c094:fb2a:d60a%7]) with mapi id 15.20.3088.029; Mon, 15 Jun 2020
 16:35:16 +0000
Subject: Re: [PATCH 1/3] drm/mm: remove unused rb_hole_size()
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 chris@chris-wilson.co.uk, intel-gfx@lists.freedesktop.org,
 nirmoy.das@amd.com, dri-devel@lists.freedesktop.org
References: <20200615145415.1775-1-christian.koenig@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <77ebb52b-806f-8129-9237-06b0ea4515c2@amd.com>
Date: Mon, 15 Jun 2020 18:36:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200615145415.1775-1-christian.koenig@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0118.eurprd07.prod.outlook.com
 (2603:10a6:207:7::28) To MN2PR12MB3872.namprd12.prod.outlook.com
 (2603:10b6:208:168::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.76] (217.86.97.86) by
 AM3PR07CA0118.eurprd07.prod.outlook.com (2603:10a6:207:7::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.10 via Frontend Transport; Mon, 15 Jun 2020 16:35:15 +0000
X-Originating-IP: [217.86.97.86]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2f3acd67-1cd9-4630-6efd-08d8114a159f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42887EA24CD5EFB1CC3B18C68B9C0@MN2PR12MB4288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-Forefront-PRVS: 04359FAD81
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aP1KewbGSLRWj5uCSNP7C+WqwW9Ez+5zi2YXb8qZX4TXz4VB95cf+SiyjLVQnIcZqZMatHeDGOqZv6oVI44MH4bcth1HV2b/BWTjq0gPOFK0o9Rz1czy+GlzUy13cDJ47qLicUFVnLwwE/7eP6Gaw5TvcXju9OGfKZ9K1WGml/eJLr5CmpNNqvPBvE2M3SQ9kYVfEYyRlN9niOGacYvx/1c8IEDw3+jMkNDeCouA678NnN3EK8wi8VovYh8LkncOZJDox/w9nzPHLt3G+LvUy8GwgZBDcEEvUO3jhHQYaKQjX+KeoJ4WL6xxRqE///NHj5ek76RIqarg1cwZw8o+fOwiB0kLmg0NSjX3dg0jS83vtK+mQv/42Jn9K44jobe9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3872.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(478600001)(8936002)(316002)(16576012)(8676002)(52116002)(36756003)(16526019)(4744005)(186003)(6486002)(6666004)(2906002)(31686004)(2616005)(956004)(83380400001)(66946007)(53546011)(66476007)(26005)(31696002)(66556008)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: yemblojCZ4e5yHBHjO73VdMRJG3alQ0ALoVDWa/AQ1WiVO+xnm57izBGFa7CvFV6/gcYV1eokEHb5Buztu0qo0oJkOq6o3nDIyRndne6gk3hvtjzKS2bYvTL9OMAKiPLwUEQSL6CT1UEn8ckRE/e3ar6VUMRSii4HcjUNDtkSe/TF513lRbM3f2raRoci4iMHyRLY7RJX/GovC2dgBRT55xEqBFyiOADvbjIl8sa0YZpn6DKANQBLV2CeqULGwPhRQ4elxiwHjaLeaXrKlJ5fXNimiPJl8W7dXXiAgf1ffJLCIGLlrgfwmp7TJiJHRfb0JF+wQJhIZuwfLI4p6PrsXWR6W9T7gGTppPm5Dq43gxgO5GphvrNjvfreD/oTp7GVoBZzmSloIqI0/Fa8dbbynkXNg3S7owZqYWi/+rej25dwwm7c6mcsIRSMywJtRb8eB77PZs/q/yCGNDalG24IMh4EXpa8JKpsAHcrTOY3sU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3acd67-1cd9-4630-6efd-08d8114a159f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2020 16:35:16.2466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CF1zkhDJ2mIuhmS969TA51RrbtQ1yEISfAZWPLDXTCxbxOkuSTWOtZ52Oxxhr0Oegb5BpZPX8DIVErkBFha1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4288
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

UmV2aWV3ZWQtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KCk9uIDYvMTUvMjAg
NDo1NCBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBKdXN0IHNvbWUgY29kZSBjbGVhbnVw
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9tbS5jIHwgNSAtLS0tLQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9tbS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tbS5jCj4gaW5kZXggODJkMjg4
OGViN2ZlLi40MjVmY2QzNTkwZTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9t
bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tbS5jCj4gQEAgLTMwNSwxMSArMzA1LDYg
QEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgZHJtX21tX25vZGUgKnJiX2hvbGVfYWRkcl90b19ub2Rl
KHN0cnVjdCByYl9ub2RlICpyYikKPiAgIAlyZXR1cm4gcmJfZW50cnlfc2FmZShyYiwgc3RydWN0
IGRybV9tbV9ub2RlLCByYl9ob2xlX2FkZHIpOwo+ICAgfQo+ICAgCj4gLXN0YXRpYyBpbmxpbmUg
dTY0IHJiX2hvbGVfc2l6ZShzdHJ1Y3QgcmJfbm9kZSAqcmIpCj4gLXsKPiAtCXJldHVybiByYl9l
bnRyeShyYiwgc3RydWN0IGRybV9tbV9ub2RlLCByYl9ob2xlX3NpemUpLT5ob2xlX3NpemU7Cj4g
LX0KPiAtCj4gICBzdGF0aWMgc3RydWN0IGRybV9tbV9ub2RlICpiZXN0X2hvbGUoc3RydWN0IGRy
bV9tbSAqbW0sIHU2NCBzaXplKQo+ICAgewo+ICAgCXN0cnVjdCByYl9ub2RlICpyYiA9IG1tLT5o
b2xlc19zaXplLnJiX3Jvb3QucmJfbm9kZTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==

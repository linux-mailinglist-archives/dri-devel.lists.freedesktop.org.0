Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27661350C2B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 04:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940866EC06;
	Thu,  1 Apr 2021 02:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2080.outbound.protection.outlook.com [40.107.101.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE776EC04;
 Thu,  1 Apr 2021 02:01:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2Ki4wkcuHmapI/JxCsBINdKrS7qslEVWrMVPnJHnFvWZThF/sHS6NvOewKezd8GqtODPMFT/l7lyt50qkS6ZXNxzKVNG7Ib2Y7LomyJwVQVW3dSC6NLm5SrkYwS+P9ITsErULDDyGeVLdYCiyJWLzTGAtGxMSRUbDj6RdvA9fYVkBEI0jthXNRC1Psl5GsU5jWfXKC9rYZn17NI7RAxkNnJds07rJpq7Hcll8u4ckFUIpY8oi7hQRiZXijd5TRgugqdyuxBCOa5jP/GTH0CL4wfMZMnDgSqJg1ZC+h4ciorb0nen61Ew44DX3XpSDoEFuRz1pz4YOyXbT43g95DaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/cKxHCiGqJ8LskjF2+IreNvsj4v5krsCJEw1zVKsmE=;
 b=CCZW4pZwCKyTwv6umrf7vkh2j3jVX5fzfJzSTAWM5zVfwS8YwdnDUCseYL9MyT/UKsSv7oCJhrDU6z2y3GqSzjquEhBohC1UMoxtacRGTLBbSp7CPX9+E4cOHuP2CioGAbIugGzous89PC7uei2Gjt7xN+oJZ0cACjTjyjByTja9jUziaRavKs9BsPe7pzjK0eUXmAOhkbAquNzA7maGpIs0zQ///Z8mplKNScvvxPL/XR01kWxtoTND8UFe+07/FemLLRGakufGVA0Jbw13GPVlkVEloXwPxKzGvVGV+4eU/L1A9OsJa3bkMbN9uf4CxRb410iMyTNtTmd2onKQZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/cKxHCiGqJ8LskjF2+IreNvsj4v5krsCJEw1zVKsmE=;
 b=lCT1O4pz+n9IYHT1PH24OGgxHklVQH9YEOHEHkY3BYbgXe6GzcDmCkYAyz/TMTW3hsUZqgD+TBUEpeo5P+nux94BMagnf6yiXHjs/O6Xl6WHsRS5h4qUjO7CfIDPkLuZnCbpehP2qoY4Fczio7tfeMQSkmZYKqqA+F7xynfWRUk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by BL0PR12MB2338.namprd12.prod.outlook.com (2603:10b6:207:4c::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 1 Apr
 2021 02:01:12 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%7]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 02:01:12 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-fixes-5.12
Date: Wed, 31 Mar 2021 22:00:57 -0400
Message-Id: <20210401020057.17831-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.30.2
X-Originating-IP: [192.161.79.247]
X-ClientProxiedBy: MN2PR20CA0016.namprd20.prod.outlook.com
 (2603:10b6:208:e8::29) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.247) by
 MN2PR20CA0016.namprd20.prod.outlook.com (2603:10b6:208:e8::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28 via Frontend Transport; Thu, 1 Apr 2021 02:01:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b553fa2c-6079-4f5b-5bd6-08d8f4b206a0
X-MS-TrafficTypeDiagnostic: BL0PR12MB2338:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB233838F24C8D10C72B29C369F77B9@BL0PR12MB2338.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJlvxiN/+yh4gJlK5mDHjXj5yF1zt9zpbcgOYEw8s4vFBk93qz92VHosD4tr686hhNqSjA+fDcDCdsXpUB7jjelg2yIZ955eOkwtoy3PVs9+PADXJK/65TtWzYUbr0A3Q/EuaP0Z4S7VhqEhxuVJlowwav3EKVFLGzWbKu5OyUbm0sHNWQ9coZ+iU1SQu3zCshlJsI4muWmd39maGNEljdMhGYB7Q83OUhgs0zF8FxWD5RlokJuJAvtBK4dX4R+38dWktNxRBdvVBZAvLO+k8asiImVGnwXiA+eibdEmiAy4qGHW+ErE4yldcBpTASjCByakmlfqPjXQnYmiLWsuJJR/Hatp6fl7AGg0VeadGKPhgO2LzbEu+MHG04PWK7IQhPvB21BqIYyl3p4IN63aDStvaCFIQFKlwGZS0lBOYdjlA8dO6BjhafJa2pPjeAscMqTskTshNDySb2xQV4gX/kFtnKp60bN3ykcJDC7xuUPhifpDIYXPg/RdITybicqkNR4GUKM4YrviIvFE9LhJMkGqM5/k0CiXcaiD16mXcmIxyj7kal2EZLkUubwZ6dEXjngH6WLHLN+DwnBtZkIPc4uZUSOwur7ka00zeNy8iLUiKpzzT//jyoxqUqWivNFy5Y0dNx5ADsu9hTzHYOfFl+PA6fYZtae9LrsD6mrIUlo+AovKdQaTcVqnSRkRTuuN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(5660300002)(6512007)(8936002)(83380400001)(86362001)(16526019)(186003)(4326008)(66556008)(66476007)(26005)(1076003)(38100700001)(36756003)(498600001)(966005)(956004)(66946007)(2616005)(6666004)(2906002)(6506007)(6486002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MlFiNDNDVEhoanNOV2ZPeGl0THkzbjB1cWZaTExyTHJVeGptYnRjd3hIell6?=
 =?utf-8?B?OXh1QmNFVEIwQVBtRlBjNVZ3Q3g2MXByQ3lId3VYcXJ0dCtmeHVvSE01L3ZH?=
 =?utf-8?B?OE9kRSsrazhacnZHcDV4T2dOeFQ0VUR5dUY3ZUFleC9nL0xYZEZyRkd5Skh0?=
 =?utf-8?B?UFJVU2hMSzZ2d0lBR1ZHc3VNVDBPZEFNY3RxTjBBT0Uzc0ZEY3Y3RTBsaVV1?=
 =?utf-8?B?c1lGbGhPMUIzS3RUNFdTM1BlVmlIT3VOSHl5Rmt4bWYxaWhnY0o0L0xLZ0hx?=
 =?utf-8?B?dVQ2UFh6Q3dFcVZXZkp4b0JCaHFFL01idHlqSEFuV1BucHZ5MUd6RjdEOWpj?=
 =?utf-8?B?VWlpY0RJTlRtTWV4WHBBRWxtRVJjYTVBWWRKN1NERU54RXNZc1RLK2VNWFpU?=
 =?utf-8?B?MEtTNWJ2VUlMemllRTNKdlpxc09NOEJieFZJeU5iZmNMOTJ6djhBVERkdjFz?=
 =?utf-8?B?WHJXQkxQekt0QUJDNGYvblpvOGJrRnpUK2QwQVQ5WEhPV0VMaW1heFpHZjlz?=
 =?utf-8?B?YjR2QnRBOVVBK3dlUnN2YTlpaUYxdnJUUkttVUdic2R0blBjQVdzZ3lUQ29q?=
 =?utf-8?B?bThnTFBwSVpjaGJLSjhiYlcyOHZoazBZcGgzYVpYUVl4b1MwdE5kY0JiTGps?=
 =?utf-8?B?VFJGcXJoOEhtRWtYSURJclZILzNyOFJkM2orN00raDJ1ODdkenJtVHNwOU12?=
 =?utf-8?B?T0FYSEIzNEpSU01pR0xyVExTTXVMOGUrcGxBdlhHeElvSUhyWWFpOTZYNnVM?=
 =?utf-8?B?TVIzUzZUc0lNaFYvRUQrMzR3ZmdwREllNjZGd3orSVJmTnRoTDZXT1pWZmZn?=
 =?utf-8?B?VUVRay9ZZjJUS2tHbnU1M0ZKUEdqSXE1MithSGk0UEVpejdUWEwzS0YvV1FH?=
 =?utf-8?B?YnorLzllZy9sZFRMbU5vK2Q2UnQ3NCtoaDhXK2FDYWVHL3J4dUNyaFVvcEZR?=
 =?utf-8?B?MFQyZTFXZ2J5TTZnL0ZjSjNIZ0t4N0M4Z3kva1RjMEdEbWpzcmxKZzM3Vmpr?=
 =?utf-8?B?Y0dVZGFmWDIzbEx6cU5MNGVrU25NVTFGVWxmWFFkbmRmWDVnY0hXcTFTaWE3?=
 =?utf-8?B?ekFnKzQ4eXZXTFlzOTlXWXVOa3RVZlhmNnFVK1dEMHA2V0UxdnBJU2Q1bC93?=
 =?utf-8?B?NVloQWp6UVJIZ1A2ZUg1azZ0aVZlVmdUQnJ0ZzdsVzRrUDFleWorTGdzWDln?=
 =?utf-8?B?R29GajlaS3pUb0V6SVkvd3FiK20xNllxMjFTUzdwNFg1Z1hRUlFUajVMaFhS?=
 =?utf-8?B?ZWxqK3ExSWZ3QkhMeGtuWmUyK0hVSnJjNUMwNEJIbFdSN3FTTEVlUkE5NVNl?=
 =?utf-8?B?a1hEdzVsM3ZYWHFXdW1yT1ZUSmVid085a3puS3NUQnZINnVJU2pzV0UxMmM5?=
 =?utf-8?B?ZUk4V1p4U2VCYTRUY2tRRmFTT0JTOUk2OFBvRnd4cXdRV0c0bTdkV015NFJp?=
 =?utf-8?B?Y2V5TjNJRS82SFg5NzNEL3NsRENtQWQvOENENjRHNlBuK1VNWHBuK2ZNaytr?=
 =?utf-8?B?V2s5QWhZcGVwR1ZsbUtUdzZFV0o1L1Fxc0pQV2hTV2xETE9QTEdnNW5RaUlP?=
 =?utf-8?B?ZTFJcDZmbnZWZ2c2RThIOVJZZG5hNWU3RzVodmRzMUV6NW1PNUp5U1NjQnlR?=
 =?utf-8?B?RzVIbnVaUVVvYURWTFlJcjZCTFQ2Qy9RS1ZiM0ErZ00vTDFBNGQ3Znk4aUlT?=
 =?utf-8?B?MEY5andpZnNyd0tCNzZvZU11YnNwUFlJbUJrbWZqZGFkaDFPR2xDajg4YUNC?=
 =?utf-8?Q?A4kY8rX40JXLjGG90B7DooxmxqdVJlvYauQevwr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b553fa2c-6079-4f5b-5bd6-08d8f4b206a0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 02:01:12.7494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgJOpK4tZ3eU/prN+0b5VapJoO+pHgmQmYnP41UMR36Nc4DwYvVuTAUpV46MwszofWoRD1cTnpRw97eClQjiwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2338
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKRml4ZXMgZm9yIDUuMTIuCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMg
c2luY2UgY29tbWl0IDA5ZDc4ZGRlODhlZjk1YTI3YjU0YTZlNDUwZWU3MDBjY2FiZGYzOWQ6Cgog
IE1lcmdlIHRhZyAnZHJtLW1zbS1maXhlcy0yMDIxLTAyLTI1JyBvZiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvZHJtL21zbSBpbnRvIGRybS1maXhlcyAoMjAyMS0wMy0yNiAxMzowNDox
NyArMTAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvYWdkNWYvbGludXguZ2l0IHRhZ3MvYW1kLWRybS1m
aXhlcy01LjEyLTIwMjEtMDMtMzEKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBlMzUx
MmZiNjcwOTNmYWJkZjI3YWYzMDMwNjY2MjdiOTIxZWU5YmQ4OgoKICBkcm0vYW1kZ3B1OiBjaGVj
ayBhbGlnbm1lbnQgb24gQ1BVIHBhZ2UgZm9yIGJvIG1hcCAoMjAyMS0wMy0zMSAyMTo1MzozOCAt
MDQwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KYW1kLWRybS1maXhlcy01LjEyLTIwMjEtMDMtMzE6CgphbWRncHU6Ci0g
UG9sYXJpcyBpZGxlIHBvd2VyIGZpeAotIFZNIGZpeAotIFZhbmdvZ2ggUzMgZml4Ci0gRml4ZXMg
Zm9yIG5vbi00SyBwYWdlIHNpemVzCgphbWRrZmQ6Ci0gZHFtIGZlbmNlIG1lbW9yeSBjb3JydXB0
aW9uIGZpeAoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpBbGV4IERldWNoZXIgKDEpOgogICAgICBkcm0vYW1kZ3B1L3Zhbmdv
Z2g6IGRvbid0IGNoZWNrIGZvciBkcG0gaW4gaXNfZHBtX3J1bm5pbmcgd2hlbiBpbiBzdXNwZW5k
CgpFdmFuIFF1YW4gKDEpOgogICAgICBkcm0vYW1kL3BtOiBubyBuZWVkIHRvIGZvcmNlIE1DTEsg
dG8gaGlnaGVzdCB3aGVuIG5vIGRpc3BsYXkgY29ubmVjdGVkCgpIdWFjYWkgQ2hlbiAoMSk6CiAg
ICAgIGRybS9hbWRncHU6IFNldCBhIHN1aXRhYmxlIGRldl9pbmZvLmdhcnRfcGFnZV9zaXplCgpO
aXJtb3kgRGFzICgxKToKICAgICAgZHJtL2FtZGdwdTogZml4IG9mZnNldCBjYWxjdWxhdGlvbiBp
biBhbWRncHVfdm1fYm9fY2xlYXJfbWFwcGluZ3MoKQoKUXUgSHVhbmcgKDEpOgogICAgICBkcm0v
YW1ka2ZkOiBkcW0gZmVuY2UgbWVtb3J5IGNvcnJ1cHRpb24KCljihLkgUnVveWFvICgxKToKICAg
ICAgZHJtL2FtZGdwdTogY2hlY2sgYWxpZ25tZW50IG9uIENQVSBwYWdlIGZvciBibyBtYXAKCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgICAgICAgICAgICAgICB8ICA0
ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jICAgICAgICAgICAg
ICAgIHwgMTAgKysrKystLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RiZ2Rl
di5jICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCAgNiArKystLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5oIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9wYWNrZXRfbWFuYWdlci5jICAgICAgIHwgIDIgKy0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wYWNrZXRfbWFuYWdlcl92OS5jICAgIHwgIDIgKy0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wYWNrZXRfbWFuYWdlcl92aS5jICAgIHwgIDIg
Ky0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggICAgICAgICAgICAgICAg
IHwgIDggKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3Nt
dTdfaHdtZ3IuYyAgIHwgIDMgKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTEx
L3ZhbmdvZ2hfcHB0LmMgICAgICB8ICA1ICsrKysrCiAxMSBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNl
cnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==

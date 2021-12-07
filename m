Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB7F46B807
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 10:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CFFEA612;
	Tue,  7 Dec 2021 09:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69CAEA612;
 Tue,  7 Dec 2021 09:52:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P68uazn8Q+vXU/d+KUXeoCQUaF28AWIkN3cOBP74AQ/P84tlRxSDi5eWOgNYPjBrn/ukISiN9vDcZc0skW97457NMtCjZDEDsXn0WohT+25XmjB96kmGufQEnt2pDz84bTDbtpR3096N9+/dACjqaOKwcW0xRiCPVX9Cx9Ljyxl6RM7yCdG4XH5J70WA/xGTCw606HLH6lb4HKc+VllzY27rrtsCzgBkTvPZUxqzO59d50BzCglQ6mAWqLmPW2NJKeXmHctWwqkprEceNNLFj2CUCQZZZRRT4DqJGxmmj+3TGZmW6XtFGfqs0oysEHJ4+foOQcqNK54vJnqY7vmN4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jbyoDC1xi0OiP5bTq7T193bnikpXjgJMcWyQbRuAzw=;
 b=GIUbuoroB2rYUPmS9KWjWaXrAE3/MSx3mbIG1PtWcVc+9HjgFKKHpgjrDS41hpBdrelnHXpLzJAfGMbAoEpc3uhIOtpdLg/VXdh+Z6sj4T79EWG+UUkXsuux3Z7vvD/LXiWveTiGacLRvja7Azbb2KL+AofHWBrJnzqXHDKVZdlV93kVLwWYJjYK5dugETvP7h9RyEPQR90/bHnH7EelFPdo8Pr+8FZkJysXq1FplXPc39XKKtLuARh5ZUDAPsXk7mgeDwdk4dW/Ih+GsFhpM7XJEzqo2xb2YJXF2k6QEC5O8EyXMMohtozTxI2fEmqbCRmJ6lwE9DaMOe24n6yhKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jbyoDC1xi0OiP5bTq7T193bnikpXjgJMcWyQbRuAzw=;
 b=QgcZnk6K9NwocyvwDSLZaJLn/FFwlWHeO1AiuB/OOYVQnO9m5mPIp6VjIbvHTvkNasD6i/W232kudzkiN1Y0NwQek56f7Tep4xRW3ma0kE44T/ZggCvgCNbEVMOfZKysAQBgfkJ+BpjK9dU276CJIqsYe54OnOR9VzSXaM5kDuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW2PR12MB2362.namprd12.prod.outlook.com
 (2603:10b6:907:e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 7 Dec
 2021 09:52:07 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 09:52:07 +0000
Subject: Re: [Nouveau] Regression in 5.15 in nouveau
To: Dan Moulding <dmoulding@me.com>, regressions@leemhuis.info
References: <5dafba25-5424-3fe2-5046-ae1d4320f9c1@leemhuis.info>
 <20211206183721.6495-1-dmoulding@me.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6f62bd8c-3a2c-e553-898c-d42fb1583208@amd.com>
Date: Tue, 7 Dec 2021 10:52:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211206183721.6495-1-dmoulding@me.com>
Content-Type: multipart/mixed; boundary="------------3BA109AAA43B28248511E32F"
Content-Language: en-US
X-ClientProxiedBy: AM0PR08CA0018.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::31) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.191.248) by
 AM0PR08CA0018.eurprd08.prod.outlook.com (2603:10a6:208:d2::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Tue, 7 Dec 2021 09:52:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b83238b-bf74-4a0b-2673-08d9b9673ae8
X-MS-TrafficTypeDiagnostic: MW2PR12MB2362:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB23629C4A20CA45E3CA056121836E9@MW2PR12MB2362.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /ualQeV/+ShJ+l/oeTr43qHmdz0E+tUl9YZo2fxFH7I2Akkz5uQjh3wO52rfQNGV52b/RPih9j8Ctl+2mYZsMS54ozqfdGhVwrlciNvCJ3CkvDe3fc3+PZQzrWyveAvJd2r+2rZxErKZd3Vu0dfzbtrf+EKjshR/SrpMRJYUsqIkRutMsHsXX8TQhLIrhTDG0jgtkhv0x+75guufHBzyCJWCF4fgaiDl/WW6sooXkm5JtpR0lMx9+j6WYRs2I89UTW4DwtSjOJzzjXq/dq+jFXqn04AAnJaHlv65cPSLYBg+EAtmsNQuMTz3Cvq9QO8S8G7+qbzAxWlzZaaS6uRiyDKbX+dIVUqZ8Vrk1NUMja92YInJlqVBVWPzT0eS1D8Lhah0wozlICIJjyjqv5Odhvfu8HM9RDUgGOatz6Vk2HpS4TNNFSDVYZs2IJOEFbIxvqFSqunCJIYUlEbRRqI1d3zmyA+/LAA8w8xSKv2nKVDe6nPX78z2/6MlYMlUyNDIKhkL4NNM6bB9WeOkCC7SF7UxlapV0R/pBhrpZS2qHJ3rIcBFRNgLGnT9cZzeICHHozSDMKKaBmEMscNJivOzEKjov2xUIPznNLoT4Q63d41AJZbHO+9Wy9cqjl73+vD+xW3fBannck5xGbOYZBpQ0oikHC+JpYzLM/Qzn4ECN81NK8YrQjf0I17yE8Q/6YqJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(66946007)(38100700002)(16576012)(316002)(53546011)(6666004)(8936002)(66556008)(66476007)(36756003)(508600001)(6486002)(86362001)(186003)(2906002)(83380400001)(31686004)(5660300002)(235185007)(31696002)(33964004)(4326008)(26005)(2616005)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emNRWFA3c1V0M2JPeTJnT0RhRGhGQjR5T2toUXNFMHlPejlIOVJjaEI3Q1Yz?=
 =?utf-8?B?TVgxQkdjcVRJNWRZb3BZN0VhTmpoNDQ1Ymh5SzhKVnNGL21Lc2tLK011NWpJ?=
 =?utf-8?B?UktSblg0UW5kMUxxcnFNTUtaZTRoenVMb1BCMkFIZFhIbkQwV09xUVJ3Qm9q?=
 =?utf-8?B?MTdmOGpGWkdJTG9rSld5Y1BwaXBjNnFnNmp6b1V5dFlNcUNST01GNG9KcDln?=
 =?utf-8?B?d0NoWHYvbm5iNUZ6SnBpUTJOODBGRjlUTXFqd0RjUWZ5alc4Z2pWWEhxak93?=
 =?utf-8?B?R2tpOFdRMlZWTGVBYktoeE9FdWRQNGUrc2UxTkNaU2ZKNXV5RW50TmlDRjVK?=
 =?utf-8?B?aW4xM3Y5MXJjNzd4ZmNTUjNtVlFwd3FySXVFYStab3NiTCtqS2tNdFRiS0pT?=
 =?utf-8?B?dzM4UXZLVW8vNHV0eTdBaXQ4QXVjUmhhSDZmQVVjSnpxK2ZydWM2TzdZWWRD?=
 =?utf-8?B?aXg2VVBQR0lrWnRuenlqaDBnb3VUdHVhSlBFd2pVbU1VbXVPRHRZazR2SHpR?=
 =?utf-8?B?VHBtaXpJQVI4ZXlUYU5lNGlBRDFrYUhzakQ3Wlc1U0dFU0M2bldFM1BudnBL?=
 =?utf-8?B?N2ZDWi9WRDVHclJrS1A4YnE0NVUxd1BFeTRyRTlyUUJ3NHNUbkQ0d1RkZ01a?=
 =?utf-8?B?N29UVFJ0YTBBeGZTaDV4SE9UMDFGb3ZIWHU3SVM1QUJRaldVMnJjcUx4UzNZ?=
 =?utf-8?B?aXZ6V3RwQUd4M0xGQm5tMFVVM242bWF5OFRVc2tnYUVvUVgxS2k4MkRNYyt2?=
 =?utf-8?B?d0ZLb0R1c0ZUM1owaGsyclZwTlRLQjBrdjNDWUZ3TGVCcVhqc3YyK0h6N2hj?=
 =?utf-8?B?Y2gyMHVGdVBzcVVzUkR6Wm93ZHpBK0dRWGcxU2E1NzFYRzJyNmRBbys0RTNB?=
 =?utf-8?B?M1ZrSjNidTcwN0xBMTZ1WUlPZjZydWZhbU9JVU9PUXBIMi9iNzA3SzJWNko2?=
 =?utf-8?B?NEpzY29ocU5Wb2VBQ0FHVzBnZ1NpcUVWZUtDU0JST0MvdUdKNUdodDNodHds?=
 =?utf-8?B?WDdmazNuWU53bmpOZUZvc0VraE9NUDNMSVhnSExIaklJa3llRGp4TERCTzhC?=
 =?utf-8?B?UGwrK3hub25nRUlUaVQrN3dBWkpIbXI5cEJPSmZhVlpnOTRWTWo2S2xKa2g3?=
 =?utf-8?B?aVJ5cFBlTTJxcklxMnVWQ3prQ2Z3eWEzSGRjWXhyMDNBSlR2RFZRTy9Fa29Y?=
 =?utf-8?B?RHVrNGUxblZQcEFGcGlSUEZrbm9TRlZOL3NjdnZhQm02TCtaT3hNOW5xZGJH?=
 =?utf-8?B?RkxGZ3pKaG9pL2hJWjI0TDZRN1JpN0J5eVRxMXJPV3hCcFRyYStVMlRaM01K?=
 =?utf-8?B?SjMwaUFsY2l0cDRCS2dZVmRpUWNqWGhDbGhoM0lRUzc2dG1vV2JUalpVNC9L?=
 =?utf-8?B?K2J6NUdDU21tM1h1dFNCeC9neS9zZmJkWWJQelA5UlY2eVN4dFNHUVhjVXN0?=
 =?utf-8?B?MWdaSnNNS1dSbVJVeTVFRmlIMndMSEkreDE3VG1lWlVobzlFdjhneHh0Qnl2?=
 =?utf-8?B?WFRDOFJmRlVWcnRiUFBVb2xiSEVSVGJJMnVRVnFObTFvKzBiUldVMjg3d1Ra?=
 =?utf-8?B?K1F5REQ1SldjSUcyTkY4cVYzUHJaZVc5TWpSTFk0V1JGR3prM1JST1M2VG5H?=
 =?utf-8?B?M0lWdDAwL3FlczNMUTFza3RsYVhVbGRWdktTQmdBSjUzOUR0TnN4VEd5bnRY?=
 =?utf-8?B?V25jYkZiTEliWmJGWVdkQW5BTXVGVDhTSnJkZmRUTWhsTTdoblNJMUxYL1VE?=
 =?utf-8?B?cjNDbG4xWmtXVG5ERFl0MHBFVEVGdkdZYTBvUmhybFQwcXJnNFRwQTlObjd4?=
 =?utf-8?B?bnREM1lMMmZpZStzWnRtMkRSeHp2WjVldXJzUWdBUnNtVW5Tc2ptV3MrSDVp?=
 =?utf-8?B?UWQ3R0RlZmRWOFJYa1IyUGlRTjBWd0pmTzRweTlpd1JxTHhMOW5vNFpsVUlO?=
 =?utf-8?B?MHFGSTNINWdBUjYzZkY3aUhqblFGNGR4ZzlORG5ta00rRVFPRy9XQ0plbnhG?=
 =?utf-8?B?cktpa3Y0ZUNBK1JobzFBREZTK1ltZy9rczlUWmh2NUx0NVEyc1NudWtDKzNi?=
 =?utf-8?B?QS9jTUNGK3pCdUZaaTlWZGFSZ3RNKy9PWUhXbjRhbzlZdEx4d2VsWmlrYkJn?=
 =?utf-8?Q?QFB8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b83238b-bf74-4a0b-2673-08d9b9673ae8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 09:52:07.2547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m99+LxaXyxVxf5p2S5oMOAYzW0dozTczUtJsLAUyF+Y8B7Yalhbsf/GGMGi05m0i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2362
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
Cc: nouveau@lists.freedesktop.org, sf@sfritsch.de, bskeggs@redhat.com,
 dri-devel@lists.freedesktop.org, regressions@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------3BA109AAA43B28248511E32F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 06.12.21 um 19:37 schrieb Dan Moulding:
> On 04.12.21 17:40, Stefan Fritsch wrote:
>> Hi,
>>
>> when updating from 5.14 to 5.15 on a system with NVIDIA GP108 [GeForce
>> GT 1030] (NV138) and Ryzen 9 3900XT using kde/plasma on X (not wayland),
>> there is a regression: There is now some annoying black flickering in
>> some applications, for example thunderbird, firefox, or mpv. It mostly
>> happens when scrolling or when playing video. Only the window of the
>> application flickers, not the whole screen. But the flickering is not
>> limited to the scrolled area: for example in firefox the url and
>> bookmark bars flicker, too, not only the web site. I have bisected the
>> issue to this commit:
>>
>> commit 3e1ad79bf66165bdb2baca3989f9227939241f11 (HEAD)
> I have been experiencing this same issue since switching to 5.15. I
> can confirm that reverting the above mentioned commit fixes the issue
> for me. I'm on GP104 hardware (GeForce GTX 1070), also running KDE
> Plasma on X.

I'm still scratching my head what's going wrong here.

Either we trigger some performance problem because we now wait twice for 
submissions or nouveau is doing something very nasty and not syncing 
it's memory accesses correctly.

Attached is an only compile tested patch which might mitigate the first 
problem.

But if it's the second then nouveau has a really nasty design issue here 
and somebody with more background on that driver design needs to take a 
look.

Please test if that patch changes anything.

Thanks,
Christian.

>
> Cheers,
>
> -- Dan


--------------3BA109AAA43B28248511E32F
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-nouveau-wait-for-the-exclusive-fence-after-the-s.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0001-drm-nouveau-wait-for-the-exclusive-fence-after-the-s.pa";
 filename*1="tch"

From bcb86d62569c0131288c8b032f848f28f0178648 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Date: Tue, 7 Dec 2021 10:10:15 +0100
Subject: [PATCH] drm/nouveau: wait for the exclusive fence after the shared
 ones
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Always waiting for the exclusive fence resulted on some performance
regressions. So try to wait for the shared fences first, then the
exclusive fence should always be signaled already.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 05d0b3eb3690..0947e332371b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -353,15 +353,19 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 
 		if (ret)
 			return ret;
-	}
 
-	fobj = dma_resv_shared_list(resv);
-	fence = dma_resv_excl_fence(resv);
+		fobj = NULL;
+	} else {
+		fobj = dma_resv_shared_list(resv);
+	}
 
-	if (fence) {
+	for (i = 0; (i < fobj ? fobj->shared_count : 0) && !ret; ++i) {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
 
+		fence = rcu_dereference_protected(fobj->shared[i],
+						dma_resv_held(resv));
+
 		f = nouveau_local_fence(fence, chan->drm);
 		if (f) {
 			rcu_read_lock();
@@ -373,20 +377,13 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 
 		if (must_wait)
 			ret = dma_fence_wait(fence, intr);
-
-		return ret;
 	}
 
-	if (!exclusive || !fobj)
-		return ret;
-
-	for (i = 0; i < fobj->shared_count && !ret; ++i) {
+	fence = dma_resv_excl_fence(resv);
+	if (fence) {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
 
-		fence = rcu_dereference_protected(fobj->shared[i],
-						dma_resv_held(resv));
-
 		f = nouveau_local_fence(fence, chan->drm);
 		if (f) {
 			rcu_read_lock();
@@ -398,6 +395,8 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 
 		if (must_wait)
 			ret = dma_fence_wait(fence, intr);
+
+		return ret;
 	}
 
 	return ret;
-- 
2.25.1


--------------3BA109AAA43B28248511E32F--

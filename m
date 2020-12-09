Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D42D2D4DC4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 23:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B766E177;
	Wed,  9 Dec 2020 22:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED2A6E1F9;
 Wed,  9 Dec 2020 22:31:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxUYCyB+rPJL7O+ThiFONUgYg4Uh2wlmfzUhuI02mZVVfPel7BseSnYdNBavvFEcR7NDbg/YTyEV5TLB588OguspK08R6LPQW1Pdr2GrtuXOuMQ0o2IB4j8a4wvWcr+EtUrEsv/qhI1z+oO1wdaMY21qecYBHqyerKCgf7Ox1AFKMPWVXYB3RTzMUka7aqUiS/i6ACrpSJulxiscG0o6iJyUbs7j+obxh1tP8cOZgZWVYNTrZtxtsR9bjrGDuuGf3AoxUXGTCdGSNR9p6KmxW5G3BHKexHxnjQEpiSjw+2V3nSC3o9fhnP2xQVR1mZbJW6FimbEtCMhcB1lDwPwEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vEQk7D4VRNjtpia9UhbvRIbgja/q6/PpWiYSpkjB1w=;
 b=ZrtDyRmaMVr6zWbQ3mXywfHmcsiaEEdwstUxeL4unaXLdkdfB3NPRnfLErfR/Tr4hNb3V9EmZSlaHa/mPuiglX1HYrGRJblRLRH2G1RGmTJJP9xnQ+dauFXnJ9kfC9TLGSelLCjqCzSGQetiPjzsBEFB4m1QTVN3vTF4iPe/GC/d5ioIHRvAwwvj7/YSnQKGIUIkooJA5kDhb1+A1v+1ex53U7AVGlQ43lbq2jjYeRKAG8QbT80hn+r0G1Lhur/mpIFzpXs9rmsQwHOytjdsnQJ9GimBmLXjID1vR+Rrg9f856oimiz1hB2zcZl+4OlGoW0k/HtL62K83q24jXCLNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vEQk7D4VRNjtpia9UhbvRIbgja/q6/PpWiYSpkjB1w=;
 b=sw/MI5k0vuZq5dcVtE/7K1QNeuz94v1o+t9NSZIkI8zqDzUZ92z9OphY1id3kS/OhIQ1GHvIOUiNYyPvOAEVW9Z7KWxcMAC7lAPGxaH9vjpaeYWk4OSFGT8am6bUtAC47M9XT3ILpgt5AL3sf9cSUbCvgoz6MwpgmSoHMu9cX2k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB3868.namprd12.prod.outlook.com (2603:10b6:5:1c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Wed, 9 Dec
 2020 22:31:57 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3654.012; Wed, 9 Dec 2020
 22:31:57 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: dri-devel@lists.freedesktop.org,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] drm/sched: Add missing structure comment
Date: Wed,  9 Dec 2020 17:31:42 -0500
Message-Id: <20201209223142.78296-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.29.2.404.ge67fbf927d
In-Reply-To: <20201210092435.253b12aa@canb.auug.org.au>
References: <20201210092435.253b12aa@canb.auug.org.au>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YTXPR0101CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::47) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 YTXPR0101CA0070.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 22:31:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb184e0d-4744-400e-646d-08d89c923cc7
X-MS-TrafficTypeDiagnostic: DM6PR12MB3868:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3868C2FE5581BD2A09D9909999CC0@DM6PR12MB3868.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FyROITzpjnEcxVr6PqZ6FeLzqeaBJkuUdubWzM4I3iSfKvrmQqCkLa5fBfxs8IeR0C7QT8XAAGRUQ1ZNpbo74qa+8q2w6QgF6UnVpOlssob15JUVu+SaAZ2Oiq4PkXO05m879rRXfwSPuCmdG+gZiRDnJYtIDMAlvw1wDT6OG1tS1g2O9IvsFma+xfHzZMf0TJpiujeP7TxjaqxaiXGHHD/NPmIBxSGZAZvYeaDDTiebLg1M0dz70nPl38fm8ZUe1y+RqXGALECdg8cEVDSMp0NzHC+vxa7DjHJST0+jPzfRyUMXjbpIiHwR6C3XSIjLVNcZST9jsijQ3Rl+T+BuJhBCjvWduq2qMe+1t8JUzHASh2E0Kp1RUubV4jDYowD2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(66574015)(16526019)(186003)(956004)(26005)(6486002)(8676002)(52116002)(508600001)(7696005)(34490700003)(2906002)(66476007)(54906003)(66556008)(2616005)(8936002)(110136005)(44832011)(86362001)(83380400001)(36756003)(1076003)(66946007)(6666004)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NGdLci90Y3BPNXVGcENEM2k5dFpQaVJ1djRDTUkrZHRDajk4cDNuWXZyVGIx?=
 =?utf-8?B?SEgwU2FyYWFOVlVwczZ4SEF3VWJySVNyaWFWR0xqZWRlOGR1V08raGpDRHhn?=
 =?utf-8?B?Tk96cHF3cTJKMnlEczd2K0NhRXlpNEF6dmdmek5DTmxwRVBYWGJrcFpPaDd3?=
 =?utf-8?B?WE16akc4bGwwb0dIRlpyWVdGcnZhZzl6U2N5OXA2Sy9BQTlIUmNqUzNyTnFR?=
 =?utf-8?B?SWJOMFA0UDY0Vm40Tk1xVlNOTVMzZHFPenVXaUp2QVV6dGhFL1RRMWxQbDQ4?=
 =?utf-8?B?R1JycjB4ZDRHeFg3S0NZazhqd0M5QkU0dys0TTFrdjZqVW05L0JKRTZoeFZ5?=
 =?utf-8?B?QVZNdE9MUDcwUU53dmxqdjhXeGdIa3lOQWU4dW5TTEhSNUJBMW9ncFAzOHhy?=
 =?utf-8?B?bVlyRmdyRWs0MTkzVmFBRUtPUDlTejFVOEk1clNLTURQRjFLRTBBdEdwRUxR?=
 =?utf-8?B?RzZmamM4VWs4dEd2Q2pyS2I1bmhqZlR6Lzk0LzJiVTZLU0VDaTl6djRyc2Iz?=
 =?utf-8?B?VzArWVdkM0JjZHhxY01SMTR1YUxPeEFhd1I1ek84YXoraWlBQ0Fwc2RXZkI1?=
 =?utf-8?B?RldJb1VqTnFsOUMzcHZLYmxIYjZ0Q0JWd0hqSjNmZmdtNTZiUXdTYlhVQS90?=
 =?utf-8?B?ZjdUTVlxR0dGSk5vMzRyR1h6TDNIcVpXeW5YcGdwdDQxY2QwbmUreWRIK2g5?=
 =?utf-8?B?QTFlRkhCTVhyYkQ3M1BaeVRlUW9Tamc3ai9aSEd3UGx4YmhtZFc3b3dobGh4?=
 =?utf-8?B?eEFEOVpyL2haME90SC8wU1FDdzVWcUd0RnMyUWRFQnZOYmZ4ZHQ4N1lmcnZY?=
 =?utf-8?B?WWorQ2tUNkwyRTNjZVRIcXd5VjE5NUZmdVdiME5IUXYxbXU3SWVLUFoyZEg0?=
 =?utf-8?B?OFVqaldGUTRqZDhHZnJsK3ZiWHpvTGwrb2NCN1BHZWFNalZCTVhtRm5wZUZ2?=
 =?utf-8?B?dmtmYXcrc29kRkpTaElURG12a2lUOXB0blRPejFMZWpEMVE3aUxuRVNoTHJU?=
 =?utf-8?B?QVAyTzZQQ3JyNHFRMCtQZitEc3RLbHkzYVpsd0R3cUpmWm11bk5sa2MzcUZH?=
 =?utf-8?B?dkQxeU1NYzhxOVRhakdJcitQSnVuNmdUTWR0ZFhEUXVjSjVvVDFSUEN3VU82?=
 =?utf-8?B?Z3RRb2pmT1pnQkg0bDhJL2piZnJCMVRGQSs0bFRmcmppMkV1NklDeHViS1Zs?=
 =?utf-8?B?R1U2SVRNVDBuVHNLL3ltK2dISGwvRUNLRE5YdmRDeElXWjc3Y09Cekd3aWl2?=
 =?utf-8?B?SGprZjZsdWpzU2ZHNEdvbm9vNmJETmF3ZlZZc01uaG1GSFBoa05OOHBMVHA1?=
 =?utf-8?Q?w+DFfWi2345QGiw7uRStj7AsOvxZu1qaLJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 22:31:57.0784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: bb184e0d-4744-400e-646d-08d89c923cc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFYuXb0+uetOPACdCy3vCtTQ4dbnVqmGAzEFvbxccJe47jSkEFLXIiYG5Z+WYwPQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3868
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgbWlzc2luZyBzdHJ1Y3R1cmUgY29tbWVudCBmb3IgdGhlIHJlY2VudGx5CmFkZGVkIEBs
aXN0IG1lbWJlci4KCkNjOiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4K
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkZpeGVzOiAgODkzNWZmMDBlM2IxICgi
ZHJtL3NjaGVkdWxlcjogIm5vZGUiIC0tPiAibGlzdCIiKQpSZXBvcnRlZC1ieTogU3RlcGhlbiBS
b3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+ClNpZ25lZC1vZmYtYnk6IEx1YmVuIFR1aWtv
diA8bHViZW4udHVpa292QGFtZC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5o
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oIGIvaW5jbHVkZS9kcm0vZ3B1
X3NjaGVkdWxlci5oCmluZGV4IDJlMGMzNjhlMTlmNi4uOTc1ZThhNjc5NDdmIDEwMDY0NAotLS0g
YS9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZ3B1X3NjaGVk
dWxlci5oCkBAIC0xNzEsMTAgKzE3MSwxMCBAQCBzdHJ1Y3QgZHJtX3NjaGVkX2ZlbmNlICp0b19k
cm1fc2NoZWRfZmVuY2Uoc3RydWN0IGRtYV9mZW5jZSAqZik7CiAgKiBzdHJ1Y3QgZHJtX3NjaGVk
X2pvYiAtIEEgam9iIHRvIGJlIHJ1biBieSBhbiBlbnRpdHkuCiAgKgogICogQHF1ZXVlX25vZGU6
IHVzZWQgdG8gYXBwZW5kIHRoaXMgc3RydWN0IHRvIHRoZSBxdWV1ZSBvZiBqb2JzIGluIGFuIGVu
dGl0eS4KKyAqIEBsaXN0OiBhIGpvYiBwYXJ0aWNpcGF0ZXMgaW4gYSAicGVuZGluZyIgYW5kICJk
b25lIiBsaXN0cy4KICAqIEBzY2hlZDogdGhlIHNjaGVkdWxlciBpbnN0YW5jZSBvbiB3aGljaCB0
aGlzIGpvYiBpcyBzY2hlZHVsZWQuCiAgKiBAc19mZW5jZTogY29udGFpbnMgdGhlIGZlbmNlcyBm
b3IgdGhlIHNjaGVkdWxpbmcgb2Ygam9iLgogICogQGZpbmlzaF9jYjogdGhlIGNhbGxiYWNrIGZv
ciB0aGUgZmluaXNoZWQgZmVuY2UuCi0gKiBAbm9kZTogdXNlZCB0byBhcHBlbmQgdGhpcyBzdHJ1
Y3QgdG8gdGhlIEBkcm1fZ3B1X3NjaGVkdWxlci5wZW5kaW5nX2xpc3QuCiAgKiBAaWQ6IGEgdW5p
cXVlIGlkIGFzc2lnbmVkIHRvIGVhY2ggam9iIHNjaGVkdWxlZCBvbiB0aGUgc2NoZWR1bGVyLgog
ICogQGthcm1hOiBpbmNyZW1lbnQgb24gZXZlcnkgaGFuZyBjYXVzZWQgYnkgdGhpcyBqb2IuIElm
IHRoaXMgZXhjZWVkcyB0aGUgaGFuZwogICogICAgICAgICBsaW1pdCBvZiB0aGUgc2NoZWR1bGVy
IHRoZW4gdGhlIGpvYiBpcyBtYXJrZWQgZ3VpbHR5IGFuZCB3aWxsIG5vdAotLSAKMi4yOS4yLjQw
NC5nZTY3ZmJmOTI3ZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==

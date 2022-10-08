Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E330D5F8A18
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 10:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED9E10E176;
	Sun,  9 Oct 2022 08:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2085.outbound.protection.outlook.com [40.107.215.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BC310E21C
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Oct 2022 11:54:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxpMWkqKcr6LaHLn6o/y4vjKFHcnTmiu3kpDTfytjiFbRMvPD2ZFtEu/gWBHKfHotwlYJpOKRNuBxM+jXf6W2pvQjrkJcnn5rwdI8OcFMLafcs9Aua48bcTj1ZIkvJqiiD6sfvwfi6Cn4FpkGi3FUtQji4scAukf053ClaNk0G50mZyoGEFjXZwDakbecjFSmrIEUfR6VstdaC2+tqGI6AZHAKa1821Uyt/4jGrT+3UVoo4vlWJRrICXMP1ByS4CKtmyBIxYnNc4vNHkdoOkgIIatKYoN2QPLQVWp+FZowAa208ggowNqEDTc/V4alpRKzsfSowR6lgcDWdM/EESPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JRkHmQFE++a/HCsJ/pvP9w7XBZ5irDVrRnuf30yvd0=;
 b=FjlUFmpBzPcjl9JIZjl+Sdh1KQqLqiTGV5IJP2tDCXltj72mwQep5+a50MIsAFPEDVb8ClDBPDxGXYtWpyZRlWbre9mARBllybcFuqsh91rj0wFiBb1oXHXnwgR4jopvngfY7ONY6u7G1TRXfiqN3UNc2D6LiXdSsWk4rgkrCujXU8cfhNKREOnAEXefYIveftkOXhMcyQpQVGiYBqnHW6N2N3CJX3EXpf+iPRczKCt15/CEwB3XhtT62HjTRtVHuK15tJYtcXM7o4Qyd57uc8Y2tH8Sg8mxpcONMIvuNtUisn6b1XDXOZFYCccBp7irtpreKs1GLKr2EH6T7vYssw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JRkHmQFE++a/HCsJ/pvP9w7XBZ5irDVrRnuf30yvd0=;
 b=E9mfrQz++hiWELy1u0fcHvlfk2dpm4CwETpP30kowJJXp/kJzeJbI4bQJLkqWxJT6sBf2Qxz6sAUW7AIZCzNg1QxB+UC8xOer0oC3gVQWg+uzRyZTafHGEUDWCDIwJnoVz6mcbbr7po4czYNDdT9idJlrVZ7ne91yOHu1E9NIgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from HK0PR02MB3379.apcprd02.prod.outlook.com (2603:1096:203:7e::13)
 by SI2PR02MB5145.apcprd02.prod.outlook.com (2603:1096:4:155::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Sat, 8 Oct
 2022 11:53:57 +0000
Received: from HK0PR02MB3379.apcprd02.prod.outlook.com
 ([fe80::9908:e73b:e847:8033]) by HK0PR02MB3379.apcprd02.prod.outlook.com
 ([fe80::9908:e73b:e847:8033%7]) with mapi id 15.20.5709.015; Sat, 8 Oct 2022
 11:53:56 +0000
From: hongchengwen <hongchengwen@oppo.com>
To: hongchengwen@oppo.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] Revert "drm/sched: Use parent fence instead of finished"
Date: Sat,  8 Oct 2022 19:53:52 +0800
Message-Id: <1665230032-113107-1-git-send-email-hongchengwen@oppo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To HK0PR02MB3379.apcprd02.prod.outlook.com
 (2603:1096:203:7e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK0PR02MB3379:EE_|SI2PR02MB5145:EE_
X-MS-Office365-Filtering-Correlation-Id: 153f869b-aca6-4be6-74d6-08daa923c7ae
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nRGLemYvYZeWeiq/e9znIkZK7ryiP1UigXIx/JRsIUhoJ54+YCNpYy8roCYK8Hhs11B1SjgMWWAteMEzP5IC+PRfNCiq9SM85kyEP9uM7Ft3EcTbq1hkOuYsJRjb89w2d5bzRyE8wPWOSxBbK1DcY2TSwrsBb+9gLYuS9Wzs2hVBul1GvQsP0gglFLQDR+C/roVXZ8aX61PoHAkVDlJxDFyq1zYs7cvCZ4VbS8R4wdZvLh3vocfMkSyolyeyBE2NNMfQ4XzZfQaS+C9Rwd/uQckn7JnlcuKtJOrMvGN8tjUcgauXvQCQXl8WAEmxNbcoCRzKH+XCIT/Erbp35HCmRcLsaPGXRMA6XUn95q4cwP5YVkAFPJQbsKDgu0sHYLBEkRp4VSq5o64Jl+nK243qHl90B451Hxlvs6u33d8eTA0Ye6sgzW6m+GJGYqlBwQ2HhJNifrV3Eb64LaQLEyX9rV6gGAq+H8gUVk2TLCobYzK2Z4ENuOiu5UcNjlYHVHkTFeVUSQbfXeGGGDNjr6AJdLeYSwNspkhz7ywWmZRFr850QggSElMKpe4dQ+zNx95+/lguOy7BdE5px/Kp8d9RJ//YheF2SoTCZYlZq7NJP01KCea1JmecI61+gKkJnMpJxNbeevD/Vkv+jeWZHNZE143Fjj0SKM+yK7Ef9HucIHXdlNLdbcw4o1yerwmQfrzEDi7rEdpqCfslo0Zzr6hGZwjfRLdwWVGIy2LCVdbqa7PzfIVnEfrTaq8lMh+mA82W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR02MB3379.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199015)(316002)(66476007)(66556008)(66946007)(6666004)(8676002)(4326008)(6486002)(478600001)(8936002)(26005)(6512007)(5660300002)(6506007)(2906002)(2616005)(41300700001)(186003)(52116002)(36756003)(83380400001)(38100700002)(38350700002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LvjFTpUZHgC06V9sqRE0f0ls8PY3kbMwbrmOZt/dGLxkNwSolLt+5/sBjKJN?=
 =?us-ascii?Q?vURgEWrofobKIk2DvxWTzjWPBSO5i4vX9+dEOMN9d2ZXIlsIebxIAqTy7fNl?=
 =?us-ascii?Q?BNRUcJ4oq6Djx2+vB7V3XUXBBtUbESu8IB9KoE9V7M70prpE1B+5cWAGLaVR?=
 =?us-ascii?Q?DujzHhB0zA0EVNWZCgkou035EQ8K3mJj6C/sD/I3rnQeLAgM3q81mpiT2SL9?=
 =?us-ascii?Q?qQzknFwlr0mFj5FNyM1jv8Kyq7IaJ/hOkAvz4Q/2Q5WVBtBcEicx6oWqoZL1?=
 =?us-ascii?Q?xSGizx3Iqr//tydFRj2tXhsBeRSi3iX6BrxmvcYiLDxMPbgQK0U8EN3RAKi9?=
 =?us-ascii?Q?9kw2AafMUfBL7zxB8kWv2JRrXbmhFls8YrnOV6//AC3vWZRz1c/05MPSnZPk?=
 =?us-ascii?Q?LbT9Y024P00Z6B/Kuc0CB6/9IqCtsiC+EVop5pj5tuGwGyeonk9Q1R0YdY5X?=
 =?us-ascii?Q?ThOSKZ6IQ/ViWrm9pGbTnoWEEoO1Ldt+gZBc+vDSTmGEv9czE6byTk9wZcWP?=
 =?us-ascii?Q?ib8RXw1Mk3I4+nQ5NECF2NiRhSCQtUxUadMTDajBA6WFbPexfuojCdGHAQ9h?=
 =?us-ascii?Q?Xzq4AapLFFqiwTwaWGxTXEPeajWJ5+07NFVjnj0Z/mBabgq9HFp6eu8PCz2J?=
 =?us-ascii?Q?ludLp89QlNwVadRoTruULK55mug2SdvJUyh8dpOjcVnYr4KFTbktFPdxONBU?=
 =?us-ascii?Q?qMevg+9zlWP6rRETNcFy8+IwrVZ9fUbCfcz9ATntv0HHH7Z1O/lO6TBOU/5m?=
 =?us-ascii?Q?75xeb3wW73aL01l4unWLY6VY4SB+7BHcXY8nR7QB6K0JLh9hY4NRPSU8IEdY?=
 =?us-ascii?Q?g6Mvz/CTbUdzUusneIIO3vqELaCVgq/NALlxJYhX/S4vFPK4Mw95LZR8Uw67?=
 =?us-ascii?Q?IbHXR50jMjK9kbNbWmNFcKLnsPfXA+3r9BNK77mNgTM1y0ntNrMjYu3SRpnM?=
 =?us-ascii?Q?vHXJ9NhVJ4hRWu7GxcAvdeQFngKzrwLZVWkcuPRwzDVUnPtX+0UTQjpVqZ+I?=
 =?us-ascii?Q?/Wy5s8CYfK/9XA7lf3zxRLoqKdJ0yaDfNNG9Zw72ga1Zv9meoRBv2wfzNS0L?=
 =?us-ascii?Q?6sdWsxmIalUQXDMdwkb6dFbudQB5sanOWRVMjwu/SFFxMpeKGvWVLQNn8H3W?=
 =?us-ascii?Q?I3YX2quFhKxOHafN/4tWAFw13F9YE2pRE7SZieAvq49NEqO0BbdNtYVxrqZ/?=
 =?us-ascii?Q?KxM8z41N+ZAQkmcfgqEB4JVdQSCSU60KaOTNF8eDWx4fPo82eQmcT4Xj8eGW?=
 =?us-ascii?Q?NsVJwsFpIcIW4fWP24qWIdIm5X4fPNUNGWRPa6SBAIk+ux8XmpAuONnfr2zW?=
 =?us-ascii?Q?sGWQ/ZZcXKnVCmzNFi5Jg5orIc+f0MM4E/9RZA/YlQxZtmgIJnfk08knT5qS?=
 =?us-ascii?Q?wUSSX2jCgXqWfhoeFMaCOPJfkTHRj9+/3lmJXv5krxOq6supuz0DYjhvfb0o?=
 =?us-ascii?Q?FVvgdQni0mdgKyA8jgsW6yhkirJ6zYS8XP2Xn0Y/fGjje/tg0R4grdUmqp0N?=
 =?us-ascii?Q?vzlxSLLFdZlZ1nda3P4NmX+tzFhsg2aSBWht/LX3dMYmE+RLtHoVbGtJkpSw?=
 =?us-ascii?Q?dphFnZBSvapH+vixHIVuTF5ihw7LJ4L+KhEDPqUFSLvMd53Y0tAoUu2xNzlT?=
 =?us-ascii?Q?Hw=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153f869b-aca6-4be6-74d6-08daa923c7ae
X-MS-Exchange-CrossTenant-AuthSource: HK0PR02MB3379.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2022 11:53:56.7426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQYnyGL6NszkWYT6IN+tbfaGT/G3IjryKzjPqhcyvOb7xjDENg7TN/h+vdrdXnu8ctzV0hq811ENvKCY9+/dcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB5145
X-Mailman-Approved-At: Sun, 09 Oct 2022 08:11:24 +0000
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
Cc: Dave Airlie <airlied@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This reverts commit e4dc45b1848bc6bcac31eb1b4ccdd7f6718b3c86.

This is causing instability on Linus' desktop, and I'm seeing
oops with VK CTS runs.

netconsole got me the following oops:
[ 1234.778760] BUG: kernel NULL pointer dereference, address: 0000000000000=
088
[ 1234.778782] #PF: supervisor read access in kernel mode
[ 1234.778787] #PF: error_code(0x0000) - not-present page
[ 1234.778791] PGD 0 P4D 0
[ 1234.778798] Oops: 0000 [#1] PREEMPT SMP NOPTI
[ 1234.778803] CPU: 7 PID: 805 Comm: systemd-journal Not tainted 6.0.0+ #2
[ 1234.778809] Hardware name: System manufacturer System Product
Name/PRIME X370-PRO, BIOS 5603 07/28/2020
[ 1234.778813] RIP: 0010:drm_sched_job_done.isra.0+0xc/0x140 [gpu_sched]
[ 1234.778828] Code: aa 0f 1d ce e9 57 ff ff ff 48 89 d7 e8 9d 8f 3f
ce e9 4a ff ff ff 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 54 55 53
48 89 fb <48> 8b af 88 00 00 00 f0 ff 8d f0 00 00 00 48 8b 85 80 01 00
00 f0
[ 1234.778834] RSP: 0000:ffffabe680380de0 EFLAGS: 00010087
[ 1234.778839] RAX: ffffffffc04e9230 RBX: 0000000000000000 RCX: 00000000000=
00018
[ 1234.778897] RDX: 00000ba278e8977a RSI: ffff953fb288b460 RDI: 00000000000=
00000
[ 1234.778901] RBP: ffff953fb288b598 R08: 00000000000000e0 R09: ffff953fbd9=
8b808
[ 1234.778905] R10: 0000000000000000 R11: ffffabe680380ff8 R12: ffffabe6803=
80e00
[ 1234.778908] R13: 0000000000000001 R14: 00000000ffffffff R15: ffff953fbd9=
ec458
[ 1234.778912] FS:  00007f35e7008580(0000) GS:ffff95428ebc0000(0000)
knlGS:0000000000000000
[ 1234.778916] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1234.778919] CR2: 0000000000000088 CR3: 000000010147c000 CR4: 00000000003=
506e0
[ 1234.778924] Call Trace:
[ 1234.778981]  <IRQ>
[ 1234.778989]  dma_fence_signal_timestamp_locked+0x6a/0xe0
[ 1234.778999]  dma_fence_signal+0x2c/0x50
[ 1234.779005]  amdgpu_fence_process+0xc8/0x140 [amdgpu]
[ 1234.779234]  sdma_v3_0_process_trap_irq+0x70/0x80 [amdgpu]
[ 1234.779395]  amdgpu_irq_dispatch+0xa9/0x1d0 [amdgpu]
[ 1234.779609]  amdgpu_ih_process+0x80/0x100 [amdgpu]
[ 1234.779783]  amdgpu_irq_handler+0x1f/0x60 [amdgpu]
[ 1234.779940]  __handle_irq_event_percpu+0x46/0x190
[ 1234.779946]  handle_irq_event+0x34/0x70
[ 1234.779949]  handle_edge_irq+0x9f/0x240
[ 1234.779954]  __common_interrupt+0x66/0x100
[ 1234.779960]  common_interrupt+0xa0/0xc0
[ 1234.779965]  </IRQ>
[ 1234.779968]  <TASK>
[ 1234.779971]  asm_common_interrupt+0x22/0x40
[ 1234.779976] RIP: 0010:finish_mkwrite_fault+0x22/0x110
[ 1234.779981] Code: 1f 84 00 00 00 00 00 90 0f 1f 44 00 00 41 55 41
54 55 48 89 fd 53 48 8b 07 f6 40 50 08 0f 84 eb 00 00 00 48 8b 45 30
48 8b 18 <48> 89 df e8 66 bd ff ff 48 85 c0 74 0d 48 89 c2 83 e2 01 48
83 ea
[ 1234.779985] RSP: 0000:ffffabe680bcfd78 EFLAGS: 00000202

Revert it for now and figure it out later.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sched=
uler/sched_main.c
index 4f2395d..e5a4ecd 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -829,7 +829,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sch=
ed)
        job =3D list_first_entry_or_null(&sched->pending_list,
                                       struct drm_sched_job, list);

-       if (job && dma_fence_is_signaled(job->s_fence->parent)) {
+       if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
                /* remove job from pending_list */
                list_del_init(&job->list);

@@ -841,7 +841,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sch=
ed)

                if (next) {
                        next->s_fence->scheduled.timestamp =3D
-                               job->s_fence->parent->timestamp;
+                               job->s_fence->finished.timestamp;
                        /* start TO timer for next job */
                        drm_sched_start_timeout(sched);
                }
--
2.7.4

________________________________
OPPO

=E6=9C=AC=E7=94=B5=E5=AD=90=E9=82=AE=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=
=BB=B6=E5=90=AB=E6=9C=89OPPO=E5=85=AC=E5=8F=B8=E7=9A=84=E4=BF=9D=E5=AF=86=
=E4=BF=A1=E6=81=AF=EF=BC=8C=E4=BB=85=E9=99=90=E4=BA=8E=E9=82=AE=E4=BB=B6=E6=
=8C=87=E6=98=8E=E7=9A=84=E6=94=B6=E4=BB=B6=E4=BA=BA=E4=BD=BF=E7=94=A8=EF=BC=
=88=E5=8C=85=E5=90=AB=E4=B8=AA=E4=BA=BA=E5=8F=8A=E7=BE=A4=E7=BB=84=EF=BC=89=
=E3=80=82=E7=A6=81=E6=AD=A2=E4=BB=BB=E4=BD=95=E4=BA=BA=E5=9C=A8=E6=9C=AA=E7=
=BB=8F=E6=8E=88=E6=9D=83=E7=9A=84=E6=83=85=E5=86=B5=E4=B8=8B=E4=BB=A5=E4=BB=
=BB=E4=BD=95=E5=BD=A2=E5=BC=8F=E4=BD=BF=E7=94=A8=E3=80=82=E5=A6=82=E6=9E=9C=
=E6=82=A8=E9=94=99=E6=94=B6=E4=BA=86=E6=9C=AC=E9=82=AE=E4=BB=B6=EF=BC=8C=E8=
=AF=B7=E7=AB=8B=E5=8D=B3=E4=BB=A5=E7=94=B5=E5=AD=90=E9=82=AE=E4=BB=B6=E9=80=
=9A=E7=9F=A5=E5=8F=91=E4=BB=B6=E4=BA=BA=E5=B9=B6=E5=88=A0=E9=99=A4=E6=9C=AC=
=E9=82=AE=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=BB=B6=E3=80=82

This e-mail and its attachments contain confidential information from OPPO,=
 which is intended only for the person or entity whose address is listed ab=
ove. Any use of the information contained herein in any way (including, but=
 not limited to, total or partial disclosure, reproduction, or disseminatio=
n) by persons other than the intended recipient(s) is prohibited. If you re=
ceive this e-mail in error, please notify the sender by phone or email imme=
diately and delete it!

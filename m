Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 872B87F9F8D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 13:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2ECC10E255;
	Mon, 27 Nov 2023 12:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250E610E255
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 12:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1701088160; x=1701692960; i=spasswolf@web.de;
 bh=syrs6tmIf2kfqrqm/BG1V4nSMMDynAQxfPKWNGqCRqQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
 References;
 b=dLt54fS+iBCTi6ydw1lFqSQtlZobVpx3StzWCbAXFELvIaObnH/RuzIo7fLaQsjo
 CnJnq4DB20I/wDWtW1p2bviszwa6DRJR0K48lNdclQ/tO+C/bOz1cWChjGfgujX9k
 PEDiGuKu/MbTvECVEz6STSeCZHArRi8wmhuag8A2dgWuG7U6TnEQh97FnpEV+9L6P
 sKotdOCtOoFZDa8C4831Q1VW4r2QLJz0B7DBriONZk6SxLBoR77AzOwbBcvfV3Lie
 GsbdjW+aijfjUzLf3q6TuVrv5r63hJbx7PUuGtff4WfjPAFV9A7DnMZW8E9tyeXdU
 OG5poVFgvqS59u/06A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from lisa.home ([84.119.92.193]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MP3CA-1qvZYf135Y-00POMr; Mon, 27
 Nov 2023 13:22:45 +0100
From: Bert Karwatzki <spasswolf@web.de>
To: Luben Tuikov <ltuikov89@gmail.com>
Subject: [PATCH] Revert "drm/sched: Qualify drm_sched_wakeup() by
 drm_sched_entity_is_ready()"
Date: Mon, 27 Nov 2023 13:21:40 +0100
Message-ID: <20231127122147.82970-1-spasswolf@web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: 6273fadf-267a-4965-82ab-89c5b3f28cf2@gmail.com
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p4ypJ/YU7w47v+HSuV6slrirmZWx1rcLt77+n6HP673wrqq5O2u
 vNvhWhTUwIgv3tdC3YgoNI+6iPYu97PcxcENeEHSnAtYB/H9pH860XAmHBIYiCgAQ1vT2rt
 GUYMnloufaBuUEYmfZczzjjEZ++LRG6fGkT93puUBORrk2hYPRcsg5VadNgMkEwSL4F019g
 7Py0bcjD6NhP55bzReHPw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oQF3q4j12dU=;IRoid9IQCl34SP8fO1mKX8I50+O
 6C+2Zv07EvIUtHHB1tJXMrTxkJ1u4/cEMUXxM50oqLklN5n/xon7/ufcRF+PxiFMbk7bMbUn1
 FPSdcdd1PU2mLC37+lLvOn1/u3MyB6R4sC4ounW90qTCZrK+bqNjmEWs3nMomS2GjZCY31txR
 AdxNIlTIbiFZ/7lOH2tOQPpBzCnyhu9ykVapiMUZoglSeelDKOWFHZUN5kTy8pLujoAs1YgwA
 tZGrSsNo09MqWnA45f/4WpqCLNOu8alSmGleNuJNWk5m2n5z60Lgffl6OtNOAqi31Fel5gpGw
 qb+Oe8BByGsYjtewv03i6Kiq6wku/G1qCgg2BWovlYFDIE0e73SVpzm+O4H5Ip6h4xZxVryRe
 r1+N7c0IUqVyrmaAwTxFtd43EKPreB4VpBOSp34yI/WKDXnYd7o4h+kCq2VlaSumgoOdVJxcP
 YshhzY8sJJdqG6j/zRYHZ1YkOhJ02FgnO2TneAM07mqIZi33VJRvxcvCsdDFaF6VD2gFbhACk
 bO91tSsQ5tdF1mM3CQLmaxI4TrysFRwjukusIaxKm6bbSYc6lBtqTutk/zJkATwvDZs7k9Aeu
 /8tTzjdqroE8cWDQHQxnf8DeMkGnzOh1P1Z0jG5FfOjLvW6ZhYqaN1jEZTPB9XUNA3YgMyGeV
 5pm3K/UNKfhLzHWElPvzUjIbVj6SMQlbd+91Fz+YBuNkLploCpZ2srJwasD/UvI6o5ZEPGUca
 DCiEsuv2eigu8UI4t5bhF/aB2B9kV8vVEH4mdbBjFZ1Yfwd/pKG38EFEMk/Joo9kLiU7qmMi0
 i6HpF1qOSYFs1eyLNCMuv8SHsLoS3sLReyJkCoP0Fb4Mc6Kz8EFrMJA4V0wmcZ40JJLRflHwV
 xWvnsvb1cWF5Xz3JYEWRLe4xw4YSl9PMld8MnWol7ipYgGM/HNObdD02zK7eDFJgd4VgOwW+4
 zyrSF+nxhesuGr1T2B8fU53SHXU=
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
Cc: robdclark@chromium.org, sarah.walker@imgtec.com, ltuikov@yahoo.com,
 ketil.johnsen@arm.com, lina@asahilina.net, mcanal@igalia.com,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, dakr@redhat.com,
 Bert Karwatzki <spasswolf@web.de>, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit f3123c25 (in combination with the use of work queues by the gpu
scheduler) leads to random lock ups of the GUI [1,2].

This is not a complete revert of commit f3123c25 as drm_sched_wakeup
still needs its entity argument to pass it to drm_sched_can_queue.

[1] https://gitlab.freedesktop.org/drm/amd/-/issues/2994
[2] https://lists.freedesktop.org/archives/dri-devel/2023-November/431606.=
html

This reverts commit f3123c2590005c5ff631653d31428e40cd10c618.
=2D--
 drivers/gpu/drm/scheduler/sched_main.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sche=
duler/sched_main.c
index 682aebe96db7..550492a7a031 100644
=2D-- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1029,9 +1029,8 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
 		      struct drm_sched_entity *entity)
 {
-	if (drm_sched_entity_is_ready(entity))
-		if (drm_sched_can_queue(sched, entity))
-			drm_sched_run_job_queue(sched);
+	if (drm_sched_can_queue(sched, entity))
+		drm_sched_run_job_queue(sched);
 }

 /**
=2D-
2.43.0


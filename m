Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 929EC7FA11F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B74D10E28F;
	Mon, 27 Nov 2023 13:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4097 seconds by postgrey-1.36 at gabe;
 Mon, 27 Nov 2023 13:32:04 UTC
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1979310E28F;
 Mon, 27 Nov 2023 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1701091870; x=1701696670; i=spasswolf@web.de;
 bh=syrs6tmIf2kfqrqm/BG1V4nSMMDynAQxfPKWNGqCRqQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
 References;
 b=VbbEPz6qB8LScHNgsFUYTvWMK8zXBmt9ZNEc8sPCGXsaHymckhrGvx+8pflgAj4X
 s0BS9XEF6Ja+QumC1x8DnsEzLNENDbRGLCWNDrjn5OglynL7xMUY87KQJly8+X3hF
 AeiVc87MCDNlzVOKQ7M7zOu6A4R7nJpUcnqdmzuwao0ZUU1IUB1BCX3KijHXx4hP1
 JuresZ4qdAub864nlhGlkLb0OR9Uu3H09E2dDBD20r0pjiVSEswZoaHW0tFlmVH8E
 1daif3lt6DAWvzolr8wxOn20iWYfICfjLG8Rnrtw3M8QzUQ6VmuSMNJA4IxLkUdui
 OQ3QlX6PFUFKih8r/g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from lisa.home ([84.119.92.193]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MIya8-1qsofk084o-00Kie5; Mon, 27
 Nov 2023 14:31:10 +0100
From: Bert Karwatzki <spasswolf@web.de>
To: ltuikov89@gmail.com
Subject: [PATCH] Revert "drm/sched: Qualify drm_sched_wakeup() by
 drm_sched_entity_is_ready()"
Date: Mon, 27 Nov 2023 14:30:15 +0100
Message-ID: <20231127133015.104165-1-spasswolf@web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6273fadf-267a-4965-82ab-89c5b3f28cf2@gmail.com>
References: <6273fadf-267a-4965-82ab-89c5b3f28cf2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iqwOLAR0sXIIU5Z95Yw4Y8P/O8WigScThehuTd/d0a1ssj3c/5X
 8A5HNALzgOZJbvODlPwVlJ/fR6HLl6mtYdGWe0jaO2AoFpNODuI5IFnHyr+nKN40IpxMoFM
 /h9OIOmjfgKD/NEG/i6HA7hv6ftZ8Fiz/KT4l0TTzZEGYsPEerdeJ8r/rJDujfE8LsIKfyK
 w1ONKVDWB3WODZim71HFQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Iy4Yww7LE1I=;5t4aB1HRo86/CAt87RiL1My61Hr
 2mqDW8TLF6hqssyT7kErrxRn17Q/ou4LSZEgDMUyead4px88a6diStVwN8mW4oV+V2IFlXZd5
 YHkQWplgZ8cFH/mJA52/sLzVOKVE4EBt/9wkUMaxggPN4D8axOaJVGAhH4JcKsg0RlUGRSUhK
 Yy/HOTzXstWOKc+LTInzy5u8Fd/C1EwqoxCj9mE0LLxdo+LBALgEYXxpZBMVexFwSoRU5BwIR
 ndXkeyd8ETcDVxawVjrhSR3tPC65ZqFNTxFW8pl2psLEwhIC8ubSS54HnGI1ojFwcQONpXWGg
 UlsUo7sScSZOXCE6jBUH5d2P5o0WjUROcjjeCDgB1EinXoxfF2mgc4PditBSyI4eIpn8Dev6V
 5mU4QXOHy1yUozF4wixybf2J4PXB5JEJFgEisSQCXgr6uZf6yJReXBs2XoAM7SeYP3VyS8Wz5
 Ap83WLjXs84JNgvxKjbcgWNWVRVDrcDQHwJsC23tsWpezmTdeEMXFW8pB/bnKc/fD9wgfPO98
 CboErWoXq9dpCQgd6x1j6b4fLkPIqjmoDlUVdT5vn/iE8XansIfZ5N7GtqGkY6/F/8oi0+FRf
 IfL46y4p3eDToGI1sfNcH2T4QTSSJ6c43NqoSMVVGBw63zJ2T4VuTV/nOO/VM0FrzncC3wV4e
 PZ3VUaGzF8rmUPp0HuegMmRrQoYYOO//pZVyCbQ2w4tcxOq7UzzRY+WISlQFnM/O8qUzW6J8P
 FJSl0vf5WJOcAjRN4/lLeqM9FT7q5ZBt3TqpOb5XreTnD0RG4C5Qu8MgogY1Q6Av8PIM/PWZ3
 vxp7cKEg3jGBqyws0FOTTUBp96YfXIahGgTPd7UdNhbyMiVcBsTkOxxqdxz6VyQYY90mzHtKA
 EEbmhLFlaHfIRn2isAg7HigmG57d+cyB8wdrqsx6qRUNWYzyYWPswMe130zsu/sKnFAKFkHN3
 ji2NeQ==
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
Cc: matthew.brost@intel.com, robdclark@chromium.org, sarah.walker@imgtec.com,
 tvrtko.ursulin@linux.intel.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com, Bert Karwatzki <spasswolf@web.de>
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


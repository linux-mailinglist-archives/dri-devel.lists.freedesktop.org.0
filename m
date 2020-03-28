Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B32196648
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 14:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E146EAE0;
	Sat, 28 Mar 2020 13:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94186EAE0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 13:20:41 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 19so13026169ljj.7
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 06:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xRjOOFVmay0tl/khgo7ApP7t7yp4YJlpdaMheaiS9iE=;
 b=pTz9g+HABN1ahbFF4pP438F9oXDLBOviC5iZ6mXVlkN2NwwcX6DpnpfTZjfbOJOpQ8
 ECMx6zY3ZUvqVLrVTM9leNXtbYaGCnI8n3gZGC+p8/DZwqlUKpJyyA2ZJ+Rwbqpf5fRF
 yOTSux1I/eiyVRalny1XzVWBcVLmW8ejeQBwafg+SN1G4YNkxZzNc/4g22hlQ5VyElmA
 gvdZcUNc7sK8FMkWbNJGEaXtW+K5gR1ypOlBBiKUhWIFNogu+M1SYsX3nVxGK3J8iVVk
 0ITiPEUnbpfGuxTK1TicFiTZqWtXq/OdmtxjXHQwuRhXSnHhiAGwE4QOUWKw00CFhttg
 QTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xRjOOFVmay0tl/khgo7ApP7t7yp4YJlpdaMheaiS9iE=;
 b=AB8/5Bpl6jNV5OuPR4xhxOq9ISLtbx7Ou/COHSSeby+gMhvP+vuM1E7r1Lxjecfcg1
 d33JfxDvnelVEsteJUhPKpQ094B8bOi4zA2qCvzdp+weolsL9AfsgVXjNjPXiN+9gPj/
 s1W0nzWjJFXorkSbXvspqxOEopNK6SrwilTVWvmPVSjBfTztp1jmfjsPRzuVw1ZfWYRe
 28mq+0JLLUey2QhKXbgu/Az9B/ol7u/uS66gpLbXA/GBiR9jodLinq8emqkrPgmQ0bmS
 gFCBoZ0kVrXKPdrBGEoFIh5d1xEj4lLJiqtJOnuCSKAarI6pra2bcBorOVTLDkA+Hh/t
 Y7Lg==
X-Gm-Message-State: AGi0PuZftUJxvAS9kceUoTRKW6Se6l10LL+PZEqfwasWq11NaAFp4W1N
 OvIueEj0B8Q3nGeaweh1S33aape9+mI=
X-Google-Smtp-Source: APiQypJmVcivZFdeNDK6R6KBtRxp7CH0cxVriKZZ+AP3cCRlaYUK03Y1f3eiEorMTzo2jFFLj148yw==
X-Received: by 2002:a2e:b446:: with SMTP id o6mr2291687ljm.80.1585401640014;
 Sat, 28 Mar 2020 06:20:40 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 j19sm4542916lfg.49.2020.03.28.06.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 06:20:39 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH v1 3/6] drm/sched: fix kernel-doc in gpu_scheduler.h
Date: Sat, 28 Mar 2020 14:20:22 +0100
Message-Id: <20200328132025.19910-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200328132025.19910-1-sam@ravnborg.org>
References: <20200328132025.19910-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Nirmoy Das <nirmoy.das@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 David Francis <David.Francis@amd.com>,
 James Qian Wang <james.qian.wang@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix following warning:
gpu_scheduler.h:103: warning: Function parameter or member 'priority' not described in 'drm_sched_entity'

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Nirmoy Das <nirmoy.das@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/drm/gpu_scheduler.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 26b04ff62676..a21b3b92135a 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -56,6 +56,7 @@ enum drm_sched_priority {
  *              Jobs from this entity can be scheduled on any scheduler
  *              on this list.
  * @num_sched_list: number of drm_gpu_schedulers in the sched_list.
+ * @priority: priority of the entity
  * @rq_lock: lock to modify the runqueue to which this entity belongs.
  * @job_queue: the list of jobs of this entity.
  * @fence_seq: a linearly increasing seqno incremented with each
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

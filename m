Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C1B894675
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 23:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA7D10F56B;
	Mon,  1 Apr 2024 21:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UqQb71my";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586F610F568;
 Mon,  1 Apr 2024 21:20:34 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-56be32b9775so5787554a12.1; 
 Mon, 01 Apr 2024 14:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712006432; x=1712611232; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rtOIDYuOCQzCWWiPyJve7IUdlBxqpyYfYMB6nDSQUYE=;
 b=UqQb71myqusTbL5GJiejCNDngP8s0UsTUP8NfR8pDhclZ5z/IumtJK+uI+2o/YxG+/
 EstbnNJh+cp95LT/18oGbMhbLnh12zj1pJm+RI6KAkOmCkWehXMcp9wGbbcJevJSFqPD
 l/v/z0wLeMxv7MaobbGn6ubErp+i/80K1k597SGYYpVtWl3HRXVV0pzn8ZTitWnTLA7V
 uRa6g0rrTz2YlmZ/JahNrLyCQztkCRrwumcDrNZDzZbHlfmUE3yMvDnbRihjre0dh2Dp
 5vNlq6cvTMuhOpZWIg250lJkn43pv4OUSAzF9oseLpjdc81KuI+lesuHd9ueNBmHJCbT
 d5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712006432; x=1712611232;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rtOIDYuOCQzCWWiPyJve7IUdlBxqpyYfYMB6nDSQUYE=;
 b=IVZHMBHhs34R6as0dz37LGdxuKwE6VZ8OliP8DDS2HlMR33UPpa2u2nNDnatsl5OIN
 Z3kVY5d1o0VImHpXU8O6KqT8/np9ctev6BeThTEyH6SNB7TH6d6CDP515poY6SEPSoTj
 ea6VMnNSPORQMyRqdgXhqAqad3hNYY2Df4m7/U2f1Z3VF/wP2N4AGbTAtPMD0ULlktex
 GfA2Bu/4vd9YZQalHOLJlLNHzbV4239UrHTvbHCZqBzDNOAYN9z+yufcL7l+HstKgEaX
 AXDIqg0PPlFpggAYo+XkINsJQf7gTeQvpLVmffmK99Wll3323UDtyCWlktZsz8tdheXb
 jMPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXofBthVR4OIObw1n58MBaWaTiZ3jusPeUgSLHvhB0imx2FFdUzCzlK0uhOUmKpfbCK3/QqNhYs6JsfiFIBaBK/GYyugVpWyUw+mnEgMN7MHgYw65Mmiv3P0it56LLl455Rem84oYyIbo/tSA==
X-Gm-Message-State: AOJu0YyBKVsyv685Vy3dZEpw2bVWGOa50LasMvplNZExBBUM4yGQ+hjV
 VLuZt8ylnvD3wkO54R8OHdB0jVtQJv9bMSlSq1HBOLmkOb0QxCmR
X-Google-Smtp-Source: AGHT+IF/1TkflsuVeUnLYItXsThhHP1RqlVmXnxmKiYJwjqy0QVVdJ/iTih7AO+b1juMz/6FKNa80w==
X-Received: by 2002:a17:906:4553:b0:a4e:6f5b:17c2 with SMTP id
 s19-20020a170906455300b00a4e6f5b17c2mr1937387ejq.32.1712006432519; 
 Mon, 01 Apr 2024 14:20:32 -0700 (PDT)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 n12-20020a1709061d0c00b00a4da28f42f1sm5737881ejh.177.2024.04.01.14.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 14:20:31 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, christian.koenig@amd.com, megi@xff.cz,
 linux-kernel@vger.kernel.org, Erico Nunes <nunes.erico@gmail.com>
Subject: [PATCH 0/2] drm/lima: fix devfreq refcount imbalance for job timeouts
Date: Mon,  1 Apr 2024 23:20:00 +0200
Message-ID: <20240401212002.1191549-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a followup to https://patchwork.freedesktop.org/series/128856/

Patch 1 rev1 from that series
https://patchwork.freedesktop.org/patch/574745/?series=128856&rev=1
was dropped because it needed a better solution for a race condition
between the irq and the timeout handler.
The proposed solution in that discussion is to solve the race condition
by masking the irqs during the timeout handler execution, which is what
is done here.
This bug is very hard to reproduce with regular applications, but I
found it to be reliable to reproduce with a program that triggers many
jobs right in the boundary between timeouting, so that jobs still manage
to complete while the timeout handler runs.

With this series, I was unable to further reproduce the bug.

At first I had only the pp and gp irqs masked and the problem never
reproduced again on Mali-400, but I still managed to reproduce it on
Mali-450 after hours of test time. After masking the pp bcast irq as
well I was not able to reproduce it anymore even on Mali-450, so I think
that was the missing bit for it.

Erico Nunes (2):
  drm/lima: add mask irq callback to gp and pp
  drm/lima: mask irqs in timeout path before hard reset

 drivers/gpu/drm/lima/lima_bcast.c | 12 ++++++++++++
 drivers/gpu/drm/lima/lima_bcast.h |  3 +++
 drivers/gpu/drm/lima/lima_gp.c    |  8 ++++++++
 drivers/gpu/drm/lima/lima_pp.c    | 18 ++++++++++++++++++
 drivers/gpu/drm/lima/lima_sched.c |  9 +++++++++
 drivers/gpu/drm/lima/lima_sched.h |  1 +
 6 files changed, 51 insertions(+)

-- 
2.44.0


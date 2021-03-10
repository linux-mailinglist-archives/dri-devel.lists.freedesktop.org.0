Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107EB334328
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 17:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2676EA4F;
	Wed, 10 Mar 2021 16:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595646EA4F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 16:37:06 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id e2so26370409ljo.7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 08:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qtec.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IkmW2GvjqGWts2vPAfis7GUqTOxPlIzb1CZYJYGpMME=;
 b=GODj3reE+EBC+KyzxwypFssgDByJDM+onjtNQHeM27vWvLdCqxABZeo4InGHNq29CH
 s4xAf/jsadcR28qkpE9OKvbOoEN06BXkj5tT/O5gJj88sibReqzJMxkjJIR0bbmC8/ur
 P7sCIgK4eKNLw81XGdRKs6WZ0jD38AdhrxSeWq1p9mE8AO/AKD+aatuDOOpLX4/MW9m6
 g1NYzb2lF3pr0SmKbpDQofzv+ZdyCOFJWR6TboyexTyCaHFS9z/GHq2Uz+YEgVVfpklD
 lZiKygPz4Klu1svIlHFgfq0VD/IAgQupazGb1mtXY0nfNxCs6KH8xfkM5FkdvWL3SuBQ
 k1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IkmW2GvjqGWts2vPAfis7GUqTOxPlIzb1CZYJYGpMME=;
 b=A/nvNkHxXuQe0JVzuoXpImk7tp0HKoG92cdU5hnds9pAzZVYd4IMH1nWTQsBkiNPxx
 K3N9NBcYv89flcgF+GY0MX0/8LYIKdTOHxiEbCBWZ3PoYK9Z0O0Pm2C10DzCe1XldqiY
 ZUz1qFpab6OOrFedL9vCKug5luWpZ7sjqcTEq4lMSd9cmObvyaeEwVVjg9PBcb3iQSqa
 DKyUesIb9sNiR2OQ/o1WlPeByRL6EZHmFFxagtyKH+VLmOcVj2Us/HLjF3MwnAcvd6Pn
 n9X9RQKsWhvfMmBDXaOD6PA6GI35y+ePkwBk4QyYsUWGEtbwL1F8VgtuS/BjgSsWK7pS
 +uag==
X-Gm-Message-State: AOAM533TgTxucvnqPco4frDKjXtUbCPI2zdywlmZa/P+of/Qz8i/sIIT
 oi/LDDqoWxHeIFEj+vYCwb6j1Q==
X-Google-Smtp-Source: ABdhPJy/e5j6tJye7L9eF/hLH4FCYLVMSzfrfMtWZuFThVQR3RMJkkYsQZ7O3gNjRWcN3Ff6vXuUTg==
X-Received: by 2002:a2e:9d8f:: with SMTP id c15mr2289953ljj.494.1615394224788; 
 Wed, 10 Mar 2021 08:37:04 -0800 (PST)
Received: from localhost (80-167-86-46-cable.dk.customer.tdc.net.
 [80.167.86.46])
 by smtp.gmail.com with ESMTPSA id q17sm1846587lfm.168.2021.03.10.08.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 08:37:04 -0800 (PST)
From: Daniel Gomez <daniel@qtec.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Huang Rui <ray.huang@amd.com>,
 Nirmoy Das <nirmoy.das@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Monk Liu <Monk.Liu@amd.com>, Yintian Tao <yttao@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, Evan Quan <evan.quan@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH]] drm/amdgpu/gfx9: add gfxoff quirk
Date: Wed, 10 Mar 2021 17:36:52 +0100
Message-Id: <20210310163655.2591893-1-daniel@qtec.com>
X-Mailer: git-send-email 2.30.1
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
Cc: Daniel Gomez <daniel@qtec.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Disabling GFXOFF via the quirk list fixes a hardware lockup in
Ryzen V1605B, RAVEN 0x1002:0x15DD rev 0x83.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---

This patch is a continuation of the work here:
https://lkml.org/lkml/2021/2/3/122 where a hardware lockup was discussed and
a dma_fence deadlock was provoke as a side effect. To reproduce the issue
please refer to the above link.

The hardware lockup was introduced in 5.6-rc1 for our particular revision as it
wasn't part of the new blacklist. Before that, in kernel v5.5, this hardware was
working fine without any hardware lock because the GFXOFF was actually disabled
by the if condition for the CHIP_RAVEN case. So this patch, adds the 'Radeon
Vega Mobile Series [1002:15dd] (rev 83)' to the blacklist to disable the GFXOFF.

But besides the fix, I'd like to ask from where this revision comes from. Is it
an ASIC revision or is it hardcoded in the VBIOS from our vendor? From what I
can see, it comes from the ASIC and I wonder if somehow we can get an APU in the
future, 'not blacklisted', with the same problem. Then, should this table only
filter for the vendor and device and not the revision? Do you know if there are
any revisions for the 1002:15dd validated, tested and functional?

Logs:
[   27.708348] [drm] initializing kernel modesetting (RAVEN
0x1002:0x15DD 0x1002:0x15DD 0x83).
[   27.789156] amdgpu: ATOM BIOS: 113-RAVEN-115

Thanks in advance,
Daniel

 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 65db88bb6cbc..319d4b99aec8 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -1243,6 +1243,8 @@ static const struct amdgpu_gfxoff_quirk amdgpu_gfxoff_quirk_list[] = {
 	{ 0x1002, 0x15dd, 0x103c, 0x83e7, 0xd3 },
 	/* GFXOFF is unstable on C6 parts with a VBIOS 113-RAVEN-114 */
 	{ 0x1002, 0x15dd, 0x1002, 0x15dd, 0xc6 },
+	/* GFXOFF provokes a hw lockup on 83 parts with a VBIOS 113-RAVEN-115 */
+	{ 0x1002, 0x15dd, 0x1002, 0x15dd, 0x83 },
 	{ 0, 0, 0, 0, 0 },
 };

--
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

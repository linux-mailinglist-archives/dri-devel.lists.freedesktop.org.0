Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1448C7D3FE1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 21:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492DC10E22E;
	Mon, 23 Oct 2023 19:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D6610E22E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 19:11:15 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507d1cc0538so5369366e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 12:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698088274; x=1698693074; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0yaMn2Inorx6J5jbXWZ4lv04z9p9knuEMsnSJqco5r8=;
 b=NPneOFCBB15UbDchUilMnAljmRyCMOy4oaoWGN+rUdktSCE4qGOoI0h1dLcgVVynwb
 x0D8O57A9c5VbYsLvZZ5Jx95YzsMS//Wh8mqmNB2UO8SiHaowa4O8BGRGN5cdyyYwAxW
 FobR+7uY1YSMGZBTbEOQjvx8XxmVYFUngC5EeEnKsdN719k1n52LWubzkTkguh3U/lFH
 LK30K/NJAnz2R9qvLASMBX8ISdz2nNe9Rh8504K8m2W8ZuKsSGmKaPKbLwJt1AnPYfLX
 lewSqiOoqNffzjTT8cIU+v5W4cfEwbnDgLKRykzgJ2y5Nff50Cf9RTA7S+fBze9JWv0E
 G5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698088274; x=1698693074;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0yaMn2Inorx6J5jbXWZ4lv04z9p9knuEMsnSJqco5r8=;
 b=V4I1YjG5IaeeJGHbTqtXBTQe7A5VtYPrbEiz6Hs7lgbBLtOMTKrIy4s/sULBbi7Uzh
 H7but2W+EQxLfuz0sWLQaElDWoSZhwJZZPIMEJWc0pyvzzQVzjm5hsHTpDPna/cCLkrQ
 CICxn7C/Go6zr0rd+F6kmgp3NXNiQ75+roGPLDTkCAZyn8IFgMQ7GOQD9ymTnBi264yW
 gKbNo62otooYJJ0SgOK+8o1EGPeiGxC5jC0IfRW4Ma+VIFnxY5VQoakJlpeYhdYCJQzP
 CKKkk+aeiDyKvH6ZW73e0VAeiWTjHoYu/0y4/LoeoMfD03pZJvv9TqApagwF8jm05xBT
 hRxg==
X-Gm-Message-State: AOJu0YzrXwCeIgU03oK0aeRCLRXoMSf1glqOa7fXA+dFsc5k/68r7RHK
 BUJtOdZMW/Y8jY///w4wv04=
X-Google-Smtp-Source: AGHT+IH/VRae6vvptiMFKgnC3z1o87r9hlnXcuSZlWMHjOAtD9ZiXBE1YB6xzvTDdLl2gJnHOnKvBA==
X-Received: by 2002:a19:5014:0:b0:507:a40e:d8c6 with SMTP id
 e20-20020a195014000000b00507a40ed8c6mr6757867lfb.11.1698088273600; 
 Mon, 23 Oct 2023 12:11:13 -0700 (PDT)
Received: from Slimbook.. (181-251-201-31.ftth.glasoperator.nl.
 [31.201.251.181]) by smtp.gmail.com with ESMTPSA id
 vg18-20020a170907d31200b009adc77fe164sm7062459ejc.66.2023.10.23.12.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 12:11:13 -0700 (PDT)
From: Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH RESEND 0/2] drm: panel-orientation-quirks: Add quirks for AYN
 loki zero/max
Date: Mon, 23 Oct 2023 21:10:57 +0200
Message-ID: <20231023191059.19915-1-boukehaarsma23@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mripard@kernel.org, boukehaarsma23@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add orientation quirks for AYN loki devices:
- Ayn Loki Zero
- Ayn Loki Max

The quirks have been tested by the JELOS team and ChimeraOS
who have been patching their own kernel. This has been
confirmed working by users in the ChimeraOS discord
servers.

Since there are additional Ayn Loki devices I have
made separate matches for the devices.

Bouke Sybren Haarsma (2):
  drm: panel-orientation-quirks: Add quirk for Ayn Loki Zero
  drm: panel-orientation-quirks: Add quirk for Ayn Loki Max

 drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.41.0


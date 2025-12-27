Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E878CDFEF9
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 17:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EC610E06A;
	Sat, 27 Dec 2025 16:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eFTfMCi1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D7710E06A
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 16:08:45 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-34c3cb504efso9174945a91.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 08:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766851725; x=1767456525; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gJqmdOIxEw8eLWLXbkfWEh7lb6XZW8BGJO73kS58WvE=;
 b=eFTfMCi1xwuh4EEv4wPJrQRI30ql+D2XL55lP5xcghG0f2y3G26vk5ON5dJAvo/eSx
 6h7O8WdTrmXj+GGKuCWybvQPyNE+tWLR1oNnhVBMZ6SOlAGRNtp6Uaw+kYYM3No0TQoY
 R5pstOb1+GBAsDGSEFjAHI4dsL7mkdnAv2aykqv5F2dlVhPuegyzlsX4ETOBXoqqNB5C
 QfO/YZ1dblHDVlgx4s7oGH3ooQw28crUGyMVoCVscnmJY85tugYZeeRP13x47hg2OZrA
 IKhWGlBuA+un/IBLet05039l8xj9UHePtUZEK4LGC1ocAe1iKKZWq9o3g14wViQOiJLg
 zUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766851725; x=1767456525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJqmdOIxEw8eLWLXbkfWEh7lb6XZW8BGJO73kS58WvE=;
 b=n1pIPHy4w+We1LK5vYtONxJows5Z9EniY0s9Uezswkl/XCGIMOo7AuVG9HtTt7VT/F
 +S+K2aG4knh9rQsgV2aVpmxk9WRhjvXUzdMJUSOu16qr2EaK9iEBNlKabaeStrSh0/zZ
 Nfq7Vc3B247On0vLOKhcIeRAJBdUYiJE+FQjOq3//1ryEBtWLhdwoSUopGSiws5thrn7
 JvMSi1yf5wAmM8FgoU1jywhDuu+D/XcFAMJHwhOf7Z5At2+072tj1TMpG5srqnEGem4Z
 AbnzI+7bo48Y6oH3zyhZhAQbdoAZcnPprm8rVd/visd0qNjCeBIsuww8eUGkavkNmdFR
 xmag==
X-Gm-Message-State: AOJu0YxOqbCndZH2dEPKz8dn7Nw+maEzMyC8hteaMdkNZ797xdXTbuyo
 Gh/NiDmWtdY9OuosMN2zthX06fH+mGogsItgfEuwnuBIytzzeat14yby
X-Gm-Gg: AY/fxX4lSBoF0rBiPvUdjdmTFVfgVmF7sqZzokYq2+XoKrd5fW+En20XkonO6khmeE6
 srb+0gdCjmOCwTktXwvo0OnyKy8H1ix5ZUB6weDZMlndg9rYE/cQtHBrCOTu/CCpeakekJw/BSb
 9AoFPZeQw7eZCXaSYzlRMk4j89w+T8o/p+ZXEP0UJTlF1nmhvfK1KhTvAf5zKF8keDUeOhEBaiD
 2RL6cEIRiFt6TGN8hujw7so+CYzbc/TWVmfnbIDiX4p+yI5YY0IlaLV5qcapJofdV+y9U5c5OpE
 EdE/W9c242JIat1Wj410vupg3NgEAaKvtbsdZ++jI+hzAicC86nVfKSS7E4LkADMrdJk3CpcGzt
 R5/c1VV7RWHNTSE8OlQmEUMtpnPBkKieY72nY/T4NQ3lOLwfSjh6i4Xrv83/O+An0AZSaZLT0DS
 MYef63JpZz1SUD
X-Google-Smtp-Source: AGHT+IFSq0kvohcV1rSU3YFNWEHGimkeUw3tU4cRh3lkrEojvKfCjUlUvSaSo4Jkg038wpSaJqVBOg==
X-Received: by 2002:a17:90b:52:b0:34c:94f0:fc09 with SMTP id
 98e67ed59e1d1-34e92139d60mr21827709a91.10.1766851724760; 
 Sat, 27 Dec 2025 08:08:44 -0800 (PST)
Received: from archlinux ([36.255.84.56]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e769d0106sm10822458a91.0.2025.12.27.08.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 08:08:44 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Madhur Kumar <madhurkumar004@gmail.com>,
 syzbot+95416f957d84e858b377@syzkaller.appspotmail.com
Subject: [PATCH] drm/syncobj: Validate count_handles to prevent large
 allocations in array_find()
Date: Sat, 27 Dec 2025 21:38:30 +0530
Message-ID: <20251227160830.34291-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.52.0
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

The DRM_IOCTL_SYNCOBJ_WAIT ioctl reads `count_handles` from userspace and
uses it directly when allocating memory in array_find(). and
kmalloc_array() allows userspace to request very large allocations,
which syzkaller was able to trigger.

Such unbounded values can lead to excessive memory requests, allocation
failures, warnings, or resource exhaustion paths. Add explicit bounds
validation to prevent excessively large allocations coming from
userspace-provided values.

Reported-by: syzbot+95416f957d84e858b377@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
Fixes: 3e6fb72d6cef6 ("drm/syncobj: Add a syncobj_array_find helper")
Tested-by: syzbot+95416f957d84e858b377@syzkaller.appspotmail.com
Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index e1b0fa4000cd..f322b38ec251 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1293,6 +1293,13 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
 	uint32_t i, *handles;
 	struct drm_syncobj **syncobjs;
 	int ret;
+	size_t size;
+
+	if (check_mul_overflow(count_handles, sizeof(*handles), &size))
+		return -EOVERFLOW;
+
+	if (size > KMALLOC_MAX_SIZE)
+		return -ERANGE;
 
 	handles = kmalloc_array(count_handles, sizeof(*handles), GFP_KERNEL);
 	if (handles == NULL)
-- 
2.52.0


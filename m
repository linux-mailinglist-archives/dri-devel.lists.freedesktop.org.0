Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF8B296A39
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 09:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CAF6E4A6;
	Fri, 23 Oct 2020 07:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1056F52A;
 Thu, 22 Oct 2020 13:37:56 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id b23so956927pgb.3;
 Thu, 22 Oct 2020 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=IuqDlc/9sVmn6w8y6S9W6kIXAO5b3CW/ksiq6MJe4cw=;
 b=IN5ulN/lhVpkv0cSxQVYeQmL8e6XC9Ui0ongH71NZy+wDEtGl/7jnitdi0qhAAyIZY
 fC7g6ckIDcNipQDDU/l95Zz5SIw5WgFDHGPbZsnqwhcPDWDUeYQ+K0+pZ4exBAq4gbcw
 rqJ6yYA5w6lq9ZOLdFbpsKUwr7R6EDI8UsYT73x2NUL9/nh4In959E24DYHQiR4z5JBY
 3PhmcpvnBuuDiLX7PaDg4d9j17853UB9O1sXkM4XGUKK+pIkSbJwNUlF7Kq7ZfYzjjTA
 UDpUqi4GQ2QwwzVjXoCBSJUnNgaE17+WjxzlHjS3QXF8s9sEEYtv9MqLfP/Xm8h49QZ4
 R9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=IuqDlc/9sVmn6w8y6S9W6kIXAO5b3CW/ksiq6MJe4cw=;
 b=olszCwgk7FFGv16fOk+1/VyDQ1dz9N60K9NOv9LGjGlyG59yD5Dp8NSivYvimik72A
 OGxnqmJxlAZ9ewArC62QFU5nz4VP6dooe0ACLKYA6QSDA08fB2ITeLHwweDo4bx/VLMD
 AFw2M6up8sVq17OYxDE2WdAKJzMf080vCmYP95wziPmavZojzHqJiO2O+M82bZKwAbo4
 pXsUdxaqkMAEeNgWbr59ZPz0eGi/OggBrQyVlo5zZ/xgiB0GoMhV2tJ4hbxLqipehGKU
 eTmentiLIk42B8VsU9p7MQ46w4ct+sVJVxiuBNyh+AgwkOrh8+tRV73iupY0WdF8sbwY
 e/vg==
X-Gm-Message-State: AOAM530GuTNn/ukxsBGLIbcZJNln3gGxCvKBkkjNX3Rr8MY+e7WxqcdF
 lbg1s+hucfFhi1bp4qul1qVMbXZ5O0Vv9Q==
X-Google-Smtp-Source: ABdhPJxzYwjbdLDADhpa8w757osNj5Hty2iFA+tEbvr3E1nQBdPpkX6BpAdeBon6QKBNbFuEjHUUvw==
X-Received: by 2002:aa7:9e9d:0:b029:152:5ebd:42a with SMTP id
 p29-20020aa79e9d0000b02901525ebd042amr2500221pfq.4.1603373875970; 
 Thu, 22 Oct 2020 06:37:55 -0700 (PDT)
Received: from adolin ([49.207.204.75])
 by smtp.gmail.com with ESMTPSA id a22sm2538214pfk.29.2020.10.22.06.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 06:37:55 -0700 (PDT)
Date: Thu, 22 Oct 2020 19:07:50 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [Outreachy kernel][PATCH 0/5] drm/amdgpu: Replace snprintf() with
 sysfs_emit
Message-ID: <cover.1603371258.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 23 Oct 2020 07:22:29 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, melissa.srw@gmail.com,
 outreachy-kernel@googlegroups.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using snprintf() for show() methods holds the risk of buffer overrun
as snprintf() does not know the PAGE_SIZE maximum of the temporary
buffer used to output sysfs content.

This patchset is a series of Coccinelle cleanups across the staging
directory to convert snprintf with scnprintf in the relevant files.

Sumera Priyadarsini (5):
  gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
  gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
  gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
  gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
  gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()

 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   | 8 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c      | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c      | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

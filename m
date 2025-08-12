Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D4FB246D3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 12:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984E310E6DE;
	Wed, 13 Aug 2025 10:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lSK7LeJ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80D310E335
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 11:08:16 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6156463fae9so10035270a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 04:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754996895; x=1755601695; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LTgEWAbzj7JPyTIv1pPqi1BWuVKR7rG/7+oZh/5JWL0=;
 b=lSK7LeJ8ZNVeM87SdLaZ/Fn1uAaMELRUjoLOn7GULC9Tbt/qFvL3jE1gPwthST8tjF
 U/6YVuo5szMC13szwTxkU4gNB5xUIhTJqBrIF+plpYECoUE+OeUoBNmZiys9AzwBhd33
 HhkfitOrJLYpwIoRB7IT8ew++dOkM0nsDo26pVflRT1pSR6pUiIvMXCUJw6y0HVmFIMn
 a+EAaTSCFyZ02TGfjbuoWcRFoPKLkYi0sht70NX8gctZ0Qsb17obhJat+mM0/FjR4ncV
 w38BQ/3LZRimeUnYIM4iJc6dzckLPjHa/aFd5Wgj7x4fC9KDnsn4UVIqZW/jqyKehDj3
 +qSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754996895; x=1755601695;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LTgEWAbzj7JPyTIv1pPqi1BWuVKR7rG/7+oZh/5JWL0=;
 b=cnszbfXGji/fDZB1JvAmZmPKpSu/AJcyk9tzFrh45xL+gJDnE3S/tKYRoa4E8UYyBV
 E8YM6K+h+UhkQIw7vIlC8WPfzp7Wg16naVGvgyjtbRC+84t1+iFYlnI8q12O5HfpvDwm
 QsbT1MPEUIqzSmFvXJsUJOgrOFdrwua3Cl90/DcEf2LSxsV5rI1ymwCaYU1uy+c9Yz7M
 yE3Ma3kstZq5cyC/+rHEXvRnZUay3ziqfplnPILt2lyq8yAxCcnu8jKxP6PqMNCf/zl8
 ajUj5eFe6i8gdJdDC4PxRDGjPLDp3w3QS/W5aE5ZqiaqJDQ8nRpj3rSe1q/YfnHWFitC
 fseQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfrM/JGWwSi58rcLmtW3V6D9NJPF/a3vq07ypEeNZo0sLhC7cK0R7TvyhQ1twZG4SIMst5TOG5Cy0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkJG0GHI68mkuP4MDJ7rZcI3uXBko5ACpT+V4erTDhyToC4R8g
 u/ugKIjAfr7UQuJ0je8YncTnQjoi/CPbBXusALOti4MqOCnhbttviLZS4ORaeho8XM/f7ROIULt
 lzWr/l/R9HzO8rwLV2v1qfsv8AEQeSlM=
X-Gm-Gg: ASbGncs+jjHYauqR7YRcJAp4Jje6GRCDgqKEnkvqsgaWCQbF3IF2FOig8ZfiL+IFjUb
 hrDHVpVZKfqFyIp1IH8ROW1rm1TsY3A5tuoRFrV02jdXe3rhAboFpmaIdYFFLDbfaDGAE8Qzv7j
 +x3k0li91BZRatXC/LiWVlLwBhVtAfmIR+XUf6c8YvAxoEDNTMa3A2YBxZy2LLulZLkzeNawzsA
 Xv9JZsw9kM5XbTdRQ71mscSqXBtsYNOhiIEVvjpyA==
X-Google-Smtp-Source: AGHT+IHNU7Nayd8cKcsevhjDcXSTfzZwnW3FVMp0z8Z3tLfRUrfW102ZgXl3R4dCLfl2OZbwoLSXaqpW5vrLbTFcFIk=
X-Received: by 2002:a17:907:968e:b0:af9:c53a:f997 with SMTP id
 a640c23a62f3a-afa1d935ad1mr265621566b.26.1754996895079; Tue, 12 Aug 2025
 04:08:15 -0700 (PDT)
MIME-Version: 1.0
From: Sidharth Seela <sidharthseela@gmail.com>
Date: Tue, 12 Aug 2025 16:38:03 +0530
X-Gm-Features: Ac12FXz7Sd7HPIKyCydbx6sni0vczgqm6DqsSe08xKHJBxuQ6xvoeGi4CRXKRpQ
Message-ID: <CAJE-K+BcU2vQPXyK9bdWTkRD_jreEcmD6zmnKrwut_7mCNv7bw@mail.gmail.com>
Subject: PATCH[1/1] DRM_GPUVM.C : htmldoc error due to multi-line code inside
 comment
To: "dakr@redhat.com" <dakr@redhat.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 13 Aug 2025 10:15:00 +0000
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

Dear Maintainers,
This is my first patch, please bear with me.
I request you to suggest if it can be better.
Your time is appreciated.
---------------------------------------------------------------------------
commit 4ed9c00376c616cdbfb978b5fd76911cccd63b26
Author:     Sidharth Seela <sid@y740.local>
AuthorDate: Tue Aug 12 15:56:03 2025 +0530
Commit:     Sidharth Seela <sid@y740.local>
CommitDate: Tue Aug 12 15:56:03 2025 +0530

    cleaned up errors stemming for multiline text
---
 drivers/gpu/drm/drm_gpuvm.c | 50 ++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bbc7fecb6f4a..cf49dbfcec91 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2432,31 +2432,31 @@ static const struct drm_gpuvm_ops lock_ops = {
  *
  * The expected usage is:
  *
- *    vm_bind {
- *        struct drm_exec exec;
- *
- *        // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is recommended:
- *        drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT, 0);
- *
- *        drm_exec_until_all_locked (&exec) {
- *            for_each_vm_bind_operation {
- *                switch (op->op) {
- *                case DRIVER_OP_UNMAP:
- *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm,
&exec, op->addr, op->range);
- *                    break;
- *                case DRIVER_OP_MAP:
- *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec,
num_fences,
- *                                                     op->addr, op->range,
- *                                                     obj, op->obj_offset);
- *                    break;
- *                }
- *
- *                drm_exec_retry_on_contention(&exec);
- *                if (ret)
- *                    return ret;
- *            }
- *        }
- *    }
+ * *   vm_bind {
+ * *       struct drm_exec exec;
+ * *
+ * *       // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is recommended:
+ * *       drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT, 0);
+ * *
+ * *       drm_exec_until_all_locked (&exec) {
+ * *           for_each_vm_bind_operation {
+ * *               switch (op->op) {
+ * *               case DRIVER_OP_UNMAP:
+ * *                   ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm,
&exec, op->addr, op->range);
+ * *                   break;
+ * *               case DRIVER_OP_MAP:
+ * *                   ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec,
num_fences,
+ * *                                                    op->addr, op->range,
+ * *                                                    obj, op->obj_offset);
+ * *                   break;
+ * *               }
+ * *
+ * *               drm_exec_retry_on_contention(&exec);
+ * *               if (ret)
+ * *                   return ret;
+ * *           }
+ * *       }
+ * *   }
  *
  * This enables all locking to be performed before the driver begins modifying
  * the VM.  This is safe to do in the case of overlapping DRIVER_VM_BIND_OPs,
--
2.39.5
signed-off-by:Sidharth Seela<sidharthseela@gmail.com>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE626CDD168
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 22:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9488A112CA0;
	Wed, 24 Dec 2025 21:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d0b0GmyA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9896010F0BB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 21:21:21 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-64dfb22c7e4so815570a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 13:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766611280; x=1767216080; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fMPdGvIlNbNvNMSLf1GQSer9rjpaVmriiyM8Ev5jbvQ=;
 b=d0b0GmyAPs+AvCxgPosFqF1oxyj1HBFB78sstYK65Ych4Q0wUgCe3empGMPc8QIezx
 6U1l5y9un8n+s49kc9H6WF5tI8Zd3Z1zMYhZFhYpPZylJXo1cscge+Hh/SmjkJVrwh/6
 WzLVC2CK5TMZwsE0oBsSIFBCqekLdaW1lrdUju0bhLHCSIv1eFCcmAS56QrpOv6p/PEm
 5cOREoIqs7BcekZmFwtWpQcx8n5sjBOS3H3gqhBAiIirVJ5GnXFXU2vWCIIT5XkCztRZ
 LALiSR4ktLg4TvNAZ+c6O+UxxQQvGKP7wawCSymcHy/lsF/E3yofirXmL+572YoRASvQ
 nlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766611280; x=1767216080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fMPdGvIlNbNvNMSLf1GQSer9rjpaVmriiyM8Ev5jbvQ=;
 b=ARrVZMpCJzHyiMwQbtAC3Osf4B7KDlxchTvcdEqE8ZeeubeuPDAmiNKkE2QsENcIUt
 py/hdMDugUEj3l7qf9YkZlZwSvXceLoHe7JCazohSp2Hy4SLSQyagtFYQ0R2XwkqxfWj
 b1q3e8SY6vJgF1cFWXdh9H9Xj4N47g0UaPDtCaA4CJLJCRGT+GNu/CommFGmPww4/I+b
 84oN6MsoOaVKWs0nz0Cln8iKfD3QSMvFyuaK+35X0Zhq0N0P459UZDodat16BLcHmJsJ
 VkgLxWPje8SvQrfiBbJSIKnDVW64V8Z4TuaxxxrtZAt049UJatDc+GWBd3X4i5qFDQ8F
 yyHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX77rEnyDj9gkxFt7IhcL5lSrBX8Ob1XbYUGeAJtJWFa+2bXZuOXcUnYbXOfglUstOFTwDF3+4Elew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdkF12iUWx/fWBDz5P4ohnPrwbn3dvZDWQAzC2G1s8GmDqXl8j
 rjn7o9C0/Uw0VzfD5nF9nGqYY1ZjYig4IJ7VVwORabB/b7aGdPXmlLU7
X-Gm-Gg: AY/fxX5yuePaTbpZ48VHSsI80aZmwffXekttJoS7NLyDxMPqCwa4a+d9W8vTY3BK7Ff
 DhSObpXrVrhAp1ljGYTj2H2mHKfmw728TEdrgb02ZitAw6UPoTASLIJD4IB3L/yBFln+ZASdvBO
 DL2caoAKm/DlqVBbwzzh95+Mh1VM75R8alK0zWq2vFP17al7x5LbJEMsK0hqK1EXak7503xkgmj
 Ykr6375PBvidjKAhyQ2QvxDST7pmawVfoFUwUbgUGKMO1klU1f0nkUQDCxue+PSrHK492vDbxJ3
 YiXnl17o2NoCUhEyHBGFJfciXYWlyKIQlt/m4f/J2F+JdjarGicW2u0wmtbeykrX5VlgHR0iZ1s
 3zICnnaNtx2bB6Qi3EljSr8JBcbyuW2VuF6I+SLFxgIPp+aJiH1FTug0BvgacxNVaKmLiksWzoN
 3XjqrV82M7m/OeO9M=
X-Google-Smtp-Source: AGHT+IGfkWtEmmnyO9BFQz+C5HCNcReD1s5iNrq6BNCWUfVYA0gfccxmRylORViONZyVJ5yDav7xnA==
X-Received: by 2002:a17:907:96a3:b0:b76:3472:52df with SMTP id
 a640c23a62f3a-b803564175emr2292921066b.10.1766611279466; 
 Wed, 24 Dec 2025 13:21:19 -0800 (PST)
Received: from osama.. ([2a02:908:1b4:dac0:7e77:d48f:f25c:1b21])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037a60500sm1851913766b.13.2025.12.24.13.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 13:21:18 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] drm/xe: Add missing newlines to drm_warn messages
Date: Wed, 24 Dec 2025 22:21:16 +0100
Message-ID: <20251224212116.59021-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 24 Dec 2025 21:50:05 +0000
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

The drm_warn() calls in the default cases of various switch statements
in xe_vm.c were missing trailing newlines, which can cause log messages
to be concatenated with subsequent output. Add '\n' to all affected
messages.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 79ab6c512d3e..1349dbc6f0ab 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2187,7 +2187,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 		       (ULL)xe_vma_start(vma), (ULL)xe_vma_size(vma));
 		break;
 	default:
-		drm_warn(&xe->drm, "NOT POSSIBLE");
+		drm_warn(&xe->drm, "NOT POSSIBLE\n");
 	}
 }
 #else
@@ -2283,7 +2283,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 		xe_bo_unlock(bo);
 		break;
 	default:
-		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
 		ops = ERR_PTR(-EINVAL);
 	}
 	if (IS_ERR(ops))
@@ -2552,7 +2552,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 		op->flags |= XE_VMA_OP_COMMITTED;
 		break;
 	default:
-		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
 	}
 
 	return err;
@@ -2750,7 +2750,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			break;
 		default:
-			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+			drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
 		}
 
 		err = xe_vma_op_commit(vm, op);
@@ -2812,7 +2812,7 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 		/* Nothing to do */
 		break;
 	default:
-		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
 	}
 }
 
@@ -2989,7 +2989,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 		break;
 	}
 	default:
-		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
 	}
 
 	return err;
@@ -3228,7 +3228,7 @@ static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
 		vma_add_ufence(gpuva_to_vma(op->base.prefetch.va), ufence);
 		break;
 	default:
-		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
 	}
 }
 
-- 
2.43.0


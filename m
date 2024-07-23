Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E4593A85B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 22:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5AD10E644;
	Tue, 23 Jul 2024 20:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X/yI6AuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AEB10E644
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 20:54:26 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-25e3d8d9f70so3041711fac.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 13:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721768065; x=1722372865; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ImxAomd/i9Eoc6VqMGA4tkELgzOrDa3gqnjy0bYx30s=;
 b=X/yI6AuG91Ogz+YXjVnbrVHQ/NbUZfmhmEVbI7xnuImOiuRImkW5x7tHyVyorDELMN
 E7kHZM1oVUNswTfmFHIuRKSADkOQYZlnw4c+S0hqGL6qO0LkZU+XRioNl9H/Sy57eH0y
 SvIw8VfSQwqW8T1ne9QRc1dSbQ0EVLl7amISg51nT0BGjx7ojy8yEqFVIggmUCGlt3m2
 L4pvqP12pInMXrJ3irqJwEmEhWbrbXy0HG914if1UF4BCOJ2T/kTxFpVjEpsUSGajTys
 rorhRRKw9/GIUp/kBZ1D4rLNW/znGvQPoG/4zi/m5Y3HLXuq+a71jzOb680rryM+RdBp
 dHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721768065; x=1722372865;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ImxAomd/i9Eoc6VqMGA4tkELgzOrDa3gqnjy0bYx30s=;
 b=VnDAYdIgADGxVBly9ukmav4YawwFRio/TbXLx2xce6uxR4a33d7STcyS62PjMDSbpB
 KWRzR6XOFu2KUDGt5yw8ccXAcNhtw9Dz+T9hQ27CgGA41GHv9MMaOgfs8qqoi1Vs3sKe
 33NykzAMy9P/gTuyclJhlRe6Ki+ZVpdR3wPDhDDvER/xzdQj47oqw/wIvneohhIkwyQx
 zlVuCQHwheaIwFpYDTn3s6FDxmNDZ07cj7syAY4QgybEuRUFCs71G6noCZLFHFvmYboj
 M5r1MfkwNrVpid6+m1EmkTk6C/8HtqN5H97vOEpwweCo5wqO1NLTr+XDIVDMmqZltmM9
 SLXA==
X-Gm-Message-State: AOJu0YzZvhkf60Biysn3lJkb+Z8HBW7QfUvfo2+9kASUk94u502WxR8N
 JBiM5yQg3HAOVjzH9tf5MjGCCJ4GboxYEMIc1ns/G3ZF5gedcsi084LQzqMN8Y4=
X-Google-Smtp-Source: AGHT+IE/jnSvRftejyq7R+387CxXDgl+sAmdKuYR+tk94Pz2MkKTdYivJV1h6nHiG9PzMSft2bz3ow==
X-Received: by 2002:a05:6871:3a13:b0:254:c617:a9a0 with SMTP id
 586e51a60fabf-264878c36ffmr908015fac.50.1721768065393; 
 Tue, 23 Jul 2024 13:54:25 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:bbf0:72d7:a27a:93ce])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2610c7162e0sm2357312fac.2.2024.07.23.13.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 13:54:24 -0700 (PDT)
Date: Tue, 23 Jul 2024 15:54:22 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm/v3d: Create a CPU job extension for the reset
 timestamp job
Message-ID: <3b662018-0ff5-4445-9a50-ff43880807ed@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

[ The Smatch integer overflow are too garbage to publish.  We're going to have
  a BoF about integer overflows at plumbers. - dan ]

Hello Maíra Canal,

Commit 34a101e64296 ("drm/v3d: Create a CPU job extension for the
reset timestamp job") from Nov 30, 2023 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/v3d/v3d_submit.c:551 v3d_get_cpu_reset_timestamp_params()
	warn: potential integer overflow from user (local copy) 'reset.offset + 8 * i'

drivers/gpu/drm/v3d/v3d_submit.c
    515 static int
    516 v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
    517                                    struct drm_v3d_extension __user *ext,
    518                                    struct v3d_cpu_job *job)
    519 {
    520         u32 __user *syncs;
    521         struct drm_v3d_reset_timestamp_query reset;
    522         unsigned int i;
    523         int err;
    524 
    525         if (!job) {
    526                 DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
    527                 return -EINVAL;
    528         }
    529 
    530         if (job->job_type) {
    531                 DRM_DEBUG("Two CPU job extensions were added to the same CPU job.\n");
    532                 return -EINVAL;
    533         }
    534 
    535         if (copy_from_user(&reset, ext, sizeof(reset)))
                                    ^^^^^
reset.offset is a u32 that comes from the user

    536                 return -EFAULT;
    537 
    538         job->job_type = V3D_CPU_JOB_TYPE_RESET_TIMESTAMP_QUERY;
    539 
    540         job->timestamp_query.queries = kvmalloc_array(reset.count,
    541                                                       sizeof(struct v3d_timestamp_query),
    542                                                       GFP_KERNEL);
    543         if (!job->timestamp_query.queries)
    544                 return -ENOMEM;
    545 
    546         syncs = u64_to_user_ptr(reset.syncs);
    547 
    548         for (i = 0; i < reset.count; i++) {
    549                 u32 sync;
    550 
--> 551                 job->timestamp_query.queries[i].offset = reset.offset + 8 * i;
                                                                 ^^^^^^^^^^^^^^^^^^^^

This addition operation could be > U32_MAX.  There needs to be some checking
that it's within bounds.

    552 
    553                 if (copy_from_user(&sync, syncs++, sizeof(sync))) {
    554                         err = -EFAULT;
    555                         goto error;
    556                 }
    557 
    558                 job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
    559                 if (!job->timestamp_query.queries[i].syncobj) {
    560                         err = -ENOENT;
    561                         goto error;
    562                 }
    563         }
    564         job->timestamp_query.count = reset.count;
    565 
    566         return 0;
    567 
    568 error:
    569         v3d_timestamp_query_info_free(&job->timestamp_query, i);
    570         return err;
    571 }

regards,
dan carpenter

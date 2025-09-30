Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA17BABF8B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 10:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664EE10E292;
	Tue, 30 Sep 2025 08:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SfQSbKUO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5666610E292
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 08:14:12 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3f2cf786abeso4036488f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 01:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759220051; x=1759824851; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gTQm6vQzApujhcxFTdSMI7pC3rXkftaIdDfUNkyEfVw=;
 b=SfQSbKUOOZfmhTwXoUTtKTWK/8O2RFmCC5cn40NEWKTEjqi3pbYqoBvTnlul0oLnOo
 lOWPDHDkgDEBiay4xG+O2P0FFDb5lRslJ6LCfH0cMZV+QLbJ3DFHdFumpQ0xCZiYqN5Y
 NProlRgm6lP12pWY4T8TM6GLTE/Ciz1rYlY1m+3kkwCRqk7GaxmZ9RcuLHxKtaTcITDQ
 3dPwRg1/WqLvW+bNfFsWDR8/LDHRP2u2nYkFQ7KKRMVksX9y/+cHa4sipz1tKzcHVCKX
 7h07OrtG0pKbbmbELIANYBNCAr8EuNroKGzHnJ6Eus8f0nseHNrt6oX1x8o+t+elhAzO
 HX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759220051; x=1759824851;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gTQm6vQzApujhcxFTdSMI7pC3rXkftaIdDfUNkyEfVw=;
 b=h7sy4QRBqUfA637oS/tk5npzExLPzpIv1qQbtraCvhEwPU4Niv+FROzH4bXZ9MKMdH
 l+aQJW7GQ7FDn5ivhiyDgkFczVQz2EGbDkRyR73LcFQ6rErZw6y+GE6zpsaOhV4+x5cz
 qxI8p1+B6eWCdncLt1dkoiMRmsEJbxj8UvXJ9qstjhFI91p0NWLJNQWXy7K1051QEn46
 Zj8PNsjAPtUy05caQbtdNF8xcpxI1Z6QuVrxSv7HzJUVnRzFuX56BNxGMEfmz/9IZwph
 RqET+zbZpflHY0VUw6K39i/eae7N1ACVNT9pdXshhi69xEnw/Xz2qisNbBKVC5VrjIid
 xRmg==
X-Gm-Message-State: AOJu0Yzt7KeiJIhW6lXUZEViaSNl3dGOTdvG9mBWoItEn4q1Hg6H/k9O
 tPcCT00gU4NlSvrLWtglhVD3y2TVuXAL16Dk3tIkKc6QMmyDrWWkaSwZObuTiWKVSJA=
X-Gm-Gg: ASbGncthLMBsMIaUcRxZZkFcBBHTt3C081DgaHC6CB243QyXFzTtOLoGTOo0BRI0VW4
 jgZVPWCv67y693OpT2GnEgUykBYB5QVXxB6lFexYt0P5qt3fOCYZ8NskhUV72/ylVNN7kbv6w0y
 FhLC+KFopHOSEjgVdGncTs1a04sKNHwGP7WiGS2wolaZbLlqiQzKYrGy2uM0OQYreHJL/vtiox4
 iU98hOLhq/qNrB8itxXTUVE8x7+hsHK17eUPuk3rM3QjV+CHTM9oOIba1P3w+pkIoZ9cvHpIEo2
 b0liIWt2VrNWFBdmlbpRaD+v2P39H4zW2uzhriJ9JA/75nUPO5LyzYNhwPn7IrPRQKSXlNavwwP
 e3wifrUeAL/1tR7vfEvJWb6bMv+tJ7LgLvTKuL2MOfcGkTSkSavE/6POp1b4c5B0=
X-Google-Smtp-Source: AGHT+IHIEV0GElI9xzWDa0BHS5laKC43lEriTSQbHKR4Pfao6urX/olZAHoGvrppG89iqgYfXKOaVg==
X-Received: by 2002:a05:6000:22c5:b0:3f6:9c5a:e202 with SMTP id
 ffacd0b85a97d-40e4a8f9b01mr16160617f8f.24.1759220050808; 
 Tue, 30 Sep 2025 01:14:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-40fc5603381sm23092987f8f.31.2025.09.30.01.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 01:14:10 -0700 (PDT)
Date: Tue, 30 Sep 2025 11:14:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] accel/rocket: Add job submission IOCTL
Message-ID: <aNuRThh3zZvt1Gz9@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Tomeu Vizoso,

Commit 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL") from
Jul 21, 2025 (linux-next), leads to the following Smatch static
checker warning:

	drivers/accel/rocket/rocket_job.c:621 rocket_ioctl_submit()
	warn: potential user controlled sizeof overflow 'i * args->job_struct_size' '0-4294967294 * 40-u32max(user)'

drivers/accel/rocket/rocket_job.c
    593 int rocket_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file)
    594 {
    595         struct drm_rocket_submit *args = data;
    596         struct drm_rocket_job *jobs;
    597         int ret = 0;
    598         unsigned int i = 0;
    599 
    600         if (args->job_count == 0)
    601                 return 0;
    602 
    603         if (args->job_struct_size < sizeof(struct drm_rocket_job)) {

There is a lower bound on args->job_struct_size but no upper bound

    604                 drm_dbg(dev, "job_struct_size field in drm_rocket_submit struct is too small.\n");
    605                 return -EINVAL;
    606         }
    607 
    608         if (args->reserved != 0) {
    609                 drm_dbg(dev, "Reserved field in drm_rocket_submit struct should be 0.\n");
    610                 return -EINVAL;
    611         }
    612 
    613         jobs = kvmalloc_array(args->job_count, sizeof(*jobs), GFP_KERNEL);
    614         if (!jobs) {
    615                 drm_dbg(dev, "Failed to allocate incoming job array\n");
    616                 return -ENOMEM;
    617         }
    618 
    619         for (i = 0; i < args->job_count; i++) {
    620                 if (copy_from_user(&jobs[i],
--> 621                                    u64_to_user_ptr(args->jobs) + i * args->job_struct_size,

This multiply can integer overflow.  Although it's fine.  Really neither
the lower bound nor the upper bound are needed...  Eventually, we're
going to turn it into a runtime error when code does pointer math that
results in an integer overflow.

    622                                    sizeof(*jobs))) {
    623                         ret = -EFAULT;
    624                         drm_dbg(dev, "Failed to copy incoming job array\n");
    625                         goto exit;
    626                 }
    627         }
    628 
    629 
    630         for (i = 0; i < args->job_count; i++)
    631                 rocket_ioctl_submit_job(dev, file, &jobs[i]);
    632 
    633 exit:
    634         kvfree(jobs);
    635 
    636         return ret;
    637 }

regards,
dan carpenter

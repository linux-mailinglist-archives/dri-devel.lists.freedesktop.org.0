Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC526E08F2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 10:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7463410EA64;
	Thu, 13 Apr 2023 08:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643F410E036;
 Wed, 12 Apr 2023 10:16:50 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-54f21cdfadbso158739597b3.7; 
 Wed, 12 Apr 2023 03:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681294609; x=1683886609;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=19dXlvHgMePLLzjJNE3ILaQBnedS0pYMNzyfIhoRXxM=;
 b=EAQfrASv8KPDAv4+pdLnYB1XvWdCG7BadG3EAWkTPPvVu2WBJVwxQm5f3l+6H0/jXN
 XS6n5ikdV770ofbD9X+Xa1hogZytqUvOK3WbjoaYpClNJiQKJKMWrqyOkYVBtZhOIg3T
 n3gKngm1vDtu+KKmTbiVAbCMsq3z6NpoxFSw0DRAMvOR7xQYXFje0S3YfXI97Cvvl5UN
 HWAxKX4no7XAg6CDu3zpAEtAY7OfQvAdVv7828OSrDKFTsZjke2iu6ZsRi2qRhNsmibD
 C8DOad/FaPWFbFZ213gQ/GT0797QI2vO5fXEUknzvesvgL6VHK50g99XoO2ovG/K/z0I
 pCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681294609; x=1683886609;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=19dXlvHgMePLLzjJNE3ILaQBnedS0pYMNzyfIhoRXxM=;
 b=rOXyW2jfKWwPJftUQd6Bg5Znt4wAuRbHVuAFt+5L/TDQyWDfPI6v+2H+WufjheeuQk
 QZTNJSjByNVK92ry/BPQWAMVvWU4fyKODz6d4cfYmeuRfmZQ2HdIjDO57smSxdneC/hl
 USCCrc0XxD4wvtDp5LQnTcBROAVbr1a9mL6V8+fcurwmnUr6DOZEoFS3SxvHQBRzKJYG
 nroRzXX9uTdLPxnaQkj0WQbeUm3cwDhoLBE0vYGWdGbt6+LPcPFo2yXGHDHMWydCxoJU
 bLInGS+N6GyNWFIJD97SCvONmsqP9fbR7HRBUTxykB36lukK0cBae5s84mjaQvahk1l4
 CKrQ==
X-Gm-Message-State: AAQBX9do1bJPBD0FIoIeu3xV1XfX2HZY1P9PRacAXMVIje3IgJVmV69i
 l/VKBrbbLWDJp+tuL9Rz5J1nkGr84Ad3fZJcTA==
X-Google-Smtp-Source: AKy350Zbl3xTmIJhw9eX8Q6upCZv7QKX45sX7JtpGJJaFIZE+ybDiJmirCSO3VVFaUGoUxmOUUDVuGGBn6ZRB8avHh4=
X-Received: by 2002:a81:bc48:0:b0:54f:a609:e88 with SMTP id
 b8-20020a81bc48000000b0054fa6090e88mr454918ywl.7.1681294608809; Wed, 12 Apr
 2023 03:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <CALjTZvZ=Y1psyd0nmfzm6GhqMKvq5V_NQCWb_X02nasp1CpfcQ@mail.gmail.com>
 <87r0spcuvi.fsf@intel.com>
In-Reply-To: <87r0spcuvi.fsf@intel.com>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Wed, 12 Apr 2023 11:16:37 +0100
Message-ID: <CALjTZvao=N7wxyj_DpqzWUhdJwEsWSKUo3ddi-3ubgMp8BXi_Q@mail.gmail.com>
Subject: Re: [BUG?] INFO: rcu_sched detected expedited stalls on CPUs/tasks: {
 0-.... } 3 jiffies s: 309 root: 0x1/.
To: Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 13 Apr 2023 08:33:23 +0000
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
Cc: tvrtko.ursulin@linux.intel.com, paulmck@kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jani,

On Wed, 12 Apr 2023 at 10:28, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> Please file a bug at fdo gitlab [1]. Add drm.debug=0xe and maybe
> log_buf_len=4M or similar kernel parameters, and attach dmesg all the
> way from boot to reproducing the problem.

Sure, will do, thanks!

> How long is "for some time now"?

That's a wonderful question. I actually found a screenshot I took on
the 14th October(!) with one of these traces. I don't know the exact
kernel version, but since I've been running weekly release candidates
for years, it shouldn't be hard to pinpoint, if strictly needed. Since
the trace seemed informative and I haven't noticed any problems, I was
kind of hoping it would solve itself in time. I guess my patience
lasted 6 months. :)

Kind regards,
Rui

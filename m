Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BB0277B08
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 23:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFEA36E02C;
	Thu, 24 Sep 2020 21:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E386E02C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 21:26:32 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id lo4so748734ejb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 14:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=in8Rg86VvfYuzQh6U7/hDwBGxF8v1AUSBmpO9E789oQ=;
 b=Prvekm5qZ88alNocW0qFgn9cNj4Z7QPimTG+psr7zIONUFcW/sHjWqo//GgbjmL/pf
 Qyi3kbx59KsXbxbt5zVjLpfbDD5wqchk4ncB4m9x1sIIdLR7f/KrMYOWvVfcwXkCNzE0
 mMBAE2hS6VPIeqVq5TwF/2xMYdk/evhZkCGinbxKW92OUZfrQKMIfnXtfyq1OMrF6fiI
 7hM62hDuLhBPU6MmQIBfypJfSQi8cEJujTeoPII/G5Q0qktgQrL9sWDMLtSQcH2vxa1e
 pAec2dHwsj0ZX6DcdP0RlhkEqNAcUa606Ui3etrBGY/9HZZN4lq2/eQdVX6P9Cnh39Wc
 BhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=in8Rg86VvfYuzQh6U7/hDwBGxF8v1AUSBmpO9E789oQ=;
 b=mNig8jXfYfkUgeK1RLNX3iZG9ZlZOlwCc9yGZ/umQSz0dahfJ3jkiQ3VGkxXIG7Nmv
 CkNSRukrApHYFF7rFzNkPsWp2f6q5PHFkX/ttR1CmSAkN29M8k6Un+KpOSUfkf4wlGyY
 qf6RLgOmQZL5lPXoQGAV4GYD5r3k/OHtirllZk9ZBxSjgbTxwGEHgp16NLU0Og6h8Z0S
 74i7Vgw7R6Ykae/lzq3Rh2wT7qUo4pMBsCMI7Z3tB8KCUYtNUrR11YTMVhnwzyf1Yqm0
 QQ+MqS3IhiiOHYT4Kcm66KTLQgIEEaA9MwZjnKnwkwUwJrHEU2ZPl9QGt+m7BHnRvz46
 5sIA==
X-Gm-Message-State: AOAM531JGocOum8ewq3xiFSszpUvTVQcHAslo43dz6RUMeHJpeeak/5/
 emuZE17N4wEZoq57ANEG6hU2DQfWZAQ6WN4B3GBsKQ==
X-Google-Smtp-Source: ABdhPJwo2nc1Tk13TPjt0rD146GmflS4xaeaqP6B2BkyjnC8iqLNN+AT1GEdOa+lozWWeYUYn6ojXC5A3ZlNsX+AQxo=
X-Received: by 2002:a17:907:4035:: with SMTP id
 nk5mr592391ejb.418.1600982790747; 
 Thu, 24 Sep 2020 14:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
 <159643100485.4062302.976628339798536960.stgit@dwillia2-desk3.amr.corp.intel.com>
 <a3ad70a2-77a8-d50e-f372-731a8e27c03b@redhat.com>
 <17686fcc-202e-0982-d0de-54d5349cfb5d@oracle.com>
 <9acc6148-72eb-7016-dba9-46fa87ded5a5@redhat.com>
 <CAPcyv4h5GGV3F-0rFY_pyv9Bj8LAkrwXruxGE=K2y9=dA8oDHw@mail.gmail.com>
 <d160c05b-9caa-1ffb-9c01-5bb261c744b5@redhat.com>
 <CAPcyv4jf9fK5oOcROMx=c-3q6aGFp89MNi-+GoZ-dy1gdNTrJw@mail.gmail.com>
 <28ad3045-9238-2a77-d74d-9660a36aa4da@redhat.com>
In-Reply-To: <28ad3045-9238-2a77-d74d-9660a36aa4da@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 24 Sep 2020 14:26:19 -0700
Message-ID: <CAPcyv4iQ4VnXMU0+_7rfXwPowgcdoABSFUH4WO_3P9vHtWAzPg@mail.gmail.com>
Subject: Re: [PATCH v4 11/23] device-dax: Kill dax_kmem_res
To: David Hildenbrand <david@redhat.com>
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
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, Vishal Verma <vishal.l.verma@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Joao Martins <joao.m.martins@oracle.com>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[..]
> > I'm not suggesting to busy the whole "virtio" range, just the portion
> > that's about to be passed to add_memory_driver_managed().
>
> I'm afraid I don't get your point. For virtio-mem:
>
> Before:
>
> 1. Create virtio0 container resource
>
> 2. (somewhen in the future) add_memory_driver_managed()
>  - Create resource (System RAM (virtio_mem)), marking it busy/driver
>    managed
>
> After:
>
> 1. Create virtio0 container resource
>
> 2. (somewhen in the future) Create resource (System RAM (virtio_mem)),
>    marking it busy/driver managed
> 3. add_memory_driver_managed()
>
> Not helpful or simpler IMHO.

The concern I'm trying to address is the theoretical race window and
layering violation in this sequence in the kmem driver:

1/ res = request_mem_region(...);
2/ res->flags = IORESOURCE_MEM;
3/ add_memory_driver_managed();

Between 2/ and 3/ something can race and think that it owns the
region. Do I think it will happen in practice, no, but it's still a
pattern that deserves come cleanup.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

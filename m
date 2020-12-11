Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 018142D7D55
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 18:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF026E479;
	Fri, 11 Dec 2020 17:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F936E43D;
 Fri, 11 Dec 2020 17:53:35 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id h7so2118300pjk.1;
 Fri, 11 Dec 2020 09:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qJMuReBBloytY5lBy9ILiGRjMb37kF5Bm1u/sykMtGI=;
 b=pbcP9ZyMd8cecm/Ac29HxHof8LYE8oIxJsfNxtiP4g+O1ufaXL9wqRka/RSo4Tovrl
 0+y5AKL9oCVabUsoTOFqz/Yq9QfdTj0Typ4F+2X8XEQKxDDPDKl8NptHh9zo30qru18d
 QGlaxM7GEPdID0olwlCiRofo+G16Jl5uy1wTEIGaTXATmtYB0SKJ7RfAvwDsjDcWrkzF
 kKjuZM4tWxnD1BBGBwlxpereCqs+GnyIsKzQ1aCY79/NwQxDiafuQ2m4U5xGO28vG9vA
 fsrh/72iZb6gHAJp4ifwj1MfQl9QfYGQYjUntoAEcq5P8hce+uphA5O/Y7Ku0HiAUL7i
 H9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qJMuReBBloytY5lBy9ILiGRjMb37kF5Bm1u/sykMtGI=;
 b=Hy6hZAaYbCpxiOBfwrR1mn4+sRnXUvEYKvesCwP6Eck4VHungsPmROvSP9jHVVS3zA
 VLelf04bD+/BAyOyO+v2MwryP/dl3VNVKfQh+D8ksvrxfF4o/o4/DUz6S54jfxMUqZa3
 LpG4+Z1+YKV1l4OksZI0r4HmWqh4Qw90Wlvzt3+u/YtdsTM0h2wU1bBUDxaaLwKndgC0
 u6CwuRgtnu2F9iP3tSySnuqFQ3v/9sgO+TJPzWN8DyxHocaR62fMyD98ABhmgPXmXzrv
 uZIzUkxMG7He1gOe4d9oXFp049F+3sKdpJiaI3rUfkgirYCKruv/9WQQUNfr3ODKEnYf
 dYtQ==
X-Gm-Message-State: AOAM533F/tEAughAcQACC3zjn5HL4uilgChv9SMcpq+SJUzg1kYbNf7S
 YbTOMfDxZB8gqpmdKW28Bjpq2A/GevSQiAVcK0o=
X-Google-Smtp-Source: ABdhPJzHUDKz30vqqKYAobJsngcYE8DjK4RijmUtwtDAm93E/clqz0VBoWDrwvzZzwrJPWtEJfA5ahq579HFtI6a1+g=
X-Received: by 2002:a17:90a:34cb:: with SMTP id
 m11mr14313128pjf.181.1607709215341; 
 Fri, 11 Dec 2020 09:53:35 -0800 (PST)
MIME-Version: 1.0
References: <20201210192536.118432146@linutronix.de>
 <20201210194042.860029489@linutronix.de>
In-Reply-To: <20201210194042.860029489@linutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 11 Dec 2020 19:53:07 +0200
Message-ID: <CAHp75Vc-2OjE2uwvNRiyLMQ8GSN3P7SehKD-yf229_7ocaktiw@mail.gmail.com>
Subject: Re: [patch 03/30] genirq: Move irq_set_lockdep_class() to core
To: Thomas Gleixner <tglx@linutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Saeed Mahameed <saeedm@nvidia.com>, netdev <netdev@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 linux-s390@vger.kernel.org, afzal mohammed <afzal.mohd.ma@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, xen-devel@lists.xenproject.org,
 Leon Romanovsky <leon@kernel.org>,
 "open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-pci <linux-pci@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Wambui Karuga <wambui.karugax@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>, Juergen Gross <jgross@suse.com>,
 David Airlie <airlied@linux.ie>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-parisc@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, LKML <linux-kernel@vger.kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 10:14 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> irq_set_lockdep_class() is used from modules and requires irq_to_desc() to
> be exported. Move it into the core code which lifts another requirement for
> the export.

...

> +       if (IS_ENABLED(CONFIG_LOCKDEP))
> +               __irq_set_lockdep_class(irq, lock_class, request_class);

Maybe I missed something, but even if the compiler does not warn the
use of if IS_ENABLED() with complimentary #ifdef seems inconsistent.

> +#ifdef CONFIG_LOCKDEP
...
> +EXPORT_SYMBOL_GPL(irq_set_lockdep_class);
> +#endif


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

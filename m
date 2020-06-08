Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2721F3500
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 09:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5E16E9F2;
	Tue,  9 Jun 2020 07:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F9B89C08
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 14:38:56 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id y18so6738279plr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 07:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LHVYkeIA74fsa82ThfKsW3dCbekWTk6QgoIVYqEvnVM=;
 b=rR/NFJmDXm26CdXkCHmyqaovvj3YmyuK0TZIZX2y8lBhWId9hpWyfXiPIGaev1NnOp
 0/OMshzfj6wI5lAFEgTWH/Jo3x6w6yiXWi1M41vux7OklTuiMz+Db/dM92egpXTWyvhi
 gpUxQ6TGCuKTiIJ4Nr/9+TdtaVqu25FX4vU3JX1aEURxvWP7gKtEjV/tDro0Vog41RTd
 UOeA3gccNDwS6Rr3EBPjKbQEsXiGgZ3aow7DFH2DMvyGDjSlTDURRk91+oxBKBhbdkA7
 CNPDl6R9/IcvSXM/OVXKlxwZM0WO1UrkMV/REcYe4o3/yWj5F13XYlqlLamZr0V6W704
 KTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=LHVYkeIA74fsa82ThfKsW3dCbekWTk6QgoIVYqEvnVM=;
 b=h2H/R6OVg5+ANM32G/Xif7rUIxCLw1NihaXO2jeK8gcJarOsyBWkNjRDi+CSZRJhbC
 8zOpfo8P3xIYAqk3UFA3ZcOCWdQYurMTbK3+wIPyHyUa+JwvJUf+k+6Tgwlay9rz+zy1
 L7lYpEh+IUzPmI/BEg09EXc42RwPbAQiofizD81Myisc0EYHrKHdNNl5bNbgC2nzLaXJ
 9tjRbnBksemZLM5ajhtdhAH+HUQ11ivIAozp2WLf5y56uxAk9o8LJv97Rbk78XuMSy6W
 JBIaPtHbeHJbon1tXVZFQxHG/cSwGxua8u2dD54yGIKbneihcv8+w0X/8CbYGV3N1X88
 tDvg==
X-Gm-Message-State: AOAM533DyGwJ23T2l6LZUd3qZCiRac3JBLyZLDILuqsUbrC8agxZp8kX
 +5JSvk9QkbabOoCz/FTTxDg=
X-Google-Smtp-Source: ABdhPJzjPn6qRrfjuaQzpcUUixUTc/hW5I1F4tToTMD663azYOuhsVML95fB6yTMmORG56y3ZPsx3Q==
X-Received: by 2002:a17:90a:fa95:: with SMTP id
 cu21mr16725297pjb.56.1591627136540; 
 Mon, 08 Jun 2020 07:38:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id f14sm15765562pjq.36.2020.06.08.07.38.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jun 2020 07:38:55 -0700 (PDT)
Date: Mon, 8 Jun 2020 07:38:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 01/11] tty/sysrq: alpha: export and use
 __sysrq_get_key_op()
Message-ID: <20200608143854.GA140781@roeck-us.net>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 09 Jun 2020 07:35:06 +0000
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Jiri Slaby <jslaby@suse.com>, Matt Turner <mattst88@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 10:43:41PM +0100, Emil Velikov wrote:
> Export a pointer to the sysrq_get_key_op(). This way we can cleanly
> unregister it, instead of the current solutions of modifuing it inplace.
> 
> Since __sysrq_get_key_op() is no longer used externally, let's make it
> a static function.
> 
> This patch will allow us to limit access to each and every sysrq op and
> constify the sysrq handling.
> 

This patch results in:

Building alpha:defconfig ... failed
--------------
Error log:
<stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
arch/alpha/kernel/setup.c:435:13: error: initialization of 'void (*)(int)' from incompatible pointer type 'void (*)(void)'

... which does make me wonder if it was even build tested.

Guenter

---
# bad: [af7b4801030c07637840191c69eb666917e4135d] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
# good: [3b69e8b4571125bec1f77f886174fe6cab6b9d75] Merge tag 'sh-for-5.8' of git://git.libc.org/linux-sh
git bisect start 'HEAD' '3b69e8b45711'
# good: [77f55d1305c11fb729b88f2c3f7881ba0831fa6f] staging: rtl8723bs: Use common packet header constants
git bisect good 77f55d1305c11fb729b88f2c3f7881ba0831fa6f
# bad: [f558b8364e19f9222e7976c64e9367f66bab02cc] Merge tag 'driver-core-5.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
git bisect bad f558b8364e19f9222e7976c64e9367f66bab02cc
# good: [ca681aa49200422a4144ee376a2079a9f717bf11] Merge tag 'usb-for-v5.8' of git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-next
git bisect good ca681aa49200422a4144ee376a2079a9f717bf11
# bad: [a1b44ea340b21c99b34c93acad233da727cb88ba] tty: serial: qcom_geni_serial: Add 51.2MHz frequency support
git bisect bad a1b44ea340b21c99b34c93acad233da727cb88ba
# good: [e0a851fe6b9b619527bd928aa93caaddd003f70c] serial: 8250: Avoid error message on reprobe
git bisect good e0a851fe6b9b619527bd928aa93caaddd003f70c
# bad: [57626ff1c9135211b92dfbea1923333c7b6dd12c] tty: n_gsm: Remove unnecessary test in gsm_print_packet()
git bisect bad 57626ff1c9135211b92dfbea1923333c7b6dd12c
# bad: [675cacf11462f112ab13d57e1163082161ef8708] MIPS: constify sysrq_key_op
git bisect bad 675cacf11462f112ab13d57e1163082161ef8708
# bad: [0f1c9688a194d22bb81953bd85bd18b0115fd17f] tty/sysrq: alpha: export and use __sysrq_get_key_op()
git bisect bad 0f1c9688a194d22bb81953bd85bd18b0115fd17f
# good: [7b668c064ec33f3d687c3a413d05e355172e6c92] serial: 8250: Fix max baud limit in generic 8250 port
git bisect good 7b668c064ec33f3d687c3a413d05e355172e6c92
# good: [beca62c4212ade1516a526784adf7f7d99c7f3d9] tty: mxser: make mxser_change_speed() return void
git bisect good beca62c4212ade1516a526784adf7f7d99c7f3d9
# first bad commit: [0f1c9688a194d22bb81953bd85bd18b0115fd17f] tty/sysrq: alpha: export and use __sysrq_get_key_op()
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

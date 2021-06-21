Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0702E3AF77D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 23:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B596E42E;
	Mon, 21 Jun 2021 21:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7866E42A;
 Mon, 21 Jun 2021 21:34:23 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id m15so2337855qvc.9;
 Mon, 21 Jun 2021 14:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=d3c9VDld9cVll7jiOE4VaogdRPw6AneLM9bO2IMc2sk=;
 b=p3Z4oBwaAf/CzqFKoFIM1M8KmY7Wg7f2bqib/s4ROzYjlXDlqA2rz0QR5ZEx6T24dY
 vVydPJdvK1u1wwF+3pG/LB+K26EdnKi4YKQ+2vZN5lG40wdLdgNmlvlrlW8hhEyvrROo
 okXNlwoArj2NCzH6BAYUge9UF0rv3tk+YTX7bgutc12+FW4JiELD81lKx7lgQsyCZtu8
 F+5VYTsVjvuuwXQ+1hOOJTaVOpyJzHlvXH6CieHCPUcMM/CkE72pjOcQtBP/7EGn0am9
 sOtj05167/GWBgvUDxGuGnTp7oumSo5/CKSny7oiTk0wl/NyOAGxyx0SvnHPVuhY+HPb
 nh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d3c9VDld9cVll7jiOE4VaogdRPw6AneLM9bO2IMc2sk=;
 b=NsXm6sJbivwCCXNhjaP+VAOssd7S7l0dr26YLBOVRvheW9jd0cRt//62zU1L/ZcfBC
 JvayyO/zjmkWYZHhard5ZMEOazqX6aCtUs4MTkZ9NvbifyI2y+K0+41rxnswAZqq7ChN
 WnRLd9pHPLz7IYFSReURpZTQzPgwRRwLbjDGlWIA8CtqJoMZUuyd4J5Bg9F/8ep2G0ix
 /GOnkBracerqeW356+j7uIMr2q3NS+rBmPKHSu+a4D7P+Dc4mfaPj168VfivqlTwTfPB
 /imwQsRpnFC7DIaxmwoFOTwiWtSyjRocihkKzt5U7MA45xqV+4NyrYHWA/ULJE9W6hK6
 dZXQ==
X-Gm-Message-State: AOAM5309zdqRz35tKENMsksyf0vOUyLtGgYemNmJhcCqTP2PR5ZXADIe
 5br/jHPkPDI9OWZBdMWsG7Q=
X-Google-Smtp-Source: ABdhPJyCWCfKmaUbhmrlNJ383qFx661DD98xr7rhC6QmgPxeKOjV5GXLx1pVQN95O1tQew7FlRzhJQ==
X-Received: by 2002:a0c:e912:: with SMTP id a18mr18884264qvo.39.1624311261786; 
 Mon, 21 Jun 2021 14:34:21 -0700 (PDT)
Received: from localhost ([207.98.216.60])
 by smtp.gmail.com with ESMTPSA id h17sm237580qtk.23.2021.06.21.14.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 14:34:21 -0700 (PDT)
Date: Mon, 21 Jun 2021 14:34:19 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/3] Replace for_each_*_bit_from() with for_each_*_bit()
 where appropriate
Message-ID: <YNEF2w/bTLWIG8M2@yury-ThinkPad>
References: <20210618195735.55933-1-yury.norov@gmail.com>
 <20210618195735.55933-4-yury.norov@gmail.com>
 <20210621201711.GA631547@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621201711.GA631547@roeck-us.net>
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
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Jean Delvare <jdelvare@suse.com>,
 Alexey Klimov <aklimov@redhat.com>, etnaviv@lists.freedesktop.org,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, David Woodhouse <dwmw@amazon.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 01:17:11PM -0700, Guenter Roeck wrote:
> On Fri, Jun 18, 2021 at 12:57:35PM -0700, Yury Norov wrote:
> > A couple of kernel functions call for_each_*_bit_from() with start
> > bit equal to 0. Replace them with for_each_*_bit().
> > 
> > No functional changes, but might improve on readability.
> > 
> > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > ---
> >  arch/x86/kernel/apic/vector.c         | 4 ++--
> >  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 4 ++--
> >  drivers/hwmon/ltc2992.c               | 3 +--
> 
> This should be three different patches, one per subsystem.

It was discussed recently.
https://lore.kernel.org/linux-arch/20210614180706.1e8564854bfed648dd4c039b@linux-foundation.org/

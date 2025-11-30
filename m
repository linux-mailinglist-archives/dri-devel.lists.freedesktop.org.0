Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E914CC95311
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 18:56:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9F910E269;
	Sun, 30 Nov 2025 17:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VCEjOgF9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com
 [74.125.224.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2BC10E269
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 17:56:07 +0000 (UTC)
Received: by mail-yx1-f51.google.com with SMTP id
 956f58d0204a3-640d0895d7cso4284578d50.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 09:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764525366; x=1765130166; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wUD/yBt9NZ9+A9XDWEgi0gEwekBnc6bPrryNuMfZMEw=;
 b=VCEjOgF98hn6/IN0XXwNpF53NKJrJB1g4YEq0mc0xoO6qROdVAl3fCOQhIRiFmahBc
 f3ICQE/BzUyBCummkp90vktmBeaDckpUpg32lB58VWAlEuHWf4rbM+JuPOj8+fn90kDR
 dKZ5td8HMmFHQuSI4V92shbI8LaHSeFR43q+FUh/5uQMopPOqMyaHu7nZsrNFi81LwDC
 qsg+e9uHjHeGVeZwK0pOl43IaOidLuWJZw+BNB/XH/r/YD5ue6ZtbVD5wzB8LSnWV2gL
 s1lCATxTXoFiHxDU0/uht+FBOwGTRbYo9gvJXTLAV17hjmmIJfKDErm2SWG3JIS2mNmo
 o8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764525366; x=1765130166;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wUD/yBt9NZ9+A9XDWEgi0gEwekBnc6bPrryNuMfZMEw=;
 b=F7Eo7XkvJHpL+tURkNc22OZvjlUlieoVrdaBsj4PP+rNwpsbqGTywbbvJDAnVfyQYG
 L8uSjp2FFx6b2FDny07GL4DdyVF2UiUgwMTYe9KBobn72uIhpsAb+4ds+jAYh1dIQYQf
 bUAzzTTHP4T+uqVXTMBWxqXYM1Vv44UCotE/ZppRtEoguUp5lq2cwl41hvs/L+TUwhck
 igy0Lv/7MAdt9TdM0FkITYdycXP9semQH6tN6hT7K4v9u7DH3NH9ppSVlS9Fr/bE0F3V
 rcjb12hjcjo8ZDP1PCFBP4sIPzMMoH8D/4eRA6ssX1vUFZ61ecnqgM9GX79MR6CLqjbc
 yDRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVkJ3j5baTsLtTAEZkFX4PPerAvKjmAm4KGc9Gi3e82PDQmlgwp4oJYohPG9HHONMmYwCUqED2oG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/YoP1widTJpeobCnyDoTNOevQqQSu/sDaW+7joXPIBQv7l3JR
 gFSiODW0goIarY7rmTlbYLoio7mQa1DYHfbiCpGVPHbTqM2bUvgylkGi
X-Gm-Gg: ASbGncshS34bB7uwmKZLxjT5IwWOukOJZt3/7dEV3yQyPsZ0Fra2YUqVvr9r4mREg2J
 J5h3nIc1Fy0nxf20FwWCqsZr1/1jGRjEe7Zsp5myJRBTwROC7mUnPOh/hyw+ffMwuGlW5TrMe48
 VOyR2vR5jhSs8iXcLJvrjxJmX+7nRGSSceqFmV6SRxrsdOb3tLPDkzSlWTihADqIiu1Q98K2RAO
 uyKWT9yHJyyPEKGkLeqhTz8BOXl6j4lkXbBRgxc25/FE9YznFslIAqGVcIGBR3WDlESlkLtPebA
 xzvQrqpIFSvDgd4mL8MCWoArbBOP6hoOOEE3r2jr6p3wS6GUIiCyXrpXX08umTwwl/8d98bicHl
 ojwHeUlEmbh1b59/bHQe+FdTCv8XRGsiLcYCSJfj1wmmN7NYbUIVSbUA9wYthlGQZOKPlzry36G
 ZSJkIzTk0=
X-Google-Smtp-Source: AGHT+IFazktIfCN3qlxWEck8ZBpdX6Q85L5F/mb8r4CtsaC7PGh9ijpwS9MHVlr3YNeQOBcTLxwxaw==
X-Received: by 2002:a05:690e:1483:b0:640:d1cc:2be7 with SMTP id
 956f58d0204a3-642f8e41c16mr30276137d50.30.1764525366495; 
 Sun, 30 Nov 2025 09:56:06 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:b42b:4ad9:10af:cabc])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-6433c4692a2sm3805357d50.17.2025.11.30.09.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Nov 2025 09:56:06 -0800 (PST)
Date: Sun, 30 Nov 2025 12:56:05 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] kernel.h: move VERIFY_OCTAL_PERMISSIONS() to sysfs.h
Message-ID: <aSyFNSqWv_A7JNpI@yury>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-3-yury.norov@gmail.com>
 <aStWkK6exUj9YEC1@smile.fi.intel.com>
 <aStYs-LDKbJe6zvW@smile.fi.intel.com>
 <aStZKktOEWliXWT1@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aStZKktOEWliXWT1@smile.fi.intel.com>
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

On Sat, Nov 29, 2025 at 10:35:54PM +0200, Andy Shevchenko wrote:
> On Sat, Nov 29, 2025 at 10:34:02PM +0200, Andy Shevchenko wrote:
> > On Sat, Nov 29, 2025 at 10:24:55PM +0200, Andy Shevchenko wrote:
> > > On Sat, Nov 29, 2025 at 02:53:01PM -0500, Yury Norov (NVIDIA) wrote:
> > > > The macro is related to sysfs, but is defined in kernel.h. Move it to
> > > > the proper header, and unload the generic kernel.h.
> > > 
> > > Tough guy :-)
> > > I hope it builds well in your case.
> > > 
> > > FWIW,
> > > https://lore.kernel.org/lkml/20220603172101.49950-1-andriy.shevchenko@linux.intel.com/
> > > https://lore.kernel.org/lkml/20240212115500.2078463-1-max.kellermann@ionos.com/
> > > https://lore.kernel.org/lkml/20240215093646.3265823-1-max.kellermann@ionos.com/
> > > 
> > > Assuming it builds in allmodconfig, allyesconfig on x86_32/64 and arm/64
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > Actually, one thing should be fixed, i.e.
> > Documentation/filesystems/sysfs.rst:123:Note as stated in include/linux/kernel.h "OTHER_WRITABLE? ...
> 
> And just in case, look into
> https://lore.kernel.org/r/20251126214709.2322314-1-andriy.shevchenko@linux.intel.com

Sure. Please find attached.

From 8b08bfd1d4b885bffb67c548d17d98760ca06e76 Mon Sep 17 00:00:00 2001
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Date: Sun, 30 Nov 2025 12:50:11 -0500
Subject: [PATCH] sysfs: Align update documentation

This series moves VERIFY_OCTAL_PERMISSIONS() from linux/kernel.h to
linux/sysfs.h. Update documentation accordingly

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 Documentation/filesystems/sysfs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/sysfs.rst b/Documentation/filesystems/sysfs.rst
index 2703c04af7d0..ffcef4d6bc8d 100644
--- a/Documentation/filesystems/sysfs.rst
+++ b/Documentation/filesystems/sysfs.rst
@@ -120,7 +120,7 @@ is equivalent to doing::
 	    .store = store_foo,
     };
 
-Note as stated in include/linux/kernel.h "OTHER_WRITABLE?  Generally
+Note as stated in include/linux/sysfs.h "OTHER_WRITABLE?  Generally
 considered a bad idea." so trying to set a sysfs file writable for
 everyone will fail reverting to RO mode for "Others".
 
-- 
2.43.0



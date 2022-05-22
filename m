Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FA5530976
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 08:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8470D10EDF4;
	Mon, 23 May 2022 06:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0619210E063;
 Sun, 22 May 2022 11:44:21 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id q21so3216741ejm.1;
 Sun, 22 May 2022 04:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BOcP7c+b/aIig+wDwK1ySXDPQYBqPco/XJdaO5tL43M=;
 b=HbiWaat1vy9fqglT1AQ5mQ5JjCpkhO+E8jnEtRhzPiif0qrvDKKdx8B95OMkJtx62f
 50z5Sn4S5OQoHLNAGBGDcg/pM3dJVc3FeOKAJ33h9DBUzBryUmLfBVNeEMKJeo3lBUaX
 xorGA9zq+QsM0EimtbURXWG1azBOZqa655UGvWWFRHq2vv0bEgZ9hUSxdC7AyrZSM0K1
 gmpjbX5Ksc66SeqRZbC++YgqZxATC9x3cgK6OQg6EKrLFj22uin13ycLwqXmbpFKdEyk
 gTfnlwyzGuksJcevZj0OkBT28KA9vQfDd/xROApkgmO1+q7Yd8+18f+ljXPwZEs2QkaW
 cj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BOcP7c+b/aIig+wDwK1ySXDPQYBqPco/XJdaO5tL43M=;
 b=49qumZf3AORpepFbhYi6KxfmEV8lmespRA6GGlavhWzbIVvVdz/rDmv0NB1McmBZYi
 44hMJGLCJz7+VnxFi0h2DYNWmjxj9DJjOM8o/bJTfFdFIc8SHmWpTG108GBXZYqIXBYH
 1q9ZBZf1OMh6YfMKSohc7Da7k96xoexPHzQgfPnwOrCGXOhS20I8isXJLB+Omal77Bl/
 VWmBqL2I3W3Ld9WtbNwZ7fwfedY8ELzA3mcp9GbaE6vQuZ2RrtUL9RkaAe5RNSorTJdr
 H7PLMlgErPUCkwAtucRzP8SMIWkk5s4ybRBh6rdt3IueT5PWxAuthqK07ZF5+MP3QbUk
 xCGA==
X-Gm-Message-State: AOAM530wYIUfKvtE68qs28LMnHbsfKV4Z7sUKxXua5qAWWiLFAVFuRq+
 fStBGlF6sbrEvAJSZxkY6+o=
X-Google-Smtp-Source: ABdhPJzRfCqhzI7QwnogN+fhYc0fh38naDmT7SQjDe2PeOI83f57DAXoKHZfwtI5G/K8ujCSqBK8Kw==
X-Received: by 2002:a17:907:6d98:b0:6fe:b83f:802d with SMTP id
 sb24-20020a1709076d9800b006feb83f802dmr6984772ejc.182.1653219860369; 
 Sun, 22 May 2022 04:44:20 -0700 (PDT)
Received: from mail (239.125-180-91.adsl-dyn.isp.belgacom.be. [91.180.125.239])
 by smtp.gmail.com with ESMTPSA id
 5-20020a170906024500b006fe8bf56f53sm4766942ejl.43.2022.05.22.04.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 04:44:19 -0700 (PDT)
Date: Sun, 22 May 2022 13:44:18 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [linux-next:master] BUILD REGRESSION
 736ee37e2e8eed7fe48d0a37ee5a709514d478b3
Message-ID: <20220522114418.vcirenoehfx4efas@mail>
References: <6285958d.+Z2aDZ4O1Y9eiazd%lkp@intel.com>
 <0530d502-1291-23f3-64ac-97bd38a26bd4@roeck-us.net>
 <CAMuHMdU3SYOwE5ftDwymQpVwWmpbC=1Ytyp0Y9GaeUS2i1cP+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU3SYOwE5ftDwymQpVwWmpbC=1Ytyp0Y9GaeUS2i1cP+A@mail.gmail.com>
X-Mailman-Approved-At: Mon, 23 May 2022 06:25:06 +0000
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
Cc: linux-hwmon@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>, KVM list <kvm@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 linux-nvme@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-sparse@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 20, 2022 at 02:40:20PM +0200, Geert Uytterhoeven wrote:
> Hi Günter
> 
> On Thu, May 19, 2022 at 8:48 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > This is getting tiresome. Every driver using outb() on m68k will
> > experience that "problem". As far as I can see, it is caused by
> >
> > #define out_8(addr,b) (void)((*(__force volatile u8 *) (unsigned long)(addr)) = (b))

Not directly related to the root cause but the cast on the LHS is over-complex.
*) If the types are correct, 'addr' should always be a 'u8 __iomem *'. Casting
   it to an unsigned long will throw away all type checking: pointers of
   any size, of any address space, any kind of integer, any scalar value will
   be silently be accepted.
*) Then, when casting an integer to a pointer '__force' is unneeded because
   it's meaningless (because the integer has no type info about the pointee).

The most correct way to write the above would be:
	static inline void out_8(u8 __iomem *addr, ... b)
	{
		*((__force volatile u8 *)addr) = b;
	}
this way, you can typecheck 'addr' (but maybe it's the idea/the argument is
not always type clean?).
Otherwise, if the cast to unsigned long is kept, '__force' can be removed.
 
> 
> Indeed.
> 
> For the sparse people:
> 
> The full error is:
> 
>         drivers/net/appletalk/cops.c:382:17: error: incompatible types
> in conditional expression (different base types):
>         drivers/net/appletalk/cops.c:382:17:    unsigned char
>         drivers/net/appletalk/cops.c:382:17:    void
> 
> Basically, sparse doesn't like "a ? b : c", if the return types of
> b and c don't match, even if the resulting value is not used.

Well, you know that the motivation for sparse was to be stricter than GCC.
In this case it's simply what is required by the standard:
	    
    n1570 (C11) 6.5.15
	One of the following shall hold for the second and third operands:
	— both operands have arithmetic type;
	— both operands have the same structure or union type;
	— both operands have void type;
	— both operands are pointers to qualified or unqualified versions
          of compatible types;
	— one operand is a pointer and the other is a null pointer constant; or
	— one operand is a pointer to an object type and the other is a
          pointer to a qualified or unqualified version of void.

Also, yes, the type checking is independent from the fact of being used
or not (because the type of an expression must be know before any kind
of processing can be done on its value).

> E.g. outb() on m68k:
> 
>     #define outb(val, port) (((port) < 1024 && ISA_TYPE ==
> ISA_TYPE_ENEC) ? isa_rom_outb((val), (port)) : isa_outb((val),
> (port)))
> 
> where isa_rom_outb() leads to rom_out_8() returning u8, while
> isa_outb() leads to the out_8() that includes the cast to void.
> 
> So the best solution seems to be to add more "(void)" casts, to e.g.
> rom_out_8() and friends?

I kinda think so, yes (I suppose that rom_out_8() is never used as
returning a non-void value). But in truth, I think it's the excessive use
of relatively complex macros that is the real problem (an using a conditional
expression not for its value but for its side-effects). Can't outb() be
written as something like:
	static inline void outb(....) {
		if (port < 1024 && ISA_TYPE == ISA_TYPE_ENEC)
			isa_rom_outb(val, port);
		else
			isa_outb(val, port);
	}

With this you have better type checking, no trickery, no need for extra
casts, no problems with double evaluation, it's more readable (to me), ...
But yes, I suppose it's not really simple to convert all this. Sorry for
no being more helpful.

Best regards,
-- Luc

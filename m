Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0504D3DC2D0
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 04:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740F86E1CE;
	Sat, 31 Jul 2021 02:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952166E1CE
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 02:59:06 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id e21so13265767pla.5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 19:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9Aa9q+ZgPH94d4mui+MhDlRe9awiZiZZrbzXI3QwflQ=;
 b=K/AnMh6xbreh13akr8KlRWX933KG/LVSiOukQOOU02w9zDvPcZa/3brhzVIyI/b/3I
 8MwYX4XWyDe4L8DaHTAAOwEDtNaP6NmQ6MxmN2PhdWVt37y0G/ZLykupXyKWHjpiieLb
 dX8vGbaeXhGoISkRuWXLfYmOV+Mfm2EZz2F7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9Aa9q+ZgPH94d4mui+MhDlRe9awiZiZZrbzXI3QwflQ=;
 b=TetQ5OSpM4qvxsu2nXOFsHk7bIYaGUbJqkX+ozmy6+3EVPi9+jWX96pHE2qwm8bWwa
 z43OvTAg0unxS5UroHNRdYzmOTqm3AAAENQOGi4/8BfNK5SmVcmYGU1yIo/ki68DFo3Z
 jB3RKfRUjP2V3dEeCC3MVkKuYILkc3zCuZLhjapg+hdTw8Z6ftWiDh0fn+7Bu3AXmEl9
 fpYp2qjoDhGCoon56IJtCZJu7DhOICp7afX7nQrVz32ezZtfiFuODqt1GA/nodYRbuqY
 l3hevdVrEydln8JVNq0sCcgR3roeTQLJBSunnsAIB2E6OJ7Kc0dHKm8Y5g4Z78DDAfVv
 Qv3A==
X-Gm-Message-State: AOAM533Nhjc5yJGg5DBOsbbQj2CuUC0qfmDvD0+2J1N7GxVNXJa3Q50B
 Kd3GIKaA9oe3f5pOiSvY2e5obg==
X-Google-Smtp-Source: ABdhPJxTfKt3gvdchGd16NukW5boDEwoaheumkJt6I1FzMy8GwJfQpRQICiNX//vocu1zdwGzNo0jA==
X-Received: by 2002:a63:5505:: with SMTP id j5mr1362082pgb.250.1627700346188; 
 Fri, 30 Jul 2021 19:59:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c7sm4280329pgq.22.2021.07.30.19.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 19:59:05 -0700 (PDT)
Date: Fri, 30 Jul 2021 19:59:04 -0700
From: Kees Cook <keescook@chromium.org>
To: "Williams, Dan J" <dan.j.williams@intel.com>
Cc: "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "keithpac@amazon.com" <keithpac@amazon.com>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 "gustavoars@kernel.org" <gustavoars@kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
Subject: Re: [PATCH 04/64] stddef: Introduce struct_group() helper macro
Message-ID: <202107301952.B484563@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-5-keescook@chromium.org>
 <41183a98-bdb9-4ad6-7eab-5a7292a6df84@rasmusvillemoes.dk>
 <202107281456.1A3A5C18@keescook>
 <1d9a2e6df2a9a35b2cdd50a9a68cac5991e7e5f0.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d9a2e6df2a9a35b2cdd50a9a68cac5991e7e5f0.camel@intel.com>
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

On Fri, Jul 30, 2021 at 10:19:20PM +0000, Williams, Dan J wrote:
> On Wed, 2021-07-28 at 14:59 -0700, Kees Cook wrote:
> > On Wed, Jul 28, 2021 at 12:54:18PM +0200, Rasmus Villemoes wrote:
> > > On 27/07/2021 22.57, Kees Cook wrote:
> > > 
> > > > In order to have a regular programmatic way to describe a struct
> > > > region that can be used for references and sizing, can be examined for
> > > > bounds checking, avoids forcing the use of intermediate identifiers,
> > > > and avoids polluting the global namespace, introduce the struct_group()
> > > > macro. This macro wraps the member declarations to create an anonymous
> > > > union of an anonymous struct (no intermediate name) and a named struct
> > > > (for references and sizing):
> > > > 
> > > >         struct foo {
> > > >                 int one;
> > > >                 struct_group(thing,
> > > >                         int two,
> > > >                         int three,
> > > >                 );
> > > >                 int four;
> > > >         };
> > > 
> > > That example won't compile, the commas after two and three should be
> > > semicolons.
> > 
> > Oops, yes, thanks. This is why I shouldn't write code that doesn't first
> > go through a compiler. ;)
> > 
> > > And your implementation relies on MEMBERS not containing any comma
> > > tokens, but as
> > > 
> > >   int a, b, c, d;
> > > 
> > > is a valid way to declare multiple members, consider making MEMBERS
> > > variadic
> > > 
> > > #define struct_group(NAME, MEMBERS...)
> > > 
> > > to have it slurp up every subsequent argument and make that work.
> > 
> > Ah! Perfect, thank you. I totally forgot I could do it that way.
> 
> This is great Kees. It just so happens it would clean-up what we are
> already doing in drivers/cxl/cxl.h for anonymous + named register block
> pointers. However in the cxl case it also needs the named structure to
> be typed. Any appetite for a typed version of this?

Oh cool! Yeah, totally I can expand it. Thanks for the suggestion!

> 
> Here is a rough idea of the cleanup it would induce in drivers/cxl/:
> 
> diff --git a/drivers/cxl/cxl.h b/drivers/cxl/cxl.h
> index 53927f9fa77e..a2308c995654 100644
> --- a/drivers/cxl/cxl.h
> +++ b/drivers/cxl/cxl.h
> @@ -75,52 +75,19 @@ static inline int cxl_hdm_decoder_count(u32 cap_hdr)
>  #define CXLDEV_MBOX_BG_CMD_STATUS_OFFSET 0x18
>  #define CXLDEV_MBOX_PAYLOAD_OFFSET 0x20
>  
> -#define CXL_COMPONENT_REGS() \
> -       void __iomem *hdm_decoder
> -
> -#define CXL_DEVICE_REGS() \
> -       void __iomem *status; \
> -       void __iomem *mbox; \
> -       void __iomem *memdev
> -
> -/* See note for 'struct cxl_regs' for the rationale of this organization */
>  /*
> - * CXL_COMPONENT_REGS - Common set of CXL Component register block base pointers
>   * @hdm_decoder: CXL 2.0 8.2.5.12 CXL HDM Decoder Capability Structure
> - */
> -struct cxl_component_regs {
> -       CXL_COMPONENT_REGS();
> -};
> -
> -/* See note for 'struct cxl_regs' for the rationale of this organization */
> -/*
> - * CXL_DEVICE_REGS - Common set of CXL Device register block base pointers
>   * @status: CXL 2.0 8.2.8.3 Device Status Registers
>   * @mbox: CXL 2.0 8.2.8.4 Mailbox Registers
>   * @memdev: CXL 2.0 8.2.8.5 Memory Device Registers
>   */
> -struct cxl_device_regs {
> -       CXL_DEVICE_REGS();
> -};
> -
> -/*
> - * Note, the anonymous union organization allows for per
> - * register-block-type helper routines, without requiring block-type
> - * agnostic code to include the prefix.
> - */
>  struct cxl_regs {
> -       union {
> -               struct {
> -                       CXL_COMPONENT_REGS();
> -               };
> -               struct cxl_component_regs component;
> -       };
> -       union {
> -               struct {
> -                       CXL_DEVICE_REGS();
> -               };
> -               struct cxl_device_regs device_regs;
> -       };
> +       struct_group_typed(cxl_component_regs, component,
> +               void __iomem *hdm_decoder;
> +       );
> +       struct_group_typed(cxl_device_regs, device_regs,
> +               void __iomem *status, *mbox, *memdev;
> +       );
>  };
>  
>  struct cxl_reg_map {
> diff --git a/include/linux/stddef.h b/include/linux/stddef.h
> index cf7f866944f9..84b7de24ffb5 100644
> --- a/include/linux/stddef.h
> +++ b/include/linux/stddef.h
> @@ -49,12 +49,18 @@ enum {
>   * @ATTRS: Any struct attributes (normally empty)
>   * @MEMBERS: The member declarations for the mirrored structs
>   */
> -#define struct_group_attr(NAME, ATTRS, MEMBERS) \
> +#define struct_group_attr(NAME, ATTRS, MEMBERS...) \
>         union { \
>                 struct { MEMBERS } ATTRS; \
>                 struct { MEMBERS } ATTRS NAME; \
>         }
>  
> +#define struct_group_attr_typed(TYPE, NAME, ATTRS, MEMBERS...) \
> +       union { \
> +               struct { MEMBERS } ATTRS; \
> +               struct TYPE { MEMBERS } ATTRS NAME; \
> +       }
> +
>  /**
>   * struct_group(NAME, MEMBERS)
>   *
> @@ -67,7 +73,10 @@ enum {
>   * @NAME: The name of the mirrored sub-struct
>   * @MEMBERS: The member declarations for the mirrored structs
>   */
> -#define struct_group(NAME, MEMBERS)    \
> +#define struct_group(NAME, MEMBERS...) \
>         struct_group_attr(NAME, /* no attrs */, MEMBERS)
>  
> +#define struct_group_typed(TYPE, NAME, MEMBERS...) \
> +       struct_group_attr_typed(TYPE, NAME, /* no attrs */, MEMBERS)
> +
>  #endif

Awesome! My instinct is to expose the resulting API as:

__struct_group(type, name, attrs, members...)

struct_group(name, members...)
struct_group_attr(name, attrs, members...)
struct_group_typed(type, name, members...)

-- 
Kees Cook

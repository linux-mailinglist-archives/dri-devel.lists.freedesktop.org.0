Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A5F1B25B9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 14:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E686E2EC;
	Tue, 21 Apr 2020 12:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB58E6E2EC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 12:16:44 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id y24so3411035wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=HlX9CDNaQn0ah+4R2AJ8wU9V1YmJ5LGY+YY4RdpAxCc=;
 b=kdV7+rdOTNmiPODp9VtKU4EpsM+j0zHeqYPxjmux0otaOS7b/KLp9tNgpGGH2KjNhE
 o1nuHapdqGwdeIK7l7EzC76Krca+ooeFj/9WU2im5j1/SdHjGluDrkALqRqWu/c7To61
 SbCPhDmUc+mKUw2JuqgyJ+cTndnRdCZ8LNAaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=HlX9CDNaQn0ah+4R2AJ8wU9V1YmJ5LGY+YY4RdpAxCc=;
 b=gpwEnGoVHu62Ka/Y33NLB4AhIxsnvFx68z2MUbm8UCsfuQHZPhX/8SkuStvZXpcBOk
 5lEmmPctspANCcvIpnhOFpBEqdJWF6RZanFr+OULMvxH79j5ZfloReUTaVYbd0cZL1yw
 eAIIno6FSqxptADyhdQ8k05ImXk9P6A1spsxjbUfwln95H1BPu/Lo9leJMjlMtMoAb/w
 IHBA5LuIyp6ebR0o7pcK9wiSe4zhVAakndluGJDnRPab3eSED5zsTrYexkN0XCHmtBcJ
 NQisXPl8lZdi7s2DpDF7YLwAJiKGoKZDfi8ykxFt6eUFnKwE0KZwW5VRkSwVpFyZy1YG
 tkLQ==
X-Gm-Message-State: AGi0Pubv23bVlclHHCC6EtySc2gek745PhZKOnj7kq3hX41c3kt7OuCB
 59fd5ACnwAsDEjfrb9ohayVevg==
X-Google-Smtp-Source: APiQypLp+msXrwjQeDf59CmGpFmh2wKSOzgAEen1QE4ESErJgzU2kye0C9MqIxLWezadPjOfFk67bw==
X-Received: by 2002:a1c:9dd1:: with SMTP id g200mr4976643wme.82.1587471403637; 
 Tue, 21 Apr 2020 05:16:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 91sm3728608wra.37.2020.04.21.05.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 05:16:43 -0700 (PDT)
Date: Tue, 21 Apr 2020 14:16:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v5 1/8] drm/fourcc: Add modifier definitions for
 describing Amlogic Video Framebuffer Compression
Message-ID: <20200421121641.GU3456981@phenom.ffwll.local>
Mail-Followup-To: Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-amlogic@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>
References: <20200416152500.29429-1-narmstrong@baylibre.com>
 <20200416152500.29429-2-narmstrong@baylibre.com>
 <20200417150729.GP3456981@phenom.ffwll.local>
 <65879a34-2e31-2908-3cc4-183f62c70ca0@baylibre.com>
 <CAKMK7uHXtcMFv6LpCEjTg5V-TXbkt2eLyitZoCfSc-nMnwJbuA@mail.gmail.com>
 <25f5ed14-2caf-6b2b-2cd4-3dbf0dd9a03c@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25f5ed14-2caf-6b2b-2cd4-3dbf0dd9a03c@baylibre.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-amlogic@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 20, 2020 at 12:21:24PM +0200, Neil Armstrong wrote:
> On 17/04/2020 20:14, Daniel Vetter wrote:
> > On Fri, Apr 17, 2020 at 6:05 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> On 17/04/2020 17:07, Daniel Vetter wrote:
> 
> [...]
> 
> > 
> > Yup there's a number of parametried modifiers. As long as the stuff
> > you get from a DRM_FORMAT_MOD_ ... macro is a full modifier with
> > everything it should be all fine.
> 
> Would something like that be ok ?
> 
> #define __fourcc_mod_amlogic_layout_mask 0xf
> #define __fourcc_mod_amlogic_options_shift 8
> #define __fourcc_mod_amlogic_options_mask 0xf
> 
> #define DRM_FORMAT_MOD_AMLOGIC_FBC(__layout, __options) \
> 	fourcc_mod_code(AMLOGIC, \
> 			((__layout) & __fourcc_mod_amlogic_layout_mask) | \
> 			((options) & __fourcc_mod_amlogic_options_mask \
> 			 << __fourcc_mod_amlogic_options_shift))
> 
> /* Amlogic FBC Layouts */
> 
> /* bla */
> #define AMLOGIC_FBC_LAYOUT_BASIC		(1ULL)
> 
> /* bla */
> #define AMLOGIC_FBC_LAYOUT_SCATTER		(2ULL)
> 
> /* Amlogic FBC Layout Options Bit Mask */
> 
> /* bla */
> #define AMLOGIC_FBC_OPTION_MEM_SAVING		(1ULL << 0)

lgtm.
-Daniel

> 
> Neil
> 
> > -Daniel
> > 
> >> Neil
> >>
> >>> -Daniel
> >>>
> >>>> +
> >>>>  #if defined(__cplusplus)
> >>>>  }
> >>>>  #endif
> >>>> --
> >>>> 2.22.0
> >>>>
> >>>
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
> > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

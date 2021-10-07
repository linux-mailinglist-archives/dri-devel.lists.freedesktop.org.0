Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F94742570E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 17:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8316E855;
	Thu,  7 Oct 2021 15:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36216E84E;
 Thu,  7 Oct 2021 15:50:49 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 197FoMK3025660;
 Fri, 8 Oct 2021 00:50:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 197FoMK3025660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1633621823;
 bh=2ictrqXAcs0/Jf+501IU2xn9Ag6+SYGQ2GB1JSMdfsk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XMZHChvUbi0/x64LrjBMjBDD8xRAZzR0gb9nQmJ4eBWHB+eJXeRdTWOM7lOGE2Pbk
 o+ybVG6MvojCUYxmsOrO94dutpJ4TF5r27EIaAkutr5R3xWYp8zutrKW4eVr2BHbXe
 mP5ktpD991UXujzbHoZ6Ra21/WrPvbgBxukVk2oyt8XoQSh9g2pKYyi0DJlsJzuGHt
 0bxzEgLKc3uBh/UYnUCmgBcQm6nt585LAM+9mMvnvVTghIR6ziEIvqTz3mtKrKI0ZI
 LW/ME6rITE8b9ySgQKetVBIGyjHa14nmpY4LAdpDrwxkCxPfJDynCs04O1B6pkhPsD
 qxfwCnglWwjSQ==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so7206685pjc.3; 
 Thu, 07 Oct 2021 08:50:23 -0700 (PDT)
X-Gm-Message-State: AOAM532SHH6TSsRbvbYfjIeO3+yPt/FkZGr4fT/OVOaX/yG3zCHMeEHS
 wPo90swcJ+KBFXTg4QN2SJRb9saahaFQ/e6Jbcc=
X-Google-Smtp-Source: ABdhPJzGjr0g3OMZKs7rwCvM6PfYXgPw2KXHF9cvejM0rXE06zKWYrhO1bS2++snMAc8G6LVr00CozT0DNarzLxE4sk=
X-Received: by 2002:a17:90a:4414:: with SMTP id
 s20mr5636167pjg.144.1633621822196; 
 Thu, 07 Oct 2021 08:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211005171728.3147094-1-lucas.demarchi@intel.com>
In-Reply-To: <20211005171728.3147094-1-lucas.demarchi@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 8 Oct 2021 00:49:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNARbNQHPxHHp4=oLOsJLpaCv0c3NRHGSs6hAKnP3N4DHKQ@mail.gmail.com>
Message-ID: <CAK7LNARbNQHPxHHp4=oLOsJLpaCv0c3NRHGSs6hAKnP3N4DHKQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/i915: remove IS_ACTIVE
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Steven Price <steven.price@arm.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andrzej Hajda <a.hajda@samsung.com>, Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Oct 6, 2021 at 2:21 AM Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> When trying to bring IS_ACTIVE to linux/kconfig.h I thought it wouldn't
> provide much value just encapsulating it in a boolean context. So I also
> added the support for handling undefined macros as the IS_ENABLED()
> counterpart. However the feedback received from Masahiro Yamada was that
> it is too ugly, not providing much value. And just wrapping in a boolean
> context is too dumb - we could simply open code it.
>
> As detailed in commit babaab2f4738 ("drm/i915: Encapsulate kconfig
> constant values inside boolean predicates"), the IS_ACTIVE macro was
> added to workaround a compilation warning. However after checking again
> our current uses of IS_ACTIVE it turned out there is only
> 1 case in which it triggers a warning in clang (due
> -Wconstant-logical-operand) and 2 in smatch. All the others
> can simply use the shorter version, without wrapping it in any macro.
>
> So here I'm dialing all the way back to simply removing the macro. That
> single case hit by clang can be changed to make the constant come first,
> so it doesn't think it's mask:
>
>         -       if (context && CONFIG_DRM_I915_FENCE_TIMEOUT)
>         +       if (CONFIG_DRM_I915_FENCE_TIMEOUT && context)
>
> As talked with Dan Carpenter, that logic will be added in smatch as
> well, so it will also stop warning about it.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>





-- 
Best Regards
Masahiro Yamada

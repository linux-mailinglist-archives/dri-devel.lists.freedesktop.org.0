Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA4122DE8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09346E9EA;
	Tue, 17 Dec 2019 14:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2458D6E9E9;
 Tue, 17 Dec 2019 14:02:43 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id k3so5737290pgc.3;
 Tue, 17 Dec 2019 06:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SZbdI1oTJhgNR2q16NaU/ih7Yhw7j92Blaz0d9EbKf0=;
 b=VufgDlRLvUqcDhaN+aqsmpUSpMUEO+5eGXxtaMmiB+cLPuEIANj2BqRFbg41NZStda
 ek5yjrcLaHyy6fz0j9cGKpRd4ZmWrpCKP8qZLrN4FkIi40zDb+URhQt10vXmZR204wHk
 ondoEsn1mZAMYuC5XDdYhlta4Uq6iJsN+AiE8auO3rrkbiB9gdE4nKWlovMytl4nXsaR
 NOwmYv23kXk9CYciQVrLVYxBP1vKQdJW4aD0S+zwQytPQxLPqaibsXwhZ1aLwBRs/Txl
 5NNofTyb1ZdA9my8h0kjpZatEPUICBMzHatfFSJHhhCkyKuPlQunIAukKI/FfzCMnIPd
 U3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SZbdI1oTJhgNR2q16NaU/ih7Yhw7j92Blaz0d9EbKf0=;
 b=QI297skv3gNoY2d1ZWDuqSl3R/OhjoUjNGXm+GKhMX4G46v5hWFkaRtHr+Soalp/WA
 Wqr5xqBawCy2n4IBBOALXrFMZ3LUjJXzAXNAX06HTQ9f4nqGH1dMD9TSpLmGZSF1Ejml
 4FltHQW9tgdksQMUhx4WFQWWrt03vGKBAPSFFBCRaApVk0dv5F1fqhBuj4B7JZNzUOde
 IdYIeQjhp6v7us+GR3dGQbioCyJTtF/ts2V5V9VFb7ch1tPI30ezHT0ARYihin/QEk53
 TFLzKfyUo2RVoiyiLlqBpf1H9MLIlOUVGtM0KIyq4XBvRyDegWztWT23SV78j08Imtiu
 FusA==
X-Gm-Message-State: APjAAAX/lKBz+U/a2J6clDUakoOYdt0LE36p6d47xnyMe+I124nAuxau
 nZonRYqe2tDyYL1yA+5se2TpYrSEPBuQsVvX128=
X-Google-Smtp-Source: APXvYqy/xM6reHHq0RiuWT+LpcRLnjrMc7GzR7AnrNUS1AegdjlgvuOx6jBTvvKmZlo6TyMcdNVND3QExbOT1QWstfI=
X-Received: by 2002:a62:7590:: with SMTP id
 q138mr21861326pfc.241.1576591362762; 
 Tue, 17 Dec 2019 06:02:42 -0800 (PST)
MIME-Version: 1.0
References: <20191216162209.5b5256dd@canb.auug.org.au>
 <d92bec2a-62cb-004e-7f8c-01fc12a53a74@infradead.org>
 <20191217054255.GA26868@ravnborg.org>
 <65c9dc7b-3c61-8204-07da-212632732791@infradead.org>
 <aede39a0-3469-130d-f416-0e9426ebcec9@arm.com>
In-Reply-To: <aede39a0-3469-130d-f416-0e9426ebcec9@arm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Dec 2019 16:02:32 +0200
Message-ID: <CAHp75VfmGo1LzsHiq_UvWbhvRGovtaLVnRPZJ=40arrJWq6HvA@mail.gmail.com>
Subject: Re: linux-next: Tree for Dec 16 (drm_panel & intel_panel)
To: Steven Price <steven.price@arm.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 1:56 PM Steven Price <steven.price@arm.com> wrote:
> On 17/12/2019 06:37, Randy Dunlap wrote:
> > On 12/16/19 9:42 PM, Sam Ravnborg wrote:
> >> On Mon, Dec 16, 2019 at 08:25:11AM -0800, Randy Dunlap wrote:
> >>> On 12/15/19 9:22 PM, Stephen Rothwell wrote:

> >>> on x86_64:
> >>>
> >>> ld: drivers/gpu/drm/drm_panel.o: in function `drm_panel_of_backlight':
> >>> (.text+0x2ee): undefined reference to `devm_of_find_backlight'
> >>>
> >>> ld: drivers/gpu/drm/i915/display/intel_panel.o: in function `intel_backlight_device_register':
> >>> intel_panel.c:(.text+0x593e): undefined reference to `backlight_device_register'
> >>> ld: drivers/gpu/drm/i915/display/intel_panel.o: in function `intel_backlight_device_unregister':
> >>> intel_panel.c:(.text+0x5a04): undefined reference to `backlight_device_unregister'
> >>>
> >>> CONFIG_DRM_PANEL=y
> >>> CONFIG_BACKLIGHT_CLASS_DEVICE=m
> >>> CONFIG_DRM_I915=y
> >>>
> >>> Full randconfig file is attached.
> >>
> >> Can you please verify if you have:
> >> 907aa265fde6589b8059dc51649c6d1f49ade2f3
> >> ("drm/drm_panel: fix EXPORT of drm_panel_of_backlight")
> >>
> >> This commit is supposed to fix it.
> >>
> >>      Sam
> >>
> >
> > Hi Sam,
> > I don't have the linux-next.git tree so I can't check that.
> > I just built whatever is in linux-next of 20191216.
> >
>
> 907aa265fde6589b8059dc51649c6d1f49ade2f3 ("drm/drm_panel: fix EXPORT of
> drm_panel_of_backlight") is fixing drm_panel_of_backlight(), but the
> error above is for backlight_device_register().
>
> From what I can tell, that commit is actually the cause of the error -
> now intel_backlight_device_register() is being included in the kernel
> even though it calls backlight_device_register() which is in a module.
> Of course it also fixed the original error, so reverting it isn't any
> use.
>
> The below Kconfig change fixes the build for me, but I've no idea
> whether this is the correct fix.

I think the proper one is to have s/IS_ENABLED/IS_REACHABLE/.
It fixes issue for me.

Should I send a patch?

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

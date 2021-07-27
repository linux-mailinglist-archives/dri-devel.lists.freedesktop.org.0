Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6C53D7259
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 11:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216886EA3A;
	Tue, 27 Jul 2021 09:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF156EA14
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 09:51:00 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b7so14443131wri.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 02:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=kz9sabgVgY1wKvNUOL8HvLUzUeTArcmnGJfZ1TPWoMc=;
 b=T6H4TudqCPylVgdJ80NYIVEP6tRJ6DdA1CtfigPxaXIB184yMjBbUMSpeStw/rJuQC
 YsSOS+cY1XQMNLWVLsorv6N9ixy2dyPh5F78cX8lQ+YKMYQVLgjQvE1W3NhEfmJAzg+m
 64XYRiobotcaxrp/BjknZudfCWfV1U23wydRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=kz9sabgVgY1wKvNUOL8HvLUzUeTArcmnGJfZ1TPWoMc=;
 b=ClIdbkbKdXw2M0sSsYbvxDR+lCO6b82BL08WqQy0u+5aVBJftYoAiqa+cgamyd7okR
 nFnUOpO/kicssHalNFuOHWjjAuLU0V3cq+fKLxPs9NSLBD0NKpkWNkB3JWLjvQcqLC4M
 ZXkaVdITBHdmRXta9C/2HhvDaCi9d1twBJnZ/JPG15jwUSyipJ2OCWbcS6byDbaa3myn
 StkEJ95lYxHF8U5JvuPpwhzgpZtfCEL70H7mLAYSh5fkLzcoYZbP58zcGt5Kc8WHIfx3
 Q42bN59dCsmjye3dneL/ZVAQSO2JmWwwv+grcI924v2Xo+qlyePJ/Hvq16P+feoqVO8W
 7WYQ==
X-Gm-Message-State: AOAM532TrlMaHznSO69z0XBTvXLNJmPsLdea5Oh4/g7c2s1iQ7NzezpQ
 +4WLRxkO745Nkpvrxcqlk+6/lg==
X-Google-Smtp-Source: ABdhPJz1HWvRnQYsvwhEOmPGLyxTI0QcTwcE+wVFJgPAjwtPpDo9aYNb3T7nGiVWmO9TBh5QLvgoSg==
X-Received: by 2002:a5d:6c6e:: with SMTP id r14mr24262762wrz.242.1627379458889; 
 Tue, 27 Jul 2021 02:50:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d18sm3264532wrp.54.2021.07.27.02.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 02:50:58 -0700 (PDT)
Date: Tue, 27 Jul 2021 11:50:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2] drivers/firmware: fix SYSFB depends to prevent build
 failures
Message-ID: <YP/XAFYDmJSyUkiM@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Robinson <pbrobinson@gmail.com>,
 Mark Brown <broonie@kernel.org>, kernel test robot <lkp@intel.com>,
 Borislav Petkov <bp@suse.de>,
 Colin Ian King <colin.king@canonical.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 John Stultz <john.stultz@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>
References: <20210727093015.1225107-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727093015.1225107-1-javierm@redhat.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Colin Ian King <colin.king@canonical.com>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 11:30:15AM +0200, Javier Martinez Canillas wrote:
> The Generic System Framebuffers support is built when the COMPILE_TEST
> option is enabled. But this wrongly assumes that all the architectures
> declare a struct screen_info.
> 
> This is true for most architectures, but at least the following do not:
> arc, m68k, microblaze, openrisc, parisc and s390.
> 
> By attempting to make this compile testeable on all architectures, it
> leads to linking errors as reported by the kernel test robot for parisc:
> 
>   All errors (new ones prefixed by >>):
> 
>      hppa-linux-ld: drivers/firmware/sysfb.o: in function `sysfb_init':
>      (.init.text+0x24): undefined reference to `screen_info'
>   >> hppa-linux-ld: (.init.text+0x28): undefined reference to `screen_info'
> 
> To prevent these errors only allow sysfb to be built on systems that are
> going to need it, which are x86 BIOS and EFI.
> 
> The EFI Kconfig symbol is used instead of (ARM || ARM64 || RISC) because
> some of these architectures only declare a struct screen_info if EFI is
> enabled. And also, because the SYSFB code is only used for EFI on these
> architectures. For !EFI the "simple-framebuffer" device is registered by
> OF when parsing the Device Tree Blob (if a DT node for this was defined).
> 
> Fixes: d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Whacked onto drm-next so we're welcome again in linux-next.
-Daniel

> ---
> 
> Changes in v2:
> - Add a Fixes tag to the changelog.
> 
>  drivers/firmware/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index af6719cc576b..897f5f25c64e 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -254,7 +254,7 @@ config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
>  config SYSFB
>  	bool
>  	default y
> -	depends on X86 || ARM || ARM64 || RISCV || COMPILE_TEST
> +	depends on X86 || EFI
>  
>  config SYSFB_SIMPLEFB
>  	bool "Mark VGA/VBE/EFI FB as generic system framebuffer"
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

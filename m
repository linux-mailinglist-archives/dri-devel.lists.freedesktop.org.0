Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D19D23BF7D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 20:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A978A89933;
	Tue,  4 Aug 2020 18:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A85F89933
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 18:52:09 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c19so2777730wmd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 11:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=MCVmVRayFgOyaW9uuCCMHJef4rtIhxIeTcJ1ltWDm/A=;
 b=OkEy528nzR32O6we06l7wDwUKcc5IZrp1dQiVRT5RGX8EW2P73GifpBRvHpw7mL1m1
 YlRJV3nBmEJn+mqIOYS4yt0TTlbLlgU/D/VBkJ5goc0Jyb47Vlu5OhIRxA1rKPMnyv0S
 dCClQwuB6Bc7p7fYiuMhYmWWBpZ0IWmnBvYrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=MCVmVRayFgOyaW9uuCCMHJef4rtIhxIeTcJ1ltWDm/A=;
 b=VB+ocX6UsTA/Q85kGzKvZTC2V8+Y/Uf19AzyaOzNRi4i3BjjrbQ/DqLT5sQ4++T321
 u4QJ/gS3xIulUBiD/lXlPaNvf4gY2e/FRp9H35aeYGoNuF/GYhS40LRiEwBsA5hWRH+N
 +M47mk0i3hwrRjjnHGTfR1jLS7d7TmK2EUElZmosSUc1KnMStwIjjKYoXj91kOS3PiqV
 6gly1bgAU/H+UcxPEbOrbRWtSdNJqU2c1S6FBiMBoFHgfDgItjgrNkkD2zrIeyFKhop2
 Oym+A9FyNXkJalnGp8DoAwsoLnVPyxS1gYUpDsBUsjMODSyTWgz8zcWCFq1N2LoWCMlB
 E3fw==
X-Gm-Message-State: AOAM532V5xpe6Cl9lTgZkDqbHYCFxEM9IPGZJ9g46Y5U7iMmvgvbW+VA
 hhFMBFE99B9FHDxVzV7c8Ta7GcCqWiU=
X-Google-Smtp-Source: ABdhPJy3Xn6Jn/uDSiI+K7xVLnN2zx5fRbdJC5qoyUtSF0wZycX2SF7js/q8hiQY608lCKDsDYlYYA==
X-Received: by 2002:a05:600c:2157:: with SMTP id
 v23mr5047228wml.38.1596567127744; 
 Tue, 04 Aug 2020 11:52:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a10sm31360640wro.35.2020.08.04.11.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 11:52:07 -0700 (PDT)
Date: Tue, 4 Aug 2020 20:52:05 +0200
From: daniel@ffwll.ch
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 8/8] modules: inherit TAINT_PROPRIETARY_MODULE
Message-ID: <20200804185205.GR6419@phenom.ffwll.local>
Mail-Followup-To: DRI Development <dri-devel@lists.freedesktop.org>,
 Jessica Yu <jeyu@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org (open list)
References: <20200730061027.29472-1-hch@lst.de>
 <20200730061027.29472-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730061027.29472-9-hch@lst.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 open list <linux-kernel@vger.kernel.org>, Jessica Yu <jeyu@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 08:10:27AM +0200, Christoph Hellwig wrote:
> If a TAINT_PROPRIETARY_MODULE exports symbol, inherit the taint flag
> for all modules importing these symbols, and don't allow loading
> symbols from TAINT_PROPRIETARY_MODULE modules if the module previously
> imported gplonly symbols.  Add a anti-circumvention devices so people
> don't accidentally get themselves into trouble this way.
> 
> Comment from Greg:
>  Ah, the proven-to-be-illegal "GPL Condom" defense :)
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

If this helps to get the next gpu related entertainment at least cc'ed to
dri-devel, maybe even using an upstream driver, I'm all for it.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/linux/module.h |  1 +
>  kernel/module.c        | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 30b0f5fcdb3c37..e30ed5fa33a738 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -389,6 +389,7 @@ struct module {
>  	unsigned int num_gpl_syms;
>  	const struct kernel_symbol *gpl_syms;
>  	const s32 *gpl_crcs;
> +	bool using_gplonly_symbols;
>  
>  #ifdef CONFIG_UNUSED_SYMBOLS
>  	/* unused exported symbols. */
> diff --git a/kernel/module.c b/kernel/module.c
> index afb2bfdd5134b3..04f993863ae417 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -1456,6 +1456,18 @@ static const struct kernel_symbol *resolve_symbol(struct module *mod,
>  	if (!sym)
>  		goto unlock;
>  
> +	if (license == GPL_ONLY)
> +		mod->using_gplonly_symbols = true;
> +
> +	if (owner && test_bit(TAINT_PROPRIETARY_MODULE, &owner->taints)) {
> +		if (mod->using_gplonly_symbols) {
> +			sym = NULL;
> +			goto getname;
> +		}
> +		add_taint_module(mod, TAINT_PROPRIETARY_MODULE,
> +				 LOCKDEP_NOW_UNRELIABLE);
> +	}
> +
>  	if (!check_version(info, name, mod, crc)) {
>  		sym = ERR_PTR(-EINVAL);
>  		goto getname;
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

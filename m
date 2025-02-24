Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2E4A42CB6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 20:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20A710E4E3;
	Mon, 24 Feb 2025 19:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XEwP07w8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07F010E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 19:26:55 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5e050b1491eso10071018a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 11:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740425214; x=1741030014; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RpG14FyHciUCJeJWu7dlaHcQcwmbGCSP29+dFb0PBnE=;
 b=XEwP07w8WuY4nP/enO4oNWlELznk6+/3ZL8piy2LPydM1XN86Ma0b7DOaRLLjUGhTx
 LB3f1Opk5pRWY4xoXkPoCofPP7ZdrcuEsEXLIm5sgpHjp0JiccQq0ISaZnYtkPx8/NYV
 RfYozFPCRg0UrS6zS0Ij2CcpgN7ti1I5Rn4IdqV0p6N198X3z4GuZ5k4ktUn+1rQJ8KT
 oQ3LBCeu+7szh8gOoIT3XKl3Ht+ke3XZVvfQWpZhDCBPZnDrgT2QCdyLuYk189GbMu56
 ewCOyI17lv+z/l9CJvqrgYZ/yaJoqeP7x3x+qsW3AXTI3eW2qbzIi+hPC8X0DfCG7xkY
 flyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740425214; x=1741030014;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RpG14FyHciUCJeJWu7dlaHcQcwmbGCSP29+dFb0PBnE=;
 b=I6PmmaNNhRuaD0+XD+mpJwIUxDcBFt7AWrBtIDfYQ8C8LR847xnWBtmgqI2vGndtVQ
 eUOIVREj7voQflP3PnZQ55vfvhdiXmb5qEQW8IcgY1msdoZ9o6D4dWhbdIOC/sMIUHlt
 iDdPXpbVgT7KIUarHQikXs1ihtMDb3n9rJ0j1srTGydmqMl0qkpcuO1AESHLixOvOVJ4
 FWuw63l8537RwQAugVnNjxjm8bzL1Ur8kpQsss4tMuivJe8YucsutNalnZPQnDVmhHga
 xl3Mr+bdBr1uZbx0fYfw0qiXajARz+DwlpJ5ke40r0zdJ6THFt8F0+knE6UBWLA2E7Ex
 VhNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz2pdrM34CINr3IVyJqtMk4yIW+YGy8dmLTlVxzBNGC6RB2psb9/kqrYb4sxUGQgUj/KSNhKq8a38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjSA+R9z4peBA17XJ3aslXB2KtzXlQaB7ROuqIi+HsTaF4sSxK
 MutxXhuTDUp+FOnAukln2edspd0cCxI3Sz0AqLRbDH2aWrymY185eBQb7jX8tVY=
X-Gm-Gg: ASbGnctimQ2Rrdj1XY2NzLKHjfGo3TU7eAvtLxaaoCVirMHAlxbxBLcM0A/76SZtqcO
 Hfrctr4SzBMf9w2V+lGZXlLB7f1bkmFwPhzfhOmpwYjxv+9txQ28xfn2C+Av6ei/fOhHGdaeHAw
 fCYeObAdxjjWin0fjo4HSk1EfEkAGG4YSIKetNvVVJrADdxFAWw2bR2iRWNSvnWbQL3xMKQ8wEC
 zV/1ot6/8uUKwrMc7XKD//LNML4akISVXhCEhw0Wa9rYkOVGfIG1yiyTFMpFpxq+0wbg5yWq1mp
 xnpZD9mmpJo/iyiILw3CcWk4ttP1YVQ=
X-Google-Smtp-Source: AGHT+IEkKWuUL7F5MtASBjfUP3GAc3+5X8K8oDEv6bNFiTlpvxETEam5AUBsm70isUAlIpvpz/BZvA==
X-Received: by 2002:a17:907:9989:b0:abb:daa7:f769 with SMTP id
 a640c23a62f3a-abbed5b21b4mr1841919766b.0.1740425213760; 
 Mon, 24 Feb 2025 11:26:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-abed1cd4c23sm11026266b.11.2025.02.24.11.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 11:26:53 -0800 (PST)
Date: Mon, 24 Feb 2025 22:26:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jim Qu <Jim.Qu@amd.com>, Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Takashi Iwai <tiwai@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] vgaswitcheroo: Fix error checking in
 vga_switcheroo_register_audio_client()
Message-ID: <8e161bf8-70f6-4557-8fa8-81d4bbfab91f@stanley.mountain>
References: <ae24cd32-1e78-4656-b983-051ed22d86b9@stanley.mountain>
 <87eczn7adi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eczn7adi.fsf@intel.com>
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

On Mon, Feb 24, 2025 at 03:14:33PM +0200, Jani Nikula wrote:
> On Wed, 19 Feb 2025, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > The "id" variable is an enum and in this context it's treated as an
> > unsigned int so the error handling can never trigger.  The
> > ->get_client_id() functions do not currently return any errors but
> > I imagine that if they did, then the intention was to return
> > VGA_SWITCHEROO_UNKNOWN_ID on error.  Let's check for both negatives
> > and UNKNOWN_ID so we'll catch it either way.
> >
> > Reported-by: Su Hui <suhui@nfschina.com>
> > Closes: https://lore.kernel.org/all/20231026021056.850680-1-suhui@nfschina.com/
> > Fixes: 4aaf448fa975 ("vga_switcheroo: set audio client id according to bound GPU id")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/vga/vga_switcheroo.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
> > index 18f2c92beff8..216fb208eb31 100644
> > --- a/drivers/gpu/vga/vga_switcheroo.c
> > +++ b/drivers/gpu/vga/vga_switcheroo.c
> > @@ -375,7 +375,7 @@ int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
> >  	mutex_lock(&vgasr_mutex);
> >  	if (vgasr_priv.active) {
> >  		id = vgasr_priv.handler->get_client_id(vga_dev);
> > -		if (id < 0) {
> > +		if ((int)id < 0 || id == VGA_SWITCHEROO_UNKNOWN_ID) {
> 
> Maybe we want to do something else here... see [1].
> 
> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/r/CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com
> 

I feel like my patch is good enough...  I guess the concern here is that
GCC could change enums to something else.  I don't think that's likely as
it would break a lot of code.  The other option, which is a good option,
is to change the function signature for vgasr_priv.handler->get_client_id()
so that we do:

	ret = vgasr_priv.handler->get_client_id(vga_dev, &id);
	if (ret)
		return;

That's better code, honestly.  But I can't find motivation enough to do
the work.

regards,
dan carpenter


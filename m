Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3810F2A5F55
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF14F894EA;
	Wed,  4 Nov 2020 08:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6216E8A8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:12:14 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id g15so869832ilc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 02:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b9Ktpm35fisVuHEhjhohgaqyboE8BmrrMoCITk9vnK8=;
 b=0kZJ8Rb9+0/H3MVDUevyCTWAc1pKYDKmZzYacQKCMmC/UQ66qmBgifq30qeC2iVztI
 ATPY1knKGSXDzJ6+Nm3tm3Ffn81WkUy/sBCmPfD94FibScrq8/Ui+9TUYldHJ7pcnk1t
 gx+nhhl2zwwSRNNGE6X3g+mK8ICIfWN15TzWFBAm2Ac+Fnp/Nc7mvMvQxol3TgeHLuHe
 fB2HlcDfVoQUKXEDUTDlyUi1MwQ1IJbHWYhRPhxFdctoJ/ps1THqNVawMwUkgd/uHgQv
 AYOBJizY9XV1L84dWspkXE7W+jTkhJPV/Ws9WaUAfWMNJujPYu+ExPkpZXByTNBy8wKU
 VaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b9Ktpm35fisVuHEhjhohgaqyboE8BmrrMoCITk9vnK8=;
 b=OezqJTtjxHePnXey7TlURyacHqNpvEPxw28y/E1ZSO/1Aofm5pzO1f++jnrgGucpUU
 CS/HLMealdVmK/a+QQ+XIaJKaMTLRsIRtlEFiEeBLCRAT1KEwr9zBcQJs0Ue9KkEirFb
 WYSMcMoHWnhDf4d55JUMJ9PmUupDbbAjOwtOX+FM/1/d4YzY6pHv/VUcLVeTO6afn2nc
 ppduKox6Nc8bpaB43X7a679FFTiumSmXGcHC7buh+rLSaKemjuqTfKNtPLWEYtwI7FaS
 cYPxaANnGMb85Q9oxLYk4iD6+9RYmHnwe2l/W8tDkGPNF6szInNhsDAhQI00m7ptFZtt
 9xbw==
X-Gm-Message-State: AOAM531/0yH7x6CjRj675zf1YbTfOsrx0X3KrgIXEf88coKFGk5PcyUl
 ghlnFzpX55pDOJjlObcBcueewLlSOsjyVjpdf6JXmw==
X-Google-Smtp-Source: ABdhPJxXaKRnidyqbx6iUG254lVJzvxaSAJ3Y8t7tBOtYCNJcNKDXTe4r/tIo6bcU8qIdoqImm6tntmYdwdU1LT5yRY=
X-Received: by 2002:a05:6e02:926:: with SMTP id
 o6mr14285653ilt.287.1604398333472; 
 Tue, 03 Nov 2020 02:12:13 -0800 (PST)
MIME-Version: 1.0
References: <20201102152037.963-1-brgl@bgdev.pl>
 <21d80265fccfcb5d76851c84d1c2d88e0421ab85.camel@perches.com>
In-Reply-To: <21d80265fccfcb5d76851c84d1c2d88e0421ab85.camel@perches.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 3 Nov 2020 11:12:02 +0100
Message-ID: <CAMRc=Me4-4Cmoq3UdpYEEhERP6fvt97bEJsZYhrcFSQf+a_voA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] slab: provide and use krealloc_array()
To: Joe Perches <joe@perches.com>
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Gustavo Padovan <gustavo@padovan.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-mm@kvack.org,
 Christoph Lameter <cl@linux.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Robert Richter <rric@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linaro-mm-sig@lists.linaro.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, netdev <netdev@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pekka Enberg <penberg@kernel.org>, James Morse <james.morse@arm.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 3, 2020 at 5:14 AM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-11-02 at 16:20 +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Andy brought to my attention the fact that users allocating an array of
> > equally sized elements should check if the size multiplication doesn't
> > overflow. This is why we have helpers like kmalloc_array().
> >
> > However we don't have krealloc_array() equivalent and there are many
> > users who do their own multiplication when calling krealloc() for arrays.
> >
> > This series provides krealloc_array() and uses it in a couple places.
>
> My concern about this is a possible assumption that __GFP_ZERO will
> work, and as far as I know, it will not.
>

Yeah so I had this concern for devm_krealloc() and even sent a patch
that extended it to honor __GFP_ZERO before I noticed that regular
krealloc() silently ignores __GFP_ZERO. I'm not sure if this is on
purpose. Maybe we should either make krealloc() honor __GFP_ZERO or
explicitly state in its documentation that it ignores it?

This concern isn't really related to this patch as such - it's more of
a general krealloc() inconsistency.

Bartosz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

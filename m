Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E924C3901B3
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A245B890AB;
	Tue, 25 May 2021 13:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66656EA4B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:08:16 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id c20so47287562ejm.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 06:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=J3i7sySuF9vAMwjRduq9o4pZBENGbTDxWuaAXXo5lxM=;
 b=CUcTIB0jGV2498eTndtJ4dsxx9tU25S/huYWnqhhT16rMypCIkW2OSS2dEjs/ScD2/
 z6Oy6LTaUwdiQWKocdpHw/s4akCqzh3aFWaPuPl6h3FUY9uPGaFaDbs19ONFxN2lFxmk
 tiUlt5+GP9TsqYQrWQGwSV/5rZ/PXdNuRFves=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=J3i7sySuF9vAMwjRduq9o4pZBENGbTDxWuaAXXo5lxM=;
 b=FcqGKkGUmADMAyrtTA1QlCvAuFzqpZwzafEfibyvCrNfgNfFzCLRFhWQKpr+/hWG+t
 KaJAwQJQoJjSdkzryf72A6W8OGGC0yK4Sw8omyzGisTMOaWtn8oT5SX/VU8p60wYDijN
 SQ3nmEAQz2EZQ4DzJT3LcUiSWkcWAfA2z4MCHeQ6xzSQezEy9jeSSiXi+RG0+xq2mcTN
 8h7eiOJSdhDM/B7xzcFc8DGr0GYXzWXwr55K830U52fnbQtyicF0AGPn/PnmtUJGFDmD
 y2Mnrrmd15RoQH4MVkn/djhT1ruC6BsvDoXTl9ZZ7NPjnrFxC85LxoQ1OABqsjpdLscO
 0fvA==
X-Gm-Message-State: AOAM530GW5YlanLbqhgf5MLbjNETmIbhCa/r+bRHLgqxbwyS9SPfFNaj
 ogOPs+lbU5Qn2SzcFPW5ccSa2A==
X-Google-Smtp-Source: ABdhPJxXJHDlcz+lHAfC3eMn2DkJLakk8UYTxiXf4gRAsmQw7xJyIhqyJL0QLeuwZ9Zpjh38P9PnUA==
X-Received: by 2002:a17:906:3ed0:: with SMTP id
 d16mr28105603ejj.16.1621948095527; 
 Tue, 25 May 2021 06:08:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u21sm9007517ejg.50.2021.05.25.06.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:08:14 -0700 (PDT)
Date: Tue, 25 May 2021 15:08:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/fb-helper: improve DRM fbdev emulation device names
Message-ID: <YKz2vbxYXSKQE1Ng@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
References: <20210521131910.3000689-1-javierm@redhat.com>
 <YKfS2GDCXPJ/q8gT@phenom.ffwll.local>
 <3a6f9235-5375-b2cb-2d63-a47c5f9752bb@suse.de>
 <bfd6fa47-497a-64bc-c2fc-a081bd41d5ec@redhat.com>
 <fc6540fa-1945-a15d-239d-e87bb4d3fa9e@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc6540fa-1945-a15d-239d-e87bb4d3fa9e@suse.de>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 08:53:56PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 21.05.21 um 19:18 schrieb Javier Martinez Canillas:
> > On 5/21/21 6:53 PM, Thomas Zimmermann wrote:
> > 
> > [snip]
> > 
> > > > 
> > > > So what with all the drivers which do _not_ have drm in their name? Also
> > > > I'm never sure how much these are uapi or not ...
> > > 
> > 
> > That someone could threat as an uapi is a fair point indeed.
> > > Why do we need a suffix anyway?
> > > 
> > 
> > Yes, I thought the same and was torn about posting a patch to just remove
> > the suffix. I don't think users care that much if is a fb device from a
> > fbdev driver or a DRM driver using the fbdev emulation.
> 
> Yup. I don't see how anything in userspace would depend on the exact name;
> especially since fbdev emulation only provides basic features. (I'd welcome
> a counter examples that proves me wrong.)
> 
> IMHO we can risk it to remove the suffix entirely. But that needs an ack
> from Daniel or Dave.

If you guys with your distro hats on all think it doesn't matter, then
yeah I'm all for dropping the somewhat silly -drm or drmfb suffixes. I
think that was just way back so it's easier to know you've loaded the
right driver, back when there was both drm and native fbdev drivers
around. But now I think for new hw there's only drm, so should be all
fine.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

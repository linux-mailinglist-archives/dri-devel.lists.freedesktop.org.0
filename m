Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA7D940081
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 23:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D1C10E04B;
	Mon, 29 Jul 2024 21:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EuxuTLXz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423BD10E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 21:35:40 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-7093d565310so3020000a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 14:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722288939; x=1722893739; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8jCZ4dJacok9yS/sGhPIVw4hVTsTqbKuUreZrjjqP2I=;
 b=EuxuTLXzsgxSq6hWS0ECwmUVOVVL0mUjTFduc7seU1I0Vr1cH+l7yRpiHtD9geszuy
 TCaLukX4hrX/i9d1TQoJe7lUexP2nPyigB2rlSzFQ/TEXWDLJOSorE+ecQwmgf8c0hca
 OTiPgKKQDGGI49Ufu7O3jqIQ2ocZ895yJ09YbftssR8Y2Gx4FyxWqPsOrsTeJZe9TD/U
 6vxel2Fr7Tm41z7LZP5W+DtwcfWfrZZ1WQEetzpZptgLVabf2oLSoJX1hLYN2TvoFApT
 uKLOC8q3N11hYvZgqrRXqU4Dl3BC45Z9MLu01tnN3OEEpL39YoAYWCR9GuKwxlff12hU
 QVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722288939; x=1722893739;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8jCZ4dJacok9yS/sGhPIVw4hVTsTqbKuUreZrjjqP2I=;
 b=OFuJo0Ao4zO+gfHTSq3jPXAa3582lJrQKgIDfq/SAsS7hjtIliojAuqjllAsv51GRP
 1apHDduwSVrx6XFTrYQSB09qw8rvYiMCreIavbOv5CJvoiYGD6E5LxUCtTMm01ydyNEn
 V8rqzTXkmiDgXhTHnEenWWQeVkMkl3dAO7gkI5G/7U12q8tck1/p02LLQzEHnn3UZbOH
 TkfIFHoygM3Nnsjojgd58jS1c6Y5ATxd4KTmEJ1TKP+ii1HfJB1KPkblNcJ5Tx2m3ecT
 0skNMU7VI+9jNoa15vqpBRfqWyHfQE7eKDrnN0/RJjFdjd6y5SqEfGLebzLlfk032gYG
 djRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlHIxaJL8MV/6El07L/JvkWMdxQleFhB9ZXjWgs98C94xonrhp6v9edxuq5Xgyg2wXI/LEmJqoOPNSpdovtUPqFWQlSYxwsLf4iFRgoQFN
X-Gm-Message-State: AOJu0YwcuVPHLKu1EqpkGV+j2CO8zHc1pz7h39zO5zcQmRtUiFP6JS7A
 VxkoStOkJ8Qr2Gly+wttJeL16W2WC/0P4QybNGRTx1cejU4clDSQFInLf/4YO3Y=
X-Google-Smtp-Source: AGHT+IHDvjNGEn3OlMcAR6Il1gwE9cH+Q82mJfYpkkx7Ley40Dv5Z1neEY9qJN9BU+smiLkpIMX/Og==
X-Received: by 2002:a05:6870:46a9:b0:254:8afa:6914 with SMTP id
 586e51a60fabf-267d4eedec3mr10816825fac.34.1722288939167; 
 Mon, 29 Jul 2024 14:35:39 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7095aeb0acdsm61008a34.64.2024.07.29.14.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 14:35:38 -0700 (PDT)
Date: Mon, 29 Jul 2024 16:35:36 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Helge Deller <deller@gmx.de>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev/hpfb: Fix an error handling path in hpfb_dio_probe()
Message-ID: <9cc6ac18-3804-486a-8549-fd13b6ae121e@suswa.mountain>
References: <dc4fe3d857849ac63131c5620f1bacf1a3d7172e.1722191367.git.christophe.jaillet@wanadoo.fr>
 <698958fb-4fc8-4288-b067-5843c651b093@gmx.de>
 <ac4c6712-c47b-4414-9640-3018bf09e8fa@suswa.mountain>
 <9dbb2b52-4fc9-4bbf-a6a2-ab6ec32adb8f@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dbb2b52-4fc9-4bbf-a6a2-ab6ec32adb8f@gmx.de>
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

On Mon, Jul 29, 2024 at 10:09:39PM +0200, Helge Deller wrote:
> On 7/29/24 17:59, Dan Carpenter wrote:
> > On Mon, Jul 29, 2024 at 10:13:17AM +0200, Helge Deller wrote:
> > > On 7/28/24 20:29, Christophe JAILLET wrote:
> > > > If an error occurs after request_mem_region(), a corresponding
> > > > release_mem_region() should be called, as already done in the remove
> > > > function.
> > > 
> > > True.
> > > 
> > > > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > > 
> > > I think we can drop this "Fixes" tag, as it gives no real info.
> > 
> > If we're backporting patches then these tags really are useful.  As
> > I've been doing more and more backporting, I've come to believe this
> > more firmly.
> 
> Sure, "Fixes" tags are useful, but only if they really refer
> to another patch which introduced the specific issue.
> 
> But the tag 1da177e4c3f4 ("Linux-2.6.12-rc2") isn't useful, as it's
> just the initial git commit. It has no relation to why release_mem_region()
> might have been initially missed. See:

In the last couple stable kernels we've backported some pretty serious
networking commits that have Linux-2.6.12-rc2 for the Fixes tag.  So if
it's security related that's really important information.

For minor stuff like this, the commit will be backported as far back as
possible and until it ends up in a list of failed commits.

When I'm reviewing the list of failed patches and there is no Fixes tag
I think maybe it was backported to all the affected kernels?  In that
case, I could have skipped the manual review if the patch was just
tagged correctly.  Then I wonder, why wasn't it tagged?  I just assume
it was sloppiness honestly.  I'm probably not going to spend that much
time on it, but it's annoying.

When a commit lists Linux-2.6.12-rc2 as the Fixes then it still ends up
in the failed list.  But it can't affect too many users if we're only
getting around to fixing it now.  It's easier to ignore.

regards,
dan carpenter


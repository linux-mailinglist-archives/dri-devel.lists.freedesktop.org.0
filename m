Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7F66261D1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 20:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069DF10E1B5;
	Fri, 11 Nov 2022 19:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B2A10E1B5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 19:21:51 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id p12so4954622plq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 11:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IHk/WyAgMPc33IOyOTaPaWGnmZhp17CsZbK+KP95Wh8=;
 b=O6YivlkQdE2NV4Z4tLE02IOQ7YQgIRJrWM80tdZkt5k+XIQtZz7cxKpCMaB7rrfPq7
 G3XacIpYr2nn6HNsDJtbm6DA3HrV4P+qQd/qmV5UhkMSi3baY1lPJVMFkAstEJzuHUeN
 DgKOEOliQUckGTg21sefxcOucamEjp7kTw/Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IHk/WyAgMPc33IOyOTaPaWGnmZhp17CsZbK+KP95Wh8=;
 b=qr3MdUDjiMn6Vm1Y3lcB/DR6Z02uZEMjkxP4F9MY5oQ3mW8GPUxbRZkTld9U5szZYZ
 YQHt+sD3pFk9dFWdid6joX5UQYpbkb9zNE5d+7KXoDCSivaYsfDRtkLY2QNL+GpEIokG
 2k4tmsq2Etk1ilhnNOkCxGSzJsMQHmZTlIZBvZhsp0JGcC6Pyc9uqCmnFVT3sonZLZQ7
 VKFQfbnoNEgrMf17yXWXvxzmNLWH6RoNYgNGTNNnNVVsZnbKR10vKPl4Gy/rYbJizeHe
 vyTWr7DCsWcPUl47JeO3yigy7VtRq9L0c+X63mtSNT6iCaaVRgQLSvsW0DTJQRCNH9mS
 gfEA==
X-Gm-Message-State: ANoB5pkCkGqISQVLrJnS3LwZUGdlzsj+BE9CSHNwFbbzWAulRUIzV7dV
 QJdU/vRx7SgDtYDngu20chN5lw==
X-Google-Smtp-Source: AA0mqf4i77VIhs5qpNyBlVvhpR2s9r/2VBj54xZbpPIy/ryD5gcsls//pP1BrhZB4gM/fwDn5Bz05Q==
X-Received: by 2002:a17:902:e052:b0:172:f5b1:e73b with SMTP id
 x18-20020a170902e05200b00172f5b1e73bmr3962831plx.58.1668194510942; 
 Fri, 11 Nov 2022 11:21:50 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a62f84e000000b0052d4cb47339sm1907746pfm.151.2022.11.11.11.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 11:21:50 -0800 (PST)
Date: Fri, 11 Nov 2022 11:21:49 -0800
From: Kees Cook <keescook@chromium.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: Coverity: nouveau_dp_irq(): Null pointer dereferences
Message-ID: <202211111110.11B554B@keescook>
References: <202211100850.7A8DD75@keescook>
 <87iljl6ehe.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87iljl6ehe.fsf@intel.com>
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
Cc: "Nathan E. Egge" <unlord@xiph.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Karol Herbst <kherbst@redhat.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 11, 2022 at 11:13:17AM +0200, Jani Nikula wrote:
> On Thu, 10 Nov 2022, coverity-bot <keescook@chromium.org> wrote:
> > Hello!
> >
> > This is an experimental semi-automated report about issues detected by
> > Coverity from a scan of next-20221110 as part of the linux-next scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> >
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by commits:
> >
> >   Mon Aug 31 19:10:08 2020 -0400
> >     a0922278f83e ("drm/nouveau/kms/nv50-: Refactor and cleanup DP HPD handling")
> 
> Hi Kees, this looks like a good idea, but maybe double check the Cc list
> generation? I was Cc'd on four mails today that I thought were
> irrelevant to me.

Hi!

Heh, I was recently asked to _expand_ the CC list. :)

For these last pass of reports, I added a get_maintainers.pl run to the
identified commit. In this instance, the commit touched:

 drivers/gpu/drm/nouveau/dispnv04/disp.c     |    6 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  192 ++++++++++++++++++++++--------------------------
 drivers/gpu/drm/nouveau/nouveau_connector.c |   14 ---
 drivers/gpu/drm/nouveau/nouveau_display.c   |    2 
 drivers/gpu/drm/nouveau/nouveau_display.h   |    2 
 drivers/gpu/drm/nouveau/nouveau_dp.c        |  132 ++++++++++++++++++++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |   33 +++++++-
 7 files changed, 244 insertions(+), 137 deletions(-)

And the get_maintainers.pl rationale was:

Ben Skeggs <bskeggs@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:1/1=100%,commit_signer:6/16=38%,authored:4/16=25%,added_lines:23/124=19%,removed_lines:36/152=24%)
Karol Herbst <kherbst@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:2/1=100%)
Lyude Paul <lyude@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:9/16=56%,authored:6/16=38%,added_lines:92/124=74%,removed_lines:107/152=70%)
David Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS)
Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
Ilia Mirkin <imirkin@alum.mit.edu> (commit_signer:1/1=100%,authored:1/1=100%,added_lines:2/2=100%,removed_lines:2/2=100%)
"Nathan E. Egge" <unlord@xiph.org> (commit_signer:1/1=100%)
Jani Nikula <jani.nikula@intel.com> (commit_signer:6/16=38%)
Dave Airlie <airlied@redhat.com> (commit_signer:5/16=31%)
Thomas Zimmermann <tzimmermann@suse.de> (commit_signer:4/16=25%,authored:4/16=25%)
dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS)
nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS)


-- 
Kees Cook

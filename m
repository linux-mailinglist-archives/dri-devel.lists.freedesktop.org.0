Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E379021BF0C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 23:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483D86ED10;
	Fri, 10 Jul 2020 21:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE966ED10
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 21:12:07 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id by13so5661313edb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2DBmedCYSo6ZfyDFSKXvvnu1ic71xYTJyTog2TIacjs=;
 b=gMbOq/Hs7LKU3Yd13xvxEgCsFLxUkZxW8V/GiLsxSZl+wu37ukDW1fSweNUAJpIgF9
 TI3r1g8YmqfpHnfIogFYwzoboSi2uIJ5q4de1IDitLKLsnvvRjVANtea7EcnmPa+sbUX
 HRnLuasB0vPP9pKm99soCkBp2UzAguzQngictBI9P1DM4svhsUt/BgnKVqs9cjAJEX9v
 Vk0kfQ5Nx+mpvmDH+Rll6LKVXOK/0aM/OirE148kzSbsL2Lf/kCFtaLV/HgpzhEXttKE
 wwlej4ppgd73wSxFbKz6b4VoX3uSCdIGlCH2kVUAYw4slxeJxZCv5QSiw6sDlhiMYY2m
 KynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2DBmedCYSo6ZfyDFSKXvvnu1ic71xYTJyTog2TIacjs=;
 b=j4dsm2sejiOctr3aS4VptcWWmcUNdZDP/2ZAYhAM/yW1poznVR3APcvcTrSdqqQCgL
 5rcWqVvpOhGR16OfICmALeXTs9riwyPIUyarSuhx7XNYS9qm/qWqw8LZHv/hV5P0UzQP
 TsSMpSgXcRspNwcfm4gB/UQ15uXfkw1oVhbQ0PrnZZsaq9NzvFjd2xA6IqzgSmPbSNZk
 gtYXsaRVYVJn6Q01cZVeDM1xG/w2eGpdnMvhWB69/Vsv1sUjYh1LRzJR70YY6++nSs+N
 0PuT84PLjqnKvvDr7Mw2oJv2V3rUnSHsi69k5qd9MB+DLq+9QiF/PXTftcjNBaEbGnRI
 93Dg==
X-Gm-Message-State: AOAM533nltDIwwHzQZQXSwrUatZtKu5e4eDPGaOQbxxYm89moOYBZmL6
 kw65qH7PilMiDZJBiEDb+3T/W8n98L0saQva8EE=
X-Google-Smtp-Source: ABdhPJzXTa8Qn5mgMQs8rYSE4QoQxTLzuqXS3vC7v8xPLvYv1KkPU/RuHEmYqvxD2wY41aVKYdmkvjbjreRXTSvGVXY=
X-Received: by 2002:a50:fa07:: with SMTP id b7mr77435275edq.298.1594415526080; 
 Fri, 10 Jul 2020 14:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200709193016.291267-1-sam@ravnborg.org>
 <14ce41c4-d683-1551-9f21-37b054f5752c@suse.de>
 <18725e54-517d-75dc-282d-96d27e34d8b8@ilande.co.uk>
In-Reply-To: <18725e54-517d-75dc-282d-96d27e34d8b8@ilande.co.uk>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 11 Jul 2020 07:11:54 +1000
Message-ID: <CAPM=9twjJs2mnNzxSQDBrOmDyp5iqM3ANhLwQ9N5kWEAKC0aZQ@mail.gmail.com>
Subject: Re: [PATCH] drm/drm_fb_helper: fix fbdev with sparc64
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 sparclinux@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> > but I'd like to have someone with more architecture expertise ack this
> > as well.
>
> Agreed. All my testing is using the bochs_drm framebuffer under qemu-system-sparc64
> (a sun4u machine) so it would be nice to get an ACK from Dave or someone else who can
> vouch for this on real hardware.

I'm not sure there exists real hardware that would come down this
path, I believe the last sparc64 with a GPU is a mach64, or maybe an
r128 card.

Otherwise I think using the memcpy io should be fine here on all architectures.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

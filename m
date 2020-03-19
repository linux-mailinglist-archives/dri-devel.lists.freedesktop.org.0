Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D1C18B19B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 11:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D1E6E12D;
	Thu, 19 Mar 2020 10:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E950D6E9EE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 10:37:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h9so2152294wrc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 03:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=aMbbH78vtzNz6FzaZNsYSrHCSvTRdF6ZhflOWvgdIeE=;
 b=CyyRdX/Lh/aUkCw68SQUP3hmsgUYmQhf2vpEB9rExMW5rww5ebA/N1aIjEEM0ruURG
 VX54Sbh8Web7QVaQzpste8uj1KBUnehlsJtiJd/w6gfZzSlq5HESNtSIJNP8AHXSMxwI
 VQlxh9AsgbDdif/OCrtfQdzb2GaKPb29cVF28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=aMbbH78vtzNz6FzaZNsYSrHCSvTRdF6ZhflOWvgdIeE=;
 b=i1SMMvdH0keEHRX02WCt2nT2rEK7SmqpmJ5Ck/SdiLWultBlKI1R6PUQ2qCXHuoY2t
 bGjkW0E7DnERPQF9Rsru0SFC/Vs36TH2NfHmh3GmMm9JjVhquvFCWMNn5X6yP/gOw/ch
 6KguqKu7UZc5vTJqUqNsF7dDlUZjCS3Cu7Hu38DMoQ1RH3wljbOVzJ+wif0ycss6YQAC
 aTJUKc/Z1ias5PkTt6lgFkFe+xGFk62yvjhm9wHXTDnt55hAD6pJjj6aqkDpee7XBOI3
 Ix9iBNoPngqkHjnqGB6FB1DKGoYH966MTnBx32JC5EfCilnqkDBuRTMKcQxDYTDUUyR0
 9Hxw==
X-Gm-Message-State: ANhLgQ3NTSuVxZENFGMyOVVDhKozZa5BVcIb6r6gWxyMU6V2Z4afUNQv
 XfFD5I70kIDOBAAfZA5lb9vwnw==
X-Google-Smtp-Source: ADFU+vs4Y1GwgEZ9kTelPFUjLmBSBjvyy3vq98PvugmhHtxCAwTqdmcrRy04mUNrc7Ia6XpFx59A4w==
X-Received: by 2002:adf:bbcf:: with SMTP id z15mr3663283wrg.340.1584614258485; 
 Thu, 19 Mar 2020 03:37:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i8sm2765825wrw.55.2020.03.19.03.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 03:37:37 -0700 (PDT)
Date: Thu, 19 Mar 2020 11:37:35 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
Message-ID: <20200319103735.GD2363188@phenom.ffwll.local>
References: <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com>
 <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
 <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
 <3e522876ec0287b69483c65aa1e7ba1ded536ec6.camel@lynxeye.de>
 <14115064-24e5-da2c-38c6-f3ba0d447b18@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14115064-24e5-da2c-38c6-f3ba0d447b18@daenzer.net>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacob Lifshay <programmerjake@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>, Jason Ekstrand <jason@jlekstrand.net>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 11:05:48AM +0100, Michel D=E4nzer wrote:
> On 2020-03-17 6:21 p.m., Lucas Stach wrote:
> > That's one of the issues with implicit sync that explicit may solve: =

> > a single client taking way too much time to render something can =

> > block the whole pipeline up until the display flip. With explicit =

> > sync the compositor can just decide to use the last client buffer if =

> > the latest buffer isn't ready by some deadline.
> =

> FWIW, the compositor can do this with implicit sync as well, by polling
> a dma-buf fd for the buffer. (Currently, it has to poll for writable,
> because waiting for the exclusive fence only isn't enough with amdgpu)

Would be great if we don't have to make this recommended uapi, just
because amdgpu leaks it's trickery into the wider world. Polling for read
really should be enough (and I guess Christian gets to fix up amdgpu more,
at least for anything that has a dma-buf attached even if it's not shared
with anything !amdgpu.ko).
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

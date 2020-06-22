Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6572044D7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 01:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4534A6E933;
	Mon, 22 Jun 2020 23:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1A66E933
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 23:56:33 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id i3so21366421ljg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 16:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JY9QzZUA1y1+jgxR7s19vmqrTfZ4xFz7vZtREOBsHLw=;
 b=W6nBFh43wlYWhv0Sdnp0i9rsPh2PDBKHFLjrl/tLXzCzN0DfI+y4sluKrarjogCq5n
 sDLNzZYEqu2sEHjzoMY8XWLmz3Crbcjmflp54xOI0bCfXDJ0zDkYc6e+kEGPWMQwCYDH
 SpR5V4Z8UhjiaHwrSrpqDFCP1OoDPsoI2rRDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JY9QzZUA1y1+jgxR7s19vmqrTfZ4xFz7vZtREOBsHLw=;
 b=Ygx22n0Na4hTGrI+YeUekUiheMH8B1tjmbwAQ6v7jlYtYhIxW8LuO811/bRTtjFRvn
 Pxa+CctxeYQcpIFJZQH92l0059K0MpssgxnRE6374Rd8l4+5tUDRk/zwvc3vwnb/9g1u
 3xsWkdM26KX+jxYHtoz2fipAVxRMAGHePZL5nj83ocAY9BDIBSG4vmdRdMhFcqdSrY7o
 xKUHe4LUDxkEaK4lB/gccKsX0/n8rEEW+pRZF84mSBrloXECHljPg5JUi3m3HbrcD3gC
 R79rLy6/vfQd6N+kI3lGNeiq3cEny2IEZ7Oy72ZmpwExkNEh3bmv2bcEBrKLCJ5NVfJ5
 aIsA==
X-Gm-Message-State: AOAM5334elinH3FB+E/33C5h5lzVbsPSjr40sbqMCNRXvE+Q9fjy5GVl
 c6rBEYh5f1J5NIebJMJHjEvFbpDmgQo=
X-Google-Smtp-Source: ABdhPJz/xXN23slPXAlWitYUAfSqvUhtv9YEq1tGosSlnK9ie8Rmoko6VRZ8BvxSUCDZQZnR1bxJfg==
X-Received: by 2002:a2e:85d8:: with SMTP id h24mr9419844ljj.274.1592870191746; 
 Mon, 22 Jun 2020 16:56:31 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180])
 by smtp.gmail.com with ESMTPSA id m12sm2932133ljc.59.2020.06.22.16.56.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 16:56:31 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id a9so21328218ljn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 16:56:30 -0700 (PDT)
X-Received: by 2002:a2e:8e78:: with SMTP id t24mr9595009ljk.314.1592870190539; 
 Mon, 22 Jun 2020 16:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200612013625.547-1-gurchetansingh@chromium.org>
 <b1b26b94-b0a5-6af8-a151-ad6310358708@suse.de>
 <20200612101650.2kp7wvpz5gfv3vyg@sirius.home.kraxel.org>
 <CAAfnVBn=3_ekqKXoUKMGMHw+VWxL2RK0mJO72vx79RvvUa8cPw@mail.gmail.com>
 <20200615072105.cvyh6wmepmqlhont@sirius.home.kraxel.org>
In-Reply-To: <20200615072105.cvyh6wmepmqlhont@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 22 Jun 2020 16:56:16 -0700
X-Gmail-Original-Message-ID: <CAAfnVBnzQHzbDgOKj_HOPeOF0Y0+9dsbiMVrkHSb4urfv3G30A@mail.gmail.com>
Message-ID: <CAAfnVBnzQHzbDgOKj_HOPeOF0Y0+9dsbiMVrkHSb4urfv3G30A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/shmem: add support for per object dma api
 operations
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 15, 2020 at 12:21 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Fri, Jun 12, 2020 at 11:54:54AM -0700, Gurchetan Singh wrote:
>
> > Plus, I just realized the virtio dma ops and ops used by drm shmem are
> > different, so virtio would have to unconditionally have to skip the
> > shmem path.  Perhaps the best policy is to revert d323bb44e4d2?
>
> Reverting d323bb44e4d2 should work given that virtio-gpu doesn't support
> dma-buf imports, but when doing so please add a comment to the code
> explaining why virtio-gpu handles this different than everybody else.

Done -- sent out "drm/virtio: Revert "drm/virtio: Call the right shmem
helpers" ".

>
> thanks,
>   Gerd
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

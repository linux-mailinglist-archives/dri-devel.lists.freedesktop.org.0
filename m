Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B3467298E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 21:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF4C10E83A;
	Wed, 18 Jan 2023 20:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C347310E029
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 20:38:07 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id bj3so313604pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 12:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SEbbH/UMi7mhLJTxAtXYqm1kXgdPVoWLCPyhz4xcgtg=;
 b=XXLBV70FnhGmEwNbUGoC/dELIFJuniWmQrNckfgER3vBIIcsqqkROzZ1SZja/A0sxA
 vva9xiPmBSsS/ZCln6Ax13OUJFuAswSHAMhYspSe37Pn+FHpt8JOx1sKqZWqIUWYkNsg
 gOjDlFzmjFQJMp25hQkAXagOMjjHnURTCbBTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SEbbH/UMi7mhLJTxAtXYqm1kXgdPVoWLCPyhz4xcgtg=;
 b=MoyQT1OaMbTgkpuhEs4f7Ua6cBBHEJ1J++MOPq1svypJ7q2Wo9B4wvdVrksL5yKn2c
 i0qnQCr1KAMlE6rVfYvKjaLeq/L+WwekDRmr2l27b7UQxxhDh2egUbSclLDpnvDAoToT
 AJDPFeV7+0xnuJ0MvQ+QmaOT+k+2sCWh1Yc7WiG6+OSygttYGtyyMCiB8LsK0l2bHM0v
 zqdBBB8tULOSoF94v6GSPFfALZEW0KRra+fzz1FJKB7OCtlrsrDflY9mVFRKUUjFjzzZ
 0rPnhrCW063sbkAqpKCiiHdygDowWdz6GG5c5Kj38ZenZy/D4YM119rve/Ijabt3x11V
 hehw==
X-Gm-Message-State: AFqh2kq/Iq0SAPCmJHdl2d0Y5IN+5aXgKv7iV0nF7qGa7XfcjN+M7JWu
 CaYDDOyEzu5+o+hMg60mrVgcRw==
X-Google-Smtp-Source: AMrXdXvTGd1Ph6IwQQ/i88zipRB2EfVxpj1z81G8vbnBbc8jB1as+U2VQXgEr++hrfN80BwOfwBKKw==
X-Received: by 2002:a17:902:bd4c:b0:194:bb2a:c8ce with SMTP id
 b12-20020a170902bd4c00b00194bb2ac8cemr3043341plx.16.1674074287337; 
 Wed, 18 Jan 2023 12:38:07 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0017ec1b1bf9fsm23423229plp.217.2023.01.18.12.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 12:38:06 -0800 (PST)
Date: Wed, 18 Jan 2023 12:38:05 -0800
From: Kees Cook <keescook@chromium.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: duplicate patch in the kspp tree
Message-ID: <202301181237.061950D0D5@keescook>
References: <20230117150212.3d8ee843@canb.auug.org.au>
 <CACO55ttvqwnmGS=4gig-AOy+67bDesdj2S9HDJ3hS=uyN0NGOQ@mail.gmail.com>
 <20230118075620.60250ca2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118075620.60250ca2@canb.auug.org.au>
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
Cc: Karol Herbst <kherbst@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 07:56:20AM +1100, Stephen Rothwell wrote:
> Hi Karol,
> 
> On Tue, 17 Jan 2023 14:52:12 +0100 Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Tue, Jan 17, 2023 at 5:02 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > The following commit is also in the drm-misc tree as a different commit
> > > (but the same patch):
> > >
> > >   06b19f46455c ("drm/nouveau/fb/ga102: Replace zero-length array of trailing structs with flex-array")
> > >  
> > 
> > which branch? Because I just fetched the remote and don't have this
> > commit in my local repo
> 
> That was from
> git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git (branch
> for-next/kspp) yesterday.  It was the top commit in that branch.  It is
> still there today (I am not saying it should not be).

I've dropped my instance of the patch. Thanks!

-- 
Kees Cook

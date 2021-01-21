Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3D42FE52C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6A26E4EA;
	Thu, 21 Jan 2021 08:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628016E4EA
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 08:39:31 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id 9so1379033oiq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 00:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kUfE6SE2n4SlWhNh9yX+hYT59DeJtvAevoxz9O0TUik=;
 b=TMAYX7QpeIeo0SfI4thWj5+xPv0DebVU+jxpSwtXWWoVQE84U3WmqKHg2Qft1tihQW
 DB2oOS44TFmyBNUiPyczVFFVRDnnzX7CXxrO4CSZqhf86MPvPEoVPiCfYRdJkxCu76vO
 imVq/j+2Imm/U2YKA+alPP8NkHUHRvLDmkeRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kUfE6SE2n4SlWhNh9yX+hYT59DeJtvAevoxz9O0TUik=;
 b=QFAvFVrMLmZ59xWNLRJrGru9RoCk2Z9IFzBNaJ4HAlzLQmQWWSMrx3OxFlhIso36+P
 Mm7j1TP10Y6eLsNSxAS4XH+XHMv2AOEt7PVh7SC9iNkZx5W++6+2U8lhGz2rtxnFAt9W
 vgosBbw67QKyiUSXjUUkhyV2qQqYSCSxYyOM3vHvojiwd5wleGmV1hQrPhrXmko5l5G6
 soD+A8e1GWMLCHJZC57y89OA5ksbtJPY5pdylSC+1dKyabc0xa7vihcn0e1Hf8nlU6uY
 vuKh3vtqBbqGniI7tC5FAeiJ5rVIrZd/R55Ko/Z4w6pD1iH1mrjrtElMsfALq1Mt1Bbc
 I1Cw==
X-Gm-Message-State: AOAM531V+x2EhBbp7kIsHBAKL5USiYgYwx1/ACUHT0ZD64a1a37yRzTw
 M3neXtJX0BR42ZvJjl4cKJIaz21Kghq6DVuobOU7/w==
X-Google-Smtp-Source: ABdhPJwdBtD3B1cBobpcMyhJG7mZaplWKuBOFYhagzM+X5GOmA44nSE9377UdftyPqlQOfXqfDOSago3v5JpojgiclM=
X-Received: by 2002:aca:ad92:: with SMTP id w140mr5422725oie.128.1611218370352; 
 Thu, 21 Jan 2021 00:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-9-hch@lst.de>
 <CAKMK7uFo3epNAUdcp0vvW=VyWMMTZghGyRTPbz_Z37S6nem_2A@mail.gmail.com>
 <20210121082820.GA25719@lst.de>
In-Reply-To: <20210121082820.GA25719@lst.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 21 Jan 2021 09:39:19 +0100
Message-ID: <CAKMK7uHKwpjTC8DZ=yDtHpEaLXN7D5C+mOGK52jjkdR=6vib3Q@mail.gmail.com>
Subject: Re: [PATCH 08/13] drm: remove drm_fb_helper_modinit
To: Christoph Hellwig <hch@lst.de>
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
Cc: Petr Mladek <pmladek@suse.com>, Jiri Kosina <jikos@kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Masahiro Yamada <masahiroy@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michal Marek <michal.lkml@markovi.net>, Joe Lawrence <joe.lawrence@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jessica Yu <jeyu@kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, live-patching@vger.kernel.org,
 Miroslav Benes <mbenes@suse.cz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 21, 2021 at 9:28 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Jan 21, 2021 at 09:25:40AM +0100, Daniel Vetter wrote:
> > On Thu, Jan 21, 2021 at 8:55 AM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > drm_fb_helper_modinit has a lot of boilerplate for what is not very
> > > simple functionality.  Just open code it in the only caller using
> > > IS_ENABLED and IS_MODULE.
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >
> > I didn't spot any dependencies with your series, should I just merge
> > this through drm trees? Or do you want an ack?
>
> I'd prefer an ACK - module_loaded() is only introduced earlier in this
> series.

I was looking for that but didn't find the hunk touching drm somehow ...

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

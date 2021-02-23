Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5171A3223C7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 02:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DBE6E430;
	Tue, 23 Feb 2021 01:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A166E430
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 01:42:56 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id q14so61284678ljp.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 17:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RDooO6fVmEytrmsO+OdxP0t5z+1dW14dWuhPYDbhrNw=;
 b=TOQ2+I+mHXr+E4ckMqzQngYTWUZIiJAMZ4kPqTle0k554YS65ZycN+V9HItvfQ50zr
 EZoT+MbgL+/zfMBRgcqu5UVoaIVwhD+SMKXUFtegjKSZY4TW2k7+/++d/M+F9xtNPSR4
 QNS7Z4Yl0m5J+4tzYKAjfLF5jYN/rQ/3C6zUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RDooO6fVmEytrmsO+OdxP0t5z+1dW14dWuhPYDbhrNw=;
 b=T081tsHPV1X3vh7GdjltH14gcFsDEY5nJ+XZ6dBhBketWoH1Usf+rkWLlFo8x1H1Pt
 c2Jf+tU0wwaov/iaDzDf4EfsWyyYuSxKwaUvfSFmEu/P8sCN2BxMauDD8nftA02h75xO
 TaIFyFRvwYaMwSICv3BAQriMlRM+1xAamrOCtunNIIc3AAdH5FQDKxvaeLTGCtXNdNjz
 hZbsrXNi3z/HQt9iIPd/SsMrVeMO6VssaNqneZk8ftXChZ6gyNZSsFb4jrSvGsYju4oj
 deL4z4x20Kja4oIdBXzO5K1bULYEDmfm73kszibvGmKorn6cOHEkIq0uPspjQXy4eiwh
 F2OQ==
X-Gm-Message-State: AOAM532m0wUqVpfmBijuQZ7J09aWc//MtQ/CjcLvBm3uFdk2frddVllT
 ARyTs6BxCMtDmxWZTahhKLcj0fT91XB5lQ==
X-Google-Smtp-Source: ABdhPJywBvdQZ72mBydfg/zPG2GOnY6WGU1AXp+8gVxgNe2M4wE+uUHq9fPlt4X8ho/S8dOIm4o6WQ==
X-Received: by 2002:a2e:9795:: with SMTP id y21mr13678983lji.226.1614044575017; 
 Mon, 22 Feb 2021 17:42:55 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41])
 by smtp.gmail.com with ESMTPSA id c16sm2248045lfb.36.2021.02.22.17.42.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 17:42:54 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id e7so8927315lft.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 17:42:54 -0800 (PST)
X-Received: by 2002:a19:6916:: with SMTP id e22mr14384009lfc.421.1614044573962; 
 Mon, 22 Feb 2021 17:42:53 -0800 (PST)
MIME-Version: 1.0
References: <YDOGERvNuU3+2WWe@phenom.ffwll.local>
 <CAKMK7uHQ=6OJcRguCUtiB456RWdCfwSNEXV8pQsfsPodTJ6uxw@mail.gmail.com>
In-Reply-To: <CAKMK7uHQ=6OJcRguCUtiB456RWdCfwSNEXV8pQsfsPodTJ6uxw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 22 Feb 2021 17:42:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjNv9izaVO5+1n5zk01zP3mndqdd2zKsX_syq9ntgY2YQ@mail.gmail.com>
Message-ID: <CAHk-=wjNv9izaVO5+1n5zk01zP3mndqdd2zKsX_syq9ntgY2YQ@mail.gmail.com>
Subject: Re: [PULL] fixes around VM_PFNMAP and follow_pfn for 5.12 merge window
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Linux MM <linux-mm@kvack.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 2:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> Cc all the mailing lists ... my usual script crashed and I had to
> hand-roll the email and screwed it up ofc :-/

Oh, and my reply thus also became just a reply to you personally.

So repeating it here, in case somebody has comments about that
access_process_vm() issue.

On Mon, Feb 22, 2021 at 2:23 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> I've stumbled over this for my own learning and then realized there's a
> bunch of races around VM_PFNMAP mappings vs follow pfn.
>
> If you're happy with this [..]

Happy? No. But it seems an improvement.

I did react to some of this: commit 0fb1b1ed7dd9 ("/dev/mem: Only set
filp->f_mapping") talks about _what_ it does, but not so much _why_ it
does it. It doesn't seem to actually matter, and seems almost
incidental (because you've looked at f_mapping and i_mapping just
didn't matter but was adjacent.

And generic_access_phys() remains horrific. Does anything actually use
this outside of the odd magical access_remote_vm() code?

I'm wondering if that code shouldn't just be removed entirely. It's
quite old, I'm not sure it's really relevant. See commit 28b2ee20c7cb
("access_process_vm device memory infrastructure").

I guess you do debug the X server, but still.. Do you actually ever
look at device memory through the debugger? I'd hope that you'd use an
access function and make gdb call it in the context of the debuggee?

Whatever. I've pulled it, and I'm not _unhappy_ with it, but I'd also
not call myself overly giddy and over the moon happy about this code.

             Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

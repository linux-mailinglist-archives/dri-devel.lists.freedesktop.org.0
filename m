Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C7A44F583
	for <lists+dri-devel@lfdr.de>; Sat, 13 Nov 2021 22:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779006E062;
	Sat, 13 Nov 2021 21:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413656E062
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Nov 2021 21:35:30 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id v7so34216998ybq.0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Nov 2021 13:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mSXJ3uMUoVuuhGKC/oVSm8bEZNFwZL8IbH9GMbqinz8=;
 b=dkaTRJTRIi4ZifpY9ICa/j7nErEweW4HufoKRtFVlWbkDqfE4ttOCtu7D5UAdvMdgM
 PWs9pViYlrbvAtah2pdcHABvOMfIs0sZlVgdDFdbzbzPz2qxb5Zc5BAnRhtc2vU8s2u4
 f96KLpJKEmp/G/mmEkgTXD+UJ8eZ7EO9ENCU8FuPCqr0uhYFEf59rUGKutg4J8bXgU0V
 fkW4Tdf4cC2QgTk941IQoGtpRpl2n+7AXMqSRU1jm6y8Or5cHZ+XM4AK6Y9OW6xlu57r
 4yTL12Ous6bHQraMdkCLQTtwlIRAY7mxzuOlGD00jNimEmG7l3bwEIUnk1bDoAA8R86T
 xFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mSXJ3uMUoVuuhGKC/oVSm8bEZNFwZL8IbH9GMbqinz8=;
 b=cadAhIm2xBy2Dx9fUzWj5ZM8tbaa3sFLYy5w4v+Stp0Ur1JwkZ39OB32r0VgLLT+So
 FNdCFaEgbKLXCrQ1WfjC5mHUZam7nt9L8Idyfu74RrTjOBGCMF33N7PKC34LDwI/xhep
 AIeCQcYdlXYAXBRzUmC7LFlKY7E/ZELSroSKYzDo4LREautDUVAYq//Yo6hG0gDpbz6p
 8c7FWSUQdL+RWXJuhs5dC8njJAyIHK5Y8hJNiO22yzudrsjOMIDHj33w+VX5cDq3Ij9v
 +6/wRn9Qbi8DdUd/JRjprewfw6FiCL/FGiVx+0NB/rgoG79FABakkLHuHY93cchRHxpC
 tArg==
X-Gm-Message-State: AOAM530OvyydCMsVOrfhxMsnOYwwbu3CBeyO4nIYoKbxZpSX5+QoD6hu
 //5wZCSNagwU6ApkjNMrfvQZK0tlKYGitSL3p8Q=
X-Google-Smtp-Source: ABdhPJxiyniWoK2HoBAw4yOk/7IK6gECxvBOuNXSV39rmBpeaxcPXsgNhCEjQ1hAuKN5hNQecWTsHtNVolyHlBLYX3w=
X-Received: by 2002:a25:488:: with SMTP id 130mr27073299ybe.346.1636839329289; 
 Sat, 13 Nov 2021 13:35:29 -0800 (PST)
MIME-Version: 1.0
References: <CADVatmOuOk6RoZF=M9sZm2L=9NuDDsSNNCJJbAtkgScG0og1Ww@mail.gmail.com>
 <CADVatmP_Sn+SS5Yu5+7sJJ5SVpcaZcW8Z_Bj5vmYz9g3kJD86g@mail.gmail.com>
 <CAADWXX80QGk7MwZ7A-n+1+GHv=yrA0qrw-70Z=pFSEsc3UXfgQ@mail.gmail.com>
In-Reply-To: <CAADWXX80QGk7MwZ7A-n+1+GHv=yrA0qrw-70Z=pFSEsc3UXfgQ@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 13 Nov 2021 21:34:53 +0000
Message-ID: <CADVatmN7rQYhWJQao3qXz7TZxz5piN+kN4g4tV_wYC4=uxtgtA@mail.gmail.com>
Subject: Re: regression with mainline kernel
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Verne <nverne@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On Sat, Nov 13, 2021 at 5:07 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> [ Hmm. This email was marked as spam for me. I see no obvious reason
> for it being marked as spam, but it happens.. ]
>
> On Thu, Nov 11, 2021 at 12:52 PM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > # first bad commit: [cd7f5ca33585918febe5e2f6dc090a21cfa775b0]
> > drm/virtio: implement context init: add virtio_gpu_fence_event
>
> Hmm. Judging from your automated screenshots, the login never appears.
>

<snip>

>
> HOWEVER - it has had a fix for a NULL pointer dereference in the
> meantime - can you check whether the current top of tree happens to
> work for you? Maybe your problem isn't due to "that commit does
> unnatural things", but simply due to the bug fixed in d89c0c8322ec
> ("drm/virtio: Fix NULL dereference error in virtio_gpu_poll").
>
> And if it's still broken with that commit, I'll happily revert it and
> people need to go back to the drawing board.

I sent another mail yesterday which is now at
https://lore.kernel.org/lkml/CADVatmOOzCxAgLhCu1tTz=44sgRDXds5-oMZ3V0w4f5kLCLKrw@mail.gmail.com/
I will just pase that here for you.

Last night's test on 66f4beaa6c1d worked fine. So I guess this has now
been fixed.

I have not done a bisect to see what has fixed it, but looking at the
log I think it will be that NULL pointer fix.


-- 
Regards
Sudip

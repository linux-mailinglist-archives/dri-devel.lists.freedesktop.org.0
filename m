Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ABC53C81B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 12:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E93A10E252;
	Fri,  3 Jun 2022 10:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A26510E252
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 10:08:35 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id t31so12906860ybi.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 03:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dj6pd1F7ebtF7vxC+sIBTfCQWfkigtaU6Dwml32wtig=;
 b=UhGJOTVLyW0SsrOt+FCwa3NU60YcyPDrwv2hKBmcElZAB5v5tIJxI5Wa6hHB2X5n6V
 1cUZQVsKoAejC/6fivIRnlcnFN0b0tqJ8DDnRCPjobedtk4xjcjQF3zSueC2KqUU+JEj
 eC1gNnLdZwwxPjVXO28JBKhCcWDFgUALZLUyXh0t3NSfG5Z3241YZg7vLtrG01NLTJDC
 lk4PviAnQ1GUROclXZJGGAE85URoXb89YGiIEpUL9K7yDtF4jAO4uZVTDDd7gZrWgGQ2
 smftkCmX0omFzOfu3Obvs/CVvsJQIDWuZu+uOjseRlpJIiC2XE+JRPTf/Y75emn6VAtx
 XDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dj6pd1F7ebtF7vxC+sIBTfCQWfkigtaU6Dwml32wtig=;
 b=15xe64dyTCkxZwXNddANXeuQgv4rjbn9us2Z0gCXjOZQZUha6V756BVQ+b0qFTTPAy
 E38WsLrHTm2/upv5dZAnfU74sVI4Yq9QKgow9V5cVvjnLbOW3wYDbLHChekWj8Cdm7/e
 fRaFDL8veeqjMG1mWXEUxANNI8kyjqYZqU2wkBfQDPC9o7UiitAsGz4bk5w+5hQzZWli
 8zd0yMQmhGNf1AABb4r7k+VkApvCNdTjS9kOIO7966FLCUz7ASdEkwmGJjazRdqti9pA
 wfvbXOdqq7Sv2BO/0h18Yb0UUfS8nMDj2aKwFTLyf5gvUi9ZZ+Y/hzICdTnHvznBSVkE
 k8iQ==
X-Gm-Message-State: AOAM533MxNXmLnv/7VKTYx6HxgCmCk3XFnjBrhsuu0faSzkvvWOoPmI6
 9t29E2n+iUdCuV3ZRFKtvuMV9IryIRRiZLFJhon2eg==
X-Google-Smtp-Source: ABdhPJxt2sVQrvFBU5KCkLratJIUjgQLLPOPqrPIuCg/LMDUqF5GnS+0ZJS5M98cWBAc80G9N5kCC6NlS+XtLKiMrfI=
X-Received: by 2002:a25:d044:0:b0:65c:b987:d884 with SMTP id
 h65-20020a25d044000000b0065cb987d884mr10176567ybg.399.1654250914216; Fri, 03
 Jun 2022 03:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <20220601004014.158247-4-bas@basnieuwenhuizen.nl>
 <e4d8ea99-ceb5-b0dc-362f-94e37b9ddc6b@amd.com>
 <CAP+8YyEy8R3nbJVFkqHnh=3VsmfWKsQyY45tcWTQhm3hujBRbg@mail.gmail.com>
 <e502a4b7-e927-2abf-9014-0b23d15d401b@amd.com>
 <CAP+8YyHdbrvA-sJ=VZccmLkyZ9WCO7CnOp5K0pMoXA=MrHLCsw@mail.gmail.com>
 <bd850268-8324-79cb-854f-b0c843f9581b@amd.com>
 <CAP+8YyGuU_fBMLkSuqBMk7uy-F=BAaopWS-Vxi=-E0P5LGbsRQ@mail.gmail.com>
 <ea49dfd3-3c20-c330-3412-5b48481331cd@amd.com>
In-Reply-To: <ea49dfd3-3c20-c330-3412-5b48481331cd@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Fri, 3 Jun 2022 12:08:45 +0200
Message-ID: <CAP+8YyGgam6Hr40PS_Rc7Dg=S2dLJdce=87=wNt2B0yAyPEPOw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 3, 2022 at 10:11 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 03.06.22 um 03:21 schrieb Bas Nieuwenhuizen:
> > [SNIP]
> >> The problem is we need to wait on fences *not* added to the buffer obj=
ect.
> > What fences wouldn't be added to the buffer object that we need here?
>
> Basically all still running submissions from the VM which could
> potentially access the BO.
>
> That's why we have the AMDGPU_SYNC_EQ_OWNER in amdgpu_vm_update_range().
>
> >> E.g. what we currently do here while freeing memory is:
> >> 1. Update the PTEs and make that update wait for everything!
> >> 2. Add the fence of that update to the freed up BO so that this BO isn=
't
> >> freed before the next CS.
> >>
> >> We might be able to fix this by adding the fences to the BO before
> >> freeing it manually, but I'm not 100% sure we can actually allocate
> >> memory for the fences in that moment.
> > I think we don't need to be able to. We're already adding the unmap
> > fence to the BO in the gem close ioctl, and that has the fallback that
> > if we can't allocate space for the fence in the BO, we wait on the
> > fence manually on the CPU. I think that is a reasonable fallback for
> > this as well?
>
> Yes, just blocking might work in an OOM situation as well.
>
> > For the TTM move path amdgpu_copy_buffer will wait on the BO resv and
> > then following submissions will trigger VM updates that will wait on
> > the amdgpu_copy_buffer jobs (and hence transitively) will wait on the
> > work.  AFAICT the amdgpu_bo_move does not trigger any VM updates by
> > itself, and the amdgpu_bo_move_notify is way after the move (and after
> > the ttm_bo_move_accel_cleanup which would free the old resource), so
> > any VM changes triggered by that would see the TTM copy and sync to
> > it.
> >
> > I do have to fix some stuff indeed, especially for the GEM close but
> > with that we should be able to keep the same basic approach?
>
> Nope, not even remotely.
>
> What we need is the following:
> 1. Rolling out my drm_exec patch set, so that we can lock buffers as need=
ed.
> 2. When we get a VM operation we not only lock the VM page tables, but
> also all buffers we potentially need to unmap.
> 3. Nuking the freed list in the amdgpu_vm structure by updating freed
> areas directly when they are unmapped.
> 4. Tracking those updates inside the bo_va structure for the BO+VM
> combination.
> 5. When the bo_va structure is destroy because of closing the handle
> move the last clear operation over to the VM as implicit sync.
>

Hi Christian, isn't that a different problem though (that we're also
trying to solve, but in your series)?

What this patch tries to achieve:

(t+0) CS submission setting BOOKKEEP fences (i.e. no implicit sync)
(t+1) a VM operation on a BO/VM accessed by the CS.

to run concurrently. What it *doesn't* try is

(t+0) a VM operation on a BO/VM accessed by the CS.
(t+1) CS submission setting BOOKKEEP fences (i.e. no implicit sync)

to run concurrently. When you write

> Only when all this is done we then can resolve the dependency that the
> CS currently must wait for any clear operation on the VM.

isn't that all about the second problem?


>
> Regards,
> Christian.
>
>

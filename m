Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9645039FAD6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 17:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B556EC1F;
	Tue,  8 Jun 2021 15:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BF76EC1F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 15:35:06 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so20704720oth.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 08:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sMoXBkw/6VnQXl6I1wMnDP0ahC/bC76SewCjrwCJKBs=;
 b=CUnAZhY6iJ4PDLb8j108KJdMZ10x1DWpOpGnJrlm0QBaFEuGFAPo50Cy8I0GJLxjgI
 iqRdTlEMcIQkfTE3A/CMLtQ4qdcZX5jOgGPxu9QwCJyuDuXlMf9i5UEtnUPR5cIJUZGg
 rp7iIwP53sXSqmHyKNxFxCH/BvnWJsrp3/7jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sMoXBkw/6VnQXl6I1wMnDP0ahC/bC76SewCjrwCJKBs=;
 b=CSaWMOSYGeRuji2TyCqUrwux75rrIjthAPeWfIYBYQ9lAlo7wcsaevFmgjTAjr8mBy
 kotF3BKks0MnzXkKYVMehT2K1hENgYP1Z/4Nex1rcPdAlIy+otSPoBOaZ8+gruS2BgA9
 WWpiyMUrJZJo3+gstJhUhxWJ4DLVobLTvMnBtY4phCp3eqctW7TiuGzWU+TOAFZdNmKB
 YPxuFeavg4z/xQUWhbiWGXsetbn1JGswOR14ncEq7INkE8yMJrpI4XNeisF4XkobZpGZ
 Z2wE82oS9RsDVfVcFYdec+DYV7abeQ/OfpxdTncQJwoKH+gxdpkjUPJBHbFdwUfX033k
 j+Ow==
X-Gm-Message-State: AOAM532kGynfpDsu06H5MxTzpkyYxdeKnmiSFjP5Lcx/ztPKuE2InxZ0
 ZfV2QmshpUaIx8CODLIxdYWQseyg8e+bs+WNLXiQlQ==
X-Google-Smtp-Source: ABdhPJywnkjYAYes1hntiSne4snNodBfxWCTNMmcXik3Pj9skFwB/cYZmglLmN3MnLBq2g/ANPKmxHgOwYzRQ0u9x4s=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr19157394otb.281.1623166505569; 
 Tue, 08 Jun 2021 08:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAJeZQfg5fq8B7iVu6Wga+aM015o_ViiSUcJxAEtDE9-GXxgSOw@mail.gmail.com>
 <820078f3-1adf-d561-1772-f63de6d46ed6@daenzer.net>
In-Reply-To: <820078f3-1adf-d561-1772-f63de6d46ed6@daenzer.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 8 Jun 2021 17:34:54 +0200
Message-ID: <CAKMK7uFNwzb3Jn3tVOWZS8w5gRbdvwa8=rjbUop+BPF_K2=36w@mail.gmail.com>
Subject: Re: [QUESTION] drmModeAtomicCommit returns -EINVAL on return
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: Sichem Zhou <sichem.zh@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > 4. Do I need to wait for vblank for modesetting? I know it will be an
> > error if I tried to do drmModePageFlip before the last one is handled
> > but what about drmModeSetCrtc? Do I need to wait for a vblank for the
> > last pageflip?
>
> Right now, if you don't wait for any pending page flip to complete before
> drmModeSetCrtc, the two may race, and the CRTC may end up scanning out from the FB set by the page flip.
>
> Maybe this race should be prevented in the kernel though.

Maybe this could happen on non-atomic drivers, but on atomic drivers
there's no race, the setcrtc will wait for the previous pageflip to
complete first. Ofc if you call both from 2 threads at the same time
then either could win, but if you do one after the other there's no
ordering issues with atomic drivers.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

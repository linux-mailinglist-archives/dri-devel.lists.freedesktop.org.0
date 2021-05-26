Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C4539162D
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 13:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A8E6EC8E;
	Wed, 26 May 2021 11:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247376EC8E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 11:31:49 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so3179114wmc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 04:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=na04oW4mV9JUbUOkPBvtY3i7UUnCGjgsNBXRaPL+9HI=;
 b=kygoKcsCkhZF7xK2h2EW3cNA127jLS2NUhKSE3e+Zf8beC0blTEYuSwkSwxo451z8A
 3OKeyFUrmZbla+5W2THkUYZFKpaQK/4lCt1kZrxp5diR8oYbmmwXtyH7btcudU5Pnxpg
 WNtzcZQy+c90Uf3a5dC++gLpbplW/FJ4oU/EjBLJE5GMMWq1PUW6KVS7rVGPX1FL69cA
 mYGJUW8ghVpdUGzAauH9ZwijCQipNwgLrdiUDjPjItBHnwXW6fjqmfVmeS4CBq8KbX6F
 TgTe10Iq4hpUNcsicb11BM8o283/yQ3BXwp6TrgdYJRm8uFMVQ9lkE/jCN1xzXcMvTMR
 2l9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=na04oW4mV9JUbUOkPBvtY3i7UUnCGjgsNBXRaPL+9HI=;
 b=duhfwybWPL3HvgfUym6/KsHAywETQlc3Yrv1n95nmbSgD3ou5OoM4X9zLJRwL68+dN
 MWbY9BU9SOVgapetDSES+tecuFIpEcu4jj84mpSzhNXZUxSyejAs7CDcRCXYlRt//Kq4
 9c9K56liWejPSGBlLVxvyD+Scl3Idr+0hqBHXP5fHowX3VUrGOrBqGpp3f5/yOFuIc62
 dWe+H1cH2LET1IwVUDUfI+3wglPN/AZtUx2pRaN0l8FOestNyIu7ciwpBrBhZfBt3vnR
 Gc1aitTvo+s0CRJ52E6+P2VTs6D61W8qIisY6g6yU3GHaQUxmvaOOvGgDRvFYFK8v1A3
 A2mg==
X-Gm-Message-State: AOAM532b2dojD6dvxrS6slgKLKgreJlgy8Bx2Yw+oC8VgacbnFYJAFe+
 OcBtSNUw/GvlIxoqyxpor3tVjZxJ0GUANAEGh+V8aW8oLuUXmg==
X-Google-Smtp-Source: ABdhPJxZkxbaszLDV15dnDg1K+a2cwS/HjXOalgpXScXxcaMPhGlWzZALL24GqXWBGoLriEZblFHox5LuNlOVUFtjD0=
X-Received: by 2002:a1c:7c03:: with SMTP id x3mr2975475wmc.168.1622028707726; 
 Wed, 26 May 2021 04:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210525211753.1086069-1-jason@jlekstrand.net>
 <20210525211753.1086069-6-jason@jlekstrand.net>
 <acc1737c-261d-9da5-7ea7-759063136c56@amd.com>
In-Reply-To: <acc1737c-261d-9da5-7ea7-759063136c56@amd.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 May 2021 12:31:36 +0100
Message-ID: <CAPj87rN_7vmmWcL1vqhvM=etaTjwts_L0vYbsgvYF0_qZw83gw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 5/7] dma-buf: Add an API for exporting sync
 files (v11)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Wed, 26 May 2021 at 12:02, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
> Am 25.05.21 um 23:17 schrieb Jason Ekstrand:
> > This new IOCTL solves this problem by allowing us to get a snapshot of
> > the implicit synchronization state of a given dma-buf in the form of a
> > sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only=
,
> > instead of CPU waiting directly, it encapsulates the wait operation, at
> > the current moment in time, in a sync_file so we can check/wait on it
> > later.  As long as the Vulkan driver does the sync_file export from the
> > dma-buf before we re-introduce it for rendering, it will only contain
> > fences from the compositor or display.  This allows to accurately turn
> > it into a VkFence or VkSemaphore without any over- synchronization.
>
> Regarding that, why do we actually use a syncfile and not a drm_syncobj
> here?
>
> The later should be much closer to a Vulkan timeline semaphore.

How would we insert a syncobj+val into a resv though? Like, if we pass
an unmaterialised syncobj+val here to insert into the resv, then an
implicit-only media user (or KMS) goes to sync against the resv, what
happens?

Cheers,
Daniel

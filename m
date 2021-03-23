Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3123463D7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191D06EBF6;
	Tue, 23 Mar 2021 15:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E226E6EAC7;
 Tue, 23 Mar 2021 15:56:48 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id h7so15250178qtx.3;
 Tue, 23 Mar 2021 08:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IMAXOeMCmHISnBiyYcozhcxjqWzJCMeASWbcLY3tejg=;
 b=PghWVCulPgPDyWiR3yhOZXaME8CVwLM4neONAGz/JEKwD7HdOlUkr5JWQij/ns82aZ
 TrBkTlArRYbA3iaStJ40XLz1L78VihgiFGppQknzFn9RD5QVRymzpDNsofNsKsVP0NgJ
 wjHE3b/OveAdGpygMyg3F9kMAXyfU1ODHYWaeDpsAkaqAZN+RTFYTpKoUrxyr1fnJX2Z
 jmALKD1ep6hoq/0tDDnb1hLLQ+6cOvWWMutdHFNd+2PcBdXxGQmpAVcR6yJLboijJsm+
 b6aIoglqtPkPYpsx/j7mi/awBBnukYllABE0H4a8b27ye908BrUqVf0ECBzN1nD6IQKI
 3NUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IMAXOeMCmHISnBiyYcozhcxjqWzJCMeASWbcLY3tejg=;
 b=Ybdnsef+kbWobkzTye0QjAa8GB6CJpWKchK2TvBGQfOurh93xEgBSqAjP2xWOmNti+
 xeozkcsK1XNUvR6sRfNnzAL2vACJEfoQfsmzHXX3nOvBx0GqCkLh/11i3/e1v6UaQ4l2
 afJuM1rqUe7GyF72y6x2QZqu34xmiWd2qg5N09+EBnY9AvNg7cJoY6up2raG1vciFJQp
 03IH/Dd9d1hfWMwJ2bbi2GCzGZ9Jjw5abhuSa//Fzwr9FFy5DEcRaHkRq5LTDtxD4yqd
 Tl7cdw4f0uSMvurC8fKg/UnoN1moKNUEm4S2A8GT2od85Z46AtvDArAKfwEYcNC8hwAR
 ZuGw==
X-Gm-Message-State: AOAM532qr0wAWFzrXeGH5a2AW7Z5lYB+hCyMr8iSrxu0tTF9++Jsdr8q
 lIKG2qWGhbZ2EWCnh/6241sHrJy7G91MQKavoWc=
X-Google-Smtp-Source: ABdhPJz5rXYxQvF8t1BFosimrPIlU0yugBnGi/VGvMRXFOBaGWQN4uWQAPfKmdE5kQErSMVnJG3W1DN7ULX+JICdFmA=
X-Received: by 2002:ac8:7dc2:: with SMTP id c2mr4942378qte.341.1616515007984; 
 Tue, 23 Mar 2021 08:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210318170419.2107512-1-tvrtko.ursulin@linux.intel.com>
 <20210318170419.2107512-6-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210318170419.2107512-6-tvrtko.ursulin@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 23 Mar 2021 15:56:21 +0000
Message-ID: <CAM0jSHOXtwEukFb0ugS8r2_wJFKxb-XHunzvmMFGvvWWp20KwA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 5/6] drm/i915: Fail too long user submissions
 by default
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 18 Mar 2021 at 17:04, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> A new Kconfig option CONFIG_DRM_I915_REQUEST_TIMEOUT is added, defaulting
> to 20s, and this timeout is applied to all users contexts using the
> previously added watchdog facility.
>
> Result of this is that any user submission will simply fail after this
> timeout, either causing a reset (for non-preemptable), or incomplete
> results.
>
> This can have an effect that workloads which used to work fine will
> suddenly start failing. Even workloads comprised of short batches but in
> long dependency chains can be terminated.
>
> And becuase of lack of agreement on usefulness and safety of fence error

   because

> propagation this partial execution can be invisible to userspace even if
> it is "listening" to returned fence status.
>
> Another interaction is with hangcheck where care needs to be taken timeout
> is not set lower or close to three times the heartbeat interval. Otherwise
> a hang in any application can cause complete termination of all
> submissions from unrelated clients. Any users modifying the per engine
> heartbeat intervals therefore need to be aware of this potential denial of
> service to avoid inadvertently enabling it.
>
> Given all this I am personally not convinced the scheme is a good idea.
> Intuitively it feels object importers would be better positioned to
> enforce the time they are willing to wait for something to complete.
>
> v2:
>  * Improved commit message and Kconfig text.
>  * Pull in some helper code from patch which got dropped.
>
> v3:
>  * Bump timeout to 20s to see if it helps Tigerlake.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A43E469976
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 15:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A01F6FC60;
	Mon,  6 Dec 2021 14:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556B66FCCB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 14:49:23 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id 131so31942885ybc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Dec 2021 06:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zDxkDL2OOqNPzqfqrMq15H6lv1cXQjh2+X+cYv9aUEs=;
 b=KrEKnxWGYBHWXaVfaEpB8cdbR7IQR/yw8j4Ok2dsE8zvV3OHADAr7CgcWehfXxW6Ka
 Z5rjRtmmn57xi/6VA1NFpxxaF33hKZSK+wIfmFJsEpG5mXkjJC8HJkw4YQiHVmHgi2Pd
 ggFDW5R8bYHBOzpXK2/pENeRyZ45ynzYp9OKdZwvrtSgWPVJIsOKsUVYlY/Hi3b6klKv
 5kWtV5+1llMQwjeLRZpLDUW4YZOiNjlmQnl011RDlyO4R0TRKNkA9NQvVgFdS1S3S5jz
 ObXtGnQSa24L+jbvVg3kQFG9Rna0SZ23PwGjx6JNd0vq43DYUzmk5oDQitOKoIl9Khb6
 ztFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zDxkDL2OOqNPzqfqrMq15H6lv1cXQjh2+X+cYv9aUEs=;
 b=0yFxZEKViK0fwVgCly+R7EnYGJZbcw6nBpVSUyKn7b66IyQEP3BqjDL5AixrpURSeL
 CibivmnCD4sONQoMeQ0mh3muJ0DychG3q3JrJmtu4k3+PD0QH6pV1XP4GNkM5VOSFab7
 tihzkiivenc32SST2oYTpo2Z3suohIIAnDkjPxDxSNoYdEuDOFz9LTdRJnEqJoiUglMx
 J8UC9bYj1e9QWDLSt8fP7ph7tjEWl2oJ2gafQj7hRA8e7wxUUXJAbV4JJqSmVQx1kLbN
 lC0u5iT/Uhlsww2QxyA3db0Dr3fQWX/HDQ07MYXiu7P48IAa29wCGeD3Rbd0aUlbXNDu
 QNyQ==
X-Gm-Message-State: AOAM530wBgv1ExfF60JInZVPmbsDfWxEUb1bE8Wb5aTuO8wo2yDMEx5n
 utigyYMC2H3L3+yx+TIZmdJuAdS4QHyJ6ltHXc80iA==
X-Google-Smtp-Source: ABdhPJzywfO33VUvzdEQ6eiiMqE7/3fLMVJK5noAum/X0wBZ4L7GKJVVjs/cY3Sl2y6vV/Q+AHhA1VDEbHdprZE93Ao=
X-Received: by 2002:a25:6ed6:: with SMTP id
 j205mr44077096ybc.707.1638802162383; 
 Mon, 06 Dec 2021 06:49:22 -0800 (PST)
MIME-Version: 1.0
References: <20211206133140.3166205-1-matthew.auld@intel.com>
In-Reply-To: <20211206133140.3166205-1-matthew.auld@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 6 Dec 2021 14:49:11 +0000
Message-ID: <CAPj87rOuZpEcHoO-4nJ-ndvfR32FE82iFfJFV2kUZ=u-PtPvwg@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] DG2 accelerated migration/clearing support
To: Matthew Auld <matthew.auld@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthew,

On Mon, 6 Dec 2021 at 13:32, Matthew Auld <matthew.auld@intel.com> wrote:
> Enable accelerated moves and clearing on DG2. On such HW we have minimum page
> size restrictions when accessing LMEM from the GTT, where we now have to use 64K
> GTT pages or larger. With the ppGTT the page-table also has a slightly different
> layout from past generations when using the 64K GTT mode(which is still enabled
> on via some PDE bit), where it is now compacted down to 32 qword entries. Note
> that on discrete the paging structures must also be placed in LMEM, and we need
> to able to modify them via the GTT itself(see patch 7), which is one of the
> complications here.
>
> The series needs to be applied on top of the DG2 enabling branch:
> https://cgit.freedesktop.org/~ramaling/linux/log/?h=dg2_enabling_ww49.3

What are the changes to the v1/v2?

Cheers,
Daniel

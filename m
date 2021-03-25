Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DA3348C94
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F421F6ECE2;
	Thu, 25 Mar 2021 09:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50826ECE2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 09:17:30 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 91-20020a9d08640000b0290237d9c40382so1259900oty.12
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 02:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uqM5RcWv3gBYUBIUqTALfbCuCfO15MflsU9/Ih/+77U=;
 b=exMhvdi51JJfL0WwdDY/iGvy93AIqM5lqR30A5hqVqPpEu9JiaEYA9Fc2fjaMTqW9h
 GJS251BNbfKI9jfrY27TbvMCCZ4UrwhPBHXJEWsZMTTsLsx32HnXFKAqeDbpAwLktHdL
 nyF+p0gdJN+16JqoOjKga4MTNjQhsKv/VSa1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uqM5RcWv3gBYUBIUqTALfbCuCfO15MflsU9/Ih/+77U=;
 b=DPPlRrNcDI71nToKIhgvz8AiZL6NMQPc2nxp4PEEO90/tO49j5T+trdbR2mQaBAEgB
 OzwAIjoO/sQO/0k89tdeo5YQ8VSYFQPFMEQ9xerVt8YjsNBRuLqDEb0PZvLvNx75oetV
 qWLG9788Yy0c3pX3+FLt1QH7BqdVbH04DFZI2OMcg8vFfwKkEgj/Lj9ogBAOvlWrh5o9
 E2VlrE6zohJGmtAO5vQL4wrtlPI8bzFvF+Haxm8BslFeX9CpYunxwAmt0HElN5HwJOcO
 vW7VzNW8c71/PS9xzlXU3piEzJucKwvOnmE6yS5ypraSDXerMAYbPsZnAOZi1UT02xc4
 f0UQ==
X-Gm-Message-State: AOAM531ItAfbvYdz4pUoMoHQKJmtelVl5NhIKL6rc3Dam3bkcLQ2109w
 eEoLvC2dj/P9lysMrfxjG2x7ZC+Ge+ch8DhAbqam8Q==
X-Google-Smtp-Source: ABdhPJzxosUobAkCRanfuumhIpmwrz2UKbk/+SKrKxaAeLbZO6W98ypBkOm4iC+skJq/qXE0Kgbbbycfm2nGuw8H68Q=
X-Received: by 2002:a9d:7b4e:: with SMTP id f14mr6886200oto.281.1616663850211; 
 Thu, 25 Mar 2021 02:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210325194807.38ec3c55@canb.auug.org.au>
In-Reply-To: <20210325194807.38ec3c55@canb.auug.org.au>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 25 Mar 2021 10:17:19 +0100
Message-ID: <CAKMK7uFq=AN3vUrkFEYi3oinShR3fXE76pNwq-2=6nxw_WtQOw@mail.gmail.com>
Subject: Re: linux-next: please do not base your tree on v5.12-rc1-dontuse
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 25, 2021 at 9:48 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> The latest version of the drm-misc tree consists of just 2 commits on
> top of Linus' v5.12-rc1-dontuse tag.

Yeah committer pushed patches to the wrong tree, which meant you get
the wrong tree. We'll fix for tomorrow.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

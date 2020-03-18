Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E061896E0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 09:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7906E87D;
	Wed, 18 Mar 2020 08:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468226E26F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 02:47:38 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id j15so19082662lfk.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 19:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O+4NUWZR9n4+H9VOG36R2FnEsYCl9QO/Z2irsj8TMuY=;
 b=TfpA1v9+IFo+nvdmYx5W4F+Rkhaeh0hE3hLOSa0d6lDHyJM8zbqY+1sVqaPWLiYLR9
 6wkqCYr5/tlEDljN4TK+iU39tKubnIPYaCJ7iLChzUpyt8Gv6kbgwcAS6bl5hy12eqcB
 npRrKFFq+okbm2w6TAF1B2HbRtg75fwA/zcKS38lyA34+QNLiP+FaYuTilqtoqOdCFa6
 8oge0vSPjkUXp1qBu6rEFxIA2CxG3YlWwTHFNkG2LbF/hAZrnLPlAJI+BBTIxMrA6x3e
 BAXV5m5QTpZ1QDxJwEdiNA2anFqmLqiw9GQXriFNeWoZUc8M26bWDOQjxkB+8UMv9Hl7
 r4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O+4NUWZR9n4+H9VOG36R2FnEsYCl9QO/Z2irsj8TMuY=;
 b=UkS2bsTtMs4mLVA8x55G4kc4OLaNrO807hie1M00LwRyp4U9pKzsqRVYLHv6grxgft
 3DR1cPsX1IpJwCJk4RM3/KYLrW3a70AM6mQlW/fDJXP6uKTa5m08X/pry3Qh3CHymUzZ
 4DhnxdqDidj3lnZkcZNbGR9ILrn0q9tuii2Ztx9cbA5e3syrEA3QDfJJGbMjQRnxzSxn
 jC+szf0l4ho85+/cdqztaxM+JkbsambcDfGEDkjyQWv8IthztGL1O4sXDaet+p0lENcW
 9E5+vdflWU3kK43XTCdjbOXBABl53KhLxFUXNJZiM9+6Vhe8SzItn8DIKsaNFnIQfjmW
 MxXw==
X-Gm-Message-State: ANhLgQ2vcnO47ZLg4DLiRQCeMQt3XvuqCoYNIzYa1DZjC8tro+hxFzUn
 MtKLaIqQwWueynMvjnLt9chfVtMYw08EZ3i+j44=
X-Google-Smtp-Source: ADFU+vuC+GAiuLlKc2ZHzuRFwQtGPBS2O7mnSZSR1EJfI7E9MFQ2dHOCbkH1RAEpF0FnhRkIpBPRNZvipOHaREzoFqU=
X-Received: by 2002:a19:550c:: with SMTP id n12mr1451958lfe.11.1584499656637; 
 Tue, 17 Mar 2020 19:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <1583589765-19344-1-git-send-email-hexiaolong2008@gmail.com>
 <8613a6fb-1f3f-81e9-54c9-7356ce99cf87@kernel.org>
In-Reply-To: <8613a6fb-1f3f-81e9-54c9-7356ce99cf87@kernel.org>
From: xiaolong he <hexiaolong2008@gmail.com>
Date: Wed, 18 Mar 2020 10:47:15 +0800
Message-ID: <CAN9aa7rj_UwPdeZGrdZzWDE=mR5z77dKHMfOC=c4LNJXXuiByw@mail.gmail.com>
Subject: Re: [v2] dma-buf: heaps: bugfix for selftest failure
To: shuah <shuah@kernel.org>
X-Mailman-Approved-At: Wed, 18 Mar 2020 08:24:31 +0000
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
Cc: Leon He <leon.he@unisoc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Shuah:

> > @@ -357,7 +357,7 @@ static int test_alloc_errors(char *heap_name)
> >       if (heap_fd >= 0)
> >               close(heap_fd);
> >
> > -     return ret;
> > +     return !ret;
>
> This change doesn't make sense. Initializing ret to 0 is a better
> way to go.
>

I don't agree with you about this comment. Initializing ret to 0 can
not solve this problem.
Because the ret value will be override by the following
dmabuf_heap_alloc() calls.

static int test_alloc_errors(char *heap_name)
{
        int ret;

        ret = dmabuf_heap_alloc(...);
        ...
        ret = dmabuf_heap_alloc(...);
        ...
        ret = dmabuf_heap_alloc_fdflags(...);
        ...

        return ret;
}

The purpose for test_alloc_errors() is to pass some invalid parameters
to dmabuf_heap_alloc()
and wish it return some errors. So -1 is what we expect from
test_alloc_errors(). But the code
in main() will break the loop when the ret value is -1. So I reversed
the return value in test_alloc_errors().

int main(void)
{
        while(...) {
                ...
                ret = test_alloc_errors(dir->d_name);
                if (ret)
                        break;
        }
}

thanks,
-- Leon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

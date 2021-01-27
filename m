Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0085A3065A6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 22:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1876E88B;
	Wed, 27 Jan 2021 21:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABDE6E88B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 21:11:31 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id e15so1926134vsa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 13:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ssBFTUkK7k+tD6KQtHwBNNI+cb5wpFEnuxsGYeB8Knk=;
 b=elZyyFERceYpQiET3o7NGtPrxQUtJ8LJIJdHf1Dsi5l6C8ccyiUE/y5S/WfVt+y+0O
 IhI64tQ7QTrsflUz48lrmFhjDzq0FNHf0ZElYedzoALTScz7AxV+oLoVMOrcb0dsxU6j
 n0fFNr3nzvQ6E6lMb+h4u4wr7CaYyg7oM+tGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ssBFTUkK7k+tD6KQtHwBNNI+cb5wpFEnuxsGYeB8Knk=;
 b=ZL9C0u3OeUwHmDdB/bJK9hKRWh+JPo/LzA/uLpqjI2s+1R5bli6ft5mVATSobuOS3k
 6I6MKs5AnHScSRdvhrGsaokBAKxPHdmpLR/vQ8TcRFJK8QLH3iuzavdNG4dhJjF7+lsG
 voUuLgH2pJcTN8v2wQaKz9rTKP9/joIaLr+NYkRZzErWt4ELfqXqcJJ4tfM7L6hGAYcH
 RenhywvXvhbaq/svdT5ngAt1FE9VnKNZ8Q8JNK2Rc1D82I6GWpdxzPnQktjpJGTY6uDk
 gIpIUGuMybSu1OSuqERUS90Pbu3n9RNrDP4Bs+7kxc5ogC8yTcnh1D9zWSIHNp2xeSeP
 ZF9w==
X-Gm-Message-State: AOAM531ehjNENe8k8Unmz3lKMNqfd694nZLJfVyhXsuCPExU8AMYESax
 HHgce8udYUQOXnLhm5dntUga8PCHrNiaqQ==
X-Google-Smtp-Source: ABdhPJzDm0WrMChSsgR/xRo1fZEpRfpv641alpnyVwgtO9mkicNx3iIGjZa/MayW4zUjc8H6yVqoaw==
X-Received: by 2002:a67:ed12:: with SMTP id l18mr9870497vsp.0.1611781890466;
 Wed, 27 Jan 2021 13:11:30 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50])
 by smtp.gmail.com with ESMTPSA id m7sm441114vkm.7.2021.01.27.13.11.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 13:11:29 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id o125so1901193vsc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 13:11:29 -0800 (PST)
X-Received: by 2002:a67:f997:: with SMTP id b23mr9145052vsq.34.1611781889026; 
 Wed, 27 Jan 2021 13:11:29 -0800 (PST)
MIME-Version: 1.0
References: <20210115224420.1635017-1-dianders@chromium.org>
 <20210115144345.v2.3.I6916959daa7c5c915e889442268d23338de17923@changeid>
 <161160651990.76967.1833069919954122114@swboyd.mtv.corp.google.com>
In-Reply-To: <161160651990.76967.1833069919954122114@swboyd.mtv.corp.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 27 Jan 2021 13:11:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XEsZVfgoOzMAMtye+NB17cP5VO9s=_yVZ2Frp4y4Y6Ug@mail.gmail.com>
Message-ID: <CAD=FV=XEsZVfgoOzMAMtye+NB17cP5VO9s=_yVZ2Frp4y4Y6Ug@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/panel-simple: Retry if we timeout waiting for
 HPD
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jan 25, 2021 at 12:28 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> > +/*
> > + * Some panels simply don't always come up and need to be power cycled to
> > + * work properly.  We'll allow for a handful of retries.
> > + */
> > +#define MAX_PANEL_PREPARE_TRIES                5
>
> Is this define used anywhere else? Feels like it would be better to
> inline the constant and move the comment above the loop, but I guess
> this is OK too.

Hrm, usually I only add a #define like this when I need to use the
same number more than once, but I'm not doing that here.  Maybe I did
in an earlier version of the code and then didn't go back and remove
the #define when I reworked it?

Since this is a bit of a style issue, I will leave it to the
simple-panel maintainers to decide.  I'm happy to spin this and add
the comment before the loop and just hardcode "5" in the loop instead
of using MAX_PANEL_PREPARE_TRIES, so just let me know.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

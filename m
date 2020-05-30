Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472041E91C3
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 15:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C9C6E075;
	Sat, 30 May 2020 13:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92286E075
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 13:37:23 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id z12so1788582uap.6
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 06:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XIzTmlULQhTLTUnw97bUhj9bwYYHY+kN/ezJgvug0Fk=;
 b=jJf0in08FHKee2pirgS+aTNV5pqQ90PTfdgfvuNRySsFH+182ODzQQb8E53SDuhel6
 gKht1FLBGbNHFAcU1XbIzVaA9y1TKYMDzPTGPSwra76LLRG8q1GX6QIYGMG5oFL+7CgI
 lHojTf24jZQNOzONfy5rq3VWiudvOtqS9nRECbRDvZFf7uDFkHQ8AWkQaohdr4vLnIod
 nSXOo2bOCwF48npLZTibv2lO1i88RbfE5ghCcqyvfT34z5hjxe93c5rAr19VOOtfAA08
 H0Q02ML3xiinAaS9g86CX5FMC+foIRBdtLmXlJ1bIl7NQELtfgPgl7RCvbE0+3IQSPdF
 iY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XIzTmlULQhTLTUnw97bUhj9bwYYHY+kN/ezJgvug0Fk=;
 b=VQgZoyNXCcs0LRXuVK2KhZmDI254Lg4kRElPHXzApHjSi5sMKX8G6YODzqnDMigAo+
 hO2idUq1EAu0kUvgjyiGZCiukDQ8MyIxSFqPekMSnVS3XyzaOKaQEaKINL7ViSAAju4h
 OssxEo+G6EOgBKruSIdTnkqBwgFi1gUyuaQIIhQmazZFKYqL9mUUwEUh+zq7ohk22pkc
 Z4rPq+yTCNdg5+Twf0L/zr2gCuk18qlc0szQO7LnJbkyT/Pksd7orJLYFo2GEQ+G4Eao
 tfRjncmDyqUUH9CPnrvHcIhudSXrx0joyjhLOMWzmycsHIxjqFMSmyQlMBMWC+3r3I4o
 uuBg==
X-Gm-Message-State: AOAM531ntMM0CKp7myF6M9AWcuU752TpclLGSsuVs5B+QBKGNrgq3Q7W
 0yiATVugAdxaMNiBfBNk54TP/+tCNHMPqhMYa4M=
X-Google-Smtp-Source: ABdhPJxPfqqmJ315AMfabAxdOo/sdAuGX1Esa4giKJu3MeEmMPLbcan9mtEqmbOMgkdJ3w/KNPwT5zE6sJZkcIAho18=
X-Received: by 2002:a9f:362f:: with SMTP id r44mr9512697uad.69.1590845842836; 
 Sat, 30 May 2020 06:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200530124640.4176323-1-emil.l.velikov@gmail.com>
 <20200530124640.4176323-2-emil.l.velikov@gmail.com>
 <20200530131815.GA82487@ravnborg.org>
In-Reply-To: <20200530131815.GA82487@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sat, 30 May 2020 14:34:10 +0100
Message-ID: <CACvgo52VvmS-izutgFwdpvuB5gPqNL8jMfd7qYuyfum-hp7XOQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/auth: make drm_{set,
 drop]master_ioctl symmetrical
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Colin Ian King <colin.king@canonical.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 30 May 2020 at 14:18, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Emil.
> On Sat, May 30, 2020 at 01:46:40PM +0100, Emil Velikov wrote:
> > Currently the ret handling is all over the place - with two redundant
> > assignments and another one addressed earlier.
> >
> > Use the exact same flow in both functions.
> >
> > v2: straighten the code flow, instead of just removing the assignments
> Now even I should be able to follow the flow - thanks :-)
>
Fwiw reading at the code the first couple of times, did confuse the
hell out of me.
So "there is nothing wrong with your television set" :-P

> >
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Colin Ian King <colin.king@canonical.com>
> > Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thanks. If you're up for a few more neat patches - check these out [1].

-Emil

[1] https://patchwork.freedesktop.org/series/76967/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

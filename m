Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D60261985
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 20:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAD86E89B;
	Tue,  8 Sep 2020 18:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B936E89B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 18:19:48 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w3so144472ljo.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 11:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j4ZG7pHNKJrTC8ewi1bAxI1rmelsYImAuRVz1o61Rvw=;
 b=AdYfsYsp+iKIH8WN3gypyY9mlMeSR1eCJHUXHjzjx3BSS0OC/iBPzRzVULBH6L6iSh
 RrevIvrJ7CAbiyPP2mSYuwOxD6YFOdh7Dttw3IwSvOtDRS9R9zLc5hV/T6Nqo8pMez0S
 6dW9/gN7Ikd2Mi/GEilIJvAWLv+OpE8VCFjqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j4ZG7pHNKJrTC8ewi1bAxI1rmelsYImAuRVz1o61Rvw=;
 b=jbrnmRu51Q3Po7umYLcEbYdwdUIiwUonr90+45LxDKHWjcaj4zpKZTehzmwLIyWjYc
 VIoqgBUeD5cLYWu6wRJ+VWqvIgA+zOTMOv8MGJ1OrP1Y99YMf6ta5hkbbe2uxUemSK2Z
 YYnydA4LV05Zq8ezhHvjxL+k4VAJTzZoTJFxGL3P+ZwqQhmXUkLhOfBb8tlM1OOOvmV9
 UhGjZZr3C6xAAAKM2pPbqWd+DDi665lAGSOpEcZ4GwkU/U4LBMjgE/fGWaeBak8Teeya
 UT/z3dkj/0AzwCNmTPBuM3PqoYqX0cUBB447X4UUAbzADBf8/L8BRBr7PAuorvTGzzXg
 J3lw==
X-Gm-Message-State: AOAM533GqOsaOQQVchwC2tbSY9x6zCX0HS+2O0Cbijy1+3wbV2xctMTk
 3SRaLAkt65okDwuMgyEJ4hNJvGZDrWXnMw==
X-Google-Smtp-Source: ABdhPJwSm91b45F+XRNySlr48HAVvRafeFg5K/YjyldyCFj7MZJOCJxDc2WW38ZrUuDHH45kvxuR1g==
X-Received: by 2002:a2e:3318:: with SMTP id d24mr4942614ljc.465.1599589186779; 
 Tue, 08 Sep 2020 11:19:46 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id f9sm133694ljc.129.2020.09.08.11.19.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 11:19:45 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id y17so163530lfa.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 11:19:45 -0700 (PDT)
X-Received: by 2002:a19:4a88:: with SMTP id x130mr133090lfa.31.1599589185184; 
 Tue, 08 Sep 2020 11:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tz0whDeamM+k_8Wu8TVzz0TDr+qMNMXo8rKeeNRKxBuiQ@mail.gmail.com>
 <CAHk-=wh2EH9DKRpJQ7+X+NWjjduLPy_Ncv1GzxnXBg-3mTn0Fw@mail.gmail.com>
 <cfcea1be-e02f-b391-ab1f-780888da138d@skogtun.org>
In-Reply-To: <cfcea1be-e02f-b391-ab1f-780888da138d@skogtun.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 8 Sep 2020 11:19:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjRLmayxnChONeb24pFPv=o733ptzpAyuAebrxWzhPYtw@mail.gmail.com>
Message-ID: <CAHk-=wjRLmayxnChONeb24pFPv=o733ptzpAyuAebrxWzhPYtw@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.9-rc4
To: Harald Arnesen <harald@skogtun.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 4, 2020 at 2:51 PM Harald Arnesen <harald@skogtun.org> wrote:
>
> Still doesn't work without the three reverts
> (763fedd6a216, 9e0f9464e2ab, 7ac2d2536dfa)...

So this didn't make rc4, but it's in my tree now.

Harald, I'm assuming things work for you again now with the current
git tree, but it is always good to double-check in case something else
interacted with the reverts...

                      Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

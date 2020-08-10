Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE01240D22
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 20:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B6D89624;
	Mon, 10 Aug 2020 18:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62A689624
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 18:46:01 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id ba10so7163075edb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 11:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0ggjU3FMbPE5SbyAI637pqBRTzs0p0XGDl+i3Y6bsrU=;
 b=hrv0m/DUiqS/Wm9VaJIOzz19imALb8BpQw5yXSY7UWBvJLYQrlYMvquF1Y/JTX2lOV
 NaMdOJmfHOy7d7ml5HESptwuWmNG3ZImKxL+93j996XQMG7aOZjWq01igO1dnBy3wCzJ
 q636OKrz36TGirCB7lPZOJ+stOfqctUTgX+DLGbq4vAt7I/mcuMJLonXkVQIiF7aZCTq
 yEGslCVOqjUTxoRLCWICuXxsovVwbo0uHQ3p/f9aWC6FtmCtTWS0tzzP4phtrq8Kzg1x
 NZssgWxsXmGAd8p10j9jWNVBIk9NinDPtrEWu5t3I5c7JhHZCNCKcqqQsUeYJe1mcr6J
 NxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0ggjU3FMbPE5SbyAI637pqBRTzs0p0XGDl+i3Y6bsrU=;
 b=g2h/CM+5O5DqIFRZZ/OgvsRatKOHmCQUdEZGSfJJKSOOVY6Q1p/4ToMOKfUhTwK+zr
 6zvem9E4Nv2VsY2qRvQT7dESzk8W2rLjPT0A9tsUDb/TRL2RchaNYFcfYUHMbaflO2om
 Qr/6sXHPsxEDNnxTHnp+0l41SBjIgzKP6z3HmY62L+R64Tps9a098BFJBB4LxXoPjiQG
 /3e4gKHdPV2HDAiGL35hNQxnrjhbAQ/wwKMfM79WL4rwq0KCM307sGh6AFVxFobeANyE
 x18kmNpOC+rWGqVt4Tc1ctH5C7e/MT9R3yET9n6c4LoqV2K8tYNor86P2Sf2JeI/z+VI
 eeMA==
X-Gm-Message-State: AOAM531XtsmsqcdonkQYJv4XLUzeiU1FISg2bvu7KFkTRqZ10GMrEcaH
 7isNV7EZ+m5Z+7pCzbsGgouU/twInQwdhGVOKFoLxpop
X-Google-Smtp-Source: ABdhPJyo0vfZItCVXQ178NPkspm9dRGbwW8YOurEOL9HZiesRrN1QLtjiIpy9ooZ9jdLd1ZSQUtYIbvuRQ4NKoJjUwY=
X-Received: by 2002:aa7:c246:: with SMTP id y6mr23270403edo.78.1597085160405; 
 Mon, 10 Aug 2020 11:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9ty8hOY0m2+RJdRiRADY5Li-hs3ZaDEK-DTf6rgFewar7g@mail.gmail.com>
 <20200810122320.GA20549@infradead.org>
In-Reply-To: <20200810122320.GA20549@infradead.org>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 11 Aug 2020 04:45:48 +1000
Message-ID: <CAPM=9tyDkW5rzz0PVQUXf0EnDoebRnD_Td=ZCWV1-LwvHE3Scg@mail.gmail.com>
Subject: Re: [git pull] drm next for 5.9-rc1
To: Christoph Hellwig <hch@infradead.org>
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
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-spdx@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Aug 2020 at 22:23, Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Aug 06, 2020 at 11:07:02AM +1000, Dave Airlie wrote:
> > nouveau:
> > - add CRC support
> > - start using NVIDIA published class header files
>
> Where does Nvdia provide them?  I looked into the commits and the
> Nouveau mailing list archives and could not find anything.

https://github.com/NVIDIA/open-gpu-doc

Is I believe the canonical upstream source for them.
>
> Note that various new files with a MIT boilerplate instead of
> an SPDX tag.

Ben might just have imported them directly, so SPDX tags might need to
be sent upstream and see if they accept them.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

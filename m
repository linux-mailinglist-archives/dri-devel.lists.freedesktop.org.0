Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B983223EB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 02:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423F76E819;
	Tue, 23 Feb 2021 01:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0262E6E819
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 01:56:54 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id h26so8957030lfm.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 17:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X3YTt+OBnZdgY7YTDG9R5B/vNmDOeKHekPCOYy0Yhx0=;
 b=MHcmARE6GXe9GATWNEkX/ppYFvKDMu/Qdj8EquOuKjI/tjKA2KYCQRVSePACbXXz8u
 OG7fWuE61jx12EwVcOlVN244TLyIgWhXresA4yUvIjmoDKkew3ivclzTo+39YiJn/Lbe
 X88LFzYhTu1s6FsdE7T336ZwtI4k6GmRce/tE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X3YTt+OBnZdgY7YTDG9R5B/vNmDOeKHekPCOYy0Yhx0=;
 b=t5Msnlmpbxw2+pY1aB/idrMZ+K12vqU1OKCRNENRaJuvwkbOL5FclMGbR1AcaSn22M
 FM0TbqO7eJQevK1aGhRBVVGxIoR53f8oepRaVZqmQyJA+vMynuUeooE6YnEvL9wsdzIW
 wIGdK8x3UX4FvT9/NC/HkqNfbnSKoBkzedE7fatl0fPxgvBt4UjV7Ru+lnt9s4lopP/f
 yBAdy0FmbLM49Y53IND9s5B9oPS1mLF2NMNDnk7T60XnHSJ+PVpw/tyOZlBXiU5x/xe+
 bg2pwAeCIpL+FekfFSDizaE/UxLpqgIXEhHv4LOW1fK07JlFL1SOLDljIEABoyKQ00Kg
 1+TQ==
X-Gm-Message-State: AOAM5325At+HEEuACJRz9WjIhsYBacxlLYxWSaBIJZM9fW1Wy+dLDpv1
 ZslpcWbmcal0CX8bmEHGhrgWCU7ADZvmcA==
X-Google-Smtp-Source: ABdhPJzr2aLoGZCJGcNt7lNgoZW0uBXT9lXIwqXSxVZqXt/x52bMj6FNNJSXZVCR4IATXQgVfs7bCQ==
X-Received: by 2002:a19:6d09:: with SMTP id i9mr14867796lfc.425.1614045413167; 
 Mon, 22 Feb 2021 17:56:53 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id w4sm2258107lfe.81.2021.02.22.17.56.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 17:56:52 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id m22so8891007lfg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 17:56:52 -0800 (PST)
X-Received: by 2002:ac2:5184:: with SMTP id u4mr10058742lfi.487.1614045411930; 
 Mon, 22 Feb 2021 17:56:51 -0800 (PST)
MIME-Version: 1.0
References: <YDOGERvNuU3+2WWe@phenom.ffwll.local>
 <CAKMK7uHQ=6OJcRguCUtiB456RWdCfwSNEXV8pQsfsPodTJ6uxw@mail.gmail.com>
In-Reply-To: <CAKMK7uHQ=6OJcRguCUtiB456RWdCfwSNEXV8pQsfsPodTJ6uxw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 22 Feb 2021 17:56:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi43mDJab1RQz9Sgz5+m=T=nSCyxULywoUHxstEHd2qnQ@mail.gmail.com>
Message-ID: <CAHk-=wi43mDJab1RQz9Sgz5+m=T=nSCyxULywoUHxstEHd2qnQ@mail.gmail.com>
Subject: Re: [PULL] fixes around VM_PFNMAP and follow_pfn for 5.12 merge window
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Linux MM <linux-mm@kvack.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 2:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> Cc all the mailing lists ... my usual script crashed and I had to
> hand-roll the email and screwed it up ofc :-/

Oh, and you also didn't get a pr-tracker-bot response for this for the
same reason.

Even your fixed email was ignored by the bot (I think because of the
"Re:" in the subject line).

So consider this your manual pr-tracker-bot replacement.

              Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

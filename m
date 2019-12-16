Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47861121B90
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 22:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FC66E8A5;
	Mon, 16 Dec 2019 21:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CC86E8A5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 21:11:39 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id x1so8577372iop.7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 13:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SF6lWMGAdZxyhSAthmGAEkgW7nSnXbgJWE4ymLaJd/Q=;
 b=erKzNcOzpVdrAachQFismVDEfMPajwzCXjoz7oogb4DTOV6blmxt6fdzAeivZFbaYR
 9/q9aj0xczdrw/Zxott3MQsgQ+cfiZST0q5hnykUNhZf/bDyd557d4gOOZQrkYoKEBDW
 2MtwpNmy7F6OsJqCcQtjAhSmpScx4PZ7s5D/uCWmnQ2Kz60w7D3pxmnOofNGyLRKjbhw
 pHYUETKkzOuZ2mwztXBLps134cjF7a3n76FYrsV/iGxq6OjCQBBnpAmW2k8bR+J7TxCE
 JxqqcKqvjWytWKq0eJxzzmNcegrwrrxlypM0JNNFUeRp20oKH9w7VTPj6JvUnquJME2V
 ztrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SF6lWMGAdZxyhSAthmGAEkgW7nSnXbgJWE4ymLaJd/Q=;
 b=KnLIDfwUPEZOpHmKnxsHyiuT/n0RO4vJybSwKvxDG2z8HZu4juF4QkOz4O64crnVEH
 mbOORSNCa5yiOhSUCYkYUEEBACJn8XDLK8kaQFa4XZ9ULykv/y4S5djlflvRE+lvE3jS
 rB/1zReGMH5Nnko9kBz76ofMkTh+C9CIzPuGbVIdXtok8oMy3adt3rgm+B+WGcQEtSHo
 Uq3KJN/c18hu0Mvp7PWTUbl8n8kIjk7HYtmsHAbta44u2ber17lDRG1E0jpoQIhkaxZH
 yBUEnSvgmAfs27b0h/T+nQnBqNumsWB6JxdTvsvcANRL7s8O6IGmqKS7eQrsFMpPphbb
 pjAg==
X-Gm-Message-State: APjAAAWQG+fHiIWxJi4qinmaIw6HFnTS1fqOvtGh/D5YtOv32kCtscG9
 Rn6i73XsDaW2Mr2WVGtQTWOyQULHFoGD6cG7KRcT3Q==
X-Google-Smtp-Source: APXvYqwhB9Q3ppQ8bm7xUSXaRvKv6S2vuZ0Qxo7EosnauRafwaVMYDEQ3WL2vGXIPl9WGtB2G8MEmWsqt0PGNGVFRK4=
X-Received: by 2002:a02:b38f:: with SMTP id p15mr13729269jan.56.1576530698555; 
 Mon, 16 Dec 2019 13:11:38 -0800 (PST)
MIME-Version: 1.0
References: <20191216133405.1001-1-afd@ti.com>
 <20191216133405.1001-3-afd@ti.com>
In-Reply-To: <20191216133405.1001-3-afd@ti.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 16 Dec 2019 13:11:27 -0800
Message-ID: <CALAqxLWUXxGPca9xbZYwoJAVp7aEuUTKNpE3CdunepvEDJysyw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dma-buf: heaps: Remove redundant heap identifier from
 system heap name
To: "Andrew F. Davis" <afd@ti.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 5:34 AM Andrew F. Davis <afd@ti.com> wrote:
>
> The heaps are already in a directory of heaps, adding _heap to a heap
> name is redundant. This patch is only a name change, no logic is changed.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>

Again, do wish we had caught/made this tweak earlier, but this seems sane to me.
Acked-by: John Stultz <john.stultz@linaro.org>

I've also reworked my userland changes to use this name, and will
update them here shortly (assuming there's no objection to this).

Sumit: Mind queuing for drm-misc-next?

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

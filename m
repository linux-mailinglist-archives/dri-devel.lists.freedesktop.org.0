Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FA716F908
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82886E194;
	Wed, 26 Feb 2020 08:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFFA6E0E6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 03:57:10 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d9so1286841qte.12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 19:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y43f351GsocmwieumGvRVXcMvZ/sEk6tnZeuhSLflZ0=;
 b=ZTP0S5/QDGhwujJhePEeqS8RMJkWkFJa/5JZyyUqiRn+ilygUdrbn911hQNVMntZy3
 zOVmYLjUDv+1xez2rK2QVc0DQfcPJ2wyrY370P5wT5ptsjyywr20gibLSnkSa/oD3SzQ
 709zTNnUw5Qbx/eMUMt6+qNAINBmx2JE1k9GI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y43f351GsocmwieumGvRVXcMvZ/sEk6tnZeuhSLflZ0=;
 b=TcGyCDPJImhI6CFMGNdogKPKU2uwhJ/Z/v7NVxPz6sWZYs5DtMTiOz9ryOlFaE/IZC
 IsmW7wH+EFZt2aZwMXxLpUBgKl0uzZ0n5ejVKuSTS2BvPgK9ydlRgZIjBNJuDduv7vOi
 oYKzPuyYXowkhS+PqN1cA3SzjAN4Cwu/MDPjsRwnqd4U4dGoEHgDYp9/ClWkFnpTc41I
 gmQwgeYCRWUrcPbfq93/zhP03wItO+LlbVvHN5RXikM3q0XEyF0ztCg5zEVCoS+XaOMT
 BVhCRB/qr25frNoRGBLbzZGo9tEcrPUGexBXG1yM0kctbFapQBcECemzCvMEF3BUvRSA
 ApSg==
X-Gm-Message-State: APjAAAXlY0Ldtb5ajKuhXWMMgY81NHf+NEBfUxPLtR2xkoRXowXWBhp6
 GpNKW4kTSEU0GJXkeuhTHs64KZaDsj6YzlOX6QN5pw==
X-Google-Smtp-Source: APXvYqxT1mskDKO8pPXeGfj5i3NbuWvfjJvcsQi12sua3ZaKB+zMAp1/1nwwdHvRa+8Box6GWFczVQuvTFidlmGN/dU=
X-Received: by 2002:aed:3e6d:: with SMTP id m42mr2584657qtf.187.1582689429791; 
 Tue, 25 Feb 2020 19:57:09 -0800 (PST)
MIME-Version: 1.0
References: <20200219080637.61312-1-stevensd@chromium.org>
 <20200219080637.61312-2-stevensd@chromium.org>
 <20200225061008.wqxqppfglzmwvtid@sirius.home.kraxel.org>
In-Reply-To: <20200225061008.wqxqppfglzmwvtid@sirius.home.kraxel.org>
From: David Stevens <stevensd@chromium.org>
Date: Wed, 26 Feb 2020 12:56:58 +0900
Message-ID: <CAD=HUj7h1d8dXG94FUtj4fmeUvUM0dm6NW8WHGZAceHae0zGLw@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH 1/2] virtio: add dma-buf support for
 exported objects
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
Cc: virtio-dev@lists.oasis-open.org, "Michael S . Tsirkin" <mst@redhat.com>,
 David Airlie <airlied@linux.ie>, Jason Wang <jasowang@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2020 at 3:10 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Wed, Feb 19, 2020 at 05:06:36PM +0900, David Stevens wrote:
> > This change adds a new flavor of dma-bufs that can be used by virtio
> > drivers to share exported objects. A virtio dma-buf can be queried by
> > virtio drivers to obtain the UUID which identifies the underlying
> > exported object.
>
> That duplicates a bunch of code from dma-buf.c in virtio_dma_buf.c.
>
> How about dma_buf_{get,set}_uuid, simliar to dma_buf_set_name?

While I'm not opposed to such an API, I'm also hesitant to make
changes to the dma-buf API for a single use case.

As for the duplicated code around virtio_dma_buf_export_info, it can
be removed by sacrificing a little bit of type safety, if that's
preferable.

-David
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

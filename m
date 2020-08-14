Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75882244F4E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 22:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26CE6E172;
	Fri, 14 Aug 2020 20:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87846E172
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 20:53:14 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id a65so8613276otc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 13:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EmoVjC08YrxpXeWbeOpcQEKNWTvOXbJjlLJ0uSesYA8=;
 b=aolCttJ37bqd+sgnF8A6XpmoeOLLkQCaKN3q+rb6g/rNhwhvcwL1iJBBNMcr8FvOfE
 WvjYAxIkVM0S7MriwGD//PHIXegNQsl0mZdCDmcuyyj9GY/T/5dpF1CzJkELHMgmMq6Y
 xu5L/CJRA0PXVhPH4en0+FFYYIwJ69kgrhcADp1qYUt7JGFpe8y1JikeiSySX4zjbbuN
 bv9nceABe3dfOSgPwiE3n1I+sabLGkd/b9VUWUsOU8OdDoEVkMwIumwFS93KiM+iyF4f
 5/dQyIjRafdbdS6dtGp0E3WOIK2F04eDLoBDhrem3egJOhAp3xsk0Cf5cGJenTeX2d/B
 5/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EmoVjC08YrxpXeWbeOpcQEKNWTvOXbJjlLJ0uSesYA8=;
 b=kuWCzTuilvv5rE6TMEqNWijaHRPDIdtjKUYepbmSRYKvMjxTGflgGk7I6oNvc+Gwkm
 1CfRExKcYCDuxM0jUA8MN4mDcGvGpoonlKpJropMi4D/O7OgTYt0fUdu5vqG9dVNRXyt
 DWakEAG624pxfCA4izwC7z+smGdouCVVRQV+XMgdKVYag7/jOHc36fLfodhzN+bpAISW
 GcQd/P3Al0+aJYZ3dEmYMiYDF75EEr2s+cIwqeSr/h5y7I/HvJLn6zfQS3UIyEOysI4J
 0Nxs63uj1gsIl6tnxft1sNC3a0koPMSEOLvmFzQ1+/TuN+BPNnt/p3nO1L8SmQv7nQVk
 yg/g==
X-Gm-Message-State: AOAM532a+JIremK4+ZfaBVS/GdQIMN5a1iapo/DquSkuFFSxKLqAhf+t
 YY6zmP8+sdoqYAFR2jnVLCSYj0zpBSPc0CDkwQ2ydrOehMfbfg==
X-Google-Smtp-Source: ABdhPJzsqsQPx8m5cz69J30RINmCdTOYqlYH4FYXz03eP3WaZBw/2J7kDm1DTz/fu92cpDUoOnTmUK3xjLtz3YQKStQ=
X-Received: by 2002:a05:6830:237b:: with SMTP id
 r27mr3123949oth.352.1597438393874; 
 Fri, 14 Aug 2020 13:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi>
In-Reply-To: <57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 14 Aug 2020 13:53:02 -0700
Message-ID: <CALAqxLX4J4bykRis3=Q2Q54Fe1o7A7nFH3Yfjbi-kNXOQPrQpw@mail.gmail.com>
Subject: Re: Role of DMA Heaps vs GEM in allocation
To: Mikko Perttunen <cyndis@kapsi.fi>
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 14, 2020 at 3:59 AM Mikko Perttunen <cyndis@kapsi.fi> wrote:
>
> I'm currently working on a new UAPI for Host1x/TegraDRM (see first draft
> in thread "[RFC] Host1x/TegraDRM UAPI"[1]). One question that has come
> up is regarding the buffer allocation mechanism. Traditionally, DRM
> drivers provide custom GEM allocation IOCTLs. However, we now have DMA
> Heaps, which would be sufficient for TegraDRM's needs, so we could skip
> implementing any GEM IOCTLs in the TegraDRM UAPI, and rely on importing
> DMA-BUFs. This would mean less code on TegraDRM's side.
>
> However, one complication with using DMA Heaps is that it only provides
> DMA-BUF FDs, so it is possible that a user application could run out of
> free file descriptors if it is not adjusting its soft FD limit. This
> would especially be a problem for existing applications that might have
> worked with the traditional GEM model and didn't need to adjust their FD
> limits, but would then fail in some situations with the increased FD
> usage of DMA-BUF FDs.

I'm not sure exactly if this would help, but I am working on some
exploratory tweaks to DMA BUF Heaps so that there could be an
in-kernel accessor that returns a struct dma_buf instead of a fd.

This is motivated as some folks want to use DMA BUF Heaps (if I
understand your approach) in a similar fashion, where the driver wants
to generate a DMA BUF but doesn't want to create their own DMA BUF
exporter which would duplicate one of the DMA BUF Heaps.

I'm a little mixed on this as part of the reason DMA BUF Heaps exists
as a userland interface is because its userland which knows the path
that a buffer will take, so userland is in the best position to
understand what type of buffer it needs to allocate. It seems to me
that drivers should instead import a buffer provided to them from
userland to fill, rather than allocating a buffer from a heap they
choose (which may constraint later use of that buffer). But, I also
grant that drivers implementing their own DMA BUF exporters that
duplicate existing code is silly, so having in-kernel allocation
interfaces may be reasonable.

However, the efforts are also somewhat blocked on having a public
in-kernel user of such an interface, so they are basically only
exploratory at the moment. So if you have an in-kernel user interested
in something like this, I'd be glad to get further input.

This probably doesn't help answer your question wrt to GEM, and I'd
defer to Daniel there. :)

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

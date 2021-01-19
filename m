Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D602FC103
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 21:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B9889B66;
	Tue, 19 Jan 2021 20:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D63B89B66
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 20:30:46 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id n8so14650311ljg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 12:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nF7UbpB2XeoCjbiO8VMOKYIHRLbtv9cSr4i7RtcGNLw=;
 b=GiX2j5Kt1ekUGCYLmuPr3Gve1jltlwAlXhP2At39z+/uek4RxUF3MfgJWoXEvat9CE
 L6E4m1fHeO4flYsscnqsgGIHnK+gphGU8FLCU+F8+5ptsMoEnHwbVDOqoHbxhEMUYIXc
 mQdC1OVchX+wt4Y8CmlLKX7sHaPTOT/2t3CcSpZJHNbIrujw4QioYSnAf78HbhWWzbDd
 0cwR3gAW1DI98X1pJVqFck0oITbPBRGugj1dD1u84cJpjH8UMz8VWPC6gENCXK1y5iaD
 FlRMGuFfCyo3n0tjB/ohjAQtpURlvnMjOpCHaDjhgZxOsisPsFP8/kLndAPCU9fqH7E7
 rq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nF7UbpB2XeoCjbiO8VMOKYIHRLbtv9cSr4i7RtcGNLw=;
 b=pc5XHL4mZMeyZIu0BBx/SWiHQ5WXx7dQCzBm1zZf2n5wdy1OSXs6lA+R2M/bJbtbkk
 MiHMTjzMQRwxRB6mEBfyv901cQ5hJyfPyU25k0yxm9zH7iaKJ4LeLh45mxd9oh1pVg/W
 N+K7RswwHekQAH3LzEj40yBKIxFKrkasW0yOKHzWvQKJot8Qs7kqtjRSY3K50hgl2+NF
 1IMrYjspX1mdV6SHKUxRVFZ5gR6fR/1TrKARICKiCKrcgJN8Q/CwsfZRouJI54deuGm5
 H4QMZqlPASfWGUOgJMaMrnrUcVjFf1BXVYwBhci3wDcOzuWILocIX8MaE5HdrfrdUEz7
 3HkA==
X-Gm-Message-State: AOAM531WcGmtFMbeB3NDbfoLJ/tzkVPld5PLhZxMW5b3iJiHNlVg227x
 aUokR9x45KpF9QxctsPdhEGE8BG5aY75xDs4vBKEkg==
X-Google-Smtp-Source: ABdhPJx5YvfQq/BpJkwnrqT77I3705LpbokmXAy1PRaAygaddGOSWbFfD5d4ga04BDUPWi0m67euPyhBFxqc37g4alo=
X-Received: by 2002:a2e:8090:: with SMTP id i16mr999488ljg.257.1611088244719; 
 Tue, 19 Jan 2021 12:30:44 -0800 (PST)
MIME-Version: 1.0
References: <1610757107-11892-1-git-send-email-veeras@codeaurora.org>
In-Reply-To: <1610757107-11892-1-git-send-email-veeras@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 19 Jan 2021 12:30:32 -0800
Message-ID: <CALAqxLUr09++rtqy56q-KfkKYtPKd8mV-r=Zou7vZVmyNze7Og@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dma-fence: allow signaling drivers to set fence
 timestamp
To: Veera Sundaram Sankaran <veeras@codeaurora.org>
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
Cc: David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo@padovan.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, pdhaval@codeaurora.org,
 abhinavk@codeaurora.org, Sean Paul <sean@poorly.run>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 15, 2021 at 4:31 PM Veera Sundaram Sankaran
<veeras@codeaurora.org> wrote:
>
> Some drivers have hardware capability to get the precise HW timestamp
> of certain events based on which the fences are triggered. The delta
> between the event HW timestamp & current HW reference timestamp can
> be used to calculate the timestamp in kernel's CLOCK_MONOTONIC time
> domain. This allows it to set accurate timestamp factoring out any
> software and IRQ latencies. Add a timestamp variant of fence signal
> function, dma_fence_signal_timestamp to allow drivers to update the
> precise timestamp for fences.
>
> Changes in v2:
> - Add a new fence signal variant instead of modifying fence struct
>
> Changes in v3:
> - Add timestamp domain information to commit-text and
> dma_fence_signal_timestamp documentation
>
> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
> ---
>  drivers/dma-buf/dma-fence.c | 70 ++++++++++++++++++++++++++++++++++++++++-----
>  include/linux/dma-fence.h   |  3 ++
>  2 files changed, 66 insertions(+), 7 deletions(-)

Thanks for respinning this!

Reviewed-by: John Stultz <john.stultz@linaro.org>

-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

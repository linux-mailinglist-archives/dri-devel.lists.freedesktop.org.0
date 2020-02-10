Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42B01584A7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 22:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB9D6EA04;
	Mon, 10 Feb 2020 21:21:45 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D28A6E23D
 for <dri-devel@freedesktop.org>; Mon, 10 Feb 2020 21:21:44 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id i4so2288015vkc.3
 for <dri-devel@freedesktop.org>; Mon, 10 Feb 2020 13:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fk9bdz/2mbXx6dTdvB7EEtvMRvBXPbEaBb56NU9MXvk=;
 b=oFCfjcLi6FTB8phhz5e5PNBQQK1bvPyU+YLtRi18QmAAzEqnY924oe7J71K/fOfGTo
 f3gOueqJgdm+vMwJlqJZAnePuZYODm8ZnNni3gHBsL0HBvBbjC8WPRyY4Q5Y++YUloN/
 CR4c3SmRF9iN7SCYbKhjCYcimn+OrtHdACBgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fk9bdz/2mbXx6dTdvB7EEtvMRvBXPbEaBb56NU9MXvk=;
 b=TRJzpuD3d0fYTyUO9dcq6TioeS5cbQT3I+yUUFle1PzCVkkBG3b95wPe2KUuuM1I/b
 ofjps6yD/R4fy2x+TeBNncksGTcMOXwqdb0EqWtIeTEVQlM9KXbZ5K1yFbR4sbYYD+JP
 TgudGViwqxaVTvEcTitGrYJc+JmdR5dUDYEYYxUfnxHI1EXcrFSaoxDvcVx1kKz9gS4f
 EZ3TI8ucl5Rrxf6x8LtkkE5FhDK0Njl7d/IZ9SZNM8naQW05rDUkM5hNJxNWfO/9z7NY
 8sgIv9SLxKmQYTcq4rFB5UMDF6nkPC2B5PJ9OqCQERfFWtjKcFbcKxzIIfvDjTnz704T
 rttw==
X-Gm-Message-State: APjAAAXqZbKe2JrOVz73m3uypED1ikGhwZr+ZutDKv5e1rkLEsDkqrhZ
 1OkuN7xnLQL3x5g4WHE2/UpJXCJn6ZI=
X-Google-Smtp-Source: APXvYqzDmAkQ8hzA/26wzGTHoy/KOg9Z814JnBO1Zx6V7h/2DTwJe33Ig2MhJJnyskzwwpNZCf2/wg==
X-Received: by 2002:a1f:fe45:: with SMTP id l66mr2325157vki.9.1581369702762;
 Mon, 10 Feb 2020 13:21:42 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com.
 [209.85.221.177])
 by smtp.gmail.com with ESMTPSA id x65sm443131vsb.29.2020.02.10.13.21.41
 for <dri-devel@freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2020 13:21:41 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id y184so2270739vkc.11
 for <dri-devel@freedesktop.org>; Mon, 10 Feb 2020 13:21:41 -0800 (PST)
X-Received: by 2002:a1f:ee45:: with SMTP id m66mr2278489vkh.75.1581369701330; 
 Mon, 10 Feb 2020 13:21:41 -0800 (PST)
MIME-Version: 1.0
References: <1581320465-15854-1-git-send-email-smasetty@codeaurora.org>
 <1581320465-15854-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1581320465-15854-2-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 Feb 2020 13:21:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VH4954bnD_PzOhFPaYRto5sRVCCuOHgm67=uz5Be_b0Q@mail.gmail.com>
Message-ID: <CAD=FV=VH4954bnD_PzOhFPaYRto5sRVCCuOHgm67=uz5Be_b0Q@mail.gmail.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
To: Sharat Masetty <smasetty@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Feb 9, 2020 at 11:41 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch adds the required dt nodes and properties
> to enabled A618 GPU.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>

In v4 I added my tags [1].  Please keep them for future patches unless
something major changes.  AKA:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>


> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 102 +++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)

Just to summarize where we are:

* As per my notes in v3 and v4 [1], this can't land until
"mem_iface_clk" is in the bindings.  Please post a patch for this and
reply with a link here so others can follow the disucssion.

* This also can't land until the gpucc bindings change from Taniya
recently [2] lands.

...so we're in limbo waiting for the bindings to be resolved, but
otherwise this patch looks good.


[1] https://lore.kernel.org/r/CAD=FV=UEQ0mOXuDrSZrcJ8g6jb0eLf1Ttn+Mn7T6d2TpCMUcuA@mail.gmail.com
[2] https://lore.kernel.org/r/1581307266-26989-1-git-send-email-tdas@codeaurora.org


-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

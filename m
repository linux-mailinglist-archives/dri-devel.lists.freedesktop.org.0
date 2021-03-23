Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E60C345527
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 02:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A34A6E829;
	Tue, 23 Mar 2021 01:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3406E822;
 Tue, 23 Mar 2021 01:54:50 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id o16so19133470wrn.0;
 Mon, 22 Mar 2021 18:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y6kHhDqex1SsXfv+a9vGItXQc8cTJtK09N7Ycugrx0A=;
 b=AGnsZG7v8ZQN4wrf+x88MnVVF27VSEBSsTbTyz9kRn9dkyDbY252e9aOnIEyhgcshO
 1mS6WaoW6Y8GFgyvxfBnm0G6rZCJhzhfw44+Fm4gCPH07So2oKhMMT7PC9lAHPT3s6C0
 fpRdCfgK9+YZedOaGXRWhyIFo+IQKpRjUXrsWY7m8jwFhIMT0O8od097BQ0Ir3FsZyMp
 cdP6epLhx88/YsFVfridrXTncgfGl2mUgx73Um8qtnWFFlR3I9A1BYz5KWREkzsfz3Id
 2GVLSJHGiQticjF2DNf0HmPqN+zqLuj/kKBLoFDYYT4xZ6UU7Os5GYqWUu/gRREpuRiu
 AOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y6kHhDqex1SsXfv+a9vGItXQc8cTJtK09N7Ycugrx0A=;
 b=YH0bUcUldY0fnv+893IaHHlZ3XzHnI/GKtxrDgRpIb0P+LsFkxulojRhlP92SKRBbA
 RNBzU1Qwm9hLtuvwdv6Ijba3I0SKgsvKK/tf8X95H+obifY97LpCfk9Ct6isOrdnxdxV
 LqDYNttv7mNhExnqIL+Hh6lVk/dMd7HF+2qCV+TbykKTokkKz7uGIXPjf54qPJoJn78w
 nkQyfAvQCH0Fngtjw0l7I9Z2btZWhcKcERcjc1EfCYEgsFBd3uINpF8WKIL5S0AH0MHD
 FelLybU9K1d0cYAa6xkT3XaK8qUHE0fwl8o4OUWhOFSfIsNrmlOG80EhYtfCCPAcr3Z9
 ttNw==
X-Gm-Message-State: AOAM530NBsVsT4oZjsOs0AmEC7r93HjEUpo/qNblWv7yx6nzWKvUWApx
 c9GhGD0GpAPioOA75NW6EdtgNoVKysHjoUlkHMg=
X-Google-Smtp-Source: ABdhPJw4B2u3R2fdqQZBeZ0j8MaOwUzUX6lJF7RGtQiYESsOZ3iClSdFOM/g/oIrWV9NpPoO6xUEEzrgTo0pF8/EEb4=
X-Received: by 2002:adf:f587:: with SMTP id f7mr1304735wro.147.1616464489599; 
 Mon, 22 Mar 2021 18:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <1616404632-13693-1-git-send-email-kalyan_t@codeaurora.org>
 <YFk6AINTcg2S6vDe@google.com>
In-Reply-To: <YFk6AINTcg2S6vDe@google.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 22 Mar 2021 18:58:01 -0700
Message-ID: <CAF6AEGtkMD19ZFbs7TxQ6wVn-DMgHQbpDokwRvkL1wTgqMK2ZA@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: icc path needs to be set before dpu
 runtime resume
To: Matthias Kaehlcke <mka@chromium.org>
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
 <devicetree@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, hywu@google.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kalyan Thota <kalyant@codeaurora.org>, midean@google.com,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 5:44 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Mon, Mar 22, 2021 at 02:17:12AM -0700, Kalyan Thota wrote:
> > From: Kalyan Thota <kalyant@codeaurora.org>
> >
> > DPU runtime resume will request for a min vote on the AXI bus as
> > it is a necessary step before turning ON the AXI clock.
> >
> > The change does below
> > 1) Move the icc path set before requesting runtime get_sync.
> > 2) remove the dependency of hw catalog for min ib vote
> > as it is initialized at a later point.
> >
> > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>
> Confirmed that this fixes a bunch of warnings at boot on SC7180 when
> (out-of-tree) camera support is enabled:
>
>   [    1.832228] gcc_disp_hf_axi_clk status stuck at 'off'
>   [    2.118292] gcc_disp_hf_axi_clk status stuck at 'off'
>   [    2.442383] gcc_disp_hf_axi_clk already disabled
>   [    2.750054] gcc_disp_hf_axi_clk already unprepared
>   [    3.154835] gcc_disp_hf_axi_clk already disabled
>   [    3.421835] gcc_disp_hf_axi_clk already unprepared
>
> Tested-by: Matthias Kaehlcke <mka@chromium.org>

thanks for testing on the setup which had this issue.. I've pushed to msm-next

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

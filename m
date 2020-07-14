Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D935621F9A9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 20:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A976E433;
	Tue, 14 Jul 2020 18:42:00 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A25989AC0
 for <dri-devel@freedesktop.org>; Tue, 14 Jul 2020 18:41:59 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id rk21so23777722ejb.2
 for <dri-devel@freedesktop.org>; Tue, 14 Jul 2020 11:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f70f6IrV0YxEjaCs9DxeSPhQuDdLaxIEZSEaWG88uXA=;
 b=VejG7ns58/o56wE4RNCvWeVgjvU+LlSoJSfL5d4/jVqlOeuw9g5CUYQ50YHQsdFubO
 Ha/tpOyW5b8T/y1/g5j25Dy7Stl9LZry22xtj/m8/nOqMpc/fCk+1qjE7uVogVEwusDR
 MdrLTadVg8Tfor2CQMkYUPeF6CotVCOZnYDiYMxzpT5+FiGYsggCeOtJWuy50S8NnYeA
 RfW/LG7XaOHQ6LRT9d3xfBPJ70NeCSRtCGUFyCRQ9exbhAh59Bl0S0Hb7uNNsmQ8hc2i
 nO9UZMEvYBuewr/CkpT34nSSSPnXFAlfdo1tQfc/nxdNZYwWTNErlafBOzZK4GRqr5ub
 BHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f70f6IrV0YxEjaCs9DxeSPhQuDdLaxIEZSEaWG88uXA=;
 b=tMC5a6btUA0u9eghD0cZ9iYGTXwwEhLlmyLNB/JoHGb7RMQ3tChBgdRvVQETxKm2+1
 klVYmpbFiNbm3+b8Kieh4fRWzwoM615yIDzfyaGo4eEM8OCCe98r/N5OmGscL5nE3+/+
 aN6z1LUryYwLq04mN63XlASVOqaMd/kyGcu01bOA3YXAseUE7iuyjAYCv4IDiU60NX3Z
 /s7Npx6VJtgfhL/VsycAsuoTUX+Jlf7cz1YydJkVMX5Ih+EuxvfSvSv89ByQiiMbRYmG
 AY8AqrVUhTi8wedUvk6voH7b1ShH6/+l3poNXBjkzHsqaGXcJRL7ykkuxNR6ZGrbOyZ/
 IWsA==
X-Gm-Message-State: AOAM533GluYGL+8tQ+CR/ief/kjnUFSQakdwNbSjoX+abgJMeFHyQ+vl
 Rn/b1ziu8UvEL8Fyw2+Riqg+EdNTXpsrh6LqneY=
X-Google-Smtp-Source: ABdhPJx7APKDvb5pLdspcKbtqQHuogOBvlhkuNQrvEweAhJTwvPQg/Zo30df4jeOKEXwcHuWI25swo7X80ueqGE9D3w=
X-Received: by 2002:a17:906:4d4c:: with SMTP id
 b12mr5749555ejv.506.1594752117201; 
 Tue, 14 Jul 2020 11:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <1594733130-398-1-git-send-email-akhilpo@codeaurora.org>
 <20200714171036.GS3191083@google.com>
In-Reply-To: <20200714171036.GS3191083@google.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 14 Jul 2020 11:42:28 -0700
Message-ID: <CAF6AEGsvbnWiFXQUFR+k-CLJ2CsCEoiVVE8pGVq0X0=VHE3hHA@mail.gmail.com>
Subject: Re: [PATCH] drm: msm: a6xx: fix gpu failure after system resume
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
 <devicetree@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 Jonathan <jonathan@marek.ca>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@freedesktop.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 10:10 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Tue, Jul 14, 2020 at 06:55:30PM +0530, Akhil P Oommen wrote:
> > On targets where GMU is available, GMU takes over the ownership of GX GDSC
> > during its initialization. So, take a refcount on the GX PD on behalf of
> > GMU before we initialize it. This makes sure that nobody can collapse the
> > GX GDSC once GMU owns the GX GDSC. This patch fixes some weird failures
> > during GPU wake up during system resume.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>
> I went through a few dozen suspend/resume cycles on SC7180 and didn't run
> into the kernel panic that typically occurs after a few iterations without
> this patch.
>
> Reported-by: Matthias Kaehlcke <mka@chromium.org>
> Tested-by: Matthias Kaehlcke <mka@chromium.org>
>
> On which tree is this patch based on? I had to apply it manually because
> 'git am' is unhappy when I try to apply it:
>
>   error: sha1 information is lacking or useless (drivers/gpu/drm/msm/adreno/a6xx_gmu.c).
>   error: could not build fake ancestor
>
> Both upstream and drm-msm are in my remotes and synced, so I suspect it's
> some private tree. Please make sure to base patches on the corresponding
> maintainer tree or upstream, whichs makes life easier for maintainers,
> testers and reviewers.

I've run into the same issue frequently :-(

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

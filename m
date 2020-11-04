Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F28C2A6F47
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 21:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B856E804;
	Wed,  4 Nov 2020 20:56:31 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8396E4EA
 for <dri-devel@freedesktop.org>; Wed,  4 Nov 2020 20:56:30 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c16so3599099wmd.2
 for <dri-devel@freedesktop.org>; Wed, 04 Nov 2020 12:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QMz5XuaiSl2y5K3brn4ts6zliBq11tCQumna2ZD9gwg=;
 b=SJZCCPmggjEI3WSwrNv12XAc3V0t974Tjot8SwxaA5JGO+QOStpAbOhFhtiOnvu3+b
 yDmvlIEjwUlHMqAk6tS7kx2Qn/mqVpTUdCuw5s3eGDyx7Vb24Qw2cFAfifbhXvThB0ZM
 BkWEexz8mfawPufJKrMmmu/9sSa/MRKxNzi89UxCf4muNRFC4TCnUGWO8tNRMdmsC8pg
 or8u3PCTPuOksBmF7KDKEUr48DlKDlLhC7Lh8g1wgErBO7P+nwB9Du48eX7kwvB8Xfmo
 vuVoztUap4U9Xp6HUDM0NntBsB2YTmI3MTxTeP6eeIIi68YzsWMwgNkaDJQqVN1B9jl2
 cznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QMz5XuaiSl2y5K3brn4ts6zliBq11tCQumna2ZD9gwg=;
 b=EJt0A5d28XQ07MhX8lMUEXSmuNpz+LEni9DBBumuA5qgXviMzUGFvPByvqM+nXtO1U
 +RgctL/U/0W6qoO57Cn6I0pepkMt26NtZ+ShglJvJ3TligcBsToeJm1ztAebRh/Ls551
 wxiyXbvRkQcZ/YZtbYShRy6qtgzyj5Zo9jVOMow37KcSoeaMCTbeH0eUbXm+IF9l7Z4P
 /tBjExn0h9Z31GkuMhU5Z4u1llRVjrad6RWGPOCGUyX2jVJq6OoerphshEPV9SIg/T/t
 UJuK3xJu/amNLmxRcpZVaSWAaykLvD8jCl9gfKypxHCCzkzToHzoyYw04Qqik4+PJz6y
 d9Jg==
X-Gm-Message-State: AOAM532/Kmo0Blx5NHi6kTGD+O21rhfqEMqQ3XgL02v/4tm6+iKmEZIX
 4B7d0CKc6Jt952f6XZANMZPsWbT6w43Wo0ATqco=
X-Google-Smtp-Source: ABdhPJwZj9HwapeVTBuX6MbvmCI10ccxfb2V7iPfEujOr2zcUHGnUhcVOI4/pc/YpbPMBdEWvizQ7MVVagmsgcK7PJE=
X-Received: by 2002:a7b:c145:: with SMTP id z5mr2246798wmi.164.1604523387717; 
 Wed, 04 Nov 2020 12:56:27 -0800 (PST)
MIME-Version: 1.0
References: <1604054832-3114-1-git-send-email-akhilpo@codeaurora.org>
 <1604054832-3114-3-git-send-email-akhilpo@codeaurora.org>
 <20201104200300.GA4036650@bogus>
In-Reply-To: <20201104200300.GA4036650@bogus>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 Nov 2020 12:58:02 -0800
Message-ID: <CAF6AEGvj34MbnRS+A432AhOwMuL2BtTXJ+AD+zQ9w0_meV_-gw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v5 3/3] dt-bindings: drm/msm/gpu: Add cooling
 device support
To: Rob Herring <robh@kernel.org>
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
 <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 4, 2020 at 12:03 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, 30 Oct 2020 16:17:12 +0530, Akhil P Oommen wrote:
> > Add cooling device support to gpu. A cooling device is bound to a
> > thermal zone to allow thermal mitigation.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.
>


Thanks Rob

I've copied over your ack from the previous version.. but yes, it
definitely makes my life easier when patch senders do this for me ;-)

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

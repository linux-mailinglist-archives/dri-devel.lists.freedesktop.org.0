Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B580D509B0B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 10:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8854410FA18;
	Thu, 21 Apr 2022 08:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BF910FA16
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 08:50:05 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id m132so7526450ybm.4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 01:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C1t5mUF1ebuEHByKOPa7jvd5uPJ4IKlhTRldMrpukDU=;
 b=X7X1O9iZdMtSeshylJiakmEOV4UCGYmtQG5/k2PnUtQR35LhOowY9T0zT0TZ7chMfw
 PfGEjARNnp5i4aK9OW15d4E4lmkPv0Vfa2+oFSvEzlbOUzewFHAWSTPyjUYccbN26eKB
 YEtp4B+p7iKbdk4d2wq3m84k/DDtbU/vgWpSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C1t5mUF1ebuEHByKOPa7jvd5uPJ4IKlhTRldMrpukDU=;
 b=m43aCNvmFyklyQOVqlc3Z2HvCOYEa+pODngEAIGrISoOEzCdKQ+U7XgEhEzkgRZbEE
 m/S3ttltU90Kn+ggHu97OiyM4+0wpRMXBkyjoEQEXkGxh84K0b/WcpjNu7lj7tvNpNod
 A7ki8YMAEYFadkQrvlLxh3LzW4W1kd0wp4EdJpBbK3uXWfmrQbN8+cdbNAVtosSb8gOP
 JrQ43+eFs35P/XKpEdB8bqf2oM5+U2f5VHoleCMNgliG9jRYFUwIaHiC6vXIMVSnhCFL
 KQY4qzlNjAOCYmaCkg8TAVPcq/MhbVxO1g/2FSBjXy4sud7FBrZnGT9PxErf3XdM72k9
 zr2w==
X-Gm-Message-State: AOAM533Ct6LotddLgqbwmsQZwQp/Rvu9gBtKRb9sSHSxEzJIXm9puSrE
 ONZKEjcENUI4872p8CHhS7cYgyKnqFlE+5tnBPcAtw==
X-Google-Smtp-Source: ABdhPJyp/x2iHg2u/UbKD2umcDkFiw3TdbXVeOp6mmt8vzeFktbi6PtrjNtBzfFq1Myl4QMjaHUyxzECRA36CLqzFgs=
X-Received: by 2002:a25:2ac3:0:b0:645:36f4:2db3 with SMTP id
 q186-20020a252ac3000000b0064536f42db3mr12076194ybq.189.1650531004985; Thu, 21
 Apr 2022 01:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220414025023.11516-1-Nick.Fan@mediatek.com>
 <ee2f0819-8c9e-4160-c4ae-fb4ad0da3f3b@collabora.com>
 <b6509465-b7c7-0e66-071a-be85793cce58@arm.com>
In-Reply-To: <b6509465-b7c7-0e66-071a-be85793cce58@arm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 21 Apr 2022 16:49:54 +0800
Message-ID: <CAGXv+5EhBB2LiQ_XL_ya7aceE7SBqZpjrbXe-gf81ed8qbeKBw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: Add DT schema for Arm Mali Valhall GPU
To: Steven Price <steven.price@arm.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nick Fan <nick.fan@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 8:47 PM Steven Price <steven.price@arm.com> wrote:
>
> On 14/04/2022 12:51, AngeloGioacchino Del Regno wrote:
> > Il 14/04/22 04:50, Nick Fan ha scritto:
> >> Add devicetree schema for Arm Mali Valhall GPU
> >>
> >> Define a compatible string for the Mali Valhall GPU
> >> for MediaTek's SoC platform.
> >>
> >> Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
> >
> > Hello Nick,
> > Unfortunately, this binding is completely wrong.
>
> I think that's unfair, although there is room for improvement.
>
> > First of all, there's no arm,mali-valhall driver upstream - this will be
> > managed
> > by panfrost later, yes, but right now there's no support.
>
> We need a binding agreed upon before support can be added.

+1. I asked them to send an updated binding for their hardware so that
we could have a discussion about it and converge on something.

> > Then, you're also setting opp-microvolt in a way that will never (or, at
> > least,
> > not anytime soon) be supported by the upstream driver, as it manages
> > only one
> > supply for devfreq scaling.
>
> The mt8183 binding (already in tree) is very similar. The binding also
> should be describing the hardware not what the driver supports. There
> are indeed limitations in Panfrost for supporting multiple supplies, but
> that's something that needs improving in the driver not a reason to
> block a (presumably correct) description of the hardware. I can't
> comments on whether the specifics of the mt8192 are correct.

Having an agreed upon binding also means that we can bring our downstream
driver into alignment, instead of having to maintain a device tree fork.

And +1 to being able to handle just one supply is a limitation of the
driver. Panfrost in its current state would just not enable devfreq
if more than supply is given [1]. Looking deeper, the OPP core currently
doesn't support more than one regulator for a given device.

> > Besides, please don't push bindings that have no upstream driver,
> > especially if
> > these are for downstream drivers requiring proprietary components, while a
> > completely open source implementation is in the works.
>
> More constructively, Alyssa has already posted a patch (as part of the
> series adding driver support) which would extend the existing Bifrost
> bindings to (pre-CSF) Valhall:
>
> https://lore.kernel.org/dri-devel/20220211202728.6146-2-alyssa.rosenzweig@collabora.com/
>
> I'm not sure I see the point of having a separate binding document for
> Valhall considering the (pre-CSF) hardware is the same from the kernel
> perspective.

So I suppose the next step should be to move the required MediaTek
specific changes into the existing binding instead of having a new
one?

Separately I think we would need a new binding to spell out the
requirements of MediaTek's two supply OPP table? Or maybe this could
be in the description of the Mali binding?


Thanks
ChenYu

[1] https://patchwork.freedesktop.org/patch/429782/

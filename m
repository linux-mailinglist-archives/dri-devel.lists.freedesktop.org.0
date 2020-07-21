Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DC722821C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 16:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAB86E578;
	Tue, 21 Jul 2020 14:27:57 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C4B6E503
 for <dri-devel@freedesktop.org>; Tue, 21 Jul 2020 14:27:56 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id lx13so21868634ejb.4
 for <dri-devel@freedesktop.org>; Tue, 21 Jul 2020 07:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FoM2lLvk+HU1JsguyDzCkDhJcQpe74th81bnFKHZ61k=;
 b=Tb36TVsvZyPVCNfk8o0RlrlP+mnR/eMaGMgp6Ca1CqlBYlXZG8opeFsuRSmWNEGnGT
 3a0tm2PbY756z7t31/5nk17pGk2BzWpoQBFQIyUej3lj4szEfe+nJh91oxub3Fy77Ztt
 tf4BTSjY2cEUt7m4bl9/ZYp4SZnw4Fi3KOq/M6F92/ntlTkSAaLFhE1WGSUUQImHNrKr
 tcRL5XsJwxlx/iEv9vt86Kc3XkyDdsQYaX8qd020OiJ4QhECITtA7w3G5t4t+V4XhVDz
 ZBaw6bBvig4y+KfHz01SUMWZbGu+5lTOxxFaAfSXLQu4XEfbEWDywzSrEfb7texqDZ4G
 aW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FoM2lLvk+HU1JsguyDzCkDhJcQpe74th81bnFKHZ61k=;
 b=m3yjZp/WHX5YE12NOcSOSfNcQoU1H8IaoPVRByCeVt6IXPnlX6J4BdWBfi2gsqc4zk
 A01dy8kOo5chE3nPgfDSnJsHGqCyQFUc4Pxzyp+c1FXHwKGw40bYJxyFcXAzz28gQACs
 jEjMuPQs3TpxU4AxgmvojEzrUsv9sn6KQsyCuWK4T1g5W+bMyr4wYZPRa584ZrQE7ZNN
 HNZGraN/rdQnM/9rbpCFKvM3z8BLWdPvfy3SdZ3T3d4YoJqaLqmOWan4bcNQA5nbx5o4
 A70dkzlGPOynUtRmKfNOU3kDgOeCfOt3y8RxEY+XeiFL5SlQU0RIKlRqyl6y+5lBKM1u
 +UTA==
X-Gm-Message-State: AOAM532NxWrfgLShQAKTnb6X/WdunDGC5jm6e99K2iBuZ7LSrilQ2jM8
 82TzBgx6tQjrV/qhAJlRCdQf5t2SIQmYAYI1dpw=
X-Google-Smtp-Source: ABdhPJzSo6Fh1hKllPx1Sf8jn5wjHy9PnUTmzYxaeqSTRJRgYWldpUIItzBxdpOIlcnV/OUxWXwrM0RFinDCHwJeuFY=
X-Received: by 2002:a17:906:ca4c:: with SMTP id
 jx12mr24039568ejb.231.1595341674113; 
 Tue, 21 Jul 2020 07:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
 <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
In-Reply-To: <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 21 Jul 2020 07:28:30 -0700
Message-ID: <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
To: Viresh Kumar <viresh.kumar@linaro.org>
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
 <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
 saravanak@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 8:24 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 20-07-20, 08:03, Rob Clark wrote:
> > On Mon, Jul 20, 2020 at 3:01 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 15-07-20, 08:36, Rob Clark wrote:
> > > > I can take the first two into msm-next, the 3rd will need to wait
> > > > until dev_pm_opp_set_bw() lands
> > >
> > > You can base that on a8351c12c6c7 in linux-next, I will make sure not to rebase
> > > it anymore.
>
> This was 5.8-rc1 + 2 patches for OPP. That's all.
>
> > >
> >
> > I can't really base on something newer than drm-next
>
> But you need the OPP dependency, isn't it ?

With your ack, I can add the patch the dev_pm_opp_set_bw patch to my
tree and merge it via msm-next -> drm-next -> linus

Otherwise I can send a second later pull req that adds the final patch
after has rebased to 5.9-rc1 (by which point the opp next tree will
have presumably been merged

BR,
-R

>
> --
> viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2791B23E20F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 21:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAF66E90B;
	Thu,  6 Aug 2020 19:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910086E90B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 19:24:51 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id v6so26287456ota.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Aug 2020 12:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ufFOfkDacyjTJ2b4poVGneXDhRTiC2asSjOYV8Zzi7E=;
 b=agj/vcDedpwLRztKTwZkkH7Jhlzi0QvOicLiQL8yP3N1VXEPc5+XUX9b6eCw6avXS2
 8IXFINwx6YoO0anQU4pU73pr5R4+zOwMxk4tSeam9Md/YJ+2cgXkkwgkz40KeZTLwKky
 LLoD3t5n+NfqmUFvkQjbATO5G9h21OC9WdR2NYDWkUjS5gZSInPmoyMmZ/pE+2MiBWg7
 QyScipIFhOUkHX6sK/lRBwNiF7lQ/6LjDRXBYCYqJlKti4v2aRoYq28/QNXzS2NnFmkh
 lbj58uc20vagfo7yjB25c/FIKi1STDNN4LWENfeResUVf8ntf+U0ls7af29Fzx58x3QE
 mU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ufFOfkDacyjTJ2b4poVGneXDhRTiC2asSjOYV8Zzi7E=;
 b=IJ+QJdXvMhX3jkaEgXK+kFVi5+7bsPVw3ofWr0SD6wcbiZdyS9ZLBaSv7QT2sMpm8y
 Jh1d/XmDdrgo2CY8PbsTcvyM+wg2CZkijmyxtXg8+aAQe6DwOYkKWeu/KGOYtllf2ojE
 ZAtaDBKcv737aIm0mrmw1TQ53pmXjUsdTZZUJGOPkry70mZJq9BF/griVYfN5NKNOsto
 sTIxH/0DvWOeyeb12l3KTwSjG+hR/oSED1tSvs0egB6qtn6sP/id6eOtnT4R7h3+AqKo
 d5XEPdGb6M7PkqUIRLslGayKE3bfB5BW4OmagB8h5FWOoWrwbnrINIZpwhholBoHYsGf
 x3HA==
X-Gm-Message-State: AOAM530fii8VYFwLb1siTsOZyhA0lUTK++0zqu3kjChd/NECJz5SroBy
 gM4pk4h5q6/22e0o63amJQNIvms3qVLA1mJIkzS87g==
X-Google-Smtp-Source: ABdhPJyT+ofLiLBi5uk4ciTwbk+Rcbs6LaNJPfeFZMMwRMBSfNNCvOcaceBw0JhiEIga7jmvmVF/r8bOuBOAYyR4meg=
X-Received: by 2002:a05:6830:3196:: with SMTP id
 p22mr9193414ots.102.1596741890839; 
 Thu, 06 Aug 2020 12:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200805105137.2b272efc@coco.lan>
In-Reply-To: <20200805105137.2b272efc@coco.lan>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 6 Aug 2020 12:24:40 -0700
Message-ID: <CALAqxLV_8phvdvezZV39sumS=D42+cZdfxCrCz6ht6eia8totQ@mail.gmail.com>
Subject: Re: DRM/KMS experimental drivers for HiKey 970
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, mani@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 5, 2020 at 1:51 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> I've been working to get upstream support for the DRM driver on HiKey 970.
>
> While the patches are not ready yet for upstream merge, I'm placing
> what I've sone so far on this repository:
>
>         https://github.com/mchehab/linux/tree/hikey970/to_upstream-2.0-v1.1
>
> The drivers there are a port from the Linaro's HiKey official Kernel:
>
>         https://github.com/96boards-hikey/linux
>
> The patches there preserve the old history. The porting patches
> are applied after the original patches imported from that tree.
>
> Besides the DRM driver, this repository contains:
>
> - a PMIC/regulator driver;
> - an iommu driver (still requiring some changes at DT properties);
> - A DMA driver;
> - a small ugly hack reverting some PM changes at the WiFi driver,
>   causing a regression on this board for HiKey 970.
>
> My current plans are to start upstreaming those needed drivers.
>
> The KMS/DRM driver there still need some changes. I guess it is
> not ready for being upstreamed yet. Also, it depends on the
> other drivers to work.

Hey Mauro,
  I'm really excited to see this effort being picked up! Thanks for
taking this on!

The patch set you have looks like it maybe started with a 4.9 tree
(I'm guessing the hikey960 4.9 tree which maybe was adapted as a
starting point for the hikey970?). Its nice to have the full history
but given the long lifetime, it may complicate reviewing a bit.

A while back, after 4.9, some folks at HiSilicon reworked the display
driver so that it could re-use and share logic with the already
upstream kirin drm driver, in the hopes of upstreaming it. This helped
avoid the smmu dependency, and some of the odd bits about how it was
tied to the ion heap driver (looks like you've already pulled that out
in your tree).  Unfortunately the upstreaming effort fell apart, but
I've been forward porting along the results of that work along. But I
haven't had the cycles to clean the code up (it has *lots* of
checkpatch issues for a start) to submit it.

You can find my current mainline tracking tree here:
https://git.linaro.org/people/john.stultz/android-dev.git/log/?h=dev/hikey960-mainline-WIP

And the drm display bits are here:
https://git.linaro.org/people/john.stultz/android-dev.git/log/?h=dev/hikey960-mainline-WIP&id=f5e888b02b683a9a6636174c6d2b74f697e87513

If you want to pick up these patches, refactor and submit them, I'd of
course have *zero* complaints :)
But even if you don't, hopefully this tree might be helpful for
comparison sake as you shake out issues with the current tree.

Do keep me in the loop, as I'd love to test and validate whatever
patches you do end up planning to submit.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

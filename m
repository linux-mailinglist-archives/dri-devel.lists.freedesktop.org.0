Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 940EC676BDB
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 10:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D94310E18A;
	Sun, 22 Jan 2023 09:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A2A10E18A;
 Sun, 22 Jan 2023 09:32:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1322C60B65;
 Sun, 22 Jan 2023 09:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7925AC433EF;
 Sun, 22 Jan 2023 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674379943;
 bh=uC3/a1QYuk7Er+b6doMs59esn5PttAah1q0oML9AKJ8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=h+3Mz7aSZxzP4hvHOHhdO/uvNEAUbRDUYGdu1xmdPQt1BkAVKn+L/UlhRgl2eNfvL
 RQHLiNXFHdO/BqxMkAnOeVJ3HAWMI0REfQtZ7PowO3RcdDcoM952iCsgUFhmFC0QDQ
 qYu6Ih2jRq+tAS7RyxjFngQb/h0I79vC3Mkduwvz6iEzIw+Oaw4nhij4SbK0Pe1xE7
 2flCdKyFAchyWWCi8P5LoJWKGkEVICodixudo1TlR9hT/Em1eYph+LC3igBAmfFJMG
 4HEl9565sFmAy+Zov1/pzI1Qt9zUZMfQxiOW4svgNXznUEyiGFXaM/diS8B15kf5EQ
 pfEKRvNcWLgOQ==
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-4c131bede4bso133017487b3.5; 
 Sun, 22 Jan 2023 01:32:23 -0800 (PST)
X-Gm-Message-State: AFqh2kokIizkgn5nUUqnkq4VCIXAGBavyc4ZviPPduXggywXQDZIjUoZ
 vo0clp4qDuRl0sj3J8JbqbysLX7Yl+yzP1zF1k8=
X-Google-Smtp-Source: AMrXdXv9TOgeuY1xgAbnP/G4ibHYtrwjCNO32Mt2B3HYIAybSnOd/Eeext8RtG65ea1RGvyvZZ23R35TAP8Qv2w3Sas=
X-Received: by 2002:a81:9b92:0:b0:4d2:755a:fda3 with SMTP id
 s140-20020a819b92000000b004d2755afda3mr2014674ywg.182.1674379942560; Sun, 22
 Jan 2023 01:32:22 -0800 (PST)
MIME-Version: 1.0
References: <20230120113246.1a0a03fe@canb.auug.org.au>
In-Reply-To: <20230120113246.1a0a03fe@canb.auug.org.au>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 22 Jan 2023 11:31:55 +0200
X-Gmail-Original-Message-ID: <CAFCwf11xZJi+-12FRO4yKhLHOkN_CEsa_W2RnGUkWHcEm+CiDw@mail.gmail.com>
Message-ID: <CAFCwf11xZJi+-12FRO4yKhLHOkN_CEsa_W2RnGUkWHcEm+CiDw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the accel tree with the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 2:32 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the accel tree got conflicts in:
>
>   drivers/Makefile
>   drivers/accel/Kconfig
>   drivers/accel/Makefile
>
> between commit:
>
>   35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
>
> from the drm-misc tree and commit:
>
>   45886b6fa0f1 ("habanalabs: move driver to accel subsystem")
>
> from the accel tree.
>
> I fixed it up (I used the latter version of Makefile and see below) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/accel/Kconfig
> index 4989376e5938,a5989b55178a..000000000000
> --- a/drivers/accel/Kconfig
> +++ b/drivers/accel/Kconfig
> @@@ -23,4 -23,4 +23,5 @@@ menuconfig DRM_ACCE
>           different device files, called accel/accel* (in /dev, sysfs
>           and debugfs).
>
> + source "drivers/accel/habanalabs/Kconfig"
>  +source "drivers/accel/ivpu/Kconfig"
> diff --cc drivers/accel/Makefile
> index b1036dbc0ba4,4df38885d6c6..000000000000
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@@ -1,3 -1,3 +1,4 @@@
>   # SPDX-License-Identifier: GPL-2.0-only
>
>  -obj-y  += habanalabs/
> ++obj-y  += habanalabs/
>  +obj-y += ivpu/
>
Thanks Stephen,
Fixes looks sane to me.
Oded

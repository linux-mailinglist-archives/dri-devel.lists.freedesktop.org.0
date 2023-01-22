Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B1A676BEB
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 10:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DCC10E2C7;
	Sun, 22 Jan 2023 09:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4A710E2C4
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 09:37:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5531660B65
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 09:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF271C4339E
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674380255;
 bh=5DRyo3CrCvjcrQiE2XRnY3KDz/9FE09qT4m/dJZH0aE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lNZIpcXkSoIvkFOhU4vTZhoSMYH/FNrvyVZoqcjnGD2/s69Cq72+OwArNRF4Y0XfB
 K8wZSWe0o3Ez8X35Z8m9gZ5px+EoB3UpyoXrO0Jn3YGzCabyabgxUQZUD9s+4ayFxf
 TwxwFCrsUDltNDS2jG8PhJQ98LTT3bm3MWRgUsXNBoAOYjvbr4vzKAgkShJiKAK0om
 ZpXDxImFRySz+saPmOQDwYI/CYL9PeQJFnK1HoJDjhN/RikP2iSzxT+WsnOUXmtCdd
 Ylgn69DBTJn7EbQ8Orshu3ZKKQejnYB1OhOwAkeUsLr7Ooym/PKu23lPzYon+3ZGI+
 QXiwxf144D42g==
Received: by mail-yb1-f175.google.com with SMTP id p15so7931501ybu.7
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 01:37:35 -0800 (PST)
X-Gm-Message-State: AFqh2kp7HXa63qFxXPplsEPcLCVLNHxto10+GKVVFYRRts+CiVIWPItT
 A5bgVA+xPDZMwyKbc9ei/8zORgWDyTtjTN7nzeg=
X-Google-Smtp-Source: AMrXdXsNA4vdApz7Jqsu/ybWJW5C5xYsmc6pnH1yI7UZkk+OVVQkpt4eufUHjmXdw7J7YX64IDe4L/lGXFrrrcbkdYc=
X-Received: by 2002:a25:344a:0:b0:803:60ae:431c with SMTP id
 b71-20020a25344a000000b0080360ae431cmr697945yba.642.1674380254802; Sun, 22
 Jan 2023 01:37:34 -0800 (PST)
MIME-Version: 1.0
References: <20230120123534.137413-1-bagasdotme@gmail.com>
 <20230120123534.137413-3-bagasdotme@gmail.com>
In-Reply-To: <20230120123534.137413-3-bagasdotme@gmail.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 22 Jan 2023 11:37:08 +0200
X-Gmail-Original-Message-ID: <CAFCwf11O75ivb2RjXCvbOyNRTgYrbNz8JSDgHprnoNS1vx9SQg@mail.gmail.com>
Message-ID: <CAFCwf11O75ivb2RjXCvbOyNRTgYrbNz8JSDgHprnoNS1vx9SQg@mail.gmail.com>
Subject: Re: [PATCH linux-next 2/3] habanalabs: Fix list of
 /sys/class/habanalabs/hl<n>/status
To: Bagas Sanjaya <bagasdotme@gmail.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Aaron Lewis <aaronlewis@google.com>,
 Linux KVM <kvm@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Freedesktop DRI List <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 2:35 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> Stephen Rothwell reported htmldocs warnings when merging accel tree:
>
> Documentation/ABI/testing/sysfs-driver-habanalabs:201: ERROR: Unexpected indentation.
> Documentation/ABI/testing/sysfs-driver-habanalabs:201: WARNING: Block quote ends without a blank line; unexpected unindent.
> Documentation/ABI/testing/sysfs-driver-habanalabs:201: ERROR: Unexpected indentation.
> Documentation/ABI/testing/sysfs-driver-habanalabs:201: WARNING: Block quote ends without a blank line; unexpected unindent.
>
> Fix these by fixing alignment of list of card status returned by
> /sys/class/habanalabs/hl<n>/status.
>
> Link: https://lore.kernel.org/linux-next/20230120130634.61c3e857@canb.auug.org.au/
> Fixes: 0a14c331682f61 ("habanalabs: update device status sysfs documentation")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  .../ABI/testing/sysfs-driver-habanalabs       | 23 ++++++++++---------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-habanalabs b/Documentation/ABI/testing/sysfs-driver-habanalabs
> index df2ca1a401b5a1..1b98b6503b23f5 100644
> --- a/Documentation/ABI/testing/sysfs-driver-habanalabs
> +++ b/Documentation/ABI/testing/sysfs-driver-habanalabs
> @@ -202,17 +202,18 @@ Date:           Jan 2019
>  KernelVersion:  5.1
>  Contact:        ogabbay@kernel.org
>  Description:    Status of the card:
> -                "operational" - Device is available for work.
> -                "in reset" - Device is going through reset, will be available
> -                        shortly.
> -                "disabled" - Device is not usable.
> -                "needs reset" - Device is not usable until a hard reset will
> -                        be initiated.
> -                "in device creation" - Device is not available yet, as it is
> -                        still initializing.
> -                "in reset after device release" - Device is going through
> -                        a compute-reset which is executed after a device release
> -                        (relevant for Gaudi2 only).
> +
> +                  * "operational" - Device is available for work.
> +                  * "in reset" - Device is going through reset, will be
> +                    available shortly.
> +                  * "disabled" - Device is not usable.
> +                  * "needs reset" - Device is not usable until a hard reset
> +                    is initiated.
> +                  * "in device creation" - Device is not available yet, as it
> +                    is still initializing.
> +                  * "in reset after device release" - Device is going through
> +                    a compute-reset which is executed after a device release
> +                    (relevant for Gaudi2 only).
>
>  What:           /sys/class/habanalabs/hl<n>/thermal_ver
>  Date:           Jan 2019
> --
> An old man doll... just what I always wanted! - Clara
>

Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Thanks!
Applied to my -next tree.
Oded

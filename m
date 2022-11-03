Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD43617DEA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 14:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602A310E28A;
	Thu,  3 Nov 2022 13:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EB110E29B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 13:29:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E547661EB0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 13:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33B0C4314E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 13:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667482168;
 bh=nYB3RB+AjUVoOwO1yDeiaVxLJ0D31WZD8FZbQ8TSmNg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QOPPXS5e0ASzWMACM+JrTIUGNfwGgYeUpV2IfcynlwdO1Alh3NqgCfsKgpRhz1MxT
 JN7Y9INd2skjnLQ0U9lrhtuZW5hpKWHwfbsBja3qs4tQTfwcRaP8p4W3uvE4wsUzA2
 o/+fVXncBf3Pm14dlBjgXWDBqHJXEYGEc0eQJKpatc9kFrdYBpQm/fzEm2Fk+4LChf
 j1th2ZNWsyh5NwENjUXSIsRNt4fk2Q6t/h7nL5bge4s7O6kFrCd+BiR7+ZrvY+mCRB
 NEKF8v5MjAg6oNfdWORbh1YSjCMw5H0BGcfLzEui0RZuZwpd55BekhGivAuFApSJWM
 XOgvOG3kiFEWA==
Received: by mail-yb1-f172.google.com with SMTP id 185so2212584ybc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 06:29:27 -0700 (PDT)
X-Gm-Message-State: ACrzQf3ALE7eXcxn5SZxtyMV/iJUXiN2j5hmhun/FvboZH0NBFBbV9pQ
 1dtlNntYSJBMfQFrTyuCbr0vTpbscpPW9dBnygE=
X-Google-Smtp-Source: AMsMyM7CWMX1wMsAxUqb0LEcvpP3bRnpLq13T6TY1U2hkCREcb5k3XiZQu0BvoxlFgSmAdWpotlBz2+3ZEC4sjb0Ik0=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr29629923ybe.642.1667482166923; Thu, 03
 Nov 2022 06:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-2-ogabbay@kernel.org>
 <e526752f-94e4-335b-6164-ed7597b75a53@infradead.org>
In-Reply-To: <e526752f-94e4-335b-6164-ed7597b75a53@infradead.org>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 3 Nov 2022 15:29:00 +0200
X-Gmail-Original-Message-ID: <CAFCwf12OSuUWP8pgO3CpPBDoCY2-1_-PmS10HxLJn7oGVDM-xw@mail.gmail.com>
Message-ID: <CAFCwf12OSuUWP8pgO3CpPBDoCY2-1_-PmS10HxLJn7oGVDM-xw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a
 new major
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 3, 2022 at 12:58 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 11/2/22 13:34, Oded Gabbay wrote:
> > diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
> > new file mode 100644
> > index 000000000000..282ea24f90c5
> > --- /dev/null
> > +++ b/drivers/accel/Kconfig
> > @@ -0,0 +1,24 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Compute Acceleration device configuration
> > +#
> > +# This framework provides support for compute acceleration devices, such
> > +# as, but not limited to, Machine-Learning and Deep-Learning acceleration
> > +# devices
> > +#
> > +menuconfig ACCEL
> > +     tristate "Compute Acceleration Framework"
> > +     depends on DRM
> > +     help
> > +       Framework for device drivers of compute acceleration devices, such
> > +       as, but not limited to, Machine-Learning and Deep-Learning
> > +       acceleration devices.
> > +       If you say Y here, you need to select the module that's right for
> > +       your acceleration device from the list below.
> > +       This framework is integrated with the DRM subsystem as compute
> > +       accelerators and GPUs share a lot in common and can use almost the
> > +       same infrastructure code.
> > +       Having said that, acceleration devices will have a different
> > +       major number than GPUs, and will be exposed to user-space using
> > +       different device files, called accel/accel* (in /dev, sysfs
> > +       and debugfs)
>
> Please add a period at the end of the help text.
>
> +         and debugfs).
sure, thx.
Oded
>
> --
> ~Randy

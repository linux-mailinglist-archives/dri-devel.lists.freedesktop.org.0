Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C3E60CF65
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 16:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3DF10E3C1;
	Tue, 25 Oct 2022 14:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8A310E3C1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 14:43:13 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46-20020a9d0631000000b00666823da25fso888767otn.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 07:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V+YUvxMJN1Ia93YxRf3chGSDyOBQQOLEOxAxVDNWPJI=;
 b=V+pBY54SA0twJVfCKJRf/JA1OkN1MaFq9gkfLqyvYnW7qDNqrto67VtKhzr+YLMS7i
 yPys2HMKrUTZbpT6snAjrfErEap3bZFbyceSoI2QlEJAfeui8u9O0bnJe2FTvft8h3Bb
 JknQA+MvTapyUiciIFV6WBCVC4/Y/wRB6t8NJM9VdoHzQ14HMzn/bRKHbH3ft8bs0jgy
 H1oMBGe1eRi1bVHeNMWJr+RvrR+RlhdjE0jd+gbi3E0jEbJQH5m11gNix1JUNT+LjbYZ
 ZAfubpXrzri1sS/XF2CAu2ECK1IoFJIywvdMz+n0+A2pPjen7/zTi5U5SwGdAJXka32z
 krmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V+YUvxMJN1Ia93YxRf3chGSDyOBQQOLEOxAxVDNWPJI=;
 b=GWkhxAVpZD5AvBuGV/bGFxblOvRH136zvAynk3d3atCvDSiEVCz8ay4UZzeLUwU68g
 FfMgOxP0JkgvHiAcPtdwMX0L7hhtBV/XUCw/hAQC3HPq/BjdttE07kzTCqv1CgGtyt4V
 jZgs2xglVQCuJSZiqtirz8onV+/gN57nnXdaiR3vZCKiNt6Qg4HilTdnqCcJPt9P/uud
 yjIWCoiOQtGGioTOHzMZ6XCtw7tSWrr7w5AbAcvVZ2NfoIYpKmLuR6LLVOgrhovkbzex
 2Du4fysvZ+PiNVosTWDwtmv8zOI1T7IdVyahzH/TrWz6zKIO40IE2Toq0RI0xrdyk+nL
 HCqA==
X-Gm-Message-State: ACrzQf0XmeToRq65snpi3780IScifG7M6xCed8xR2Gp0gfeRW09nILLx
 4LZlCWJvQPBdmAWUqXp8tWvehNAmv5mtGFyL7DA=
X-Google-Smtp-Source: AMsMyM5u7tzRYeOdHQJXgMqRAfZHJbHWuaRVh+exIuXOH4EAG5/KYXdgNC3w+axhYmpFI62Flo97/gzF6EqBtd469d8=
X-Received: by 2002:a9d:6645:0:b0:661:b778:41b8 with SMTP id
 q5-20020a9d6645000000b00661b77841b8mr19667831otm.233.1666708993198; Tue, 25
 Oct 2022 07:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <af4c71cb-be60-e354-ca4f-23e834aca6e1@suse.de>
 <CAFCwf12HDZvsr1TrRFQH9Vi26S-Xf9ULgxtBazme90Sj5AzhQQ@mail.gmail.com>
 <c22bd93e-8bd2-6865-711a-37aeadbca7f9@nvidia.com>
 <CAPM=9tyEqzQ09WcRtE1Zd3XjOaR9a2ms-vL-O5x2ong7iPF=4w@mail.gmail.com>
 <Y1fFRIxRq+enLWyd@nvidia.com>
 <CADnq5_PH3xR_nnN2wQ2NjydUoT+X0z_9OvHtaabwcPbwP-o+9A@mail.gmail.com>
 <Y1fz89kib4zVuqn5@nvidia.com>
In-Reply-To: <Y1fz89kib4zVuqn5@nvidia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Oct 2022 10:43:01 -0400
Message-ID: <CADnq5_OuVWTmgRZsyF50VdJg0AfSS7_3cN2UCWrBDayXcPUkSQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] new subsystem for compute accelerator devices
To: Jason Gunthorpe <jgg@nvidia.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiho Chu <jiho.chu@samsung.com>, Oded Gabbay <ogabbay@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>, Kevin Hilman <khilman@baylibre.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 25, 2022 at 10:34 AM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Tue, Oct 25, 2022 at 10:21:34AM -0400, Alex Deucher wrote:
>
> > E.g., the kfd node provides platform level compute
> > topology information; e.g., the NUMA details for connected GPUs and
> > CPUs, non-GPU compute node information, cache level topologies, etc.
>
> See, this is exactly what I'm talking about. What on earth does any of
> this have to do with DRM?

At least for the GPU information it seems relevant.  What value are
acceleration device cache topologies outside of the subsytsem that
uses them?

>
> We alread have places in the kernel that own and expose these kinds of
> information, drivers need to use them. Not re-invent them.

I don't disagree, but I'm not sure where the best place for these
should be.  Probably a lack of knowledge of where this should actually
live and indifference from the maintainers of those areas since this
use case doesn't match existing ones.

Alex

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F6560CED3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 16:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D434F10E3A1;
	Tue, 25 Oct 2022 14:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8016510E3A1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 14:21:47 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 p24-20020a9d6958000000b00661c528849eso7774875oto.9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 07:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9p8b3r4r5R88ziLyc8TQ9IiZL1OeYDsYpURNkbKqfCk=;
 b=BwEjBo8P6bns8/5Dw+Ak9i3INaSL07KKFzCbBHV0ZDUpuIYq9lxoAdu8fMawt4JwML
 CAxyLuzSoTsoix10JAiVA9GgCWjNmaS/RXMLqHuvC4zmtCTsN0z3QnN9i7T8kEQeP6dL
 3qSsTmRB3cR+iALMV7dB+5tv3Y5lAFaO3xA24cijN/uHkUo3v4jKaWZmZOnmyP3ubWk/
 Co7EL2PG3bdzsy+rdBGHzrIpK2QXXplE6PlXRCnEQSS050GNQtJS0cwTE7ausKfzheAi
 OjLwOODPw5cJiv10pIUypDx5Dzxy+PElu2H4X/bsP6h3wyyx6t6ddZ94/MPDMJKoMdUk
 HwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9p8b3r4r5R88ziLyc8TQ9IiZL1OeYDsYpURNkbKqfCk=;
 b=JS51facxqwQ7sV2ac646NXHVGmoOfDjJR/tJpeED3lNflCY17QuJocX1WMNYQ5oup0
 H7DUfxM9AlkC8KDoWYUWqIJDirjilcC3/19DYaZJVz+9gtbqnGf5YXEMXymcALXU4gGM
 pT3V2ccbooQAd2bFJtrRAUU0yD1kOU2fLtWwzssbFvTZI1H6YjT6TcTvETsKlahawOrV
 /GKQppzIImZwdMlheQMJQCHLRCka7HOjtlpwnoS2CS6qHY0CqXYw8K2HojvgKz/AJ4sg
 IvXr7kgKmrv0hgwXV4V9oV9TLcQCVL4vuWUpQn4jRf1fqVjxRYfcEODmU5VVAtXZVno3
 DJFg==
X-Gm-Message-State: ACrzQf1rWqfg2m2d4ZwSJ7RgAyCktZHWQfRPYzMnktYiTP3EMxBc4z6b
 LJMobyTVkcSFpMRPtlMz+oYSY5jj97MIrvGsSUc=
X-Google-Smtp-Source: AMsMyM7jdjnwHDf5ZBmC25i4R/uXpYqOYOgLhjD6TCWs0aGXZMwu717KJG+mkQn9pzR3X7Kdp4yw7YBWXiIix2Uh1ZM=
X-Received: by 2002:a05:6830:2475:b0:661:b91c:f32a with SMTP id
 x53-20020a056830247500b00661b91cf32amr19355124otr.123.1666707706758; Tue, 25
 Oct 2022 07:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <af4c71cb-be60-e354-ca4f-23e834aca6e1@suse.de>
 <CAFCwf12HDZvsr1TrRFQH9Vi26S-Xf9ULgxtBazme90Sj5AzhQQ@mail.gmail.com>
 <c22bd93e-8bd2-6865-711a-37aeadbca7f9@nvidia.com>
 <CAPM=9tyEqzQ09WcRtE1Zd3XjOaR9a2ms-vL-O5x2ong7iPF=4w@mail.gmail.com>
 <Y1fFRIxRq+enLWyd@nvidia.com>
In-Reply-To: <Y1fFRIxRq+enLWyd@nvidia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Oct 2022 10:21:34 -0400
Message-ID: <CADnq5_PH3xR_nnN2wQ2NjydUoT+X0z_9OvHtaabwcPbwP-o+9A@mail.gmail.com>
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

On Tue, Oct 25, 2022 at 7:15 AM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Tue, Oct 25, 2022 at 12:27:11PM +1000, Dave Airlie wrote:
>
> > The userspace for those is normally bespoke like ROCm, which uses
> > amdkfd, and amdkfd doesn't operate like most device files from what I
> > know, so I'm not sure we'd want it to operate as an accel device.
>
> I intensely dislike this direction that drivers will create their own
> char devs buried inside their device driver with no support or
> supervision.
>
> We've been here before with RDMA and it is just a complete mess.
>
> Whatever special non-drm stuff amdkfd need to do should be supported
> through the new subsystem, in a proper maintainable way.

We plan to eventually move ROCm over the drm interfaces once we get
user mode queues working on non-compute queues which is already in
progress.  ROCm already uses the existing drm nodes and libdrm for a
number of things today (buffer sharing, media and compute command
submission in certain cases, etc.).  I don't see much value in the
accel nodes for AMD products at this time.  Even when we transition,
there are still a bunch of things that we'd need to think about, so
the current kfd node may stick around until we figure out a plan for
those areas.  E.g., the kfd node provides platform level compute
topology information; e.g., the NUMA details for connected GPUs and
CPUs, non-GPU compute node information, cache level topologies, etc.

Alex

>
> Jason

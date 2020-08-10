Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0752405BB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 14:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCB089E1D;
	Mon, 10 Aug 2020 12:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32C589E1D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 12:21:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k20so8128970wmi.5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 05:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=sK+nPyx5WoMICiJ3Qs4h5WWlLQUIHFIbElrPAgmCLH4=;
 b=O4inzXOeTcwN/B1iTrTGVZDZ48CMY6bIxdUpNgUpB54aHYnPm5UNmHqld+o9Dn55su
 1f9MFeihmiSvkvnjOskV8lOO5vN8gLdM6Pu8OURYyX/G/HHxZqe3vQGO+J6wcTHgYwnY
 n25F85aj0wVRsYpK7Y7SbfMd1YhSgc8mpk1y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=sK+nPyx5WoMICiJ3Qs4h5WWlLQUIHFIbElrPAgmCLH4=;
 b=JsVLq8skK6jEw/x0GRstfoEyFSrJ61igCtl9hXGz9CTobLp8s3IErG+XsP2X6OKhOl
 8LyWAR8f++f78mx+enD/8XbJTpHh7xsxrsmkSBUlYzY8dvMT4u8ldc1EisyuczeApD4c
 pFaVYYfYyJkc1kJsRdjSxYaIJkbRs3+X3ObabN9jnGghN8U52zYRtfAG7D72pAqlUE9b
 5Et3grNOJpIbUXVl3qd+9XHZnlb+bF91e/x0DmTY7gn20VddMtqWk0q7Tmv2GNogOcY3
 FD64HrZJHXcHpVuka3lzUPslAnrr8P2YnCG8ACN//pgo14kA4fhdLWnPTuhIkJdnDysh
 9ZQA==
X-Gm-Message-State: AOAM5335QzS8kT3Yb3MElSeQ2bOwhCtnv1hVnhF0DSNpZpYxFUYIc5qm
 jElchpCg5qHW7Z20pc11iaCAuw==
X-Google-Smtp-Source: ABdhPJzpZnEAGblsiWEP8Gj51L9OMtozRYzQYwBrfORSTiKSCckdnBIbi5mChPVjIxCeDGb61wXOPw==
X-Received: by 2002:a1c:dd06:: with SMTP id u6mr26217576wmg.39.1597062101217; 
 Mon, 10 Aug 2020 05:21:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l10sm20247630wru.3.2020.08.10.05.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 05:21:40 -0700 (PDT)
Date: Mon, 10 Aug 2020 14:21:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v5 00/14] Add regulator devfreq support to Panfrost
Message-ID: <20200810122138.GH2352366@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
 Rob Herring <robh@kernel.org>, Nishanth Menon <nm@ti.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Price <steven.price@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20200710095409.407087-1-peron.clem@gmail.com>
 <CAL_JsqLnOGVbO5T92dyzt3K-v4BRNt72yMpYR_wW-z8dpdVSvA@mail.gmail.com>
 <CAJiuCcfezzr7w9=-G6WK0p6YS=6SBAKF8jv=yAOyNFJ59X80qw@mail.gmail.com>
 <CAJiuCceufQko1KWmU0rHSaJiKMKST0L3OADE0O4_7myLtV4Zjg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJiuCceufQko1KWmU0rHSaJiKMKST0L3OADE0O4_7myLtV4Zjg@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 07, 2020 at 06:30:05PM +0200, Cl=E9ment P=E9ron wrote:
> On Fri, 7 Aug 2020 at 18:28, Cl=E9ment P=E9ron <peron.clem@gmail.com> wro=
te:
> >
> > Hi Rob,
> >
> > On Fri, 7 Aug 2020 at 18:13, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Fri, Jul 10, 2020 at 3:54 AM Cl=E9ment P=E9ron <peron.clem@gmail.c=
om> wrote:
> > > >
> > > > Hi,
> > > >
> > > > This serie cleans and adds regulator support to Panfrost devfreq.
> > > > This is mostly based on comment for the freshly introduced lima
> > > > devfreq.
> > > >
> > > > We need to add regulator support because on Allwinner the GPU OPP
> > > > table defines both frequencies and voltages.
> > > >
> > > > First patches [01-07] should not change the actual behavior
> > > > and introduce a proper panfrost_devfreq struct.
> > > >
> > > > Regards,
> > > > Cl=E9ment
> > > >
> > > > Changes since v4:
> > > >  - Fix missed a pfdev to &pfdev->devfreq during rebase
> > > >
> > > > Changes since v3:
> > > >  - Collect Steven Price reviewed-by tags
> > > >  - Rebase on next/master (next-20200709)
> > > >
> > > > Changes since v2:
> > > >  - Collect Alyssa Rosenzweig reviewed-by tags
> > > >  - Fix opp_set_regulator before adding opp_table (introduce in v2)
> > > >  - Call err_fini in case opp_add_table failed
> > > >
> > > > Changes since v1:
> > > >  - Collect Steven Price reviewed-by tags
> > > >  - Fix spinlock comment
> > > >  - Drop OPP clock-name patch
> > > >  - Drop device_property_test patch
> > > >  - Add rename error labels patch
> > > >
> > > > Cl=E9ment P=E9ron (14):
> > > >   drm/panfrost: avoid static declaration
> > > >   drm/panfrost: clean headers in devfreq
> > > >   drm/panfrost: don't use pfdevfreq.busy_count to know if hw is idle
> > > >   drm/panfrost: introduce panfrost_devfreq struct
> > > >   drm/panfrost: use spinlock instead of atomic
> > > >   drm/panfrost: properly handle error in probe
> > > >   drm/panfrost: rename error labels in device_init
> > > >   drm/panfrost: move devfreq_init()/fini() in device
> > > >   drm/panfrost: dynamically alloc regulators
> > > >   drm/panfrost: add regulators to devfreq
> > > >   arm64: defconfig: Enable devfreq cooling device
> > > >   arm64: dts: allwinner: h6: Add cooling map for GPU
> > > >   [DO NOT MERGE] arm64: dts: allwinner: h6: Add GPU OPP table
> > > >   [DO NOT MERGE] arm64: dts: allwinner: force GPU regulator to be a=
lways
> > >
> > > Patches 1-10 applied to drm-misc.
> >
> > This serie has been superseded by v5.
> >
> > Could you apply the v5 instead.
> =

> Oups forget my email
> =

> I got an issue with my gmail...

drm-misc is a non-rebasing tree (because it's got lots of
maintainers/committers). Which means we need fixup patches now.

Not that currently drm-misc-next isn't in linux-next because of the merge
window, so just rebasing on top of linux-next wont work (at least not
until -rc1 is out). You can get the tree here meanwhile:

https://cgit.freedesktop.org/drm/drm-misc/

Cheers, Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

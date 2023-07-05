Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5BC747C6E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 07:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D0310E13D;
	Wed,  5 Jul 2023 05:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1410110E13D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 05:31:02 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-c11e2b31b95so6959026276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 22:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688535061; x=1691127061;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hhZT6HGQXrVs8HZ8Yfrd/PZq4RDzl4JlYHbBSawlJgI=;
 b=R5OVgpIC90iWV3nWzt2HXZGAIvsOeD/ei/ifmVZdzx6b4rVqE8L79w94X/5VBCpfQ1
 hPrCtKY1IzJm8mwCi4kDeLrfwlk3Ip3KPawv70AgPxJjDEKJRueNME6H9QNikl3J6/j4
 bMMnID1Wxnw6A56aOLw7sDJeGDDD6ikNpJQFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688535061; x=1691127061;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hhZT6HGQXrVs8HZ8Yfrd/PZq4RDzl4JlYHbBSawlJgI=;
 b=bnGCdp+5s5wzyEAUi7B8PlhhJADuKsABERcxvjjWD9L0GhJHkpOGQnXg2qkXsxtDtg
 Vdk1dt+fhMk9VjlP54fj9pKJ5UTabzuXMYqszGFHPXkEhO9rvSINaHnQRV1eiZI/lgwd
 oaXmaSTD4CcfLfU0pa/KKNUxQ5lMTqVTIS9lXItTA5aAJYhT9KfF/ib5E3unfmIXMILG
 dXD4PPSvYLr5tCr0So094zhSxO7ZPNKjm5AgAlyqaIqRi7x8d9c4a8RxDnpW/3zIvt4M
 gVwZLuMyWHqkNdU4CNw0hwZU6iG4n9hrIZnZlR7gNImJiTRpNz958OfUYQ9QjOFhJZ+1
 A48Q==
X-Gm-Message-State: ABy/qLZ6bCoihnYmnGClnue5PJjiry38vLb/q8xrBef+fMrwhwWGs+jS
 kAaGkn+i1LbU6EpuQHg5/QcgckCaMBRv73Sb/ACVmA==
X-Google-Smtp-Source: APBJJlGhxcdbaq6knM24Q2XbhP4OqN8lqf9RuZf+WpretMgSEJbM954+clOOc+Jp7/XBlDYvX88W3zII7F/VAeLDgx0=
X-Received: by 2002:a5b:5c8:0:b0:c63:7758:701f with SMTP id
 w8-20020a5b05c8000000b00c637758701fmr355911ybp.65.1688535061715; Tue, 04 Jul
 2023 22:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
In-Reply-To: <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 5 Jul 2023 11:00:49 +0530
Message-ID: <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
To: Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Michael Walle <michael@walle.cc>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Amit,

On Wed, Jul 5, 2023 at 10:15=E2=80=AFAM Amit Pundir <amit.pundir@linaro.org=
> wrote:
>
> Hi Marek,
>
> On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
> >
> > Do not generate the HS front and back porch gaps, the HSA gap and
> > EOT packet, as these packets are not required. This makes the bridge
> > work with Samsung DSIM on i.MX8MM and i.MX8MP.
>
> This patch broke display on Dragonboard 845c (SDM845) devboard running
> AOSP. This is what I see
> https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-displ=
ay/PXL_20230704_150156326.jpg.
> Reverting this patch fixes this regression for me.

Might be msm dsi host require proper handling on these updated
mode_flags? did they?

Thanks,
Jagan.

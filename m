Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D89758947E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 00:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4CB2BF6A;
	Wed,  3 Aug 2022 22:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7978C2BABA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 22:41:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F15ABCE24FA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 22:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696E4C433B5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 22:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659566509;
 bh=ntYFjSzSR88TSVWbSyeixkWIhxUbsdZr2Qan6hXpvzQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b3D5XQQ2ATAbBfoT1BFT8kT/o3yZNKhlmR8sPZ1eLxbO2Xh1G9kxNSOUA0WZSceIx
 jygimGKIN2yhbf/OF/VrqozpAQPuyZlzAUT4oMXpOWimURFlYgHJ8xdXzhUhrWoLyP
 NobcgIBFsq7WoZUC4x4bSAdq6rvjLAawRfeI9RDCIWn+M3lOU03vEMsl0wp2bgDQNc
 8rA/J+ZxPw50nEY/Rv7Mlvuj2BCFXJuvudCxQTF1lI7NtGuMb1/Q1tcpk/szdmDZJq
 wM0uIuX4lcHeSXLxY3zVp/Oj3TRovw9Eofnk5FfLQ9knhbJVBgYNLPT/ce2V8OHGKs
 NEyIbcADo1S4Q==
Received: by mail-ua1-f50.google.com with SMTP id t21so7585570uaq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 15:41:49 -0700 (PDT)
X-Gm-Message-State: ACgBeo2ho4+bhMLoDanfBVC0i+j+9sEIEFu/AgNkf/z8o6hU/aiZOrz7
 b7G7UrlevNbnFSxJF5zEGEcD3Hyk2tAmJLstSQ==
X-Google-Smtp-Source: AA6agR4nbXpPa5zBjslr9fGKzSeyuJweJKlrAwtkqUrLe2hL/wqObYzlWQ6F4v86U+5SCJS3wSZTCCzM/zpkRZFuAWU=
X-Received: by 2002:ab0:6798:0:b0:382:d9f4:8d0 with SMTP id
 v24-20020ab06798000000b00382d9f408d0mr11043836uar.63.1659566508212; Wed, 03
 Aug 2022 15:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220801131901.183090-1-marex@denx.de>
 <20220801163238.GA1130127-robh@kernel.org>
 <4d917546-23a2-a33a-1f59-ec78305aa854@denx.de>
In-Reply-To: <4d917546-23a2-a33a-1f59-ec78305aa854@denx.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Aug 2022 16:41:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLHKnL80spDSAqMq0cOkVNztv0MjVsR-Rs83qd_q7_MQg@mail.gmail.com>
Message-ID: <CAL_JsqLHKnL80spDSAqMq0cOkVNztv0MjVsR-Rs83qd_q7_MQg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: icn6211: Add support
 for RGB/BGR swap
To: Marek Vasut <marex@denx.de>
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
Cc: devicetree@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 2, 2022 at 5:33 AM Marek Vasut <marex@denx.de> wrote:
>
> On 8/1/22 18:32, Rob Herring wrote:
> > On Mon, Aug 01, 2022 at 03:19:00PM +0200, Marek Vasut wrote:
> >> The ICN6211 is capable of swapping the output DPI RGB/BGR color channels,
> >> document a DT property to select this swap in DT. This can be useful on
> >> hardware where such swap happens.
> >
> > We should ensure this series[1] works for you instead.
>
> [...]
>
> > Rob
> >
> > [1] https://lore.kernel.org/r/20220628181838.2031-3-max.oss.09@gmail.com
>
> I'm still not convinced that we should encode this pixel format value
> directly into the DT instead of trying to describe the DPI bus color
> channel width/order/shift in the DT instead. I think I mentioned that
> before in one of the previous versions of that series.

I worry that it gets pretty verbose, but worth having the discussion.
In any case, let's have that discussion and not add yet another one
off property.

Rob

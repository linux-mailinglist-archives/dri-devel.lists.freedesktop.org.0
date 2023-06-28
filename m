Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4507407C2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 03:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621FB10E2DB;
	Wed, 28 Jun 2023 01:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C6010E2DB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 01:47:21 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-39e9d1bf835so3902502b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 18:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1687916841; x=1690508841;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=39f5Ofs4Fut4oG/x67xmD5HKVQS6vifJS9n1Fqh5CNI=;
 b=xCwf9hAwyokrWOGO7CX935cGCvgM7aunAkp6xEeawz1c2RtC1heZey3QYcfDZD205r
 hrqHBiB4isLHaYtBq5xyNuHLup9OdGt/LRrEiH786z8vYdu+ws4UwiE2bO71ztqUfVEa
 9xdUBGg/I8Kt9nxdQnb+RZahB3yaUyYznzbdGDDJ7QA3TBxRZT9VmjAzfEDg7Q/GMGUM
 gcDVRgMXClox+ITMtyGgKcM1qZz5dkJBHaXn28Mchsxhyv+SeBYF5u9LtDSX0N2xngqs
 mPrTsZQ4pTIIY6ByM1galx7dSoRDyWiH7A/Y6LH7HanurvSyOsBwCyDTh4JvDaHceB9W
 PXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687916841; x=1690508841;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=39f5Ofs4Fut4oG/x67xmD5HKVQS6vifJS9n1Fqh5CNI=;
 b=jxM+o8uq2ghFUXzrYXVCWt4Tl2S8D45Y4kbMPGRq/ncEAT5KBSna4Va8y2NArQDe0S
 vKfy+SWGvNhmG64hJGE7N1gb5kxkR0CbM2hJZ9I2IbBIZMhjlVHgvkhTOO+8/G7SPDPb
 O4ipm3LkbLVrgG1X0QXRn2LbDlRsns7bH9qGzR9qfWPo4zYC6QwpITIA3Eyr36ZJQQMY
 lKOQwljDX4ZwShgwFWmwPMyaRxgChCzwVHJvxODyCN9mPdLCCPvX2utp2H0+GUMwePFc
 bKrdX72l+l+fXNf9FQYpYVuH8MK8c0TBV/xE9JMNwD3wPR81T8H/57UvDFiKfNq0N2Yw
 I1MQ==
X-Gm-Message-State: AC+VfDyL+BBM/R4u5DVj2ecw51Rnh2T5tUNkH+GNa5V0Wxd3uhIhiqw1
 yiiSNhVjaqpd1HxJTac/uFEIXsBhO/jCYbLya+y1Kw==
X-Google-Smtp-Source: ACHHUZ7c501zOPij6leqylYmOj8Qka5FCrkxofq6AvdEns+6OFM8mCOc1asFuyTCWGmGLGr1txrh4LPuXsNJwsPyEls=
X-Received: by 2002:a05:6808:1b07:b0:399:b7bd:9041 with SMTP id
 bx7-20020a0568081b0700b00399b7bd9041mr36225966oib.34.1687916840967; Tue, 27
 Jun 2023 18:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230627050148.2045691-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=WR=fnhCxC37Eo3hinh2MV=eTNuXG+GrwgR6K_pV4Rbaw@mail.gmail.com>
In-Reply-To: <CAD=FV=WR=fnhCxC37Eo3hinh2MV=eTNuXG+GrwgR6K_pV4Rbaw@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Wed, 28 Jun 2023 09:47:09 +0800
Message-ID: <CAHwB_NLDFqDEQ14cTAo3z1pvXvCZXhMeRbTXM3u93hVtpjE52w@mail.gmail.com>
Subject: Re: [v2] drm/panel: Fine tune Starry-ili9882t panel HFP and HBP
To: Doug Anderson <dianders@google.com>
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, sam@ravnborg.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Doug


On Wed, Jun 28, 2023 at 5:17=E2=80=AFAM Doug Anderson <dianders@google.com>=
 wrote:
>
> Hi,
>
> On Mon, Jun 26, 2023 at 10:01=E2=80=AFPM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > Because the setting of hproch is too small, there will be warning in
> > kernel log[1]. After fine tune the HFP and HBP, this warning can be
> > solved. The actual measurement frame rate is 60.1Hz.
> >
> > [1]: WARNING kernel:[drm] HFP + HBP less than d-phy, FPS will under 60H=
z
>
> Thanks for including the warming. This looks like something that's
> only printed on Mediatek display controllers. Just out of curiosity:
> is that because Mediatek controllers have special requirements, or is
> this something generic and the Mediatek controller is the only one
> that warns about it?

It seems to be a generic calculation formula for MTK controllers.
At least I have see this warning in both MT8186 and MT8188.
By the way, the same warning will also appear under coreboot.

>
>
> > Fixes: 8716a6473e6c ("drm/panel: Support for Starry-ili9882t TDDI
> > MIPI-DSI panel")
>
> Ideally the tool you have to send mail wouldn't wrap the Fixes line.
> Probably not worth resending just for this, but see if there's
> something you can do to fix this in the future.
>
> Since this is a tiny fix, I don't think we need to wait too long. I'll
> plan to land it on Thursday unless Neil wants to land it himself
> sooner.

Thank you, Doug.

>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

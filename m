Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A20A647429
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 17:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A361A10E4C8;
	Thu,  8 Dec 2022 16:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908A410E4C8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 16:25:09 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id e205so1868873oif.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Dec 2022 08:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5yZVkluqAdglv3EHsLew8wJwcBKXP+wP1Mag/KxLQSs=;
 b=BwVeuTcDfLSTZrSjHLuiakOSC/ep0V894NkRCoK2REUB+BrRF44aU6WBZYLRR/o22Y
 RW/1ubGJo3HH9lchcD7+iDu5BqwWRYG+X95kDv7FlQZaxFiBas9FqEr/x6p0XA1vNCxX
 E5PXUqCRBCtl7655B0ylUIR0VYqg31TcsQWuYrP8R/84h0kXyYVMOte2Utgze1zzwCyn
 ZJzHiwc3bZB+4RJoqRHYmmQJI9lLaQOxQKXD2evVZa9qH8JRM/SRPfiNDqihA6oNBGfk
 PhpCROGKVTprqzZ/d3Ccc0fWb06c6dJhMgCCSWudElinuCpH/mdZhOWLZE7e0FjaDXSC
 gqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5yZVkluqAdglv3EHsLew8wJwcBKXP+wP1Mag/KxLQSs=;
 b=qYmgsW5RekFcsPQkuGMCI0qcgRmdoqLSoRQ+tvkT0H9resRP4BdsmtpVd8VsTs8Ap/
 l9+lKJ6BLsBAIvpVTGg8AN/x6Gg9Os/9OUXlSSI8bXT4Q2LCxkdXETlHUNEjyAX2yzsu
 /sTFdfrylqVMSa4VPDf+wb0l02UzgpEYHLf8KjPiEJFgbwhpNKMEHUXlJg0hLLLsYZrs
 wCOpwLv71KCK6liko60auodx4NNVgO8gln3d6dkxEy/brglZKUeDnQKlVrMiVZANqXDC
 FN9Sy8IOyQ5pTay548PY/k14Y1kp+4a4QnUWeW5YGkqlBv4ftLhM1Wkh0ICqxdN2pIlo
 lnlg==
X-Gm-Message-State: ANoB5pmUTtg2b775XDNHfkwyVWbNwgTg9PozNksPHWMTtjSe/jWPbpIQ
 S09MGipogP0B+HndtLYdIGsH5+E0nfjydwk1QCrhsQ==
X-Google-Smtp-Source: AA0mqf4AGcBT2ckDS+9n6KwnkfxRKsMyC4j/w/jAEFBJz6mZglLyyJBZW80DLb9+SkYzh2t28cqWas2cjJtQ01z5kPM=
X-Received: by 2002:a05:6808:143:b0:345:8913:17ae with SMTP id
 h3-20020a056808014300b00345891317aemr37409795oie.155.1670516708636; Thu, 08
 Dec 2022 08:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-20-uwe@kleine-koenig.org>
 <20221207141546.tvpbgmjej5kmoxtm@pengutronix.de>
In-Reply-To: <20221207141546.tvpbgmjej5kmoxtm@pengutronix.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 8 Dec 2022 17:24:57 +0100
Message-ID: <CAG3jFysqWgknBW4hVHvyxFMQi=e_91bQVatXXaNsQtfUETQT8w@mail.gmail.com>
Subject: Re: [PATCH 019/606] drm/bridge: chrontel-ch7033: Convert to i2c's
 .probe_new()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "linux-i2c@vger.kernel.org Doug Anderson" <dianders@chromium.org>,
 Wolfram Sang <wsa@kernel.org>, Angel Iglesias <ang.iglesiasg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 kernel@pengutronix.de, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 7 Dec 2022 at 15:15, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello dear drm/bridge maintainers,
>
> On Fri, Nov 18, 2022 at 11:35:53PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> >
> > The probe function doesn't make use of the i2c_device_id * parameter so=
 it
> > can be trivially converted.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> Do you plan to pick up the drm/bridge patches in the upcoming cycle?
>
> You could do that using:
>
>         git pull https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linu=
x.git i2c/client_device_id_helper-immutable
>         b4 am -l -3 -P 14-35,37 20221118224540.619276-20-uwe@kleine-koeni=
g.org
>         git am -s ./20221118_uwe_i2c_complete_conversion_to_i2c_probe_new=
.mbx
>
> Note that Doug Anderson already applied the patch for ti-sn65dsi86,
> which is patch #36 and so this is skipped in the above range.

Applied to drm-misc-next.

Feel free to grab a hold of me out of band if you hit any snags like this a=
gain.

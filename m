Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EDD74057D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 23:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586F010E055;
	Tue, 27 Jun 2023 21:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D02C10E055
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 21:17:25 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-516500163b2so966a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 14:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1687900643; x=1690492643;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cBeSv/arp5bR8O0ezFl7fdKlEKxWfXnzLYU9+AdmzGc=;
 b=tfUpx5yzTHhQIqvV6B/hMBOXajoW3JRxIkAPylYF9WdKHxjWQXkaz29OkaD06EUW+C
 /tSk+kBo0MdDNbAf7SbEV9eaO4cZ/IK21j7EeF69T3+T4FzzOV+PVke8d6c+Bb5S1HQ6
 hLo5lk8AvJtb9soHB+Yq8dVmRdFaso7T2mFv1mIKj+d55uOi+2yqs11OZq8dxUl241lz
 awwPlDOWsF0ihnewJriL+vS5clDEI6pQt4emYOx9wGU1+1QnOmI0tM70awk/SeNecE/U
 1czgUpwJqXcK5y/RIVjx/rZrDm5qZhvRlJVmFjXFnzG3xAq92G/YDwthgX0Iz5XRgtSC
 2tLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687900643; x=1690492643;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cBeSv/arp5bR8O0ezFl7fdKlEKxWfXnzLYU9+AdmzGc=;
 b=PLWmz8assIKuDSGqiBcZv+1xg+m7h9EvWaVgsun30Az31JmC8LvbBqNOOgZ9ljcDhi
 dmBJ1vVrenhvCoLQje2tR3Q0Nl5VisKreSQEsNpYyP1J5IKFT/X1M3W2gWzPOnbUxhnb
 oh213EUH91qAb0nEDNGvvtGtnDTIVkB1VLK5QxYFhnGuqtCLnXAfGJ7cMhj4EZzAcOzG
 N2aGP2VapQqmO12pXmTsG1bTcTXS+C8LlVmSMVA0GHNoSkNs4BdoxYzw68D9u7VM7Bzb
 sQ3nKNyNTTp/n13UTCYll0GFApxTuPP1kJ7/4F1a9r+sKAXrqsN72xzPELTV5cDtwWWc
 YF+A==
X-Gm-Message-State: AC+VfDzJHTpuR82XdIQ/siNyQ0w+G0NhM3QiW0xwuqaZx8dfW3fmqexL
 EdV5fVytOsbFi1ljNMtutaGEs5728pdtdbrocdalwKhszTXN1yydzZCxWQ==
X-Google-Smtp-Source: ACHHUZ70Q5j1PrnGsHu1Pss9Gi238RZdicz8QeFii6Q1FnA+fmkZQD6gh8CYj3Aib3f7Q0vjX9+44Tr1PgkxN5zxB2M=
X-Received: by 2002:a50:d087:0:b0:506:b280:4993 with SMTP id
 v7-20020a50d087000000b00506b2804993mr28983edd.2.1687900643282; Tue, 27 Jun
 2023 14:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230627050148.2045691-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230627050148.2045691-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Tue, 27 Jun 2023 14:17:10 -0700
Message-ID: <CAD=FV=WR=fnhCxC37Eo3hinh2MV=eTNuXG+GrwgR6K_pV4Rbaw@mail.gmail.com>
Subject: Re: [v2] drm/panel: Fine tune Starry-ili9882t panel HFP and HBP
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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

Hi,

On Mon, Jun 26, 2023 at 10:01=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Because the setting of hproch is too small, there will be warning in
> kernel log[1]. After fine tune the HFP and HBP, this warning can be
> solved. The actual measurement frame rate is 60.1Hz.
>
> [1]: WARNING kernel:[drm] HFP + HBP less than d-phy, FPS will under 60Hz

Thanks for including the warming. This looks like something that's
only printed on Mediatek display controllers. Just out of curiosity:
is that because Mediatek controllers have special requirements, or is
this something generic and the Mediatek controller is the only one
that warns about it?


> Fixes: 8716a6473e6c ("drm/panel: Support for Starry-ili9882t TDDI
> MIPI-DSI panel")

Ideally the tool you have to send mail wouldn't wrap the Fixes line.
Probably not worth resending just for this, but see if there's
something you can do to fix this in the future.

Since this is a tiny fix, I don't think we need to wait too long. I'll
plan to land it on Thursday unless Neil wants to land it himself
sooner.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

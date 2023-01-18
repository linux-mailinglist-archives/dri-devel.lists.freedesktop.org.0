Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864D36713B6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 07:16:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651F810E6AD;
	Wed, 18 Jan 2023 06:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC6710E688
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 06:15:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1DD2EB81AA4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 06:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98F6C433EF
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 06:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674022553;
 bh=xAwPgAk3uvmqnBOgCnj/zIwcntbxU1M7GzwDPVEI9Io=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XxhkJkoF1KKNhXaM5ZPvV37uImU1ovykdn+7DkdyoBO3GBdfJhctQ1mwiBb/WwulS
 Sy99rzAUY6UvaJrn8fkdoNoepofV7/8QifGdPm5iSlDg5OPUNx9o+Czb7ERaVfbytn
 9Q4u4nWFYr7chU/tGRtx9oIql+Isp+ThM06X6xoBYmLzhkBcQekUgmkhaxURyEG/uY
 iydd7qmoRm8rJCbaxidElB/a1joD3mLtU6hAeLA0nInJIRB4r+7JMbWTmcDdy41Dcx
 5gKZBST2fQPcuZQR3NsoKNe2Q0KVL6U0k+W54uxgN0nHVCUacjxDk0JEHMMoKG+r9L
 ReWBuYo9o2mtA==
Received: by mail-yb1-f171.google.com with SMTP id a9so20245044ybb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 22:15:53 -0800 (PST)
X-Gm-Message-State: AFqh2krdWVRlpmqOxbu8YfgIdu/qW0fZ/DE/xdvNSy9lpFU3vfjREpCh
 rD4J8pX+jv9olgxMxoLhxXWfobXV85ngqv3ZlpU=
X-Google-Smtp-Source: AMrXdXt8KdQLPinhpBGYHp9Tcz1YySs/rR98VHNcNtzs1UXQGh6QyGMHvZFywNdOZi7ZwW/GeD5grHDpXTegtYzcd8U=
X-Received: by 2002:a25:d06:0:b0:799:3955:201f with SMTP id
 6-20020a250d06000000b007993955201fmr732112ybn.94.1674022552856; Tue, 17 Jan
 2023 22:15:52 -0800 (PST)
MIME-Version: 1.0
References: <1673978670-10110-1-git-send-email-quic_jhugo@quicinc.com>
In-Reply-To: <1673978670-10110-1-git-send-email-quic_jhugo@quicinc.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Wed, 18 Jan 2023 08:15:26 +0200
X-Gmail-Original-Message-ID: <CAFCwf12U-g1Z8w-AwgaBHUsUPPtwOWjSJBzpE+LgzGkoCx-ZBg@mail.gmail.com>
Message-ID: <CAFCwf12U-g1Z8w-AwgaBHUsUPPtwOWjSJBzpE+LgzGkoCx-ZBg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS/ACCEL: Add include/drm/drm_accel.h to the
 accel entry
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 8:10 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> get_maintainer.pl does not suggest Oded Gabbay, the DRM COMPUTE
> ACCELERATORS DRIVERS AND FRAMEWORK maintainer for changes that touch
> the Accel Subsystem header - drm_accel.h.  This is because that file is
> missing from the Accel Subsystem entry.  Fix this.
>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 31ffd4b..7995ec7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6754,6 +6754,7 @@ C:        irc://irc.oftc.net/dri-devel
>  T:     git https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git
>  F:     Documentation/accel/
>  F:     drivers/accel/
> +F:     include/drm/drm_accel.h
>
>  DRM DRIVERS FOR ALLWINNER A10
>  M:     Maxime Ripard <mripard@kernel.org>
> --
> 2.7.4
>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
I'll merge it through my tree.
Thanks,
Oded.

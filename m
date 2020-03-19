Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE9818BF0E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 19:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D2B6EA54;
	Thu, 19 Mar 2020 18:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD11D6EA52
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 18:07:07 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id o3so2288967vsd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 11:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PNbkuwcxRY/5NdpGatcuzNNiZqstQLs90QoS76KAs3c=;
 b=IhhRP9CTg02j9zaxsX8RCjJcCZ5AtYZL4qbmjD1DrW5528Hpb0kijgdCy0sBZFiO7T
 yRw0OxLaQu/lqpWnC6ETkFwLmc2ERbZf3HZEdWJn3uZ5TxQmdSnkI/Es94NckDNUg++D
 vrpHSj6S9uP+dbj+IJjvQIdY9fJ3cy/r6P2syGYs8KE7ZnOEUGCWMr24Urj9Y6EkGMk4
 1xgK+oqQfw1krowg9XnkmXgB0VxogBvB/P5ba/vYoRdLYFyCg7VW9WusMhRMa/Y8jp/i
 16XFpLenou+5+ePb1NqNWUCtOhu+SaiJkMmqNZ/hKs4dapM4v+zZHrlDzXdVoUDfcrjx
 TitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PNbkuwcxRY/5NdpGatcuzNNiZqstQLs90QoS76KAs3c=;
 b=RI7hnQmxLlGWhIdZmTVNIP6xXj8VOcWT2bOzjjQmWJxwAik4Jqz0f5iYqwwUipRjoB
 v7ZkYxo3OotyHHLXqsZKETcwETR0vX/l+f05G85+QXXay8t7MurB/izHGI5npWpRDWkp
 crC4N2vQqT6xJYmmtbvSwftS+Pw7Znj2Ya8DiDOp14XKOcb8gRmXMgRt5IKhQMDwGKop
 N1j3jTrkSWe7jerENa1+2U/ppxQXv4j3B6sh6JvjPLN2ZJA6V1IsibEt6jnfYq76eIZh
 T+5FRC/zuXcjL3CKPwasnC0MqIQUO+PPT3D368YBD7gHrPJedV/9D/FQIRbVixhMbEAS
 tqzA==
X-Gm-Message-State: ANhLgQ0rhFOH3OrTge59lthUwpjCGl/C9vJF/qBUlPteUB5OEZs8q7Dh
 OLkKvjbVxNrZHN4mEm4LhsFuy0a8EfI+iGhsP2Y=
X-Google-Smtp-Source: ADFU+vsBl5JlqDidxCK7LsaP6aXL5cdzzZUbyABF3OMZru0KbtSTc43XEhfdwj2xG3j3D7wZBRKKP7ZcYqxLzYL7QOA=
X-Received: by 2002:a67:cb84:: with SMTP id h4mr3195097vsl.85.1584641226832;
 Thu, 19 Mar 2020 11:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <1584105767-11963-1-git-send-email-kevin3.tang@gmail.com>
 <1584105767-11963-5-git-send-email-kevin3.tang@gmail.com>
In-Reply-To: <1584105767-11963-5-git-send-email-kevin3.tang@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 19 Mar 2020 18:06:02 +0000
Message-ID: <CACvgo52_KT6O79PujodCPbkegP6LLwuVSFEoRdbarZ=y50B63A@mail.gmail.com>
Subject: Re: [PATCH RFC v5 4/6] drm/sprd: add Unisoc's drm display controller
 driver
To: Kevin Tang <kevin3.tang@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>,
 Dave Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Orson Zhai <orsonzhai@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Kevin,

On Sun, 15 Mar 2020 at 23:19, Kevin Tang <kevin3.tang@gmail.com> wrote:
>
> Adds DPU(Display Processor Unit) support for the Unisoc's display subsystem.
> It's support multi planes, scaler, rotation, PQ(Picture Quality) and more.
>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  drivers/gpu/drm/sprd/Makefile       |   5 +-
>  drivers/gpu/drm/sprd/dpu/Makefile   |   7 +
>  drivers/gpu/drm/sprd/dpu/dpu_r2p0.c | 750 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/sprd/sprd_dpu.c     | 501 ++++++++++++++++++++++++
>  drivers/gpu/drm/sprd/sprd_dpu.h     | 170 ++++++++
>  drivers/gpu/drm/sprd/sprd_drm.c     |   1 +
>  drivers/gpu/drm/sprd/sprd_drm.h     |   2 +

Seems like v5 (patch at least, I did not look at the rest) does not
address a handful of the feedback.
 - Access registers via readl/writel, instead of current approach
 - With ^^ you can drop the compiler workaround
 - Checking for unsupported KMS properties (format, rotation, etc)
should happen in the XXX_check callbacks
 - Remove always true checks, around the (rather moot) abstraction layer

For the future, please keep the revision/changelog within the
corresponding patch. This way reviewers can see, from the onset, what
is addressed.
Look at `git log -- drivers/gpu/drm` for examples.


-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

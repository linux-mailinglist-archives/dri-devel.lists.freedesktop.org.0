Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4F21DAA11
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 07:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7414E6E045;
	Wed, 20 May 2020 05:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673746E045
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 05:44:41 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id i16so1494982edv.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 22:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hmA5qfvK2lgUMdRtwSLVUYIdFHLfCMcxZJ02lGNyXbI=;
 b=P2IQ7XCs0PrAzxrTc6oiYa17hGzG2Sj5EavuUIU2xQzXNl/0Y5OVA5r4d7CpxKxZ3f
 6B6tPQ9Nl9XGIbwodEY7hVJv6gXzat8hwVej9Tcgo9G7MWST8jeFbw7KwTBGeMywckHg
 pfsFU/GRFP+C0c7CudVqT3VIQTM1s+JTtKc5fElZRhIYlFxYtZM/a32ojZu31lKLyXMY
 +Lu1pQN/TuBa1Mh+92vxS4FVQFY9ufDNEGX9AJL6PeY86nkwWIvwqoFbwKExZywVCk0B
 yKvib4wunJJSx0PA0uR8dkDAm1MFPKAsWmCKXz3HEQFDdAaJOz5T6FaO7EnT6IWdlHRX
 yK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hmA5qfvK2lgUMdRtwSLVUYIdFHLfCMcxZJ02lGNyXbI=;
 b=t0dmpZ9yUD4Gi38LZsT3Q9D/19pZ+a57Zn8q3yEOpQQVYgGJva0XQl81/bikIFKg5f
 nmZZC/Q1Bi8bk6zqZXqNWMIHcaWhuvzM4HWyb9+ncjZbM88CmvxHIqFYfzxvYPjRCDrX
 tMU12ne8DkureK6wOFbGnY/ZjULhRYs2nUfIV55h4WFf8cICtp0Sj6sEpNGpnIPCgzyE
 b07XtG7H0WcLGoR70TPyx7qPg/+VvSrF6tN622EBCc1kUqyrVvszkgsoiZAY61vHVjz3
 Tzb0Gs5BNKgGV5KEe++8kbtKkRshQ66ZaiAma6/rjtBmr72k2GzLn9EEbue+dbzPffSU
 6cYQ==
X-Gm-Message-State: AOAM530gto4L1MP1RjUtl659G5jtikuPgJ9jMsWuRh03jJ0r4NsXxQfv
 UD6JAZekaXyWo3ojWben8Wrxi+l/SVh6Itg0p0g=
X-Google-Smtp-Source: ABdhPJzr9FWs+AT1Gk+5P7gCHOd20hMnXt3i5M8wevfWvu4VXARm4QoZ3ak1G/HsyHQCPmCN1J3/zsTkef6D9zOL+dQ=
X-Received: by 2002:a05:6402:948:: with SMTP id
 h8mr1804558edz.127.1589953479704; 
 Tue, 19 May 2020 22:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAAOTY_8tz9nNbCHFJhk9xX8fm9Jd8ETcdNCQfE31AOjZLpNKog@mail.gmail.com>
In-Reply-To: <CAAOTY_8tz9nNbCHFJhk9xX8fm9Jd8ETcdNCQfE31AOjZLpNKog@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 20 May 2020 15:44:28 +1000
Message-ID: <CAPM=9txm_fdy_+Kg=cdXe5SosbYBoXHtsDWYMFm2WQh1QtC_YQ@mail.gmail.com>
Subject: Re: [GIT PULL v2] mediatek drm next for 5.8
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, David Airlie <airlied@linux.ie>,
 Bernard Zhao <bernard@vivo.com>, YueHaibing <yuehaibing@huawei.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Anand K Mistry <amistry@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 May 2020 at 10:06, Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
>
> Hi, Dave & Daniel:
>
> This include dpi pin mode swap, config mipi_tx current and impedance,
> and some fixup. I drop drm_bridge patches in this version.
>
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
> are available in the Git repository at:
>   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git
> tags/mediatek-drm-next-5.8
> for you to fetch changes up to 007d274a017bb4e2ef7b922c2f54f40cf2073664:

Did you edit this by hand or pass it through some mailserver that
chewed it up, I had to reconstruct this pull from the above bits, I've
no idea why it's so messed up in the first place.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

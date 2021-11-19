Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B6D4566CE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 01:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3726E9A4;
	Fri, 19 Nov 2021 00:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3296E9A4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 00:01:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B57B61ACE
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 00:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637280119;
 bh=AoNZd47gCGaimK9v5NfigphGWhTSDsXfAmbFC4BIlz4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Lmq7eHFQfyyikTZkqVB4YTGA+sw+e7PKhSPSxzUx9AAn0X6/GyE6UcqLyYm4BmD24
 +xCYcoK+WvTm0LWxHMNIPZ4ALkoGI1YTyzsZCONyYdXjiDe+KS6/H0ELH+UMwSMOam
 BGN627Tvg879jCfHGN8vVIQNeBjxpb7TqfiZMVqHvPbF2zeq/NUEmTCQUdSizO7CXc
 1KecLoH2ubW8vlFF3DB+0dPkwjiveEp1kL/Y2zihwpysKNT1dhoXlcDdrytZIDgPz2
 Gh4Peu3R30ixCYiGCfTB5d+bxidTRRWTsgLXKa6R67N0INmd8oUpRng7z1QzvwLmzU
 cOgsFYbpdvifg==
Received: by mail-ed1-f51.google.com with SMTP id g14so34682954edb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 16:01:59 -0800 (PST)
X-Gm-Message-State: AOAM533Txp9DTpPUzwYxqKl4+bFMrHc2uh7tmH+uQBi5q+jiT+XdFk4q
 //DTzxPoBEwbWPwL+nB6JEmx/fjwaq7cePcP3g==
X-Google-Smtp-Source: ABdhPJzJ+m25jkKAHUC8dqOXn/CxWb6mvvVoe7NwAcoZoKeWFquNa7VfncVxf9FsAbU+dFfNaujeGSmcwQHUHnIoiD0=
X-Received: by 2002:a50:e608:: with SMTP id y8mr16990077edm.39.1637280117833; 
 Thu, 18 Nov 2021 16:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
 <20211117064158.27451-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20211117064158.27451-3-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 19 Nov 2021 08:01:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Ws7BmYr-87rb=MWYyGwSCCvv0AoPV10J7d+7TU+7OCA@mail.gmail.com>
Message-ID: <CAAOTY_-Ws7BmYr-87rb=MWYyGwSCCvv0AoPV10J7d+7TU+7OCA@mail.gmail.com>
Subject: Re: [PATCH 2/3] mailbox: add cmdq_mbox_flush to clear all task before
 suspend
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Fei Shao <fshao@chromium.org>,
 David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, tzungbi@google.com,
 Nancy Lin <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jason:

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B411=E6=9C=88=
17=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=882:42=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> CMDQ driver will occupy GCE clock to execute the task in GCE thread.
>
> So call cmdq_mbox_flush to clear all task in GCE thread before
> CMDQ suspend.
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index 03f9ed4c5131..28cadfc0091b 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -484,21 +484,18 @@ static int cmdq_suspend(struct device *dev)
>         struct cmdq *cmdq =3D dev_get_drvdata(dev);
>         struct cmdq_thread *thread;
>         int i;
> -       bool task_running =3D false;
>
>         cmdq->suspended =3D true;
>
>         for (i =3D 0; i < cmdq->thread_nr; i++) {
>                 thread =3D &cmdq->thread[i];
>                 if (!list_empty(&thread->task_busy_list)) {
> -                       task_running =3D true;
> -                       break;
> +                       /* try to clear all task in this thread */
> +                       cmdq_mbox_flush(thread->chan, 2000);

I would like the normal control flow rather than error handling. So
the normal control flow is:

1. Client driver suspend: Flush command.
2. CMDQ driver suspend: There is no command to flush. If there are
command, show error message and debug the client driver.

The error handling flow:

1. Client driver suspend: Does not flush command.
2. CMDQ driver suspend: Flush command and callback to client driver.
Client driver process these callback as error handling.

The client driver may integrate multiple driver. In the suspend flow,
it may need to stop these driver in a sequence such as.

1. Stop driver 1
2. Stop driver 2
3. Stop driver 3 (cmdq)
4. Stop driver 4
5. Stop driver 5.

In the normal flow, client driver could control the stop flow. In the
error handling flow, it does not match the stop flow.

Regards,
Chun-Kuang.

> +                       dev_warn(dev, "thread[%d] exist running task(s) i=
n suspend\n", i);
>                 }
>         }
>
> -       if (task_running)
> -               dev_warn(dev, "exist running task(s) in suspend\n");
> -
>         clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
>
>         return 0;
> --
> 2.18.0
>

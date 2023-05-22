Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4784A70BBF3
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 13:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA1310E2DB;
	Mon, 22 May 2023 11:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5796410E2DB
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:35:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74DE361388
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7ADC4339B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684755320;
 bh=3iWfBH3mzP/WmxZKRXiCiwoXsOScyzAdEbefSDmlqPI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Hv1CEVR3yLLMO0eTQZHIaS+KqunQNi6efOw+dg4bkjMQa+WKFnTaeKqSaZxJ3ItwD
 USx2Uttqsz4w4fiCKfA7o0BgE00opHbe+KXcfZGzHtTe8CYF57PJa4//mcjRbO9baf
 DptsR2QKzMeZsj9u+x8rI/GzjEvHZ+8dCpOsYefTKMYtdAWXF6rujSbmXfBnSWBEtk
 anUS6Jp71lmqD2atJ2Vn/CsvWYOJB3LpCf7uW2H8OaqVJev0Tnp4bqKz+170dbJa20
 b7DNEyhqSiRSB5xkvVFXHCW3OLl11LfsE9e3C8R+G6939H5cD9Ru7umHN2kP6YI7PL
 DJEf5NDw57xUQ==
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-b9daef8681fso5092024276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 04:35:20 -0700 (PDT)
X-Gm-Message-State: AC+VfDy96mzAHB97maT+UTzvjvZXNsa6sE/0a/JZgiChqZeFJE2SqMFb
 sEe0TcHEqi4IUlr1OVljd+pMMFMoVm9jPgDzCbo=
X-Google-Smtp-Source: ACHHUZ5+m1rY/zrhcIYNDDfNpD4HHFZYbo2erZBJNFuBgrm9Cbq7UPaiDAM7DJOjPG8P3wc5QtyuqzPRW02Wys501UY=
X-Received: by 2002:a81:6507:0:b0:55a:6dc8:e084 with SMTP id
 z7-20020a816507000000b0055a6dc8e084mr12394240ywb.17.1684755319942; Mon, 22
 May 2023 04:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230522112548.1577359-1-ogabbay@kernel.org>
 <9f136057-92c9-4979-8bc8-c52632213564@kili.mountain>
In-Reply-To: <9f136057-92c9-4979-8bc8-c52632213564@kili.mountain>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 22 May 2023 14:34:53 +0300
X-Gmail-Original-Message-ID: <CAFCwf11OONRsuNvd85KOpc3gcyvhwZm5p_LpUPj8mjfxRk=a7w@mail.gmail.com>
Message-ID: <CAFCwf11OONRsuNvd85KOpc3gcyvhwZm5p_LpUPj8mjfxRk=a7w@mail.gmail.com>
Subject: Re: [PATCH 1/4] accel/habanalabs: remove sim code
To: Dan Carpenter <dan.carpenter@linaro.org>
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
Cc: Moti Haimovski <mhaimovski@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 2:33=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Thanks!
>
> On Mon, May 22, 2023 at 02:25:45PM +0300, Oded Gabbay wrote:
> > diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/h=
abanalabs/common/device.c
> > index cab5a63db8c1..ca15c8d0d042 100644
> > --- a/drivers/accel/habanalabs/common/device.c
> > +++ b/drivers/accel/habanalabs/common/device.c
> > @@ -2328,13 +2328,9 @@ int hl_device_init(struct hl_device *hdev)
> >       hdev->disabled =3D true;
> >       if (expose_interfaces_on_err)
> >               cdev_sysfs_debugfs_add(hdev);
> > -     if (hdev->pdev)
> > -             dev_err(&hdev->pdev->dev,
> > -                     "Failed to initialize hl%d. Device %s is NOT usab=
le !\n",
> > -                     hdev->cdev_idx, dev_name(&(hdev)->pdev->dev));
> > -     else
> > -             pr_err("Failed to initialize hl%d. Device %s is NOT usabl=
e !\n",
> > -                     hdev->cdev_idx, dev_name(&(hdev)->pdev->dev));
> > +     dev_err(&hdev->pdev->dev,
>                  ^^^^^^^^^^^^^^^
>
> > +             "Failed to initialize hl%d. Device %s is NOT usable !\n",
> > +             hdev->cdev_idx, dev_name(&(hdev)->pdev->dev));
>                                          ^^^^^^^^^^^^^^^^^^^
>
> I hate to be picky, but would it be too much to get rid of the parens
> around (hdev)?
Sure, np. I'll fix it before pushing it to the branch.
Oded
>
> regards,
> dan carpenter

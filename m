Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB8446FFD4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 12:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBB010E1AB;
	Fri, 10 Dec 2021 11:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3773D10E1AB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 11:29:37 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id k2so13284175lji.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 03:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NoFmsSrPPIXAa6UPVY+mW7OCxWGbDYJZNT+23nos+Sg=;
 b=qWwEZ0dr3wB90wKhnvHvxBcIiKESCW7Al3Ey5haBrU1NXSjxw6Uk3WvGDEa73lpqKG
 oiOphDZpol/2qK5XeiKoCvwFEfbP+YBlSXRB/dFfSAo5X9qKzfR0oNKdlMAMQ5AQ8U8j
 R0Gvr1N/O5jjntEM1/7X2LjEU2aZJTmDvyzAM/jyGd0WqVl6RoRR5zgDWr3NaQOCGcdn
 g+9Sc5QNZ6eEU5cYybryGjYZJSR5eBFNLlYWNsZStFZTnAwIJz2D0DQYgDFWMiApQrsm
 3hkNlUbn6wXEVai/1RmAL2B+lMUBsYjU9WPgvuzyTtgvuDMBsr4fFoKyp7gcZvukpd1H
 fiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NoFmsSrPPIXAa6UPVY+mW7OCxWGbDYJZNT+23nos+Sg=;
 b=a5NPGbV+AGkRtkdF8vOAKQSlI5SVWCNZ/YM7ONs/XAaX4gTFMZcpI9ezt1cxBCGgQW
 /K3Td4RDob4Y6cvMQSvyzgBxm19CXlIPCdHd5JtGv4w1quljEvsuL5pv+Gls3h/Y2Zga
 0W/hqC0ZqJcolEwn2o1Nlx+FHNNWd2XhtspHTXP/lDi5XVzy72LdrWlCOyL8B+X5xhQD
 Y0df5+0fmzRn+S6l52znyqRxYaqVGbxkfo0hoX6UqYtvH4WKnTbLO/4Doy0H6OgVdV9s
 TaQpvDyQg3Ei6gSPJayY8QcA6b6cXNNPYVmAF8aef4U1ESed0OEBl/FTYSTKko4g6ilh
 AcVw==
X-Gm-Message-State: AOAM532/ljuvy/kLpm2/n9Nj4FXpgPuChlU/suYxYuWuFlRKfS3GGWnC
 rpTBHvx8hilkBFNaU/xb+iXp7atbPU+tAcTbAB5ofQ==
X-Google-Smtp-Source: ABdhPJxW80fXD1lPzt8qWiH7Rg3BsOb2N9Z56Edp5343fNtBZQTJ4N/w3p0jxa7LzbmAiq6ABQIafercLd1qNZpj6cY=
X-Received: by 2002:a2e:6e0d:: with SMTP id j13mr11934080ljc.124.1639135775473; 
 Fri, 10 Dec 2021 03:29:35 -0800 (PST)
MIME-Version: 1.0
References: <20211122110817.33319-1-mie@igel.co.jp>
 <CANXvt5oB8_2sDGccSiTMqeLYGi3Vuo-6NnHJ9PGgZZMv=fnUVw@mail.gmail.com>
 <20211207171447.GA6467@ziepe.ca>
In-Reply-To: <20211207171447.GA6467@ziepe.ca>
From: Shunsuke Mie <mie@igel.co.jp>
Date: Fri, 10 Dec 2021 20:29:24 +0900
Message-ID: <CANXvt5rCayOcengPr7Z_aFmJaXwWj9VcWZbaHnuHj6=2CkPndA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 0/2] RDMA/rxe: Add dma-buf support
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Takanari Hayama <taki@igel.co.jp>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Tomohito Esaki <etom@igel.co.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Doug Ledford <dledford@redhat.com>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Hefty <sean.hefty@intel.com>,
 Maor Gottlieb <maorg@nvidia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,
Thank you for replying.

2021=E5=B9=B412=E6=9C=888=E6=97=A5(=E6=B0=B4) 2:14 Jason Gunthorpe <jgg@zie=
pe.ca>:
>
> On Fri, Dec 03, 2021 at 12:51:44PM +0900, Shunsuke Mie wrote:
> > Hi maintainers,
> >
> > Could you please review this patch series?
>
> Why is it RFC?
>
> I'm confused why this is useful?
>
> This can't do copy from MMIO memory, so it shouldn't be compatible
> with things like Gaudi - does something prevent this?
I think if an export of the dma-buf supports vmap, CPU is able to access th=
e
mmio memory.

Is it wrong? If this is wrong, there is no advantages this changes..
>
> Jason

Regards,
Shunsuke

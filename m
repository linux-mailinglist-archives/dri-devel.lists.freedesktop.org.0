Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985F9436435
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 16:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DB46ECAC;
	Thu, 21 Oct 2021 14:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27276ECAC
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 14:25:00 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id v77so1088078oie.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PuOUctSpvXC/Uu/plBRYBId9yyGVOHHIqDQSma3Pjxc=;
 b=EHAAchud21V27eagv9CmZJaZZy5r/TVshhPT+YgjiOu9q91njEmILPqzQnGEeAqy9D
 AaSS4AeeBiZfH5YT/cLjRtHNr+Stvcom4XjEoo91b1RNFwZOQHefGQW8nP/uGjnB3v3F
 dkk1UCJEDOtKNv/TmzJbp85g3XqJcxvTXpZb2GNr/Kk2Y/I/6GxGJcLfJ97+VEvPczkK
 k/3NpNyh5ozwK88aihvmwwhHpD0yENNf2wY8kJ1zNYqxHyWCQEO8eTsoEHv+Nrln5doQ
 Ir25RXNCi7+eVqeDuZVWQPfLmQOuk9W2texyi7RC3gz+R2Sr0xFaxB/4uVhXcIhOdiQE
 xDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PuOUctSpvXC/Uu/plBRYBId9yyGVOHHIqDQSma3Pjxc=;
 b=BOSQicUTIFf0nXgheH5hECx6IFMymodZPyCcYKolRJTP5TVb0fdFxbFOzWnBmJ/vca
 Ea9bUu7Zme7lHkI28QDVTPQeBh1+raBXeZ4uloTiK3el9to2/T0zrTj2KdRAsSV3yD9v
 2a/JR5LMgw6be7KooxY1ufR96vvPydZrJEmU6zu+JzDY0vZv56dENO/jZQx+ujjlqWeA
 fa3NOiVxtqG7bwJGbi0oZr26rqiymB7w7DJyhT+Ocuyorp9aX+HRPvj/Drgt+7cnLiA8
 a/MR11l5464kYUDvEqBkuh9sQ4KCD9+yIl+km/rFmcPb0SikSsE4BsDKXMQWH4D4fYsn
 f+pQ==
X-Gm-Message-State: AOAM531a5hSDkuhvQDXkgNrtBXtKpeEYLGIoShEtXQd9YDbrf1KXvwJM
 GMd2P95mDoY0qIbmKcEWJ2lPVbnaS2c0XfipeLwOOFRwQAU=
X-Google-Smtp-Source: ABdhPJyTKFV1wXwx8mcglW74I2G4Qm5haM/PAS1Gx13vNLmmAkEl6OCM0vxEyPWm2nkNhvzv3quGHj/bY317tKcLJN0=
X-Received: by 2002:aca:3f87:: with SMTP id m129mr4835171oia.5.1634826300144; 
 Thu, 21 Oct 2021 07:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211021141945.84023-1-christian.koenig@amd.com>
In-Reply-To: <20211021141945.84023-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 Oct 2021 10:24:49 -0400
Message-ID: <CADnq5_N3N=RPzRPDB1aG1btmHOMqdRRce28YuuvEJc25Hw6Dcw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: fix kerneldoc for renamed members
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 10:19 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Those members where renamed, update the kerneldoc as well.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  include/linux/dma-buf.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 02c2eb874da6..9807aef33685 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -433,8 +433,8 @@ struct dma_buf {
>         /** @poll: for userspace poll support */
>         wait_queue_head_t poll;
>
> -       /** @cb_excl: for userspace poll support */
> -       /** @cb_shared: for userspace poll support */
> +       /** @cb_in: for userspace poll support */
> +       /** @cb_out: for userspace poll support */
>         struct dma_buf_poll_cb_t {
>                 struct dma_fence_cb cb;
>                 wait_queue_head_t *poll;
> --
> 2.25.1
>

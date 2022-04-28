Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 975D25170FA
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 15:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7120F10EF50;
	Mon,  2 May 2022 13:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C2610FBF0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 09:55:03 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bu29so7719607lfb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 02:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V0XeT7IXBftt0apFPjjxPnSRBK1X7ldQ9u0yIYHiPlU=;
 b=YCg4LQSCCHVcvC/S2cQuookZz0GMC3S83n5ovXl/cTO4vUS871u/K85uaoRnHXZi5n
 s8HCkmeTShWkJtH/RqXwANzdsUpcmgKpDfbzBqKiXU7uJ6y/1V3S9dxb8m8M+jiijopy
 QA4yKCLxZguaqkZJ64WGbrnlJOHQkRyG8j9nUnVtKNMnMXpfRSznH0OX9F+VIoHEIv1n
 ulAWX0gv39ng0xftKnC1sBNS+j1hQ5UpILJw+cEeg9Y66AOHRf+sOQpVKsLiXa64cyui
 guTOM8XV+qM+BriDGY6F6KIbFr2f9PgoC9XHjHUfqp3QxuZ7owy9GFz3dzitjKq+QOKx
 RE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V0XeT7IXBftt0apFPjjxPnSRBK1X7ldQ9u0yIYHiPlU=;
 b=LV14F3TrGH9W+1dkLgADA6Qj9Upo0mj90Ob88kzTHlFDSeD83wqO0RNKSv2i03OItE
 1olIlsYcxXhfLbsamkDWNddwO1PV2pipXjYtwdsMKSq4HqL6nhep4F4PqdppgFP966nj
 l3Tzt6Ug3ktUwRX0AloAVloVmMmuwNdTvzMsV4Tq9+ktU48mW4yQ7O75y+9kIGy9Wqlx
 P8Segn9TlKcbQA9RMGX7ROffHDJnzRbXtIRGCIp6pECatyqcc9kgY9WGx9TO20v9lYOk
 QrI8j6pPKGB1zQ16WxpIQCPUsVkNSPL9HQ5jE8Y+Bs6TVOOp9JxyFzAsNzryuwG6LVj2
 DlBA==
X-Gm-Message-State: AOAM533k5Efl+FNkiWfGl9vUcHvLIkslnmdfEXEhRU3Y9aYzIZojSo7d
 gcaVZKNtRCprZEWJbcrzJ2D5pFlkSDwWO+7IyQ2svg==
X-Google-Smtp-Source: ABdhPJy0ybox27E6e84jHMcEqHixOb1KpVI0stK6pmS/L2GkVDTmApxzKoDq6QSEYP6f0A9CtGwOMHzZsfN+e/ROgxI=
X-Received: by 2002:a05:6512:110c:b0:472:3d96:bd24 with SMTP id
 l12-20020a056512110c00b004723d96bd24mr678751lfg.389.1651139701661; Thu, 28
 Apr 2022 02:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220428063924.3570409-1-songyuanzheng@huawei.com>
 <e4e5bd41-df5b-bb65-b92f-47122d1e7738@amd.com>
In-Reply-To: <e4e5bd41-df5b-bb65-b92f-47122d1e7738@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 28 Apr 2022 15:24:49 +0530
Message-ID: <CAO_48GG6vX35HTZNXz5Bqf341K9+6a5M63Jxb+nYSbpWDqMH=w@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: add the name field to the table header
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 02 May 2022 13:52:17 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, Yuanzheng Song <songyuanzheng@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Thu, 28 Apr 2022 at 13:33, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Am 28.04.22 um 08:39 schrieb Yuanzheng Song:
> > 'cat /sys/kernel/debug/dma_buf/bufinfo' will print the Dma-buf
> > Objects' information when the CONFIG_DEBUG_FS=3Dy.
> > However, the printed table header information does not contain
> > the name field. So we need to add the name field to the table
> > header and use the '<none>' to replace the empty buf_obj->name.
> >
> > Signed-off-by: Yuanzheng Song <songyuanzheng@huawei.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Sumit do you want to push this or should I go ahead?

No worries, I can push it out.

Thanks :)
>
> > ---
> >   drivers/dma-buf/dma-buf.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 79795857be3e..a2f9a1815e38 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -1351,7 +1351,7 @@ static int dma_buf_debug_show(struct seq_file *s,=
 void *unused)
> >               return ret;
> >
> >       seq_puts(s, "\nDma-buf Objects:\n");
> > -     seq_printf(s, "%-8s\t%-8s\t%-8s\t%-8s\texp_name\t%-8s\n",
> > +     seq_printf(s, "%-8s\t%-8s\t%-8s\t%-8s\texp_name\t%-8s\tname\n",
> >                  "size", "flags", "mode", "count", "ino");
> >
> >       list_for_each_entry(buf_obj, &db_list.head, list_node) {
> > @@ -1368,7 +1368,7 @@ static int dma_buf_debug_show(struct seq_file *s,=
 void *unused)
> >                               file_count(buf_obj->file),
> >                               buf_obj->exp_name,
> >                               file_inode(buf_obj->file)->i_ino,
> > -                             buf_obj->name ?: "");
> > +                             buf_obj->name ?: "<none>");
> >               spin_unlock(&buf_obj->name_lock);
> >
> >               dma_resv_describe(buf_obj->resv, s);
>

Best,
Sumit.

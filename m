Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C98A6D084F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 16:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBB310EE85;
	Thu, 30 Mar 2023 14:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4630D10EE85
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:28:38 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id d22so7328364iow.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680186517; x=1682778517;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Suf7F5Ot9u5BanXJLGAuWzI2nJgTXB4l/VJRGV98nU=;
 b=NFDMDJmzddEBSzn0vv/MN2MzJibflVBIDnciMLl7pBLVrvPJtmqL/EQD5jE5ztD8pa
 HGOEntwnAUTpsYsBLSit1ZqyBKeNwQTjivhuqVasAtlEfDCF8N56xmjonLSY7mQ4q2AA
 qbsniumQWmr9BlOjB7/ZgJJVogVB1oCLU+d8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680186517; x=1682778517;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Suf7F5Ot9u5BanXJLGAuWzI2nJgTXB4l/VJRGV98nU=;
 b=bSk1wuAmqNa9NILwiMtCR266D+m/LUdkZoWn5+GoO3c5p5sAsxYo9XGfqpYhpOHGGs
 g7VKKl7ZtsGotOmyvUucWPfEjLmdeQaeoggA8iFg33no7H2VYCQDwByPXa9KO6E+3QwB
 QWXcCrcxaLD7PwQEM7VWTCk6LzIH5L8Hr9M0N8/QzZoBudRBimv0vMlAD1UT4giSU3Kj
 ZJiDY1QMBVslODMAu+a//FzI8/gzIOHTvqotJrZmTByyHGKYc8FJzG4Rt36J96G/+MXQ
 SDWPyT04620DaxI9MrKTiQLjLT474UAinsw1Nvrj9k9TjeHPtCFo3YLsfW4WfBm9lSpk
 iX7Q==
X-Gm-Message-State: AO0yUKXp2clXM7qc35GZqqBjS95xHZwkAq5oHXP3Cn144fbZyZ++b4dc
 9tEw8iNT78+yDb/wm5jjBGZXUSIJyalUAKD6Z3kyzA==
X-Google-Smtp-Source: AK7set+UC8TAnQAjplV9msLDwOsKaMouu2/+pKt3IuG6bQDBe8ZnZJfz3e/UYjyZqrEhoAl/EZMkHqpHB1WJ9Mvjg04=
X-Received: by 2002:a6b:f215:0:b0:745:6c2f:61dd with SMTP id
 q21-20020a6bf215000000b007456c2f61ddmr8809080ioh.2.1680186517458; Thu, 30 Mar
 2023 07:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230330142818.7efb6d05@canb.auug.org.au>
In-Reply-To: <20230330142818.7efb6d05@canb.auug.org.au>
From: Rob Clark <robdclark@chromium.org>
Date: Thu, 30 Mar 2023 07:28:26 -0700
Message-ID: <CAJs_Fx67+VQwveGE3i7Nyp+5R2+Z5mEeDJ9ZMTZEY_gnYtc5Sw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Dave Airlie <airlied@redhat.com>,
 Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 8:28=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the drm tree, today's linux-next build (htmldocs) produced
> this warning:
>
> include/uapi/linux/sync_file.h:77: warning: Function parameter or member =
'num_fences' not described in 'sync_file_info'
>

thanks, should be fixed by:

https://patchwork.freedesktop.org/series/115871/

> Revealed by commit
>
>   d71c11cc79d2 ("dma-buf/sync_file: Surface sync-file uABI")
>
> Introduced by commit
>
>   2d75c88fefb2 ("staging/android: refactor SYNC IOCTLs")
>
> in 2016.
>
> --
> Cheers,
> Stephen Rothwell

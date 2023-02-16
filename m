Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A682C6997A8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 15:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE7F10EDAD;
	Thu, 16 Feb 2023 14:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CA010EDAD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:41:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A299461380
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13ABDC433A0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676558468;
 bh=3T3iubz/OzIX0beQkVOfl0dMIVw8Iyg1LerT7YWobYA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bqQdIYUKwEG5ap8m+zzzPrf5h3r6C+0jf6sHYHwV190X0QtgalUXbdIi1Cy0aqc2N
 neV0HY0Zv5cIdOBDZXqVduO1QnfxoD3r/FgREYaZGYm91iUgBL++FTFFb1JPbb/0+S
 ypLbVoHZO8OwCCWzXp/vMD5UXLYPdjgKgdGAJjRALO+rMNbj7jmp0YVhUGCZz0HsFI
 /vnyh+V5LMoWqjqaQz+jk5TTtaDY2AEov4Q9fxoY7zVagneZ78U36boJMRgq1yoREB
 YLhiKa8SacNh2lQF3KRcTxx/BFfiSwxdvm71QEnDz1fAzg3EsezqCKchwOL7G6QsrB
 y2JQXCplly4hA==
Received: by mail-yb1-f174.google.com with SMTP id i137so2401333ybg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 06:41:07 -0800 (PST)
X-Gm-Message-State: AO0yUKVgyNpK4Lwu29PEis6MAk2irSynU4H69rxfuQY+TAVZ58Yd1DO4
 /FnU8Li4iMJtCLNYegubFcbHkXJqO7oOFu8dSHM=
X-Google-Smtp-Source: AK7set9fg7j+rXsB4sX4MXRApXhhmd2yEefhAqabXERggxwLpuEIZ/pW61+utdeRTgwKZDUiZuJjs+WKbjmhss3iYCE=
X-Received: by 2002:a25:e906:0:b0:91f:507f:f261 with SMTP id
 n6-20020a25e906000000b0091f507ff261mr618556ybd.463.1676558467046; Thu, 16 Feb
 2023 06:41:07 -0800 (PST)
MIME-Version: 1.0
References: <20230208155450.1941608-1-trix@redhat.com>
 <20230213071241.GA2799422@linux.intel.com>
In-Reply-To: <20230213071241.GA2799422@linux.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 16 Feb 2023 16:40:40 +0200
X-Gmail-Original-Message-ID: <CAFCwf132HuNbXjQfLe9QjotE6FnwOxUKi99bytp0BbL5GyL0-g@mail.gmail.com>
Message-ID: <CAFCwf132HuNbXjQfLe9QjotE6FnwOxUKi99bytp0BbL5GyL0-g@mail.gmail.com>
Subject: Re: [PATCH] habanalabs: change unused extern decl of hdev to forward
 decl of hl_device
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
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
Cc: ndesaulniers@google.com, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 kelbaz@habana.ai, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nathan@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 13, 2023 at 9:12 AM Stanislaw Gruszka
<stanislaw.gruszka@linux.intel.com> wrote:
>
> On Wed, Feb 08, 2023 at 07:54:50AM -0800, Tom Rix wrote:
> > Building with clang W=3D2 has several similar warnings
> > drivers/accel/habanalabs/common/decoder.c:46:51: error: declaration sha=
dows a variable in the global scope [-Werror,-Wshadow]
> > static void dec_error_intr_work(struct hl_device *hdev, u32 base_addr, =
u32 core_id)
> >                                                   ^
> > drivers/accel/habanalabs/common/security.h:13:26: note: previous declar=
ation is here
> > extern struct hl_device *hdev;
> >                          ^
> >
> > There is no global definition of hdev, so the extern is not needed.
> > Searched with
> > grep -r '^struct' . | grep hl_dev
> >
> > Change to an forward decl to resolve these issues
> > drivers/accel/habanalabs/common/mmu/../security.h:133:40: error: =E2=80=
=98struct hl_device=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration [-Werror]
> >   133 |         bool (*skip_block_hook)(struct hl_device *hdev,
> >       |                                        ^~~~~~~~~
> >
> > Signed-off-by: Tom Rix <trix@redhat.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>
> > ---
> >  drivers/accel/habanalabs/common/security.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/accel/habanalabs/common/security.h b/drivers/accel=
/habanalabs/common/security.h
> > index 234b4a6ed8bc..d7a3b3e82ea4 100644
> > --- a/drivers/accel/habanalabs/common/security.h
> > +++ b/drivers/accel/habanalabs/common/security.h
> > @@ -10,7 +10,7 @@
> >
> >  #include <linux/io-64-nonatomic-lo-hi.h>
> >
> > -extern struct hl_device *hdev;
> > +struct hl_device;
> >
> >  /* special blocks */
> >  #define HL_MAX_NUM_OF_GLBL_ERR_CAUSE         10
> > --
> > 2.26.3
> >
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Thanks, applied to -next.
Oded

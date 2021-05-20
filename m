Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D5938B6BA
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706576F4D2;
	Thu, 20 May 2021 19:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373B86F4CF;
 Thu, 20 May 2021 19:07:36 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id d21so17364506oic.11;
 Thu, 20 May 2021 12:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tivSZul1r1F6cXTIGetorCc6IvXldYG9DGcrI+56/Vo=;
 b=KwOehk5T3VqGA6Vo0ut4YB3Lvw6MJynXVG9O7X6y6tafaD5A3b+cyRT09CMWB5ErqJ
 ySAG2N+us1IkTFxsPRq7CKazXy7KkUhI/O2f0P9vIQXHZYikaPzqmiwlGLfY+37bLtt1
 kh4/T4dNaZKd42Bi5nLC2gEnVjOWV5G72A6//9A3RCXE9ZpPV9lEN3ULn8uUzb2GSqKw
 1ULAHwJ7UxoGuMqC71u7y/+lEGb98Ml/G0nKzaqJesmr5tJ8rAVwLbw3Ks8heMMOPsTC
 g2DFuRKJNok+bRi+tIuQPft0S5zqYbIpXtUCQs52AcHxPbKh+4I466KGMdDb+DtG4AAs
 YB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tivSZul1r1F6cXTIGetorCc6IvXldYG9DGcrI+56/Vo=;
 b=TtQocdgvAgsQ7L9CTIJPiOXelbwU/EJaNNSHqd0Sdz0xdUFw4VbKHGNRXNSucUsWor
 kQVcE/rG6btUnUT+o8r083q037LYseqC37abuTfu+nKa+4hXCiUxUV67KctaGuPP3TkC
 81ncsmV3Q+B554G0ZJkKLbxEPivmfATJbGaamRb7rtq4nVfIKj0pxkBAXhwuda6Qtd2s
 eoRIdlVIBeO2aEPQqT3L0hxksf7UVcgvB4Bk8QP7TtgPuCxmYzMft643ZICHvruOL5Q/
 BuEZdlvlE0QP/d5lLEYNsnr5bJvU+fOULCuBfKxAsKhCK627Kz6yT9CtGuEN/Yjk1GJf
 CuLg==
X-Gm-Message-State: AOAM530PkLHu+hPo/357fd41HiIeLUOuosGVadVN4karWV/HBkGHadZF
 xb7LF6qhw/kbvTe2+5WiUfaIMUYVCmrAx4d58mU=
X-Google-Smtp-Source: ABdhPJzgJB1LgjuwXSwFitmQBsumwTKZiFfIShZ0oIJEvDs0+pTtwXmxx/z6zQxihaCTMwdvsqGQPWV4riB11PMv/LI=
X-Received: by 2002:a05:6808:1592:: with SMTP id
 t18mr2452836oiw.123.1621537655443; 
 Thu, 20 May 2021 12:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-4-lee.jones@linaro.org>
 <16b0f3a3-92a8-074c-f926-fba832060a71@amd.com>
In-Reply-To: <16b0f3a3-92a8-074c-f926-fba832060a71@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:07:24 -0400
Message-ID: <CADnq5_O4Uu4yVKLKSoeVFZVyA7XJdMEjdiUdaQm0zHOacLM7iw@mail.gmail.com>
Subject: Re: [PATCH 03/38] drm/radeon/radeon_cs: Fix incorrectly documented
 function 'radeon_cs_parser_fini'
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jerome Glisse <glisse@freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Lee Jones <lee.jones@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, May 20, 2021 at 8:04 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 20.05.21 um 14:02 schrieb Lee Jones:
> > Fixes the following W=3D1 kernel build warning(s):
> >
> >   drivers/gpu/drm/radeon/radeon_cs.c:417: warning: expecting prototype =
for cs_parser_fini(). Prototype was for radeon_cs_parser_fini() instead
> >
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Jerome Glisse <glisse@freedesktop.org>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/radeon/radeon_cs.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeo=
n/radeon_cs.c
> > index 48162501c1ee6..80a3bee933d6d 100644
> > --- a/drivers/gpu/drm/radeon/radeon_cs.c
> > +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> > @@ -405,7 +405,7 @@ static int cmp_size_smaller_first(void *priv, const=
 struct list_head *a,
> >   }
> >
> >   /**
> > - * cs_parser_fini() - clean parser states
> > + * radeon_cs_parser_fini() - clean parser states
> >    * @parser: parser structure holding parsing context.
> >    * @error:  error number
> >    * @backoff:        indicator to backoff the reservation
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

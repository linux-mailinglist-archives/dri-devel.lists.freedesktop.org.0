Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648D117BA72
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 11:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2716E42D;
	Fri,  6 Mar 2020 10:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310636ECD0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 10:39:50 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a132so1823754wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 02:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=rCwwPNd2pA0INB2HwJkp3rqo1usGcNxwzdg6ma8wOKI=;
 b=eTHhCcEclE09OQebKxTAtBcuem6YrVVfqc6wr7gzch/KOv9hjBwMrETehU/oSBUFjX
 l9RbDlri1cZqI8jE26fig1J/BgoL9F/ihHJocP8/UCnDCvgi1xfAqPrfmg0Ceb7WmzQm
 aWZ7/H0OldRYsjAGDfwM90Gf9q8iHvafGPsVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=rCwwPNd2pA0INB2HwJkp3rqo1usGcNxwzdg6ma8wOKI=;
 b=GEJgPbAjUwBTJDKZIbHB4GCdb1kMIvsaascNHEt5aI9Ro26tY89EgdTjab5pvtuUz6
 ARIBxCCfWoXPfSWYriKWNVhOFI6x1T33OQD+/jUarfM88uDGz9h7f1JbhkfwPcO/UDKi
 J32JDFxykfn77WihNxrXLY3zIHswIQA4BvY7TjoQ/DYu/5okwJneIqy0paEx7+hRpGGM
 p/+1m/fTotXAsfPtYaokk03zNM5BbCkqbyoqhV7Jcg+WVsrpnda+OUEshikkUI2SR3xz
 1LPr6KsBZAjSy92cVt9261Zt7edRT9VKELSJrw9UvEiNFn0UNuy3ubOjlHzAD8UsIN30
 8RiA==
X-Gm-Message-State: ANhLgQ1ZZhN039o7o7Jo2/6pdfRkN7m2Ya/L8jVS06BrmRtrdoFUvVGq
 1THmFpXnLanab3CNveNocY27IA==
X-Google-Smtp-Source: ADFU+vsoxbiLn65abeK+CoaJTkFH/7IMTTkUgAtZxrezRu/238vSq4AIzpYtowBToyIoT+aRz7bdHg==
X-Received: by 2002:a7b:c756:: with SMTP id w22mr3356418wmk.90.1583491188842; 
 Fri, 06 Mar 2020 02:39:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a184sm13066027wmf.29.2020.03.06.02.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 02:39:48 -0800 (PST)
Date: Fri, 6 Mar 2020 11:39:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Intel-gfx] [PATCH] MAINTAINERS: adjust to reservation.h renaming
Message-ID: <20200306103946.GT2363188@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Joe Perches <joe@perches.com>,
 Sebastian Duda <sebastian.duda@fau.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
References: <20200304120711.12117-1-lukas.bulwahn@gmail.com>
 <b0296e3a-31f8-635a-f26d-8b0bc490aae3@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0296e3a-31f8-635a-f26d-8b0bc490aae3@amd.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Sebastian Duda <sebastian.duda@fau.de>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 04, 2020 at 01:08:32PM +0100, Christian K=F6nig wrote:
> Am 04.03.20 um 13:07 schrieb Lukas Bulwahn:
> > Commit 52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")
> > renamed include/linux/reservation.h to include/linux/dma-resv.h, but
> > missed the reference in the MAINTAINERS entry.
> > =

> > Since then, ./scripts/get_maintainer.pl --self-test complains:
> > =

> >    warning: no file matches F: include/linux/reservation.h
> > =

> > Adjust the DMA BUFFER SHARING FRAMEWORK entry in MAINTAINERS.
> > =

> > Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
> > Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> =

> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

You'll push this too?
-Daniel

> =

> > ---
> > Christian, please pick this patch.
> > applies cleanly on current master and next-20200303
> > =

> >   MAINTAINERS | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6158a143a13e..3d6cb2789c9e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5022,7 +5022,7 @@ L:	dri-devel@lists.freedesktop.org
> >   L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
> >   F:	drivers/dma-buf/
> >   F:	include/linux/dma-buf*
> > -F:	include/linux/reservation.h
> > +F:	include/linux/dma-resv.h
> >   F:	include/linux/*fence.h
> >   F:	Documentation/driver-api/dma-buf.rst
> >   K:	dma_(buf|fence|resv)
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

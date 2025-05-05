Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6472AA907C
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 12:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496E310E314;
	Mon,  5 May 2025 10:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yIQI3bJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1937310E04E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 10:00:26 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-604ad0347f5so982004eaf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 03:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746439226; x=1747044026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qUO+n2qCCkVBKkF0xc34yA7zFKP1PRXVjAuF6gNjM7w=;
 b=yIQI3bJIIPKsugW10xOr3pZvw/4h//1GzH57/AbkjQmZn9oB3mp0VHPHJdmwjIDTEQ
 vlNCAy/7vabRiiEhlLpvwxcb51Zt00sd8gc8HD5ASPonwwjjVZczJkPR5cmEHAJ2tEe/
 gMKMjazcaIIFLJhoDPdhMbaHZ6jtORvSy3dVZuzmTJ8IDUKpHCl2jVEpeFcm1efqKgo6
 60gO8k/d87VnXFndQTwA+W4zEHdhrXq9WPCPman4nXqKUCqqJE1AZETpX08MG5jod50c
 PuAk1yRhifX+FBchRgIZTlZXYMBW3EZfKLuxazzg8cyPHgfyK9nJ8ULHRrgxdXctvZPL
 wpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746439226; x=1747044026;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qUO+n2qCCkVBKkF0xc34yA7zFKP1PRXVjAuF6gNjM7w=;
 b=gZMyVPRsLZhqGoaYJV9GgQFLZ+UDkeOVOauQSVOrBpAdpFso7K9FdviL4Ld+5Yv9H2
 zvcBScBA81aog2m8NwlZgpw/vl90MlR42hFrUT7GOj13TH8n6bnISq8PJSvLA4GACKR2
 IQcJPg/LKlafGBtozgdp2J0Aj58uFIdp+ZJccDU1Jf5p1V27IjUvtfQCe6eXiSkLde6c
 HY+BVc8g+9i8vFRySQaAi2D1PDe2dSLBA2M8zrr9TrtTjNv6rqGjH3pHVGSFXvJSNCW7
 4l2WUXHVbtXju6Ovhn9vnaLbQvrA+i1gcI0OKUil5MLAQOwfit0Cv4o9cuaEYqEa+Aoo
 sZVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt5fSkDdH0OOvBPsIqFye5hRA4N9VnKlLvTrTVrCA3NsUIcZLYEXWNJEAedTQNQ06vx+rlwTWLHeg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0zt3CctzY5PtBXHFhIdvGpB6R5X9McrX4boCxf99pUUbsqxoB
 ufv/HCLYk3kRuJqWwD/PtS+6HX5EKElFJLlLK7tf4Nx5sc60KrZhE7yBunx+GsyEHGBcmcZNQTM
 xF8XYp9w7gMuT1Z21M/TbdoTVehvkvTybDlVu+Q==
X-Gm-Gg: ASbGncvWnqa6utnDKRlBEeXay1weyn7XejjVAUvdyp5Ccg3B8HLJFdmJrnnuOqaFJPd
 rI/jrLY6CXLSy4J2texgh1tGadeFL4NIEsX92DwHCJ55UuygLMcxYkEAsW4/QK4rN1szf0BtBrL
 8eoiskmHnkwxF+hG6wK/MxMbs=
X-Google-Smtp-Source: AGHT+IEfTkbjK5JWEDIXSUVf0w92h26obU5oYSgxTn7TbvfY+I0Zkozng+KfK0iBSmGp52i/r+Q8MQct9dxWARB5Up4=
X-Received: by 2002:a05:6870:972c:b0:2d5:230f:b34d with SMTP id
 586e51a60fabf-2dae82cc070mr3868126fac.1.1746439225695; Mon, 05 May 2025
 03:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-11-jens.wiklander@linaro.org>
 <43e85d6a-ef99-4d61-910e-1d62814fd9ed@arm.com>
In-Reply-To: <43e85d6a-ef99-4d61-910e-1d62814fd9ed@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 5 May 2025 12:00:12 +0200
X-Gm-Features: ATxdqUFPin2MFa6t0S3tPjOQfIF3WcjTWu_QNb2z1h_FFrZyFMNu2bu0GEdtH9Y
Message-ID: <CAHUa44GC-HRUNGkta-EfMD00VzPBvqcVqU4Zj7kvW8CPnahdMg@mail.gmail.com>
Subject: Re: [PATCH v8 10/14] dma-contiguous: export
 dma_contiguous_default_area
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev
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

Hi,

On Fri, May 2, 2025 at 3:11=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 02/05/2025 10:59 am, Jens Wiklander wrote:
> > Export the global variable dma_contiguous_default_area so
> > dev_get_cma_area() can be called a module.
>
> What dma_map_ops implementation is in a module? Without any other
> context, I can't help thinking this smells of something sketchy.

I see that you found the rest of the patch set
https://lore.kernel.org/lkml/20250502100049.1746335-1-jens.wiklander@linaro=
.org/

Thanks,
Jens


>
> Thanks,
> Robin.
>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: iommu@lists.linux.dev
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >   kernel/dma/contiguous.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> > index 8df0dfaaca18..eb361794a9c5 100644
> > --- a/kernel/dma/contiguous.c
> > +++ b/kernel/dma/contiguous.c
> > @@ -53,6 +53,7 @@
> >   #endif
> >
> >   struct cma *dma_contiguous_default_area;
> > +EXPORT_SYMBOL(dma_contiguous_default_area);
> >
> >   /*
> >    * Default global CMA area size can be defined in kernel's .config.

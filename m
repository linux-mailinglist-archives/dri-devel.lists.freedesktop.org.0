Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B950FB1FA5C
	for <lists+dri-devel@lfdr.de>; Sun, 10 Aug 2025 16:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F9910E060;
	Sun, 10 Aug 2025 14:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JaWBMPUW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD8D10E060
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 14:13:07 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-53921f6e23bso2742081e0c.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 07:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754835186; x=1755439986; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7FJWgPMpLYDCHTxmKxz+IWcXJfQkozCEXt9qr+/puA8=;
 b=JaWBMPUWDH3Fjpv/NdxRBkchA8LtQM6fB+s5JaNWweeJQOAvlewHdUtcjid7AYz6ti
 x3nPG234amNkcpdKzes1RVVKv7PbnIZPYA8s3zLG3jIAmeRRI7FQ62BUdvgBJ67z6MhS
 2OBoitm54uiPMO4iN158vhtg61gxtQ9AA9w9tB/qB4Coaa+85ewK34sigSfqdrtm6vUM
 i8FS2MJxUdk/dQsWsu9Xo0tZ8JGqeU+vaQBgHZIKTCIyXqy1/fOdmAIVsdlzsP/KJaeJ
 MuwMYYJxrdUNIykbBn8orSagcvLZ79TgBbcXiyU4dWHtlS+y/bgnAPAGi3nDPDckj5ph
 UdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754835186; x=1755439986;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7FJWgPMpLYDCHTxmKxz+IWcXJfQkozCEXt9qr+/puA8=;
 b=smpofpSXRWMEGHLItm+Qm7aQyMcA+xlWXsTItFFaefCefJVNdFy5qB9FI4i/rW9znp
 8dlvNtq0s5ao1yxLTehBRMVWOq+BwZOMgGJyy7yzZ+gAb8gFS/sYDFovw8cMZMvq1vEP
 PWwRhhRDJfPWUYUgQR3Uyb2L7r5AyV6wkB/liJ28IS7ryOuu8GFksx5cPCXEfpq3ngFP
 yIam7P/6UTzK1+RddBDrf22yQlTQv9j7y8zNLAsexVaky7C5P2tWIpfYmN2V0GcfCmDk
 z+NG/B9HXp4wX6dfqRu7lOinshQhremduru1ea1ZB3WEjo/GpjXwBqEERySmoQcmq9mq
 HgaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVafEALKjKn7dUAy0kYArDlKkM/RA6/yMt2tpLCa8LgWzVYuHmCjFbxvDV4ClT8y8oWkV5yYnsS524=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtTuVWNW7h1i78IjvTkNcx0xZw13Y5SFBxjyDQELIpFDWJN4t+
 J+Is7WlGM01rYkeqq1M3wC9GP9clRbRnC6c7wOvUY8YnpTsUC5WtgTQyBMt8yasbAayywyuQtCV
 sd8l4AEEni1Sz3eTAdtPm63k4lCXpllA=
X-Gm-Gg: ASbGncvPoK+HLe1pLor2GU0eO36448IiJDplwWQ0aLuFbjU7CIzN8NrChRuDwwPjr9A
 XuJRbDuii50U+ofia0yQxGSZ7jeEbV3iNEzWN2gO8PeieYMrAs2jxaX5LUQR1I6zjWLqxrAjFv6
 /cl2g0v0bV1N/gG/yMs1M1ZkRuh6TeCHy4KB8htY5yh712K35QQRz9ktFRHqH2m8OdbFiDtk7xZ
 jVh
X-Google-Smtp-Source: AGHT+IFJLqQzgonjHNgKcEAa8BHabssjaW6KvncxR2XvgLLaQ+5HiWba4Z7YQLRh+n26ZL9le0W9jmc1vmKN4QFiO10=
X-Received: by 2002:a05:6122:46a4:b0:539:8b51:fbe8 with SMTP id
 71dfb90a1353d-53a4ac335c1mr3697366e0c.0.1754835185932; Sun, 10 Aug 2025
 07:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <qf6xwtxh57jg6ico7n53ft7bepogeal5wfhthodsnf55eabgum@de2ah47jovbg>
 <20250810112218.293272-1-rampxxxx@gmail.com>
 <DBYS3FAEVMHC.178SXO45NIBI8@kernel.org>
In-Reply-To: <DBYS3FAEVMHC.178SXO45NIBI8@kernel.org>
From: Giant Sand Fans <rampxxxx@gmail.com>
Date: Sun, 10 Aug 2025 16:12:54 +0200
X-Gm-Features: Ac12FXzsQSOkl22bVALOKqL4VQAvnxHPn64Gp-CkRjjr3-TdlO1GvFSk5MCtdoU
Message-ID: <CABPJ0vjjVUTYpWbV6LLY0nsPuZze0hcBiBOczox4Mk7LJsKtUg@mail.gmail.com>
Subject: Re: [PATCH v2] drm: Add directive to format code in comment
To: Danilo Krummrich <dakr@kernel.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robin.clark@oss.qualcomm.com, 
 antomani103@gmail.com, dmitry.baryshkov@oss.qualcomm.com, 
 me@brighamcampbell.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 10 Aug 2025 at 15:23, Danilo Krummrich <dakr@kernel.org> wrote:
>
> Hi Javier,
>
> On Sun Aug 10, 2025 at 1:22 PM CEST, Javier Garcia wrote:
>
> Thanks for the patch.
>
> > Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")
>
> The Fixes: tag belongs at the end of the commit message, like all other tags.

Thanks

>
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2444: Unexpected indentation.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2446: Block quote ends without a blank line; unexpected unindent.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2450: Definition list ends without a blank line; unexpected unindent.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2451: Definition list ends without a blank line; unexpected unindent.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2455: Unexpected indentation.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2456: Definition list ends without a blank line; unexpected unindent.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2457: Definition list ends without a blank line; unexpected unindent.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2458: Definition list ends without a blank line; unexpected unindent.
>
> Even though it's rather obvious in this case, the commit message should contain
> the motivation of the patch and how it addresses the issue in imperative mood,
> see also [1].

Thanks

>
> [1] https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
>
> >
> >
> > Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> > ---
> > v1 -> v2:
> >       * Added the proper Fixes tag.
> >       * v1 https://lore.kernel.org/lkml/20250804212902.22554-1-rampxxxx@gmail.com
> >
> >  drivers/gpu/drm/drm_gpuvm.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index bbc7fecb6f4a..74d949995a72 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -2432,6 +2432,8 @@ static const struct drm_gpuvm_ops lock_ops = {
> >   *
> >   * The expected usage is:
> >   *
> > + * .. code-block:: c
> > + *
> >   *    vm_bind {
> >   *        struct drm_exec exec;
> >   *
> > --
> > 2.50.1
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B376979C6E4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 08:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFB810E321;
	Tue, 12 Sep 2023 06:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C797A10E321
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 06:29:11 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-34f6c725d94so7381465ab.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694500151; x=1695104951;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hzZ0g5ZlS6sJREICVBNJdNjzNdZ31/yPMuU7RoyizV0=;
 b=LuZAuJxqmN2KNME9HNje5He38/GCYd0mamlEhcwREBlG0YZbOl2196TE16VHZ9A3vZ
 9QwrW6MLxTaFPaYOvw0qEJ7pGmcZgpW9PR7c+MIR3RAj0kJiu98BuGEqfjYe321RCeTF
 RQiEjR7IrYHk6h73IRjONOhYGgAPjokXNsZSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694500151; x=1695104951;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hzZ0g5ZlS6sJREICVBNJdNjzNdZ31/yPMuU7RoyizV0=;
 b=CjQ1SBLNM4hZyXXvV2IlLIfE8eDoEjS7uMI0pM4qaCbFQXPf3U4UJpFngSZ8agZ0Om
 VpzfdlwQqXP0ZiSnZ6iOz4ZNkZZJ9el5O9R50rW8ia9EkiZ1Qljx7iawH62YqBkuM31O
 sVM4ab5IbgwQK24w5R50CQ/DzwmkxgcUindaSWI6rg0pPrfn8skqvwd9w9Sx5hbLHDHX
 M/d4F0pOk1G60L6OmOvhBWaA86sA9AOibNwYvfYu5cW16m4hwAZUUoTpr1m/hd2HUkxw
 KpNT+z4CTZVq0+VMtW74HHNuv76MTqC7+C4kd/pQKkJ2ajq3opMfECkPub9pUKPyV+oc
 X+dw==
X-Gm-Message-State: AOJu0YwUZc4fQ/u4tpP93gsMDvp31IfNhyQZUgixrF7qdBsiW+djqu67
 mWsJIyFpdqOMu77cTI1aVZw/sfuaAlBZCbphQsM=
X-Google-Smtp-Source: AGHT+IHj//KaMjt7masS60rXlCrQZeuHPYLB0Gf/PAqjivoOrE8sV/XF+E38OjJdsHwYFoSjsE7Zlw==
X-Received: by 2002:a05:6e02:1151:b0:34d:ec00:2ce8 with SMTP id
 o17-20020a056e02115100b0034dec002ce8mr11589268ill.21.1694500150889; 
 Mon, 11 Sep 2023 23:29:10 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53]) by smtp.gmail.com with ESMTPSA id
 p14-20020a056e02104e00b0034f6f2eca21sm1580918ilj.69.2023.09.11.23.29.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 23:29:10 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-79565370a93so164782639f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 23:29:10 -0700 (PDT)
X-Received: by 2002:a6b:610a:0:b0:786:25a3:ef30 with SMTP id
 v10-20020a6b610a000000b0078625a3ef30mr13376283iob.7.1694500149823; Mon, 11
 Sep 2023 23:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.5.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
 <CAC=S1niYAC3PFQoAmwVc=1FcK29uu5sC9c1pGo-mku__y7eHcA@mail.gmail.com>
 <CAD=FV=VT8ZQkcLn4nsxCygC5SG16qYW5igFfwM762jEK42p12g@mail.gmail.com>
In-Reply-To: <CAD=FV=VT8ZQkcLn4nsxCygC5SG16qYW5igFfwM762jEK42p12g@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 12 Sep 2023 14:28:32 +0800
X-Gmail-Original-Message-ID: <CAC=S1njNfjOaSidUHSGPKC+-625Ysx66wx9Sk02ZXGvpUKYBbA@mail.gmail.com>
Message-ID: <CAC=S1njNfjOaSidUHSGPKC+-625Ysx66wx9Sk02ZXGvpUKYBbA@mail.gmail.com>
Subject: Re: [RFT PATCH 05/15] drm/mediatek: Call drm_atomic_helper_shutdown()
 at shutdown time
To: Doug Anderson <dianders@chromium.org>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 12:11=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
[...]
>
> That makes sense. I had based this series on drm-misc-next which
> didn't have those, but now that a new -rc1 is out it then
> drm-misc-next should rebase shortly. I'll make sure that the next
> version includes Uwe's changes as much as possible.
>
> That being said, I also wouldn't object if the maintainer of this DRM
> driver wanted to resolve conflicts themselves and land the patch
> without me needing to resend. The conflict is trivial, there are no
> dependencies and no reason to land the series all at once, so landing
> this patch early would mean less spam for the maintainer since they
> would no longer get CCed on future versions. :-P Just sayin...

Oh then feel free to ignore that if the changes weren't in the tree at
that time... It was just a gentle reminder. Thanks for clarifying.  :)

Regards,
Fei

>
> -Doug

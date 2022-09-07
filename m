Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB8E5B0DC3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 22:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8065C10E864;
	Wed,  7 Sep 2022 20:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6893610E864
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 20:08:05 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id b136so2484310yba.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 13:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=76Ee32nm+xTMs5kfzOUpRMin+LosPvvaUUyBZQVbfSI=;
 b=LVnDj6WocuThO0kgaYyOzA45PKsY6OTWEl6n0gZBNQdgMRJt9CrelX7gVqXLWMB1Zu
 4aeGdqeiNeV499Ja5nTWEKls8edO/cXhuisCzNXaMGNaLLiQ7A5s7A+h59bQqyxHALPo
 3cKkijg/UawHMRKRHsso7ergQwKkPnj1O/T5xn894n2CqfKAAxL1V/eYk6nOKe+wcawM
 esN+VJICP4LxoVGd1pccpIUnB9smEpXDDbO2VpRAu6WqsC6E49Iya9Hle5yaV8G2uF94
 5peLBwlhkRXDy+pRh6qMCvw73W9dNX5OU704kWu32CXGKuUZQLrLr0qIqIjGLV+a4d0J
 KRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=76Ee32nm+xTMs5kfzOUpRMin+LosPvvaUUyBZQVbfSI=;
 b=3jVNVenXfA/1nUB6d41XyJlS87rONEGa5WS2vnSeGcwtEj8owPKWJcFRz7dMrhot9f
 D3pg4N7/bT9jJvaAsP0rXwH84E4zYt+R1U3l992J5NaTZb3EORR+GgHBrVbYIbbFEDbc
 z1MsaaMZ3h66+UIWActZZhQNy00YmHlvF6c01THtqqHGFOOztEHZXeexMZ0URzToB11p
 4HW/Zv7XW2Y5E/yIfGqZ7XF33c0q6i/uAKDlRqgwCdNtc7QJ9weW0uqj6W7oVdPHX28B
 9cvodE+tSk8fTio33dCQNg6GX5JVWr73J9NkAPW1Sqap/Ns1CocGBHrD3ZDHFndZkN8Y
 R5RA==
X-Gm-Message-State: ACgBeo1rbqYpjcys9Dr8oqoKA4jIDqhlCn9RGMk3hEAC6l1HHIez0f9c
 989gXp24rFQ5btuysk6pvlvOyFqEn1ONR8EfTH0=
X-Google-Smtp-Source: AA6agR6eJ2EnWBxsJPHnPXzCDJVQr335pc3iUxnXF3GY7dsWOsxaB0TzMgpZOWbjWc7t58kVq8o/XEKfD/KtEzbGroE=
X-Received: by 2002:a05:6902:38a:b0:670:aa12:8908 with SMTP id
 f10-20020a056902038a00b00670aa128908mr4255200ybs.446.1662581284544; Wed, 07
 Sep 2022 13:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <YxducgSzR6/zyHD7@debian>
 <CADVatmNfc1YT02v5-FaMoGN==MOx5ZJ=o8YMQAH19Gvf91betA@mail.gmail.com>
 <20220907170451.efhz62nkxybqxtaa@mail.igalia.com>
 <CADVatmNodAV4PB5jjARnowu=VGbgMWgBYDWPuwJe-f1WFaS8ow@mail.gmail.com>
 <20220907192250.jfkpwaq54f2h7stf@mail.igalia.com>
In-Reply-To: <20220907192250.jfkpwaq54f2h7stf@mail.igalia.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 7 Sep 2022 21:07:28 +0100
Message-ID: <CADVatmN2u4RB2tamaJ8qc+Vj3A4Lk9py-4fVVMNOBxz07Zjv-g@mail.gmail.com>
Subject: Re: build failure of next-20220906 due to 396369d67549 ("drm: vkms:
 Add support to the RGB565 format")
To: Melissa Wen <mwen@igalia.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, linux-next <linux-next@vger.kernel.org>,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 7, 2022 at 8:23 PM Melissa Wen <mwen@igalia.com> wrote:
>
> On 09/07, Sudip Mukherjee wrote:
> > Hi Melissa,
> >
> > On Wed, Sep 7, 2022 at 6:05 PM Melissa Wen <mwen@igalia.com> wrote:
> > >
> > > On 09/06, Sudip Mukherjee wrote:
> > > > On Tue, Sep 6, 2022 at 4:59 PM Sudip Mukherjee (Codethink)
> > > > <sudipm.mukherjee@gmail.com> wrote:
> > > > >
> > > > > Hi All,
> > > > >
> > > > > The builds of next-20220906 fails for mips, xtensa and arm allmodconfig.
> > > > >
> > > > > The errors in mips and xtensa are:
> > > > >
> > > > > ERROR: modpost: "__divdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> > > > > ERROR: modpost: "__udivdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> > > > >
> > > > > The error in arm is:
> > > > >
> > > > > ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> > > > > ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> > > > >
> > > > >
> > > > > Trying to do a git bisect to find out the offending commit.
> > > >
> > > > git bisect points to 396369d67549 ("drm: vkms: Add support to the
> > > > RGB565 format")
> > >
> > > Hi Sudip,
> > >
> > > Thanks for pointing out this issue.
> > >
> > > I think we can replace the macros that are triggering those compilation
> > > error by functions in drm/drm_fixed.h that do the same calculation.
> > >
> > > I checked those errors when building for arm and i386 and the issues are
> > > fixed after applying the patch below. I appreciate if you can test.
> >
> > Sorry, could not test as the downloaded mbox is saying patch is
> > corrupted and could not be applied. Can you please attach the patch or
> > maybe send using git send-email.
>
> Sorry, my bad. It's attached. Let me know if goes smoothly.

Thanks. That was perfect.
And with that I can confirm I don't see the failure on mips and arm.
Not tested on xtensa but should be fixed there also.

Tested-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>


-- 
Regards
Sudip

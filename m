Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7C35638B1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 19:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C299C18A173;
	Fri,  1 Jul 2022 17:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589C318A16F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 17:47:39 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id b7so1087320uap.5
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 10:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Owhb694VNyKXL9BTeHyWfPv7VjySMI0QfeQx3kqvgGY=;
 b=db+nhfvC/RPkYrPjhilWcAUW0Br1Vmg7cACLD2aJRlOdO7IOv19o+3yJM1/koHPZ3j
 ojMBdTf2KAEdhu//3OrMvcs9tu/MuO9qOUOX9XiQj8nwyaN49RGfiQ91svbr0yKXGebM
 Q06i5dMm+SH7WmylW8Wm2x2wo5Gx5jHQHoNOXQaiHlNcJr9/gtaUns5J0yqjhfgTclJd
 CIf9BGgux0xMjMyBTG/NPNjYmensBpCfMPExE9lpFV1hlgn+7CP4ny8ASHUAkQpUtgye
 orJKEHiFrzGoBcg/oELdDFU0+cobRUI4v7vsTzV8gWw+aHiyFn3TpDMYFBQ4mcTBe3gv
 EiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Owhb694VNyKXL9BTeHyWfPv7VjySMI0QfeQx3kqvgGY=;
 b=p9eUMwkKIaoHWZwrW1qW/2j4AOv6lYfufkk5wvVdI/ZtDROSP4sF/R4/N9QrA7Ipwu
 rX2KoKht9kPbxKM5qJyKI0Wl+n2T4MO7FRAJ4wHSVQWJguvydtryfm6xmv1M3JXB4iWj
 4XtLNcSAg8210TGFAC+bbrfmCXjNb6h/7O+IICJj3ZWabPt/PobhIF95Kq8/xL3HKZPD
 OMgoicJ8NDjZsb7fknEffxCVJhXl8DiVmbdctG3pH4gDHYKg0xjPfGxAthzDnZLrXBLg
 F0YuBTI/C9wP1OeToKp7rlhxBr93nGeUy5brZ2iJnsh7OZYubzNNNycDVO9n/C3sn8jW
 +yZA==
X-Gm-Message-State: AJIora+OtWIJeGG1RASJOitVDb/HMsukyVfhMj5nFjCpvVP1YssqY36a
 Vv9RLhzXZ7jseamImJ3kMNjiPbrZ0OL9zOYvXLQ=
X-Google-Smtp-Source: AGRyM1tvJiLTYOBz10GyPOSW+SJJWdSYxXiWHlOwB3Nvk1vNG56ZttGuBQslfMO3zERMcHcYmuzdQ67PO3cjfgM8cZw=
X-Received: by 2002:ab0:244f:0:b0:37f:2985:e620 with SMTP id
 g15-20020ab0244f000000b0037f2985e620mr8967541uan.36.1656697658397; Fri, 01
 Jul 2022 10:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220701120755.2135100-1-javierm@redhat.com>
In-Reply-To: <20220701120755.2135100-1-javierm@redhat.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Fri, 1 Jul 2022 18:47:27 +0100
Message-ID: <CALeDE9P4vcJ3UgZdH8-4iaAHiYziS29G7WgtzcJbv0SwVANOyw@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: A couple of fixes for drm_copy_field() helper
 function
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 1, 2022 at 1:08 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Hello,
>
> Peter Robinson reported me a kernel bug in one of his aarch64 test boards
> and even though I was not able to reproduce it, I think that figured out
> what the problem was. It seems the cause is that a DRM driver doesn't set
> some of the struct drm fields copied to userspace via DRM_IOCTL_VERSION.
>
> Even though this is a driver bug, we can make drm_copy_field() more robust
> and warn about it instead of leading to an attempt to copy a NULL pointer.
>
> While looking at this, I also found that a variable in drm_copy_field() is
> not using the correct type. So I included that change in the patch-set too.
>
> Best regards,
> Javier

For the series
Tested-by: Peter Robinson <pbrobinson@gmail.com>

>
> Javier Martinez Canillas (2):
>   drm: Use size_t type for len variable in drm_copy_field()
>   drm: Prevent drm_copy_field() to attempt copying a NULL pointer
>
>  drivers/gpu/drm/drm_ioctl.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> --
> 2.36.1
>

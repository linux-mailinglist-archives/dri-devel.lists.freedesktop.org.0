Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B0E4EEAE6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 12:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666B510E48E;
	Fri,  1 Apr 2022 10:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333FB10E48E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 10:02:50 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id ke15so1612399qvb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 03:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aqMK4M1InDYThrQysEp5iPweZrSJ1BirpP75Fhn0bLE=;
 b=v8pyYAOBtFNUDrQbtm5WA+p9a1vinNfC2F10aFHIj0fPcQ7Odqioc9KSe2vi1Xh2Zk
 IXSf+HVtEib8GLDe+fl1POvfPzjEsLV6iWpPPARSJRMvXGlYl4oe27z1bQIL6ae0muVt
 AGmCMQU/mhFbMky9EUDeAogRmG2zy1+xFMjrLTi3xkI8z5LaOzKp3b7dsYPZsiNBTuHM
 c8k+IDBe7fJlKDOdZV7vElHPsYdEcmgHllGd4gGJQlFsiFdpx752OZHlVfWWo3vWeICF
 bmMbq3d0wbEP3LzUUvf1tvGOXwd61dKCPUQ9c6xnFW2xEUblSGdmk9LkcZZY8ibVBe7W
 Pf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aqMK4M1InDYThrQysEp5iPweZrSJ1BirpP75Fhn0bLE=;
 b=irS+4HlWqcf/I5LKHZyLJIZWZFRJ8b5/t0quzt+aEXjohopMMPO0dGjZRwZiujI5eU
 spClNyLUaYCyOrnFgtKLzsh3A+Y+0S1NTWRzyAxoCogY9l5TPkuBuDdfR5cgc7O0H/+c
 m4Z8SfhD6P3+px4T76uN07E66Lyjyrbi+4QyQWHryIVvQsDfI59+TfZiZcvSOK3ZcFhk
 LrtfQvnzbwpxewf0tiEOlxxqTarANKAeHztlWBLwdsABnvSKV+eTWjAoPzHf/xnOhPIn
 mECQK3/kMzESFT2r3e5upSSeK4IlSwvfNYvJOI0s9uohXDpSxK8QT4AgITr1bibsHnPq
 ArFA==
X-Gm-Message-State: AOAM531c8Eux2/ah8RgjvZLf8G4I3vpMDR/zYnvrb7fJzHmw5dw99rLD
 NjEvmvzpIy4DW7//Fut9ryOHdJQT8QMwV3Q2kyPAVA==
X-Google-Smtp-Source: ABdhPJx3kDfdp/cLod8RhpuczJxKeYyi+MMYeDn2oKD/KNzazZRboLRNTTeZkBYev9if54aHevFDIq9tAYpuoOnSZ5Y=
X-Received: by 2002:a05:6214:2a8e:b0:443:8a10:c1ca with SMTP id
 jr14-20020a0562142a8e00b004438a10c1camr9900126qvb.88.1648807369348; Fri, 01
 Apr 2022 03:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220330190846.13997-1-wens@kernel.org>
 <20220330190846.13997-4-wens@kernel.org>
In-Reply-To: <20220330190846.13997-4-wens@kernel.org>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Fri, 1 Apr 2022 12:02:38 +0200
Message-ID: <CABxcv=nFBmgQaoG6u_kW2v60yhPSi3wH_MSd7T9tS0cXqvCNKQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm: ssd130x: Support page addressing mode
To: Chen-Yu Tsai <wens@kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 30, 2022 at 9:09 PM Chen-Yu Tsai <wens@kernel.org> wrote:
>
> From: Chen-Yu Tsai <wens@csie.org>
>
> On the SINO WEALTH SH1106, which is mostly compatible with the SSD1306,
> only the basic page addressing mode is supported. This addressing mode
> is not as easy to use compared to the currently supported horizontal
> addressing mode, as the page address has to be set prior to writing
> out each page, and each page must be written out separately as a result.
> Also, there is no way to force the column address to wrap around early,
> thus the column address must also be reset for each page to be accurate.
>

Thanks for including this explanation, it's very informative.

> Add support for this addressing mode, with a flag to choose it. This
> flag is designed to be set from the device info data structure, but
> can be extended to be explicitly forced on through a device tree
> property if such a need arises.
>

Agreed. Unless an OLED controller supports both page addressing modes,
I don't see what could be an advantage of having that property in the
device tree. And even if that's the case, we could just always make it
default to use horizontal addressing mode.

[snip]

> +/* Set address range for horizontal/vertical addressing modes */

Thanks for adding these comments.

>  static int ssd130x_set_col_range(struct ssd130x_device *ssd130x,
>                                  u8 col_start, u8 cols)
>  {
> @@ -166,6 +173,26 @@ static int ssd130x_set_page_range(struct ssd130x_device *ssd130x,
>         return 0;
>  }
>
> +/* Set page and column start address for page addressing mode */
> +static int ssd130x_set_page_pos(struct ssd130x_device *ssd130x,
> +                               u8 page_start, u8 col_start)
> +{
> +       int ret;
> +       u32 page, col_low, col_high;
> +
> +       page = SSD130X_START_PAGE_ADDRESS |
> +              SSD130X_START_PAGE_ADDRESS_SET(page_start);
> +       col_low = SSD130X_PAGE_COL_START_LOW |
> +                 SSD130X_PAGE_COL_START_SET(col_start & 0xf);
> +       col_high = SSD130X_PAGE_COL_START_HIGH |
> +                  SSD130X_PAGE_COL_START_SET((col_start >> 4) & 0xf);

Maybe instead we should define
SSD130X_PAGE_COL_START_{HIGH,LOW}_{MASK,SET} to be consistent with how
the other fields are set and not using bitwise operations explicitly
here ?

Other than that, the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

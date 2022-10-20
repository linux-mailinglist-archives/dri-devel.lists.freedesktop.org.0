Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2C5606877
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 20:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D90810E35B;
	Thu, 20 Oct 2022 18:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1373110E35B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 18:53:26 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id g16so226753qtu.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 11:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1JJWeDPGrjc6twvc1sU1a1ThiN/IA10seg8oNdbjvjI=;
 b=DeJppYcSpwlWLv2NVFavB0TAVXQhVMhj8SjxiMnDKBIqKRHMTrXwwMsyzG+8ai7lp9
 rxyYVcmUFiMltVnqpMXKzxkvVy60EBBKT2a9wI8qe1dNMHNc1gbAPkCLDpLXIMHVlgd2
 GyzI1621AkXTvdkWr0ojLpM6pckbj8XqXedTx4SEJjedEwZkCUwGqgtLsCow4K+tQFBR
 W0wIV0L/YviN5IWI5FVXxWU55BonGX91p2wXP6TDECsjjE3XnIHeRIL7Zp9VXzmweTfk
 YfittqKi1ujRnMH5RVbokHQRK6vX3YaK6XsvHyM+QfSQa3N3MPlHbDP/kXfuyUH/JRXS
 /S4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1JJWeDPGrjc6twvc1sU1a1ThiN/IA10seg8oNdbjvjI=;
 b=X3SsjbQ54h3lv1YSv5M4JvgynvTLrhOLp4wQnMyNuwHG8SfkWZp9KZx1qfHBAZIZdy
 HJ+HawpjXXdQCQcB3ws7i0XBydUr3ZgSmMssYoPEsoIeHqvoD3GtZJs+wHoA8XsYKIim
 syS2qvs/br2SxXyUAiAAXPyrao7sGTaIy6qtek+yGFReUqgY52UXg5J9+pHozq+oclt8
 R6J8+x1yiCZfslzjmogN867VPK0CsY/19DcHWcrCEuIZHCtdk/uao9AztpBp9rKALuhW
 nnUPca4/VEQqgT7fKCyvU8Ng87iwHFnGnbLbmC2qkfzS1eOcvcCGm+Mhw/0BzFVI4JbI
 wzmw==
X-Gm-Message-State: ACrzQf0LDdJ7B32fHyvOAV87LLrVmIFarRkOnf1vefdaouiROxjlGdtL
 /CAiRmJbRDveCu385r5gbfdPAedOjhPZdFdUqAE=
X-Google-Smtp-Source: AMsMyM7qetifndVf5M+f66BoiYZd2meYfYXmvSjmkw7GZFK+cZvcVsEdMDLmr3D9nN5HnEN3krGs/1hlJ2qDJ5mgHWg=
X-Received: by 2002:ac8:5751:0:b0:39c:b848:198f with SMTP id
 17-20020ac85751000000b0039cb848198fmr12650276qtx.429.1666292006071; Thu, 20
 Oct 2022 11:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-3-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20221020175334.1820519-3-maciej.kwapulinski@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Oct 2022 21:52:50 +0300
Message-ID: <CAHp75Vdb-bCR+E2zzrSULCoxhWqfJTzF38FCxCfKFx3D3vddVg@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] gna: add GNA DRM device
To: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 8:57 PM Maciej Kwapulinski
<maciej.kwapulinski@linux.intel.com> wrote:

Missed commit message.

> Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
> Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>

...

> +       if (!(sizeof(dma_addr_t) > 4) ||

Do you really need this?

> +               dma_set_mask(parent, DMA_BIT_MASK(64))) {

> +               err = dma_set_mask(parent, DMA_BIT_MASK(32));
> +               if (err)
> +                       return err;

IIRC if the 64-bit dma_set_mask() fails, there is no need to check
32-bit, i.e. it will fail.

> +       }

...

> +#define DRIVER_DATE            "20211201"

Really?

...

> +#include <linux/mm_types.h>

Are you sure?

> +struct gna_dev_info {
> +       u32 hwid;
> +       u32 num_pagetables;
> +       u32 num_page_entries;
> +       u32 max_layer_count;
> +       u64 max_hw_mem;
> +};

-- 
With Best Regards,
Andy Shevchenko

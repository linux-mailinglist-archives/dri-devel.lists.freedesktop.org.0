Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA46606890
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 21:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A9E10E156;
	Thu, 20 Oct 2022 19:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF25410E156
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 19:01:20 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id g16so243310qtu.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 12:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XGP70LIojmiBdpWyY18Ji96dZrMFDXretdATsr1AZcY=;
 b=NWO+rqeS7dhX43MQjgRg4fiqteF99/HlBWBg3L01vDu7MG2Wud+a9nJfABHAExLr5M
 Hi9OMw0I7yWgUjemerWxh3IJnv4YzM5rga/BpU34Z4j1pbGB5q/fm7tKbXMCC/5GRNvS
 /hfQXQHqUWejoJafdDdM1iiDuclnsLSzyVnlecv89XpB6G32GQElASu7fAS0xN2GZ9vd
 fWqm3l8uHCbHc+qpGMMQgSRF+Gfk6JU921o8QtJqcSmSOhFP8w6P6+BmTNsA3GNNYvNH
 3/uzYShpyckbXN+cu68ddhWMcPsglpQNkNeazR7qiSuKQ/HigTMyayLFyyXb5tSeF0/4
 hFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XGP70LIojmiBdpWyY18Ji96dZrMFDXretdATsr1AZcY=;
 b=e7YjppktRRRVc2WZLz/IZKfZCu2T9h+3voB6CaKVjQisT3QalR10rlBMVtiwKDw5cv
 4fWKkMzg3u1m7Z4e/YcvUFHeqOweDqBpTuvp9frecqGC6536UkpHGxvsiDUBabN3p9FW
 POj3mDCxEZnRyvwyfeHQfFNqX04/folNmeQtJtLmsNVQipjQ+ZXuq2nlxYDx2iewBGjJ
 35V/5YUFCNNIvfKm2ruMhW1VlnSrMIpkSpthZ9CPM48DDcBZoirqHLH0ME+NmvfFVXtd
 aDjfWddqzYVuBbyKGM7DBTQQGbfwhJRi61gGY69WVhA07gZR1iiVsLgG9ZIHQLJh3CP8
 ZyzA==
X-Gm-Message-State: ACrzQf2aUTw3/+u2qdkTtIb8ZsXgcXADWAQN1/lKq7DC98zrOI3v8rfI
 PdBhYvZ44ma/4jQwkfsK2iveB59CxbUX872p64E=
X-Google-Smtp-Source: AMsMyM7pRtQAcuQfcpM2PgAMubFXqpQhRb1r00K3+Mci5PPhA6uivzscz5DWGeA61iiWIXSmgIpmYLLGLp27ixXFZWQ=
X-Received: by 2002:ac8:7c46:0:b0:39c:fa92:a27a with SMTP id
 o6-20020ac87c46000000b0039cfa92a27amr10208723qtv.61.1666292479731; Thu, 20
 Oct 2022 12:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-5-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20221020175334.1820519-5-maciej.kwapulinski@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Oct 2022 22:00:43 +0300
Message-ID: <CAHp75VeFDYjmoJzbC5z8Kf=xYxsVASxjwGBB3OPvBMMPsQDjtw@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] gna: initialize MMU
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
Cc: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 8:57 PM Maciej Kwapulinski
<maciej.kwapulinski@linux.intel.com> wrote:
>
> From: Tomasz Jankowski <tomasz1.jankowski@intel.com>
>
> Setup MMU in the driver with a new memory component.

...

> +#define GNA_FEATURES                                           \
> +       .max_hw_mem = 256 * 1024 * 1024,                        \

SZ_256M ?

> +               .num_pagetables = 64,                           \
> +               .num_page_entries = PAGE_SIZE / sizeof(u32),    \
> +               /* desc_info all in bytes */                    \
> +               .desc_info = {                                  \
> +               .rsvd_size = 256,                               \
> +               .cfg_size = 256,                                \
> +               .desc_size = 784,                               \
> +               .mmu_info = {                                   \
> +                       .vamax_size = 4,                        \
> +                       .rsvd_size = 12,                        \
> +                       .pd_size = 4 * 64,                      \
> +               },                                              \

> +       }

Broken indentation?

...

> +#define GNA_DEV_HWID_CNL       0x5A11
> +#define GNA_DEV_HWID_EHL       0x4511
> +#define GNA_DEV_HWID_GLK       0x3190
> +#define GNA_DEV_HWID_ICL       0x8A11
> +#define GNA_DEV_HWID_JSL       0x4E11
> +#define GNA_DEV_HWID_TGL       0x9A11
> +#define GNA_DEV_HWID_RKL       0x4C11
> +#define GNA_DEV_HWID_ADL       0x464F
> +#define GNA_DEV_HWID_RPL       0xA74F
> +#define GNA_DEV_HWID_MTL       0x7E4C

Keep them sorted?

...

> +       for (i = 0; i < mmu->num_pagetables; i++) {
> +               pagetable_dma = mmu->pagetables_dma[i];
> +               pgdirn[i] = pagetable_dma >> PAGE_SHIFT;

PFN_DOWN()

> +       }

...

> +       desc_size = round_up(gna_priv->info.desc_info.desc_size, PAGE_SIZE);

PFN_UP() ?

...

> +       mmu->pagetables = drmm_kmalloc_array(&gna_priv->drm, mmu->num_pagetables, sizeof(*mmu->pagetables), GFP_KERNEL);

> +

Redundant blank line.

> +       if (!mmu->pagetables)
> +               return -ENOMEM;

...

> +static const struct gna_dev_info cnl_dev_info = {
> +       .hwid = GNA_DEV_HWID_CNL,
> +       GNA_GEN1_FEATURES

Leave a comma at the end. Same for all similar declarations.

> +};

...

> +#define INTEL_GNA_DEVICE(hwid, info)                           \
> +       { PCI_VDEVICE(INTEL, hwid), (kernel_ulong_t)(info) }

Drop this and use PCI_DEVICE_DATA() instead.

-- 
With Best Regards,
Andy Shevchenko

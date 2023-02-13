Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E93A69408A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 10:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C0310E4EA;
	Mon, 13 Feb 2023 09:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CEF10E4EA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 09:15:39 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id n2so4907134ili.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 01:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pKOvhHJRhphSbPBn3so0B0jvZpigwezTNOs/N/XEZ5E=;
 b=NpOzWZNs52fgyDSK1zxl40/0Dx5n4NeCWXkovOvBUzksGQJuoq6r+M0XwUjPUjuDCp
 qWok95Yjwl+m/Az8N2txe+NGa8UJQ6w1D6ZUcOP4ToksLnuXERCRpsxGDlakBAYJgh6s
 Rp0BvUGfcnhQRb2j1HZf4p2P+Tc9Tyj2zYD8AF0KHCWuG4UTkJZvIrnK8l0t7ReoHwxe
 gMnovtxvi8PQmQGD+//6EPW8YdgUNjFdr7vDNlcPbgQzvPQsmrjqn8yHZDpr8z9JPCCT
 piLyeX8Z32ssmSc7mGqQMUdIvdh2+8LlEAOh+/IbJa8x2mxYyZRF2KJ1LQgWht5qXNGF
 6h9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pKOvhHJRhphSbPBn3so0B0jvZpigwezTNOs/N/XEZ5E=;
 b=tpfzUsCalt1bybvA+sODU7/LGX1+vqs/eHUyWAQHrArENs94URuEskObIaX7Rl0bx2
 KYhAvl7J1SodL5dCfmnGqHv4StF6CzqP1U66sw/PMPutmpxOlUUs3+ZMhylP8NEs819Z
 msC8wlBTAinkuU3btlXxXVWKG2wxS5dSEZcyEDMjT15lqB5D/Kj2AgRDtbu2xFGodnvZ
 8Sj2SWDzAfe0gqCtNJzw+YPQnX8bwY2MpNvEkFc3yJalAAca2eO0yO/YOCyR/cJLkVHt
 p8jrTEOChzo0i31TEdhPPUqzbOkF46Y1339I8+OZBS8MdDayrXGhTLBvys/1/PcKVn+G
 ZssA==
X-Gm-Message-State: AO0yUKVpg8N7ShrHblsiRGAmiAdSD4C42MlEwCDdBDHyYwrtpkmDgI5f
 RTz8KlaGCtAO+X5mFMDqgDQOww==
X-Google-Smtp-Source: AK7set8THxgVNnrm5T7fH0oGDH5+xMK5o9ph9mqDpQvxPFgROHNMVHH7uqtLR54GHK9o5hhn791ktQ==
X-Received: by 2002:a05:6e02:156b:b0:315:2a3f:5a1d with SMTP id
 k11-20020a056e02156b00b003152a3f5a1dmr10081627ilu.30.1676279738433; 
 Mon, 13 Feb 2023 01:15:38 -0800 (PST)
Received: from ?IPV6:2a0e:41a:894f:0:2487:f87c:fb5b:9046?
 ([2a0e:41a:894f:0:2487:f87c:fb5b:9046])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a92050b000000b0030c68d38255sm3639612ile.38.2023.02.13.01.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 01:15:37 -0800 (PST)
Message-ID: <447fa1c7-4992-838f-b5cd-91245deae188@baylibre.com>
Date: Mon, 13 Feb 2023 10:15:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] drm/meson/meson_venc: Relax the supported mode checks
Content-Language: en-US
To: Da Xue <da@lessconfused.com>
References: <20230210-relax_dmt_limits-v1-0-a1474624d530@baylibre.com>
 <CACdvmAgKrRMdX+R0nScGwazq7C=f=B_k-2w-ONk_iCyM_XAnSA@mail.gmail.com>
From: Carlo Caione <ccaione@baylibre.com>
In-Reply-To: <CACdvmAgKrRMdX+R0nScGwazq7C=f=B_k-2w-ONk_iCyM_XAnSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 08:09, Da Xue wrote:

>     -       if (mode->hdisplay < 640 || mode->hdisplay > 1920)
>     +       if (mode->hdisplay < 480 || mode->hdisplay > 1920)
>                      return MODE_BAD_HVALUE;
> 
>     -       if (mode->vdisplay < 480 || mode->vdisplay > 1200)
>     +       if (mode->vdisplay < 480 || mode->vdisplay > 1920)
>                      return MODE_BAD_VVALUE;
> 
> Should these be lowered to 400 instead of 480?

If you want to support 400x1280 then we need to tweak mode->hdisplay as 
well.

I'll push a v2.

-- 
Carlo Caione


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4BACE65F8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 11:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1C810E3A4;
	Mon, 29 Dec 2025 10:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A2110E3A4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 10:25:07 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-55e8c539b11so6306280e0c.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 02:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767003906; x=1767608706;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fEHua9B0eiJ9krPOOGN9l1YijNcHX4oQExQFKvr6EFA=;
 b=DlLkOTQkUwrFzzSYSSGgIbtXfE2YI6mCq2U52oJdejp6PFtdIYwRXrIad6bE1QgihZ
 2H4xEwc5XowL8Dn/E5PBGOkdpTlxwa3hIs9GvZFREOEI5uGpa315IaGn0wwK5sCDTZyF
 vwssWdZ5R7iZC4yIzwkBmRqXSeVV/Zrq1CjC7WFJ7JigCRY5L1z/CmSCTmirgGMx+ff8
 OoA6iNVuEPRnnsC8clA4TaHRt3j4PTl2i0y1Yg2FTwV7cButzSIThIuROMZoAePm4k8p
 AOVO8UlMXyJ5wLERiNypzEkY04PKIg5ZHf8K9w6NCGDCq7CBbN1KU3KOPfPj8fnfjy1u
 6/MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw5NUbdZtMFBXRjVG6niM6arFxMhnf/RgSlHQeM8EAagZRCgFA0C8iTrDTp8B5U+GFPsAkUqmOa78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqhTIuTRDRxzFzKfhUlQo0j2f0viv1ZCb053xannXV4Y1E3g0s
 oUEt7le+313xanXBLsWUFJoRkUdGNr/GzMNVHHLycx/2VYoUnFX83/VA+TK+u2mX
X-Gm-Gg: AY/fxX66CrLaUYdWtRt3W2VrlKfD40p27DSRHyjE0nijF5B7RiXn4Dy5yrtENzs/8QP
 VL8DNW5/LAKemQl17t3xkKBiX/W2b0lR/M3Bk2v/JRS1WqnXwNuU6AEfISVXFC3D/VtcnNdlKxv
 7iG0ONWBWRFeuCt/y3+XxBFM/vGPG/A4Rum8owOLWlbHyByGPp7Y6IDCMEm8dFP/3KxdU+2P0+2
 nN4YPf3ENFIsEv8xIudzuC8fZYqRHNIEdTGwTa928eTXrRCOxOTcriWxSbZgg3qeaq0bN4790mC
 ebj4Ane0Wi+FlirwCoxkk6TSQVNOxsso4x7HtSsc4dcgkzSj4ET/8qaPCgyKWa7FLJGxVVENezk
 2TWJg8iyLktwBRHWYpaOrHSrbf2Elt52/qP8VrRxf6M8tdMKGjfR8TD1gmPUMrD8RCAVadq3Lsg
 2jwwgLJfbNvERUgaqrg9BGoVW20fSnIwtM+DqFFySD3cj5JiKn
X-Google-Smtp-Source: AGHT+IHdclh+JIHP6HX7tLAJ29T2gtPLmppozlYJwVIX38Clj5awtCtZNCK4j5JD4uvkPkQXSMMeJg==
X-Received: by 2002:a05:6122:3282:b0:55b:305b:51b7 with SMTP id
 71dfb90a1353d-5615bf0ec82mr10070751e0c.20.1767003906049; 
 Mon, 29 Dec 2025 02:25:06 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-94388d07ab4sm3804088241.0.2025.12.29.02.25.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 02:25:05 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-93f500ee7b8so3912146241.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 02:25:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX7p0QDOzoZKARhPaLzek3pA4iVWqdkIUt74J/I1JrRZTGHWrqO9XvQLDYuGfMpGCZ4pQIrlsScSys=@lists.freedesktop.org
X-Received: by 2002:a05:6122:d85:b0:557:ddc4:dea4 with SMTP id
 71dfb90a1353d-5615bd7150bmr9849393e0c.5.1767003543582; Mon, 29 Dec 2025
 02:19:03 -0800 (PST)
MIME-Version: 1.0
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
 <20251212-phy-clk-round-rate-v3-9-beae3962f767@redhat.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-9-beae3962f767@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Dec 2025 11:18:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXudWW3MPKqP0-d+DyMNRF-X62oyHRnj=MM_9MSpJw6sw@mail.gmail.com>
X-Gm-Features: AQt7F2rKWfaXfoMj8qssy3Tj3BKKzf9SWfuNGXkoZ2xYV04eFqP8YoD995Ts3mk
Message-ID: <CAMuHMdXudWW3MPKqP0-d+DyMNRF-X62oyHRnj=MM_9MSpJw6sw@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] phy: ti: phy-j721e-wiz: convert from round_rate()
 to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
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

Hi Brian,

On Fri, 12 Dec 2025 at 00:21, Brian Masney <bmasney@redhat.com> wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Thanks for your patch, which is now commit 27287e3b52b5954b ("phy:
ti: phy-j721e-wiz: convert from round_rate() to determine_rate()")
in phy/next

> --- a/drivers/phy/ti/phy-j721e-wiz.c
> +++ b/drivers/phy/ti/phy-j721e-wiz.c
> @@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
>         return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
>  }
>
> -static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
> -                                  unsigned long *prate)
> +static int wiz_clk_div_determine_rate(struct clk_hw *hw,
> +                                     struct clk_rate_request *req)
>  {
>         struct wiz_clk_divider *div = to_wiz_clk_div(hw);
>
> -       return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
> +       req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> +                                      div->table, 2, 0x0);

Is this correct?  divider_round_rate() can return a negative error code
(from divider_ro_determine_rate()), which is not handled here?

Looks like several other users of divider_round_rate() use this
same logic, and thus are affected, too.

> +
> +       return 0;
>  }
>
>  static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

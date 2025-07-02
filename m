Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6B0AF0C95
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 09:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5623E10E30B;
	Wed,  2 Jul 2025 07:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B60310E30B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 07:29:22 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ae36dc91dc7so701117166b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jul 2025 00:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751441360; x=1752046160;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hg/fpzh0iibuHgzu9OoE8pUDa3xBOZXjJIvugVRypCg=;
 b=FP0Kve23oMO8Lt2dNLnxwb+cm04+xqv7blQHrr0BnBVs6L/79NTwFT+AUvBufqedEy
 C6mFp79ucxqNrH6qPKhCMSljifGs5k7H/8e/0zcGJQRIb8ESE3PUanj/JupiC7SB/eRh
 OmPqxgNOxYNVnY2OVmZWFpFQ0mP+9nzyM+jv+KMhttTvZv5TH7hWmBcdrnrYMa8ilkpl
 0mqxBtYZ14d5C5P0lPl77p+wu0WVpNtLhGH0aMscVhdpGEDrR0UZNZPOg8DuYYV3GPEw
 wm7LX4wnFOhSb0MIuqcgtmORwVoK69yz5/BZ9NRy5Gc3GepCi6+xYQjyEOULG/W0gMsP
 kirg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb14KcbWBa8sbJYksSyD6Rgh8qtllfAz/6KdG7YfsUmmBgOM8L8ZWnNr3mGRfss3wsHKsFGEcHDL4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoU35XJZAdA91wfUazqB4R6OzdiKaFLooGh4UwpWvO95cq+TAY
 q7xA840NbSd7yFz3MTuItUp9udyTcf9XoMiKHvyuCsq4XHXvBz/6qUv6m00hZzzV
X-Gm-Gg: ASbGncuLw83isUaNxqMem62mDX8qe2rC2Namzawv2Dmd33MR0xqL3Ge74jPyV9co0QC
 rLucsItbCyTum+Ppp9Qfuet0+L6Ee+cHmqiDa7h6xIlAWMTdoswzYB1oODU+YlRatVR9Qf/A27U
 muT0g5I7dfTVjbETXjzUw5oM1xvNRKHbc4MvwK3ZCzJQiY9zwOJHUhtWRJKmpy1vNL5Q+8OSBJD
 BwCK4diXKBVDkqg1RqGPGTMwa2RreyVICBMoOmZ89vYqazFBoOBd6nDrmYR5DUGbth6iSnydCsk
 E5KE5i+Zr8yO619cnbd/20ou/DvMSKqEV0f39kSAeo5WjbEJAJcdbvzxRJwVTUtJmSf/fpUNnUJ
 EoDQX0G3qztv44Vp4b+TdEI6nQQ==
X-Google-Smtp-Source: AGHT+IGa82dhccMSznFCdUK8nt/vJYdNvJ62DOcRWmV+PubMnb3MSOvBSLXEG0vhU152PL+II41O1A==
X-Received: by 2002:a17:907:3d42:b0:ae0:bbd2:68d1 with SMTP id
 a640c23a62f3a-ae3c2d2d0ebmr165994466b.37.1751441360391; 
 Wed, 02 Jul 2025 00:29:20 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com.
 [209.85.218.44]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353c01511sm1018849066b.82.2025.07.02.00.29.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 00:29:20 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ae36dc91dc7so701114366b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jul 2025 00:29:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXL/6HCPM/a5BVQZeA63FlBenUMuE8FdXeDVgAToftmJ+C34nARALELHDdsmZ6CQgMtrtE7ZLuGTvc=@lists.freedesktop.org
X-Received: by 2002:a2e:881a:0:b0:32a:6e77:3e57 with SMTP id
 38308e7fff4ca-32e00059701mr5163051fa.21.1751440904870; Wed, 02 Jul 2025
 00:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250701201124.812882-1-paulk@sys-base.io>
 <20250701201124.812882-2-paulk@sys-base.io>
In-Reply-To: <20250701201124.812882-2-paulk@sys-base.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 2 Jul 2025 15:21:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v65KrLwM+gQEWFVrzCcGPL+Fdhmb9b0FTJGkxrDqv4ucig@mail.gmail.com>
X-Gm-Features: Ac12FXzCUNmtlDRkeXVtg02FaWchFlhOllywrVEAHXAtLHX_qmyxYGIEnu1zURg
Message-ID: <CAGb2v65KrLwM+gQEWFVrzCcGPL+Fdhmb9b0FTJGkxrDqv4ucig@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: v3s: Fix wrong comment about UART2
 pinmux
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
 Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.xyz>, 
 Andre Przywara <andre.przywara@arm.com>
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 2, 2025 at 4:13=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.io=
> wrote:
>
> The original comment doesn't match the pin attribution, probably due
> to a hasty copy/paste.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Acked-by Chen-Yu Tsai <wens@csie.org>

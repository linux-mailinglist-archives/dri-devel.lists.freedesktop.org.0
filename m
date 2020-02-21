Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35331166D40
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 04:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4646E147;
	Fri, 21 Feb 2020 03:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCA66E147
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 03:11:01 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id c7so613195edu.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 19:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5IR9MInLSyig3scu1SFmQNLrc98r/Dsahj0QMhBQSvg=;
 b=AdLAeaM2xIKuiQhWVZtet50s0gWa7pKNwpo4H5uVKZ9i2DW0esm0MjJ+KHR43rw9ah
 BdkPoFolLhA7AbGGRZc17CIJT+TZ3WI5eJWd8zrfj3b23SdYYu43//TOlkdcgAVJq1jq
 Ao4DgzuHVsoGqYkKDzPsZyNt7nMLTGhfjSb9Pb+wgseUzFoCF1MVYuvXoQwIorNmOeXW
 yrvuDnyfjT2UOvG2mSrP/j3EQX6naC5rSuNE2zWDM2A70VbmGnFxVZCAmVTnzuaMPZ62
 xP66cTLjsixFOc/Gylytp5CwEpP0+PEmhGtfXnTKX/q/vH2edjixk2tzRO2Mbi9rvS0m
 nJyg==
X-Gm-Message-State: APjAAAVqH60ct9AwsoyOaYqqIcxCGtyfldt7pMq3dumGuZYk5M5/q5JC
 0+MTr52rixEgsH4KOx1/L0AD0mdJ7l0=
X-Google-Smtp-Source: APXvYqzRB/kAOGaAsauKGhvkqCSNIkeoCTSP/TEUOOKSQtv9uk6ePMUxNBBqLen+76uG/8w910fiCQ==
X-Received: by 2002:a05:6402:655:: with SMTP id
 u21mr32229320edx.78.1582254659199; 
 Thu, 20 Feb 2020 19:10:59 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48])
 by smtp.gmail.com with ESMTPSA id a9sm155737edm.82.2020.02.20.19.10.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 19:10:58 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id z7so321070wrl.13
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 19:10:58 -0800 (PST)
X-Received: by 2002:a5d:640d:: with SMTP id z13mr44015219wru.181.1582254658558; 
 Thu, 20 Feb 2020 19:10:58 -0800 (PST)
MIME-Version: 1.0
References: <20200214120934.107924-1-maxime@cerno.tech>
In-Reply-To: <20200214120934.107924-1-maxime@cerno.tech>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 21 Feb 2020 11:10:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v67L9uMQJfx7BBgGUSq7D=LEE1w89s-kYQX+u3iPtrJX_A@mail.gmail.com>
Message-ID: <CAGb2v67L9uMQJfx7BBgGUSq7D=LEE1w89s-kYQX+u3iPtrJX_A@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: tcon: Support LVDS on the A33
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 8:09 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The A33 TCON supports LVDS, so we can toggle the support switch.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Chen-Yu Tsai <wens@csie.org>

The user manual doesn't list the bits for LVDS signal polarity though.
I assume this was verified with the BSP or actual testing? (or rather,
will be in the LVDS signal polarity patches.)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

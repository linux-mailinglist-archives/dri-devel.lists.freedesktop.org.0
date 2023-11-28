Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E907FC10D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 19:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE12510E5A7;
	Tue, 28 Nov 2023 18:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5089C10E5A7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 18:10:13 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-41cd97d7272so31791421cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701195012; x=1701799812; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=f2GMrLcGcuPvxGptutNWB7kt5k9GOKF04a50so4967s=;
 b=oe/sUvAITqeAWRL2Ad/H2Br7Jq34RCWg6NPHc0wYCLGfotTRUBGxFTe9ZZEYcnCSuf
 h2Gbmp8QDvEPBXPUbMbihBFbkzluU7GBCUmTyEPQgMaAG4GCLPH/IA/9sSx0X3hcxoG4
 pVf4t07X3SX8EAcJV8jV7bjVMBYKr4k9l7XGIg0a1RUHFPqDahw2qNqZmdpVNtSfD68o
 U+xajglUfqNRlZoIdTKPcCcMSgG4K/eAobzLnEy5zd7EOkmvbsuC6ZtrIA4E1tqVdAen
 nIQhMndJaYGWnGvkOi9pvfQB1BQf3DqCHbxzrbr+rQF55Zvn0nY1kZq6tZ694IzXRjdJ
 lwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701195012; x=1701799812;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f2GMrLcGcuPvxGptutNWB7kt5k9GOKF04a50so4967s=;
 b=PZc/uQdNC+eF5iVADVdsesXrIbnYUDUUCPih/ttficLl6GsW+9/K3xUKAY9Bx3bzSl
 YC/YXXxV6YTOJuqrMjpWlmgJmNWoh5s2t+ZXSO/7ODLnODNi1Z79P9uH6y+epnyMVreR
 KVoMPqAxpeMz0nfSJzym2GNKNitFxrbql5ysnYDCflykoLiKatBW5I8A8hUR82EUllnU
 tEWn15TNPZF7e9Nzj/cTb7wr8HYt+IseXTEIuVBBnZgdOirbNBQ5D+atLw3GNi3eUjOG
 QVIc2BxyKTnF/M7HWWZmacbQOJ3OkO+JtqepO8i3Ishr5PgzUs4MTWrdR90yAHTwuN+C
 YqzQ==
X-Gm-Message-State: AOJu0Ywe1RZLRww+1CwP71E0G97zkIACP5D8kI6wt9I8/gExdFEmslu6
 0Xgt66dxoJCUs6WkyMMeyM1/RQ==
X-Google-Smtp-Source: AGHT+IEcJ1uAsb80kR1B3aJuT1IUjjgas87J8p1OJjPxsDlwIaK05wTXQ3zKeNcgXFK4baOeAFiQ6A==
X-Received: by 2002:a0c:ec4d:0:b0:67a:3efd:d6f6 with SMTP id
 n13-20020a0cec4d000000b0067a3efdd6f6mr8466084qvq.50.1701195012288; 
 Tue, 28 Nov 2023 10:10:12 -0800 (PST)
Received: from aspen.lan ([209.120.180.235]) by smtp.gmail.com with ESMTPSA id
 t15-20020a05621421af00b0067a4452d459sm2164807qvc.116.2023.11.28.10.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 10:10:11 -0800 (PST)
Date: Tue, 28 Nov 2023 13:10:07 -0500
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH] backlight: mp3309c: fix uninitialized local variable
Message-ID: <20231128181007.GA4431@aspen.lan>
References: <20231128150839.2605003-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128150839.2605003-1-f.suligoi@asem.it>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 04:08:39PM +0100, Flavio Suligoi wrote:
> In the function "pm3309c_parse_dt_node", when the dimming analog control
> mode (by I2C messages) is enabled, the local variable "prop_levels" is
> tested without any initialization, as indicated by the following smatch
> warning (thanks to Dan Carpenter for the report):

Good to see credit for the reporter but please use a "Reported-by:" tag
for that. There should probably be a "Fixed:" tag too.


> drivers/video/backlight/mp3309c.c:279 pm3309c_parse_dt_node() error: uninitialized symbol 'prop_levels'.
>
> To avoid any problem in case of undefined behavior, we need to initialize
> it to "NULL".
> For consistency, I also initialize the other similar variable
> "prop_pwms" in the same way.

I don't love redundant initializations... but I can live with it ;-) .


Daniel.

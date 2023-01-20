Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE09867580F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 16:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F86A10E108;
	Fri, 20 Jan 2023 15:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628A710E108
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 15:04:43 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d2so5094044wrp.8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 07:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uM/AZbTE0N3wZ9K7Id9185G9SFTYGVUQ4zyUZJh9c2w=;
 b=CMZNxqXQ9bGvQVB4/W/6bW3PRwNIRC70HtD6CJVTdSa9HMXFonB3kv/2HjpA3yAJYZ
 2Eej0Hg0oKuHk7A7GvhK911K0PUvz6QcPBrxWwUzAmK1zU7vF8JS0A4dTmjdTVo0WLxz
 bMao64u/Dkp3wTuQpMD898RVrGzo2AYyEll6Yg1fjU1Sm6o2M6W7181K66UiYEufB089
 I3SjVlGJ+o3k1ujThb7R7A+ZvC7uYm3vOdHlq+Y68eAhAkRjQpnzCpU5sfCZZw5P84OY
 yxBmT1RS1Kv5Ywa4oW1Hg9Y95w9I2ZogmB+44X6Gf6eVa/FkQW+I3vOT+PNh6u8GpUMe
 hLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uM/AZbTE0N3wZ9K7Id9185G9SFTYGVUQ4zyUZJh9c2w=;
 b=bRDkhTw76g4/iHj+/UMZs6aLfp/jAIf39Uf/oWW1ebejGQ9jLNUzhdoni3/cLPLkfA
 5VAsfDx4BJFAuwUZpKiXoqqfURhR59nwVNfrLE/efQHRG6/xUlSOTD1dvO1cxPwqOhnr
 bnhsju5YoIDybvsmzmmLo/4Va//fPx63Ivc+VeC33AkOO2nLewW5keKrGtFhPaqX5FBT
 luviyVJfZ+0shkWNfA3HciYZZT6q+mL77o0uJzZvBB3+fj6Nt2+d9V3y3p2D2qyPHlu7
 xs3lCejjSoOPeMvdCTQy2PzM++cbeXfXw9orCDEBiOKj29A8O+6Yx4ym+o09G/858+iy
 qDqA==
X-Gm-Message-State: AFqh2kqTgpLzAd6n2fXe2uCD3cVumI6HJwk//7josWE4Uby2lmUe0WRD
 UXayAB0lh99R7EPmyjU2c2YhRQ==
X-Google-Smtp-Source: AMrXdXsPQxYA6ZUOJLdOPKyWDyB3wvLu9sSjvk0brOwg0HIxvtJpTyjbgqStno4YTK6idzKQeiT5Sw==
X-Received: by 2002:a5d:5190:0:b0:2bd:fde4:885c with SMTP id
 k16-20020a5d5190000000b002bdfde4885cmr12005062wrv.63.1674227081607; 
 Fri, 20 Jan 2023 07:04:41 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 j15-20020adfd20f000000b002be2a4b521fsm8858850wrh.45.2023.01.20.07.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:04:40 -0800 (PST)
Date: Fri, 20 Jan 2023 15:04:38 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 2/2] backlight: pwm_bl: Don't rely on a disabled PWM
 emiting inactive state
Message-ID: <Y8qthjHiCTO3OK/R@aspen.lan>
References: <20230120120018.161103-1-u.kleine-koenig@pengutronix.de>
 <20230120120018.161103-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230120120018.161103-3-u.kleine-koenig@pengutronix.de>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 01:00:18PM +0100, Uwe Kleine-König wrote:
> Most but not all PWMs drive the PWM pin to its inactive state when
> disabled. However if there is no enable_gpio and no regulator the PWM
> must drive the inactive state to actually disable the backlight.
>
> So keep the PWM on in this case.
>
> Note that to determine if there is a regulator some effort is required
> because it might happen that there isn't actually one but the regulator
> core gave us a dummy. (A nice side effect is that this makes the
> regulator actually optional even on fully constrained systems.)
>
> This fixes backlight disabling e.g. on i.MX6 when an inverted PWM is
> used.
>
> Hint for the future: If this change results in a regression, the bug is
> in the lowlevel PWM driver.

:-)


> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thanks for the changes. Looks good:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

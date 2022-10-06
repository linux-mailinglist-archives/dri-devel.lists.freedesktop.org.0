Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BF85F6338
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 11:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBA010E36F;
	Thu,  6 Oct 2022 09:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFCE10E394
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 09:03:29 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id 13so3120135ejn.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 02:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=1yddKYac+3X7pcirMtwSeEtzvk1L8p2YF/xQufQ19P8=;
 b=SWNuVdxF51axUdgt0ko0fJT6zIZhBshW50rRpZrMwl697SOQn7tseTweQefqvLQAcv
 OOcPUHDdvIkdC4kOeEnyAyInACdkhpkhPLfpYV/lJTN507mhFrxXA+DvgQ+yauMMVUWO
 nNxJCe1R50v/saJ+oMWdHRGlwtmwUmbl4t64XwgDnF+W/4newn74BxLGDt3/meEmQzAZ
 5ZUlM0yF3ciy7Xcqqo6bjBqXBtJ1WTI0A86T7apbGmMMYbaR8GNpP3MfH13CZdkX2rlV
 gK1WzySLAbwehIBjc9LCnB7nCCscby/rS7/vY7Pn62qDTu1ehUYrkdXYzK8/dF6wygjh
 L2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=1yddKYac+3X7pcirMtwSeEtzvk1L8p2YF/xQufQ19P8=;
 b=ZFy57cUMUcaWAOdP4RCCfGcI/eawe7dSNObUQ4Vb0r2zrm7m/y/LmSkqnbU3jQITyP
 jthfVNNDsn73EAHHgir+tMYRdAlzbKOyfbNrPbeVQ6+qC7rYvxxKdkjz/ccPxWB1JbNm
 0ocRa6fjLXl8Gsk0WWfB+yrC43ym9tCusZWx9n+aLKtnf5WJ+XCPvDHXwt3orcWhF1HY
 LSvx6PEU29VT2pZoYohKvWcYQepHdINGLnRQy0nMXQG8UR9W2UW9V9J2JvkRDeiHeaZI
 Y0VOlblsVtzOzd2nefDvFSGnMSA6R1mYGZuWcW4Bega16brGjkWv0Ra04llDm/0+boiG
 s2bw==
X-Gm-Message-State: ACrzQf3baWshuDUGc7KGggJvRZEVMIKm8beN4ejB6Qf404jfSQLh71yz
 cdZDYVVpn5xfcxcTVL2i/NHR2sBfFhwBOeZaoKUeW5EUH+s=
X-Google-Smtp-Source: AMsMyM5LyK8I/k//MgZDRg/DTE1jan/OXiYFcGl/lh1ZAAwpTB6ll4P4/NUvwUDZQKoGma/VN0owmFcpI+wwFuDf4UQ=
X-Received: by 2002:a17:907:2d0b:b0:782:76dc:e557 with SMTP id
 gs11-20020a1709072d0b00b0078276dce557mr3018467ejc.690.1665047007502; Thu, 06
 Oct 2022 02:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <YzN6A9Y20Ea1LdEz@google.com>
 <CACRpkdZF9TVA3+3pgjqm_cnhfPO6p0oOT=2jrqFafMCHe2cwDg@mail.gmail.com>
 <YzwtG8CT9sTCqQQk@maple.lan>
 <CACRpkdZ-DfZKgCOHaKn1UZ8vVwy1dEiFBBDNdxu6VNzrUdeEtA@mail.gmail.com>
 <YzyZJSwy9xsy69WL@google.com>
In-Reply-To: <YzyZJSwy9xsy69WL@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Oct 2022 11:03:15 +0200
Message-ID: <CACRpkdYecQPUd-evVpOpMLY1XUa87kP4i+E694QfTtDbEarJfQ@mail.gmail.com>
Subject: Re: [RFC/PATCH] backlight: hx8357: prepare to conversion to gpiod API
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 4, 2022 at 10:35 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> > Dmitry, could you fix this? Just patch away in gpiolib-of.c.
>
> Sure, I'll add a few quirks. I wonder what is the best way to merge
> this? I can create a bunch of IBs to be pulled, or I can send quirks to
> you/Bartosz and once they land send the patches to drivers...

When I did it I was sufficiently convinced that I was the only one patching
the quirks in gpiolib-of.c that merge window so I just included it as
a hunk in the driver patch. If there will be some more patches to that
file I guess some separate patch(es) for gpiolib-of.c is needed, maybe
an immutable branch for those if it becomes a lot.

Yours,
Linus Walleij

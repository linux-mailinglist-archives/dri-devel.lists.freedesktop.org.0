Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529DC5F4A5F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 22:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B7210E113;
	Tue,  4 Oct 2022 20:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC11A10E10E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 20:35:53 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 h8-20020a17090a054800b00205ccbae31eso19651585pjf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 13:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=9fXt++4LgE9mXdKKs8Gz37yN6oaUTd7sRbjLloeTITA=;
 b=EM/izpDhzVgjLPP4z1Be56ZjebluoeNmZOVtYAdYVA1P7id/xrgZ5bH/0xCvP5yEXy
 YB1nt9x5W7qVukkUhpaPSrEWoT/LE22oe4vCOdiovkhSqOpSSsP2/uh5oEYZ8Gb4L/Pb
 HYHkRzOMDocHXsTt4SRcr+EIbR7w3s4wj/NXLz5eXf9+uBxpHwplErA+kioTVvOEsOSK
 VCgefRXa5wKvoS2YTSO+aqCnJVPw8aj4nOHCj9sRHwq2/MVZZkrlBGUh4s1j7l5GFakQ
 y4D/grX3MgEpeWY6wWwuW193whiyo/b3v1SFVqGuBhGQNIxZveMvPVk8caFMSDMYNg6x
 VXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=9fXt++4LgE9mXdKKs8Gz37yN6oaUTd7sRbjLloeTITA=;
 b=hcW69FBXPaMn9ln3OBpZA23v+p9J9b3mVDl+cio6PpMr05rvrzA4JOajzh2RuUc0PD
 7uoMJk1zFS89FSZJvBCj5N+O2Zlr65mqWBwO5NP/qEWn60s6fP0MfQJ71f55/I/juPEx
 HJNfp4LKFFZksf4wsMz8nmNvQy+jfbeZieZmt2wSFJF8L2758sfnfJgI9b5jcpkQneTx
 ZfpprIvzmY/tUt6ReNMOAUpD2+rm/CjSjF8evraYdM+X8/RA/3yCrJALRtuE4wqh9rm+
 JKGaX4+7w7t/dV5TTr30ggjCaHN3X2nEwm91Pz+QR24t2i46wUC1OEKN8GX28Dbzh4fG
 IuCw==
X-Gm-Message-State: ACrzQf14fYlNxcQpy6xp996hEZT23kmsRI/o38Uh5R8G7qLGQhcXu3WM
 XK2bWdxoDpnBOcz6qPa1X/A=
X-Google-Smtp-Source: AMsMyM5UzOCqqtVVf0Pssp93TeW8vr3ihVhmaabDx/b+rVCItuV0nYKbvscpLLcx1nfd34nR6aZ4dA==
X-Received: by 2002:a17:902:ccc2:b0:178:29f9:5c5e with SMTP id
 z2-20020a170902ccc200b0017829f95c5emr27263792ple.21.1664915753290; 
 Tue, 04 Oct 2022 13:35:53 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:978:a034:8ff4:b4b5])
 by smtp.gmail.com with ESMTPSA id
 63-20020a620442000000b00540d03f3792sm9704838pfe.81.2022.10.04.13.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 13:35:52 -0700 (PDT)
Date: Tue, 4 Oct 2022 13:35:49 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC/PATCH] backlight: hx8357: prepare to conversion to gpiod API
Message-ID: <YzyZJSwy9xsy69WL@google.com>
References: <YzN6A9Y20Ea1LdEz@google.com>
 <CACRpkdZF9TVA3+3pgjqm_cnhfPO6p0oOT=2jrqFafMCHe2cwDg@mail.gmail.com>
 <YzwtG8CT9sTCqQQk@maple.lan>
 <CACRpkdZ-DfZKgCOHaKn1UZ8vVwy1dEiFBBDNdxu6VNzrUdeEtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ-DfZKgCOHaKn1UZ8vVwy1dEiFBBDNdxu6VNzrUdeEtA@mail.gmail.com>
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

On Tue, Oct 04, 2022 at 09:50:25PM +0200, Linus Walleij wrote:
> On Tue, Oct 4, 2022 at 2:54 PM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> 
> > > We need to know if i.MX is shipping device trees stored in flash,
> > > or if they bundle it with the kernel.
> >
> > This part is frequently found in add-on boards so it's not purely an
> > i.MX-only question.
> 
> Oh
> 
> > IMHO for not-in-the-soc devices like this the presence of in-kernel DTs
> > isn't enough to make a decision. What is needed is a degree of
> > due-diligence to show that there are no obvious out-of-kernel users.
> 
> OK I think this is a good case to use a special quirk in this case.
> I actually envisioned keeping piling them up, and that they would
> not be innumerable.
> 
> Dmitry, could you fix this? Just patch away in gpiolib-of.c.

Sure, I'll add a few quirks. I wonder what is the best way to merge
this? I can create a bunch of IBs to be pulled, or I can send quirks to
you/Bartosz and once they land send the patches to drivers...

Thanks.

-- 
Dmitry

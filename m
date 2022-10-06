Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0A75F641C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 12:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA7210E090;
	Thu,  6 Oct 2022 10:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D69410E090
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 10:05:03 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u10so1922231wrq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WpK3HEcxibyqFugwFNWtBIn86oNeXCvN7BKqOHswlgA=;
 b=uM9HzOePGDYNdUPbTWeUMjWdVjHoYjfTzPNWnmhbIC2Dhp6WhbxLT0x1Esu4jsEx7a
 FJ6zSC7wCuoO3ldP54UZRiOKr7mvVvlW6wEVDZ5ExF9PkKoIojrSYFA1MtZ//aKbzmgT
 o+oRefRmk2W8wNIfOVrHJ+yM/YXcRvyDjNsGiTMal7GH/mIb3F3sKFYhgsBFXxiUdrK6
 UnlnNC+OI7WD1PMUaWI9dXh9TLuY0MGdHMuu9FSCH3mZKCK3Q5xYf2R8UaLrAMCbjGH6
 0D8Rl7YIdomaevqqy0/4aWRzanIWQ75az3z611q+NiPJo4M/oklXDDNkxTIEQLp1BGFl
 lcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WpK3HEcxibyqFugwFNWtBIn86oNeXCvN7BKqOHswlgA=;
 b=6xGhacnbA/ZYwA4guasHmmnMNLkYMqe6MY6Ln1XJ0Wv/no3mJtE8qg7vLVKUgXfh9j
 yrfifAEOz3zUUFaxzOzNTv7CL593DCBxMqOmTKYCyu2VoS4lj/V2TU0K5NnGONirWtHI
 rUnQG7R31zrNGzaI2S+rqLToTGwNfFP2veWkwLJ07FiG05zu38mam2M0H0RIBkYWFq/q
 cnC/c7u0flxYshsKqcMyEQ8sS6FpShYN4y3QSIXd5FzsUsNB6ComRqSqJ/+Od9D29u7R
 uZPVAh52AfiOcwKKtXm1xbwJVCYw0+KD1HiHU1WlWMQawU5pS4r1jQsu5SklEp164SUi
 d5pA==
X-Gm-Message-State: ACrzQf3vRtsqcYiZX3fcx3/GHU0bcj98FTlOj3vCjHzu6eiGTzovl9dT
 nmS5sGif64rEVaAiG5uAEue3qA==
X-Google-Smtp-Source: AMsMyM7CJ6PtzzkeBzex4HDz66ngkKYtXQI1uZDi5YTDtwdhQ98N9OpHJt69/dNHNbzqRDYjr/FdAA==
X-Received: by 2002:a5d:64c2:0:b0:22e:41b1:faf7 with SMTP id
 f2-20020a5d64c2000000b0022e41b1faf7mr2433214wri.428.1665050701841; 
 Thu, 06 Oct 2022 03:05:01 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 y9-20020a5d4ac9000000b0021badf3cb26sm22098016wrs.63.2022.10.06.03.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 03:05:01 -0700 (PDT)
Date: Thu, 6 Oct 2022 11:04:59 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC/PATCH] backlight: hx8357: prepare to conversion to gpiod API
Message-ID: <Yz6oS/zdNIOEtWxI@maple.lan>
References: <YzN6A9Y20Ea1LdEz@google.com>
 <CACRpkdZF9TVA3+3pgjqm_cnhfPO6p0oOT=2jrqFafMCHe2cwDg@mail.gmail.com>
 <YzwtG8CT9sTCqQQk@maple.lan>
 <CACRpkdZ-DfZKgCOHaKn1UZ8vVwy1dEiFBBDNdxu6VNzrUdeEtA@mail.gmail.com>
 <YzyZJSwy9xsy69WL@google.com>
 <CACRpkdYecQPUd-evVpOpMLY1XUa87kP4i+E694QfTtDbEarJfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYecQPUd-evVpOpMLY1XUa87kP4i+E694QfTtDbEarJfQ@mail.gmail.com>
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
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 06, 2022 at 11:03:15AM +0200, Linus Walleij wrote:
> On Tue, Oct 4, 2022 at 10:35 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>
> > > Dmitry, could you fix this? Just patch away in gpiolib-of.c.
> >
> > Sure, I'll add a few quirks. I wonder what is the best way to merge
> > this? I can create a bunch of IBs to be pulled, or I can send quirks to
> > you/Bartosz and once they land send the patches to drivers...
>
> When I did it I was sufficiently convinced that I was the only one patching
> the quirks in gpiolib-of.c that merge window so I just included it as
> a hunk in the driver patch. If there will be some more patches to that
> file I guess some separate patch(es) for gpiolib-of.c is needed, maybe
> an immutable branch for those if it becomes a lot.

Are renames likely to be a common quirk on the road to libgpiod
conversion?

I admit I sort of expected it to be common enough that there would be
one rename quirk in the code supported by an alphabetized string table.
Such a table would certainly still provoke troublesome merges but ones
that are trivially resolved.


Daniel.

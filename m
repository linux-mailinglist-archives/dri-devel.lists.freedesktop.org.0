Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2560C7BEC6E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 23:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C91010E2F1;
	Mon,  9 Oct 2023 21:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE64F10E1B7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 21:13:03 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4063bfc6c03so150815e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 14:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696885982; x=1697490782;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QqbHq0ttFKvzPDwgSW9g3cAaws+68PDkrZBukLsrYPg=;
 b=cEzfJkOLlkhvcwG2AZ74tI/MpNND2fbdf1p3T7S+OrYfwk4vlevy8hnD3Tz2PkcTxG
 wqNIqyBSQoKtt9BXagjiWdntPeHOsKAwZGGX6rKmVIdzJqp7+iNXYTZGBfyw8Opqju9z
 DpkvW+wXYXosGpBa1TD9fxC2E8BpZIYHPubGt/GIMG6fI2TbEgfHyn5ZBsvPsYn51so+
 uUeSeTHRjXSM/b+oYDPIEO5XiRSn+Ir9Yl1ALF67qzJMEFfElBBOIIe9utpaz7O9SPSg
 lqOxoHx0ZkEejY+X/TUUZbO3+gr1UJlUwdDS9Y471G4k8toiGl4XU6BvWFtZaL/d3adG
 rbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696885982; x=1697490782;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QqbHq0ttFKvzPDwgSW9g3cAaws+68PDkrZBukLsrYPg=;
 b=Ke91SEOcNcYzPYx64KoPRheyyEV1RFZzABl+dh7JUJoXy9ysdHkLsKmgoxAFp84NTs
 DBfZ4D4AyWHFwUP1W5UL09uxWJqVBE9u0Y6Nm3xJRfTmjXuh0l2XwCc4caYvgP1s4L5m
 aw27pFdzD2jmmI6rIBShVTlJ44jLnlFlwbls1HtxI4hvhc2ooZdNSBNUIxmAApNflxKC
 +b/ef0RZbAO0yE1+wPYPo7WR5/ab473Ux/SPwZnFD6e4d4MQnMtDO5BjsV72DBBdNleR
 oWoxE+O9gmpfR5MbK+AUtoNbUcrVSbecDUFsDr96ZRV4dOvhqbfsvcRRbIt3oVDHtu4/
 PhUA==
X-Gm-Message-State: AOJu0Yz6zOnA5UA1WOEfzsQYPtbRcy8KohxPdT7/Gv/xaQ2KJsk0652J
 GXQU2RJlAZCqBihi3YX2vteG4IptnNWxXrMTF1OlGg==
X-Google-Smtp-Source: AGHT+IEc1Yipf+guyltWqLmMAGO5WEoyxOts2zEN1XQRauRZYshwjhFYg1hG2ydPwgb8BE1UULsUeAEXoI4qSh8EO3Y=
X-Received: by 2002:a05:600c:1e25:b0:406:5779:181d with SMTP id
 ay37-20020a05600c1e2500b004065779181dmr383034wmb.2.1696885981988; Mon, 09 Oct
 2023 14:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231007060639.725350-1-yangcong5@huaqin.corp-partner.google.com>
 <CACRpkdbek0-Vhk4_34qY+0=EGrQxJS_CfLuF_5fRozMMyc+=Kw@mail.gmail.com>
 <CAD=FV=UFa_AoJQvUT3BTiRs19WCA2xLVeQOU=+nYu_HaE0_c6Q@mail.gmail.com>
 <CACRpkdYrFhTCa9rJ4savOcqRxcnyqoojCnwaCk6cnJv=aWxo4A@mail.gmail.com>
In-Reply-To: <CACRpkdYrFhTCa9rJ4savOcqRxcnyqoojCnwaCk6cnJv=aWxo4A@mail.gmail.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 9 Oct 2023 14:12:45 -0700
Message-ID: <CAD=FV=U5mX49s5yp+5uy+OfnkNrQgTJPf6E8fGHf=_Nn6M5f9A@mail.gmail.com>
Subject: Re: [v1 0/2] Break out as separate driver from boe-tv101wum-nl6 panel
 driver
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, hsinyi@google.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Oct 9, 2023 at 2:02=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Mon, Oct 9, 2023 at 10:53=E2=80=AFPM Doug Anderson <dianders@google.co=
m> wrote:
>
> > Also: just as a heads up, Hsin-Yi measured the impact of removing the
> > "command table" for init and replacing it with a whole pile of direct
> > function calls. She found that it added over 100K to the driver (!!!).
> > I believe it went from a 45K driver to a 152K driver. Something to
> > keep in mind. ;-)
>
> Sounds like Aarch64 code. I would love a comparison of the same
> driver compiled to ARMv7t thumb code. Just for the academic
> interest. Because I have heard about people running ARM32
> kernels on Aarch64 hardware for this exact reason: so they can
> have thumb, which is compact.

Yeah, thumb2 was the best.

I suspect that in addition to the aarch64 vs thumb2 part of the
problem is that mipi_dsi_dcs_write_seq() is a macro, so this wasn't
just a whole ton of function calls, but a whole ton of inline function
calls. ;-) Still, even if we fixed that, I'm not sure it we'll ever be
able to beat the space efficiency of command sequence tables.


> OK OK we definitely need command sequence tables in the core,
> what we have now is each driver rolling its own which is looking bad.

Agreed. I'd love to see someone tackle this (though not blocking
Cong's series on it). Hsin-Yi took a quick look at it and noticed that
some drivers have slightly different cases for how they handle command
sequences, which is a bit annoying. For instance, at least one driver
had an extra NOP between commands and said it was important not to
remove that. ...so we'd have to figure out how to abstract some of
these differences without it getting too ugly...

-Doug

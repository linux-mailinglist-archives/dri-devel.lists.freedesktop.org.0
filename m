Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 746A71BD4D8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 08:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AF76EC9D;
	Wed, 29 Apr 2020 06:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B236E8B2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 18:02:42 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 145so11045411pfw.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 11:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=mENmQ6Pb7H8tmR1MjtMLs0ubXE4BKzkIreYYg9JTmwQ=;
 b=fYgGHly79Oyel+aDS8shmE3wA06fO5kZLL/u3s85DS992pSDgr08Jx2wajFH7j1jHC
 Dm1K5xERcf6FhGPMuwNcv14JeebOPQZorvUlcLz9r0RxfDLF+gRc1j1BvIQq3RNpOm6Q
 9EMp+/yW1t/Q54ZgaBMcfsk1FEOfsZMCpkjScN0nwNDQzMFzUhf4HwlvdsjFpCVrgXEi
 EYB+aGQalOJeufMo73XeoDc9GtUPILpD4ag+vQctucSuvpTuQySVWKSYNmE/AT+LcaHE
 kI7bunItPbbWP55YlZJPCWyIY1A8G2+MqmrVUznPsc3Sd/HNKegH3CuGA+CTuEFt/kBt
 Fmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mENmQ6Pb7H8tmR1MjtMLs0ubXE4BKzkIreYYg9JTmwQ=;
 b=RpZOUmDmQnpcxQrdJsfZbVNF+MY/F7Hj6lR2V+ymy23Z9HMnB05OZeQGHrVclwRQwh
 zQHsPSpyYQSzdkTSpHdLxGZ/gtWNwgmB7wd7fMSoj3huaeUyYVIKOjDS8JO/ILBpYdsi
 v1K384JCDPqNEkL2nwjaNikLStv3FL9AQv1aMNQXVoI7spJ6rqEw+YffwQR1pPo9hVju
 NXbgBKnuK2HfjSKUWbXBhzSLqL+n5gnsIv64b8Z7JaYlFKEcYj5BC3FavNeiisoXH329
 h6nFK0qOZdyfa9/loHlWwTV0yD6tukQdaCcPSPkOHE0j58k5r3uUBHyKHxC+la9BHB4i
 JwPQ==
X-Gm-Message-State: AGi0Pub9GBn36DUMXqwaGBNni9rJHmOxn/bpZCApJXpG/vaISitYN8FQ
 /A96dGUI4tH/w4AhEoJ2Ga2E7w==
X-Google-Smtp-Source: APiQypJTI6DwHabWRQCA/LwS+jwG4QtUCwBuv+PQUF/I35yfyK+EKVAsd6jfQyV+7Qv9CI1ziwgX/w==
X-Received: by 2002:aa7:8593:: with SMTP id w19mr30860532pfn.97.1588096961545; 
 Tue, 28 Apr 2020 11:02:41 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id h197sm16248994pfe.208.2020.04.28.11.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 11:02:40 -0700 (PDT)
Date: Tue, 28 Apr 2020 11:02:38 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: simple: Add IVO M133NWF4 R0
Message-ID: <20200428180238.GK987656@yoga>
References: <20200420215728.1927434-1-bjorn.andersson@linaro.org>
 <20200425175842.GA3773@ravnborg.org>
 <CAL_JsqL6bMwrXZqvGz_H_aJi+EeoikBwKznLP2VomJ=Wn822Rg@mail.gmail.com>
 <20200428170559.GC27234@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428170559.GC27234@ravnborg.org>
X-Mailman-Approved-At: Wed, 29 Apr 2020 06:45:00 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 28 Apr 10:05 PDT 2020, Sam Ravnborg wrote:

> Hi Rob.
> =

> On Tue, Apr 28, 2020 at 09:27:51AM -0500, Rob Herring wrote:
> > On Sat, Apr 25, 2020 at 12:58 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Hi Bj=F6rn.
> > >
> > > On Mon, Apr 20, 2020 at 02:57:27PM -0700, Bjorn Andersson wrote:
> > > > Define the vendor prefix for InfoVision Optoelectronics and add the=
ir
> > > > M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel to the compatible l=
ist
> > > > of panel-simple.
> > > >
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > >
> > > I got OK for the vendor prefix on irc so patch is now added to
> > > drm-misc-next.
> > > Another time please use a dedicated patch for vendor-prefix
> > > so it is not hidden with other stuff. This way the chance
> > > to get the attention of the right people is better.
> > =

> > I should have mentioned there's basically one thing to check:
> > alphabetical order.
> I thought I checked that, but obviously not - hrmpf..

Sorry about that, I thought I did double check that before posting it...

> I will post a follow-up patch for drm-misc-next to fix it.
> =


Thank you,
Bjorn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

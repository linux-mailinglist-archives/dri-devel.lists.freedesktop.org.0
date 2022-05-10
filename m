Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4B7522244
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 19:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E0E10FBAE;
	Tue, 10 May 2022 17:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D37910FBCD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 17:20:41 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id r1so19236178oie.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 10:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Hl+EeVfg1SG/ItNk+3j3E/1KiMEoNYf4v98cMSThK0w=;
 b=k4SzzteRsVGaHx4I6LelnYhFfA3JJIq+MRT+hnaXmkFotF2nTq6ov1arvR4hFbPFNU
 ZSLiLKHh8zrcP3jX8/6PRQh2H4OPtjJ3xcvHTdhFmgW4QzAjWAL+6tRqqDmbSYoFaq7q
 Ph7eDHiyHwr/wndOi3IFvyL3PLtXQm6csALqx2Qy6UHridpmpJ5fWIGEtFc3KuEogVzy
 dIzQKyXKuGOOoEgjp9etoKSHmOWLZ+dzaXd2HnESZcIg1Cl/ioYrfXjXuCGspbOB5guh
 Z7g+2om7svfyMbS0KhOufL+/KKMl9aMYcMYopKg/QBjbtKkFGJ23JODe9nxdvdyfvohl
 d0PQ==
X-Gm-Message-State: AOAM53306Qqcq32UdO/koXwH0RjIbwwmrsajcnV/ehJgyfwxt1j6dy4C
 hzkGJFM6HLX61jW+J16aBw==
X-Google-Smtp-Source: ABdhPJwOTBdtvBdyjzF02XoaWDp7j9xraOoLUddz7oDSgLQpivKx7ligBzBxctKoqc23aW5jjq4W7w==
X-Received: by 2002:aca:ab54:0:b0:326:af63:7a7f with SMTP id
 u81-20020acaab54000000b00326af637a7fmr570106oie.26.1652203240858; 
 Tue, 10 May 2022 10:20:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i10-20020a9d624a000000b0060603221267sm5934704otk.55.2022.05.10.10.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 10:20:40 -0700 (PDT)
Received: (nullmailer pid 2230997 invoked by uid 1000);
 Tue, 10 May 2022 17:20:39 -0000
Date: Tue, 10 May 2022 12:20:39 -0500
From: Rob Herring <robh@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/3] dt-bindings: display: rockchip: make reg-names
 mandatory for VOP2
Message-ID: <Ynqe5zcWZw8KJMl1@robh.at.kernel.org>
References: <20220510070914.2346011-1-s.hauer@pengutronix.de>
 <20220510070914.2346011-2-s.hauer@pengutronix.de>
 <3353209.QJadu78ljV@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3353209.QJadu78ljV@diego>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 10, 2022 at 04:08:02PM +0200, Heiko Stübner wrote:
> Hi Sascha,
> 
> Am Dienstag, 10. Mai 2022, 09:09:12 CEST schrieb Sascha Hauer:
> > The VOP2 driver relies on reg-names properties, but these are not
> > documented. Add the missing documentation, make reg-names mandatory
> > and increase minItems to 2 as always both register spaces are needed.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> I'm not sure how the DT-people work - if they only track the devicetree list
> or their x+dt@kernel.org accounts or some mixture, but the patch was
> missing the maintainer email addresses - I've added them here now :-) .

I only see what is in DT PW. Since I'm copied on almost everything that 
goes to the DT list, CC'ing me has almost no effect.

> The change looks good to me and as I merged the original binding
> into drm-misc only some days ago, we also don't have a backwards-
> compat issue yet, so hopefully DT-people will think similarly .

It will fail checks... I can't run them as this doesn't apply, so 
hopefully someone does. Or I can complain when next breaks.

Rob

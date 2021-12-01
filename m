Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A45A24658B0
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 22:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1966E889;
	Wed,  1 Dec 2021 21:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15A56E896
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 21:57:18 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso37295298otr.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 13:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=aN8dRcN6+zd7oasgWAONmcRJZK+uIK9pRTcKdcu5dUA=;
 b=5CT/Xd8v0YN3Ax8yQAsmF0iN1OeiipIsitxc2a5xLOf55Clu3IIj5KUPpYXHwdH3uM
 r1BJAIlPHGI6bMtTDF9eF4/pDzH0hQNgIRkW/uSLBimZFXG7L6kjr9WTcQauEVoe/SlB
 32BzApm8wW40TZBnOq1O4ETJBGCPaoHeGFcx7xBPC6fG4Duj6xlK6pnaF8plLQ96DNPW
 mqhI2pMg8gUa0ZA3OTdNJPw5C9HaMB6odda112/kQIayP71unJ2jHdEcEN/MG7ggy2o/
 bmHbNS71fbSQF6Cg0sE11D9A95IruZ28uH5xabAMoxjHMbv93Z2xCAWaBaPTVqVUv0OP
 YPLA==
X-Gm-Message-State: AOAM533me2tZLnuO6OF79mJ7H9Hx/uIQMcTk3NmEUd9b28WIgbmAY/xb
 rRXzH9MJsvD20+586z+2F4jqGdd5Cw==
X-Google-Smtp-Source: ABdhPJxqCAXkJXICQHbkkyRujU57Gt2ub99dnsnj7jJyb3igqg9+/2JuSfI76oP3+F8RkuNXG3nXDg==
X-Received: by 2002:a05:6830:3499:: with SMTP id
 c25mr8435409otu.206.1638395838094; 
 Wed, 01 Dec 2021 13:57:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id be12sm612186oib.50.2021.12.01.13.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 13:57:17 -0800 (PST)
Received: (nullmailer pid 2749175 invoked by uid 1000);
 Wed, 01 Dec 2021 21:57:16 -0000
Date: Wed, 1 Dec 2021 15:57:16 -0600
From: Rob Herring <robh@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 2/6] dt-bindings: display: sitronix,st7735r: Make
 reset-gpios optional
Message-ID: <YafvvLHSfY2U4eA5@robh.at.kernel.org>
References: <20211124150757.17929-1-noralf@tronnes.org>
 <20211124150757.17929-3-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124150757.17929-3-noralf@tronnes.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 david@lechnology.com, dave.stevenson@raspberrypi.com,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 Nov 2021 16:07:53 +0100, Noralf Trønnes wrote:
> There are other ways than using a gpio to reset the controller so make
> this property optional.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  Documentation/devicetree/bindings/display/sitronix,st7735r.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

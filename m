Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2C89E1DD4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 14:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89B210E46D;
	Tue,  3 Dec 2024 13:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dgOtvvRH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC8210E45D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 13:41:53 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ffb5b131d0so54496811fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 05:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733233312; x=1733838112; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=b9EQvBAb2SX0qrGU/ZgIliBiKbnHvi2rA/qAWxRRbY0=;
 b=dgOtvvRHMG24nfe3O4fPch6BmK70W6Ss+RcbmHMmvVcZie4jnLSn2R0ioVWMx5YQxH
 AEikMefN713cb/6pkjphrUytDNyfnjoPUfbEiOOjAOFywYuRhFq82Gll1MozwF0BXtQE
 hb4dO8KU+EogoU9fARusk8OpS+PDwmOeRZhZgcAzUXIOFKhOT3zZr8ro9KSUdaJXtIkK
 vCoAShRx8h/LgBFIDWr62UWPhH+Vzh1u3GAC9N1qmEllWUEzHkXJo4jHi+etEGfCVWaI
 2aOnD8oHJC7UkMzU+4CD+guhybVNgLDbEiSvn6sgIBGNkS1s2dek7Q76id77449BXq6M
 rC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733233312; x=1733838112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b9EQvBAb2SX0qrGU/ZgIliBiKbnHvi2rA/qAWxRRbY0=;
 b=Wq3rahnDFRHOfUtpc237C1oVibeh9ry9es+HZTrMzrgZ2Q1IOgzEVxCvBJ+los0TcE
 4j43u12G1TxNnRaW3R8Cs5wmsBYXVxttfuVeKGtzT9s3e3APK3wAB8w9HLwweiwlFvM2
 IKVKMg5/Lk2fQYw7sDeLh5sLbV5SHwqZ9zRONdxLDVwyQMqwrzVV9LmfUrfG+Cbdrj3i
 W0Jd0qn1LGEJv/TihiUXnh4swH1C+Ns+Sop8DvFvOkpfFBDXt6j8giSirYWAcE9+Wb+i
 16N7CvZi3q7sijdjp4HXhzuDvpr2wXLXMTFqcsqG74MCSfYuEKoGwOH5cKgIghIX11JT
 Rz+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWec+v8wRz6XxU7mnOackapzvD6vMM4dENTwOZliAWhzzAqZudN/n37c14JkgSIwXkUQDTFPNVpTAc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVVGsjCQagdWjB56gVnt8Yo9kNMPqRMWRnTdsa4Kzzaq7aibsD
 JHfb7ND2pt5cHKcnAxljZexKWFOnXnBnC94J/VvOzsXgxx/VhBidqgkLu99IvLY=
X-Gm-Gg: ASbGncs0WKKqycBSuCTns2rkuGcLgmsbKJOEupP+WnS2wnXV2FsMgOHm0MMt/3wpNss
 WBuZntDXIt2+2E2XU8RLHNOSScH57cLBIEeaeEeDrHa79fYRNOAypW4bFj0AACWmA+zDbV044de
 4txuryfb/cgICm4/NX56o60dDQO436nXy67yjdXLB5zGrhlaVK1RmmaQ5p8B4lh0RT8UKIWzagf
 cf5l7lAQWUhAuCsbr0sApXYVUzemBXv3hgezLqLy0/dMvVd0JpDAr8WkWCfpwwhzFYXqT0zX+hJ
 DI16q04jSEehHuu8JAn/g6nVUlDSdw==
X-Google-Smtp-Source: AGHT+IHpMzPr6Lls4GRyBuCcJBMUBsc/X9uSkqqmTyZzvhlEVvAz5e+LXYqBKqUPPK3QZnPGFneqVQ==
X-Received: by 2002:a2e:a99f:0:b0:2ff:d49f:dd4a with SMTP id
 38308e7fff4ca-30014e2437fmr870081fa.21.1733233311908; 
 Tue, 03 Dec 2024 05:41:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfc75236sm16038451fa.86.2024.12.03.05.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 05:41:50 -0800 (PST)
Date: Tue, 3 Dec 2024 15:41:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: display: msm: dp-controller: document
 clock parents better
Message-ID: <gpqrugcsyhz32bvip5mgjtcservhral2o5b6c5nz4ocwbjw5uo@eypv4x6jyrdr>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-2-9a9a43b0624a@quicinc.com>
 <bfa857c2-cd74-4fe2-a88c-3b35a58710b0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfa857c2-cd74-4fe2-a88c-3b35a58710b0@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 03, 2024 at 09:01:31AM +0100, Krzysztof Kozlowski wrote:
> On 03/12/2024 04:31, Abhinav Kumar wrote:
> > Document the assigned-clock-parents better for the DP controller node
> > to indicate its functionality better.
> 
> 
> You change the clocks entirely, not "document". I would say that's an
> ABI break if it really is a Linux requirement. You could avoid any
> problems by just dropping the property from binding.

But if you take a look at the existing usage, the proposed change
matches the behaviour. So, I'd say, it's really a change that makes
documentation follow the actual hardware.

> 
> > 
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > index 35ae2630c2b3..9fe2bf0484d8 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > @@ -72,8 +72,8 @@ properties:
> >  
> >    assigned-clock-parents:
> >      items:
> > -      - description: phy 0 parent
> > -      - description: phy 1 parent
> > +      - description: Link clock PLL output provided by PHY block
> > +      - description: Stream 0 pixel clock PLL output provided by PHY block
> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

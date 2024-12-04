Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBDD9E3B4E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 14:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEF810ED0C;
	Wed,  4 Dec 2024 13:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BehLDnST";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BF110ED0C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 13:33:14 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ffdf564190so76870421fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 05:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733319192; x=1733923992; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RsB/NfCwM+1P1olfsdC/83TYUAkoJAqW1rAzLORxhG4=;
 b=BehLDnSTHjTYMGhTr/F85DdietvuHkgBAogvT+6VetpnY9Ys91TDmfXbvRUJIdA67e
 ipKsTz1p0D2UJXB9zUH1BpVzb3p8xYVKhjt3M/moemUy9rWDBJ5C6rsgW4bXLTTSr0PA
 KIVSNzZEQuulOS6cL8/Ci+OYQi5ODinmZROswOIiJBwZyGbwDL4pBpf8Ch/Y2ByOTJyM
 yPwC+vTa+6AHcIPjMAePysZEuEAwyTQ1ukFHjP4u5G5pUmugLD9tq68IJcd/86XnVdMk
 UKHdvUVasoFnXYdfulu6yq9qqh5nh0pt03JTaBBEPcrQ4ARgIaSHylKH2/ajyQpQwPrN
 E2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733319192; x=1733923992;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RsB/NfCwM+1P1olfsdC/83TYUAkoJAqW1rAzLORxhG4=;
 b=BEg0rbWLJFGnud/Ok1lht+Y/EsrW29ikMKHfz6HxNBCfS6j04b4YGHPq1TsCJUk37v
 3cG5/3ng1CzUF/CuWsIqjvUis1W4YRdc7q/Ptw+4ZpI4cWsg2PQ/06P2cQMta4a58ir5
 KuuR1P//zPVSr18A4/eJGSIlCupIZzYKxD2B9uGx0mEEmsczOQPW4DON2qG90vQiFlTL
 YjM3uLp6+uvDbl+S55kz8fFWRmJkhkPgGC78NI6us/WjgYFBWVbDISH+X/FTUw+kP51R
 QHSrU4Rrz/BsMZTw2JNM7gZIy4hyjxHG8NVnBVd+aM659vdktV3TtCM9kXDf1pWrI7Lh
 dfBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj0qTRGTLO19un2lUw7D5FX2HJjsaiz6rbVaZM3cbJJ//gRuoQX1L560O91QiqD3GsPSpLkRq6w8U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHoqeIpwWsa+UOrtcNRNAg2Zi+JQ3Uc7dl913lQ/ASfqJq30Us
 5SY86lFItGvRMox+wy+eiMuv3TR0sGrE8QVkJ6cgxuVkcRF+5PdUolRp78OFUoM=
X-Gm-Gg: ASbGncu0FOy1TzwxmB+xFKtMwedORzw5x1oeZ0dRIluTNR3zL6nXaeZziVvvXyMLyaK
 PMKfkMelY9NaXBwkJdsz7QV9BWsjj7QwTGOGT8Y06c1ikLKxfDfFuxQ4eL11A3FQLizIpe1CKrb
 5lnwu154VFXe6GkVb2BOS29VQ7fEjKoZ06cwCGqWmTXFPBU+aSpc0436GSljvteFxysjFLphvQH
 AV0TIG0gHf2QKxQAj7f43aJiMHJf/dfFX6I6u8NCST7+7+e41E3HKaCdwnsgPKgRJwfLy0iwimP
 qrjRe9+0bEYBZt9NmF7jeG7Bqt6RGQ==
X-Google-Smtp-Source: AGHT+IHljNFnGfVrhy26wQvMiA6JzxpZak1+n6ymrInfwTm7qaG3E2fx4pN19Sr0wCFYUH9zwMcJxA==
X-Received: by 2002:a2e:a5c9:0:b0:2ff:a415:5ac6 with SMTP id
 38308e7fff4ca-30009caa509mr36018411fa.29.1733319192549; 
 Wed, 04 Dec 2024 05:33:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfcd6f90sm19855931fa.126.2024.12.04.05.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 05:33:12 -0800 (PST)
Date: Wed, 4 Dec 2024 15:33:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Liu Ying <victor.liu@nxp.com>, linux-renesas-soc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, biju.das.jz@bp.renesas.com, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Message-ID: <7bzqm2qbr5zwwlltvbj77ux4hu5iwuwz25u3hwvgnwak5xyl7k@54wzvunf7cze>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <834a2690-ca06-4a8b-9a81-c4981074f95c@nxp.com>
 <Z1Aw0WafGmYDrr8K@tom-desktop>
 <cnauwpk7myky6zbfcqg5335dqif4vmggzxlq554ye2bykb5iwh@ng4oxd2c5md3>
 <Z1BVADAhfENdcc3y@tom-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1BVADAhfENdcc3y@tom-desktop>
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

On Wed, Dec 04, 2024 at 02:11:28PM +0100, Tommaso Merciai wrote:
> Hi Dmitry,
> 
> On Wed, Dec 04, 2024 at 01:53:44PM +0200, Dmitry Baryshkov wrote:
> > On Wed, Dec 04, 2024 at 11:37:05AM +0100, Tommaso Merciai wrote:
> > > Hi Liu Ying,
> > > Thanks for your review.
> > > 
> > > On Wed, Dec 04, 2024 at 11:34:23AM +0800, Liu Ying wrote:
> > > > On 12/04/2024, tomm.merciai@gmail.com wrote:
> > > > > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > > 
> > > > > Introduce it6263_is_input_bus_fmt_valid() and refactor the
> > > > > it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
> > > > > format by selecting the LVDS input format based on the LVDS data mapping
> > > > > and thereby support both JEIDA and VESA input formats.
> > > > 
> > > > ite,it6263.yaml says IT6263 supports vesa-24 and vesa-30, while
> > > > this patch actually only adds vesa-24 support.  So, to be more
> > > > specific, the patch subject and commit message should reflect
> > > > this rather than claim "Support VESA input format".
> > > 
> > > Fully agree, thanks.
> > > I will fix that in v2 specifying vesa-24 like you suggest.
> > > 
> > > > 
> > > > > 
> > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > 
> > > > Can you please send this patch with your Renesas email address
> > > > instead of Gmail email address?
> > > > Otherwise, add a Signed-off-by tag with your Gmail email address.
> > > 
> > > Thanks, for the point.
> > > What about adding Acked-by: from my renesas email address?
> > 
> > Acked-by has a different meaning. I'd say that generally it's okay to
> > have this light mismatch, see [1] or any of the emails that B4 generates
> > for web-based submission.
> > 
> > [1] https://lore.kernel.org/dri-devel/20241121164858.457921-1-robdclark@gmail.com/
> 
> Thanks for sharing this example and for the clarification.
> This is similar to my case :)
> 
> Then v1 procedure is correct?
> I can use the same formatting (From: Sob:) for sending v2?

I think so

> 
> Thanks & Regards,
> Tommaso
> > 
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

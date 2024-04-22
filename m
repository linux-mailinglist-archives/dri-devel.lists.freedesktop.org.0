Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250AA8AD504
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 21:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52942112D1B;
	Mon, 22 Apr 2024 19:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qJdVMgkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1376112D1B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 19:43:49 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-516d4d80d00so6205935e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713815028; x=1714419828; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=h1ey6L2csyRt+gTq+IESmLKOnnLpd2+PnL3t5tu0kbA=;
 b=qJdVMgkESYsnl0V32ai3ZRBC7AAY8tDc9us0266z5pTXJ1mmaTOjWHspwFqEwvqbpf
 xbO2BHLc9HzZJ8mKgKEwUrq/QpcTbjIK80LAOOo3VOdal5niVjZUdbNDSJyRHd3sDPZr
 Hfes+9uPCcahlNtytgAXqDJsYfZ1y2NHd7JlnOQZZ6hZsLFilk7gY7RIy8KoSkIWcEzX
 ZUzpWvEA3lI3C8UMCzVHpoUP78lig1dNOArdvpFB92DhVvmEo24Vw1tkheVF3uqZzaN0
 sGS/P+f9qlQ767TBKAWJV7S5d/ObI7XLkZAXBYMHRdafQ32pckuuQCOVZnwlY8zx/AdA
 woVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713815028; x=1714419828;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h1ey6L2csyRt+gTq+IESmLKOnnLpd2+PnL3t5tu0kbA=;
 b=B2mNoZiXEXOtoKtbxYOrNeoquiL7YbzO/ZnE6C+BAZ5aJ+FBQ5pihzBVG+1kZrUC7A
 ewL+5TtBxGP8B+1jwq/HC8IKCrRFCaTwmZsZ1+Q/1iF3xn3vsSt6t0T/2C7abCYnDlRq
 78ZH/y+Dl+jKPEMYMEudrMQCe9aSPzmX4VNfrL32uN7JXtUQgZb+jYKvVmXahNgGovX2
 NGgIEyA8M+LIvr4H4H4wFoT9vxhTL3jQAQvtMQNx0snUC+fMbcWTnLUL6tL2/pweWDOj
 B1jt6rHDcxMyHigtezuEaaaSiIf4lNywuqq/PlJPbLanIcnXJL7M8LbXFbVhNGICvoTq
 jb8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2RQ6Dk6ldKMk6bsJbM/LZEC8KdLJv98BHA+4+sWwttBh9RCsALrn1/ZT3mhzSj/piYQs5u3iyxyL8O3tfZ95guBvEQQy+F6tEg5CUZi2d
X-Gm-Message-State: AOJu0Yz63MCZX7zfe1swaRzWmGgXi+p5WmR+vTKTaO7/YaLDKdDKv7at
 igkJB65Bv+67loNd8mVzvdecLnxaOWxTaoxAOC31MROI2chC3nyN/E8BfinLzvY=
X-Google-Smtp-Source: AGHT+IG9ElrH/duOxvqcTOK0AesyJ0VjegSyv6v2IqW2JOwhgaQv9K0zAcHZGc9ZxELyif0HeSN2WQ==
X-Received: by 2002:a05:6512:ba0:b0:51a:b955:4014 with SMTP id
 b32-20020a0565120ba000b0051ab9554014mr9729079lfv.18.1713815027508; 
 Mon, 22 Apr 2024 12:43:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v14-20020ac2558e000000b0051891b7578esm1802167lfg.198.2024.04.22.12.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 12:43:47 -0700 (PDT)
Date: Mon, 22 Apr 2024 22:43:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Adolfsson <Johan.Adolfsson@axis.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 kernel <kernel@axis.com>
Subject: Re: [PATCH 1/2] drm/panel: panel-simple: Add generic panel-dsi driver
Message-ID: <dn33u6orierkw3skh3mymkc3u77wn2cbpqs7rznyndnku7txr7@2lvvxudsvda7>
References: <20240418-foo-fix-v1-0-461bcc8f5976@axis.com>
 <20240418-foo-fix-v1-1-461bcc8f5976@axis.com>
 <76b46467-6a27-4f07-8a3e-cdd51e2e28bb@linaro.org>
 <PAWPR02MB9281557BDDA960812412E0D59B122@PAWPR02MB9281.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAWPR02MB9281557BDDA960812412E0D59B122@PAWPR02MB9281.eurprd02.prod.outlook.com>
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

On Mon, Apr 22, 2024 at 02:05:01PM +0000, Johan Adolfsson wrote:
> Hi,
> Sorry for delayed response, still investigating why these mails didn't reach my inbox as expected..
> 
> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 
> Sent: den 19 april 2024 01:06
> To: Johan Adolfsson <Johan.Adolfsson@axis.com>; Neil Armstrong <neil.armstrong@linaro.org>; Jessica Zhang <quic_jesszhan@quicinc.com>; Sam Ravnborg <sam@ravnborg.org>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>; Thierry Reding <thierry.reding@gmail.com>
> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; kernel <kernel@axis.com>
> Subject: Re: [PATCH 1/2] drm/panel: panel-simple: Add generic panel-dsi driver
> 
> On 18/04/2024 16:01, Johan Adolfsson wrote:
> > Add generic panel-dsi panel, similar to panel-dpi that can have it's 
> > timing, lanes and flags overridden by devicetree.
> > Add some dev_err() and dev_warn() calls.
> > 
> 
> ...
> 
> >>  		/* sentinel */
> >>  	}
> >> @@ -4992,17 +5051,28 @@ static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
> >>  		return -ENODEV;
> >>  
> >>  	err = panel_simple_probe(&dsi->dev, &desc->desc);
> >> +	if (err)
> >> +		dev_err(&dsi->dev, "%s: err %i\n", __func__, err);
> 
> >This looks like debugging code.
> I added it since you don't really get any good hints on where things fails if they do it.
> Debugging code or not depends on the definition I guess - it helps the user track down a faulty devicetree,
> or as in the case below mismatch with the DSI driver.
> 
> ...
> >>  	dsi->format = desc->format;
> >>  	dsi->lanes = desc->lanes;
> >> +	of_property_read_u32(dsi->dev.of_node, "lanes", &dsi->lanes);
> >
> >Is this defined in the binding?
> 
> Apparently not which I assumed. Other bindings mentions dsi-lanes, but I guess "num-dsi-lanes" would be more correct.

Please use drm_of_get_data_lanes_count() and corresponding property from
the bindings.
> 
> >>  	err = mipi_dsi_attach(dsi);
> >>  	if (err) {
> >>  		struct panel_simple *panel = mipi_dsi_get_drvdata(dsi);
> >>  
> >> +		dev_err(&dsi->dev, "probe attach err: %i", err);
> >
> >Do not introduce unrelated code changes.
> 
> As before, it helps the user who has a messed up devicetree find out, since we now gets some more configurability using devicetree.
> Would it be acceptable as a separate commit, or should I simply skip this?
> 
> 
> >Best regards,
> >Krzysztof
> 
> Thanks!
> 
> Best regards
> /Johan
> 
> 

-- 
With best wishes
Dmitry

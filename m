Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E6E6B91D7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 12:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D6410E0DA;
	Tue, 14 Mar 2023 11:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46C010E162
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:40:32 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id i5so16282549pla.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678794032;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eH82WTYd39GPKAXdpbYy5VSkOFc2jW21usmU+S6UzaM=;
 b=WkXPZHabqVtCtmPiPhbTpbqbUbZAf7UDuh35/WLuHqxQ0p18Psv889vDS/yPUe1yI2
 ggWGepP5WBzmK50RVsxuLn/LTsnoSHRXI7VSThcnCfGf6CrdN6VXb0FYTdfyz9sg2fiv
 XDGhycxUNZa14Wmubkp+cdO+FLTGMlBF57CjDDyicxY6bry1eNQH364qoOasqilO3s2z
 4VFgfquWKyo05UDWSslDjvS/xrX5SD6SoSS5WKD86sJadAQd2YiGmnKTzgI9FLFhFPVA
 tbOYgkpNMEo5D5+ORWlpOT1V32oqmlKsQ88Mz6TxO3cxhWYOvxjRN9Nv3q6qM7s9Ly6v
 vqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678794032;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eH82WTYd39GPKAXdpbYy5VSkOFc2jW21usmU+S6UzaM=;
 b=ZiVF7ZDn4j6aYLtVh5GkiHf1hG9hqaBAq2T+/L4Cqh9H+vH1PK881+2b4on245AgeU
 106/yR3rB6blo+y+CZ2crme/DZsRyObT326n/4duVf1uqdigMMDvZ2PYjtDBY/a+Bxi7
 /n5JWQbiW2a/6iFJCQaJZ7zwuBfDlytJygh+CmQeZ3t3QGurlnR2S8DzXp7HKrjRQj65
 GjWd2rfTHpxlkLOZlFY2l+ZeI3iQv82sj0Gos5+yqQYSKk1rvjomAUwGMwMvd0K2exFp
 /XJh6A2QZjNsxie2g4eToZ0wAZ7cgMPpoLtiNTo2ZLHcY8Qp5JUyHbV3iFu8jJ2xO/vz
 aFng==
X-Gm-Message-State: AO0yUKV6/1sQ1Yi7v2+l1skT0uv8Kvnv/kkpbR5xytiz0OCLXsNjJotw
 SV5rLGlQYo6iixosbU1F9VM=
X-Google-Smtp-Source: AK7set9ftIWNNWDAHaADJAqiYdsj9tGVmw6svnfxG3uh7QWFxSecTPu9P+X9UtwpFti87PjPTHXSNg==
X-Received: by 2002:a17:902:f685:b0:19c:d49f:4296 with SMTP id
 l5-20020a170902f68500b0019cd49f4296mr45244363plg.67.1678794032284; 
 Tue, 14 Mar 2023 04:40:32 -0700 (PDT)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 ju17-20020a170903429100b0019cbd37a335sm1580589plb.93.2023.03.14.04.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 04:40:31 -0700 (PDT)
Date: Tue, 14 Mar 2023 19:40:21 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 2/2] drm/panel: Add driver for Novatek NT36523
Message-ID: <ZBBdJcvR6I6HZ4MS@Gentoo>
References: <20230311123231.20771-1-lujianhua000@gmail.com>
 <20230311123231.20771-2-lujianhua000@gmail.com>
 <904bc493-7160-32fd-9709-1dcb978ddbab@linaro.org>
 <ZAx4KqXw+an555d4@Gentoo>
 <6c02557d-372d-05b1-2998-7c2cde99fac7@linaro.org>
 <ZA9xKlScy9/LS753@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZA9xKlScy9/LS753@ravnborg.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 07:53:30PM +0100, Sam Ravnborg wrote:
> On Mon, Mar 13, 2023 at 09:06:50AM +0100, Neil Armstrong wrote:
> > On 11/03/2023 13:46, Jianhua Lu wrote:
> > > On Sat, Mar 11, 2023 at 01:38:52PM +0100, Konrad Dybcio wrote:
> > > > 
> > > > 
> > > > On 11.03.2023 13:32, Jianhua Lu wrote:
> > > > > Add a driver for panels using the Novatek NT36523 display driver IC.
> > > > > 
> > > > > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> > > > > ---
> > > > [...]
> > > > 
> > > > > +
> > > > > +static int nt36523_get_modes(struct drm_panel *panel,
> > > > > +			       struct drm_connector *connector)
> > > > > +{
> > > > > +	struct panel_info *pinfo = to_panel_info(panel);
> > > > > +	int i;
> > > > > +
> > > > > +	for (i = 0; i < pinfo->desc->num_modes; i++) {
> > > > > +		const struct drm_display_mode *m = &pinfo->desc->modes[i];
> > > > > +		struct drm_display_mode *mode;
> > > > > +
> > > > > +		mode = drm_mode_duplicate(connector->dev, m);
> > > > > +		if (!mode) {
> > > > > +			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> > > > > +				m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> > > > > +			return -ENOMEM;
> > > > > +		}
> > > > > +
> > > > > +		mode->type = DRM_MODE_TYPE_DRIVER;
> > > > > +		if (pinfo->desc->num_modes == 1)
> > > > > +			mode->type |= DRM_MODE_TYPE_PREFERRED;
> > > > That's not quite correct, as that means "if you have more than one
> > > > defined panel mode (say 60Hz and 120 Hz), there will be no preferred one".
> > > This piece of code I see in the other panels, so I'm not sure if it is
> > > correct.
> Jianhua is correct that the same code exists in several places,
> and from a quick browse I consider all the cases bogus.
> 
> It would be fine if someone volunteered to fix all the panels so we
> avoid this bug to creep into more panel drivers.
I'm glad to send a patch to fix it soon.
> 
> 	Sam

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5132A6B5BF3
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 13:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8017910E151;
	Sat, 11 Mar 2023 12:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF88010E151
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 12:46:44 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id kb15so7811675pjb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 04:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678538804;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PiDlhCUlmtsAUlNB/6Hdf1VqUL1kVXdoYe/ZcJRmo8g=;
 b=L29b30GM+PAIArnzy8MiBHUAhLLMIwJ6FaLT2B40jsyiZd6YQpgMIk6RbKIRodiLS0
 DI74H/tldWjA1VL1LebhtTSL+VSPM1n20fzdtCXmZTuB/rg9PkxZuF3rjolw/Nwe1X+4
 QoXLLkmbG6gFXkr7kOQf5h4vMo4KXhmLv/0aK/2igbhHmUPshaV0v7dm7ntmaHV6RwMf
 fyUx0TcFBKUWZH7Pw8KzmZX27qdaFgxswsNGfWuJv6QOb9tnXtLpKIxgB2nCs+JLbCF3
 mIJFXAOrhXzg4FVaGysAsyRmmFxPv7f1E6RzWh4o5Dol/cIebPPa0bSyunUGu9j5+o34
 gVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678538804;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PiDlhCUlmtsAUlNB/6Hdf1VqUL1kVXdoYe/ZcJRmo8g=;
 b=bdxcxwbnUsKKvWXK2OjudYcpVgjsGGeGpj2a2GBYsEixmWNk5pAONnl8uEJvR2C5CI
 gGsVVQaIem1QGgyHh/MX2J072zcqOteUbmdo2FGCtjy3Lu2ICSyV6wXvFM2M3OLcnGmN
 2SkZwBCdEfVwTa/TPr/OA5ercTuVXP0VLFZ57b+eDYGneoES2djRJarYfoyp5nx3T0YI
 BSI/05HSsAFP7hc9vVeIJPi794t9S8ol/Fp7aKcxlF3jfDE7e0V1WTZl7dB4NcYHLOqs
 8GC5kXa/c1yFFKbUQksz+SDU2NkdXnA0fAvsqPnaYY02FSpIEc8ST5yPbHaszxhLU306
 Hssw==
X-Gm-Message-State: AO0yUKVO4RjhFHRf5hTkImJ/fSQY5uj98pCNadjpIHFSUL2MeB5vKikh
 QxltFseXpXZDhMMyyVceAuo=
X-Google-Smtp-Source: AK7set+ji+ZQM1Aev0DE5omV9PnlNe+xd7MwKZKFp/q3X5YjO6ktRlb56PKrc6iC5jTqwI4bioWJTw==
X-Received: by 2002:a17:903:2290:b0:19e:25b4:7740 with SMTP id
 b16-20020a170903229000b0019e25b47740mr35095390plh.28.1678538804128; 
 Sat, 11 Mar 2023 04:46:44 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 kr13-20020a170903080d00b0019e9eb439d6sm1510200plb.164.2023.03.11.04.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 04:46:43 -0800 (PST)
Date: Sat, 11 Mar 2023 20:46:34 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v5 2/2] drm/panel: Add driver for Novatek NT36523
Message-ID: <ZAx4KqXw+an555d4@Gentoo>
References: <20230311123231.20771-1-lujianhua000@gmail.com>
 <20230311123231.20771-2-lujianhua000@gmail.com>
 <904bc493-7160-32fd-9709-1dcb978ddbab@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <904bc493-7160-32fd-9709-1dcb978ddbab@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 11, 2023 at 01:38:52PM +0100, Konrad Dybcio wrote:
> 
> 
> On 11.03.2023 13:32, Jianhua Lu wrote:
> > Add a driver for panels using the Novatek NT36523 display driver IC.
> > 
> > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> > ---
> [...]
> 
> > +
> > +static int nt36523_get_modes(struct drm_panel *panel,
> > +			       struct drm_connector *connector)
> > +{
> > +	struct panel_info *pinfo = to_panel_info(panel);
> > +	int i;
> > +
> > +	for (i = 0; i < pinfo->desc->num_modes; i++) {
> > +		const struct drm_display_mode *m = &pinfo->desc->modes[i];
> > +		struct drm_display_mode *mode;
> > +
> > +		mode = drm_mode_duplicate(connector->dev, m);
> > +		if (!mode) {
> > +			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> > +				m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> > +			return -ENOMEM;
> > +		}
> > +
> > +		mode->type = DRM_MODE_TYPE_DRIVER;
> > +		if (pinfo->desc->num_modes == 1)
> > +			mode->type |= DRM_MODE_TYPE_PREFERRED;
> That's not quite correct, as that means "if you have more than one
> defined panel mode (say 60Hz and 120 Hz), there will be no preferred one".
This piece of code I see in the other panels, so I'm not sure if it is
correct. Should
if (pinfo->desc->num_modes > 1)
			mode->type |= DRM_MODE_TYPE_PREFERRED;
is correct?
> 
> Konrad
> > 

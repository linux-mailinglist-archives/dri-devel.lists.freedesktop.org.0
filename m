Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE54A6B8132
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 19:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E5710E128;
	Mon, 13 Mar 2023 18:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CECA10E128
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 18:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=MgrV3LilewuhqmbVjO8RxzUTtaR1+vbnicMyPFFpwAM=;
 b=vYP0maXsWtgajTiEfra2Tg51b+hBuX1vK9N4+SgVi7WGqRs5pR0lsFVXhISV6Tmw3E9cWr5BHiw75
 WyNa3VPCN7/o1iW+N8xjpnBAa/Nl3sChif8zRqdddijLc2TkJfVxfrhoDuKD5PM8GsMlGxFTgzanpu
 vi/yEDuFbHolP+J0hY5szMfqnc+MZeFGtbwDGFx62V62HtJ6o0+YB4GU0wG57m9QjN900vdStfJUWM
 pH8R8g1INiS5k70ZqmsaN5vZnQnwU5dgZEQh/1UtOV3/kOsshToposSzQYOijsvGH8uBsA4wmiwILk
 NRjqZI+LlS1kRtF7n+5HoLSV8JqrMWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=MgrV3LilewuhqmbVjO8RxzUTtaR1+vbnicMyPFFpwAM=;
 b=MlV8G0UHvhx3766kkcTJrCusIOBh66LFtAdDHT8vshgOmK1DVRVyF5Pm9tsdUZ4F/D4Xqyfin3YmI
 VelkWMiAQ==
X-HalOne-ID: 5882c668-c1d0-11ed-90a3-3df7d73157c4
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id 5882c668-c1d0-11ed-90a3-3df7d73157c4;
 Mon, 13 Mar 2023 18:53:31 +0000 (UTC)
Date: Mon, 13 Mar 2023 19:53:30 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/2] drm/panel: Add driver for Novatek NT36523
Message-ID: <ZA9xKlScy9/LS753@ravnborg.org>
References: <20230311123231.20771-1-lujianhua000@gmail.com>
 <20230311123231.20771-2-lujianhua000@gmail.com>
 <904bc493-7160-32fd-9709-1dcb978ddbab@linaro.org>
 <ZAx4KqXw+an555d4@Gentoo>
 <6c02557d-372d-05b1-2998-7c2cde99fac7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c02557d-372d-05b1-2998-7c2cde99fac7@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Jianhua Lu <lujianhua000@gmail.com>,
 dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 09:06:50AM +0100, Neil Armstrong wrote:
> On 11/03/2023 13:46, Jianhua Lu wrote:
> > On Sat, Mar 11, 2023 at 01:38:52PM +0100, Konrad Dybcio wrote:
> > > 
> > > 
> > > On 11.03.2023 13:32, Jianhua Lu wrote:
> > > > Add a driver for panels using the Novatek NT36523 display driver IC.
> > > > 
> > > > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> > > > ---
> > > [...]
> > > 
> > > > +
> > > > +static int nt36523_get_modes(struct drm_panel *panel,
> > > > +			       struct drm_connector *connector)
> > > > +{
> > > > +	struct panel_info *pinfo = to_panel_info(panel);
> > > > +	int i;
> > > > +
> > > > +	for (i = 0; i < pinfo->desc->num_modes; i++) {
> > > > +		const struct drm_display_mode *m = &pinfo->desc->modes[i];
> > > > +		struct drm_display_mode *mode;
> > > > +
> > > > +		mode = drm_mode_duplicate(connector->dev, m);
> > > > +		if (!mode) {
> > > > +			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> > > > +				m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> > > > +			return -ENOMEM;
> > > > +		}
> > > > +
> > > > +		mode->type = DRM_MODE_TYPE_DRIVER;
> > > > +		if (pinfo->desc->num_modes == 1)
> > > > +			mode->type |= DRM_MODE_TYPE_PREFERRED;
> > > That's not quite correct, as that means "if you have more than one
> > > defined panel mode (say 60Hz and 120 Hz), there will be no preferred one".
> > This piece of code I see in the other panels, so I'm not sure if it is
> > correct.
Jianhua is correct that the same code exists in several places,
and from a quick browse I consider all the cases bogus.

It would be fine if someone volunteered to fix all the panels so we
avoid this bug to creep into more panel drivers.

	Sam

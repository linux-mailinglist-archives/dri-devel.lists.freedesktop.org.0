Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34656B3A9C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 10:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EF010E9B3;
	Fri, 10 Mar 2023 09:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D75210E9B3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 09:33:36 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id p6so4997674plf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 01:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678440816;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sAFEXOe7wgsyLbBLPoY5abX+Iy4JMH27UPzyBAnZiOs=;
 b=algmRXAmw/PTACbZXDj+h5hzSPXyXWmQ5V72lVynjL3emQQs6L1JcbtUpqKC/oD0qV
 +Z2fugA9+G/J2FOxB+faEcy+HDAdOC1b8vNiA9JyuPz1NJM02byxh7+TKGV3r/SRvFBx
 cmSPF1w3TZdiCJqglUnVbyMpBjHFI1ycxacbs4bkLIFUXBNiFZHAmTWGqkzxIm/ubdby
 vskqkfbquFIGeFuW+jDwgnBlPkWWN67lENx592waOxVmAtZWuJVmdNNgbAif8suLATOc
 MSEpQhJvXArDhj5l0TAHfUQppuh7X4IY6IO/HizZQushmhNNrmcv+6aba2RmvlHhcnm3
 7G4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678440816;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sAFEXOe7wgsyLbBLPoY5abX+Iy4JMH27UPzyBAnZiOs=;
 b=FhSB5hsUWgqnA7DFHHE/eMANZ1k2crGmRxvvpcya7wOEwZzPJPDq6ZzJ0xIM1bCVie
 iMUqpHlhHGl33SVURsnezQvTmFo95kS+93ieqQty0MZUg/NLGobIjLe/RzSetFz+9vR7
 Yb3hcoy2LEYUdGubwZaVVYlfIhXakfKpGGuNacapsQzctYn3VWcJrf4tZ9JH46oVJ8GO
 GyYw+RPIxpMi91iHU0+d1hDIR6592YRCVGTdvXkonV0KH7bYPQGsiAxxDhmZgMMQ6mgm
 4swCSx36j4DvaRRizMQgbituVOE7KWKyRcBYy/6uRIwCO2YzfIYuT/FHJGKD5X60xwnX
 K/5Q==
X-Gm-Message-State: AO0yUKWphyPOTQbtazBtqX/e/58CNDmspTAC5Qb4Dvu78g5A59ZxhKnv
 k6ZS5qttIZ3yJ+4R+Vit1Os=
X-Google-Smtp-Source: AK7set+wVmUJflBiERXkVgtH8PJDpvz6KI8ttDs/c84M6LdycwYb06z/rwzgOHJOF+hekfz0ogXRdg==
X-Received: by 2002:a05:6a20:bc97:b0:cc:ce95:7dcb with SMTP id
 fx23-20020a056a20bc9700b000ccce957dcbmr20997681pzb.13.1678440816140; 
 Fri, 10 Mar 2023 01:33:36 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a63e443000000b00478ca052819sm916856pgk.47.2023.03.10.01.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 01:33:35 -0800 (PST)
Date: Fri, 10 Mar 2023 17:33:28 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v3 2/2] drm/panel: Add driver for Novatek NT36523
Message-ID: <ZAr5aO0BpSeW5iXD@Gentoo>
References: <20230308043706.16318-1-lujianhua000@gmail.com>
 <20230308043706.16318-2-lujianhua000@gmail.com>
 <66d293a8-f850-cb80-0c83-2ebf7e29d0c2@linaro.org>
 <ZAh3MSpQ30YyPAVe@Gentoo>
 <1cbe9e29-13a4-574e-6d8c-b2506e7a36b3@linaro.org>
 <ZAiPTat/kmLyaJmA@Gentoo>
 <aac6ba9c-4230-aff7-c93d-23eaf6895464@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aac6ba9c-4230-aff7-c93d-23eaf6895464@linaro.org>
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

On Thu, Mar 09, 2023 at 11:37:17PM +0100, Konrad Dybcio wrote:
> 
> [...]
> = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
> >>>>> +		if (!dsi1) {
> >>>>> +			dev_err(dev, "cannot get secondary DSI node.\n");
> >>>>> +			return -ENODEV;
> >>>>> +		}
> >>>>> +
> >>>>> +		dsi1_host = of_find_mipi_dsi_host_by_node(dsi1);
> >>>>> +		of_node_put(dsi1);
> >>>> Shouldn't you put the reference only if it's found?
> >>> thanks for spot it.
> Apparently not.. please don't change this
OK
> 
> Konrad
> >>>>
> >>>>> +		if (!dsi1_host) {
> >>>>> +			dev_err(dev, "cannot get secondary DSI host\n");
> >>>>> +			return -EPROBE_DEFER;
> >>>> dev_err_probe, here and in neighbouring exit return paths?
> >>> Acked.
> >>>>
> >>>>
> >>>> Konrad

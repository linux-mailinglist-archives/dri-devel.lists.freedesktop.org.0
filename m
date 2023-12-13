Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A374811B8D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 18:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1C610E7F0;
	Wed, 13 Dec 2023 17:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD3210E7F0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 17:53:33 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-590bb31ccf5so3119565eaf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 09:53:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702490012; x=1703094812;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FqqY6lSB+RFit+gJ+Ct64NvIN16qb9HYYOP9L5yB65g=;
 b=XfIkhfluwptxexpcX+ineu1cR5JqZ/l0w/fReUJWE4/7wf1rCqNEpyMvKIQHT03ZLW
 OQkN7sVJslNEpDYDVh6xtfW482S0f2Pfsk4tTfcKCG6TPCagwC1KRItw/YXjPOcjgkK4
 8M1hgE2Zfvwp0p+u1o7EH5SljG9RG2fAW7SIoDfAFMcEC7XH6py5e71ZP03dd0RuXJUe
 57+Q1qHOLWfvk/IQhTjf7rIGozWcxUCasESj+5OQODpoSb2waUxHtSGpVk3qM5S8gOwn
 xhMVGk0HiIjv3b+ySvHc0/SnIR6nCIALBRKpoMB4q7MYEqUJys/qhajOwCYHlAjBXu/3
 rdTg==
X-Gm-Message-State: AOJu0YzPo0TAykocpb9b7mMYD08I4oCNORGLLyx/KgQCY1s0E8xNExAu
 7KpdopP67Qwbp8hz252qAQ==
X-Google-Smtp-Source: AGHT+IGGnK4qpiuPojyap8RSF0CD8y3a4ePwM9/4ReTh5wQmPg8Bwi+PLX+Jg8DxKI3K2cYH/jaXZA==
X-Received: by 2002:a05:6820:1ac9:b0:590:7b3d:dbcc with SMTP id
 bu9-20020a0568201ac900b005907b3ddbccmr7238000oob.6.1702490012455; 
 Wed, 13 Dec 2023 09:53:32 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f203-20020a4a58d4000000b0059057416278sm3149398oob.6.2023.12.13.09.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 09:53:31 -0800 (PST)
Received: (nullmailer pid 1588079 invoked by uid 1000);
 Wed, 13 Dec 2023 17:53:30 -0000
Date: Wed, 13 Dec 2023 11:53:30 -0600
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH v6 0/4] Add displays support for bsh-smm-s2/pro boards
Message-ID: <20231213175330.GA1582432-robh@kernel.org>
References: <20231213140437.2769508-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213140437.2769508-1-dario.binacchi@amarulasolutions.com>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, michael@amarulasolutions.com,
 Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 13, 2023 at 03:03:41PM +0100, Dario Binacchi wrote:
> The series adds drivers for the displays used by bsh-smm-s2/pro boards.
> This required applying some patches to the samsung-dsim driver.
> 
> Changes in v6:
> - Drop patches:
>   - [06/10] drm/panel: Add Synaptics R63353 panel driver

The binding should have gone with this. I'll apply it then.

Rob

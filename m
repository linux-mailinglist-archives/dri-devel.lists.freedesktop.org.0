Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF1DCDEBE2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 14:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5814E10F37D;
	Fri, 26 Dec 2025 13:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C5110F37D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 13:48:26 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id EC3543EA72;
 Fri, 26 Dec 2025 14:48:23 +0100 (CET)
Date: Fri, 26 Dec 2025 14:48:22 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 04/11] dt-bindings: display: panel: Describe Samsung
 SOFEF01-M DDIC
Message-ID: <aU6QxjOphoq9E1pL@SoMainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-4-82a87465d163@somainline.org>
 <CAD++jLmSev3=HJF1j_kTU5j-u2NhxH6TsdE0uUjnD7Vqkt_h-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmSev3=HJF1j_kTU5j-u2NhxH6TsdE0uUjnD7Vqkt_h-w@mail.gmail.com>
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

On 2025-12-26 14:25:04, Linus Walleij wrote:
> Hi Marijn,
> 
> thanks for your patch!
> 
> On Mon, Dec 22, 2025 at 12:32 AM Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> 
> > Document the Samsung SOFEF01-M Display-Driver-IC and 1080x2520@60Hz
> > command-mode DSI panels found in many Sony phones:
> > - Sony Xperia 5 (kumano bahamut): amb609tc01
> > - Sony Xperia 10 II (seine pdx201): ams597ut01
> > - Sony Xperia 10 III (lena pdx213): ams597ut04
> > - Sony Xperia 10 IV (murray pdx225): ams597ut05
> > - Sony Xperia 10 V (zambezi pdx235): ams605dk01
> > - Sony Xperia 10 VI (columbia pdx246): ams605dk01
> >
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> (...)
> > +      - samsung,sofef01-m-amb609tc01 # 6.1"
> > +      - samsung,sofef01-m-ams597ut01 # 6.0"
> > +      - samsung,sofef01-m-ams597ut04 # 6.0"
> > +      - samsung,sofef01-m-ams597ut05 # 6.0"
> > +      - samsung,sofef01-m-ams605dk01 # 6.1"
> 
> So is the assembled product really named like that?
> 
> Samsung S0FEF01-M AMS605DK01?
> 
> I would more expect the compatible strings to be excluding the DDIC
> name, like:
> 
> samsung,ams605dk01
> 
> ...but it's not like the vendor is helping us here, so I'm practically
> fine either way.

Unfortunately I'm not that familiar with display manufacturers and panel
assemblies.  Most of the what I presume to be panel names were gleaned from
online screen replacement photos; those don't ever include the DDIC name.  Those
mostly come from the DTS though isn't mentioned exactly for every phone (only
the first two in the DTS name).

> They are clearly using the S0FEF01-M display controller.

So you're implying or certain that these panel names here are always bundled
with exactly the same controller (making the SOFEF01 part "redundant" in the
compatible)?

Also, divergence of the driver commands got significant with the last two panels
/ three phones, though that might be down to vendor configuration/calibration.

- Marijn

> Yours,
> Linus Walleij

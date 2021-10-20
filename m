Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A54C4353DD
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 21:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B2C6E372;
	Wed, 20 Oct 2021 19:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F2B6E342
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 19:34:10 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id o24so13308965wms.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 12:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NvPAjwt7fyzI4iyzhah+QCTodceAQRPvH3A75BnZsTo=;
 b=g9C4Q+FGe3RhcO39LAR/2C5riQT1MS5idA1Uc0WW9dHdFwfMJt+c8S5Pv0riiYuF0v
 oF4yMSjmw/c9rRlFKJHX4k7cDyVCYhbux98pyMOlpt4NGGGmRk3uXPr2IWDXEG1mDXQ1
 Nmj/f1MCO+cIPu0+w/5TYk8pYgncEcnXaSllD4fhgIKkr2JHPVyVCRStqNanIfizGFnS
 J8Rpis0dSyVJm3XykDBu6PJFasTpxI/TW7uS9OWvvR2J69YLuVLA29Y0AGHU1Ub4j4eM
 hPZ21LJ90PznprSNpDxa0atqZV/ZYPfMu715MFGAH8X8v1GnnneYd/6BRQMB6iwsPyQN
 HgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NvPAjwt7fyzI4iyzhah+QCTodceAQRPvH3A75BnZsTo=;
 b=emdP+zVzvuOMq6vEq89sA5Xk1a/akwpSjCQ3PqpCVkYkDqdsjGzTc+APrY7fJYi3D5
 x9ee7x2QnCvFLLg1lTcg+Q6kV2HKiZ6mSta62HTnVIudOFUzGMbsnKOtUIS68+MogYi/
 4kyyZo/RcitG/iefC+IgTC/Bj/5GG495kk/0zJtua9jHKFRVwRS//T4663sNIgYKdA6e
 ebSI2srH2hYixDKlKFpodzW7HkppHVcwmPZRTup7eMgPSb080YAn6iMP2L3epjbFY/Kk
 Qu+gKYyfGo3EQm6fKL62+8g60ONURgUVO5CGHCD1UtTDe1IIE0hXZ8HRqh4uzT9D8ZRe
 zzJQ==
X-Gm-Message-State: AOAM532s/A6OZhU0mTT5SodxSk4tY2etE9Dkc761ykR+el8QKWqFdLxi
 mj0/1iqG1lGs2SyxlaIIygR1Dw==
X-Google-Smtp-Source: ABdhPJxhXGVW++4V0sz2hvab4LJBAF8DPOIn0OjMGV74GJEYevwnJeXR6UCwTqgf0uxJqVNxHNIGWw==
X-Received: by 2002:a05:600c:2905:: with SMTP id
 i5mr1313497wmd.159.1634758448562; 
 Wed, 20 Oct 2021 12:34:08 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900:5142:5fbb:5821:5dc3])
 by smtp.gmail.com with ESMTPSA id t1sm3655328wre.32.2021.10.20.12.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 12:34:08 -0700 (PDT)
Date: Wed, 20 Oct 2021 21:34:07 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: mediatek, dp: Add Display Port binding
Message-ID: <20211020193407.meektqms4psltg34@blmsp>
References: <20211011094624.3416029-1-msp@baylibre.com>
 <20211011094624.3416029-3-msp@baylibre.com>
 <YWTaJOXGgF2bHznv@robh.at.kernel.org>
 <20211018141908.fuevv2m66fw3xg36@blmsp>
 <CAL_Jsq+QwEPNEztD+yg-UO8gWf_X=E-n0_HMYJsGxteZAZparg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+QwEPNEztD+yg-UO8gWf_X=E-n0_HMYJsGxteZAZparg@mail.gmail.com>
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

Hi Rob,

On Mon, Oct 18, 2021 at 02:38:33PM -0500, Rob Herring wrote:
> On Mon, Oct 18, 2021 at 9:19 AM Markus Schneider-Pargmann
> <msp@baylibre.com> wrote:
> >
> > Hi Rob,
> >
> > On Mon, Oct 11, 2021 at 07:43:16PM -0500, Rob Herring wrote:
> > > On Mon, Oct 11, 2021 at 11:46:19AM +0200, Markus Schneider-Pargmann wrote:
> > > > This controller is present on several mediatek hardware. Currently
> > > > mt8195 and mt8395 have this controller without a functional difference,
> > > > so only one compatible field is added.
> > > >
> > > > The controller can have two forms, as a normal display port and as an
> > > > embedded display port.
> > > >
> > > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > > ---
> > > >  .../display/mediatek/mediatek,dp.yaml         | 89 +++++++++++++++++++
> > > >  1 file changed, 89 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > > > new file mode 100644
> > > > index 000000000000..f7a35962c23b
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > > > @@ -0,0 +1,89 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Mediatek Display Port Controller
> > > > +
> > > > +maintainers:
> > > > +  - CK Hu <ck.hu@mediatek.com>
> > > > +  - Jitao shi <jitao.shi@mediatek.com>
> > > > +
> > > > +description: |
> > > > +  Device tree bindings for the Mediatek (embedded) Display Port controller
> > > > +  present on some Mediatek SoCs.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - mediatek,mt8195-edp_tx
> > > > +      - mediatek,mt8195-dp_tx
> > >
> > > Are these blocks different?
> >
> > Good point, the registers of these blocks are described in its own
> > chapter each. Also I do need to distinguish between both in the driver.
> > Would you suggest making this distinction differently or keep it as two
> > compatibles?
> 
> If the registers are all the same, then it should be the same
> compatible. If you still need to distinguish, then you should have a
> panel or connector node that will let you do that.

Thank you. Good idea to check with the connector node, I have changed it
as you suggested.

> 
> Also, s/_/-/ in the compatible string.

Done.

Thanks,
Markus

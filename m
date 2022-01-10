Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AE7489E5D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 18:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6BC11299F;
	Mon, 10 Jan 2022 17:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B92B11299F;
 Mon, 10 Jan 2022 17:28:49 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id w200so4339250oiw.3;
 Mon, 10 Jan 2022 09:28:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZsxrSJKAlL12zoGr617hjEfztTw9El7OEQAesnFjPV8=;
 b=NIRaBnAcy0KoletFoCXDA18XzrO9XWzVndyhMdcj2b7aBpr25okFhd1OPbIcOvpSYd
 It5y7iZIwxALh+XCc2tx27PnOe96SHZ9WBUgEsHkNV02TgNDhgkP7d5pwc6FvvdO5r/A
 VSvzO1mFNLfXoA22W/knsdmmkuGiTK5CFvDAnBnYecEtTKM+3R262cMxDqBIQpXft0oh
 GFnUIOU0U+DGNXVSubrRT8vaQc175qslzYARHc4QIhGJqcYaDR8y3Mcuwm/YOSSfGbEZ
 ACh2rGRX4Fs+bmkZlfF9bI6EAIN1ECOO1eUO65GtHBO0E7NgyHgT9+sCUguWnAEKER0J
 YvvQ==
X-Gm-Message-State: AOAM530ZZoyARxDOx7+JNvYC0SY9okhEv8FqBCqOBNJqaOew06GFJRZ5
 /sjKTE4inR73CGX6MZbEpw==
X-Google-Smtp-Source: ABdhPJzUnBjoClx0LWUB/b4sUdkJ3H7i9huwtIYYvV+Ne/HFhaTqEu0dY9davPLBP0VtCD2hQZWX/w==
X-Received: by 2002:a05:6808:228e:: with SMTP id
 bo14mr8728255oib.55.1641835729226; 
 Mon, 10 Jan 2022 09:28:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n19sm1573634otq.11.2022.01.10.09.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 09:28:48 -0800 (PST)
Received: (nullmailer pid 1122976 invoked by uid 1000);
 Mon, 10 Jan 2022 17:28:47 -0000
Date: Mon, 10 Jan 2022 11:28:47 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [v2 1/3] dt-bindings: msm/dsi: Add 10nm dsi phy tuning properties
Message-ID: <Ydxsz+XSreBKFNcr@robh.at.kernel.org>
References: <1641819337-17037-1-git-send-email-quic_rajeevny@quicinc.com>
 <1641819337-17037-2-git-send-email-quic_rajeevny@quicinc.com>
 <CAA8EJprrRZK+ocW9zDY_eyeo_m_xbu+KmfWf8QmTYscAh5SxLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJprrRZK+ocW9zDY_eyeo_m_xbu+KmfWf8QmTYscAh5SxLw@mail.gmail.com>
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, quic_kalyant@quicinc.com,
 jonathan@marek.ca, airlied@linux.ie, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, quic_mkrishn@quicinc.com,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 10, 2022 at 05:06:03PM +0300, Dmitry Baryshkov wrote:
> On Mon, 10 Jan 2022 at 15:56, Rajeev Nandan <quic_rajeevny@quicinc.com> wrote:
> >
> > In most cases, the default values of DSI PHY tuning registers should be
> > sufficient as they are fully optimized. However, in some cases where
> > extreme board parasitics cause the eye shape to degrade, the override
> > bits can be used to improve the signal quality.
> >
> > The general guidelines for DSI PHY tuning include:
> > - High and moderate data rates may benefit from the drive strength and
> >   drive level tuning.
> > - Drive strength tuning will affect the output impedance and may be used
> >   for matching optimization.
> > - Drive level tuning will affect the output levels without affecting the
> >   impedance.
> >
> > The clock and data lanes have a calibration circuitry feature. The drive
> > strength tuning can be done by adjusting rescode offset for hstop/hsbot,
> > and the drive level tuning can be done by adjusting the LDO output level
> > for the HSTX drive.
> >
> > Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
> > ---
> >
> > Changes in v2:
> >  - More details in the commit text (Stephen Boyd)
> >  - Use human understandable values (Stephen Boyd, Dmitry Baryshkov)
> >  - Do not take values that are going to be unused (Dmitry Baryshkov)
> >
> >  .../bindings/display/msm/dsi-phy-10nm.yaml         | 33 ++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> > index 4399715..d0eb8f6 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> > @@ -35,6 +35,35 @@ properties:
> >        Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target and
> >        connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target
> 
> Generic note:
> I think these properties should be prefixed with "qcom," prefix.
> 
> >
> > +  phy-rescode-offset-top:
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    minItems: 5
> > +    maxItems: 5
> > +    description:
> > +      Integer array of offset for pull-up legs rescode for all five lanes.
> > +      To offset the drive strength from the calibrated value in an increasing
> > +      or decreasing manner, use 6 bit two’s complement values.
> 
> dtc should support negative values, google hints that <(-2)> should work.

Yes, but the schema checks don't check negative values correctly yet. So 
you can use 'int8-array', but just don't use negative values in the 
examples. I'm working on changes that will fix this issue.

What does 6-bit mean? 0x3f is negative? Just sign extend the values and 
specify the valid range instead:

minimum: -32
maximum: 31

Rob

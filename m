Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E55481CB5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 15:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61A810E4A3;
	Thu, 30 Dec 2021 14:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D5B10E4A2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 14:01:02 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id kj16so22145395qvb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 06:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DARIRUyKixjDrkgi6thwAX0I/tkeXzUp7pYBAMvHcik=;
 b=o+4Ko9dlc80surFGX5vVwGzb5c0ETDQSkrNniT1RhUajJtbke5ejdnEQdrpYRC2aih
 VWkRLiWRv9geVnd/zJTopRXySrnbVMRrlTYvdgaZH7t93PLF9Rbx8xtjaTfjXv594UbL
 b7zNCmyRS0OzMiCVTL/0r03bd4toCRyvgXvdOerFJretUUJkg9UeZ7ET5Wn4xVrrtdOI
 pLYqPJEgU8XsxsfOB+Mra2infcJhM/cQY8/pJKqp6FbSq7IMjsVA8SkY6/zkDzJATRKo
 9OdzEvSbw9TO/yiYrJ9PI8ogruGMkPYuCnmejWNy299fPZQSylEnBcAg0jQWZo3jeI92
 xIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DARIRUyKixjDrkgi6thwAX0I/tkeXzUp7pYBAMvHcik=;
 b=QOh2+BDpMMAyhMyec6RLkKPexY/Qlk3UP97UJ+JHXP9QdaKxpIT7GiHjrkV67M4lD6
 VA1Z476qkN+8t0TFLBch/+W0ld6pvZIugqWdmw20g6OwccNRRArjcw8J/I3N6sj1NeHn
 R1tQ65wDiegzhhl4mSZSM7X8tOWFii6xlmMzDf2Zo7jcHylhEch1uxv9SepbeJU61Yfw
 mFzpWieP9xUJceZSOz/vX7WmggzPeXBxUUqdYkckg+n/T3p52m8rCRPQm6EBVgmGU6RJ
 iobysHu1Pt9RzH28HhckuX4tbnY81olbqi3k3Ufo5h2WLVUsjM3BR2k1vv0riFMYzj5U
 1cIQ==
X-Gm-Message-State: AOAM530OWgwhDRyTi3KoMfusd4zAvYVcv2CtD3jNwQdazBXZUf7Q0L2R
 Gq7KyYuOzGjlONopUGNYft55AGnnnz+r9MMsZgo1nQ==
X-Google-Smtp-Source: ABdhPJzI5hJNYB9BiClkHNkpWJpsy0r+CCHtNuPM3lBUlcbQsrm/hksxpm6NB1KIf4ASty1FzjWa3Th+WWHhWw7Y8XA=
X-Received: by 2002:a05:6214:260b:: with SMTP id
 gu11mr27691426qvb.55.1640872860787; 
 Thu, 30 Dec 2021 06:01:00 -0800 (PST)
MIME-Version: 1.0
References: <1640856276-14697-1-git-send-email-quic_rajeevny@quicinc.com>
 <1640856276-14697-2-git-send-email-quic_rajeevny@quicinc.com>
In-Reply-To: <1640856276-14697-2-git-send-email-quic_rajeevny@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Dec 2021 17:00:49 +0300
Message-ID: <CAA8EJpptEvS6Y+MEX=VxmUSf1=GAp_oV5PWCCGUzMYP13_QsRg@mail.gmail.com>
Subject: Re: [v1 1/2] dt-bindings: msm/dsi: Add 10nm dsi phy tuning properties
To: Rajeev Nandan <quic_rajeevny@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: quic_kalyant@quicinc.com, freedreno@lists.freedesktop.org,
 jonathan@marek.ca, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com, robh+dt@kernel.org,
 quic_mkrishn@quicinc.com, swboyd@chromium.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Dec 2021 at 12:25, Rajeev Nandan <quic_rajeevny@quicinc.com> wrote:
>
> Add 10nm dsi phy tuning properties for phy drive strength and
> phy drive level adjustemnt.
>
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-10nm.yaml | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> index 4399715..9406982 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> @@ -35,6 +35,18 @@ properties:
>        Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target and
>        connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target
>
> +  phy-drive-strength-cfg:
> +    type: array
> +    description:
> +      Register values of DSIPHY_RESCODE_OFFSET_TOP and DSIPHY_RESCODE_OFFSET_BOT
> +      for all five lanes to adjust the phy drive strength.
> +
> +  phy-drive-level-cfg:
> +    type: array
> +    description:
> +      Register values of DSIPHY_RESCODE_OFFSET_TOP for all five lanes to adjust
> +      phy drive level/amplitude.


Description is incorrect, it's not the RESCODE_OFFSET_TOP register.

> +
>  required:
>    - compatible
>    - reg
> @@ -64,5 +76,12 @@ examples:
>           clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>                    <&rpmhcc RPMH_CXO_CLK>;
>           clock-names = "iface", "ref";
> +
> +         phy-drive-strength-cfg = [00 00
> +                                   00 00
> +                                   00 00
> +                                   00 00
> +                                   00 00];
> +         phy-drive-level-cfg = [59 59 59 59 59];

You are writing this value into the PHY_CMN_VREG_CTRL register. So
specifying 5 values here does not make sense.

>       };
>  ...
> --
> 2.7.4
>


-- 
With best wishes
Dmitry

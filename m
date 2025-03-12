Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CC9A5DB07
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 12:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9562510E76C;
	Wed, 12 Mar 2025 11:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I2+nvD8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B42C10E765;
 Wed, 12 Mar 2025 11:03:46 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ac2b10bea16so432955666b.0; 
 Wed, 12 Mar 2025 04:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741777425; x=1742382225; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zTeV+0I3vnNHKkFv3a7WhNa9KvVKcxl8h2avxfzw1dA=;
 b=I2+nvD8okKqR3tK2q95zX2vi5NJaiJmJaSTdcH6rE/dN9z+Iw3F1aEbl3jkv/CAXSW
 fVT5Eyz/hcJwtMsOjAaZIEX62QwZpfUiGac9LFPqpDFtrzbU7Caj+UjhoAf5C0ziv6Dj
 YuBT705hT3uuIxYMxAWvT31hpbLKMN8Eb9Cq7yVJvhdhvIIBWmkbmo2QO2ggwuVedVoW
 7RxJuYCX9sOzwcFm/YJWBT37ox/9ox5XnCC4OliZm31r5NAKAbpQRdwTjxXKhEsFax6L
 8OMXZjKS2+VBM3Kye8N3G8FIR9t3qjtm09oq4nia07CofdxplJBBF5EKSXYgs5FfjTne
 bK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741777425; x=1742382225;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zTeV+0I3vnNHKkFv3a7WhNa9KvVKcxl8h2avxfzw1dA=;
 b=alw6+C/2gOTtcz3OjQd6TYp+t2s8ypi4OlMRSwaOD+QipcCbqM7FThDQXxlaASW+wn
 TFYJsc3FAxv+jjEgz2wjyTD3jIsVZTolbht29z/nxSIOBRc6scQP5I6xLrbqLKyLPcia
 h1+9xVrcnG0zDMgGPgAZ+lSFqZ6K3LpUeZRxvSd4Zq7UZ+foFEBFhdl9v7muY5rIyKbF
 RHiSd1UT9+lJKNDdLmhPMYf6HHociN3lcr4/6YjTefNWZuoRtpoJ3TIqBev/n4Hh7v2x
 C0miaoGpivoXgvkRCH3FD0yrAXb52AKXPofoz6hz2SvAwWzgtLwoACYE5s3noS1/HDiD
 Glwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsuTvBVf8B2ujTXlsq6PELjtM0yWJN7y4oAktbSNWSgXS0DcH6PeSd37Mm+VYNJ5yCjlSGYi7yftA=@lists.freedesktop.org,
 AJvYcCWbyTq9ElnriIGVmo9zCuNAH7wju1JLkAV2HAn/ueeRDY6qUNr8WEMBnNHCejsiI3tjdAk1SsM3ZQzN@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwR2rXFlb4ng7rSoIXc/8cuKBtx4ibB9lgyl/Z7d6FqIU0URwuR
 hz/amD4X6KO77A6D2O/FZyjOK/8jie4+gsGvIjLCIe/00Bd8j1ECfpGQDkV6nifM218H0P6bpyK
 Fm9MrgdHdmPDDcSXpf8rIQn5LqPg=
X-Gm-Gg: ASbGncvxH5NC1xj+wH6Nv9INH9p5gN6t1FHHNaKuefBamEgLdoUICRVgONEifsSnh/2
 AIj8IFnTVPNCLiUw0u4IyWVXpg3rOQqw8lws8+8IrC/oCw+epHvrrls3HhwXn5EM3WWWy3nsiQV
 JObGE4vwUQXVFbcEALXh2qZCMCRquBRtMXyrGq/E7PwCVC2f2EGW6f4ecF4mn2QihLfXQ=
X-Google-Smtp-Source: AGHT+IFyHmRAQm91BYyBBXLOIkRea83M5cMTQa4BEO+uSdKcNofT32n0rJIAV2xBRKTdpv+ovpKL1xoJuhMVvzl4xgY=
X-Received: by 2002:a17:907:82a0:b0:ac2:b3b3:9f1c with SMTP id
 a640c23a62f3a-ac2b3b3a186mr1028408966b.10.1741777424265; Wed, 12 Mar 2025
 04:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-10-quic_amakhija@quicinc.com>
 <6gdd6p3ca6w2gb2nbl6ydw4j7y2j5eflelbwntpc6ljztjuwzt@dqwafrtod5m5>
 <da9f80e6-bb4e-4568-aa2c-d70383b12e3a@quicinc.com>
In-Reply-To: <da9f80e6-bb4e-4568-aa2c-d70383b12e3a@quicinc.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 12 Mar 2025 13:03:33 +0200
X-Gm-Features: AQ5f1JrVPD0uoisr8Y0JnYXx8B23G9S5C4qXGU3l30zo3ipSTDnyL45hL0sz214
Message-ID: <CALT56yP+UDF1YeotceqOevr_NTeGjDVw92NwtPDgRK6GvvkyHw@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] drm/bridge: anx7625: update bridge_ops and sink
 detect logic
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robdclark@gmail.com, 
 dmitry.baryshkov@linaro.org, sean@poorly.run, marijn.suijten@somainline.org, 
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, 
 quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Mar 2025 at 11:47, Ayushi Makhija <quic_amakhija@quicinc.com> wrote:
>
> On 3/11/2025 9:11 PM, Dmitry Baryshkov wrote:
> > On Tue, Mar 11, 2025 at 05:54:44PM +0530, Ayushi Makhija wrote:
> >> The anx7625_link_bridge() checks if a device is not a panel
> >> bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT to
> >> the bridge operations. However, on port 1 of the anx7625
> >> bridge, any device added is always treated as a panel
> >> bridge, preventing connector_detect function from being
> >> called. To resolve this, instead of just checking if it is a
> >> panel bridge, verify the type of panel bridge
> >> whether it is a DisplayPort or eDP panel. If the panel
> >> bridge is not of the eDP type, add DRM_BRIDGE_OP_HPD and
> >> DRM_BRIDGE_OP_DETECT to the bridge operations.
> >
> > Are/were there any devices using anx7625, eDP panel _and_ not using the
> > AUX bus? It would be better to use the precence of the 'aux' node to
> > determine whether it is an eDP or a DP configuration.
> >
> >>
> >> In the anx7625_sink_detect(), the device is checked to see
> >> if it is a panel bridge, and it always sends a "connected"
> >> status to the connector. When adding the DP port on port 1 of the
> >> anx7625, it incorrectly treats it as a panel bridge and sends an
> >> always "connected" status. Instead of checking the status on the
> >> panel bridge, it's better to check the hpd_status for connectors
> >> like DisplayPort. This way, it verifies the hpd_status variable
> >> before sending the status to the connector.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> ---
> >>  drivers/gpu/drm/bridge/analogix/anx7625.c | 10 ++++------
> >>  1 file changed, 4 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> index 764da1c1dc11..ad99ad19653f 100644
> >> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> @@ -1814,9 +1814,6 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
> >>
> >>      DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
> >>
> >> -    if (ctx->pdata.panel_bridge)
> >> -            return connector_status_connected;
> >> -
> >>      return ctx->hpd_status ? connector_status_connected :
> >>                                   connector_status_disconnected;
> >>  }
> >> @@ -2608,9 +2605,10 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
> >>      platform->bridge.of_node = dev->of_node;
> >>      if (!anx7625_of_panel_on_aux_bus(dev))
> >>              platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
> >> -    if (!platform->pdata.panel_bridge)
> >> -            platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> >> -                                    DRM_BRIDGE_OP_DETECT;
> >> +    if (!platform->pdata.panel_bridge ||
> >> +        platform->pdata.panel_bridge->type != DRM_MODE_CONNECTOR_eDP) {
> >> +            platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
> >> +    }
>
> Hi Dmitry,
>
> Thanks, for the review.
>
> Yes, it is better to check the presence of the 'aux' node for eDP or DP configuration.
> Will change it in next patch.
>
> -       if (!platform->pdata.panel_bridge)
> -               platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> -                                       DRM_BRIDGE_OP_DETECT;
> +       if (!platform->pdata.panel_bridge || !anx7625_of_panel_on_aux_bus(dev)) {

This is incorrect, if I'm not mistaken, please doublecheck it. I'd
suggest following msm_dp_display_get_connector_type() (feel free to
extract that to a helper function).


> +               platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
> +       }
>
> Thanks,
> Ayushi



-- 
With best wishes
Dmitry

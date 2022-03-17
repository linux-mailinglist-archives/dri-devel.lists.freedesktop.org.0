Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC8C4DC383
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 11:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4185510E2B6;
	Thu, 17 Mar 2022 10:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F4C10E4AF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 10:01:40 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so4669978wmj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 03:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9l6NBxX2UZsMGRkoxZx43LnIDFGc4TaO3DZ+Kj9Qpf4=;
 b=cmNuvLZeUm3UsnoG4XRekrH5FSBFxvAFKD4LwxK8oD2ZoeYqjOrHfEeKymX4dvXUhC
 Wp2wZFY/TpaCiL6oIN3YRi10XdxvG7NW5mUiI4clRd9UBS7FQ9awp0dmuRwpB8JEIM5B
 56CCPMnTQTKXrmfC0gHW02R9a5W0vC9bn4T+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9l6NBxX2UZsMGRkoxZx43LnIDFGc4TaO3DZ+Kj9Qpf4=;
 b=4j74PC+NLiHxcgAc1bOo2OJ1Fs3uUB6XG+GlwJ01ErdTl0GsXVs3AKGVBb1i0YDktG
 4MfuSLvS1ucNOfEwtqrhkegyLalOI5bE6qJg+k/wy1J4SSYqYW2+p89jr3oORwjveCCs
 F/fqy61SzpzMeOLhauHnxOrYaXPlAKHejUHonULap/cGqeDCoJsOWgM/+zVuPC6RZJTr
 ZhLCbbNUaVx2CJcZU2z4WlVMl8mzX6m1UUtDcggsNS+tVfMNNt2gjqCG6UVezU55tYEL
 FvbBm5veJqiStgSorIVAaEq3F7kLyMdyPx+Vvr+oRSZx3ervcrGgIITOTeiBSCiZnxzz
 iVzg==
X-Gm-Message-State: AOAM532rVGIxJEUnsn/9I65JWX0ZrrOsbM9cTSJQQtJPz7p8bFeGJviQ
 ozK7Oz3KbNA2/iWpnZQCBS9wqQ==
X-Google-Smtp-Source: ABdhPJyJx1Y44+6zNzj+dXcthENWKdkjHlvTlAl03eTRnbjmkk5+aYe8Tosyv9oBzRKNnpjfhcAJsA==
X-Received: by 2002:a05:600c:4f15:b0:38c:3db8:11cf with SMTP id
 l21-20020a05600c4f1500b0038c3db811cfmr3187653wmq.132.1647511298877; 
 Thu, 17 Mar 2022 03:01:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b00380deeaae72sm5899618wmb.1.2022.03.17.03.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 03:01:38 -0700 (PDT)
Date: Thu, 17 Mar 2022 11:01:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/6] drm: allow real encoder to be passed for
 drm_writeback_connector
Message-ID: <YjMHAI8zlxey/WNl@phenom.ffwll.local>
References: <1646963400-25606-1-git-send-email-quic_abhinavk@quicinc.com>
 <1646963400-25606-2-git-send-email-quic_abhinavk@quicinc.com>
 <CAA8EJpqnC=crWaSrXLNLBX5WsZ6LDzG0aNUu7RmqhDPTvP8tFQ@mail.gmail.com>
 <YisC4cY8EZADarG6@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YisC4cY8EZADarG6@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: hamohammed.sa@gmail.com, suraj.kandpal@intel.com, emma@anholt.net,
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com, liviu.dudau@arm.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, melissa.srw@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 james.qian.wang@arm.com, quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 11, 2022 at 10:05:53AM +0200, Laurent Pinchart wrote:
> On Fri, Mar 11, 2022 at 10:46:13AM +0300, Dmitry Baryshkov wrote:
> > On Fri, 11 Mar 2022 at 04:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >
> > > For some vendor driver implementations, display hardware can
> > > be shared between the encoder used for writeback and the physical
> > > display.
> > >
> > > In addition resources such as clocks and interrupts can
> > > also be shared between writeback and the real encoder.
> > >
> > > To accommodate such vendor drivers and hardware, allow
> > > real encoder to be passed for drm_writeback_connector.
> > >
> > > Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >  drivers/gpu/drm/drm_writeback.c |  8 ++++----
> > >  include/drm/drm_writeback.h     | 13 +++++++++++--
> > >  2 files changed, 15 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> > > index dccf4504..4dad687 100644
> > > --- a/drivers/gpu/drm/drm_writeback.c
> > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > @@ -189,8 +189,8 @@ int drm_writeback_connector_init(struct drm_device *dev,
> > >         if (IS_ERR(blob))
> > >                 return PTR_ERR(blob);
> > >
> > > -       drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> > > -       ret = drm_encoder_init(dev, &wb_connector->encoder,
> > > +       drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
> > > +       ret = drm_encoder_init(dev, wb_connector->encoder,
> > >                                &drm_writeback_encoder_funcs,
> > >                                DRM_MODE_ENCODER_VIRTUAL, NULL);
> > 
> > If the encoder is provided by a separate driver, it might use a
> > different set of encoder funcs.
> 
> More than that, if the encoder is provided externally but doesn't have
> custom operations, I don't really see the point of having an external
> encoder in the first place.
> 
> Has this series been tested with a driver that needs to provide an
> encoder, to make sure it fits the purpose ?

Also, can we not force all drivers to do this setup that don't need it? We
have a ton of kms drivers, forcing unnecessary busiwork on drivers is
really not good.
-Daniel

> 
> > I'd suggest checking whether the wb_connector->encoder is NULL here.
> > If it is, allocate one using drmm_kzalloc and init it.
> > If it is not NULL, assume that it has been initialized already, so
> > skip the drm_encoder_init() and just call the drm_encoder_helper_add()
> > 
> > >         if (ret)
> > > @@ -204,7 +204,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
> > >                 goto connector_fail;
> > >
> > >         ret = drm_connector_attach_encoder(connector,
> > > -                                               &wb_connector->encoder);
> > > +                                               wb_connector->encoder);
> > >         if (ret)
> > >                 goto attach_fail;
> > >
> > > @@ -233,7 +233,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
> > >  attach_fail:
> > >         drm_connector_cleanup(connector);
> > >  connector_fail:
> > > -       drm_encoder_cleanup(&wb_connector->encoder);
> > > +       drm_encoder_cleanup(wb_connector->encoder);
> > >  fail:
> > >         drm_property_blob_put(blob);
> > >         return ret;
> > > diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> > > index 9697d27..0ba266e 100644
> > > --- a/include/drm/drm_writeback.h
> > > +++ b/include/drm/drm_writeback.h
> > > @@ -25,13 +25,22 @@ struct drm_writeback_connector {
> > >         struct drm_connector base;
> > >
> > >         /**
> > > -        * @encoder: Internal encoder used by the connector to fulfill
> > > +        * @encoder: handle to drm_encoder used by the connector to fulfill
> > >          * the DRM framework requirements. The users of the
> > >          * @drm_writeback_connector control the behaviour of the @encoder
> > >          * by passing the @enc_funcs parameter to drm_writeback_connector_init()
> > >          * function.
> > > +        *
> > > +        * For some vendor drivers, the hardware resources are shared between
> > > +        * writeback encoder and rest of the display pipeline.
> > > +        * To accommodate such cases, encoder is a handle to the real encoder
> > > +        * hardware.
> > > +        *
> > > +        * For current existing writeback users, this shall continue to be the
> > > +        * embedded encoder for the writeback connector.
> > > +        *
> > >          */
> > > -       struct drm_encoder encoder;
> > > +       struct drm_encoder *encoder;
> > >
> > >         /**
> > >          * @pixel_formats_blob_ptr:
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

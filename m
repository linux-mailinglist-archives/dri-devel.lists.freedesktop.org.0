Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D704D9159FC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 00:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6200F10E24F;
	Mon, 24 Jun 2024 22:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KUoKkWzS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F2910E29B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 22:46:32 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-643acefd1afso19258367b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 15:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719269191; x=1719873991; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P3iBsbrlnas2q2TyHLGB/sfld3ZD6H8nDpiPUd64c3E=;
 b=KUoKkWzSNrXcKtNAVLu5HLu6EdHIlUqGeKqbTkkcREHu8mK5pir5p2WwQ6FPRwp+qW
 Ann2aP5/4D1kzo1IvZ76EvHH5xxKYvqVCuqnWtBePROynN0Z2GWocnv+4+nsiAgbQHI/
 KKPL7KSAgvur0ny8V8qxCwvBpq5AlJUxTY9roLK0jcXLybyuOxz9poo/719kH1L9VjR+
 n8RdiT1gwTzZlgSPsf1MgrotWYPJ7dyfYjtx5qWm4OrGwt7Wmvi9VaF8bft1p8wNJCMa
 t78dMSfNXvqa5RTCvEtNKijsD8dkYbqLYFN4xzVX4sHPemLaRVYZBwA0Os+SgajkBIWt
 G9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719269191; x=1719873991;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P3iBsbrlnas2q2TyHLGB/sfld3ZD6H8nDpiPUd64c3E=;
 b=slz109rSsRLXLz+3L1NttFHjg7LX370hUH7qNKfBT9DPDtTnYkLdapWump8IVhrVwq
 rf8MgQnb5r5KPSnv8zm8rEC9rFT1Z+wK3rsjl68gZikkcUTY5JeNvxY95cH/TygcV6DA
 PDpKgsGsx9w+Kb++VOWYaobvu4Z2OPnhpLGC0Ljuk67BccrJIp08BZLopdCQksLXKPs+
 KeIDPWc2g90nqjpj2tWF6CPzNOqxfKSBkycRUafpszkOJAAHQcebfN4A3jBgFQKWzzuT
 34jWDI6OwQv1+w+sgLRGgHH/l4c85NdEleIhy2ISRs0PuMMMvq7tvac0/HoolGSJit5l
 KTuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtqLC4FUWTqpg5aCUNonh/wVp4wq72HdD36hSDWxSfdwiIz6D6rOIt4ylmNGf73DT+oaZz+AIisqnWXLAvh/YnX7Ksj1IIinvpjvAjvOgp
X-Gm-Message-State: AOJu0Yx8d+5Nk5E+qCBJnq5fcHf3xxF8LIvoYgCN7e0WYsnWeSjoGlYc
 coEiBl/rJfUCCiDylLMMotLWw8c3aOhXdQzsSTq11ZTtl9OOKyTv1QnIjFwiovj3SpI6rD8XLeP
 7lh/JUkA7aXZC+aCBlQCvXIOTd5J8BspdSq/x8A==
X-Google-Smtp-Source: AGHT+IGVgskHg3Fgbb1vY5Iscqeb2BV+TYDIsO4ODyG6Xxfx+hkkFs5OeqExEjmUtkaDltt6W14EpykC4/QEwhiSl1w=
X-Received: by 2002:a81:9c10:0:b0:62f:67b4:790c with SMTP id
 00721157ae682-6433f0e4b43mr50802097b3.14.1719269191259; Mon, 24 Jun 2024
 15:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org>
 <20240623-drm-bridge-connector-fix-hdmi-reset-v2-2-8590d44912ce@linaro.org>
 <99ff549c-f5c4-dc9c-42f3-396dc3d29d6b@quicinc.com>
In-Reply-To: <99ff549c-f5c4-dc9c-42f3-396dc3d29d6b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 01:46:20 +0300
Message-ID: <CAA8EJppcH-z275m6xDQaigsxmVhnfJkLVsq68GHLFoAq_p_2GA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/connector: automatically set immutable flag
 for max_bpc property
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Petri Latvala <adrinael@adrinael.net>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, 25 Jun 2024 at 01:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> + IGT dev
>
> On 6/22/2024 10:40 PM, Dmitry Baryshkov wrote:
> > With the introduction of the HDMI Connector framework the driver might
> > end up creating the max_bpc property with min = max = 8. IGT insists
> > that such properties carry the 'immutable' flag. Automatically set the
> > flag if the driver asks for the max_bpc property with min == max.
> >
>
> This change does not look right to me.
>
> I wonder why we need this check because DRM_MODE_PROP_IMMUTABLE means
> that as per the doc, userspace cannot change the property.
>
>           * DRM_MODE_PROP_IMMUTABLE
>           *     Set for properties whose values cannot be changed by
>           *     userspace. The kernel is allowed to update the value of
> these
>           *     properties. This is generally used to expose probe state to
>           *     userspace, e.g. the EDID, or the connector path property
> on DP
>           *     MST sinks. Kernel can update the value of an immutable
> property
>           *     by calling drm_object_property_set_value().
>           */
>
> Here we are allowing userspace to change max_bpc
>
>
> drm_atomic_connector_set_property()
> {
>         **********
>
>          } else if (property == connector->max_bpc_property) {
>                  state->max_requested_bpc = val;
>
>         **********
> }
>
> I believe you are referring to this IGT check right?
>
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_properties.c#L428

Yes

>
> I think we should fix IGT in this case unless there is some reason we
> are missing. Because just because it has the same min and max does not
> mean its immutable by the doc of the IMMUTABLE flag.

Well, having the same min and max means that it is impossible to
change the property. So the property is immutable, but doesn't have
the flag.

>
>
> > Fixes: aadb3e16b8f3 ("drm/connector: hdmi: Add output BPC to the connector state")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/drm_connector.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)

With best wishes
Dmitry

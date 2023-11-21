Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FD67F2B6F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 12:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B37010E472;
	Tue, 21 Nov 2023 11:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2A510E2E0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 11:06:16 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5ca11922cedso23672977b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 03:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700564775; x=1701169575; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qAu9KNb55Wcsj1U43w2gm+QY+xIrGUFw9sDuy2hVAqQ=;
 b=Wz7+MaapA2+9hVGHTiGSwQDkqAxTsI3PlIZaCL5A1hX+xEwCoZ72BII+9/x8BYo81C
 /Yk04Ynw5wSrOSs60HjWmCQNOnKb6xiw1a0gfbpO2lM3FV5bKv80vMq+ksm9CPlw3cSw
 5mM9ZV90aaXLIOqrqX5Mn3ppdvmXI7mnv5x7RV+0rymNmM1IebLoGdakDPZQQZHMGddI
 NlHxTp7M+MQnGeTWN+Uxizi98PtuawRhzXJ5D8Ud6JRViQ/fUmf6IKDWb+48QeFq5DWq
 bWpOHXPTM2GhyYWnpo1swfFkjxQ1/SEJAYHKUzbNYfTRf81cWsgAFkuv3VNoUjDxHKN4
 boSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700564775; x=1701169575;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qAu9KNb55Wcsj1U43w2gm+QY+xIrGUFw9sDuy2hVAqQ=;
 b=pBRiVRcDP18ncMJIRMhbnir3C3rW8/4M/BSAFQ9zU+9Yd6ZjgsJ3qzojHZkidV2k8T
 4FuW4AzOZP3JkVVFuwTo2OdzxeHXdvNL6DuAB6a3mOGJOIPygI7MsRSizRAHZoySW9+w
 f4Z3C5xPpH6f2BqX4R56jXBYhEF+QJHtT6N9izJAok0YEjHDPpzfd6IRMW2/TZbDvSew
 6m04FiNd9Nz1kQ9JvInrAWfzbgCwvOl2LgG5LzBwScEmrGvsQIaS/xenbWo2fxFZ0thU
 w0YIAOF0lW2Jmm5aA7HMULYRcCmMhok8TBloBkb+WWqv2uDo2gP5ntoYpo4E4YLPGCK8
 U39Q==
X-Gm-Message-State: AOJu0Yy4D47aHT9hKEyJwxOvy4AIYa/I9cDSuxqriL8h8MyQncy+65lr
 C+cCLwIdASS/3AhF3B4N92bUqTRdo2r9quWRft/0UA==
X-Google-Smtp-Source: AGHT+IFXmK6c+goSlc6gqDw81wwgNpcvs80rWrjqvbbbomRseLWccYA6j1JiQT06FrnHqj4stB6xqOa2n/1zntHjuNI=
X-Received: by 2002:a0d:d3c6:0:b0:5c4:3896:7763 with SMTP id
 v189-20020a0dd3c6000000b005c438967763mr10518180ywd.44.1700564775367; Tue, 21
 Nov 2023 03:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
 <20231103230414.1483428-7-dmitry.baryshkov@linaro.org>
 <e67c00fd-37f2-4ede-983f-c8c46bf847f1@linaro.org>
In-Reply-To: <e67c00fd-37f2-4ede-983f-c8c46bf847f1@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Nov 2023 13:06:04 +0200
Message-ID: <CAA8EJprC_9MXyzBETaHO=HcKU+vREvdJewXafqk8+R6bL3vDtw@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] usb: typec: qcom-pmic-typec: switch to
 DRM_AUX_HPD_BRIDGE
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Nov 2023 at 12:46, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 03/11/2023 23:03, Dmitry Baryshkov wrote:
> > Use the freshly defined DRM_AUX_HPD_BRIDGE instead of open-coding the
> > same functionality for the DRM bridge chain termination.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> > +     bridge_dev = drm_dp_hpd_bridge_register(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
> > +     if (IS_ERR(bridge_dev))
> > +             return PTR_ERR(bridge_dev);
> > +
>
> What is the effect if we never attach any bridged devices ?
>
> We make an aux device that just hangs around and eventually get cleaned
> up on release ? That's the way I read this code anyway.

Yes. That's the point, to untangle the USB code and the DRM bridge.

> Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


-- 
With best wishes
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F8B55EEF9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 22:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B7B1121E7;
	Tue, 28 Jun 2022 20:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1238F1121E7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 20:14:04 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id i18so24231342lfu.8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 13:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=I2/+5dhRyxuL3Gg1aHlNPvG7vh2LZmL80DGuAx1dO9M=;
 b=v3/T1HH6xPCsUlhJlqTNwOl2XQgII4I7NrSNEm49EGWF7H8o48QfRduFpQHTuyrvYB
 L+eYialYzpCRveZPv0LJjUlUsxFY+7/aiuTfmBCaU2a4Q873qI+HQ+va/lF/9f30KV8l
 mmr3lb0W0+vlo9X5zk7RGZuDTb7Moy+8oPaOhVI7PIvbB1oo9ajzQQIBnxKcbD9BVwYi
 OMU3PZEmtEtWQMMWYTLjJYgsfhd879dmueMMW2+6JYH/GL/WShJO5AQmVAcvKZquP4i3
 drc8JzRa1TDSf/+8sWC3nbT072L6DGSsDWrHiO9Fc8W6FOYZbxhkF3rYDTArdJ5oeNn4
 9sqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=I2/+5dhRyxuL3Gg1aHlNPvG7vh2LZmL80DGuAx1dO9M=;
 b=uVAA056Tadtcqw4UEapm6B4qw8a0953SexKup4XXethxs8MYjMwVIMDig9ttrPtEL6
 fGspRCfQ4i2lDjWt5xhVSOl5WfeRj1y7AT9RTMvWSxgOeZWxi5ugySU1ZcnjUzPHe+kI
 abYq0iRjHhqscf6+BeoMACjMPNx4ExtHbbAddSiiqGbgnLL2Xtc/2JqnZcGiVnAcsxUR
 CHGrOjPz81RUvjpKhNJksv/BWfPGPPxWDfsBtJWliHoCCaxCphSY/ZPoDoYbw6ROhvLw
 PLd3uPF0WUIo7b0F+YpMPBOuje+D0TXIStNCcwQ4ox2wD2GIYYmKRYrh6OCNXhOtyo9J
 t3wA==
X-Gm-Message-State: AJIora9VQR3yZbA489DHV68otmVEbGN6inEWva+Vb+DowfU2JD1wPFIm
 MBl9/REA+RdydpK1XWrjDOl+cQ==
X-Google-Smtp-Source: AGRyM1uCBKBW3awWOv+JynlB8eHhjWlAkHdDt0Ja1lpBzywpjcpIvfZ1hMjxuqk+Ua0Nz1wdceJyqA==
X-Received: by 2002:a05:6512:3f84:b0:47f:673c:31b7 with SMTP id
 x4-20020a0565123f8400b0047f673c31b7mr13979453lfa.473.1656447242387; 
 Tue, 28 Jun 2022 13:14:02 -0700 (PDT)
Received: from [127.0.0.1] ([188.162.64.167]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056512200f00b004811bf4999csm901113lfb.290.2022.06.28.13.14.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jun 2022 13:14:01 -0700 (PDT)
Date: Tue, 28 Jun 2022 23:13:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, 
 swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_drm/msm/dp=3A_make_eDP_pa?=
 =?US-ASCII?Q?nel_as_the_first_connected_connector?=
User-Agent: K-9 Mail for Android
In-Reply-To: <1656429606-2765-1-git-send-email-quic_khsieh@quicinc.com>
References: <1656429606-2765-1-git-send-email-quic_khsieh@quicinc.com>
Message-ID: <F35C87BF-46A5-41D3-B8A5-B2AB4A24252D@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28 June 2022 18:20:06 GMT+03:00, Kuogee Hsieh <quic_khsieh@quicinc=2Eco=
m> wrote:
>Some userspace presumes that the first connected connector is the main
>display, where it's supposed to display e=2Eg=2E the login screen=2E For
>laptops, this should be the main panel=2E
>
>This patch call drm_helper_move_panel_connectors_to_head() after
>drm_bridge_connector_init() to make sure eDP stay at head of
>connected connector list=2E This fixes unexpected corruption happen
>at eDP panel if eDP is not placed at head of connected connector
>list=2E

The change itself is a good fix anyway=2E (And I'd ack it=2E) However I wo=
uld like to understand why does it fix the corruption issue=2E What is we h=
ave eDP and DSI, with DSI ending up before the eDP? Would we see the issue?
Also could you please describe the mind of corruption you are observing?


>
>Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>
>---
> drivers/gpu/drm/msm/dp/dp_drm=2Ec | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/msm/dp/dp_drm=2Ec b/drivers/gpu/drm/msm/dp/d=
p_drm=2Ec
>index ce0ec3a=2E=2E2d18884 100644
>--- a/drivers/gpu/drm/msm/dp/dp_drm=2Ec
>+++ b/drivers/gpu/drm/msm/dp/dp_drm=2Ec
>@@ -136,5 +136,7 @@ struct drm_connector *dp_drm_connector_init(struct ms=
m_dp *dp_display)
>=20
> 	drm_connector_attach_encoder(connector, dp_display->encoder);
>=20
>+	drm_helper_move_panel_connectors_to_head(dp_display->drm_dev);
>+
> 	return connector;
> }

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245A99EFD6F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 21:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B59E10EE97;
	Thu, 12 Dec 2024 20:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Dy7eb3eL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014C510EE94
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 20:27:53 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e3a0acba5feso747857276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 12:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734035273; x=1734640073;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=IyH3eYb6Cm9AtiFQGPmrG/m4h3r5bZXGHe1sNdWmzvY=;
 b=Dy7eb3eLad+fd1kQYLI2vCFIve4xgH1FbubJrFrTvhZRUGLc1+abiGWEMFM1k9bqS8
 ALlLDBOaLTCLE2wvw84H39hFFJo2P6OLrKM6vcS/tM+Q2VfXz5MqrLV6qJ9bkfzNn7xT
 XhiwWDUhoLtx6cbKPd6InyykyTfR5ypsyb+jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734035273; x=1734640073;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IyH3eYb6Cm9AtiFQGPmrG/m4h3r5bZXGHe1sNdWmzvY=;
 b=XzrZMqZBbbITiopMBbFlGprhz1StbPbdYf4vFcBBC/CeJMahjkCpirEgT0x15kehh0
 FVbz65TNzZ7cb8n6tigBu5g7frSoXnaeF4m4PFuRAX5n2ojLqeTvr+ih+Gql5uDCkUm2
 L86nAKaPc74LEgk+DFPoitwApyam+as3HSAu834GS6EacgvhwyKExvPJSFSY4TT9FK6k
 vr85kTgyXfGWSNnspqOTA0BO2w3hEcIfznq66x/OK0/1cx+Kk4BwptRQx937PvOxBafK
 WxqC+Oi+2tls34Q4NiI1U3WAPk264h0NvdF+7W46NZ5gPicvcC/52gPv5gvRPyZM/Sf9
 ZNEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzSjij3axU7XXTR7cEdIb8AYeYpS24QnnWKWhV4BAsvzSH3XleIUaJlejFObUQbtDDRgjV/8T/J9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJ+MSrEHT/I/dV3lkheImaHdXHOz05xdoaTG7TYlW0Sze5xhO5
 FYQtB6bbeefqjrAnlRqeT919k/0yIDNYhw9qJaFhrsqySL2DDz9b3t8J//wU9VTxhS+v0ewp+lY
 ijUv++Djh4jEEN/XSiNLXHn1SdddwGjrpB+cE
X-Gm-Gg: ASbGncvzfGyZcpnK/Gvkc9tC0A8HEWLTYidu7D2im94lgC6Le8i5+VVDTN3QO7LjXrW
 UiCguzY4xCipKqBmnMim0sxVlscWDrcznYQXoucCVqyTOSZwcQCi11oxnpCwekiIBCQ==
X-Google-Smtp-Source: AGHT+IG3KC9ssh6ekayVwqUK7Km4JQfm8yz6hlNQTxOXGgPcqzMW7GAJJi4TlQ/fXN099DQlJcEjq7UgjR3xUuloAyA=
X-Received: by 2002:a05:6902:1b8e:b0:e3c:7fca:716e with SMTP id
 3f1490d57ef6-e43491ff2aamr112163276.6.1734035273092; Thu, 12 Dec 2024
 12:27:53 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Dec 2024 12:27:52 -0800
MIME-Version: 1.0
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Thu, 12 Dec 2024 12:27:52 -0800
Message-ID: <CAE-0n526i3eZbSsoyLgO=MFPb1_mU_v9c-zgMrdQGWgUvj-+Ug@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] drm/msm/dp: perform misc cleanups
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
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

Quoting Dmitry Baryshkov (2024-12-11 15:41:35)
> - Fix register programming in the dp_audio module
> - Rework most of the register programming functions to be local to the
>   calling module rather than accessing everything through huge
>   dp_catalog monster.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

For the series

Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor

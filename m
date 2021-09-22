Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C243414C4E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 16:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C466EC06;
	Wed, 22 Sep 2021 14:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D501B6EC06
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 14:45:40 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q11so7525817wrr.9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 07:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vBtJFE+lofow65KkthlKBCy0zY8p2r2WeZxJ4tazkWI=;
 b=XlWRxcZKczZ6MNWmAJ6uzfftNpBFTtj2u6tlchvACgOocDNUd5vnx3674guNB1p3iB
 1rtvroB0yiiHcAULxT4Clmacv6TJT56G91i0b9DF70mZKUnst5czv6K8qr5plEEO8GaB
 FNToCMwSpS0ds+dH0/pWnZNJc6BDYVYLH+yuJ+DmMIOevRKRm1wiz/xenEvA1YzK50F4
 N7Y0WiQrGWq9Zsd7AqbzvEos0jU8+2hCkhQyDt1K6qxJnOOYEzCpd3IN7yCR5AQLOZRa
 9gqoFktAiAVy+y/7Rd0neQkZR8xiWbSxg9fw/wOni8K+mTec8UHVvyFSkzIgmNp+Q+yX
 Ckhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vBtJFE+lofow65KkthlKBCy0zY8p2r2WeZxJ4tazkWI=;
 b=Q0XiMRfc2i32+BlnINsoW4IkbemMJFF5HM2Xoe5EyAVpjF4H5Sx/whMyNebic4qd32
 G3Z7eraHbFrfdQF8jByON/fqlpZz6IgF3jcnuBXoPHzLIUAVv/oZu9Bf41G93annTUWo
 fgbMRR01mdU8zO0e5bmteLtFGnmfOT4avtMy0DqjRNf5ejbQbaE7b3aKDEWcxtAXv9Hk
 ZxAVWoF7H9RAG6/wI4mbXxMld8cSf1FRPmjPRPEodpgnColLFYX2JBEzf9qKlY49J3Hc
 lfHExP9WsaMOYSAZhkDYq7r43bBwSQK5paa1XqIiDibM8YmLk7QRI3ve5BvmOezMVC9Z
 5zCQ==
X-Gm-Message-State: AOAM532yZb15h/asFLWpQBgMsu/Y01lbaTiQmEUb59WjGP4DdZvFIH+F
 8H4+/RTfmOciou3xPI7yp4SOMQ==
X-Google-Smtp-Source: ABdhPJw8riDRCc+8hErOFvP4SgnMWnSaRjwppkdDu9v3Rwgwoehg8PNJNDJ3cM4zJ6telHppmPbZrA==
X-Received: by 2002:a7b:c4c2:: with SMTP id g2mr11052165wmk.134.1632321939185; 
 Wed, 22 Sep 2021 07:45:39 -0700 (PDT)
Received: from google.com ([95.148.6.233])
 by smtp.gmail.com with ESMTPSA id d2sm2441774wrc.32.2021.09.22.07.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 07:45:38 -0700 (PDT)
Date: Wed, 22 Sep 2021 15:45:36 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v9 2/4] dt-bindings: mfd: logicvc: Add patternProperties
 for the display
Message-ID: <YUtBkOFeQWnteG5L@google.com>
References: <20210914200539.732093-1-paul.kocialkowski@bootlin.com>
 <20210914200539.732093-3-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210914200539.732093-3-paul.kocialkowski@bootlin.com>
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

On Tue, 14 Sep 2021, Paul Kocialkowski wrote:

> The LogiCVC multi-function device has a display part which is now
> described in its binding. Add a patternProperties match for it.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

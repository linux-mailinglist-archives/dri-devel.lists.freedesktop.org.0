Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A7E8FB422
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 15:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D0410E078;
	Tue,  4 Jun 2024 13:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fU/dSODL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6230210E078
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 13:44:07 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2eab19e7034so17757881fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 06:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717508645; x=1718113445; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TDyyivtsWKVto8Jf6XTYPyQtJ234vG34gbVNO+G82vg=;
 b=fU/dSODLX8YpFfqxTuP4IQuRuloffBesQ6hTWYQ4YLlL+9uabadvaDK4yzrMClt7km
 QqWGlEGCNTR78BdWs1B9BodululLMUn593nLOKJ6aVY91zuh73l30+x1crNkDVhbY+HZ
 Y4g+/BEZbatL6/RxyBD0HRoBz1KvL3xCqi4c97+LmWn/7l1u3nUNwWvfKBl6vGiSwHSf
 3zzvKAeWeR9SIBi0bUJdyX6gaxiFj7JGYtg5Glym75Vn38wJYgOQ27EYaXdVmoGvCoOC
 fTfRdH0MCmpq+0fAl1SOOfouYl0+0SqXtr8X4PdScr9HK2vxLjXDBtYN7j1FRHme7lsH
 m8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717508645; x=1718113445;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TDyyivtsWKVto8Jf6XTYPyQtJ234vG34gbVNO+G82vg=;
 b=Wv/0oX9SOe+nxTvAtMPppBlR4cs0oSY/NGn2K7/6fG0XCUr9LTNyzK6H7XKLfY5KOG
 Z/qlvmOqDtDVC6I0h4OP4iYbx0Hwo6OEmkEUp0QtbVrRt+/rpuCoHVx7WNDyq0shFDW0
 +zGyhnazvgZOQIZyOn+Kj8FDllDjWpMP68xys/RH/PB9fRafkZFJ7OsBgoZxc3objzoD
 TNUwNN4/41nQfzaOlAFZp5L3vbQ9Fr/PstZZ2ur23emhDe2RTKyr093qR9CXlylsswjf
 y35++YKD9Zm/2H8V+tlY+whcz6bhYaJLrStKKYJs9Eh6Wazwt9UP3BO+1lcwT6kIFZW7
 DX3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlSIQsjt1wwLw99cwpz7K0Pnzpy+iYI4WqMdXnNvSKQY5xwJ+y4n5JIQsuoWjs8+i/jVMf/XZ4+vkyzdxR02bZ50miDNBYKMaMixrLbMjr
X-Gm-Message-State: AOJu0YzKQPXBF6v4/s051Z8437TuYUqHQ5AzJexGF8KdVg8+DWGelADj
 N5mtX8u0pc+OWrqlWNKOT+xJO03BN7qmbwqQzhCMzn3q9UgLfrqob74fRPWjZzA=
X-Google-Smtp-Source: AGHT+IG6ht8A62Pw8rpZ+11aDKYrmTFdH9Ws+Mkt+G2M8qmauAinc4sUedcPWhjbBE/5JRI3fEDVTw==
X-Received: by 2002:a05:6512:1110:b0:51f:9a88:be2a with SMTP id
 2adb3069b0e04-52ba229b339mr980152e87.23.1717508645253; 
 Tue, 04 Jun 2024 06:44:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f149sm1489949e87.74.2024.06.04.06.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 06:44:04 -0700 (PDT)
Date: Tue, 4 Jun 2024 16:44:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: noralf@tronnes.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 David Lechner <david@lechnology.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: Re: [PATCH v4 3/5] drm/mipi-dbi: Make bits per word configurable for
 pixel transfers
Message-ID: <ogplcvwjc7rkonyjoiz6kbxcydzlelokguguil2aghapgey6uv@ltfjdxyd5xaz>
References: <20240604-panel-mipi-dbi-rgb666-v4-0-d7c2bcb9b78d@tronnes.org>
 <20240604-panel-mipi-dbi-rgb666-v4-3-d7c2bcb9b78d@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240604-panel-mipi-dbi-rgb666-v4-3-d7c2bcb9b78d@tronnes.org>
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

On Tue, Jun 04, 2024 at 03:20:30PM +0200, Noralf Trønnes via B4 Relay wrote:
> From: Noralf Trønnes <noralf@tronnes.org>
> 
> MIPI DCS write/set commands have 8 bit parameters except for the
> write_memory commands where it depends on the pixel format.
> drm_mipi_dbi does currently only support RGB565 which is 16-bit and it
> has to make sure that the pixels enters the SPI bus in big endian format
> since the MIPI DBI spec doesn't have support for little endian.
> 
> drm_mipi_dbi is optimized for DBI interface option 3 which means that the
> 16-bit bytes are swapped by the upper layer if the SPI bus does not
> support 16 bits per word, signified by the swap_bytes member.
> 
> In order to support both 16-bit and 24-bit pixel transfers we need a way
> to tell the DBI command layer the format of the buffer. Add a
> write_memory_bpw member that the upper layer can use to tell how many
> bits per word to use for the SPI transfer.
> 
> v4:
> - Expand the commit message (Dmitry)
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 14 ++++++++++----
>  include/drm/drm_mipi_dbi.h     |  5 +++++
>  2 files changed, 15 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

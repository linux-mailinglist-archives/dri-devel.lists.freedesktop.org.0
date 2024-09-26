Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABEC98747A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 15:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A0710EB4B;
	Thu, 26 Sep 2024 13:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cotZk/Bb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4C010EB4B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 13:33:06 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso13196941fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 06:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727357584; x=1727962384; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SLMfEvh5MiHDpi2ZSu3TA3jK6yRE8rSCehYhzQ/c1wk=;
 b=cotZk/BbReOaYO46rqJk1BY/tE/aKhFkDavswqJ+pSQO+GexQU3bINFb/mhuZqoIVP
 2wM8CSC/kIpGiIV6U2fBy2+7V1WM5Ov0sFpJ0/unG9GFuZ+VNMQeD2YZB4IqrGjD40Lt
 +5bX0paDf7tcrT9D6NuQud2eHamjY7r04A9J/NXJ5FmgK8U92mz3pW0XF2oBrGGfwguj
 NcFvUyR/ZJIHnU/YXv7p5YVXHASLn9KHuJUJWrGlrV0S21PWF5Qut2pgfe1fkoF3jt4z
 +ed2Q2xS8hPKPMmPF4GvW4y555qL4ijbkcKmL622o5MRnA3vKQp0uyMUdrr4V0zruaTk
 KADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727357584; x=1727962384;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SLMfEvh5MiHDpi2ZSu3TA3jK6yRE8rSCehYhzQ/c1wk=;
 b=UaI6vEqYCh1b60/pQvEsFPgAlA+3wRdkZpoO5ZS+y/nSN2it3HkVq6mAY7rl5DXTTY
 Qak4/kym9vznb0rcBHAAkyDtgUGuEYZYgLLiPKqopDNlg8dd6euzYZZv84IgQ1GXIH9r
 SeGDJc+WH/9nyPGvgpiv6fB0r5NrN2NLkGSIE/cLektGZaTHbfRmPlmE9gh4j4MCZLPB
 a1+eE6K56+eGHVbI2crVrT2lKNEJzzW1Czpm6UgzDpZ4aCKaPZWk6mz33Mlfc/iJZ+Eq
 Tc2r0otQUK6dgD7Ty/PSfR+a1GoJWh9K1tosD3EbENkt3Lq1a+nPLzmOO9j77d8qnpp7
 uHxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlTjMoqFrsSC7P3ozGiq7/MY26baSQ0noapRz8P38RcgDfA2hHX8cjhEjqfPLVPJTX6KBiLV5LSOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJvTliHwlXK55UGFgl6D7Ld9zpe5XbhbLyZ1KAT9WK0aaI6SHv
 C8Bojfbc1ZMlc1h/qCIpJOS7PuuqNR2v229Ri75tXi2ItCdh8XXEfjQcW5YzOhareHulFscPYjq
 OPf1m3A==
X-Google-Smtp-Source: AGHT+IGe3R/1B3NKEaxLfS+X89tuylS/2rdHSlIFy6HqcIaJi19L7E/oXqDbrjVb+1syadc4RQIWPQ==
X-Received: by 2002:a2e:5152:0:b0:2f7:4e8c:9bfa with SMTP id
 38308e7fff4ca-2f91ca6eee3mr34240621fa.33.1727357584260; 
 Thu, 26 Sep 2024 06:33:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d283c0easm8253391fa.52.2024.09.26.06.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 06:33:02 -0700 (PDT)
Date: Thu, 26 Sep 2024 16:32:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manikandan.M@microchip.com
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dharma.B@microchip.com
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Add Microchip AC69T88A LVDS
 Display panel
Message-ID: <quxjqmx5yc27cxmjvnq6irltr36josag4yltxbiweh4femqbqo@j34pxmfxglc5>
References: <20240919091548.430285-1-manikandan.m@microchip.com>
 <20240919091548.430285-2-manikandan.m@microchip.com>
 <zognzunciriytm3uvoolxjsvu43v3m2lnctsz5swusnmm3aj2z@ag7zkncccdmf>
 <83e9d20d-f294-4303-b570-816ebc989bcf@microchip.com>
 <f4z2egmrcoh7kih2pyr3mq7fzuwtvod6vxlzzim2iw3ly7jcr3@2uxiyzlfixhp>
 <17b5a11c-b9a8-4172-831e-d52f1a4270e9@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17b5a11c-b9a8-4172-831e-d52f1a4270e9@microchip.com>
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

On Thu, Sep 26, 2024 at 08:17:09AM GMT, Manikandan.M@microchip.com wrote:
> On 23/09/24 11:37 am, Dmitry Baryshkov wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Mon, Sep 23, 2024 at 05:50:22AM GMT, Manikandan.M@microchip.com wrote:
> >> On 20/09/24 9:13 pm, Dmitry Baryshkov wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> On Thu, Sep 19, 2024 at 02:45:48PM GMT, Manikandan Muralidharan wrote:
> >>>> Add support for Microchip AC69T88A 5 inch TFT LCD 800x480
> >>>> Display module with LVDS interface.The panel uses the Sitronix
> >>>> ST7262 800x480 Display driver
> >>>
> >>> AC69T88A seems to be a module name, rather than a panel name. What is
> >>> the actual panel name present on this module?
> >> Both names, "Microchip AC69T88A" and "MPU32-LVDS-DISPLAY-WVGA" are
> >> present on the display module
> > 
> > Which panel was used for the module? I don't think that Microchip
> > produces LVDS panels.
> Its a new LVDS display from Microchip that uses Sitronix ST7262 TFT LCD 
> driver
> 
> https://www.crystalfontz.com/controllers/datasheet-viewer.php?id=486

Ok. Anyway if somebody ends up looking for the panel, they'll probably
find the module and vice versa.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

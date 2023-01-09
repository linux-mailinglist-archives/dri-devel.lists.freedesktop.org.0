Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBCC6623CC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0201410E08A;
	Mon,  9 Jan 2023 11:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA9F10E08A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 11:06:39 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id g10so5984150wmo.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 03:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SjRwbpuBx9A4o4cRoFcJqEE5mXsy0UsyNYHbW5KtG4M=;
 b=YnQ3fGmpuRUapOzbtVRlN3HBT8Iorta3LecpdB0log7XED7u1IJxEqQs0QccmZxOai
 MfS/ZZSQ5WKDa9o6C1cGRqmSlALsDF7dYw8bC0mLYpQtTD17RkfW4+nHFkmXWXMpmBze
 LZwVtCyv46vyu0ZifdpdHibLyN3SfkifcK+AXWfJG2T0iyPzAA9pLINli7HH1gS+p9g3
 O+B5gLSVUqo8PEgDoBB9hhiNpI9OFz7Cq+mzvc+xnE3YYo3cKvbMrMpNiAgcOYu4257/
 //cyEe3wFJV/FzRNJeYb81OLG4xcEJtdkHClXQjHgPbLWfvpN3QzLV2BDagvGkziL0gK
 obhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjRwbpuBx9A4o4cRoFcJqEE5mXsy0UsyNYHbW5KtG4M=;
 b=MQTpq1+1Y0CS4p2yFpckDb7ej5CC3oxAw1uVghodhWoUIJK0ab7k3aWrZdo4Op17Uh
 pdR3jV1SZraMn7y2pLMBNSvG19W2MoKTwK9SZdHOPKa5pE7KHKCC+Kv3N9s/iIaLzb9f
 EXVLEi76Vvi5+rT+bbc/Ky8I0muJyVkO1gzR1O5JsTW2JEmRByeUY3YLy3S8/J8itRrP
 1BmzJL0eZEPimdfAAXsG0scWI6wzDvI2PZxCyKeHWqZmimtLLwtBmnY9hc2L+o10VLK2
 0GGLDtPo+CzS5okSnMnatQ1PgEHGKfnCvBcJw5qgWkfoZXQgd1A2yAOJQO0YIqzvUw65
 zA9w==
X-Gm-Message-State: AFqh2kos4vJhhH/E4NVOcVzKEXiWp3J2WWADWe4hKUsDPakOVJT1fpCk
 BI5N+fZdcM6DTHrgt08MzGEawA==
X-Google-Smtp-Source: AMrXdXshcTe7Yre9OY4C4E6jNr30wzlSQe0BxicvczyjAULATvXvRnPw2diLMpZVvSEBR8IGX/Vbtw==
X-Received: by 2002:a05:600c:3550:b0:3d9:ed30:6a73 with SMTP id
 i16-20020a05600c355000b003d9ed306a73mr3129624wmq.9.1673262397923; 
 Mon, 09 Jan 2023 03:06:37 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 y7-20020a7bcd87000000b003d997e5e679sm12453314wmj.14.2023.01.09.03.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 03:06:37 -0800 (PST)
Date: Mon, 9 Jan 2023 11:06:35 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: sam@ravnborg.org
Subject: Re: [PATCH 15/15] backlight: backlight: Drop the deprecated fb_blank
 property
Message-ID: <Y7v1OxdowGdxgvUj@aspen.lan>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-staging@lists.linux.dev, Stephen Kitt <steve@sk2.org>,
 Antonino Daplas <adaplas@gmail.com>, Robin van der Gracht <robin@protonic.nl>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 07, 2023 at 07:26:29PM +0100, Sam Ravnborg via B4 Submission Endpoint wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
>
> With all users gone remove the deprecated fb_blank member in
> backlight_properties.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>


Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


PS Please don't treat this like a maintainer Acked-by: and merge it
   (Lee's not on holiday so work with Lee to figure out the merge
   strategy ;-) ).

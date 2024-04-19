Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA59C8AB5AB
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 21:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1929410E1D5;
	Fri, 19 Apr 2024 19:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BDwCobov";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38C910E1D5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 19:43:43 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2d8a2cbe1baso31716811fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 12:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713555822; x=1714160622; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9n8w+k/Rz2KhRS1lWM0onkwMbYnSnsUvM19FbIPwAXY=;
 b=BDwCobovE4k71X9MHmQbZfXKeK1/vhIzb45V7GnaeqVUPQ/koZrzmjCDhYwvz9jMAV
 4rkUOUfQFJCRK9/discfNgpk0h6ux1n3EuzYrkalhOLRPjlCw4zW/nJVBePFWF12Ubz9
 4sQ8JUJecB8lTPO9q+rEdOl7xVkEE28uyD7JOacG8NTkHalllqK209GMFsq1IzIaYxvw
 /Qz8kgRI8WPG1fhowUqmnuUZnoR5riRVB4reBtM6pj3zvaT05Yt5fg46b3lN5ODYCt5F
 zHOwHJP98UoclsDF4KlqEb9aC2hFXb3qwucrLVL1hUJliqUhsbD5sYoJt64KcDnmPYhC
 BLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713555822; x=1714160622;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9n8w+k/Rz2KhRS1lWM0onkwMbYnSnsUvM19FbIPwAXY=;
 b=vKztk84eoi7En4p3omGS1q7crjxpfqZBNlq3Ol2R1nxsHatbRLDraWn2tm4V1xSIj3
 WWCAOx/IEhryb0JSTqW5KP5ybWwiOAWrE0qNVlAl2GhcmI99IeWFCVaHDluRpIzraOkj
 zOVjWc10bko2eKociAQn4cl7TtoOpkec62Lx9x+ze6Xk7ZQFjTlV3GiChmjBo3dTlYPC
 6kOQUFGgdv2+oe6lvXwUDQW7cc8Vn8wuxyQvDBXBxNFS3YfpnnnlsWV2CcJeo9Fwysfd
 kdmy2qTrtuOCs8GT4ep9v8/zckhdm8s4BzZLPESVNxmpAeasknltbovvPE/gp/bQXZds
 JriA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVPXY2to31epI9RWojkrEezF8v5zYIHliiha9iI3yOJ6LXn5pesHEByBZ0fLbDmOkjtYokuKymQAj46Ot1ZQG7gFtIu/qpyB3qNks+GaBY
X-Gm-Message-State: AOJu0YxdEEVXCilLn6zDJ9EFcuk6Iaufi0B4Rxpom3aDcsBSakerl3OT
 Y7TQDgesaftNP4Nk1c1bJLE7CD1EwCqbMieu7MfEfdiN7WPWk20vCEpOhNAYp2s=
X-Google-Smtp-Source: AGHT+IGcBUNiOzrCx5bOhksZzXhutpA6zE+59J4ho4DswlvXGTgc/C2PjsXBWOqbG5K4nsFd3zM/2g==
X-Received: by 2002:a2e:8195:0:b0:2da:4bf:ab14 with SMTP id
 e21-20020a2e8195000000b002da04bfab14mr2470965ljg.45.1713555821866; 
 Fri, 19 Apr 2024 12:43:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u35-20020a05651c142300b002dd1279c133sm36469lje.10.2024.04.19.12.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 12:43:41 -0700 (PDT)
Date: Fri, 19 Apr 2024 22:43:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Shresth Prasad <shresthprasad7@gmail.com>
Cc: daniel.thompson@linaro.org, deller@gmx.de, 
 dri-devel@lists.freedesktop.org, javier.carrasco.cruz@gmail.com,
 jingoohan1@gmail.com, 
 julia.lawall@inria.fr, lee@kernel.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH][next] drivers: video: Simplify device_node cleanup using
 __free
Message-ID: <yelspf4hfmmj3lnk3exyc6tm2lrsqlet623q2s5zrm2unba6nw@43ewuqdzckdg>
References: <20240419111613.GA12884@aspen.lan>
 <819a56c3-bbaf-4d5e-87de-78c1312c56d1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <819a56c3-bbaf-4d5e-87de-78c1312c56d1@gmail.com>
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

On Sat, Apr 20, 2024 at 12:22:41AM +0530, Shresth Prasad wrote:
> 
> > Please fix the subject line to be "backlight: <driver>: ...". I came
> > very close to deleting this patch without reading it ;-) .
> 
> Really sorry about that, I'll fix it.
> 
> > Do we need to get dev->of_node at all? The device, which we are
> > borrowing, already owns a reference to the node so I don't see
> > any point in this function taking an extra one.
> >
> > So why not simply make this:
> >
> >     struct device_node *np = dev->of_node;
> 
> Looking at it again, I'm not sure why the call to `of_node_put` is there in the first place. I think removing it will be fine.
> 
> I'll fix both of these issues and send a patch v2.

Just a stupid quesiton: on which platform was this patch tested?

-- 
With best wishes
Dmitry

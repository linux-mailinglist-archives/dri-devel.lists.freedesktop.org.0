Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561B19FE60E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 13:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB0310E4C7;
	Mon, 30 Dec 2024 12:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZgcS9B+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D65610E04C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 12:48:05 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53e3a90336eso10153161e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 04:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735562824; x=1736167624; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uCO6CXWnoZCq053HJEmMFJxQhQ579FC0ggfho/ODq8Q=;
 b=ZgcS9B+2KhkwBHxxc52MPiXGBGCX7p7mC91DVT8Y5LTfe+1z5EX3BS+DILiNHCN/F3
 WWODlmhJ4ocj9Q6Gr6jz7g+6lSd7sN2Txglrhv45vsJ+dK620HNHg9Mz+RGtmh3BnVm/
 8Uvw+cau3a4WGKFPxhMKz7b+g9QOHBvBEYtVYJgOn4Nw82L8rXg7Lxd7JC3AaxJW3mrX
 Vwe1EMaP+9/pvcJYA4nmzE1axeW+WbJ1rVqmIrOlkFTgZKZwhS5SS7v4L8QUo6OHu1eO
 GstydKbZzpqSg6Nx7q3/QTEW0LIqkNxn9uJ52dYK/shjebWW06ipJ+0k4vZwp2Vxo2kC
 hcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735562824; x=1736167624;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uCO6CXWnoZCq053HJEmMFJxQhQ579FC0ggfho/ODq8Q=;
 b=AJZS6PGp8o22cNWbe39+nv4mPl1/fq3FR7zee9yXt7Qw2XwJ66nb3pQRK9bp/1Hxvy
 zEHt5nTMl8Y7kCYQ2ti0JclsHstmwDLt2jw7rzcelnEA0iYCwgQ07kPh+ocOeE0ooNGq
 EJG1hbUBXCqdyd/Mjz1i3FlIpxsQ3eaABYMfCZVegRqLTDWLg6NnK6O/j9yW7F/kwOuP
 Azy5YG1dmZP9z3fJf9FANEp9U58tlagIzlOuEuLZadbQlDWgN5FhvJj3UPMOblj3WhwP
 u7PfrOcT9DvQEtmqwwwUyZvPx8ObXcGoes9F5Cw7u2HcucZjVk4OcULcbZEFnLKAMmGq
 enzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNsZY01CLiiwQxELfV3/u3FkeuTJYeyzwLTYzOZt3l5YMY3KMnY7E8aVwv6PrwQhIwJBTiTOVK8Gs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRHBsX5QT5DSha1KhlrfVb/Rlu/E5E0CH9sfdDa8PqYyYtmmjK
 /J+d9HIWOhrbldPsOK2ArZh46QQh6odxHnCLyPLAf6t7CzLbl5cP6z/B7kkJcow=
X-Gm-Gg: ASbGncuGx2NhQe8QIrqgHGI6Zs2pM9nLprynPyzdrIivu/x4thI7KJ4chOhMpCi4ilK
 Ieks+sPbBp11MiZ1mEGqpLmPBj/ZbysUeFD3Yf7/2dI8ukLwC0EuJ+9j+TYjrdfPfL3cL1T8QFx
 DBc530rXdCrkyzYhV8oSzlbcxu8KwlccbJsj4tCH1mH38DCAj4HK2aVub5GUQPtLUc+WaqVZ1zL
 udV509NOQzKybXAKTAgRND38iSLpyfFp1wHOnNqchNpAkbxboabWrS+28kXpqvx03IpF5m3ziV0
 H27U46TUCtb68cF7JH4wpix7dPEE2WUgYd81
X-Google-Smtp-Source: AGHT+IGVpxl0k9hRIyiBC+nX9q01hRzKPekN79eTtXLIY4DaSMy9S0MrmJK/hCW8fezYBdyI4HazOA==
X-Received: by 2002:a05:6512:3b0b:b0:540:2a92:7dac with SMTP id
 2adb3069b0e04-54229532e69mr12026183e87.17.1735562823897; 
 Mon, 30 Dec 2024 04:47:03 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5f1asm3126558e87.35.2024.12.30.04.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 04:47:02 -0800 (PST)
Date: Mon, 30 Dec 2024 14:47:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 09/17] drm/bridge: analogix_dp: Add support for phy
 configuration.
Message-ID: <hfqoxolgga3t4fmdeo5dmqvqiiptraqwmzwdpfhzmmw2cnsail@yamn7ms2tp6x>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-10-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-10-damon.ding@rock-chips.com>
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

On Thu, Dec 26, 2024 at 02:33:05PM +0800, Damon Ding wrote:
> Add support to configurate link rate, lane count, voltage swing and
> pre-emphasis with phy_configure(). It is helpful in application scenarios
> where analogix controller is mixed with the phy of other vendors.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

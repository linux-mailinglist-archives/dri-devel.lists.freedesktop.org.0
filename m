Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7A55435B0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 16:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D956E10E104;
	Wed,  8 Jun 2022 14:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05F910E104
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 14:54:06 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id z17so6204456wmi.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 07:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/UVSlpPd3rsOTMDlQ1ZyeboYDpPQXRxEscJnVQE7aXc=;
 b=NOVyZ0ybVuagM0hyY5lUQmNY5Z6tlfSssVLuHrioj4pFXSStCE299BtFou21UZk/8m
 VepKg6OpRednAFUOH+DrFvmLI9yOlC/IAMdYiSfQ6UOc7UJzfTqtO3wrZhRQ6Y3PkLuY
 gqjs0vLD5jjUsL/mscM1fXT35tsnMSwcomlX6a9/g3w8TXZ3R497MNNJCeBYOYZ22HGL
 9l/NPiOWTrux+f9ruw4K5CJf1Cr/GWmk6hkYBSp06qahIqkm03PO9JisT+Q0fZgMrbut
 ZpW2yIjJYDnnTb1+8qLVNW55t1H1tePx44wBwq4uu593J2cdba146uVXx2JRI0sZqR7f
 x2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/UVSlpPd3rsOTMDlQ1ZyeboYDpPQXRxEscJnVQE7aXc=;
 b=nX8c5f6xl21eE4eWYO6NK+aboA/XCtBoWRhrXgxp/6ryJX5cwzzlKQrW42IuZsZ1HL
 jMtMvhTd6Hr6POClS1Gw37T+Qzg2OGmZ2pcnYLuG+DrUD3ny4yNRtTlU0XgrU0iDD+kK
 pmIYswvoOzJNuLiqLhZjuInSOSQBVaBh1TC5u0wKs9rLFQ/Tx+NX9oKFGrSWM2CKNsB8
 ag3D+aHJYprt+hg2MGPMd2Tv/xFAHZc5AwS/lYMAMbuLAnL0r4kSobJMXy4QkUtSsk4/
 sk5Cry0TgzoV5hVOIn0Qt9vqMEEfDWrXzb8ojIr07T8HRgj4oWfMwtkIb2dqOk6a07W3
 2AxQ==
X-Gm-Message-State: AOAM530c1yzD4vilqUntTWu5glzUxtzSxJ+0pPIohsAWF0+lvNbxgBEz
 2imjJ3csTrEHkyGwQQUC/LQlNg==
X-Google-Smtp-Source: ABdhPJyEA+RemPKIQuk742PCiLnKJ52To3H1lPVlBXw0lq0Iq7rdYqBME7INiy/5snTFyMG/KiRGTQ==
X-Received: by 2002:a7b:c354:0:b0:39c:6753:21f8 with SMTP id
 l20-20020a7bc354000000b0039c675321f8mr707309wmj.113.1654700044185; 
 Wed, 08 Jun 2022 07:54:04 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 m19-20020a05600c4f5300b003942a244f2esm30757054wmq.7.2022.06.08.07.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 07:54:03 -0700 (PDT)
Date: Wed, 8 Jun 2022 15:54:01 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH] staging: ftbft: Use backlight helper
Message-ID: <20220608145401.qaycvdfc7ks3bbx3@maple.lan>
References: <20220607185516.1129900-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220607185516.1129900-1-steve@sk2.org>
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Len Baker <len.baker@gmx.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 07, 2022 at 08:55:16PM +0200, Stephen Kitt wrote:
> backlight_properties.fb_blank is deprecated. The states it represents
> are handled by other properties; but instead of accessing those
> properties directly, drivers should use the helpers provided by
> backlight.h.
> 
> Instead of manually checking the power state in struct
> backlight_properties, use backlight_is_blank().
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Noralf Trønnes" <noralf@tronnes.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Len Baker <len.baker@gmx.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-staging@lists.linux.dev

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

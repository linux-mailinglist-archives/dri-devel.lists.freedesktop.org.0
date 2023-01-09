Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C061C6622EF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB1B10E3BE;
	Mon,  9 Jan 2023 10:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6318510E3BE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 10:17:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 g19-20020a05600c4ed300b003d9eb1dbc0aso3266016wmq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=D3sOlEh1WygNZ9VgKuMT1nyO+XwDijk/5Tq8drEBoAk=;
 b=MFsTsxkaZ1UIaBLLEtyfh6RzAoMnlZIPWc2WNX24+naYBw+7xbHepz8S0WIRSWvs1Q
 hFGnYAlOMC9nu7Dq8xrrL4T2gUcRQt0bt83THvKOHhC0DVH6vvLjMs2MAcBw909AJiRS
 qMCN+qyQ6vUnwNU3U1UBVFGfJPTey2337q681pGCUpaC6Inskp054voPJpa9s6Qla3o6
 4w8mPTO5r+A4aMr+Db/R86sLp8lJq3fNYQbV3tiDS9C6kYt5zGgwblJo3f2/zIo6mrC5
 hJy64lNfExzMNmb+xszSBOLj+2gPktUJZXWKdc9QtM36BOQLMe7I3ZOxN8IY0tak096M
 18+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D3sOlEh1WygNZ9VgKuMT1nyO+XwDijk/5Tq8drEBoAk=;
 b=lY77mLmgfSh0WGC/HfOsCdSXUvhT4S8/q97nqNASYBYf8dZHr4+P7y0I5mTqIPzWAF
 kvg/llnr+54n0W1PBmo3Qk4YclLXcssrsjkAEjRt8Tw4QER7EbcJEPToaPNDEmui11wV
 skLiOx08JAblrMnuGCGDlQ+e1LDygNkE2bGkv+tn+7RXrRZ4cIho8U2/yUEI853vsPiT
 yJEMaYBZ0OGQHoUb3SxSs4aEvLVGiiIlafMLdQuubpRCFk5kGNxEgHXWAAMhU2q6zOSc
 tezf/aXrAGViInOOqMJlM3Tr2mFKXQ0JbVsimVwfqx3a19rRgkzwPACz+oPnp/+IpdK2
 dPNw==
X-Gm-Message-State: AFqh2kp+6eUoETAnbhjfy+jWdVoAMVQgfDjqFCrqFyoJeB5uIdiH/6bc
 IHmd7imDp2BRmBM0hE4zAGQkXg==
X-Google-Smtp-Source: AMrXdXsqG2Eq26xzrbOkrTahh2oj+h0pui/EEw14ypYWszSZeNLm98tUrOlKsZ9KmBa27ZomvzRi5A==
X-Received: by 2002:a05:600c:a4d:b0:3cf:6e78:e2ca with SMTP id
 c13-20020a05600c0a4d00b003cf6e78e2camr49520896wmq.5.1673259444880; 
 Mon, 09 Jan 2023 02:17:24 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 bg23-20020a05600c3c9700b003d1de805de5sm12213442wmb.16.2023.01.09.02.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 02:17:24 -0800 (PST)
Date: Mon, 9 Jan 2023 10:17:22 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH RESEND 3/4] backlight: ipaq_micro: Use backlight helper
Message-ID: <Y7vpsigT9EUz9FWn@aspen.lan>
References: <20230106164856.1453819-4-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106164856.1453819-4-steve@sk2.org>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 05:48:54PM +0100, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
>
> Signed-off-by: Stephen Kitt <steve@sk2.org>

For the tools:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


D.

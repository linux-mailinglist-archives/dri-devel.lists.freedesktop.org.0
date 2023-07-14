Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7496B753828
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A19710E862;
	Fri, 14 Jul 2023 10:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A180F10E865
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:29:55 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fc0aecf107so15989605e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 03:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689330592; x=1691922592;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Mh5IM3hcbkTlsZ0QohBnPm9+/WljTdptQDAe3KRHGao=;
 b=O5ufoN9bQiWKXDmCStIX+Io10WRu2B69Deqb5KVzrXV2sqgY9JCnNvyATagBuE+ark
 IS32r2PfYWd5XlLUlJoSJAAAXm5+hxTEjMb0ZCe5fK3NGofpUv7OKY9G8Xf6nBs65XhV
 mN24wwtq2SFoDgOh1XzRQP48JVgtE3qQg6DtMC8WgMhj9t2D3law3WPvQE1ujYDEF2HF
 HQ2Wfv1wVIeu2S+ZqWDReHbCASDvhIqXVdLZ+6qiMuNgb/mQI71489JITRwjOarUlIKd
 T4bv/caHqvEm2PmjsCWaoXFBLjd4pTJ0r4FnJChubfG5R2bSvz1FrPJ8nXiDNobJSVlf
 ylLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689330592; x=1691922592;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mh5IM3hcbkTlsZ0QohBnPm9+/WljTdptQDAe3KRHGao=;
 b=lA9xSIAD10NxxE0+zVGjZn3+jQMLloRgRCMTPFR/ztTwuWcp0XMlru7vMuebsRtK2+
 35l+39vFoby/CGh+77B2B8yTWWACXaQfaod7dGgf2O3GxNLda+NGB85BGEP/vDO1h4wY
 ectViPunfISnDvo7iaDtE5wMYlSGiDcvCQ2mQC4ykSn3EWevR6BtFme5nzGo0KWM9sZn
 W94BhVvgNQNLMEt2HJ6UxlurXFYPvINHJjFUqmQ0IL0L6STai46xa+YRAUnpqrO6mbmp
 d35VitxL73ZkNwuxOqAIh5hf8669EAMYWqoOtIVnWHSh7h90jqUIuGA0ujJsO5cJtJ34
 r5og==
X-Gm-Message-State: ABy/qLbSDROK5ShC3bhKnCpZaFpCiFnDf2dwTW0jCyWx4UlAM1pykxkd
 noXIwz3f7L/pLmXSaDrlWoiSsA==
X-Google-Smtp-Source: APBJJlFnsQ9uvLjsHZQ9SREHQ216HPPGjASy9AiZYJZlWwyGhQieiRuOjHKJ7s1mAu1WpSfMQoCtmw==
X-Received: by 2002:a05:600c:2254:b0:3fa:984d:7e9f with SMTP id
 a20-20020a05600c225400b003fa984d7e9fmr3534844wmm.6.1689330592448; 
 Fri, 14 Jul 2023 03:29:52 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 p26-20020a7bcc9a000000b003fbb5506e54sm1094832wma.29.2023.07.14.03.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 03:29:50 -0700 (PDT)
Date: Fri, 14 Jul 2023 13:29:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 00/18] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
Message-ID: <b3c23ea3-f46c-43b9-b12a-9f55de2294c6@kadam.mountain>
References: <20230714075155.5686-1-tzimmermann@suse.de>
 <CAMuHMdWoeyJPAgPgFi545SJFcaVCgZi1-zW2N5cBeU9BnHgo1w@mail.gmail.com>
 <47a3ab8d-5e8c-db2c-fcde-5c2b1bac32aa@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47a3ab8d-5e8c-db2c-fcde-5c2b1bac32aa@suse.de>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 kvm@vger.kernel.org, linux-sh@vger.kernel.org, deller@gmx.de,
 linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com,
 javierm@redhat.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-geode@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 14, 2023 at 12:24:05PM +0200, Thomas Zimmermann wrote:
> > 
> > >    fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
> > >    fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
> > >    fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
> > >    fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
>
>
> I wasn't happy about this either. But I could not come up with a description
> that fits into the 74-char limit for each commit. They only differ in the
> method of memory allocation. Do you have any ideas?

fbdev: Remove FBINFO_DEFAULT from static structs
fbdev: Remove FBINFO_DEFAULT from kzalloc() structs
fbdev: Remove FBINFO_DEFAULT from devm_kzalloc() structs

regards,
dan carpenter


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EA44DC4B2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 12:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A46910E178;
	Thu, 17 Mar 2022 11:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D7610E178
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 11:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647516054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ooJ9GuDR1zDRA6wa1d+2YqoS6wsKS/sfV2gTAnIiGxs=;
 b=K/y3wYE5Kf+i+hJNcVhNUros1+pJaD+krNyBixqk0HX9mei6E0IL95Rn1g/dwMFrx8g1JB
 BWUqmlYP1/Siw6XIMaYxAYcWc46Pqgnr4H7Nr9nNJfMZGeF3kc33I/Vf8hPHaVhs59tKFf
 GNUo6Qs4Qr/A2wJKW4EHjh/z5D6IQbo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-TjrfDY66MBiFhCORL11Ndg-1; Thu, 17 Mar 2022 07:20:53 -0400
X-MC-Unique: TjrfDY66MBiFhCORL11Ndg-1
Received: by mail-wm1-f70.google.com with SMTP id
 o19-20020a05600c379300b0038c7117460dso1439925wmr.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 04:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ooJ9GuDR1zDRA6wa1d+2YqoS6wsKS/sfV2gTAnIiGxs=;
 b=mLAPbZNeSBl+yl1TY72xkd2wGnURZGLImdSAxbwww6n51lcYZfb/93kVW+9pzbSEDJ
 tFe8MzMA+b/CpVfuMz+ab++Ih9jwYNGu03wseGvrOdxQMKkIspZkqyHrbQ+wtrugKyZF
 II+ONBjhc024sHn3V44DvYAaSz4PmJw45aQ0eC7MQ66vwiiXPP3CFCj/7MzqXEkz7J8W
 BjnJbTkxcZZVApPJ42Op2GJuuGoAEyh88ZK7l0dalBHnetT3/L8CGBv02ITjdLQuNzps
 wCJ4RG6Dv16XFJpJqHOFcrYl9dw0JbiJR8fE0dvia+9/afg4bnUCGQSyNm8Fa4TBAQwG
 KSrQ==
X-Gm-Message-State: AOAM531aNLkv1bqjC2NrEQTd+RdikOdus0bltgTGFp52ZVp0DpvlXHxc
 7lvGNRhVlJces4ItkFb8p8teTtKQUeASIi6s80JaaI9/Ss+4GSoPOqGCLailZwhL2ogLkg3p4ul
 3kUoexc71HlSH5At2CTxC1AN+7MRY
X-Received: by 2002:a5d:52c7:0:b0:1ed:a12e:bbed with SMTP id
 r7-20020a5d52c7000000b001eda12ebbedmr3565756wrv.97.1647516051886; 
 Thu, 17 Mar 2022 04:20:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+noMHruT1Sne6ijibg7bHIXzxkZckSPpwOnAtzNb9wfj3uDW78GC2bclNntk+Vo7eA39oSA==
X-Received: by 2002:a5d:52c7:0:b0:1ed:a12e:bbed with SMTP id
 r7-20020a5d52c7000000b001eda12ebbedmr3565744wrv.97.1647516051687; 
 Thu, 17 Mar 2022 04:20:51 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a7bcb4e000000b0034492fa24c6sm4002044wmj.34.2022.03.17.04.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 04:20:51 -0700 (PDT)
Message-ID: <f867cce1-04dd-a87a-700d-343cc28f188f@redhat.com>
Date: Thu, 17 Mar 2022 12:20:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] fbdev: Fix sys_imageblit() for arbitrary image widths
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, deller@gmx.de,
 m.szyprowski@samsung.com, geert@linux-m68k.org, sam@ravnborg.org
References: <20220313192952.12058-1-tzimmermann@suse.de>
 <20220313192952.12058-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220313192952.12058-2-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 3/13/22 20:29, Thomas Zimmermann wrote:
> Commit 6f29e04938bf ("fbdev: Improve performance of sys_imageblit()")
> broke sys_imageblit() for image width that are not aligned to 8-bit
> boundaries. Fix this by handling the trailing pixels on each line
> separately. The performance improvements in the original commit do not
> regress by this change.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 6f29e04938bf ("fbdev: Improve performance of sys_imageblit()")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---

Looks good to me. Also Marek and Geert mentioned that fixes the issue
they were seeing.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


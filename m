Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449AD4C5143
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 23:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9160F10EAAA;
	Fri, 25 Feb 2022 22:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2572110EAAA
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 22:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645827058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WAHJITj5STzbbuF37W0DjncfQl4DVrBRuJjULvPB2II=;
 b=YHSh02Q9s/AUh/ssNjzYoqkHyD3vqtOEZ5UbCTCkyyFOdzG9MbzLCiUE5cT6wnmUv9M/Sz
 WWjjDxBWCnt9p6hCkWvyOfAlX2rV0HF32kVeEy6n5sVfbK1XYB1BgajveYCirN32lwh1MW
 50+x86gWup426S3efdOHAJuMZTWH08s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-NpYT0snANmCFll6xg2vszg-1; Fri, 25 Feb 2022 17:10:55 -0500
X-MC-Unique: NpYT0snANmCFll6xg2vszg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r8-20020a05600c35c800b0038118108e71so1995091wmq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 14:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WAHJITj5STzbbuF37W0DjncfQl4DVrBRuJjULvPB2II=;
 b=C7cTQ+CG1w9D7kkP6ZkZSKMpofilbDOjF0MftPBJlo2riI0e7EPIHQtVVy8N7Q30cx
 HrXQ46mfpoTumgRdNfrlQsr1DRvZ2pehNkg16OAgAHi+TRmu1J3MynUTOHRj/jflC9hB
 vA3O/iBj4NTGHKzLofY5v77Mbqefp57RIcKRuw22WE8LhpRgwPnbjnnWoIMrMEOP3zjV
 E9T9BpSgU6Du9w7MW/mNL97u//B9cR8tN5WYx1Y4wmMXXAAAxXpshegua5s6QZzgO4+d
 bUyJ/KSXFYXqRYJMIC0zr0mS7uClbHgFYFKn4I7UWQjugD/sTKFXzhVut94VR3KwYmx8
 PANA==
X-Gm-Message-State: AOAM530xTCN07Q1bHCOFESRlwbhREs4fYrRTARjSnhsObWBfCf8gXyl6
 /oaEM+OGMi5wFHCzj2wZiGz7cCHZcg7tS99zXIUQIS3FVTCSsf/bKsV9TbTC2MTex+BM25bCfH5
 xUxzEreZZuY6DJ+9rkVaipy+9jBOi
X-Received: by 2002:a05:600c:1592:b0:381:21b4:d1d8 with SMTP id
 r18-20020a05600c159200b0038121b4d1d8mr4424285wmf.119.1645827053955; 
 Fri, 25 Feb 2022 14:10:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAHm39sLaSq2pOYdrWxQg66pEwR/Bg1+VCOw5sY82fSKXIkbndkrbvrCZ8Q8iJZV1EJ/AdAQ==
X-Received: by 2002:a05:600c:1592:b0:381:21b4:d1d8 with SMTP id
 r18-20020a05600c159200b0038121b4d1d8mr4424269wmf.119.1645827053705; 
 Fri, 25 Feb 2022 14:10:53 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 x3-20020adfdd83000000b001e58c8de11bsm3544558wrl.39.2022.02.25.14.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 14:10:53 -0800 (PST)
Message-ID: <ae441f09-3d63-a731-fe59-06b8aafa0983@redhat.com>
Date: Fri, 25 Feb 2022 23:10:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 2/3] sysfb: Enable boot time VESA graphic mode selection
To: Michal Suchanek <msuchanek@suse.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
References: <1f13e6f2-a87c-83ac-7119-8632c8c8ac8e@redhat.com>
 <948c39940a4e99f5b43bdbcbe537faae71a43e1d.1645822213.git.msuchanek@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <948c39940a4e99f5b43bdbcbe537faae71a43e1d.1645822213.git.msuchanek@suse.de>
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
Cc: linux-efi@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Herrmann <dh.herrmann@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Martin Mares <mj@ucw.cz>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-video@atrey.karlin.mff.cuni.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/25/22 21:51, Michal Suchanek wrote:
> Since switch to simplefb/simpledrm VESA graphic mode selection with vga=
> kernel parameter is no longer available with legacy BIOS.
> 
> The x86 realmode boot code enables the VESA graphic modes when option
> FB_BOOT_VESA_SUPPORT is enabled.
> 
> This option is selected by vesafb but not simplefb/simpledrm.
> 
> To enable use of VESA modes with simplefb in legacy BIOS boot mode drop
> dependency of BOOT_VESA_SUPPORT on FB, also drop the FB_ prefix. Select
> the option from sysfb rather than the drivers that depend on it.
> 
> The BOOT_VESA_SUPPORT is not specific to framebuffer but rather to x86
> platform, move it from fbdev to x86 Kconfig.
> 
> Fixes: e3263ab389a7 ("x86: provide platform-devices for boot-framebuffers")
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> Acked-by: Borislav Petkov <bp@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


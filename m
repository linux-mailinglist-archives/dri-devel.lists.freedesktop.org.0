Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 855CF54DF39
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 12:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE19411A091;
	Thu, 16 Jun 2022 10:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF71411A091
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 10:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655375867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J4Im7qqtJg+OkPvUNRRwNhmKESdk9wiHI4QA3udmLJs=;
 b=UPDcMB5P/bcdQW9UPy/REk00mwfiUb9LF9yDHYKhMeoDPTJw1BKKP7X4AE/iBx8NUnwOgj
 XsE61Ilfx5Zd/yvC2H7nsb+CohLRF+AJ0M4LJAgVT54FscBiniVdN77Ai4ykaDrmvek192
 fhCHOxetAvH6aC/pZuRjMN5RBYqCmz0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-r0TcKaygNuGmNhXDuKrVQA-1; Thu, 16 Jun 2022 06:37:46 -0400
X-MC-Unique: r0TcKaygNuGmNhXDuKrVQA-1
Received: by mail-wm1-f71.google.com with SMTP id
 z13-20020a7bc7cd000000b0039c4a238eadso473137wmk.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 03:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J4Im7qqtJg+OkPvUNRRwNhmKESdk9wiHI4QA3udmLJs=;
 b=J+kD54526AUqNooCaBvmyIquDhBHPjChuahtz1hlEs0OmYnCRpyCody67ATJMuNjNW
 qollUDKDqpQ4wSeSkf91lcr30J1gsfaBDQsJCUdmrVY6ElMmmdwwFTlNdDWLQbMbgDNm
 6UaFfGlqfq+exizpk9VD666JGSUlvUy2wtIEWy/jhSZeOEsIYYWX0QrMv8Hg8BUIo0LK
 EZWBvg9wnervqyEIJA3VeFuom9NLZUuw4BFUL/GTMaJc2285KhM14FsAZPVkyM+ECGAL
 gDuj84eJSlwtPlekT4+kVqYie2QQRVyw5r6i+xSpoI8zxY22/OJcT3lgXHOFdBkETTFk
 G2XQ==
X-Gm-Message-State: AJIora8g+xP8yL5LKGxnV0B+ZAMe/c3DM4VHaF3ig8XI0yLCf5hgyzl7
 xSSM9PuYOAuYWMdo+60xFGuFUoXXpv4QHKimKYCqxKLwB0qkcJJ9bJe+1AaSkLyyntbIoFpg490
 7zPKl8mOE+I8qldl18ANGl+1TgF3u
X-Received: by 2002:a5d:4046:0:b0:21a:3a12:239e with SMTP id
 w6-20020a5d4046000000b0021a3a12239emr727136wrp.138.1655375865499; 
 Thu, 16 Jun 2022 03:37:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tKe8QhFukk5DuRS0DFbovu/e6hnkue7Hp7AplgOLr3QaxVqofS78klVurgegpOCp5LXQ+ADQ==
X-Received: by 2002:a5d:4046:0:b0:21a:3a12:239e with SMTP id
 w6-20020a5d4046000000b0021a3a12239emr727117wrp.138.1655375865248; 
 Thu, 16 Jun 2022 03:37:45 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t2-20020a1c4602000000b0039db60fa340sm5379369wma.33.2022.06.16.03.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 03:37:44 -0700 (PDT)
Message-ID: <add6655e-84f3-07f2-a01c-fb470d9fe532@redhat.com>
Date: Thu, 16 Jun 2022 12:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] drm/arm/hdlcd: Take over EFI framebuffer properly
To: Robin Murphy <robin.murphy@arm.com>, liviu.dudau@arm.com
References: <31acd57f4aa8a4d02877026fa3a8c8d035e15a0d.1655309004.git.robin.murphy@arm.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <31acd57f4aa8a4d02877026fa3a8c8d035e15a0d.1655309004.git.robin.murphy@arm.com>
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Robin,

On 6/15/22 18:09, Robin Murphy wrote:
> The Arm Juno board EDK2 port has provided an EFI GOP display via HDLCD0
> for some time now, which works nicely as an early framebuffer. However,
> once the HDLCD driver probes and takes over the hardware, it should
> take over the logical framebuffer as well, otherwise the now-defunct GOP
> device hangs about and virtual console output inevitably disappears into
> the wrong place most of the time.
> 
> We'll do this after binding the HDMI encoder, since that's the most
> likely thing to fail, and the EFI console is still better than nothing
> when that happens. However, the two HDLCD controllers on Juno are
> independent, and many users will still be using older firmware without
> any display support, so we'll only bother if we find that the HDLCD
> we're probing is already enabled. And if it is, then we'll also stop it,
> since otherwise the display can end up shifted if it's still scanning
> out while the rest of the registers are subsequently reconfigured.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> Since I ended up adding (relatively) a lot here, I didn't want to
> second-guess Javier's opinion so left off the R-b tag from v1.
> 

Yes, v2 looks good to me so feel free to keep my R-b:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

[snip]

>  
> +	/* If EFI left us running, take over from efifb/sysfb */

There are other drivers such as simplefb and simpledrm that also use
a simple platform-provided framebuffer. So instead of mentioning all
drivers maybe you could just have something like the following ?

	/* If EFI left us running, take over from simple framebuffer drivers */

And maybe you can also add some words about why you are checking the
HDLCD_REG_COMMAND register ? Liviu gave more context in this thread,
I believe some of this info could be in the comment.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


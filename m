Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FFD4D2FFF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 14:33:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2B710EACF;
	Wed,  9 Mar 2022 13:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D11910EAD5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 13:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646832833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IOaaETwHyO6EXDP09qs4E16KNNpKkz6jydXWMB+nH2Q=;
 b=HM8d45OWCLZMG0sY2Crud5FiGlM7f5d0X2lGyPAtQt6LBSoWbk4PemWJj5cupKtaOhLhEe
 uMGEhVgdi5O1IU8rMuBknwE49OMiHWMOeW7VmFQw7nxEa8EbRgcysxy2KDzFj+BQ06L9ji
 neKPdQBi3slbOY+mnwKl0xChK/uK/Mg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-f5k_A6uJPo2B4QDKXVVSuA-1; Wed, 09 Mar 2022 08:33:52 -0500
X-MC-Unique: f5k_A6uJPo2B4QDKXVVSuA-1
Received: by mail-wm1-f70.google.com with SMTP id
 d8-20020a05600c34c800b0037e3cd6225eso796707wmq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 05:33:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IOaaETwHyO6EXDP09qs4E16KNNpKkz6jydXWMB+nH2Q=;
 b=7mnYllqLulq9eDkULDxdj5FK+Ra4CjT41praAcfHuf2JEbpkppOIxEZ8irdiAZoAdK
 d5oU1TKSGrikkDtjyamXGOv05Td7tYOdlkIX4ghBDVvcjU1V7Jy3ngvtSHuYT/1SyNSh
 sIy9GrgJIT/DGMtNe4I61hZYLNhebe+lqRYoZp+Za6c97ZH0A1Gue28p1lFnCNFJaf//
 AvKgPHSCP3fy9k45yh9LF5J+pOPxdUitEqB8jsJ9UlXxYTd9+x6me5lPEC1akc6rfZPC
 vtOhlOChAIA5cbpSBg0d7g6sWrqNR2GOgBt7HTfgJvZRDSJp5MSHeRA1S6Zkz8hHKhkj
 zTWg==
X-Gm-Message-State: AOAM531RfKmKNL2QGl0FMjyXFiydk+n0v725APUDKfDh8RaihWhB7+Gm
 AkVeFh7DGpXUj5oD7+2AWXVrwiUmE/Ubhi/v/MBh/81rPyZlkcBcYMUVmJFQIFXDuzcs5ne0XpC
 AeKPZfmG9s7GEHvwycKxV0D+4JmBU
X-Received: by 2002:a05:6000:18a4:b0:203:63e9:3e52 with SMTP id
 b4-20020a05600018a400b0020363e93e52mr7208817wri.192.1646832830938; 
 Wed, 09 Mar 2022 05:33:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw39VeeJL2sLF2yNLhIAAzipl//IMHBr51izsAjQZj6VqCMsVOEfSQoR8CT5v/PXd09VKNfrg==
X-Received: by 2002:a05:6000:18a4:b0:203:63e9:3e52 with SMTP id
 b4-20020a05600018a400b0020363e93e52mr7208790wri.192.1646832830663; 
 Wed, 09 Mar 2022 05:33:50 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a5d518e000000b002019c7402aasm1732693wrv.25.2022.03.09.05.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 05:33:42 -0800 (PST)
Message-ID: <88ae42f3-8e56-75e9-b1c0-abefe3496a8d@redhat.com>
Date: Wed, 9 Mar 2022 14:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 RFC 08/10] drm/fourcc: Document that single-channel
 "red" can be any color
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
References: <cover.1646683502.git.geert@linux-m68k.org>
 <585dc03acb4016bba910e7d15fec3ef4f0aec5b0.1646683502.git.geert@linux-m68k.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <585dc03acb4016bba910e7d15fec3ef4f0aec5b0.1646683502.git.geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/7/22 21:52, Geert Uytterhoeven wrote:
> Traditionally, the first channel has been called the "red" channel, but
> the fourcc values for single-channel "red" formats can also be used for
> other light-on-dark displays, like grayscale.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Yes, I learned that "Red" actually meant just a color channel
that may not be red in one of the thread about fourcc formats.

So I agree that would be good to have a comment about this.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


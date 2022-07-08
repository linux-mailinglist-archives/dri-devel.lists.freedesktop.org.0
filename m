Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FF756C115
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 21:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAD010E104;
	Fri,  8 Jul 2022 19:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CD110E104
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 19:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657308518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x1DAicwEAPXBRBMe3z1xdAg47wBYVrbByTqaE+qHnm8=;
 b=WS5ojyfJxt3oO1WwcoiqdZlmy75S/9aGeUjF1iI9gISx+PfskCLtLd7KFV+UbhVB7RVY7b
 DI0/bHX6JLTNi+yiJG0jnJdnV46IrLlUM4FtB9E0489IKmcO1MJBk7/J2HVKTEuAprQ5q6
 fFoxxDSFJ3mUXbFHIFmGjcwTChySxlo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-3gHTIyEIP86Yge1jXkf3pw-1; Fri, 08 Jul 2022 15:28:35 -0400
X-MC-Unique: 3gHTIyEIP86Yge1jXkf3pw-1
Received: by mail-ed1-f72.google.com with SMTP id
 t5-20020a056402524500b0043a923324b2so5124222edd.22
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 12:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x1DAicwEAPXBRBMe3z1xdAg47wBYVrbByTqaE+qHnm8=;
 b=1L9qBv87q6oN4NG79x0b71yxndgtq/nkc8rn/ckBrr4b8+0w4bPrOw7qNyPtXCj9OZ
 7S7XvMbbfKFPpDpIdEKsvKUn76CPylU6N4l9irp9uyj6XIdOwPDedM6A+NXIHB0EaIBp
 xDVei4Qua66Rx3pIKMmf0AYXqCTrzH3+8SIrRp1yL86++1l+4OVHITCLVcAJverlz1xa
 xwdeXXIYfX4JHbHWi+Id0KcrAtacfUo2BKuLB7tbJzOF4YYPKvn4+serXc4tjW5qMl13
 e5mcjq0XIR/3fXm8cS4GTTG3I6KLLFZbo+Rb2hI0pFpWCjqnvjEjYzkI7hwluz/rlciz
 lJoA==
X-Gm-Message-State: AJIora/LB3pnAnQz39eiDlL8eMqxQ5leRWrbxjSRa1LOHqvJ5BTHfdSz
 UxBBVsV0df6L4FU16F9TK87New1U19xeQiju5CvPKKPHMhT65VTNDmO0k1f0dNsUFuytTmnVJN6
 k+IdssksZsGIHY/TSM2Zw8EpbdKc7
X-Received: by 2002:a17:907:86ac:b0:72a:fc15:98cf with SMTP id
 qa44-20020a17090786ac00b0072afc1598cfmr5087118ejc.474.1657308513965; 
 Fri, 08 Jul 2022 12:28:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tkr+qWhrSzebZjZZfUfQqb4WSOleYalB7Ps0X+jp4B93iKsB3HUIVAIpQMdnYN+LbhqwjjIg==
X-Received: by 2002:a17:907:86ac:b0:72a:fc15:98cf with SMTP id
 qa44-20020a17090786ac00b0072afc1598cfmr5087099ejc.474.1657308513789; 
 Fri, 08 Jul 2022 12:28:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a1709060f5100b00705cdfec71esm20550294ejj.7.2022.07.08.12.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 12:28:33 -0700 (PDT)
Message-ID: <b7d937bc-d7c3-6f7a-047c-fc6e5756a5a0@redhat.com>
Date: Fri, 8 Jul 2022 21:28:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/5] drm/modes: parse_cmdline: Handle empty mode name part
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <cover.1657301107.git.geert@linux-m68k.org>
 <64e2e9b14c26df28908789374253fd12072c26c2.1657301107.git.geert@linux-m68k.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <64e2e9b14c26df28908789374253fd12072c26c2.1657301107.git.geert@linux-m68k.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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

Hi Geert,

On 7/8/22 20:21, Geert Uytterhoeven wrote:
> If no mode name part was specified, mode_end is zero, and the "ret ==
> mode_end" check does the wrong thing.
> 
> Fix this by checking for a non-zero return value instead.

Which is wrong to do, since now if you have e.g. a mode list
with:

"dblntsc",
"dblntsc-ff"

in there and the cmdline contains "dblntsc-ff" then you
will already stop with a (wrong!) match at "dblntsc".

> While at it, skip all named mode handling when mode_end is zero, as it
> is futile.

AFAICT, this is actually what needs to be done to fix this, while keeping
the ret == mode_end check.

Regards,

Hans


> 
> Fixes: 7b1cce760afe38b4 ("drm/modes: parse_cmdline: Allow specifying stand-alone options")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/gpu/drm/drm_modes.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 14b746f7ba975954..30a7be97707bfb16 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1823,9 +1823,9 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
>  	}
>  
>  	/* First check for a named mode */
> -	for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> +	for (i = 0; mode_end && i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
>  		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> -		if (ret == mode_end) {
> +		if (ret) {
>  			if (refresh_ptr)
>  				return false; /* named + refresh is invalid */
>  


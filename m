Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC23388F40
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 15:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16406E588;
	Wed, 19 May 2021 13:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E326D6E588
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 13:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621431447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bU4pryl0+5U5KV31mW2OweQfTQ6FVvGmzl3RdTyAV38=;
 b=EMrNeZLxc1QI1CtG/j+3AQR4VhE1xcRFAw7YN6Dyfnq+5MjdjG7s6ynzrAhNl+6j+c2CKn
 h1Q+cWcHkjS6tYyvhE2Pa7PtGLljixmI99efF/mqPjMksaHsWh9KSmcPn6gvKDhxYkxj+Y
 f3xco9nx9Iezpu1nTfNz+Ow8IgFObdY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-8nGNQvrIN9-lcij4ilNSrw-1; Wed, 19 May 2021 09:37:25 -0400
X-MC-Unique: 8nGNQvrIN9-lcij4ilNSrw-1
Received: by mail-ed1-f69.google.com with SMTP id
 w22-20020a05640234d6b029038d04376b6aso7656856edc.21
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 06:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bU4pryl0+5U5KV31mW2OweQfTQ6FVvGmzl3RdTyAV38=;
 b=FwMeKODzEb69R5D6lDJDcwR+JLWSBpyU5b5av+Ra9DfHJEd14xDPCLZ1Cdjb/xOppN
 tNRLQTbFwWOiWXggnWtlTz/3kgnVlMInd/fsWEO1Y1Q5mGAFpBzTm2FX8P9+2dnUfFNy
 rofWDm9UYPg1qcfUXdck2RJJr4snn/DCI6Y67sRsPGiFdpYm6pkr5DcUNbpU8ShYdAQT
 IgU7qPrcNqI5+8oPAwWoJNHS3tUWY4O1fZ47oGE020gdkd9Y30PiaZ2lMbHZzwKSpxx/
 lg9OJTQCu8pe0y9sla8TuzrMBb7hzEzqvZJuqJvyMGlGCg9DtO5YNn6ojoZy/ef+AubR
 nZFA==
X-Gm-Message-State: AOAM531ogHqOFcO32bzkfBYALuew/GLtqnANx0EgunJhnHc0IUKx5xUB
 e8/ePIavYGQ003fuX4afo1b6DZT2eeoBKN+MS0Af/8h+DqP/KLjjJqnErOkKgPoluTHRwSTNIQT
 N8ewmH1M1fJi3fxv1N+4NGJ6TYxaJ
X-Received: by 2002:a05:6402:3098:: with SMTP id
 de24mr14306457edb.339.1621431444237; 
 Wed, 19 May 2021 06:37:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtmP5ppUfGnIYTS3emu23ErVRxU0Y2zdN/m68QRjcWJURyvbcDG+r+AD2UiWx7vPUAM3F1gg==
X-Received: by 2002:a05:6402:3098:: with SMTP id
 de24mr14306432edb.339.1621431444058; 
 Wed, 19 May 2021 06:37:24 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id a7sm4664820edr.15.2021.05.19.06.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 06:37:23 -0700 (PDT)
Subject: Re: [PATCH 9/9] platform/x86/intel_cht_int33fe: Correct "displayport"
 fwnode reference
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-10-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <2d02c9ba-1385-41cf-6150-ca8ed5e835ba@redhat.com>
Date: Wed, 19 May 2021 15:37:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210503154647.142551-10-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/3/21 5:46 PM, Hans de Goede wrote:
> The Type-C connector on these devices is connected to DP-2 not DP-1,
> so the reference must be to the DD04 child-node of the GPU, rather
> then the DD02 child-node.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Since this is pretty much independent from the rest of the series,
I'll take this upstream through the pdx86 tree.

I've added this to my review-hans branch now, and it will get added
to for-next from there.

Regards,

Hans



> ---
>  drivers/platform/x86/intel_cht_int33fe_typec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_cht_int33fe_typec.c b/drivers/platform/x86/intel_cht_int33fe_typec.c
> index b61bad9cc8d2..d59544167430 100644
> --- a/drivers/platform/x86/intel_cht_int33fe_typec.c
> +++ b/drivers/platform/x86/intel_cht_int33fe_typec.c
> @@ -168,8 +168,8 @@ static int cht_int33fe_setup_dp(struct cht_int33fe_data *data)
>  		return -ENODEV;
>  	}
>  
> -	/* Then the DP child device node */
> -	data->dp = device_get_named_child_node(&pdev->dev, "DD02");
> +	/* Then the DP-2 child device node */
> +	data->dp = device_get_named_child_node(&pdev->dev, "DD04");
>  	pci_dev_put(pdev);
>  	if (!data->dp)
>  		return -ENODEV;
> 


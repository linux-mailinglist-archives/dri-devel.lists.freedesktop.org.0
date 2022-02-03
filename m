Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386AE4A8931
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 18:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABBA10E5CE;
	Thu,  3 Feb 2022 17:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566DC10E5CE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 17:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643907673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uWelSesyHodlgNyGgdymB1gewVX3YStzd4fuolbjk9I=;
 b=F/eugD/R/s4MHcChmY9jtNuHtaVOx/w78Hpy21QTT1mX96ymf7eEuKcEtAR9ecNZLjpncB
 Cp3cVn6nqyVnLy1ys8KF2LSgLGWJqDjf8f25M6gTVBqq/QikFVfC+viXiLjnCT/zoqgUoB
 GmIToukTyt/tTwPsKQCfVW8dM26Dhfg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-G9rBc8RtMaa0vwkBvMqqYQ-1; Thu, 03 Feb 2022 12:01:12 -0500
X-MC-Unique: G9rBc8RtMaa0vwkBvMqqYQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 a6-20020adfbc46000000b001d7370ace6eso906769wrh.9
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 09:01:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uWelSesyHodlgNyGgdymB1gewVX3YStzd4fuolbjk9I=;
 b=62GSPv6Cnj9lplmqZg9yJAmthzQzk8IwW1vCj0R1KSU7S0sw5enprcFC0N+bM9/SYn
 lA+G39HW/a7OZ7UdNYVOhAaBKHw94tzvszQxSJ8GUPLLE9d9jEfmi9z1h6N6Eam6D0Nl
 QHoFDzMv74Z4qTpyfAdZtjJXC/QNbvY7O6icvxHfpiGPRN2VDRctN2dg+yBnoWsOXoK6
 oy9K3TsrKLiow8lx0opnqpnAHynz/9mU078HiBjLtKnZzs7R3WEANK83JwQeJLTnekZ0
 EA5h9/QRU5iza/kcp9hS6fq6e37UlSzuS2S2e8/IhMTxPAnyewtyqTk5v3g7wi3WwZXJ
 m3KA==
X-Gm-Message-State: AOAM531KQjP3DLgX9ybfs2Gtdo8MBnWY/ouQV4A1VU06Ndlsu/yjqAki
 dFptJxcVvUFuTiJXgXacA+megS1DqLq1Uh0HiqlmLfvt3RZ+blGG1+ChZfyn9/Cp8UtV1tb50fP
 0gPgvIIjUmh8vtC7uN07bioAvu0vx
X-Received: by 2002:a05:600c:364f:: with SMTP id
 y15mr11374939wmq.125.1643907671112; 
 Thu, 03 Feb 2022 09:01:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwziNfFxdQES4HEG1zpisqFX2sCu+12Fa4hfXlFDrv8buldpPidFjzGAHBnA7I+FsIZX/fnpw==
X-Received: by 2002:a05:600c:364f:: with SMTP id
 y15mr11374921wmq.125.1643907670935; 
 Thu, 03 Feb 2022 09:01:10 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id 1sm25188421wry.52.2022.02.03.09.01.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 09:01:10 -0800 (PST)
Message-ID: <12351f95-91f1-8ce9-257c-857818a10da6@redhat.com>
Date: Thu, 3 Feb 2022 18:01:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/8] drm/ast: Remove unused value dp501_maxclk
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
References: <20220111120058.10510-1-tzimmermann@suse.de>
 <20220111120058.10510-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220111120058.10510-5-tzimmermann@suse.de>
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
Cc: jenmin_yuan@aspeedtech.com, tommy_huang@aspeedtech.com,
 dri-devel@lists.freedesktop.org, arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/11/22 13:00, Thomas Zimmermann wrote:
> Remove reading the link-rate. The value is maintained by the connector
> code but never used.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat


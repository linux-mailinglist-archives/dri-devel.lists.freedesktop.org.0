Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F6F4AEDFC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 10:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9CD10E6AC;
	Wed,  9 Feb 2022 09:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B8C10E696
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 09:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644398811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JCp6XE7j+JLaNG3FyXBcvvob49a1fUjDSBM8HMYml68=;
 b=Y4camNqI5nf3M/qjdxWMqee8yPmAKw8a0FNxxZp0ApsNSl2T8+Q/HoSkDbiXFb0s9hk7qY
 zD82seyvbZLqks78joOT9fjvQ0Q2IkCRXD/5QnitkX0vcWOwxJXtzhHs5gpzsorHt0+L7f
 rFraDuC+BIENrIjRXPmtkV87EG+u6lc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-40rk7yr4NuiGg5crgysHsw-1; Wed, 09 Feb 2022 04:26:51 -0500
X-MC-Unique: 40rk7yr4NuiGg5crgysHsw-1
Received: by mail-wm1-f70.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so243277wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 01:26:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JCp6XE7j+JLaNG3FyXBcvvob49a1fUjDSBM8HMYml68=;
 b=SzK59W181nJYUrV3Rp4yjH1fr0Ohz7t2uRToeHeQ1czSJU0oxbM383jy07CGbepySA
 bXKFqLWJu+HxFuizD/nJXHV5zrELzKnquF4gLbMqXDFh5gL/O1IowDRPOmFtU7qHMk57
 kfsKhQrdmYWoJ2HvEjowxRCLQMxCKW2IIbCi2ESB9W5GA0jwf6QbxFfEeNqiw17nYi7A
 SCcWTr1Wkh6xgLEA9uKtrqXqINlviFHf1emnhUuruougqGL4fVr1Mr5Xe/JuTvM1p1vm
 8fJ3XPlguemMdIew/O45PLTbdW7HbrmjxTWvImS4YryYzwr7yJWvdw/iW8VKBABmoYrF
 UAUQ==
X-Gm-Message-State: AOAM531pmqmbVW56SPDlBdVuaRD9rojcqb3l2DA0gC1+mjGVbVNiQbNd
 UUBiw/wD2ysHR9YtuozCwfK7OR23xdBeYbZPuNKLL4c5nK3cXsHXMP9Qu+QyI5razn3mTv+ZVm8
 8VSWqC/tmtR9kdHvnlQnXcJRsuRer
X-Received: by 2002:a5d:5112:: with SMTP id s18mr1264188wrt.296.1644398809815; 
 Wed, 09 Feb 2022 01:26:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAO4wnIGn2LFNuhtbLiD8ExuQm621fpN5xLqi0LFeQpL6SEOBzuEpEbxZ3RQGvxqNPQ7DVbw==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr1264174wrt.296.1644398809597; 
 Wed, 09 Feb 2022 01:26:49 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m6sm17580545wrw.54.2022.02.09.01.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 01:26:49 -0800 (PST)
Message-ID: <923c1fb9-ec5d-8b6b-96d8-3af6c1c4c8bc@redhat.com>
Date: Wed, 9 Feb 2022 10:26:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] lima: avoid error task dump attempt when not enabled
To: Erico Nunes <nunes.erico@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220205185909.878643-1-nunes.erico@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220205185909.878643-1-nunes.erico@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 lima@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Erico,

On 2/5/22 19:59, Erico Nunes wrote:
> Currently when users try to run an application with lima and that hits
> an issue such as a timeout, a message saying "fail to save task state"
> and "error task list is full" is shown in dmesg.
> 
> The error task dump is a debug feature disabled by default, so the
> error task list is usually not going to be available at all.
> The message can be misleading and creates confusion in bug reports.
> 
> We can avoid that code path and that particular message when the user
> has not explicitly set the max_error_tasks parameter to enable the
> feature.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---

Looks good to me. 

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat


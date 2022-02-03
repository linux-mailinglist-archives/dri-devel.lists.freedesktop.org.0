Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 367C24A81C2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4F710EBB4;
	Thu,  3 Feb 2022 09:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6535510EBB7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 09:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643881732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zjlFGS5Mvi63vMgKi8Q4hmjSoRkInrvynkxdhZl+LJQ=;
 b=BJB4ro27cbPh9rIGQKxzDyoDC3TgEPjAlgZ1vFQabohmnJHsrGFqdnfq7gBxx/1rU+/yCB
 G+PNFNdekouUrJ8je42Q1TiEBeqV9/nqgdz3Xib1imf3OFCGOpQp7PE0r7W40t+TDpj+1a
 gI4Csw/9Ge6pzE9y7nXvx6v9DLNFQI8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-_q5G8bimNGuzCMspkupIMA-1; Thu, 03 Feb 2022 04:48:51 -0500
X-MC-Unique: _q5G8bimNGuzCMspkupIMA-1
Received: by mail-wr1-f70.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so445907wrh.23
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 01:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zjlFGS5Mvi63vMgKi8Q4hmjSoRkInrvynkxdhZl+LJQ=;
 b=1pTVk2HiC/mN5/Ssvj0PDb8GZZ4t9sZw3YTWJ0QtdtFxUJ6ly2oD6QixUo+UKR2sfU
 IBlnojSClgLAutt6Al4MeVQsF+Wf7leT8PhF7BVPNS0KkS0yu7DBqk8WLxJZJOXRnRRA
 V4zMEjJcxH5hFJPDe8NLwWiheSQ2HSR4t3kuUc2Ogr8nkthHlSIm2BMrXMnTs1nfI94Q
 rwvHramqEEsyem7c0/cHoLRNN2aj9LuhauGETfpv4+XU4/1uPkAfZMawNtOFZw1NNcui
 fj5yMw61NVhxGvgRwqrPD0siDMl5iAy7ldSuTGPgU0BAprGQaVyRKORUmsmdvUFPm3nD
 H3zA==
X-Gm-Message-State: AOAM531ySvBZeRE5CxgEt8FD4irXLVIdAU/rrtg9RAILTTIUuE7/Q1ac
 y6hfaFda5+YNqSgikHsZ3jl6S89mCcF1y5D37CeMbZbmwJfUzE4TMe+CM50NcjTrzLKBzPwFYSK
 Irnlt0y2aIcJ3k05lh0PwzU5IaDVt
X-Received: by 2002:a05:6000:178b:: with SMTP id
 e11mr28279200wrg.634.1643881730020; 
 Thu, 03 Feb 2022 01:48:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCfByAnwt0+QCw28tX5jz7T5FezUoJzhZSEwF3KWTRmBT/mVXbBSLpAc2FbwpKa4dK+ZCk1w==
X-Received: by 2002:a05:6000:178b:: with SMTP id
 e11mr28279186wrg.634.1643881729832; 
 Thu, 03 Feb 2022 01:48:49 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id r2sm8738549wmq.24.2022.02.03.01.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 01:48:49 -0800 (PST)
Message-ID: <dda9c983-f813-258b-ca6f-77c0d43fe2d4@redhat.com>
Date: Thu, 3 Feb 2022 10:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/2] drm/tiny: Ensure DT compatibles have SPI device IDs
To: Mark Brown <broonie@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220202152631.20704-1-broonie@kernel.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220202152631.20704-1-broonie@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/2/22 16:26, Mark Brown wrote:
> Currently autoloading for SPI devices does not use the DT ID table, it uses
> SPI modalises. Supporting OF modalises is going to be difficult if not
> impractical, an attempt was made but has been reverted, so this series
> adds SPI IDs where they aren't provided for a given modalias.
> 
> v2:
>  - Rebase onto v5.17-rc1.
> 
> Mark Brown (2):
>   drm/ili9486: Add SPI ID table
>   drm/st7735r: Add SPI ID table
> 
>  drivers/gpu/drm/tiny/ili9486.c | 2 ++
>  drivers/gpu/drm/tiny/st7735r.c | 1 +
>  2 files changed, 3 insertions(+)
> 

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat


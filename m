Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF653C15D0
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDF66E8DB;
	Thu,  8 Jul 2021 15:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7116E8DB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:19:44 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id a18so16732705lfs.10
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ltGRF8gNSkUFBj1/BeQuxMmiUaBau3JYn07hxVNPo4E=;
 b=gRmL6zTtsTJU/jwp+Em4jJEvTOlYVpvNz1TjW1Ns916W8uFhJWA+VIDCYa8tVQoCYD
 pV0/q0hkA0V4JQIXkHJlnzUYgQ3DIrnYjnOfiN+BSd1yCZ5E8N7dzNS7A2X65m+qV6vs
 R/4G01k4rO7VnXAbK7BPtlC/gbC3Zar8RQ5IQYyFJnAEcUUYVjRMhJB82B+ViNUPSWSu
 pbXCvvs10lG53GcWlJPpgACXTSsaWNWsfau3aOq8dJyxqzBqiit7/7F/xS9HIw2A1JyY
 TTaH0inakotwvnJCAPqpZCgWeZmc9BcvpYh8Rv63YORG3w6+9U8+eqE4rIQZYlt4aED9
 3Y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ltGRF8gNSkUFBj1/BeQuxMmiUaBau3JYn07hxVNPo4E=;
 b=OO5il19gyb7LBsMbsWeUeaqzIOKiN2nnB2HgcLtX5KeV7cPnyf0iHDMPQ4HLJM/TXc
 b//CqpnlzQ4obIOnYYzpRDwHc7gPSFTLS8BlZHsHsGx0+W2A/nIHsavshOTU160JycrX
 XS3T07uPiv+252THu6Az2nvOxv3bUPAT/1Yuyo92Dmd6GwtV4BTpAgS/UoBfDdNcGMfZ
 r/KX7XeBZl+7xIlPw293IuQWklVHttXANujGksnPIBrE28bJABpA0LNjU6r5WJVHzqdH
 1681kIVb1rZJXF0NKjp2V7Ykk6lq8sGL4GQ468HLJNWGFy7Y3kaevGBdZoCuat7a0HkD
 il7w==
X-Gm-Message-State: AOAM531v5WaC8cQrN5HHWbXTbcQJLlFzjHEZf7/+2nrK53ecRjF3sb8p
 7Dga0O6Re/mNqctXOsapzjU=
X-Google-Smtp-Source: ABdhPJw74h65mEH5RprFDkIZ6UrhrlbCH1T9jGMuLWMGsvCHjW7l9sKtw2aZmSEsRUIFHxJvIodL+Q==
X-Received: by 2002:a2e:b893:: with SMTP id r19mr24590443ljp.322.1625757582800; 
 Thu, 08 Jul 2021 08:19:42 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru.
 [94.29.37.113])
 by smtp.googlemail.com with ESMTPSA id b9sm223150lfc.42.2021.07.08.08.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 08:19:42 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: gr2d: Explicitly control module reset
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210708143736.2018135-1-thierry.reding@gmail.com>
 <d9112247-ce69-9281-75e6-6cb3296d19a7@gmail.com>
Message-ID: <620f948d-4871-e038-8d35-40308bad01b1@gmail.com>
Date: Thu, 8 Jul 2021 18:19:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d9112247-ce69-9281-75e6-6cb3296d19a7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

08.07.2021 18:13, Dmitry Osipenko пишет:
>>  #include "drm.h"
>>  #include "gem.h"
>> @@ -19,6 +21,7 @@ struct gr2d_soc {
>>  struct gr2d {
>>  	struct tegra_drm_client client;
>>  	struct host1x_channel *channel;
>> +	struct reset_control *rst;
> Unused variable?

Ah, I haven't noticed that it's struct. Looks okay.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 395223C19FB
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 21:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAA26E98D;
	Thu,  8 Jul 2021 19:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3ECD6E98D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 19:40:59 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id 11so185040ljv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5WdjjRpAMue8uF7sSO9E0Siqo0sZ/WULHAdm9QUKORI=;
 b=EGrLmVhGtDsK5gIkQ1dRW3hnP5sRCXX7MsMLv5/rYgCaWSd7gRu9B/t5vyFKj51nEU
 Fdo2XzZ0GJEoYRLov1LFInQbkRe20tXtQyewWoYGKf8AFZ0LPVEPYgznMz9HS7qUgbib
 ZqKmCYHt9oq0jfZ/fqUD3ZwfsttKATEzOHsA08Ik4zTbHjGVHFIfowV2BExu67YENAhh
 jyJQIZSJWoweewkTszrR3vMoWVjI8RLzSgiRd9+bYPsseBMq9Il3V5RON982hZrxw64q
 sjnHpK1syhTj4H6zUFkvVqg+Gg8WD7CBrNKGVKJoakhDkLKVVKUEgGlmp/4ykTe8gu2m
 jO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5WdjjRpAMue8uF7sSO9E0Siqo0sZ/WULHAdm9QUKORI=;
 b=cim5oUF1cbUr2Fj/lOtT+Fl11rwQhiZglJvnAvVViC6+gRLxnNcqUzDp9qsjTT/ia/
 7cjRllt9ZxexFrC87AIalDPM1LQl1ss4/qI1LA/hZdw7EGNKwHLyt4iI5PEe2b5MLurU
 oYHJ8B+m3cfL3sRPIQF6OGxfvbgsXV1ra76vXn/oedINk9fZx9O6DBk3JvnstTE8EZSl
 NTjJvsgAaqnX/9Kz1Jl4tKi9HMVbpEynDMixPkBWFsaJ6Pkc1Z1eRmx5M9HH97czTiLO
 aEV3l57EcgsT/oY1S7d/eDBIEA/gYFQnwilTFZvesQVh+BjJNo5OX6XOM/ytRLKAgd7Y
 BeRg==
X-Gm-Message-State: AOAM533pMF1sRW9G/XTqUuDCGszNEXeavMTtkt+eYMvL1/No3wIhZM7L
 y4BkG4PTf2cwOZyhVmja9Ns=
X-Google-Smtp-Source: ABdhPJx9xYrnl49sKD5gnueaXqwGpNEYhnzqHoNNeDP3kYgcSW17JJYHYI4BhtKZK+yAZ6sKW6G8kA==
X-Received: by 2002:a05:651c:b28:: with SMTP id
 b40mr21533150ljr.117.1625773258275; 
 Thu, 08 Jul 2021 12:40:58 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru.
 [94.29.37.113])
 by smtp.googlemail.com with ESMTPSA id q3sm275547lfg.178.2021.07.08.12.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 12:40:57 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: gr2d: Explicitly control module reset
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210708143736.2018135-1-thierry.reding@gmail.com>
 <d9112247-ce69-9281-75e6-6cb3296d19a7@gmail.com>
Message-ID: <2f9a6188-6e72-7353-2133-60230c02d6d2@gmail.com>
Date: Thu, 8 Jul 2021 22:40:57 +0300
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
>> +assert_rst:
>> +	(void)reset_control_assert(gr2d->rst);
> (void)?

I forgot that the 2d reset shouldn't be asserted. See comment in
gr2d_runtime_suspend() [1].

[1] https://lore.kernel.org/lkml/20210701232728.23591-15-digetx@gmail.com/

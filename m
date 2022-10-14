Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06345FF431
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 21:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728B110E035;
	Fri, 14 Oct 2022 19:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAE010E0BC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 19:44:30 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id mg6so3884597qvb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 12:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jRUJ/QuzoFh7CZWCmP/Tvwc6hY7OTq8JN3QKuFbW8/8=;
 b=iPwNeLHyqaFNTPw3QAfJflixPHFnxLKYWk27ZjSlOrkAf1sNonJPypAnjw+0nVjuP0
 RTNYnwrrm8+SOU9H4gtwLe8/dFs0D+UOilYO5IlMqLfxNV+QUNY76S0GcIzMCWB03Ka1
 gKUqtw/YFWBsYEr5kRK71GtG7k48lhNfycbF93pH5WjMYgywC555KUrCqwKswTztolOc
 RVtjxYlccZcxs0vNyTI+6Z7LQiagsWoOm98ClzwSwE4KQAWqxBNWUh+FiYFI5CbVqy3B
 dPnyWMQWgbzQklANOqoZMU+Qo3+tQqkNlIpLZ1AZvIvZC1LS0LkvEccVrtetuM8afc3T
 afFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jRUJ/QuzoFh7CZWCmP/Tvwc6hY7OTq8JN3QKuFbW8/8=;
 b=sd0G05UVS0hG2ay9eY3qPQFXA/ffaVIMdG8EqLL1WIaIyIFqw2zv00rigWPzlZhtZx
 GI4qGSbiLy0BksdD3M+u8Lhg9o7cJqfezHZYSoWaPvsG8CeojNEZ7et8fYAOw4ZfJkpi
 aLVeX2yBG9icCbjSIumJxYKbYZpiAatlFzR38mjRiRS2pmM2C9aLjDRcDTCIMeSrkvDk
 TeHKnwH0mGnqFpcQWAqr9DoNL+zZJg8w3XU44g8Nb930coRZ7x2ueBqk84D2eax0Nda+
 Qmz0PRUKCDB8YPLDiABD8A9b6YIXqaf1XR2cGnX9KMRiEaTQgJEZ2V1Gm3/JC/8JTEJY
 ghEg==
X-Gm-Message-State: ACrzQf1HjDOqM/ZbJQ2vgiSGSkczupXjsSHmSbdqmdmP1EY07ttQNCIr
 ZIb06aNU5c2cQpMUyOQOShHqvbw8UXo=
X-Google-Smtp-Source: AMsMyM4Z3G8ESlxxaBGvcPzIV8pBrcD99S8yd+JZsybkrXWtMqOFr/g1WwkRVGlDPTmYl9kd5q08Gw==
X-Received: by 2002:a05:6214:622:b0:4b1:d189:1631 with SMTP id
 a2-20020a056214062200b004b1d1891631mr5391197qvx.62.1665776669830; 
 Fri, 14 Oct 2022 12:44:29 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 t138-20020a37aa90000000b006ecb9dfdd15sm3053872qke.92.2022.10.14.12.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 12:44:29 -0700 (PDT)
Message-ID: <c3535ca9-1676-750a-9041-8bcc4c636e86@gmail.com>
Date: Fri, 14 Oct 2022 12:44:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/7] firmware: raspberrypi: Move the clock IDs to the
 firmware header
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>,
 Michael Turquette <mturquette@baylibre.com>, Emma Anholt <emma@anholt.net>,
 Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>
References: <20220815-rpi-fix-4k-60-v3-0-fc56729d11fe@cerno.tech>
 <20220815-rpi-fix-4k-60-v3-2-fc56729d11fe@cerno.tech>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220815-rpi-fix-4k-60-v3-2-fc56729d11fe@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/13/22 02:13, Maxime Ripard wrote:
> We'll need the clock IDs in more drivers than just the clock driver from
> now on, so let's move them in the firmware header.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

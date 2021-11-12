Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95E244EE18
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 21:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA4A6EADC;
	Fri, 12 Nov 2021 20:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD326EADC
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 20:45:39 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id h11so20930061ljk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 12:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dj8edOGwh4mwPw7oTrbImc1ApAV3Fdni4gw+kNh3zB4=;
 b=qoxEZsXGdKhCEQ0BzWWIHG6hrTaMGH+sW6P/De5GatNtSglP3BDbpPyFfg5dQKWALW
 D6vQMvKhtlLSkliv++OuJCS6b155jod/dtzO0rGk2FBEqNXhutpxFX/SiccDfaQc8Z25
 FHoDnXEYf7XLvob1ylT63E3hWGhivFSUUxCOtqy0xppwLmGLK7sOrR8YlQIFEQ+gmN5k
 o3PUnZr5nho5kQ8+QxhvpsY8bnCcsEaQQcTRYXyCCZRaGkNJ8A8QCttjEYNe0oQpnveC
 zVDQn0f8nUN4QcvlvgvS31lu+dbVta2nAjNbUOyRphjN56JtMXOJ/zJM1PBTXATCpML6
 puCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dj8edOGwh4mwPw7oTrbImc1ApAV3Fdni4gw+kNh3zB4=;
 b=gR28OkWkOkhoQqwfgJqe8yaR13JuDpBDitTNSOXa1IjfT4a9TvOyHGmic+LwYbKlTv
 ZQY4zMzGvO6ktxim+mxOqEtsvXufq6IDDfKCeFcQvBBNosEpUfHMKXEHjtGVLACDcLNJ
 7NBvUhcod+Eq22kf0P0zret2qbC7ECM0OWQvsKKq6ZkzbPd/RQX34OG/7cd2LTsIVydf
 reX8o/TUp1mZCXCHZnOG6aSfKENaD1SdoWOPzlP3WbOPYKXFgwJaWSzZxvKsgpDOeOeq
 Wenc3ZCzNi8iOaVrt11gKEaX3RF3C62MXDvxIY4v4Gd5exyDBDuoIxzNeWiNhGfxki1S
 ZWyQ==
X-Gm-Message-State: AOAM531U7f1zkA6GOzKVYQXKoEw6yNABTRuz5o/f2jS7iZW/QLp/TSbn
 /S6XrOmaNy42FAejSGxNOpE=
X-Google-Smtp-Source: ABdhPJxQNaZT0uWmDv3ix5lMXRBKd4qRik1D3EQJP/ClHT7Avo9zZh4FDTunb09hDuXYyGN/anHPKQ==
X-Received: by 2002:a2e:bf18:: with SMTP id c24mr18300650ljr.408.1636749937660; 
 Fri, 12 Nov 2021 12:45:37 -0800 (PST)
Received: from [192.168.2.145] (79-139-177-117.dynamic.spd-mgts.ru.
 [79.139.177.117])
 by smtp.googlemail.com with ESMTPSA id m8sm736845lfg.140.2021.11.12.12.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 12:45:37 -0800 (PST)
Subject: Re: [PATCH v1 2/2] drm/tegra: Use drm_dp_aux_register_ddc/chardev()
 helpers
To: Lyude Paul <lyude@redhat.com>, Thierry Reding <thierry.reding@gmail.com>
References: <20211107230821.13511-1-digetx@gmail.com>
 <20211107230821.13511-2-digetx@gmail.com>
 <YYk/jfcceun/Qleq@phenom.ffwll.local>
 <0a2c02ae-3fe1-e384-28d3-13e13801d675@gmail.com>
 <YYo9IXjevmstSREu@phenom.ffwll.local>
 <857a48ae-9ff4-89fe-11ce-5f1573763941@gmail.com>
 <efdc184a-5aa3-1141-7d74-23d29da41f2d@gmail.com>
 <71fcbc09-5b60-ee76-49b2-94adc965eda5@gmail.com>
 <49ffd29b-eb64-e0ca-410c-44074673d740@gmail.com>
 <YY5HfUUSmnr6qQSU@orome.fritz.box>
 <5ee3f964-39ec-f6e2-5a01-230532a8b17e@gmail.com>
 <be1833c5d27e666b760c729fc112d1bbd7b7a269.camel@redhat.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9d7c2ff8-c154-b1e8-a7c5-c7f63aa5474f@gmail.com>
Date: Fri, 12 Nov 2021 23:45:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <be1833c5d27e666b760c729fc112d1bbd7b7a269.camel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Thomas Graichen <thomas.graichen@gmail.com>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

12.11.2021 23:26, Lyude Paul пишет:
>> BTW, I see now that DPAUX I2C transfer helper may access
>> aux->drm_device. Hence v1 patch isn't correct anyways.
> 
> JFYI - unless I'm misunderstanding you, the aux->drm_dev accesses in the DPAUX
> i2c transfer functions are just from the various drm_{dbg,err,etc.} calls,
> which means that they all should be able to handle aux->drm_dev being NULL. If
> you can set aux->drm_dev before i2c transfers start that's more ideal, since
> otherwise you'll see the AUX device name as "(null)" in the kernel log, but
> any point before device registration should work.

Thanks, I realized that have seen DRM log with a such debug messages
just a day ago.

drm drm: [drm:drm_dp_i2c_do_msg] (null): transaction timed out

So yes, it's indeed not critical.

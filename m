Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD914BCA34
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 19:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8643210E15E;
	Sat, 19 Feb 2022 18:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1596910E15E
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 18:49:14 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id j7so11325570lfu.6
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 10:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7YhVG8Dy+S1k40YAXhEZryTJrbvkmx9GiFs6+GPhuaQ=;
 b=H2eafIb0d+gnPTeQfQp3hdpbyrFDjuxHlgGunCA2MiiBccQeIlixC6yWs5I08xT0nN
 Xdxjxk6Mzk8p+BE7e+dKuSRT5dolF+XjEsJlja7p0ETEvEEvuH8Yh4dlWKRoZ4iZ8OXR
 U2uMxEimT2NduF42uHLQHUyEfjdv17in99/lWPBlj/UL2FNWAnSXBzrBQJDMu+DCgkAH
 rM5Bvsb9e5s2clBjZTXORVVjUxCWI1VNQIWotvuonsawBYM+5GZBhOaAS/1YLepiFidN
 FhhGEihUOKgcKs01grZCKhcxkiknAkYyU1UNow5+2vpKdwOxLKw3yYdKAJcq9QIwFmjy
 ZvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7YhVG8Dy+S1k40YAXhEZryTJrbvkmx9GiFs6+GPhuaQ=;
 b=CA/OGgXNjX0qte8bg1NIQVlyQ+6m8LLrk5wWQmksCMQwT3bLm1j1cRvm7VngOWNOSw
 UXc4DDRD24rTfJsstjC+/o/yo/w9X20uXpgdGQd4makDFShTnnV3DTvJzrf14SuzM+DG
 WGiE1+7ceHTxu1miLP5waO3EHNZvknWIDLi642kiWJkj119dnsiRAw/PkeC7n7RLlqN9
 09L6LPqtZ5bFVOgq8j5i+iTeziUCOsxPx+ucij0Du1Dht9lID+hyZa3D56JDOX9n+EZ9
 SNuiHRu3fO36GpEF4XhCQYPud8jeDNj3S0zFSE9Lx0dooOpVnsnlF8dsBH2qXTrGbxdc
 mf7g==
X-Gm-Message-State: AOAM533lr725wyAoKBhYPtyuOAijFMux1INlU+ymJabfWkViAvupxe52
 4mqRSmHztLunaGioYRZQkDU=
X-Google-Smtp-Source: ABdhPJxu4c7EAYfGM/Z+Iq7ORPC+Om71HaUK4ew3FTkSHXyN9PFMoo+/wBKUzofOsjvEek347LaSWQ==
X-Received: by 2002:a05:6512:3f91:b0:43e:da3e:464b with SMTP id
 x17-20020a0565123f9100b0043eda3e464bmr9015660lfa.673.1645296552456; 
 Sat, 19 Feb 2022 10:49:12 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id y18sm737447ljd.13.2022.02.19.10.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 10:49:12 -0800 (PST)
Message-ID: <b1df816b-6838-c435-1a23-5029144e4cfe@gmail.com>
Date: Sat, 19 Feb 2022 21:49:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 8/9] drm/tegra: vic: Implement get_streamid_offset
Content-Language: en-US
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 robin.murphy@arm.com
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-9-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220218113952.3077606-9-mperttunen@nvidia.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

18.02.2022 14:39, Mikko Perttunen пишет:
> +static int vic_get_streamid_offset(struct tegra_drm_client *client)
> +{
> +	struct vic *vic = to_vic(client);
> +	int err;
> +
> +	err = vic_load_firmware(vic);

You can't invoke vic_load_firmware() while RPM is suspended. Either
replace this with RPM get/put or do something else.

> +	if (err < 0)
> +		return err;
> +
> +	if (vic->can_use_context)
> +		return 0x30;
> +	else
> +		return -ENOTSUPP;

If (!vic->can_use_context)
	return -ENOTSUPP;

return 0x30;

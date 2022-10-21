Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598DD607D6E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 19:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E934210E596;
	Fri, 21 Oct 2022 17:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269CB10E596
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 17:22:54 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1364357a691so4353587fac.7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 10:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=zlHj7n3i5o3yXLa4ETHRTpxvwrBu3YafH8lL3TZQo7c=;
 b=mfKFX0fSUZxTyWGet7HLjN5KSNIIKvyVtQYoZsLLgdG68Yakqkgp2WJCOVzeO5GHCh
 yANi9hjw5ikEB67N8ZxxJKlfSvDFlB1pwODfttxygGfSi0EpBEzaL4U+q9EnKkXB8zM4
 Kpy3knTJtufMaIDXCnTxfQ5ityhf0XE//ULX0EfgX5moVheH0+IlYH7rFaVYlw7h1IZC
 f3hvRzN3Is7mdZ6SjqQK+HqlYEc7b/vJJi/DHEaOZ5SLMYgzInSE2cZqQCd6vFovU8W+
 GC/OSC40v6iY2wHSha8o+Px7g7bYjOTCm+V4YkcfWMW6rmsOzqVXzjwkL/eK9USq23tn
 RQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zlHj7n3i5o3yXLa4ETHRTpxvwrBu3YafH8lL3TZQo7c=;
 b=k7cgyT/EpHivaf1VhbSlpe2+BEJfTIcsRD4h2hSsvltdFZpsSlQMp7H82vyjRTcRVE
 ne3Y9bFzitYlOIB1hij1QfBrJFvxwtYEMuCe8BErEMzQl+ZH55+kro7GZsYGI4Dkx7r8
 2HlWeZDlMbxL05kAz+j9T6vL1Cn5a0DYImoe098AcdkKZ+ulFpeKznZGESW7TcsbXINv
 nCFXeYvLBvSf87AN6hbWdAl9dfmlTxgK8dHJU3BqEL/q8qFCjUHYmP+oJG9Y6JSwPPrQ
 ROdJSVhYXHxaBMm+hAR0MiAPJ8bVpAfUtRsATKtxkDwjCUcatDqm26wiTBtyrwiyzmtf
 0e2Q==
X-Gm-Message-State: ACrzQf0kPmlVHTdQfHGbAEafSebaq1fiHjnzRpabP18N7ede23G/2A+o
 Szbu5HaeSMJ40p6j/gj8s08=
X-Google-Smtp-Source: AMsMyM6Gt5PNxUQH7m5Kz7f+QJp+blLH3aodobQDZ0VnhqQZBBrggpcw5I5WICKa7m1ONsnecjhzHg==
X-Received: by 2002:a05:6870:2427:b0:13b:1f89:ab27 with SMTP id
 n39-20020a056870242700b0013b1f89ab27mr3799543oap.20.1666372973425; 
 Fri, 21 Oct 2022 10:22:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 em40-20020a0568705ba800b001226d2100f2sm10482749oab.33.2022.10.21.10.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 10:22:52 -0700 (PDT)
Date: Fri, 21 Oct 2022 10:22:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v4 4/4] hwmon: adm1177: simplify using
 devm_regulator_get_enable()
Message-ID: <20221021172251.GA1891003@roeck-us.net>
References: <cover.1666357434.git.mazziesaccount@gmail.com>
 <7773541795f280db31dd981ffc21df8a630b794a.1666357434.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7773541795f280db31dd981ffc21df8a630b794a.1666357434.git.mazziesaccount@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-amlogic@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 21, 2022 at 04:19:04PM +0300, Matti Vaittinen wrote:
> Drop open-coded pattern: 'devm_regulator_get(), regulator_enable(),
> add_action_or_reset(regulator_disable)' and use the
> devm_regulator_get_enable() and drop the pointer to the regulator.
> This simplifies code and makes it less tempting to add manual control
> for the regulator which is also controlled by devm.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Applied to hwmon-next.

Thanks,
Guenter

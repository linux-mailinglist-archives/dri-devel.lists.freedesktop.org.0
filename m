Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EEF2B2E23
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 16:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5BD6E931;
	Sat, 14 Nov 2020 15:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74C46E931
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 15:39:56 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d142so19086059wmd.4
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 07:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2epbZ3+UnndJ7TIcZlKuCPOVDuT8GqG7Cpc8DUIEdTs=;
 b=dC3qWypM/B+tSmN1ypn1m8aivQkhRWhnP5O1vsv28L0f5NP95mqgR7YRIuDjRPeVul
 BEwvQaRUvuuDXOSyN5N5hui5QR1WiYwiAOlAOz4Ufh/OLJjLYZ3IawtNn/13+D6jG1vt
 IyGQylhCXyl0Edt6mihGkTbsPDo+8GyyEUHEXWy9tOQ+Zd+iYf5afNag1YKVG9V71lri
 W2a3hd0vHvGqZbPtUWl8YQ+IkU3/55b6laMs+qckY+zapVtuzACohU6ZpudLr927hTJh
 drujflq8oHzLE8ZIH3PDf+FCbYUj9XS1fpyKkwbuqwziGslv1l7YXvGSBR7Lsl2N8O0u
 0XDw==
X-Gm-Message-State: AOAM533+w6z+Nk8geXg5p07JEm+635VJmVk1J10KYyKZ4xElfh1dj4FX
 MtGoqs9FpaEW9X3maG/eRhE=
X-Google-Smtp-Source: ABdhPJykOlHO4MbKp8wxNIyMEoiv/tohAotAvK9fvlbalM9OUcEQMMQezZ0QLYuDEpRm/iiCeDsBkg==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr7305741wmb.122.1605368395400; 
 Sat, 14 Nov 2020 07:39:55 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id s8sm15757236wrn.33.2020.11.14.07.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 07:39:54 -0800 (PST)
Date: Sat, 14 Nov 2020 16:39:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 06/26] memory: tegra30: Add FIFO sizes to memory clients
Message-ID: <20201114153952.GF4106@kozik-lap>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-7-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111011456.7875-7-digetx@gmail.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 04:14:36AM +0300, Dmitry Osipenko wrote:
> The latency allowness is calculated based on buffering capabilities of
> memory clients. Add FIFO sizes to the Tegra30 memory clients.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra30.c | 66 ++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

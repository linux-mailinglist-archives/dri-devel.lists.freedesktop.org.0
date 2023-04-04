Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE906D5FF3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 14:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D725E10E1DD;
	Tue,  4 Apr 2023 12:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C632110E1DD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 12:14:53 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id w9so129726355edc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 05:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680610492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AqDwgiSEHXYcctc2ir4e/JOQcuBACd3Y+m4voyUVZdI=;
 b=PdbEHNY4MaJL2QK86ou5R9wBF04TH2u2t/C4OGX6xErvzcS4SKsJSKwsFzfZMNgejk
 sERjEwvJ5PmDrDRikHSjluohq6E9AbtZrcGsThGhufTxtEKmdwrt5f1ngeX3m2dRg9UB
 R7MM4fyazeWvNxb8wAG392oNBi87WKq8VYAlnRA9K9slTfOZBS6H/DjsiV4/Cbh6JjKr
 kX8YcXgNmRBQRIZ9tUFeCJ8KAJ25/xtBwtSryf5QFL265QV1sr7jQ5zlQ9Zbru5bx3tu
 XyDV6RnGiV2RXJrKUJqg6V38T5nTLzN6NotJ9On7MvhHa+uXM+1biWrxOOZZFqSQB7sT
 3K8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680610492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AqDwgiSEHXYcctc2ir4e/JOQcuBACd3Y+m4voyUVZdI=;
 b=OUXSIiczi2gA0RMexGh/2mf8wN4saXvAAhEs+KMw4++2TBp3B9u1nEyjXSPwRblWCu
 P5biyUCwWNg2SotRqt97PD8SoVMH/wyFAPR+lYWTaNLP3/aVWRgAdkyjbR+O8LCflDM7
 /kodJc2nD0LdWselDFNxQ1/1cbGeT2A06CbkzqQQz77XlYS4fr+PLQQPnSWh0U3HeMri
 Fg0f3Du3k5z8b1y6gM/ui2Aw9azXOWCxpXJaUxrm+u3I7NAZBGny0W1tGPQK2GX1pkKr
 KyEPeewd63xjxgtqsmYMWifi3ophte+jv9L1/9EmUv1k74xvRc0S8y7II2OGfZXVLSwT
 gQ6A==
X-Gm-Message-State: AAQBX9dRjWoAHdtvKr/14uXxGju2hSirLOeedyaLKQZbBZ1vSwb0KVXz
 1bmjoLhnObdrnNXl7+pWoW46MnrUiso=
X-Google-Smtp-Source: AKy350ZA5sgGwgL3vMVo5Ny1rRfi1xq5vWXKPdWqstTtkyS1o1E8fWWWqrsgwBFlAzhuAlspbdoFCw==
X-Received: by 2002:a17:906:b10f:b0:93b:752:d2a9 with SMTP id
 u15-20020a170906b10f00b0093b0752d2a9mr1905729ejy.31.1680610491802; 
 Tue, 04 Apr 2023 05:14:51 -0700 (PDT)
Received: from localhost
 (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 qo26-20020a170907213a00b00930aa50372csm5843631ejb.43.2023.04.04.05.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 05:14:51 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [PATCH] drm/tegra: dsi: Make use of the helper function
 dev_err_probe()
Date: Tue,  4 Apr 2023 14:14:42 +0200
Message-Id: <168061024450.2054665.3431873528237731595.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20210916105641.12215-1-caihuoqing@baidu.com>
References: <20210916105641.12215-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

On Thu, 16 Sep 2021 18:56:40 +0800, Cai Huoqing wrote:
> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> And using dev_err_probe() can reduce code size, the error value
> gets printed.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/tegra: dsi: Make use of the helper function dev_err_probe()
      commit: 6fae3bc81e679961cfd198622f2aed2d720ee631

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

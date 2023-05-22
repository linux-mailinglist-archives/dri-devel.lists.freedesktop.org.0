Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D7F70B666
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 09:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F5910E25A;
	Mon, 22 May 2023 07:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8770110E25A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 07:24:05 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f6042d60b5so8225965e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 00:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684740241; x=1687332241;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=DP8vc4lqhrsQ7DMlA5RHt36AfG1aqpkYdAb6gvy80+A=;
 b=bY4GxMrMwaalbkKP5sS71k32QpVTWBOkl+IWQ22b7K+xJNLFWeWRVqWOirEDukY78H
 dSq094Q/I2tCZmT/H81QKwM0IV1vpy+78FmXMGCqEjdRg8Ilgi7R8K3FhDIXvOD/knDe
 Po7SGfjhXgf6EVGp7/7+WUPsLl3MNQZVfTb/QyFWFdswigcTCIt80BY1as3e+sWoWEuL
 cfDLTdRIlELuELTqk3xNl5zpt2M1pVuk+wik+qmKYh7gpqJ3121x4I8R6NZISrtaUA/K
 ci+bD1RNsPXtPod4D1SlUbx2URkRgvuvMLQAkDTyxvYId8skmNGW3Joxxq9AlHzTFCes
 lT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684740241; x=1687332241;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DP8vc4lqhrsQ7DMlA5RHt36AfG1aqpkYdAb6gvy80+A=;
 b=dGkLYf7WVOKhpSZza9J0f/HfGUNvvv7F6fPmQmZglx73ELJikcd9VHGBd7TR6N9ZkO
 HZGTl5L2sdT8iAHhwtC+ZRJq7zP3rufqDC2Ce53nRUFIBzV0sWq+FsyneJraNUZuck8B
 hZtsopusYlilecjMYhleQVf7ENjDkV4IyTWFn8FniwqprSXzvAImKPOTXshk6XfsUwu/
 OtLw1qDi3udHC0fzpv0Yy+5umh755NPknoiETFXbNRpL4ozgOpviTrjkQH/RtvhV4oTT
 3UHtcPvaSv9gGW/g7ShsoBcbS+GSRkM6r4bbygNgyfnzP4UVL1S9KOOyCLmUGy1BSt+8
 umSQ==
X-Gm-Message-State: AC+VfDxFjMHnD8oDDdIanp+YtgY0QZQ3vzwKzS03YSzS54yQ0lWRvN5o
 Wwu2ihgDknc56tGbRKuE2r+ecTcI/RvJSQEQg06/Ug==
X-Google-Smtp-Source: ACHHUZ7yVBS628L12BOKyRlxAwNcCRJj3WJkt+J+IZCzDwMzw7fDFJdG1r9DF3W0NDLJprNMiR6OpQ==
X-Received: by 2002:a05:600c:2104:b0:3f6:53a:6665 with SMTP id
 u4-20020a05600c210400b003f6053a6665mr989148wml.19.1684740241626; 
 Mon, 22 May 2023 00:24:01 -0700 (PDT)
Received: from [192.168.7.188] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c290700b003f506e6ff83sm7353434wmd.22.2023.05.22.00.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 00:24:01 -0700 (PDT)
Message-ID: <ed8fc8f2-e5d8-8e08-dc29-e1197c911571@linaro.org>
Date: Mon, 22 May 2023 09:24:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: neil.armstrong@linaro.org
Subject: Re: [v1 0/2] *** Support Starry-himax83102-j02 and Starry-ili9882t
 TDDI MIPI-DSI panel ***
Content-Language: en-US
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, sam@ravnborg.org,
 daniel@ffwll.ch, dianders@google.com, hsinyi@google.com
References: <20230519032316.3464732-1-yangcong5@huaqin.corp-partner.google.com>
 <20230519080136.4058243-1-yangcong5@huaqin.corp-partner.google.com>
Organization: Linaro Developer Services
In-Reply-To: <20230519080136.4058243-1-yangcong5@huaqin.corp-partner.google.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 19/05/2023 10:01, Cong Yang wrote:
> The previous patch is not based on drm-misc-next, resend this series.
> Support Starry-himax83102-j02 and Starry-ili9882t TDDI MIPI-DSI panel,
> set the default high for RST at boe_panel_add and add lp11_before_reset flag.

If the reset gpio polarity is different, please change it in the DT by using
a different gpio flag instead of changing the driver.

However if the logic is different and reset must never be asserted to low,
the the bindings + driver to make the reset line optional and set a gpio-hog
in DT to keep it at a safe level.

Neil


> Cong Yang (2):
>    drm/panel: Support for Starry-himax83102-j02 TDDI MIPI-DSI panel
>    drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI panel
> 
>   .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 474 +++++++++++++++++-
>   1 file changed, 473 insertions(+), 1 deletion(-)
> 


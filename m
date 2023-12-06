Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7F8806811
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 08:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86F210E683;
	Wed,  6 Dec 2023 07:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4606110E685
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 07:16:13 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50be58a751cso5068380e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 23:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701846971; x=1702451771; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zDXbMWEhNI2lTiHePaAGslfA8GicK9kiWYsFKaGDIVI=;
 b=ADrcv+hOwNH3f/nge+PleOFIpEcjPkH3zjjdQWzyEKTwee0aw4lonx88alHLOezNCB
 b0dv3VZ6qAo6UDgPxTl8vFPGXtePcqx0J+rcuZrSUhYTEv9axBjyVwA1gXxfT3+by446
 z4xW0GbVzr6Hg5jEzZnFSs0wl3QXSclwDD37NCKbmReyHPZkkYDPuVuRJwYu0TrLVuye
 hegN5o5tGNq6dJxmjfMgYmATSMsoRM8nUYi9GqKc7CN6U60E+vlv77a5DaTFV3lTY+Hg
 phT7kotlfDdMVmJyaR+KUIW0j6b2l/nf9X3o6/gxxGAMvoa24wPU+TjG8d/MM8Fvnhvx
 JArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701846971; x=1702451771;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zDXbMWEhNI2lTiHePaAGslfA8GicK9kiWYsFKaGDIVI=;
 b=YuCvJGZz365w2afclUU9Cmt52AUdK7ZWtlm4wMMEcD6Z4kETrAGhFQrI6EUwrFprXT
 TEcxvScQR5XnqK77OA1TEZWZjJtIi+bOSTSMYnsrSmHQvjFJWVFwNiqY7ZHZyab1eRbd
 XVEHqAo8+/70sDtrxN+zFVioIG206OWgxn+ZzE986hTwg5QJZ+NbKjwrBxWVVIyDHV9r
 C6C0lSaWeNdi+HXt8ob4/cWW1qBn/RtiBdzHS3lJmkwFTXMKjpzdFBKmiNhOKu/SNG89
 h49L1d2FZxlZ4JlQsY0lQE1gHb8LXfaxCasH+Xd8GsdvsThc132k5Ajgf3PRgs4WCems
 UbeQ==
X-Gm-Message-State: AOJu0Yxso+ax7aAsYYc/Jin+v7qUSzzonOWxzyCQcySRcUk1iopHJ7Nf
 ssmAgob/9UkErinj379/9F5hfiO6hniZAlwtmL3hu2vV
X-Google-Smtp-Source: AGHT+IFosgPawxVbHM+ucU/rImmtmf74cewBhXNK/zsrvoN6gu4JaquJiaTw9BlgaIdmcDryu2w2SQ==
X-Received: by 2002:a05:6512:3d01:b0:50b:fdc6:9f30 with SMTP id
 d1-20020a0565123d0100b0050bfdc69f30mr276013lfv.41.1701846971330; 
 Tue, 05 Dec 2023 23:16:11 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227?
 (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a05651232d100b0050c10aa4582sm184607lfg.27.2023.12.05.23.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 23:16:10 -0800 (PST)
Message-ID: <fa72affd-ca04-4ea8-9892-d3a7cd1fbc8a@linaro.org>
Date: Wed, 6 Dec 2023 09:16:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] usb: typec: nb7vpq904m: Only select DRM_AUX_BRIDGE
 with OF
Content-Language: en-GB
To: Nathan Chancellor <nathan@kernel.org>
References: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
 <20231205-drm_aux_bridge-fixes-v1-1-d242a0ae9df4@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231205-drm_aux_bridge-fixes-v1-1-d242a0ae9df4@kernel.org>
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
Cc: neil.armstrong@linaro.org, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, bryan.odonoghue@linaro.org,
 linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/12/2023 22:13, Nathan Chancellor wrote:
> CONFIG_DRM_AUX_BRIDGE depends on CONFIG_OF but that dependency is not
> included when CONFIG_TYPEC_MUX_NB7VPQ904M selects it, resulting in a
> Kconfig warning when CONFIG_OF is disabled:
> 
>    WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE
>      Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
>      Selected by [y]:
>      - TYPEC_MUX_NB7VPQ904M [=y] && USB_SUPPORT [=y] && TYPEC [=y] && I2C [=y] && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]
> 
> Only select CONFIG_DRM_AUX_BRIDGE with both CONFIG_DRM_BRIDGE and
> CONFIG_OF to clear up the warning.
> 
> Fixes: c5d296bad640 ("usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/usb/typec/mux/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

For this patch we'd need an ack from Heikki.

-- 
With best wishes
Dmitry


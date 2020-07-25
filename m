Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76DB22E002
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7572589FF7;
	Sun, 26 Jul 2020 15:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF0A8989A
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 09:08:46 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id f1so9742720wro.2
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 02:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DyMBL+yC5aIhYRGcaqnJysyITwH53U1Ro41N0CgRvhs=;
 b=WQbQ8gmkRDWDzzP1+7raI6cxoeLmKTadrBGLHChz9qVlYLI7uTps1l2/Qh4MafNLx9
 FjFKFCtt1FFiy9A0CcZZChIQ1/uLdrD3lya9doFjD3bpuk7Pmj81Im5Eo7VD6kxetqhN
 Iv1mFQW9nntPe3o4zYxKy+6vihdYkEyyyXG3nVzupo9vjOiyQAJXDU7heVH4Xofvglo3
 VLIxFOPVdGiD6uj1gt1ylQIU4VygZZrbW+krWA6bufIx/jwTHb6kPvdSgGsr5fXKrY54
 oNcNZY4pbNESzRKHoC8Jy/XX2Zqgtla4BfadkHQLw7og4mdbU6nuVn1sci5w3o1q+t/p
 DnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DyMBL+yC5aIhYRGcaqnJysyITwH53U1Ro41N0CgRvhs=;
 b=hi7j3n2ZYvXeR6GihiBsu7h1KFu3I6LXOp06J5mfTdoMBWYS6n6ttIij+zOfNiGAS3
 WRUHdp+loenekTRb3sInkFQy8YbMWgU19dZCCfFlZ9yv/BjH9Q1pP1B4yByQqGiS9fID
 RiqQCIUghmeXma1ZnVPBiCv8V3WdcXo5C7ePLVqcvT6FeaicwqEd9iR+4lDwTX88CuIB
 RCQ3SlIeXsuMucv5k1LwdqKPv3asihKqLRk/SL60RKn40ueoDDPvJiaVmHGbuG1ZblhV
 Tfi1eJ0JrzdJVWirzaaZt5Z5EiIr31AsgejK0lwk52tv4DzH/Y3OGKdBvFAIFP3Vd53N
 hQ9w==
X-Gm-Message-State: AOAM530S2qub+v+BOH10YVixi24lH5ohWMwooX3Y6+QacRnlgHuy+G0f
 ILHQv0rW2hhdbY2kvZCPGb8=
X-Google-Smtp-Source: ABdhPJwVxo79mPawJutmkPpxtYQ7dWDmm+5ZOr7of7YeMdOgECyD7PzQD5HyqrFAkmML4Rd/2dhmAQ==
X-Received: by 2002:adf:fd04:: with SMTP id e4mr11659409wrr.353.1595668125165; 
 Sat, 25 Jul 2020 02:08:45 -0700 (PDT)
Received: from [192.168.1.145] (94-39-209-155.adsl-ull.clienti.tiscali.it.
 [94.39.209.155])
 by smtp.gmail.com with ESMTPSA id n12sm3831238wrg.77.2020.07.25.02.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Jul 2020 02:08:44 -0700 (PDT)
Subject: Re: [PATCH 5/5] drm: rockchip: use overlay windows as such
To: Alex Bee <knaerzche@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
References: <20200718200323.3559-1-knaerzche@gmail.com>
 <20200718200323.3559-6-knaerzche@gmail.com>
From: Paolo Sabatino <paolo.sabatino@gmail.com>
Message-ID: <3a420557-8f49-02bf-e5d8-94c69534b2ca@gmail.com>
Date: Sat, 25 Jul 2020 11:08:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200718200323.3559-6-knaerzche@gmail.com>
Content-Language: it-IT
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:45 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/07/20 22:03, Alex Bee wrote:
>   static const int rk3188_vop_intrs[] = {
> @@ -980,7 +980,7 @@ static const struct vop_win_data rk3228_vop_win_data[] = {
>   	{ .base = 0x00, .phy = &rk3288_win01_data,
>   	  .type = DRM_PLANE_TYPE_PRIMARY },
>   	{ .base = 0x40, .phy = &rk3288_win01_data,
> -	  .type = DRM_PLANE_TYPE_CURSOR },
> +	  .type = DRM_PLANE_TYPE_OVERLAY },
>   };
>   
>   static const struct vop_data rk3228_vop = {

Tried on several rk322x boards, it worked fine.

Tested-by: Paolo Sabatino <paolo.sabatino@gmail.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

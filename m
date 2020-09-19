Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CEC271C1B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 09:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2D26E226;
	Mon, 21 Sep 2020 07:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF89B6E06B
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Sep 2020 19:31:54 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q9so8378427wmj.2
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Sep 2020 12:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=nhO64xCI4d4r54ZrWnpLalMx3gX9IygCuaPxGjDx99M=;
 b=Tydqc+qocqvnz2vAK6WPkAGgnydb9gSTS2fJ6ETQF3KtpWS+d12fFMWuHhG06PgIiH
 j8cZ9oAGiWg0wL4VD8YjU+KUq/iQAe8STAP3+LpVPSFKZGtOtKKL33/2/yW6Cu7n40Wy
 7Uhrtt3jOzepOcePj+W5S2+ywlbIT9N3e9bW6ZyiXEMO7BgiNhgvRceKHVZMts9Mcty3
 2n24pNmcZpMHW5tFUv9bSjVDvmkPSLxsTNnYDiAgKeYTiEJebAzE7GyxAHAh0jjVRNrW
 g29AMco/b9piZzP5j1YmAKIb3yrCa3uITV3y4BcCSL6fd8p55wt+HFAXSlzyoWI7HOcj
 tzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=nhO64xCI4d4r54ZrWnpLalMx3gX9IygCuaPxGjDx99M=;
 b=EI0OfSibFXp6/lYfOCMa7HtcxKDu0g0cT5X/z3MG3Y+WMorNwiKNonVGvu2V+bo0mY
 xcX0AVthgpk4Hm9mon9Cifr8DIP/5BoDEGHE3cdyAVLrynbcDRwFxNm7hCf8UxELjah1
 t2rdGvw6p76NfWgbrxAcOjatgH3QtAtUgakU+h64TsmKBA/nqkcAzbN/ljDEOkg4qfuh
 Wv+ulcIZfzvyMdEECej+JgzBEUia0rx74le6V9JxKHxzxIDN2cTUJS3acH6qoF+54cGN
 yurjARGRPW6ELrvH3fEs9nUPaJhEU077/gSQnnR1RsIvnqPvnIZar176NRHlusYEgjwk
 ncxA==
X-Gm-Message-State: AOAM533rqY4kILAzxfzxRgUBgbaIhizEPxqaWg2mXARoAAvgtmobZF/Z
 bdfubZQm536L2LFeb98/fn0=
X-Google-Smtp-Source: ABdhPJzunn6qDr4P1aW+zfdh47dIikbU0rsyCB3FHmxe0aDSJgTLqHEQXgP+YIxCawHHutNcaRX3lg==
X-Received: by 2002:a7b:c453:: with SMTP id l19mr21021614wmi.163.1600543913008; 
 Sat, 19 Sep 2020 12:31:53 -0700 (PDT)
Received: from [192.168.43.148] (92.40.169.140.threembb.co.uk. [92.40.169.140])
 by smtp.gmail.com with ESMTPSA id b18sm13020585wrn.21.2020.09.19.12.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Sep 2020 12:31:52 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Use kmemdup cf. kmalloc+memcpy
To: Neil Armstrong <narmstrong@baylibre.com>
References: <20200909190213.156302-1-alex.dewar90@gmail.com>
 <c14d055d-1f6e-8c46-3a6e-7794ec69e6fe@baylibre.com>
From: Alex Dewar <alex.dewar90@gmail.com>
Message-ID: <89c599d2-6766-df68-5359-7672679b3d89@gmail.com>
Date: Sat, 19 Sep 2020 20:31:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c14d055d-1f6e-8c46-3a6e-7794ec69e6fe@baylibre.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 21 Sep 2020 07:34:44 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Antonio Borneo <antonio.borneo@st.com>, Philippe Cornu <philippe.cornu@st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Markus Elfring <elfring@users.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-11 13:57, Neil Armstrong wrote:
> On 09/09/2020 21:02, Alex Dewar wrote:
>> kmemdup can be used instead of kmalloc+memcpy. Replace an occurrence of
>> this pattern.
Friendly ping?
>>
>> Issue identified with Coccinelle.
>>
>> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
>> ---
>>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>> index 52f5c5a2ed64..7e9a62ad56e8 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>> @@ -1049,12 +1049,10 @@ static void debugfs_create_files(void *data)
>>   	};
>>   	int i;
>>   
>> -	dsi->debugfs_vpg = kmalloc(sizeof(debugfs), GFP_KERNEL);
>> +	dsi->debugfs_vpg = kmemdup(debugfs, sizeof(debugfs), GFP_KERNEL);
>>   	if (!dsi->debugfs_vpg)
>>   		return;
>>   
>> -	memcpy(dsi->debugfs_vpg, debugfs, sizeof(debugfs));
>> -
>>   	for (i = 0; i < ARRAY_SIZE(debugfs); i++)
>>   		debugfs_create_file(dsi->debugfs_vpg[i].name, 0644,
>>   				    dsi->debugfs, &dsi->debugfs_vpg[i],
>>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>
> Thanks,
> Neil

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F165935B8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 20:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D42AC1048;
	Mon, 15 Aug 2022 18:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE875D0D18;
 Mon, 15 Aug 2022 18:32:54 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so7520325pjl.0; 
 Mon, 15 Aug 2022 11:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=8bJQmDi/lCA9PqirReS3MPMutajyKB5RDjNh4fqCzaA=;
 b=jdED2coZKjWQwnNfe6vINVdrNYG/s4Ap5/xy5Gcip3nOeogSVmoaiJccuFjEMCn604
 aiAZAQA12xrgovQ0EK7RmswbJp8NFIGlbMK7CJIoj829dlR/YYKVOetZHn6kiWBGYqVw
 iKFOwG4d+6zBCeFAM+4iDS7+9tD9UBi/j3bzxO26XKdYiOx4BB2DNlOWrPLyESziZRHe
 LEaQNj92ErOuotlQ1magSPuxiMp4HGWT4qlqOjqs26rIJlOdgx2ohKm85mKBuL0W3Xiz
 UuCSlnwEL0+m8YK540p/n30zlzjGqOSmL/ZEk6NbS6E6meNvlkJSA2GfQZf+c2O2OWU8
 uGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=8bJQmDi/lCA9PqirReS3MPMutajyKB5RDjNh4fqCzaA=;
 b=qDu02swJzIY4khoq6Ai+ihBPvayTfYFoFL2AFeJOkfoinxTqAd7PeHqIbhW1lMfwy5
 ZOz8g5RgrW0VWbTtOoXju0Ex9Wm56HmtHoB4AC56HMfl+88UoIfwO0cpNr5hzmvVEGHX
 Fd8RCvUZ+yK83S8QyYeg9k0awtQEC06RlIQWoyDfrZsovNu6vMZwEkT64VR3TOuJ6vii
 hPNkiLV2+VQrbXdbZiFSXTeKX/LkQECuHPvbs4rZEyEtyim/vzSNAXa++PJTlf2j+jxM
 UlA5TGnHWFA2mv+iWHYQr/xIsxHfvUgJ2YKsVBMVj5EaZm9qznNwTBSjCZzFw6CcMIFG
 mH/g==
X-Gm-Message-State: ACgBeo1gUXJCLNpL1FoH3piwKolwJFelskXG5Am4bkdKcFPYa1cGI61L
 2vnFZzbuV0pLhdBuS7XcUXPc2ywWRmF7WZDG
X-Google-Smtp-Source: AA6agR6Clbh4D6hp8u1BwYfWLa6d/Cwe/QwEr2ontSg2+IYjxn4HZJNCGeWwoDVqjl6HR/cTznhCPA==
X-Received: by 2002:a17:902:c201:b0:172:6c9d:14b9 with SMTP id
 1-20020a170902c20100b001726c9d14b9mr7195297pll.161.1660588374426; 
 Mon, 15 Aug 2022 11:32:54 -0700 (PDT)
Received: from [192.168.0.110] ([103.159.189.148])
 by smtp.gmail.com with ESMTPSA id
 200-20020a6216d1000000b005289fad1bbesm7034667pfw.94.2022.08.15.11.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 11:32:53 -0700 (PDT)
Message-ID: <83820e90-04ac-16cd-b5be-87e1a0bbfca8@gmail.com>
Date: Tue, 16 Aug 2022 00:32:46 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in
 vcn_v4_0_stop
Content-Language: en-US
To: "Dong, Ruijing" <Ruijing.Dong@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
References: <20220815070056.10816-1-khalid.masum.92@gmail.com>
 <SJ1PR12MB61944B1D53330D5E9531158695689@SJ1PR12MB6194.namprd12.prod.outlook.com>
 <86088c17-585c-4a53-312d-ef339b824538@gmail.com>
 <SJ1PR12MB6194C83D51101ACD97B55F0295689@SJ1PR12MB6194.namprd12.prod.outlook.com>
 <f8734af1-6e31-75c9-9556-9519709284f1@gmail.com>
 <SJ1PR12MB6194033EC36251B95A6737A095689@SJ1PR12MB6194.namprd12.prod.outlook.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
In-Reply-To: <SJ1PR12MB6194033EC36251B95A6737A095689@SJ1PR12MB6194.namprd12.prod.outlook.com>
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
Cc: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Jiang, Sonny" <Sonny.Jiang@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/15/22 22:00, Dong, Ruijing wrote:
> [AMD Official Use Only - General]
> 
> Then please update commit message, this change is due to "value r is never used, and remove unnecessary assignment", that makes sense to me.
> 
> Thanks
> Ruijing
> 
Greg also pointed out that the function vcn_v4_0_stop_dpg_mode should 
return void. I shall send a patch shortly with these two changes. Thanks 
for your suggestion.

Thanks,
   -- Khalid Masum

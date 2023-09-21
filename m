Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7341B7A940A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 14:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156AA10E440;
	Thu, 21 Sep 2023 12:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4283C10E440
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 12:08:56 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-49966c6fafbso380757e0c.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695298135; x=1695902935; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f0A4cf8xaLph2RFxNW2e2zC/ozNHYMpBHiQTWSZDrd4=;
 b=GQktpZgVFphJajGm3PPj/461lg6TRDmqEB9YGKxoxi+9g2+RoLubnx6EsUCXJRGzme
 D70IuazSQ9wjQ0lNRqlQ4z8uU/RcoyxD33+yE+Y7+SXDwMKIrfjVJV2TQ1Y6q5YGwMUg
 YsUV/6DEoB6BhtagZ1+bJDFPYkCE78fcncvpusnjxmumt3GwRHX7TxvJl1amcwpLg6Jy
 BWRmPcsFii57DTchNw1YwnObVph7MNoP/O6Rf5NNEAV5El9WTbhntrlPwS6DNoqRyJy8
 tSCbU0fKk3ylYaT0w57Zo0sgMuPOtqLqhfmUGWTAR5/KUobWBF+BcWUVvULm395I1idi
 Cc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695298135; x=1695902935;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f0A4cf8xaLph2RFxNW2e2zC/ozNHYMpBHiQTWSZDrd4=;
 b=m+yA0iTdM6zyyAK/zBcdksyk4sYfKGR4bFug9qIfZxCk+8gmHfaXrwlcpRufkIvXAU
 nMlT2nFaZ3fDET+t3SNixx3waU+YMXGX9XStydxeiJygujLIVdEv7WLWpdzTgB/faN+N
 3UXALxz6F34bIxPcNOECxeQ9burBgYrckOTXsXRKm2pU+pppGsc8E9c4OHCsmbrOh42p
 Wf9rLJUcyJStysbsea9/wzjZO8kknRHX8dQAYh11zFcUoMQoj28/SGy/I/QCRlgjhdTa
 PVRA6VT1LBVcjbfh1CWQq3GllS2dDE0UQWsPZcKI9eNZOeavoCWQgULnasgI0Nnklxha
 u5fw==
X-Gm-Message-State: AOJu0YyaRa1kaaY8XmLXsAYw46+b15XZyLDjzMj4tP8Xp03QDhYoI4SX
 bhV9D3tAAl+ZjrKf6FzctzRypkiQVIQ+mKUJl45ZoQ==
X-Google-Smtp-Source: AGHT+IF6qOrjEY9if7ZapsXGGL1X2pv/FF05y7VvQhm8TwsXueJgwhY8SQCZZx9F8vyaLZqpsJvBOnpMrRr0N4EDD4o=
X-Received: by 2002:a1f:c6c1:0:b0:495:ec90:997e with SMTP id
 w184-20020a1fc6c1000000b00495ec90997emr5200602vkf.7.1695298135191; Thu, 21
 Sep 2023 05:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112858.471730572@linuxfoundation.org>
In-Reply-To: <20230920112858.471730572@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 21 Sep 2023 14:08:44 +0200
Message-ID: <CA+G9fYsM0Lr8TNQJxsZFDZwcH-rEzkVV+y+x5FX18oH5wm5dRg@mail.gmail.com>
Subject: Re: [PATCH 5.4 000/367] 5.4.257-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, f.fainelli@gmail.com,
 Sui Jingfeng <suijingfeng@loongson.cn>, rwarsow@gmx.de, pavel@denx.de,
 conor@kernel.org, shuah@kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 lkft-triage@lists.linaro.org, srw@sladewatkins.net, patches@kernelci.org,
 akpm@linux-foundation.org, jonathanh@nvidia.com, torvalds@linux-foundation.org,
 sudipm.mukherjee@gmail.com, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Sept 2023 at 14:25, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.4.257 release.
> There are 367 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 22 Sep 2023 11:28:09 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.257-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Following build warnings noticed while building arm64 with allmodconfig
on stable-rc 5.4 with gcc-8 and gcc-12 toolchains.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

drivers/gpu/drm/mediatek/mtk_drm_gem.c: In function 'mtk_drm_gem_prime_vmap':
drivers/gpu/drm/mediatek/mtk_drm_gem.c:273:10: warning: returning
'int' from a function with return type 'void *' makes pointer from
integer without a cast [-Wint-conversion]
   return -ENOMEM;
          ^

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2VfG47LmPH9MUEuIcMVftu6NsFy/


Following commit is causing this build warning.

drm/mediatek: Fix potential memory leak if vmap() fail
[ Upstream commit 379091e0f6d179d1a084c65de90fa44583b14a70 ]

--
Linaro LKFT
https://lkft.linaro.org

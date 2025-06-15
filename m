Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02340ADA3B8
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 22:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A29210E23E;
	Sun, 15 Jun 2025 20:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="y7gQIWZL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 368 seconds by postgrey-1.36 at gabe;
 Sun, 15 Jun 2025 20:49:15 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D572110E23E;
 Sun, 15 Jun 2025 20:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oldschoolsolutions.biz; s=s1-ionos; t=1750020551; x=1750625351;
 i=jens.glathe@oldschoolsolutions.biz;
 bh=onUUPi4Wsm0wWvtRzn7J1Is1tHETTLIUY7qL9YrjcWs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=y7gQIWZLpu0/YjHqAvPVPFIL+o9QBJOyf3dkhL6T4TWwvwmbVG4JGoXjTIOUdOeK
 LDG6b3lkaHTua6q0ulId5kja6lFa4bI1HDVqulZKLkmrYg/o3vwzZb4WCAu1qBHZ2
 e7BaBAt/fS9XFLxR7CKw/uykiEgz6Vuf4dxkb8VAutsKRQQlYVT5ysmE2W4UYNMZ2
 tpzTLr/zcuHWW0YIA23TsSBt5QvKA25xs+6/rEk+40RcQdDfdaYbwsk7rVe0rWgjZ
 mPc3zTpSWnSh00cRVKg6ONs11f7V2KXw5FMGArkwZdfupvXsXTYZywkiYOgR/eE+o
 5rUZ2SwsmCX34bqbUQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([62.226.41.128]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MqsGv-1vD7Bk1UkT-00lJbT; Sun, 15 Jun 2025 22:42:53 +0200
Message-ID: <df125ce9-c271-4cd2-b9ee-798d7b1c8648@oldschoolsolutions.biz>
Date: Sun, 15 Jun 2025 22:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 0/4] Support for Adreno X1-45 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <0e6fd97d-9a56-426b-8b98-dc8aa50d02d2@oldschoolsolutions.biz>
 <036e739c-54e4-4252-b6f0-c8eed5557d15@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <036e739c-54e4-4252-b6f0-c8eed5557d15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NPypNcwQLw4G4JWfH5eQewUs1fAhXA4gnmLwZKj+YXP2JQCVDLw
 hHHaFiRxV8yKAi8HhsY8i7ZxODi73S6CjKM9nVFccdGkPhfkB5pOrBOyVW9yaBNN4b0H+Ns
 dg9kfLxx2wyWiBgoyv/B9zEcXS+CPe57RHvxQpv2+5cF8Zfq1sB+eFs/1EV0GqXTBh6gg++
 +pqFx1RAv2flOXyJR+vlg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uIJ1F0medxg=;4Jpk9D+KU6zM8oJH2OhyjGCRX00
 ZLBzbcvmchKoYL3Yvux/9Ztm6mf/1c/6dd/Z+Y6/lWdWkTaNTrb0PbNkujfwJBXg4K5oC8uva
 laiILTryWn63pLvoQy9qrPelZJ6QSxlWrVUg0XdS8lco8YatTsVMHnQTp7WJf/l6HIRNBPFRo
 KnK7JheOUUGJu1fVgbJozvzeG2/O4KXyWCSWIYq9Xe14IvKOcDgfgffyH2FDs1jNWw0qd1BXw
 3QgiQRPvHTdIXZYxSC0IOK48R4VGotuZAJmL7hK5qL7Hb0TnsUsJQ1anGLdAUI9UgPFxWm9a5
 NBmNWydte+kwJ5CLpa65m/AaHiYmdiika2VknKjzAV880Y8Ga/V959kXeDHVNQI/kMC8g5/tq
 AkCQDirNP2gJdrGKUa3W+i9QD3MmW8angHUsjHYOXUicufyAYW5rsGmgfmd99eNpmTmIYW6os
 zN9yjKhKR+Hu0nQt1gvfs4qOIPghatP2LV0Mj+VlGFvfVkJlPfxNNFi8LZgtwLkPxeU5QMfRi
 bDvxm/LFr6y1jrXZtRbDVHzQJz7Uf6vi79WQb7vLLybUr5nXve8T8V8sbXaHEZtqdiRnssjMX
 gl69/icO94eVauqYYNV6zyaJ/ooETGrwexi5WmrGmb/kC+PM1HNJOoUN0wAZwbd74I8pAqBZC
 z/WkEeoLBQJYnZHx75p2gwjwPzP2GzaQiCyMzDLmOp2YU1ddJZoYsx18B0ZjP0sMWEhESJaPm
 mQwEjnDgzKDL7scv9bUQ0eWsKMsOqq8JlgrxhBrV36Hhlar9PIgJ2fUG8KUT2SE0k5aWfi14u
 D8ZVxqwVsJtXVBKq2p3hhCWSHCJ1QjwW4GYziBeEwcnWB4tZ0ooeCROzh6KCuWyfAe6vBfwyA
 CS4dp6f46e2V4nGZsOOTftQsHkB02irM1pa8WPWWV/5/4P3cjInilRrP00M+hN9ErqrDzEsfN
 DQ/hWIq2WdM4Ia6A3n6H92IrG/FZxrJdRryj3qBT5ErYbF1srQ5G5k97Slqu5a5UJtAvjvoB+
 PKR+jmSXMTTx8Vp+jc2eQOLIDF/I/FTB/e54NOX91xj8TXcbJjuyMmvYPL5Wg2G0hfeuf4nqq
 gkiUQy/16M1/aankbUgvJZ4g1QOjhmCVLsRh+EGcioEbJQZNOY2BzBph012ih1BeuqHNNkFui
 8Bz8ymu2xw2Ac/+KWzrjCFATxT0d2Z+5UBUUoHklO0/axhyXtRk0w0WVHv46tb0eWloNbVBtL
 LUmGv1PwIs+4j9ITQ+6LpsFomDSmHpnOIeIklUMVPA8/tAVfZtHnKyOZ8UwAfCwF6seTtI/uj
 kLVxuPxvSHaWoZy6lyIwo/jL0hOaxawrS96Tytb9XmX9dXwdmFJI/c7HRJFd7m8Lyz1Y6MKDf
 nxHp4/YbbGp101G1GrrknMJA9ZTOytY8iRG4VpfCam4aOVCO1x7lhtm3yq
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.06.25 23:19, Akhil P Oommen wrote:
> Hi Jens,
>
> Could you please try the below patch?
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 2db748ce7df5..7748f92919b8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1510,7 +1510,8 @@ static const struct adreno_info a7xx_gpus[] =3D {
>                          { 0,   0 },
>                          { 294, 1 },
>                          { 263, 2 },
> -                       { 141, 3 },
> +                       { 233, 3 },
> +                       { 141, 4 },
>                  ),
>          }
>   };
>
> With this, you should see 1107Mhz as the GPU Fmax.
>
jglathe@tb16-jg:~$ cat /sys/class/devfreq/*gpu*/available_frequencies
280000000 380000000 550000000 666000000 720000000 825000000 940000000=20
1014000000 1107000000

Looking good. Thanks!

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards

Jens


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0611D6FD93E
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 10:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA9210E45D;
	Wed, 10 May 2023 08:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0692510E459;
 Wed, 10 May 2023 08:27:04 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-643bb9cdd6eso4500504b3a.1; 
 Wed, 10 May 2023 01:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683707224; x=1686299224;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fGI6Lm0AtHzSQXtW9u+HWh/q47GLCgh6RMnfXKjtk10=;
 b=YnwK0D3uKISsnbmkLu/Sz2qEaUpF/rrJT6uvrOoLYwds3FdiFRlmjeK476qnd3MGE9
 AJdtQgkElfru8rnQ2nKkw1UTf/5MfGgd9GnsCVqvHrkuD+Emyu2IBMWaIJmUVRi5RxG4
 sMisuF/kJ4orfSI6BK56uzDEOAjgthG/g/oY/TWl+MN49yBtsIIca3n8+bwT67POXErD
 embuMk0HH8YV1SA0WHY4yqOoYeh4r5EBo24AxQcTR65mDc6KIrAC0MvG6pQ9pXRD57PT
 F/hWGRPfhJP6LE/bSa6zVUUxJ/pd7L/60Lw1VYq80XAovRMRZz+kJ7zuqngQnWOr6snr
 iYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683707224; x=1686299224;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fGI6Lm0AtHzSQXtW9u+HWh/q47GLCgh6RMnfXKjtk10=;
 b=NZK5W3CyCs8fcwZp45sgwxMPz+EEDPr/AfplbXAmvip4RvN8KL79NRBtISeJzIduaY
 X/LVxfZUwTbft/rqBXhJDKlAbot51bXuhpo9RoHq8Xu7vpWeGlukDvSkpAxJUB24h9xO
 3oT5+jkKXXLe64odiM7N7fOupdng/f2L7Kasu2e5CRT9Mdjnn4kVUF34NTn5ZO/f4prq
 66nheaxf3zeAOz1rji8ynFq53W+fpfICGcKjPWtHVq6umoc0j/ICdX0a/mWwa7RRN5UY
 7nvk+l8tYZlUC3n79WPfDlOpgdBxKhW9hyhYFYdK6qOxHCz9dP9srFh1vLjKbwxt7nSJ
 PidA==
X-Gm-Message-State: AC+VfDzMl9WORbvm8X8laC0c28CzOEhMra+BtYXAC++1XucZjUjheN1i
 IWcU2HAAzhheLhayZubVQOg=
X-Google-Smtp-Source: ACHHUZ7G4coGPv/o20Pt3xAf2wqBDv9uLRjifxHDFgKM8gjudvDiKaJ8QVkC6VJLFijHhAiDaiMFGg==
X-Received: by 2002:a05:6a20:6a14:b0:d9:250:665c with SMTP id
 p20-20020a056a206a1400b000d90250665cmr20275025pzk.15.1683707224082; 
 Wed, 10 May 2023 01:27:04 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-68.three.co.id.
 [180.214.233.68]) by smtp.gmail.com with ESMTPSA id
 p15-20020a63fe0f000000b00514256c05c2sm2671485pgh.7.2023.05.10.01.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 01:27:03 -0700 (PDT)
Message-ID: <c2168e4f-4d47-0d5d-a1b7-d237f0760df8@gmail.com>
Date: Wed, 10 May 2023 15:26:56 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Le Ma <le.ma@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, "Jiadong.Zhu" <Jiadong.Zhu@amd.com>,
 Yang Wang <KevinYang.Wang@amd.com>, Candice Li <candice.li@amd.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Kernel 5.11 crashes when it boots, it produces black screen.
Content-Type: text/plain; charset=UTF-8
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
Cc: "Azamat S. Kalimoulline" <turtle@bazon.ru>,
 max <kernel-ODwfxu5zp4@maxxor.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I noticed a regression report on Bugzilla ([1]). As many developers don't
have a look on it, I decided to forward it by email. See the report
for the full thread.

Quoting from the report:

>  Azamat S. Kalimoulline 2021-04-06 15:45:08 UTC
> 
> Same as in https://bugzilla.kernel.org/show_bug.cgi?id=212133, but not StoneyRidge related. I have same issue in 5.11.9 kernel, but on Renoir architecture. I have AMD Ryzen 5 PRO 4650U with Radeon Graphics. Same stuck on loading initial ramdisk. modprobe.blacklist=amdgpu 3` didn't help to boot. Same stuck. Also iommu=off and acpi=off too. 5.10.26 boots fine. I boot via efi and I have no option boot without it.

Azamat, can you try reproducing this issue on latest mainline?

Anyway, let me add this regression to regzbot:

#regzbot introduced: v5.10..v5.11 https://bugzilla.kernel.org/show_bug.cgi?id=212579
#regzbot title: Booting kernel on AMD Ryzen 5 PRO stucks in loading initrd

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=212579

-- 
An old man doll... just what I always wanted! - Clara

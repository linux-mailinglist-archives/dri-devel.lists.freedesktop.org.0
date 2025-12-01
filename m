Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AF7C995D9
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 23:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35E110E4A0;
	Mon,  1 Dec 2025 22:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UUIidTnj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C0510E4A3
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 22:17:52 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-6574de1cda1so1944268eaf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 14:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1764627471; x=1765232271;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NBsLveKm3sICituFz5QEcYKz1j6jARt0OPo3VAXwKyU=;
 b=UUIidTnjSa/djKxgcYMrzc3eV/dk5GxPzncSdyAl1ZrYoG+e8hYhlVTaEcHUMpNYyD
 GCqQSNu8PSJF/C9aw09s4QG75LXB2Z1xsZJBw+Ull/QuPxQMhYB36ujUz7lvdW2HUEaR
 ojuNhGKBepX/6VtE/xw2vVgCuPRWy+jMvh5fI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764627471; x=1765232271;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NBsLveKm3sICituFz5QEcYKz1j6jARt0OPo3VAXwKyU=;
 b=H1XsKFnJf2xZmAZ7s56EDzm4TftKoEVwPUL6kxPQTZ5gmXV4ZkNoqNdXkW34eyzvi+
 bf8OZU3qtVaaTh+LYa5mEs/Oo0bEuaEFnQJ75+DztB3g0Te0uZ51kC4X6KXHCX7m9xji
 jNvceEfyMRVnUAKo4g4/npk7tCGyFhoj0I8OBcToFH+OQazo+KWzc6KBLAE/fClw/qje
 B58ullg/SACHMiNoedU5vywHxTGxCxun7pqzIulRh1H6wGEikx8DtxupqafFsOuDpR/R
 S0/WLBtkBJfFufNWSZxoCUFsVvZsP/VBMBGvr/dnOG5YCq+euMYeaFNbWdr8roQ7JKpy
 8jMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDqo2ARHzyimhfmvzy0t5Xib4UqBaDjWLOvw47o7HiTfOKXhaJ4NX4Hqdh3bKodPtKdjWL8HP8EJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHVTn+zvhxW/MP2IpV2VYBoMVEu04ZQ6hUFjJzR0bW9U71zIvZ
 Mz31HY8PuV5v0JSMRv/AIEiwlQXDIy/a4jZQQv3POGjYa4IGXODRjVlaa+cHrI2Ut8Q=
X-Gm-Gg: ASbGncuiJ1fUZRlolWxnojnPByl42Zd1worbE9rAt5R+A7AUjmxVNhlfMgiPpgQrxdq
 Q/b5eiDgGDZFIDhJLMRQDwc9qO5y2QbVLnMCdnlgGJcQNC5nscuGRVTUs90QtUXZ+d04UWClCjk
 gCrbJXShIHuKlRI+OK97u6kFe73uAJ9cIOw2QBWGSm4iOXTguhjFsDA1/c2BXCRm98XTI6rFKmp
 TYqAcWy7gjp8kfKCz/9aWhoLCB9/EDP1qTsgmR1mrgVZSoqtGwe3iz2u+DwBnuBkru3fDl0X0ha
 THhLWoxuGWPJjP5dzNPNUfS+L4xQ1hiIsNcAOpSYloyeMvnJNjwc4+/BvknMj2clbX0U/G3zHA9
 l1nEIJklZUrxQKjSaQcqI7rYgil6Nue4Yo8mw1YY55oUteQfooMDMnWoGDgLdxkN9n8JiGs1KUk
 yQb0KfoylDaXZ00TKISlmH62k=
X-Google-Smtp-Source: AGHT+IGwGazuubSSjxjH+mjuxyXnc2SjhHQSYzG4kYmrbucHzn89mjeC6CXeIgawOINq6D18VrBcqQ==
X-Received: by 2002:a05:6820:2005:b0:657:71ec:5450 with SMTP id
 006d021491bc7-657bdab6274mr10850009eaf.2.1764627471176; 
 Mon, 01 Dec 2025 14:17:51 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-65933cc2b36sm3189769eaf.12.2025.12.01.14.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 14:17:50 -0800 (PST)
Message-ID: <74032153-813a-4a40-8363-cce264f4d5ea@linuxfoundation.org>
Date: Mon, 1 Dec 2025 15:17:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Alexander Deucher <Alexander.Deucher@amd.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: Linux 6.18 amdgpu build error
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

I am seeing the following make error on Linux 6.18.
I started seeing build failures since rc7 and rc6
build was just fine on the same config file.

LD [M]  drivers/gpu/drm/amd/amdgpu/amdgpu.o
drivers/gpu/drm/amd/amdgpu/amdgpu.o: error: objtool: elf_init_reloc: .rela.orc_unwind_ip: reloc 39935 already initialized!
make[6]: *** [scripts/Makefile.build:503: drivers/gpu/drm/amd/amdgpu/amdgpu.o] Error 255
make[6]: *** Deleting file 'drivers/gpu/drm/amd/amdgpu/amdgpu.o'
make[5]: *** [scripts/Makefile.build:556: drivers/gpu/drm/amd/amdgpu] Error 2
make[4]: *** [scripts/Makefile.build:556: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:556: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:556: drivers] Error 2
make[1]: *** [/linux/linux_6.18/Makefile:2010: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2

I tried "make clean" and "make distclean" just in case, still see
the same error.

Is this a known problem? I thought I would ask before I go figure
out what's happening.

thanks,
-- Shuah


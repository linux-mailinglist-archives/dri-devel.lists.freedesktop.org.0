Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF5079FCB1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 09:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F4310E25B;
	Thu, 14 Sep 2023 07:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A1E10E25B;
 Thu, 14 Sep 2023 07:03:10 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1bf6ea270b2so4597305ad.0; 
 Thu, 14 Sep 2023 00:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694674989; x=1695279789; darn=lists.freedesktop.org;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e25qQ9p0C2P5SWU0KD60Ifyzn1bMFGxGkmDRK1NWFGg=;
 b=A1S7tSbA9TX4aeidoBQ3vbKMnpAhYSi3iGgDS3Ay9a5Y0Dn4gLu5c21sztMzbRR38m
 G9oK67RlgqicA3IqmHkiEEgLdhU/FxUkhxmR151c7lhGcIM0WNWqlCvA9SGeY0Y1EOCn
 fxFXvvj3M98eJiSa5QjKFfW5YYMIrgiNAbwaE6WLSrl9nx35nZSxA/9eXjinZVcA6O8H
 RxAksQikS9vvNPQZI3/cRiotIQ8fndYWxdbZUoQuvWnunN/huqAbQbhnaMS7tly7HUmL
 yHiw/QDgIxuYEcLqQqllKtXQUrebfJyGojWdcLw+ztmFpyZHy6Iymyq0vKsW27Od0bbp
 +kGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694674989; x=1695279789;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=e25qQ9p0C2P5SWU0KD60Ifyzn1bMFGxGkmDRK1NWFGg=;
 b=PmK8atNE4dXp3m0c9n6D3z8Kifz2j9dsNUqHfLzswF2jicKsptFrui69eAQdtH8FU6
 YTzPSoQhNxAvRN26lgFYVEb/SYW+aRQBtlwveGlZ/HWAhCQUwYZd6nXxGXQtlcFq4Wmr
 c28TZL1MiZRsGRgtNAGX2cG1Yago66fYJYyefx2M9DLwNFDK4nbMNPKZPZuup2VXSfGs
 ZWosSJVSdRO8SG6RTrWadBGvVyZBshTXlF6nd6z8hynX7okm5T0wWk0BMNWkkaMeNOtP
 HTTywEkO66wTnuGHc3+Vo1GnJuHfeMAtHCNIC17GKJ4f2TYAaDHaYosPM4qkB2IweShL
 hjiA==
X-Gm-Message-State: AOJu0YzYK4Q5kfmB0YbGmcHIlKRsoocr2xZFwyMXNfqXq4MQfO/fOp8I
 AggR4mJxzeG9rSk9qx30Nac=
X-Google-Smtp-Source: AGHT+IE0akRhGk0UGa1FvuBd3BoNxwOFbDloyRSrs4PXKBf116lOnoKRNJaEkHoGyQTfVQgFFg8VSw==
X-Received: by 2002:a17:903:11c4:b0:1c0:b17a:754f with SMTP id
 q4-20020a17090311c400b001c0b17a754fmr4779020plh.63.1694674989443; 
 Thu, 14 Sep 2023 00:03:09 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170903100b00b001bdc664ecd3sm780083plb.307.2023.09.14.00.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 00:03:08 -0700 (PDT)
Message-ID: <2bc62c07-2195-e378-c057-f28e8d4a6034@gmail.com>
Date: Thu, 14 Sep 2023 14:03:00 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Tester47 <e598@gmx.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Kernel 6.6-rc1 fails to reboot or shutdown Ryzen 5825U
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
Cc: Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux TTY & Serial <linux-serial@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> The Kernel stalls at boot very long with a drm-amdgpu message, but fails to restart or shutdown with secure boot enabled or not. Magic key works to exit. Nothing wrong in the Kernel 6.5 cycle.

Later, the reporter (Cc'ed) described the regression:

> Let me be clearer, it does not shutdown at all: magic key for shut down has no effect (o or b). The keyboard is dead. Plus, $ shutdown -r now hangs too. Restart works when using Alt+PrtSc+b. Same when booting stalls for long.
> 
> We started bisecting with 20230903 daily kernel, the bug was there. 6.6-rc1 has been removed. Take good note that next boot log after shutdown may or may not be the same log. Plus, booting requires now and then magic key to restart, because the Kernel hangs.  In this case, we must click enter twice + Esc to boot in desktop. 
> 
> It booted ok after a cold shutdown with enter twice and ESC ounce + backspace. 
> ...
> In all cases, tpm and secure boot are enabled. If secure boot is disabled, when we shut down, magic key works to restart.

He then pasted journalctl excerpt at the point where the hang occured:

> This where it stalls for restart. Shut down hangs at the Lenovo image:
> 
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: SE 1, SH per SE 1, CU per SH 8, active_cu_number 8
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring gfx uses VM inv eng 0 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring gfx_low uses VM inv eng 1 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring gfx_high uses VM inv eng 4 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 5 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 6 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 7 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 8 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 9 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 10 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 11 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 12 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring kiq_0.2.1.0 uses VM inv eng 13 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring sdma0 uses VM inv eng 0 on hub 8
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring vcn_dec uses VM inv eng 1 on hub 8
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring vcn_enc0 uses VM inv eng 4 on hub 8
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring vcn_enc1 uses VM inv eng 5 on hub 8
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring jpeg_dec uses VM inv eng 6 on hub 8
> Sep 13 21:43:08 mm kernel: [drm] Initialized amdgpu 3.54.0 20150101 for 0000:04:00.0 on minor 0
> Sep 13 21:43:08 mm kernel: fbcon: amdgpudrmfb (fb0) is primary device
> Sep 13 21:43:08 mm kernel: [drm] DSC precompute is not needed.

See Bugzilla for the full thread and links to complete journalctl log.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: v6.5..v6.6 https://bugzilla.kernel.org/show_bug.cgi?id=217905
#regzbot title: shutdown/reboot hang on Ryzen 5825U (stuck on amdgpu initialization)

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217905

-- 
An old man doll... just what I always wanted! - Clara

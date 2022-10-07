Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAC75F7F54
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 22:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABB810E240;
	Fri,  7 Oct 2022 20:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C95210E33C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 15:49:51 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j16so7900350wrh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 08:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:subject:content-language:to:user-agent
 :mime-version:date:message-id:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E/g2MqXTMJBiTI2dUhpmKL4Vy8diigManAxEoufcIXo=;
 b=fE/cgAMyoFYHmoGMlcpkA3AaB+9k5PTycBLDfKcYt+pAUcDxVzC6+8aFTzOJn8bqt0
 FSGAlyKjCMEuGzr/U7sTnQRZMA09UUrDo5O27WMdcX6e9EoIKoH8MIZUgUG2IJnVIIjF
 W9boTlm3tQcDlzb1kcj6RkYIlN18IebN2f8v/WkGzZ6U8oQmGy5UrgRov0OJjlPxrgMv
 0J+7oYSBM2KpceTYEnkwp0zmCXmMayT75cg+ZP/WrgPifTh0xaQdo8yzOr3pU9y2u8/D
 rBbPvljjnkPxl5OIe7007nWCHEts3BXvjCYHcLoRdwuPugjGMnPyLySPbwLBgH+X09YD
 F67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:content-language:to:user-agent
 :mime-version:date:message-id:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E/g2MqXTMJBiTI2dUhpmKL4Vy8diigManAxEoufcIXo=;
 b=njgjgGZU7Fa/25STfpm3I8LmPhfRPytx3w271wyErSnL+FvDOOKYqymalrjGw67KXs
 Ij3zlPM81hHSaQqHLFZ8rFHqIx7LNy6b+PfrbQ7zCVyohwfeKcQJJ8Gzqx7Gz6saqIOc
 lT21hVbEMbErMiVW0BpIAj5JIFc/Arnbow2ywbDBwidx4hUp5LB04SVTkf+Qh8w1mkU4
 jkofXYNkfPw4zuFS0Kh4j8O/Q5eZ98HL8690W0/poKW/gKMKmbLudnpQwVRYP3S/dv8A
 btyKe5FFIhLlZzLvSiLlnaAZBwle0ltr8XVGlrwaEjbEaLHuw7xKKDMbldhejup19tGk
 2Y7g==
X-Gm-Message-State: ACrzQf21/vSAIM5wYUD0DzXFvQZ0+sDu9sSS+yryvDkXNVFfixTwjOB8
 BhHL1TQt2L7ClGXpb9sikDV6NFiREl/5yv0S
X-Google-Smtp-Source: AMsMyM6amVdJke7b7rd6ZH9tWfJfVel3BnExPFi/c6YfwVfPHwI2cJikV9SvYh04GSJLJle5SWF1cA==
X-Received: by 2002:a5d:6741:0:b0:22e:2c5c:d611 with SMTP id
 l1-20020a5d6741000000b0022e2c5cd611mr3773017wrw.210.1665157789700; 
 Fri, 07 Oct 2022 08:49:49 -0700 (PDT)
Received: from ?IPV6:2a00:1398:9:fb03:6341:588f:5b6d:9173?
 ([2a00:1398:9:fb03:6341:588f:5b6d:9173])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c0a0a00b003a2f2bb72d5sm12830457wmp.45.2022.10.07.08.49.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 08:49:49 -0700 (PDT)
From: Peter Maucher <bellosilicio@gmail.com>
X-Google-Original-From: Peter Maucher <bello.silicio@gmail.com>
Message-ID: <1d29f323-135e-79b3-4465-7cae724d4294@gmail.com>
Date: Fri, 7 Oct 2022 17:49:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: dri-devel@lists.freedesktop.org
Content-Language: en-US
Subject: Difference GART/GTT and related questions
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 07 Oct 2022 20:56:16 +0000
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

Hi dri-devel,

what is the difference between GTT and GART for AMD GPUs?
 From what I gathered when looking through the mailing list archives and 
the freedesktop docs [1] as well as wikipedia [2],
these terms seem to be synonymous, but that can not be the whole truth
(different sizes in dmesg log, different kernel parameters in 
amdgpu/radeon, ...).

As far as I understand it currently,
the size of the GART is depending on some HW/ASIC functionality [3].
On the other hand, I was successfully able to increase the size of the 
GART mapping(?) from 512MB to 1024MB by using amdgpu.gartsize=1024 on my 
RX 6600, and booting the system.

GTT, on the other hand, is the maximum amount of system memory visible 
to the GPU, shared between all processes connected to the GPU.
As I understand it, using GPUVM, each process can have one or more GARTs 
for mapping?
Apparently, there is also something called a GART table window,
what's up with that?

Also, according to what I found in the mailing list archives,
the GPUVM functionality "replaces" old GART with new GART features,
so what is the difference and what exactly is GPUVM?
If I understood correctly, GPUVM is a MMU using page tables on the GPU?

And, additionally, the addresses translated by the GART(s) are 
optionally translated once more by the PCIe IOMMU,
as the former is located on the GPU and the latter is in the CPU's PCIe 
root complex?
Wikipedia mentions something about (another?) GART in an AMD IOMMU...

Lastly, do any of these numbers influence what the longest contiguous 
mapping is for one buffer to the GPU?
As in: can I map 95% or so of the available (GART/GTT?) space into one 
buffer and have the GPU work on it?

Thanks, Peter

[1] https://dri.freedesktop.org/wiki/GART/
[2] https://en.wikipedia.org/wiki/Graphics_address_remapping_table
[3] https://www.kernel.org/doc/html/v6.0/gpu/amdgpu/module-parameters.html


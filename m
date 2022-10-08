Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3885F84F1
	for <lists+dri-devel@lfdr.de>; Sat,  8 Oct 2022 13:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F05210E201;
	Sat,  8 Oct 2022 11:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A7510E201
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Oct 2022 11:14:36 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id 13so16141860ejn.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Oct 2022 04:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:subject:to:content-language:user-agent
 :mime-version:date:message-id:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E/g2MqXTMJBiTI2dUhpmKL4Vy8diigManAxEoufcIXo=;
 b=kYG+d61hWgiu0jxDX+0pPdpam/ltSY7cSvaq805zk43TbjgefLxLxbWxofnLgNfzSC
 KvKoiYq789IeWzGNHdxjjMlVnbiZ4kEdDdj9tizex3Wx6281E0oqL5DwHgYOZkStEjFa
 ecU2RVMEhxbMdTE949qRrtO3ebt27RlSnByiy3vU3dK2505t6E6CzILVhtzJWxxgkrIY
 cfxS6zN9iUhajfyyjJVJK1o5i4VTDmErqWk192ZRrrZoniBpsgqVQgRYfe5YZ2nIVeIX
 fQaCtYeh5uOTH+R9mMZTsS+MJZ7FPzFJgDuFWYOEgccQlpKOPoRVvsGGWiTi0GJxumh7
 mazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:to:content-language:user-agent
 :mime-version:date:message-id:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E/g2MqXTMJBiTI2dUhpmKL4Vy8diigManAxEoufcIXo=;
 b=GWz2uZZGWzVFcFeBj5D0z6p5qPqu5TuL+vjPbjWYOL26RGYUQFrJ/Uchz0oOmfcIt1
 oSSsnqrISjWPYT7p3ShoEgrlgClJqlYwgAVXuPyIU34WzH5UsM3ZoWfbf5zONMzJ5Ikj
 m5gext5L6eUCDzCcQlV4JkjccTa6eFWw1bat0mANrubDGFbxhWS8TiE7DCNkRWCV4KPP
 61QaFVwnZJTkueidtUytDjt0G/ezun/eXq2KKCdjF21q6AZolIPHj1ZDxV3vuUuIESjB
 Cl9xWBX9mzH8pK6BRIN1y9ce9Trpel7XjrQl5AMalOq9IPcERWin/to/YyHM8g5Dtf/O
 h1WA==
X-Gm-Message-State: ACrzQf3X5PEJK5xPe2IbNlUhy3B7OGTsXM2V3T+xH7ufhbCHQbn26sRu
 tCrjTrx88hIrWw+hijr+eXMPRgNknCY=
X-Google-Smtp-Source: AMsMyM4m1zv7brF8S3ksRzaLQ9EHH8KGviJkEU702iIsx7i2DqFJcLGrDHO1/tgZn4p09nDWfntmhw==
X-Received: by 2002:a17:907:3fa7:b0:78d:96be:7143 with SMTP id
 hr39-20020a1709073fa700b0078d96be7143mr1964356ejc.68.1665227674872; 
 Sat, 08 Oct 2022 04:14:34 -0700 (PDT)
Received: from ?IPV6:2001:7c7:20f7:4001:243:53bc:659d:894c?
 ([2001:7c7:20f7:4001:243:53bc:659d:894c])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a17090631ce00b0078246b1360fsm2558250ejf.131.2022.10.08.04.14.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Oct 2022 04:14:34 -0700 (PDT)
From: Peter Maucher <bellosilicio@gmail.com>
X-Google-Original-From: Peter Maucher <bello.silicio@gmail.com>
Message-ID: <fa9d4fe7-9b3b-678c-f014-96008877de45@gmail.com>
Date: Sat, 8 Oct 2022 13:14:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
Subject: Difference GART/GTT and related questions
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


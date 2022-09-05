Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B50B5ADA86
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 23:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A9410E50E;
	Mon,  5 Sep 2022 21:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C914C10E0C1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 21:05:38 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id v5so9398786plo.9
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 14:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date; bh=2xu9ufF7COCj2Pj+OFGVCC6niLar26JmSUKbKSGjg0s=;
 b=bOaPh0dqRI00nYYxH8DTvSoT4UQ7GFMlMoDixV7Zx9s2PUWTDsEWwhZZNDa+i7AT3m
 R3B/b1HSjULEZQm52p8koTtdz3JD8XcQj/lKMwYIAxkhyQ4lMl4rOuNdjoszs+Auqqv/
 bFha2P3vi1TAYCJ/EJfg5XFdtI9gxMkI3AMGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=2xu9ufF7COCj2Pj+OFGVCC6niLar26JmSUKbKSGjg0s=;
 b=T073B0TSy4WH6jiOIqLh2EfUzfLDCZO+Wq/qKRF9Kwig8RDsagqPZGiFAMfzi0VTKx
 KCrsRYRKV4NGwmwrbfKoeIYcUtcPfybzn98Uq/hbtLusFs208Ju8xndm/ofviOVOpIHC
 BOmW8iiaQNze9tr+z/0uV0FYg5fz3qIQ9JruZKvCFS/FV43Cc5MUrYupiN62qco3n8jH
 E3LjcKlZXotJ3R6kRkVj06U9zK5KU53uvzfs/KhvGYngW2OW119e8ilbhVEAwQd27OZU
 aXMbyCfgRgG1hgiVvgFSC8cL5ScA6Skq9YOn8sxt6u/HbRQfWQNJau5JVQ2oFo7teUOu
 z/+w==
X-Gm-Message-State: ACgBeo2oX1AZhRqAqa4gtNxw6JKmJPcrz5O60yVVBVNY+nSbpbkO3VwS
 LJakNwV3m5wbC0/7peAkB/NkgQ==
X-Google-Smtp-Source: AA6agR6f4ahCA5Yh1pr8IEekOEfXQy5/TBebnT92LfX5NZph+Hu1V5a8po6u/eWpc0pvmIf3/GWUsQ==
X-Received: by 2002:a17:90b:4d8e:b0:200:73b4:4da2 with SMTP id
 oj14-20020a17090b4d8e00b0020073b44da2mr5766559pjb.197.1662411938373; 
 Mon, 05 Sep 2022 14:05:38 -0700 (PDT)
Received: from [192.168.1.33] ([50.45.132.243])
 by smtp.googlemail.com with ESMTPSA id
 b4-20020a17090a7ac400b001fd9c63e56bsm10934825pjl.32.2022.09.05.14.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 14:05:37 -0700 (PDT)
Message-ID: <6e97587f-e101-13cd-0d40-fa3dc4c625c9@schmorgal.com>
Date: Mon, 5 Sep 2022 14:05:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Christian Gmeiner <christian.gmeiner@gmail.com>
References: <20220903060558.55167-1-doug@schmorgal.com>
 <20220903060558.55167-3-doug@schmorgal.com>
 <CAH9NwWd1Q6iGUZoB7j3zAd-Pj_vq4WueguyfhKeWdWo6SPJ+PQ@mail.gmail.com>
From: Doug Brown <doug@schmorgal.com>
Subject: Re: [PATCH 2/2] drm/etnaviv: fix power register offset on GC300
In-Reply-To: <CAH9NwWd1Q6iGUZoB7j3zAd-Pj_vq4WueguyfhKeWdWo6SPJ+PQ@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 9/3/2022 4:49 AM, Christian Gmeiner wrote:

> I had a quick look at what vivantes kernel driver did. It uses a per
> gpu instance variable powerBaseAddress
> that gets set accordingly. I am not sure if I really like the
> gpu_fix_reg_address(..) idea, as it gets called on every
> register read and write. For me I see two other possible solutions:
> 
> 1) Add two seperate helpers ala gpu_read_power() and gpu_write_power()
> where we do the if beast.
> 2) Add a power register offset variable to etnaviv_gpu and explicitly
> use it on for reads and writes - like the Vivante driver does.
> 
> But that's just my personal opinion. Can't wait to hear what Lucas thinks.
> 

Thanks for reviewing so fast! I honestly agree. It felt kind of dirty
modifying gpu_write and gpu_read. The reason I went for it is I was
thinking that in most cases the compiler is going to optimize the ugly
"if" out.

The two solutions listed above both sound good. They would need a
special case in etnaviv_core_dump_registers, but that's probably much
less nasty than modifying gpu_read and gpu_write. Any preferences from
everyone on which of the other two options I should do? The
gpu_read_power and gpu_write_power approach sounds pretty clean to me.

Also, dropping David Airlie from the chain -- his email address bounced
on my original patch messages.

Doug

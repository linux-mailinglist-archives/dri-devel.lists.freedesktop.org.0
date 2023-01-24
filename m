Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCF1679B39
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 15:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CB910E12F;
	Tue, 24 Jan 2023 14:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B9510E12F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 14:12:35 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t18so1191415wro.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 06:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:subject:from:cc:content-language:to
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KyjAnkGTOIUcY2OPQUdaDudcqSL1I6CVv2i41HkOOoE=;
 b=EYms7LJZP0tVJc2XtjTdnrwFPFm4MHIsK/6MVKF4EQ/UNh2ocOzc1ZHhorktyTr/N2
 eNPPrU4GPp/OF4AuwVIZI7gc5WtATyLZ5zdkmnmHWnu9BwXnnuL+MQDG1089VKSCX2Ia
 RZ8JYFxwdMjFk+HTLLlIIGWfY36meuHhpaJj5Za7ar7oDbT/+xQW8YFUqQzbEUvzvmiA
 Nvd7FHFyDKEyHiRmdBsnNKBYIPA3wKCWv80DyUvrZ6eJtlwyGwhHT5Pf4O3WVtOdDUBB
 ySezjMK35dZRcY5TS9KrMoXKR/ppM76BX8hcn7JDUlydEBBOOQ4M0Y7jSIJsrHuIrnAZ
 Ju+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:content-language:to
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KyjAnkGTOIUcY2OPQUdaDudcqSL1I6CVv2i41HkOOoE=;
 b=vI0cLzJRM2n/Mh4DnqhFNA4RX3FiCwLAosh74G3joiDIugTgiuLjnbkE9ic2Y4+VmE
 ZUg0g+z2V1fW+m//EVLM3zImV0yOWoZR0oHWlXDtMsJ82PvbJsHYef81H5KjWYJYCrUT
 F1OFwYJJo6CQD7QY7QT1SwmN5kuM7XdLDfBj3NKmsSFM29s2nQoQjwkaFi0Ox5F/GKzD
 CCGXtVImR+Bk0hDt5bk5eYG+nYCvnB7wCDp58MENyYffJOJWC1LoU4dBjA55RXIOkBzo
 hzPM0Fjs/X+8boF4cDrvByHOCjDn2hh0mWoG0AmlheLXSoWAL7tHkH8gu1eN3viVs6WE
 tztA==
X-Gm-Message-State: AFqh2ko6bNHNY2SKe1zm83YOhocwtud5qWOsSoYaWniD3vdh/FJt4nUK
 79HTxT/Noq/vy6ge5JQEBCo=
X-Google-Smtp-Source: AMrXdXuV2PXGs2EmhO3HhPvH41HN7FLf8t/+nqWOxf4Oi9xJD/N11MFqxrgqM9ij3UeSpI4uymvncA==
X-Received: by 2002:a5d:6b42:0:b0:2bc:7e6c:7cd8 with SMTP id
 x2-20020a5d6b42000000b002bc7e6c7cd8mr24600153wrw.26.1674569554400; 
 Tue, 24 Jan 2023 06:12:34 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 g9-20020adfa489000000b002b065272da2sm2061230wrb.13.2023.01.24.06.12.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 06:12:33 -0800 (PST)
Message-ID: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
Date: Tue, 24 Jan 2023 15:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Amdgpu module is references even after unbinding the vtcon
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>, "Slivka,
 Danijel" <Danijel.Slivka@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

we ran into a problem with the general fbcon/fbdev implementation and 
though that you might have some idea.

What happens is the following:
1. We load amdgpu and get our normal fbcon.
2. fbcon allocates a dump BO as backing store for the console.
3. GDM/X/Applications start, new framebuffers are created BOs imported, 
exported etc...
4. Somehow X or GDM iterated over all the framebuffer objects the 
kernels knows about and export them as DMA-buf.
5. Application/X/GDM are stopped, handles closed, framebuffers released 
etc...
6. We unbind vtcon.

At this point the amdgpu module usually has a reference count of 0 and 
can be unloaded, but since GDM/X/Whoever iterated over all the known 
framebuffers and exported them as DMA-buf (for whatever reason idk) we 
now still have an exported DMA-buf and with it a reference to the module.

Any idea how we could prevent that?

Thanks,
Christian.

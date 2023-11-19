Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07DF7F069A
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 14:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BF310E0F8;
	Sun, 19 Nov 2023 13:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EB610E0F8;
 Sun, 19 Nov 2023 13:53:40 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1cc68c1fac2so31504045ad.0; 
 Sun, 19 Nov 2023 05:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700402019; x=1701006819; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QKKLS+w0ex8qV597KBVIuYVHQ6+SkzFRNWt3xyBrGms=;
 b=C180Iyj/K9/igyenuxGgka+7LtNglxrue5sZeMkFElbRXT1i3k8z75DanIS1xuPyNk
 mhw46JthE6Yxo+5cYbAGpx21RDpFFFrlHVZgswt8WT6xo5dTJ6On2/Ooee/Hxn2h2C4Z
 yeoNg5PW+cpMpnNJUEgiZdLgbM1wnuNjTANgdVoPsr6fsqb7mieHq4x/+XsEi62nDQr6
 he81zVAJWrKR6mlrrVWV8jHQlHfl7FKeMqpWRyjKt97czRKYLCmUVE00H7Lt9My6JtJb
 6pQK0GsZZJ66EJ2xzpDAsTtOhs1Bv0Xw43lVbq5sbcqi0/PtF/qFBquuS4DP+GWzabZ3
 b+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700402019; x=1701006819;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QKKLS+w0ex8qV597KBVIuYVHQ6+SkzFRNWt3xyBrGms=;
 b=oQufWki8dGDjVY2Q1vfGu3jPOUgaXqp2KQpTlbRKyb56YeYo4XXXn6EofK+gcV1C9c
 DEFsXOV35AvC/IfVhgIPn2h0nb9HOoQ0BToUer8HCodia3hrtCURlBVDPUXTlP1SLd6Z
 A4E3A4/+eJl2uAqEV4T1E0oK76hVxA2fN99Om/66hnCJLQQESUK33VWg8cUL49KF5vhs
 Mxg2owoLa+ULHXEojhZBTwXJ09Vgqmck8tcgPxEorr/irt14MlRvkIRzyjxdPC2Finad
 aVEjouOPKu2sbz62KcXuQ0sJzePqz+ymD96tygfCKyQ2r3QpYejoPPEeLigIxvWRC8jt
 GhEA==
X-Gm-Message-State: AOJu0Yxay3d5mFtd6lZnOZ5+LWJR4hnRoNRxm6qbjlO9SI7tvQchosC4
 aki2zDBcl/83awAhKYRB1+s=
X-Google-Smtp-Source: AGHT+IHriLxPDpGKhWAjBZMWDVWsozrin31cIWjg7jAzFtJ80MgWjLRxNJXU2ldtCC5/2LJ3VhQf8w==
X-Received: by 2002:a17:903:495:b0:1c9:ff46:163d with SMTP id
 jj21-20020a170903049500b001c9ff46163dmr5386849plb.38.1700402019602; 
 Sun, 19 Nov 2023 05:53:39 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a170902ee0400b001c55db80b14sm4372776plb.221.2023.11.19.05.53.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Nov 2023 05:53:39 -0800 (PST)
Message-ID: <af2d08ab-54c3-4066-9c28-18e96de8643a@gmail.com>
Date: Sun, 19 Nov 2023 20:53:33 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Radeon regression in 6.6 kernel
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Dave Airlie <airlied@gmail.com>
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <ZVoMklvIVClr_IIH@archie.me>
 <9195ca1f-1d72-4616-8bdf-62f9f5c636b9@leemhuis.info>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <9195ca1f-1d72-4616-8bdf-62f9f5c636b9@leemhuis.info>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Phillip Susi <phill@thesusis.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/19/23 20:48, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 19.11.23 14:24, Bagas Sanjaya wrote:
>> Hi Dave,
>>
>> AFAIK commit c07bf1636f0005 ("MAINTAINERS: Update the GPU Scheduler email")
>> doesn't seem to do with this regression as it doesn't change any amdgpu code
>> that may introduce the regression.
> 
> Bagas, sorry for being blunt here, I know you mean well. But I feel the
> need to say the following in the open, as this otherwise falls back on
> me and regression tracking.
> 
> Stating the above is not very helpful, as Dave for sure will know.
> Telling Phillip that he likely can skip that commit might have been
> something different. But I guess even for most users that are able to do
> a bisection it's obvious and maybe not worth pointing out.
> 

I was scratching my itch then when replying. Thanks anyway.

-- 
An old man doll... just what I always wanted! - Clara


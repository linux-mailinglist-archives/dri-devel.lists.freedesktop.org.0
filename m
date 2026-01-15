Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D674D22582
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 05:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E6610E187;
	Thu, 15 Jan 2026 04:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MswurlFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2751F10E187
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 04:05:03 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2a0d5c365ceso3723975ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 20:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768449902; x=1769054702; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UKefXX9KTkiQnQU4SrQGPHAT+zK2SvRI2HKryej3vYE=;
 b=MswurlFWNXPbVT3YQvD1BgpAQtvMIlVK3bWxi/QJRkFmf0rlF3p5RXU7FndsE8jQFG
 akegs7IXG1QElHW4p/Xl4uvRVQV/wMdvvsDV3gzA9m11jNv6anN08q4iPv6s+5sYFOrL
 VmpZdGd8tOs5xjl9Z2Czb6A2En4jqHcZYBZ7EmSSHYM04PQ+La/3HKK/5ZEmtdBns36p
 MI3V+aCL/O6yjVAUOZ7J44Tj+C1I9/VmJgHFHuVdPfV3NC/p7buLlYX3DJC8VMHnbqht
 sRscTgHfLW5h8otdIaUOg1Hftyyte4477zk2brq2oCYqfKMCxiRk6Z8zQmlBYpqdCd1h
 +/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768449902; x=1769054702;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UKefXX9KTkiQnQU4SrQGPHAT+zK2SvRI2HKryej3vYE=;
 b=C2O3QdQH2TcBpHHuRVDb9GCV/QIVmvEp6sx0hA9NKNIcWb2erLFR7N355bGWCJHfQO
 iH7qBYag5pHD/wwVCd6CIee+BtSfJDoHW8rmxYZxCreRwiQVhWC7ZyubqX8TSTSI0TQ0
 vNRIimkHXqOxqs5y7oWngL9LMZ6uwKJ2xXYWYCiTZRylwwyuitM8rNFv+eHFaJ+fW9qQ
 YHoNcN5Lx/7M0QcQqq8RVaqxLscSI+3CyVUQA7JzIfdKAnV2isuy3g0crNNjDTobbcYk
 2ZwPaSVRov8+Ti29tfFKFUTcCBaiUPy2gMuO8/8HzkTL4dRw+4FjCCee8s+ewK6FoeDP
 v/ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNBvgtxVKnq1dsgtbYkSAKYJjKsuBg3osB5OSLpyJsghPWwUI41LDYBLwIWMdEBURWwBORLLYtfPY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPXK1fmNA0Jbjn09qT0eoizoZ/ZFoJZ2BIo6i5AcT7TxKwWmZd
 VascCUfsaayiabT43eSHtKzaAW2oBYw44YwRpr2arqUtwqQcfSIj8Mzl
X-Gm-Gg: AY/fxX7MlN8FlZW1nelysigs9d+4aCDg1DEQ7qschlip8e2Qr+XTuj4vC51SfCAQGXV
 VhDH0ajIX8bBgKcmttRTqorUUBCs+QU9JFBxOYkXn/X2ErMVsSrTTgpioDkhC7A9XsE4TM1EOjE
 dHGq1zBt3eZ0l3qKDli3/cYDrUevFV46BGVqrXzXaPoZZm+4ooteW2Xf+FCZc4fKjxa1ROQJg5E
 jypW/BSdNzy5F6ptLiHfh1n6kUNSi65P4eSzrCRQ92jqkTN81/VQbZbmvwtNTrjA/Jn3DNsaBhf
 Ssfy8WazWVHC9nN0xUMzg7uRFLK2Usq1ETVVuOBYQ/9lqjFUhsPSQC/WdaNIMAIQC7a4IxbBHqZ
 wbjKYf7v7Zxfawl0F/1t8qTXeTsOQQcIo8Mwpc5J1qirCnEykWox2pWS9i6nLRFO/UKNtwEzEa8
 oW40KD8WReEmqZWShzH6C0F7FJ0JEm8SdZQEqa3UxEm2ZbBIxaNPrLYPvreevQ
X-Received: by 2002:a17:902:da82:b0:298:55c8:eb8d with SMTP id
 d9443c01a7336-2a599e2411bmr51391755ad.35.1768449902516; 
 Wed, 14 Jan 2026 20:05:02 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:e9f3:c6f4:5dd4:2565?
 ([2601:1c0:5780:9200:e9f3:c6f4:5dd4:2565])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cb2d79sm244924275ad.56.2026.01.14.20.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 20:05:01 -0800 (PST)
Message-ID: <ed199efe-f6b2-426e-b679-ef1f019e6433@gmail.com>
Date: Wed, 14 Jan 2026 20:05:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] staging: fbtft: Use fbdev logging helpers when
 FB_DEVICE is disabled
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, andy@kernel.org, deller@gmx.de,
 kernel test robot <lkp@intel.com>
References: <20260113045909.336931-1-chintanlike@gmail.com>
 <2026011341-chomp-protegee-6be5@gregkh>
 <a2d5cc20-5160-4294-bda1-3d5b645ec787@suse.de>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <a2d5cc20-5160-4294-bda1-3d5b645ec787@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 1/14/26 03:38, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.01.26 um 07:16 schrieb Greg KH:
>> On Mon, Jan 12, 2026 at 08:59:09PM -0800, Chintan Patel wrote:
>>> Replace direct accesses to info->dev with fb_dbg() and fb_info()
>>> helpers to avoid build failures when CONFIG_FB_DEVICE=n.
>> Why is there a fb_* specific logging helper?  dev_info() and dev_dbg()
>> should be used instead.
> 
> Fbdev is entirely inconsistent about its logging. There's dev_*(), 
> there's pr_*(), and even printk(). The problem with dev_*() logging is 
> that devices are not always available. The HW device can be NULL and 
> might not be all that useful in practice. The Fbdev software device is 
> often not even compiled in nowadays. (This patch is about that problem.) 
> Hence the next best option is to make fb_*() logging helpers that 
> address these problems. They are based on pr_*() and print the 
> framebuffer index, which should always be available after 
> register_framebuffer().
> 
>>

Thanks Andy and Thomas.

I’ll update the commit message to clearly describe the underlying issue.

I’ll also split the changes as suggested in 2 patches and send v7:
1) a patch focused purely on fixing the compilation issue by avoiding
    info->dev dereferences (using fb_dbg() where logging remains), and
2) a follow-up cleanup that removes or downgrades the framebuffer
    registration message to debug level.

I’ll rework the series accordingly and resend.

Thanks for the guidance.



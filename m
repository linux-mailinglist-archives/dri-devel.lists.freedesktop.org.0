Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B22F578D679
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 16:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7DD10E52B;
	Wed, 30 Aug 2023 14:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DE910E52B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 14:22:27 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-400e8ca7e38so50140055e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 07:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693405345; x=1694010145; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4U2CbxtVlmiq+ihjNNutQ199sDet8tnlLfhNKh7rYD4=;
 b=cBGEnwSsGIzEo+sp2rtTRMcsPKHHCVHIEuAesSwOSBaUXQu+OpXiscfNwM5SOINoF5
 JTnPAo+UWXNIEoUX4FZYoQyZuntnLxWCyMi++5IiVDY5W48vJihS+kLVVya1JJcFtwUX
 gFH+S8P89yZP4M2yTY3D3YmVGYJAfKW5Zwpw731vrO1xTJv3TMUg6XOFOpKMss8jgu7f
 W1QnRcjqYC9ioDKrf4TYYeXj/gSsSWMKma3IjjD2fNG0DdPEhvVcDyoK1dhK7TlVLPNI
 0Dua9dAo9bqCaRO1Qq66VQSFtfbQCxvADY0fGD+iYPi65BxJub7ZOqfEkB+AOU09nLOb
 hkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693405345; x=1694010145;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4U2CbxtVlmiq+ihjNNutQ199sDet8tnlLfhNKh7rYD4=;
 b=i1dzhWbSBs0TQIkWiP3xQJjTZK7PWH5VI2/gflRivNCIlCDoihmy6W4prckwwjNUWk
 8QPRCl3u3jWVwBKGipqqj7y66j+OXGXNn0UEUSRJ48OKoVqpR3gNDkBEmoFYSnEL/mSn
 TqDipdudY2XyIEVsCCngTtxXpNQCAjjFt+KOzsxUy5mN6wQdKDNa3hcIrEskAPl3R7Qa
 cpFODeFbV0HRB7Xk9KEN0Nr9uWgZcai/cKVKHuifEb94etxLa9K8PHcW86f9PQM1+Tzh
 aflM8yqlW2Ty0EM+3C6/lRl+mKEHXEeJGtpy7K9btpHq6uOBFF7g8WTfAaOK3A1dtv+d
 wNow==
X-Gm-Message-State: AOJu0YyXLiUQAknNwNedrZkPFT1jXdBalTy1m28lkm32zUAWMkj4i1vl
 rEJdrCZ+Tac2a81uz6RQCk6yvI3mwKnHag==
X-Google-Smtp-Source: AGHT+IFqdvLPnrsT3a/vbSOwfe38H7wTStYgAUNwNqaU+zNCLshg4THznHzE5va//hBXxfo5SUQSeQ==
X-Received: by 2002:a05:600c:3784:b0:401:264b:5df7 with SMTP id
 o4-20020a05600c378400b00401264b5df7mr1955221wmr.35.1693405345199; 
 Wed, 30 Aug 2023 07:22:25 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a7bc385000000b003fe61c33df5sm2449004wmj.3.2023.08.30.07.22.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 07:22:24 -0700 (PDT)
Message-ID: <ac08d34a-4d63-21a5-01bf-10c90d268165@gmail.com>
Date: Wed, 30 Aug 2023 16:22:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/5] drm/debugfs: drop debugfs_init() for the render and
 accel node v2
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230829110115.3442-1-christian.koenig@amd.com>
 <20230829110115.3442-2-christian.koenig@amd.com>
 <ZO77dr0tyCWY135z@ashyti-mobl2.lan>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZO77dr0tyCWY135z@ashyti-mobl2.lan>
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
Cc: ogabbay@kernel.org, ttayar@habana.ai, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.08.23 um 10:19 schrieb Andi Shyti:
> Hi Christian,
>
> On Tue, Aug 29, 2023 at 01:01:11PM +0200, Christian König wrote:
>> We want to remove per minor debugfs directories. Start by stopping
>> drivers from adding anything inside of those in the mid layer callback.
>>
>> v2: drop it for the accel node as well
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Is that for just this patch or the whole series?

Thanks,
Christian.

>
> Thanks,
> Andi


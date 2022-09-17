Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B475BB90E
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 17:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0B310E3D1;
	Sat, 17 Sep 2022 15:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3983610E3D1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 15:18:44 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id sb3so25844445ejb.9
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 08:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=SXmSD7rQesiFD0RXizg8ZPh0M25mEIP++dLEWBB4dHk=;
 b=n2NBW86burrRr2b0WpKrhi1JUZSvVeLMkC23Lcm9Qv37+oOYky5CqJ/3ccdVKW6sQo
 axRkEBTEAmukfVMIemg2AkkaiO4NzN+HvoVyqqUFAz5iv3g56iFMb3YkysbILeefloOJ
 8xXH+xBGQxuhC3m+irmx/y2PzmwD74AwYtRZlWz9hgRG6OlYkT1knq3+e/uOz9DJrMLo
 fB4lc45a7UTBk7LtE3fdRTvFNQHfCM80/a9Sf89ckLmwtHakonNUYweT4xt30cmwKNyN
 ZQAbuhmxJw9JgsUmesy6dbRumPuf22wS2sS3YQbCQux+gukeQiLGqjc5anTLNl7QjdhW
 ZVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=SXmSD7rQesiFD0RXizg8ZPh0M25mEIP++dLEWBB4dHk=;
 b=f4f4hdxCdXsFV4EOss7vgAz6T61+M6y4U0wO+6aaJEG4lfOYfUMKR+Zo8TTtC8ALb5
 sv6FIcrU1IEm8DFPAdZO2j2d/CiSYqzFMCNsm2rmkVV+KNrA3c8XP/YuLXxF6UwT0TxM
 pI/lg62fHfR08gxg3yfXJry8B4H0t9fqfN0N+2yzgXAP+CeuPy5Elj2aawQmhpWlb79j
 UPyoy5f6Fi4pwD7K7CGxXIiGyZnNTri1gPui+0KQ9H5NmKoSqrBx94ZYupNSp3VWnd8g
 Q6ksyGVBGJ8AVqRIYfS9kKIBKsyviJ1dmO9WbFvS2TYsG59FWeBBYjLPwgdGL6FPb5L8
 AMIQ==
X-Gm-Message-State: ACrzQf3XR9oLrNmudjSfNd0rW+M8pqZvwWwphvKCdehxKID/7o8H3Plt
 kecExQ8Ms66PkEGCZnXZ22c=
X-Google-Smtp-Source: AMsMyM4a3iu9JCgycuHuL0IcblQFnT1VvNcPYiEwQVqgZZuK7aIkT2bKq8MW00RxrhCpGKQFNbYSSQ==
X-Received: by 2002:a17:907:7b95:b0:731:113a:d7a2 with SMTP id
 ne21-20020a1709077b9500b00731113ad7a2mr6812718ejc.377.1663427922507; 
 Sat, 17 Sep 2022 08:18:42 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:89be:3f80:f009:10f?
 ([2a02:908:1256:79a0:89be:3f80:f009:10f])
 by smtp.gmail.com with ESMTPSA id
 d12-20020aa7d5cc000000b0044e937ddcabsm15886004eds.77.2022.09.17.08.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 08:18:41 -0700 (PDT)
Message-ID: <c958d871-9a89-3490-f5e3-3a2441926074@gmail.com>
Date: Sat, 17 Sep 2022 17:18:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linaro-mm-sig] Re: [PATCH v4 0/6] dma-buf: Check status of
 enable-signaling bit on debug
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220914164321.2156-1-Arvind.Yadav@amd.com>
 <d2d81ffd-2269-bdc6-0daa-8f3a99306e46@amd.com>
 <33a16b15-3d3c-7485-d021-ee2a727e5391@amd.com>
 <691c421f-1297-cd08-ea70-6750099275b1@amd.com> <YyVmYXGCfTuYUsNb@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <YyVmYXGCfTuYUsNb@intel.com>
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
Cc: Arunpravin.PaneerSelvam@amd.com, airlied@linux.ie, gustavo@padovan.org,
 amaranath.somalapuram@amd.com, linux-kernel@vger.kernel.org,
 Arvind Yadav <Arvind.Yadav@amd.com>, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, "Yadav, Arvind" <arvyadav@amd.com>,
 shashank.sharma@amd.com, sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.09.22 um 08:17 schrieb Ville Syrjälä:
> On Thu, Sep 15, 2022 at 06:05:30PM +0200, Christian König wrote:
>> Am 15.09.22 um 15:02 schrieb Yadav, Arvind:
>>> On 9/15/2022 5:37 PM, Christian König wrote:
>>>> Is that sufficient to allow running a desktop on amdgpu with the
>>>> extra check enabled? If yes that would be quite a milestone.
>>>>
>>> Yes, It is running on amdgpu with extra config enabled.
>> In this case I will start pushing the patches to drm-misc-next. I'm just
>> going to leave out the last one until the IGT tests are working as well.
> ffs Christian. intel CI blew up yet again:
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-glk7/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2.html
>
> The last time (some ttm thing) was just a week or two ago,
> so it's really getting tiresome watching you push entirely
> untested stuff all the time. Would be really helpful if you
> finally started to do/require premerge testing.

Well first of all sorry for causing trouble, but as I wrote above I 
intentionally left out the last one to *not* break the IGT tests.

The patches pushed so far where just updating a bunch of corner cases 
and fixing the selftests.

Do you have any more insight why that should affect the IGT tests?

Regards,
Christian.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AE26A65B3
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 03:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027FE10E0A1;
	Wed,  1 Mar 2023 02:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431B810E151;
 Wed,  1 Mar 2023 02:42:32 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id y2so11871562pjg.3;
 Tue, 28 Feb 2023 18:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677638552;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TtEI17+g3+FYNmzjZog7TObGaEISKv33yP7XaUgcMpw=;
 b=C2awFZi3UZK1zN88aASBwpbUmIyVjmgoYglFuONN/+0apTYd5IWDuLiOz1c1VN8upZ
 6mlskXUv1yXAzEH8dxRsozpV2xWpBd80NAmpQGfUmvJrKEuXhVvb/V6prcMvsaRZiCo+
 iXCFzMv9fj9v6B/f7hkrooQoUAGi4cO0UN3c8UHZpBrPIC1gOPBU49wHROJNBocEHvmp
 tb3cm050fGMauVRXy7ifSfX1VzGGFhZ3tAEBXlF+mQg8FsIVHkeT8V5zrFCozrWvuK8Q
 9rrdYm6eG1V39BS+g40xVcIy99Q0FgF6YWINYxQvQWe/rGwLsUCHKm73ixthff5BDTcM
 E7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677638552;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TtEI17+g3+FYNmzjZog7TObGaEISKv33yP7XaUgcMpw=;
 b=r1++koWFEHdMNiEVbhjcmytVRLhe9X7NlWzlYyuwAvr6C/qNJecxPVDTaBFpVvzjff
 n0ckk3fnPHGTfmJb9yAqtOKEJLYyhTS+rtm95l/YpzzMkmZ6lzvJjA8158TIlCJT8uU3
 sB/GjykQ5JkE9VJXFXfNZc5EeIh708GixcFMNT73X8p0rN080wPu8x5xIb7tlsLwBrbw
 a6akuBqRsaTlaoWs4GF1QsS4Q/D3BFQwbae0L1I7vwTLiJmaIo09W2RrzSNrJzgIwPVW
 f6LpVlNNERBAq4gGta3jfvzJg9Czi8RdyhfAC5S7OI03mSsFvyNf2Kf/GdvgPbwpCcEn
 /pzw==
X-Gm-Message-State: AO0yUKWQzJbkpe8GHE+IN2RwZec1zsKdouLDSAsT4Cj771HuQgDwHctv
 T7fHiPGsQzAVKIDWs8k16jw=
X-Google-Smtp-Source: AK7set/i/rEne9Miy3soqJWFleyHZluwc5UHR+jsPgrNaLUUlsoxf8qLJ7q2HYdNV1zs/GO9IiWdsQ==
X-Received: by 2002:a17:902:d54d:b0:19e:2298:c53d with SMTP id
 z13-20020a170902d54d00b0019e2298c53dmr4379817plf.10.1677638551793; 
 Tue, 28 Feb 2023 18:42:31 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-27.three.co.id.
 [180.214.232.27]) by smtp.gmail.com with ESMTPSA id
 ju4-20020a170903428400b0019a7563ff15sm7198090plb.115.2023.02.28.18.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 18:42:31 -0800 (PST)
Message-ID: <7aaf6ed9-3da2-0535-f269-fc5c35e7aadc@gmail.com>
Date: Wed, 1 Mar 2023 09:42:14 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 00/15] dma-fence: Deadline awareness
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230227193535.2822389-1-robdclark@gmail.com>
 <Y/320d96QmbLe1J8@debian.me>
 <CAF6AEGuqHDDQS22qcp8sk+5bj16XFiBarCLvpX=qNc2r2euMUw@mail.gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CAF6AEGuqHDDQS22qcp8sk+5bj16XFiBarCLvpX=qNc2r2euMUw@mail.gmail.com>
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Gustavo Padovan <gustavo@padovan.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Liu Shixin <liushixin2@huawei.com>,
 Rob Clark <robdclark@chromium.org>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 intel-gfx@lists.freedesktop.org,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/28/23 22:44, Rob Clark wrote:
> You can find my branch here:
> 
> https://gitlab.freedesktop.org/robclark/msm/-/commits/dma-fence/deadline
> 

Pulled, thanks!

-- 
An old man doll... just what I always wanted! - Clara


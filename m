Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1408E4DBFED
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 08:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DC110EC8E;
	Thu, 17 Mar 2022 07:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CB310EC8A;
 Thu, 17 Mar 2022 07:03:31 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qx21so8664851ejb.13;
 Thu, 17 Mar 2022 00:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sazQiAWvhpWP9YG0IC5k1xhZbcWvBCfizFO/nBdTn/8=;
 b=bmX9Y33nJ0eaV2XpxFxr35BpyZE+ZPiRnD93sqipXVldSQJ1XfxmghMhzrMx1AoqD0
 Rzhcvb/mUU2Dc7QW4VIkpf8UjUHMprjhfSaM5l+2cxq/qeCTdn7UfHKZni37D/DWF5zg
 qIKuqYAB68DrcuP1DQt0FoxyHin3BW2W7hXpmzi53BcjonAokGvZ0avvIrfGT5eoA1Zf
 hz3+vlp7VIghdKPXOxyXad+3VlWatlR9Bq4B3RHtGgDRIbf80pkq5bI79dvhIJAhMPQH
 mh2veyOk+rWSPCSJIFLsFqO9aG+4lGazWrPkdvv2933NV3FAZa5kXoAgzu36yAmwEXWT
 YCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sazQiAWvhpWP9YG0IC5k1xhZbcWvBCfizFO/nBdTn/8=;
 b=t1BtqeAw6bkOLW4hGUa2CxD92b8ZKR97Ybrc2Z7bLAFV/kkoZ1ZTFqteyBF2g5f6o4
 jGB19OB7xBy1z4I8WXDrgUhmWd3QaWJ876aKu/C9gL/Ss2e3iXk4FVyPVDJfBYCT5rNd
 xZ1vcUuhS3o2QyWmPOSVWqi6ozVuVH63F1C26I6QBX85n4yFEN011wQK45vS/V7pTdXh
 qsWJ3in73fFPR3KusIcOWGL/1WbKGLlQ4WDGqxjPCK1KzsrnuCkU6w8WEL7DIYytaj6H
 L/8XsmEmsWzfqphAHhCWeVC6eqMlL3ebcNsq2iVtPN0MzcYkyfQgQx2HCeM03oFA6BY3
 uLRg==
X-Gm-Message-State: AOAM533lrzM0adStKpyYpRAq3eaUJi2GXRPU7qSpbJEY7TGaUeljFDal
 3haHwYa4Lh+2cZiqpfUCTxU=
X-Google-Smtp-Source: ABdhPJyIj5JM/G5TiKzbSIPzAdjtd8OoqltNSibx8tieYO6apW+A3UogIi0GzX5CtptM7AKQ03y6eg==
X-Received: by 2002:a17:907:8687:b0:6d7:8f6a:3c0e with SMTP id
 qa7-20020a170907868700b006d78f6a3c0emr3001484ejc.500.1647500609636; 
 Thu, 17 Mar 2022 00:03:29 -0700 (PDT)
Received: from [192.168.178.21] (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 bm5-20020a170906c04500b006ce6f8892a5sm1956961ejb.7.2022.03.17.00.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 00:03:28 -0700 (PDT)
Message-ID: <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
Date: Thu, 17 Mar 2022 08:03:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
 <CAF6AEGvvskobh6YOUx55_4rtXJJjPO0PxWY8+EKiVqntT3k+ug@mail.gmail.com>
 <6b400b8b-1b5c-a339-2345-f317f197b4a6@amd.com>
 <CAF6AEGt0XhqzkyEhbNcNVQO_A_Lo4qcsPRZRL6QqYn+NWAfv9A@mail.gmail.com>
 <bf6922f0-da8e-eef6-8217-26c1f50f3c48@quicinc.com>
 <2980e6a0-624e-2b80-c5d0-c40dfce76fb8@amd.com>
 <CAF6AEGvC=k4xLA-0iTSf660X2o04E+ivjnThZA-=WANKzLSvpA@mail.gmail.com>
 <cda15a47-f469-2a7e-87b6-adf00e631ef0@amd.com>
 <CAF6AEGv3Wv+p1j2B-t22eeK+8rx-qrQHCGoXeV1-XPYp2Om7zg@mail.gmail.com>
 <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <20220314172647.223658d2@eldfell>
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
 <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.03.22 um 16:36 schrieb Rob Clark:
> [SNIP]
> just one point of clarification.. in the msm and i915 case it is
> purely for debugging and telemetry (ie. sending crash logs back to
> distro for analysis if user has crash reporting enabled).. it isn't
> used for triggering any action like killing app or compositor.

By the way, how does msm it's memory management for the devcoredumps?

I mean it is strictly forbidden to allocate any memory in the GPU reset 
path.

> I would however *strongly* recommend devcoredump support in other GPU
> drivers (i915's thing pre-dates devcoredump by a lot).. I've used it
> to debug and fix a couple obscure issues that I was not able to
> reproduce by myself.

Yes, completely agree as well.

Thanks,
Christian.

>
> BR,
> -R


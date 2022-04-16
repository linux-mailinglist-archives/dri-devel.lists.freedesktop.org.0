Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8325036AC
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 15:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2729610E10E;
	Sat, 16 Apr 2022 13:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6017B10E10E;
 Sat, 16 Apr 2022 13:00:19 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso6355152wml.5; 
 Sat, 16 Apr 2022 06:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=XHVUz1b0D0ZF/noy7ANM+++7WGGRFc9oyw89kqgSdjE=;
 b=pahgvwHqu3mBCsoZTQUS0VrZeezjhxSrULviFF4Z6DP/WkzUOnWNVRxqVi49Wc/F5p
 n7aC1tvuXpoca3MQXAjK3yl29Y7zOoqTT8FZ+tdJvdedJiVqgeJ1fUcJtvnrSav3DXXn
 cMYZWSr5tCMYvbvI04uvOjYVBNfkToIX3Y35A7e0h01yRwjoygL4Kt5ZSkF6vWkDJtqq
 a/2ak1+iF10XYZXOlE+E7GMPc1nvxtWJ1nz43JAcpSrqerTOlEr1tV2wFJJddaWLHNX2
 PpAHmCs1sXGDYJsZki7EJGSir4SqZHeMm5q76Ck/Bg5ZmggfB98v/nMXSpnKaaGF/uET
 R+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XHVUz1b0D0ZF/noy7ANM+++7WGGRFc9oyw89kqgSdjE=;
 b=XDkbhEhdDgdfsydniChR+xPnnzO11M2aqCfvul+7lkRVbdDW966njp3ul/8H2atTXN
 JRlFp0h7GjdApBo/1Iyrf5Ny5GexLvkhdco7l2iCfFiTKKJWsP6deeOB0L0x+yJvKpbc
 scgiywNkQO6Hpfv8ei2SwCNOvV5Kd6KtgvtLTq3JwZSr8htgdF4vuHTLRt7QHreqpYQS
 eDwC1uwex/gG+2C93sl6monwl5DUj9mNNlxMW+yprD9Zw8VMPzusrau0n5E2gZWN2sk2
 /226J8247yRTBYKgqoJDCO2uM6j3u8gHbCazrKkuq0kYBSKRZg97LdmgMVgV2uX5B6YG
 bM/A==
X-Gm-Message-State: AOAM532UlbKY4nPvas64lDcYS3tV7+EElVHo+uae6aN6M7OnovVuSXoW
 wbYUmHRZknMLNAaWm40wAEU=
X-Google-Smtp-Source: ABdhPJx16Vt/FPuRxbRMNnFY/Wy6fGUSb4KuPuwz+aSvi4c9sLSD/2bBrV6IuJzISUMX0bRgFRijXw==
X-Received: by 2002:a1c:f70e:0:b0:38c:6ca9:2f8f with SMTP id
 v14-20020a1cf70e000000b0038c6ca92f8fmr3153245wmh.162.1650114017834; 
 Sat, 16 Apr 2022 06:00:17 -0700 (PDT)
Received: from ?IPV6:2a02:908:1252:fb60:dd4a:a17a:5566:43bc?
 ([2a02:908:1252:fb60:dd4a:a17a:5566:43bc])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a056000188b00b00204109f7826sm6981250wri.28.2022.04.16.06.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Apr 2022 06:00:17 -0700 (PDT)
Message-ID: <0d065fd6-3fa5-c9cb-3248-6f29b2bdcb71@gmail.com>
Date: Sat, 16 Apr 2022 15:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/2] Update AMDGPU glossary and MAINTAINERS
Content-Language: en-US
To: Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrealmeid@riseup.net
References: <20220415195027.305019-1-tales.aparecida@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220415195027.305019-1-tales.aparecida@gmail.com>
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

Am 15.04.22 um 21:50 schrieb Tales Lelo da Aparecida:
> I was handling the request from [0] and then I noticed that some AMD
> developers were missing from get_maintainers output due to the lack of a
> reference to their documentation in the MAINTAINERS file.

Acked-by: Christian König <christian.koenig@amd.com>

>
> [0] https://gitlab.freedesktop.org/drm/amd/-/issues/1939#note_1309737
>
> Tales Lelo da Aparecida (2):
>    Documentation/gpu: Add entries to amdgpu glossary
>    MAINTAINERS: add docs entry to AMDGPU
>
>   Documentation/gpu/amdgpu/amdgpu-glossary.rst | 13 +++++++++++++
>   MAINTAINERS                                  |  1 +
>   2 files changed, 14 insertions(+)
>


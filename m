Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2886E553804
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 18:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9103810E143;
	Tue, 21 Jun 2022 16:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D31210E123;
 Tue, 21 Jun 2022 16:39:30 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id g12so10048683ljk.11;
 Tue, 21 Jun 2022 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mhIiUkoVFz0wPW9tQouAUPqb2d9trqlO1mA9uf8w0Ks=;
 b=FIjnHKZ++BZwbnW/IETfzzE9HdfruXLMCZ2afU8f8Ol9x8E7l51cySVPm4KWm5juQG
 gvX77m5NrkZGy6opdeOW3LRwfEVZD3UiZOrJaMZQjx5mhQWDWWBzAgbL+4P6dmqW4Ybr
 pnJWoWI7QHQJSteAPaPBGKo0nX8KMOGEJJStZWmxp4DZK/wrdSA5PXIfblpzcGzawRa1
 MeB9sdH+if74n2gTXbLRxglLSaNkv5FQLHhjr8l1loJCZtcGUyvXakvtZV7uSTRiacct
 DlG37LBGraBOSPqB4o8FlEBG3UbFB1lHDbrO6892U8ZlIb6y/14e/lKA5JIfPI67jtMv
 Uu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mhIiUkoVFz0wPW9tQouAUPqb2d9trqlO1mA9uf8w0Ks=;
 b=R1vxfNKZl6s5Oe449pJu7uJhleMbruav0zDqJdk3aLCJTZ1unUWs5w0Zp0TQgeiGiv
 XibUBfEzvY/tzzaftz4cD+Qd2ii2A1hIKKjmZuMDejaczpn4fKGUt9ocv/2N8DRIwLo+
 aHFoddeakEZYVL9p44x0lRra2uehhtyopCwxDLK4F2raThoFVUuNbrwRO2tLkDhaXJSy
 GfmCJEkzciE69euFBxkDEzLl4Lvic4ceW0uCp/34YwJS7pn44aC4F9oG15gVwH/JoBTD
 1qbX+I08SmDWK6pabh8u27b/uHZNwosw/Rmpl+qjAEpEmZEuRlRpNZMbC3c98lV62JL3
 cPXg==
X-Gm-Message-State: AJIora82X0GTHi/18DEz/CZaz14kpOldtVA+hPq/P3GErijSzKSAh5+N
 T2F10R7oBSPq3E+3PiRipFw=
X-Google-Smtp-Source: AGRyM1tTeVIJS0PV6ghwi5oLN82VfE9B8lRb5DRIlTC+FNYEK1w9sU215ZQ3z+wF7iT6GuEnyQM6mw==
X-Received: by 2002:a05:651c:160a:b0:25a:62a4:9085 with SMTP id
 f10-20020a05651c160a00b0025a62a49085mr8422999ljq.214.1655829568510; 
 Tue, 21 Jun 2022 09:39:28 -0700 (PDT)
Received: from [192.168.2.145] (109-252-136-92.dynamic.spd-mgts.ru.
 [109.252.136.92]) by smtp.googlemail.com with ESMTPSA id
 y19-20020a2e3213000000b0025a69521bbdsm1106096ljy.121.2022.06.21.09.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 09:39:27 -0700 (PDT)
Message-ID: <c1d7b5f0-32e0-df37-e447-c525e3a84253@gmail.com>
Date: Tue, 21 Jun 2022 19:39:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 17/22] drm/shmem-helper: Add generic memory shrinker
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <20220526235040.678984-18-dmitry.osipenko@collabora.com>
 <CAF6AEGt=EqeF+3UaYjxQCCFEabRFJwLbiWN9brGveYoHTYyZ7w@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <CAF6AEGt=EqeF+3UaYjxQCCFEabRFJwLbiWN9brGveYoHTYyZ7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 virtualization@lists.linux-foundation.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, amd-gfx@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

20.06.2022 18:37, Rob Clark пишет:
>> +static unsigned long
>> +drm_gem_shmem_shrinker_scan_objects(struct shrinker *shrinker,
>> +                                   struct shrink_control *sc)
>> +{
>> +       unsigned long nr_to_scan = sc->nr_to_scan;
>> +       bool lock_contention = false;
>> +       unsigned long freed;
>> +
>> +       /* purge as many objects as we can */
>> +       freed = drm_gem_shmem_shrinker_run_objects_scan(shrinker, nr_to_scan,
>> +                                                       &lock_contention, false);
>> +
>> +       /* evict as many objects as we can */
>> +       if (freed < nr_to_scan)
> oh, one other small note, both in scan_objects() and count_objects(),
> you should check that get_nr_swap_pages()>0 before counting
> evictable/willneed objects.  (And you probably want to keep separate
> LRUs for dontneed vs willneed to accomplish that.)  At least for CrOS,
> inside the VM there is no swap enabled (but instead we rely on zram
> swap in the host.. plus vm-balloon to balance memory pressure between
> host and guest)

Noted, thank you!

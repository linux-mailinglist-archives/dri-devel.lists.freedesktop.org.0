Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C6C2B5B44
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 09:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFA96E13A;
	Tue, 17 Nov 2020 08:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD11B6E047
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:55:58 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id b11so9193997qvr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E8dVzLq70NYkCDseFzmbLwa/urvtTDPkDdBtFGGN6D0=;
 b=M4o0yAJtuwdwVHCFv76S5VG1YfEGJmnNrFwmo84W1XR7pfDC3QibdJzFpH5AeaIykv
 JeFMb9H78yvKh5jtpNNG/SpXGgI0QOy93BAJNetXtXZuQMUhdUwfqBUFqt0vEyVb6ZB0
 4DR+OG3iowahd0NLee2pdnSouzWtomf5UY91th9YTb3ik0jqNjGGq15pL+7bwdf3/oUb
 EJ9swCP2IfQ8Ec9smzzKfsMfj20TxlfhwB3xALmxlLiiPd20ayVVJCPFfPlLIwm2MJnR
 GrrZx/ZjLa1E+yYmu/Gf3HfimSIaTOl23XtyAwyxQtQuM6lrg7EfrvpfzKzwx6bGvHda
 lHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E8dVzLq70NYkCDseFzmbLwa/urvtTDPkDdBtFGGN6D0=;
 b=QZbeLo34lfg9VTrDI3HyWzu/jKbP5XX4RKPYLax76uDf+fMCkIpQhw453BB5QwUNvJ
 XM8IPsRT2EFs9X0Hz1mkzYrysOZX6e7LuuhVp+kiegMoS5sufn/uiSacOWqv6KC86o4k
 BdGn8v7NaQVxsBc6VhiS2lWt8b7XrVLFb0BTn1CVaUyXZ0kpoT4cGBVEsc+wJ3DOezBx
 QPlGP+Hx+Bo2abg6KawJPkpytksZv7P5s0pX1nH3ZKpdUCcxaWXyttxW3/Up3CFGGs5y
 Sfrhxdyw240sVQhaTfRQkP1/3cxEnXgmudOEuZ4eaxhAyHi3ul7ccHrQq87JVDb2n7M4
 fgaA==
X-Gm-Message-State: AOAM532YPz/XD5Gyt1Z+kH5pzCrcKDjrYmR7RRUEpdlwH3sX3wdL1Y3N
 KqX7GtpFTETD1a4ArvhTMcI5jg==
X-Google-Smtp-Source: ABdhPJzaZqMKn8xovkF8P6M/eGyZjGXaTO9LqPdsEfmRScwlIiXF508R9sNXAXVwP+ldTfKElwlGOg==
X-Received: by 2002:a0c:b65b:: with SMTP id q27mr15592022qvf.8.1605549357940; 
 Mon, 16 Nov 2020 09:55:57 -0800 (PST)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id q123sm12890805qke.28.2020.11.16.09.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 09:55:57 -0800 (PST)
Subject: Re: [RESEND PATCH v2 4/5] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for
 non-coherent cache maintenance
To: Rob Clark <robdclark@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Jordan Crouse <jcrouse@codeaurora.org>
References: <20201114151717.5369-1-jonathan@marek.ca>
 <20201114151717.5369-5-jonathan@marek.ca> <20201114162406.GC24411@lst.de>
 <CAF6AEGvujttEkFuRqtt7i+0o7-=2spKXfAvJZrj96uWAFRLYuA@mail.gmail.com>
 <50ddcadb-c630-2ef6-cdc4-724d9823fba7@marek.ca>
 <CAF6AEGsH5Wk=J+HxHnRqTMLZscjErjKq2v0Rms7Td=W7icZ3sw@mail.gmail.com>
 <b6e4f167-871a-5f26-46bd-d914476af519@marek.ca>
 <20201116173346.GA24173@lst.de>
 <CAF6AEGuFzsurd4n6G-nUmCusTJ8vMo9Kqjzs3JRS_d6n+qHgEA@mail.gmail.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <b798d954-d0b5-d968-f03c-b3fe9ffd08fc@marek.ca>
Date: Mon, 16 Nov 2020 12:52:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAF6AEGuFzsurd4n6G-nUmCusTJ8vMo9Kqjzs3JRS_d6n+qHgEA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 17 Nov 2020 08:51:59 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/16/20 12:50 PM, Rob Clark wrote:
> On Mon, Nov 16, 2020 at 9:33 AM Christoph Hellwig <hch@lst.de> wrote:
>>
>> On Sat, Nov 14, 2020 at 03:07:20PM -0500, Jonathan Marek wrote:
>>> qcom's vulkan driver has nonCoherentAtomSize=1, and it looks like
>>> dma_sync_single_for_cpu() does deal in some way with the partial cache line
>>> case, although I'm not sure that means we can have a nonCoherentAtomSize=1.
>>
>> No, it doesn't.  You need to ensure ownership is managed at
>> dma_get_cache_alignment() granularity.
> 
> my guess is nonCoherentAtomSize=1 only works in the case of cache
> coherent buffers
> 

nonCoherentAtomSize doesn't apply to coherent memory (as the name 
implies), I guess qcom's driver is just wrong about having 
nonCoherentAtomSize=1.

Jordan just mentioned there is at least one conformance test for this, I 
wonder if it just doesn't test it well enough, or just doesn't test the 
non-coherent memory type?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

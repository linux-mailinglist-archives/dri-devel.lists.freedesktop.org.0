Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A578C3373FF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 14:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4536EC7F;
	Thu, 11 Mar 2021 13:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0102B6EC7E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 13:31:57 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id f12so1875292wrx.8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 05:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=KQEkpGkH8X9iAKDULksHIIQVGmHhnGVSrqpZ40dKqws=;
 b=CIIAC/BD4HiWZJv5qwhQ9qfLc69qrTy9QBuntzXqyQsbcdQGtlF0Uxjcy0ZFTg+b8P
 sfXuhYSDbtS+1H84ubJowHGoova+nTvdE4WmseXf7gU0a1+St18coJMHpU4NlUAqNlBn
 G6gVDx+Mqi73FbYtvA+zLBz4Tt2LtFMujxiCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=KQEkpGkH8X9iAKDULksHIIQVGmHhnGVSrqpZ40dKqws=;
 b=qC3rgZ+A/bsiqdhwSubBCJOVGCauewPJzcRcaaHtGjVTl4oGrXNO3jRbhEykgsUHka
 c1Qz6hE5+M+M2q1dMRdlyWVRUYt58E0L3M3fchmmOy8y1A/a3GJ3GeDbqoC6lZm+jGs4
 QBVbvXej1lYqUA0XxLItsLASpbqfEwbTckmzVaymC7FQg1BaY7Wh5zyFCE3B8YL+sqgZ
 rv7aTodr7qtujelegTN2c7WtQWyvldWjmZDT4eJ600FPkBK48Z8dY7ayrabwchHEQMFw
 SMyNnJgzqHylCzU5NpgqycAj1ynLN9tBqz34/BkXNjAc4ikZZd5ClkV8iLfkHkbPDBYx
 g86Q==
X-Gm-Message-State: AOAM533oY6AtM1htSw+QWVU8mLBbZkykPXlcKMpQiHRTRJGgqM17w5bq
 PBSJc+KCAy2cl6dc4OrUFRnwMQ==
X-Google-Smtp-Source: ABdhPJxEmOy2Yvf9KHNGocEPM7wKMMIxgjmjn3qYWtNne7YIpJNNmJ0zRgu4I8/UJrCDTEqBBwHj5w==
X-Received: by 2002:a5d:5487:: with SMTP id h7mr8924011wrv.348.1615469516566; 
 Thu, 11 Mar 2021 05:31:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c9sm3590049wml.42.2021.03.11.05.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 05:31:56 -0800 (PST)
Date: Thu, 11 Mar 2021 14:31:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND 00/53] Rid GPU from W=1 warnings
Message-ID: <YEobySvG0zPs9xhc@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>,
 Jeremy Kolb <jkolb@brandeis.edu>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Leo Li <sunpeng.li@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, nouveau@lists.freedesktop.org,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Rob Clark <rob.clark@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
 <20210308091932.GB4931@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308091932.GB4931@dell>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Qinglang Miao <miaoqinglang@huawei.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Jeremy Kolb <jkolb@brandeis.edu>,
 amd-gfx@lists.freedesktop.org, Rob Clark <rob.clark@linaro.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-arm-msm@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, linux-media@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>,
 Roland Scheidegger <sroland@vmware.com>, linaro-mm-sig@lists.linaro.org,
 Sean Paul <sean@poorly.run>, Kuogee Hsieh <khsieh@codeaurora.org>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, freedreno@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 08, 2021 at 09:19:32AM +0000, Lee Jones wrote:
> On Fri, 05 Mar 2021, Roland Scheidegger wrote:
> 
> > The vmwgfx ones look all good to me, so for
> > 23-53: Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> > That said, they were already signed off by Zack, so not sure what
> > happened here.
> 
> Yes, they were accepted at one point, then dropped without a reason.
> 
> Since I rebased onto the latest -next, I had to pluck them back out of
> a previous one.

They should show up in linux-next again. We merge patches for next merge
window even during the current merge window, but need to make sure they
don't pollute linux-next. Occasionally the cut off is wrong so patches
show up, and then get pulled again.

Unfortunately especially the 5.12 merge cycle was very wobbly due to some
confusion here. But your patches should all be in linux-next again (they
are queued up for 5.13 in drm-misc-next, I checked that).

Sorry for the confusion here.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

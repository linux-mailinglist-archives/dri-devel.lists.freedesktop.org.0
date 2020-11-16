Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0402B4DF0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C066EA02;
	Mon, 16 Nov 2020 17:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D893D6E04A;
 Mon, 16 Nov 2020 17:48:43 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k2so19743051wrx.2;
 Mon, 16 Nov 2020 09:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oo28y8CwbarIIHt9QVICKSL/cPf2jBzgOsxS9+pjqV4=;
 b=Xo+6RoUKW5EPAQ5AfiLMX2ZOBP3YtaRXNtMeaOx5Kz6LQeDbTNdN8Tn1drGDcfrXbC
 mPk13Xv0teQZptYrVKdoX4Wo9+81F0IAhppDl0rbxUZYifSBDn25uao5eQeQo1F2qh2o
 oDFsFeLhHS524Vtqx1v5iCCJ0CKyCSNVG917jK5sS0i0nGSSY43ASsqSX+k+7zleqUwP
 m2J84Jhrk0YOxQ22Cg7UdO7tOgwcWJJBKfgbfpM6wwxzC4Q2UsWXPFW+TpnUHVet2yv/
 91PQg079/9WnamlCea28HYMTRO6Pt3f6splsJ4ecRed2px63Gik6CAV0aQZU1XnWjgeZ
 gUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oo28y8CwbarIIHt9QVICKSL/cPf2jBzgOsxS9+pjqV4=;
 b=Wuss8u1EzaYoUgxITbMr05ba7nLMg1jxLbvBJQOQWjw6ixaURHu0rC1Dcs1a1Sxech
 ScySzea6lvuKS1TjVIKqTUBZppvi9YjsmZza5bpqkm5nBbC4UN/p6jkrLZQMRNG91Qlq
 43dhPKDK2Uz3l6sQUHUl29peBbd4LITvh+ZfoVktVzsiN9dHoIokJafCsCcngnXo1SUM
 97ByGAhrVZEn1YQ1ZZSu569pz+kEGZyrGJMjjek/m9UwFSruqPK7fD3z0ibNB1ccjViY
 /c9b2tbdQRfowo78P6P+o3hL3eokAuak57FBoKNJ/920NtBJssbhKIFWa65SmGIe2AZt
 MFbw==
X-Gm-Message-State: AOAM533vxroUONhBBtT1Upv3hX9xsGowtChPHJRsLhIf9P1zlhjwUufe
 FZ0FwTWpYerQXdv1BKvYFi9l5eXr8/VPYVhzscs=
X-Google-Smtp-Source: ABdhPJwLUHRCNxP780S9wB4HTWCUx9z/UF/ZjtKuXyrKptvA/sOlIX/C0TT7KCOFIw7oMBBwToUFga8s7TvJdYI0jDU=
X-Received: by 2002:adf:f04b:: with SMTP id t11mr19535784wro.147.1605548922581; 
 Mon, 16 Nov 2020 09:48:42 -0800 (PST)
MIME-Version: 1.0
References: <20201114151717.5369-1-jonathan@marek.ca>
 <20201114151717.5369-5-jonathan@marek.ca>
 <20201114162406.GC24411@lst.de>
 <CAF6AEGvujttEkFuRqtt7i+0o7-=2spKXfAvJZrj96uWAFRLYuA@mail.gmail.com>
 <50ddcadb-c630-2ef6-cdc4-724d9823fba7@marek.ca>
 <CAF6AEGsH5Wk=J+HxHnRqTMLZscjErjKq2v0Rms7Td=W7icZ3sw@mail.gmail.com>
 <b6e4f167-871a-5f26-46bd-d914476af519@marek.ca>
 <20201116173346.GA24173@lst.de>
In-Reply-To: <20201116173346.GA24173@lst.de>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 16 Nov 2020 09:50:28 -0800
Message-ID: <CAF6AEGuFzsurd4n6G-nUmCusTJ8vMo9Kqjzs3JRS_d6n+qHgEA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 4/5] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for
 non-coherent cache maintenance
To: Christoph Hellwig <hch@lst.de>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 16, 2020 at 9:33 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sat, Nov 14, 2020 at 03:07:20PM -0500, Jonathan Marek wrote:
> > qcom's vulkan driver has nonCoherentAtomSize=1, and it looks like
> > dma_sync_single_for_cpu() does deal in some way with the partial cache line
> > case, although I'm not sure that means we can have a nonCoherentAtomSize=1.
>
> No, it doesn't.  You need to ensure ownership is managed at
> dma_get_cache_alignment() granularity.

my guess is nonCoherentAtomSize=1 only works in the case of cache
coherent buffers

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

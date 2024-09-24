Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E25984D46
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 00:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE2510E75D;
	Tue, 24 Sep 2024 22:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="D74qUPzt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDFA10E75D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 22:03:07 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7a99e8d5df1so604053685a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 15:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1727215386; x=1727820186;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NsZrdsG+uwrLVvS5FWIhBRuHHog4+l/Yf5EAxQLtzhs=;
 b=D74qUPztdDeOcl9ePRLyhfn6bAbVtU7LRI2le4/za213TL2JtsQ3A3pF8jujc9tzKH
 GAEEfW332LFKWlDswl4X/tyfFkYCbFtcYttHZL6xubTJE6g1SmLgCRYF+DKwcvVmdzZ1
 m8BEiEoHXEQVR8+x3mhiujtFbQUNBXdtAEL2zG+/6stiL0rC7EM6ze79La6xvNbp543/
 wSnWRIYnCmdiig37DLkhtHN8DEXTzz/9R8Fom6/3KCK9vfkdZ3D8LWMgp942rKSiTP0K
 RJmzCQHHeT4VCPjwZDM3+RWMMVt/XLGjYjCobpN8yrOBNHD+w4Vu6ME9IaBJygyqLJLl
 XMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727215386; x=1727820186;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NsZrdsG+uwrLVvS5FWIhBRuHHog4+l/Yf5EAxQLtzhs=;
 b=YouOXHzwTmJmPKLqYa/61FlmX6n/EF74CwV/KS408aEMpjJkxR7K8B4ppWI/hz7fyi
 l1gnjRKu2yhcwufYA/hW6FqAr+df93syOy6TT8F21DUUNc1aY+0GFShOopz2oYq9DvH2
 dKSZnbGeFddHwXFLqgu+Cm8vArkFCXGNSeROc/Sz6avo6ANb3vdolGzEP1f7BIgAVG+H
 h/iVCJMF96EU85j2mdxBAsuDaJXeQhhmy4jwCTQMr1nEAbISuKbPAoQVwHA1PgtPs32u
 tkfnDM4rvyMJGofj3VVMN+RTicj7/24mOyx8Lmv+L74o0ty6f/u3ijGUsolVAqJg7q6g
 WsPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqd6G4aVqAZJFhAIYCJHbhMwufWKqPTHIEgRve8EupQT0lRrY4YF+NHgVDx8URizSFWlX/M6pdnqw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlUpWDPOkeIq1Xeev/AqEDoT57b4RRmqvUiGCYRUVVEOs0+OHX
 keEv62rIe9S0iqNPCKJnpsqgqK254V6ALLYbAKJ5Xzhd8Aam1c7Wuz2jdfeNa14QkUGrbnrKZPt
 nd1FuOfJXAnWKJeoL0jiYQYXl4e+NXp8W1K8TvA==
X-Google-Smtp-Source: AGHT+IElqfXPuPng8AojlDDF2C6GLMgjgq9uYfkfDW9uAzUUN373GhIZBRXCnSZ4eftp7Scr+RM/AU3bO+2aPn4itIQ=
X-Received: by 2002:a05:620a:179e:b0:7a9:be7a:9220 with SMTP id
 af79cd13be357-7ace745d94emr87761585a.60.1727215386507; Tue, 24 Sep 2024
 15:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
In-Reply-To: <20240830070351.2855919-1-jens.wiklander@linaro.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Sep 2024 23:02:54 +0100
Message-ID: <CAPj87rM5LSBEdMECyh0WTkjWWySDv2_eyqj7ew_qU7xQ5LEdgA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Linaro restricted heap
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi Jens,

On Fri, 30 Aug 2024 at 08:04, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> This patch set is based on top of Yong Wu's restricted heap patch set [1].
> It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
>
> The Linaro restricted heap uses genalloc in the kernel to manage the heap
> carvout. This is a difference from the Mediatek restricted heap which
> relies on the secure world to manage the carveout.

Calling this the 'genalloc heap' would be much more clear.

Cheers,
Daniel

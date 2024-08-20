Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462979583ED
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 12:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6CB10E6AD;
	Tue, 20 Aug 2024 10:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E+tIGeo0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6A910E6A9;
 Tue, 20 Aug 2024 10:16:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1C86ACE068C;
 Tue, 20 Aug 2024 10:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01800C4AF0F;
 Tue, 20 Aug 2024 10:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724148997;
 bh=VYFz7I5L5KLTqazknj1Zai/JP5hjQosrywDopQoE93k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=E+tIGeo0iURl25RExTGs5pQOg/7Ne4riA3599Qn9laJuUNeG3rju/UfWcobEr/rLL
 KY7MLVjBDGeoi3oL7FgCRTHqHNuR8i3S9Hi2fQUmGXqtSd9SxA8G6B5L9kqBj7Fs5c
 +DzDBl5T6bZCHW920X1yynZR93DPjy1vmGz770lm5zGnhzpb3ct8NiKhjk82t8ZMgU
 iTnk4cN0gPsGM5lcEJFnIqhqsNHElxLR11uJ9cjA1CUJyTPks1Kd4NKBuu+cSCZNCB
 TSVSuoVi7IYqIcVFoE63ydnI8jbqv7ho9hdcaVWvtfgyMlY4S9VASN8qCRf3m4foev
 Sz2OTq8v1/abA==
Message-ID: <af10c83a-4a7f-46fa-8287-d57b73532986@kernel.org>
Date: Tue, 20 Aug 2024 12:16:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
To: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-6-7bda26c34037@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240815-preemption-a750-t-v1-6-7bda26c34037@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15.08.2024 8:26 PM, Antonino Maniscalco wrote:
> Some userspace changes are necessary so add a flag for userspace to
> advertise support for preemption.
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---

Squash this into the "add preemption" patch, or add the flag earlier
(probably the latter, as that one is already big enough)

As it stands, just applying patches 1..5 will break GPU IIUC.. and
that's no bueno for running git bisect

Konrad

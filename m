Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5089E34C9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 09:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D45610EC36;
	Wed,  4 Dec 2024 08:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FcA61YJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4084B10EC29;
 Wed,  4 Dec 2024 08:02:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 381A85C69B5;
 Wed,  4 Dec 2024 08:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10ECCC4CED1;
 Wed,  4 Dec 2024 08:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733299341;
 bh=M+VgsjFFjkbJsHcaeIjSbhxuSnKP2h02k6+chfrtbN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FcA61YJpyB9VroU9zHwG0pkluA4QSt5ZwmkLnHzEKhCQ5Ag9dbBcMc+diJuK9YLkU
 AsPWwSjkEJhsNdyYik8FOERb7zUir1QDbWKR7gxgXWjbIetYvdwPJo8bO7t2d+0jew
 T7zwhTXLH+39wYN2izalXeOW5XsiWOYgsiXHcTsfiwmfJXRTxhGbXJdz86dr+E80z5
 UYR/s8TWLFGHqB0g9gAEyGHfqjKRbWNLDJfofhN20yD85P1N5TQyvhrdGZ16x90VAX
 3RF08NVEkU1wrN8csXTVAULzHUfMeNU3Iay5qnElPYqNloS29cOawR+A4hQDyIpCak
 IdqF4Wsk6G1Yg==
Date: Wed, 4 Dec 2024 09:02:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: display: msm: dp-controller: document
 clock parents better
Message-ID: <hqe2pipkcnxftoq5mvdk36xmkj3ybr3oto6eghimq75rqlncsm@v45smglhedy7>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-2-9a9a43b0624a@quicinc.com>
 <bfa857c2-cd74-4fe2-a88c-3b35a58710b0@kernel.org>
 <gpqrugcsyhz32bvip5mgjtcservhral2o5b6c5nz4ocwbjw5uo@eypv4x6jyrdr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <gpqrugcsyhz32bvip5mgjtcservhral2o5b6c5nz4ocwbjw5uo@eypv4x6jyrdr>
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

On Tue, Dec 03, 2024 at 03:41:48PM +0200, Dmitry Baryshkov wrote:
> On Tue, Dec 03, 2024 at 09:01:31AM +0100, Krzysztof Kozlowski wrote:
> > On 03/12/2024 04:31, Abhinav Kumar wrote:
> > > Document the assigned-clock-parents better for the DP controller node
> > > to indicate its functionality better.
> > 
> > 
> > You change the clocks entirely, not "document". I would say that's an
> > ABI break if it really is a Linux requirement. You could avoid any
> > problems by just dropping the property from binding.
> 
> But if you take a look at the existing usage, the proposed change
> matches the behaviour. So, I'd say, it's really a change that makes
> documentation follow the actual hardware.

First, this should be in the commit msg, instead of "document better to
indicate functionality better".

Second, what is the point of documenting it in the first place if you
can change it and changing has no impact? So maybe just drop?

Best regards,
Krzysztof


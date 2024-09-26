Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 414369873B7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 14:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D15510EAE4;
	Thu, 26 Sep 2024 12:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EfZfmJ6V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BED10EACC;
 Thu, 26 Sep 2024 12:39:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D47C65C57FF;
 Thu, 26 Sep 2024 12:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D05AC4CEC5;
 Thu, 26 Sep 2024 12:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727354398;
 bh=X6di7L1Vl/r4MqrcmOwroFyWwMv/8RSXL4kKCm4I0Uw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EfZfmJ6VqztDgJbud3JS2fzpq6KH5KeBQkGd2j+5IpGu0weS6uAl615rS+tX7z33G
 CXA3F2rsMHblUQ6Vt2aCl+yYu/frnvoSLSCjTuA+XRxMUsx/UB6bUfrFox9OTiCfL1
 2bDsCHoV8bzF3KX2hoOnM5722jhhxUALEgJ5KhQ5UOLmZP1kRtQ9Z1Ovbq3x6xkjsi
 k5/f7SaSU/EfTm2pqVlo/qoAK1ysZWfKJmY/3Rz3CZqEdC5I7qUXsK6L113nF6KGfr
 Oo4A6l503uL4uV1bbDl85CppdrfzhMmzXw+ZsCNfZz+ZoXRQ3wIVlEZ07VAFokjHTB
 UmMe4bt4kYo9Q==
Date: Thu, 26 Sep 2024 14:39:54 +0200
From: Bjorn Andersson <andersson@kernel.org>
To: Mahadevan P <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, 
 dmitry.baryshkov@linaro.org, sean@poorly.run, marijn.suijten@somainline.org, 
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, swboyd@chromium.org, konrad.dybcio@linaro.org, 
 danila@jiaxyga.com, bigfoot@classfun.cn, neil.armstrong@linaro.org, 
 mailingradian@gmail.com, quic_jesszhan@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, quic_kalyant@quicinc.com,
 quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Subject: Re: [PATCH v2 0/5] Display enablement changes for Qualcomm SA8775P
 platform
Message-ID: <tabzs5jvy54rbwgjjmzodkpwm4emt2oevxjc2kto7znij2i23y@5wn45pstnmiy>
References: <20240926110308.2201577-1-quic_mahap@quicinc.com>
 <46cd6c25-0a82-46c6-9382-167a44a689ba@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46cd6c25-0a82-46c6-9382-167a44a689ba@quicinc.com>
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

On Thu, Sep 26, 2024 at 04:55:02PM GMT, Mahadevan P wrote:
> Sorry, Please ignore this thread/coverletter
> 

go/upstream and adopt b4, please.

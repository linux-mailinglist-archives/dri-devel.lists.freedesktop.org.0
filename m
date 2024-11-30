Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14519DF2BB
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 20:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3452410E094;
	Sat, 30 Nov 2024 19:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WPQTCV2v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3C610E094
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 19:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732993530;
 bh=ek7RYw4xwoblLAdujwbp98Ocgk+BFMHHW7AT1mVVMPM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WPQTCV2vOisCQKF9yGCv5IBGziCapwnmPdq+DL1aWJ5mBdkef2AsWBAVXKN0+gUuB
 UBDJ7qbvWLGFYgXRB5WMImheW6xO/pmpqg2S9VemtfshUfF/uj8w02yJPZ8z5CYqQm
 AVcF+Vfbx/94H0YAf6H7B9DsKTdalBeiNNyyH9UOXEIMLYExy1Q02GmqLJqkRRMsiH
 A+OGDzTUoGEjCmCJfjNehv21ZCDzSldoWVckB2eLPGPT5/gpqD3YnFfVSFLWArOsVA
 96W/UEg6zryf+vex9wAbMKphy/bX7uiStkPXDXoyqi9QDoDcukbi8q0JnHQmlipGaD
 jYw3vihyvP3Hg==
Received: from [192.168.1.90] (unknown [86.120.21.57])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 90CBD17E37C5;
 Sat, 30 Nov 2024 20:05:30 +0100 (CET)
Message-ID: <ca8c796e-fa89-412e-acdc-2515efeb6ca5@collabora.com>
Date: Sat, 30 Nov 2024 21:05:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/connector: hdmi: Allow using the YUV420 output
 format
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241130-hdmi-conn-yuv-v1-0-254279a08671@collabora.com>
 <6hcjgagu7hvbnn6rp5znwjxeaa6wqkeecgvvqkzvtma2ni6mfz@lrbmtbogkzgm>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <6hcjgagu7hvbnn6rp5znwjxeaa6wqkeecgvvqkzvtma2ni6mfz@lrbmtbogkzgm>
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

On 11/30/24 10:38 AM, Dmitry Baryshkov wrote:
> On Sat, Nov 30, 2024 at 01:56:31AM +0200, Cristian Ciocaltea wrote:
>> Provide the basic support to enable using YUV420 as an RGB fallback when
>> computing the best output format and color depth.
> 
> The HDMI Connector functionality has pretty good KUnit coverage. Please
> expand KUnits to cover your patches too.

Sure, will handle this in v2.

Thanks for reviewing,
Cristian

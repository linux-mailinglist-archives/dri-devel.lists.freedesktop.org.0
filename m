Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F698AE717
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 14:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD1B113385;
	Tue, 23 Apr 2024 12:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="xRziz0Gy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFAC113385;
 Tue, 23 Apr 2024 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713877019;
 bh=XeZycoklrbmIsGAeu98uH0HIylfGOQJCx4GR355GWBc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xRziz0GyVrPt2dhtiBiqNDXqczIeDLuZbHnEOWJSrlHm36b7jLx7WJlA/NnNyYz+O
 ILQ5AxoCCF584XC6at4Ovw7VG6IZUkYx2hcSU4LJTCUGclhXqLyOelc6ejocD9iQE9
 ycHEPJjr5Z1dDU4MQAjBDjumEXasMAR4WwmZ4XII0SdqTIJvWCyiBMWY9gkqTTuKHH
 g8Xdo9I4ALXJxJU0+jh5uZmA3T1BqHogZP/oCoSlUCAb5X+JS2pJqTZQ1G7PtkePVv
 2ZfpAJAYcPdPKlUtCWGitWSX/IzjmIfxI5mmr6ld3MWC4bsdYgChfIPWTxwQ5z+5km
 WKkdXlDaRIXeQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6AF5937813A2;
 Tue, 23 Apr 2024 12:56:55 +0000 (UTC)
Message-ID: <c8a7744c-2225-4fd8-9ee7-bd513a4668cd@collabora.com>
Date: Tue, 23 Apr 2024 18:26:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] drm/ci: uprev IGT and generate testlist from build
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20240423040243.448091-1-vignesh.raman@collabora.com>
 <20240423040243.448091-4-vignesh.raman@collabora.com>
 <e3a0ea8f-d306-488c-a69c-aa18078e5e03@igalia.com>
 <CAA8EJppaaitcXkXSFTB4-S2CbBcrAVHouB0wWiU5Nw2FvpagqA@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAA8EJppaaitcXkXSFTB4-S2CbBcrAVHouB0wWiU5Nw2FvpagqA@mail.gmail.com>
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

Hi,

On 23/04/24 17:53, Dmitry Baryshkov wrote:
> On Tue, 23 Apr 2024 at 13:24, Maíra Canal <mcanal@igalia.com> wrote:
>>
>> On 4/23/24 01:02, Vignesh Raman wrote:
>>> Uprev IGT to the latest version and stop vendoring the
>>> testlist into the kernel. Instead, use the testlist from
>>> the IGT build to ensure we do not miss renamed or newly
>>> added tests.
>>
>> Nitpick: wouldn't it be better to (1) stop vendoring the
>> testlist into the kernel in one patch and then (2) uprev
>> IGT to the latest version? I feel that this patch is changing
>> a lot of different stuff.
> 
> Definitely. Otherwise it's hard to understand whether a change to
> fails/flakes is caused by the uprev or by the testlist change. E.g. in
> several cases the list of failing subtests seems to be replaced with
> the test itself.
> 

Yes, will follow the below approach.
1) Use the testlist from build and update fails/flakes/skips
2) Uprev IGT and update fails/flakes/skips

Regards,
Vignesh

>>
>>>
>>> Skip kms tests for panfrost driver since it is not a kms
>>> driver and skip driver-specific tests. Update xfails with
>>> the latest testlist.
>>>
>>> Increase the timoout of i915 jobs to 2h30m since some jobs
>>> takes more than 2 hours to complete.
>>>
>>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>>> ---
> 
> 

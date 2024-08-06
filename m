Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AECA94974B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 20:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4131610E05B;
	Tue,  6 Aug 2024 18:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=helen.koike@collabora.com header.b="Et73oSQC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Tue, 06 Aug 2024 18:08:50 UTC
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A558910E05B;
 Tue,  6 Aug 2024 18:08:50 +0000 (UTC)
Delivered-To: vignesh.raman@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1722966823; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RW/feBkNoOFbYSnx+5hvtNPGlVfQQvtVDl9tFw0Fah6EvYgz511EHhEHscHvnaLTtz+zbWIWVt9iNmsGZPMcAn93rgyyDP232uyZNMaa/Bg1IfkOMVe3ytRN+QYjiePZzJo8mWdJMOzqSmvGKC2ngJPbz+nmH1mWK0ps10XTrzI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1722966823;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vm9Xz4ftCLuaGhJmR6WJfQfgd+gvJMEYvlVmMqFEz7Y=; 
 b=Y57yztyrpnHEgaiI957zxWEVItfIBo3uSQwmXJIlaOCupjy2tykJOAqXy1udOmAIQrO3jg2k4J8K4+y4IPG2ndz994vm7xgyN23ORAJRNksUQQ8fCY3rqI613njLvZ3oySPkg9HjyFw1xNCSSr/7yavdTdYOiM5B4EStqWj0Ydo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=helen.koike@collabora.com;
 dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722966823; 
 s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=vm9Xz4ftCLuaGhJmR6WJfQfgd+gvJMEYvlVmMqFEz7Y=;
 b=Et73oSQCEDClSg3IU+CRumgmoyIfQI+37BPGnN7QIpXl61qVPOCKlmSpq1bxFUhz
 jXy+QcAU87MjJosY+veiMd0aOmKN/ApQrSGt83IkpJx6jyrbiMdK0CZU27V/BVv6IiO
 OAz03sv/087ek79F/0DHc4WEjP9oTIIAXw/4tg2s=
Received: by mx.zohomail.com with SMTPS id 1722966822122477.7651221308056;
 Tue, 6 Aug 2024 10:53:42 -0700 (PDT)
Message-ID: <83921779-808f-487d-a6fc-5a853024791a@collabora.com>
Date: Tue, 6 Aug 2024 14:53:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/6] drm/ci: Add support for GPU and display testing
To: Daniel Stone <daniel@fooishbar.org>,
 Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 deborah.brouwer@collabora.com, dmitry.baryshkov@linaro.org,
 mcanal@igalia.com, melissa.srw@gmail.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240730021545.912271-1-vignesh.raman@collabora.com>
 <CAPj87rOYVCG2A10ruyYan9y6NmMY0fUM6Z5-9ht7dEp_THYmNw@mail.gmail.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <CAPj87rOYVCG2A10ruyYan9y6NmMY0fUM6Z5-9ht7dEp_THYmNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 05/08/2024 10:11, Daniel Stone wrote:
> Hi Vignesh,
> 
> On Tue, 30 Jul 2024 at 03:16, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> Some ARM SOCs have a separate display controller and GPU, each with
>> different drivers. For mediatek mt8173, the GPU driver is powervr,
>> and the display driver is mediatek. In the case of mediatek mt8183,
>> the GPU driver is panfrost, and the display driver is mediatek.
>> With rockchip rk3288/rk3399, the GPU driver is panfrost, while the
>> display driver is rockchip. For amlogic meson G12B (A311D) SOC, the
>> GPU driver is panfrost, and the display driver is meson.
>>
>> IGT tests run various tests with different xfails and can test both
>> GPU devices and KMS/display devices. Currently, in drm-ci for MediaTek,
>> Rockchip, and Amlogic Meson platforms, only the GPU driver is tested.
>> This leads to incomplete coverage since the display is never tested on
>> these platforms. This commit series adds support in drm-ci to run tests
>> for both GPU and display drivers for MediaTek mt8173/mt8183, Rockchip
>> rk3288/rk3399, and Amlogic Meson G12B (A311D) platforms.
>>
>> Update the expectations file, and skip driver-specific tests and
>> tools_test on non-intel platforms.
> 
> Thanks, series looks sensible and is:
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> 
> Cheers,
> Daniel


Applied to drm-misc-next

Thanks
Helen

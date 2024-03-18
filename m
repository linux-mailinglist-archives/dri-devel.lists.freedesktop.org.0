Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7596F87EB65
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 15:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CFD10F7F1;
	Mon, 18 Mar 2024 14:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Kt4qR/q+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CC110F7F2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 14:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710773344;
 bh=USOr6qU9s7oCtYs/hRrdocv0US/SAICnJv0VzvAXOfs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Kt4qR/q+CdWoweti9UtfSuJ0viP1USdpy92jythJySd+nv/6i13t51t8Blr1njkZ6
 iCi3CoElv2WjMVUkToNLrjDFtiH+30oXu61w0tWoJBWvLuFykq04a0qHusmnF9ztZh
 XaKVqrx3oap2zxRcSmFNpxYUQsb0vIZokfVBNEVuLtl2IsY8zjOHO0C8VoqJo2XVWX
 PlukdzC9HBegy4226bnOGpUm0gqyaI66qQfiBD+g+Uof5XzpKXOV++O1zp6ylz2F2g
 MOCS35dvJQf8ChRUq/fKGJdFpFVylmBCegkflwhea6UpBjeqp61oNxQl/ng+/2Ye26
 +tqAbm7YEAJPg==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D539A37811D1;
 Mon, 18 Mar 2024 14:48:59 +0000 (UTC)
Message-ID: <9f406611-54cd-3a69-5440-40535f3d30c0@collabora.com>
Date: Mon, 18 Mar 2024 20:18:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 03/11] drm/ci: uprev IGT and update testlist
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 emma@anholt.net, robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, mairacanal@riseup.net, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
 <20240306030649.60269-4-vignesh.raman@collabora.com>
 <CAA8EJpo=OXUitC+NPjZd5Kpq9dF04BSffvgsMYnn7LmmEoh09A@mail.gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAA8EJpo=OXUitC+NPjZd5Kpq9dF04BSffvgsMYnn7LmmEoh09A@mail.gmail.com>
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

Hi Dmitry,

On 15/03/24 17:07, Dmitry Baryshkov wrote:
> On Wed, 6 Mar 2024 at 05:08, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>>
>> Uprev IGT and add amd, v3d, vc4 and vgem specific
>> tests to testlist. Have testlist.txt per driver
>> and include a base testlist so that the driver
>> specific tests will run only on those hardware.
>> Also add testlists to the MAINTAINERS file.
> 
> I think we should move away from specifying tests explicitly. They can
> easily get out of sync. A month ago I had to manually go through the
> list of the tests and update it to follow changes in the IGT.
> 
> I think we should directly use testlist.txt from IGT and then filter
> it out using skips.

So we use the test-list-full.txt or test-list.txt from IGT and generate 
a single testlist for drm-ci when we uprev IGT?

Instead of adding the below to skips file for different driver,
msm_.*
^amdgpu.*
panfrost_.*
v3d_.*
vc4_.*

If we have a separate testlist for each driver, we can update the main 
testlist.txt along with individual testlist for each driver. We just 
need to move the driver specific tests from main testlist to individual
driver testlist file. Please let me know your thoughts.

Thanks.

Regards,
Vignesh

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB808B7DFB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 19:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D321F112D2F;
	Tue, 30 Apr 2024 17:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="gVQa55dR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A467E112D2F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 17:01:04 +0000 (UTC)
Message-ID: <9b549c06-aedc-4e05-9a48-b53f170b2a08@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714496462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJyVdz04ncZQQLx3WnEu8v8SZ3Ow/s4vvPahzDI5l+Y=;
 b=gVQa55dREcaO2BNyRQTyHDmkgaU4B8ovQXxxh1SUXIfqyrYgxBJqOLvU601NOPJfy2w9Az
 YFSOlAvS9NlPxMLl0ZCPeWXKIfdxXk/9XpobZ4hdWDBkGeEQrkfxLut255eWoNnC3By63G
 Dtg0gyiB+rvNpofAivlQAqI69cPrt5o=
Date: Wed, 1 May 2024 01:00:57 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] drm/panel: ili9341: Remove a superfluous else after return
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240429171218.708910-1-sui.jingfeng@linux.dev>
 <86b768d8-19e8-4f87-a250-b428bf78f756@quicinc.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <86b768d8-19e8-4f87-a250-b428bf78f756@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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


On 2024/4/30 07:10, Jessica Zhang wrote:
>
>
> On 4/29/2024 10:12 AM, Sui Jingfeng wrote:
>> The else clause after the ruturn clause is not useful.
>
> Hi Sui,
>
> Spelling nit: ruturn --> return
>

Thanks for pointed out, will be fixed.


> Besides that,
>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>
> Thanks,
>
> Jessica Zhang


Thanks, Jessica.


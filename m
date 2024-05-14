Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AFB8C59F0
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 18:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E499A10E011;
	Tue, 14 May 2024 16:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="V1wWoORH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284B610E0FB
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 16:54:01 +0000 (UTC)
Message-ID: <c44480ab-8d6b-4334-8eba-83db9b30ff1a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715705639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AwKYwvrCkgacfNudOapr20vF6Z2dViM5qKJdT/zY9Es=;
 b=V1wWoORHtkOwggxidh4UD6sOwetGrWxoKYClXH2O60xxT+ogsroUbhUyGk+8oYAAbHrSjA
 xwVpm4F5Mx7Wf6YXt301vFcAVl6lmi2LVdZiK9wuf1YyvbnlYW7vgDQ1TTrx4XIDZ6bbGP
 NbxgZQa8mT6jiUg9EtyGvmiIIoeQWoo=
Date: Wed, 15 May 2024 00:53:33 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] drm/bridge: Add 'struct device *' field to the
 drm_bridge structure
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240514154045.309925-1-sui.jingfeng@linux.dev>
 <20240514-scarlet-corgi-of-efficiency-faf2bb@penduick>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240514-scarlet-corgi-of-efficiency-faf2bb@penduick>
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

On 2024/5/15 00:22, Maxime Ripard wrote:
> Hi,
>
> On Tue, May 14, 2024 at 11:40:43PM +0800, Sui Jingfeng wrote:
>> Because a lot of implementations has already added it into their drived
>> class, promote it into drm_bridge core may benifits a lot. drm bridge is
>> a driver, it should know the underlying hardware entity.
> Is there some actual benefits, or is it theoretical at this point?


I think, DRM bridge drivers could remove the 'struct device *dev'
member from their derived structure. Rely on the drm bridge core
when they need the 'struct device *' pointer.

> Maxime

-- 
Best regards,
Sui


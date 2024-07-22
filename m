Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAFA939264
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 18:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C370510E194;
	Mon, 22 Jul 2024 16:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="V+Be+luh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id E36EB10E194;
 Mon, 22 Jul 2024 16:15:10 +0000 (UTC)
Received: from [192.168.49.54] (c-73-118-245-227.hsd1.wa.comcast.net
 [73.118.245.227])
 by linux.microsoft.com (Postfix) with ESMTPSA id 4184C20B7165;
 Mon, 22 Jul 2024 09:15:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4184C20B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1721664910;
 bh=ozaD6a0NowW7U00u2hDPiAL5ijIAeQOS6klyJ53d2c4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=V+Be+luhiZ8Vm/+HC2PjwH4zOP92nkalDiLRJjrSQvC864P+D/G4vw/lmtCrL7Q8X
 G7WleFzsAkcxI/PB6XLFlYW+dla75nxrE0O7vv/A33otKhT1NGFd5hIwVDq4yT7bf7
 yHV3vX0SAFFRgXi8unj18rDH25shXH/3nQiLksGE=
Message-ID: <24fa9e9b-81a8-4bbe-8d13-4d559ee76a96@linux.microsoft.com>
Date: Mon, 22 Jul 2024 09:15:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL GVT-g DRIVERS (Intel GPU Virtualization)"
 <intel-gvt-dev@lists.freedesktop.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Zhi Wang <zhiwang@kernel.org>
Subject: Re: [PATCH v4 3/6] drm/i915: Make I2C terminology more inclusive
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20240711052734.1273652-1-eahariha@linux.microsoft.com>
 <20240711052734.1273652-4-eahariha@linux.microsoft.com>
 <Zp5Vq9JoYC_OrA2C@ashyti-mobl2.lan>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <Zp5Vq9JoYC_OrA2C@ashyti-mobl2.lan>
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

On 7/22/2024 5:50 AM, Andi Shyti wrote:
> Hi Easwar,
> 
> merged to drm-intel-next. Thanks!
> 
> On Thu, Jul 11, 2024 at 05:27:31AM +0000, Easwar Hariharan wrote:
>> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
>> with more appropriate terms. Inspired by Wolfram's series to fix drivers/i2c/,
>> fix the terminology for users of I2C_ALGOBIT bitbanging interface, now that
>> the approved verbiage exists in the specification.
>>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> I realized after pushing that this had the tag:
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Not a big deal, but it's still a minor mistake.
> 
> Andi

Thank you for the merge, Andi! I'm missing what the mistake is, I added
the tags as I got them. Was I supposed to drop the R-B when Rodrigo gave
an A-B?

Thanks,
Easwar

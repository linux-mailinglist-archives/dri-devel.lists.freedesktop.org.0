Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4795DC29168
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 17:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFFA10E063;
	Sun,  2 Nov 2025 16:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Ue/O+sHM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8726610E063
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 16:02:48 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4czzyF0XKyz9scN;
 Sun,  2 Nov 2025 17:02:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762099365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yXnbX8obOxTZByxtaFJTonCzW0Sj9xEqQruBvutIFTA=;
 b=Ue/O+sHMUIkVTVRZaqnQY+gmPnJbUOOEBZIbT8CGO97u8N3tB+gLpKYvh8BEZtSersVGge
 upilb0Rhvh6hy5E5+SfBTkm5u7AMVoh4LoIdO9lVcDn7ddtBLV0KOk2b/GQsWIO7THRJeK
 HsvvmAILyejprOUKQjlOBCmfc9CjlbUUgjpXAOtVTqYmxF+ILu849OgGIF1BDsjXxQQx9x
 rGdzrgx0nwi6Rrt0CVCFLfodWD7QfgB+/t67TckYeO+UHNaUE+BblzA2MXBOD+xbDisIK0
 Gv3wb3/8kkofEhxIpZfEYCRKdtpTJSiDdzv7v+4RI5nWyxcmOcHIKdGUeK9qRA==
Message-ID: <f9057853-8b43-4ab6-ae65-ee5e4d569c46@mailbox.org>
Date: Sun, 2 Nov 2025 17:02:37 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
To: Shawn Guo <shawnguo2@yeah.net>, Rain Yang <jiyu.yang@oss.nxp.com>
Cc: airlied@gmail.com, boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, robh@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, simona@ffwll.ch, sre@kernel.org, steven.price@arm.com,
 tzimmermann@suse.de, xianzhong.li@nxp.com
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
 <ba95487c-ada7-48a4-90b7-fd99a0278f51@mailbox.org> <aP7DZCMk1pQ7wsFo@dragon>
 <aQB88c_AEC1RAZtH@oss.nxp.com> <aQCIAfyUC6N5y2fB@dragon>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aQCIAfyUC6N5y2fB@dragon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: s6w1ijnr4si371hym9im6ykirojs63uu
X-MBO-RS-ID: 393e84e1997a987fb3c
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

On 10/28/25 10:08 AM, Shawn Guo wrote:
> On Tue, Oct 28, 2025 at 04:21:05PM +0800, Rain Yang wrote:
>> On Mon, Oct 27, 2025 at 08:57:08AM +0800, Shawn Guo wrote:
>>> On Sat, Oct 11, 2025 at 12:53:29PM +0200, Marek Vasut wrote:
>>>> On 9/25/25 10:38 PM, Marek Vasut wrote:
>>>>> The instance of the GPU populated in i.MX95 is the G310, describe this
>>>>> GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
>>>> Is there still anything that should be changed with this patchset, or can it
>>>> be applied ?
>>>
>>> I'm waiting binding change to be applied first.  Or is it already done?
>>>
>>> Shawn
>>>
>> Hi Shawn,
>> It might be better for Marek to remove the always-on GPUAPB clock from the DTS, given that
>> it's an SCMI protocol clock and the kernel expects it to be available during operations.
>>
>> Also, the gpu_fix_reg appears unnecessary for the driver and could be removed[1].
>>
>> [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a8cb5ca53690aa809f4f65e14192753073e61a71,
>> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=02df3543f3e0ea572e2c739605ebd6c20e1149c4
> 
> Ah, sorry! I did not know we haven't reached agreement on the change.
The feedback above is new to me, so I am somewhat surprised too.

I'll just send a rebased V4 now.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571CB8D7CAF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 09:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EFC10E04C;
	Mon,  3 Jun 2024 07:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 35D2910E0EB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 07:45:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C66D81042;
 Mon,  3 Jun 2024 00:45:28 -0700 (PDT)
Received: from [10.57.39.221] (unknown [10.57.39.221])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 522F83F762;
 Mon,  3 Jun 2024 00:45:00 -0700 (PDT)
Message-ID: <ebcbc9c6-d858-4774-be48-857b7d446e15@arm.com>
Date: Mon, 3 Jun 2024 08:45:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/imagination: Add compatible string entry for
 Series6XT
To: Chen-Yu Tsai <wenst@chromium.org>, Frank Binns <Frank.Binns@imgtec.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Matt Coster <Matt.Coster@imgtec.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-5-wenst@chromium.org>
 <efdacd820d13368816973f57c4a817e039ec4a2d.camel@imgtec.com>
 <CAGXv+5EMMNCbxaBqiBSQwGrQt-0KXWAtJU54K20sUU8PBh8faQ@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <CAGXv+5EMMNCbxaBqiBSQwGrQt-0KXWAtJU54K20sUU8PBh8faQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 03/06/2024 04:29, Chen-Yu Tsai wrote:
> On Fri, May 31, 2024 at 7:18 PM Frank Binns <Frank.Binns@imgtec.com> wrote:
>>
>> On Thu, 2024-05-30 at 16:35 +0800, Chen-Yu Tsai wrote:
>>> The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
>>> of the Series6XT, another variation of the Rogue family of GPUs.
>>>
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>> ---
>>>  drivers/gpu/drm/imagination/pvr_drv.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
>>> index 5c3b2d58d766..3d1a933c8303 100644
>>> --- a/drivers/gpu/drm/imagination/pvr_drv.c
>>> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
>>> @@ -1475,6 +1475,7 @@ pvr_remove(struct platform_device *plat_dev)
>>>
>>>  static const struct of_device_id dt_match[] = {
>>>       { .compatible = "img,img-axe", .data = NULL },
>>> +     { .compatible = "img,powervr-6xt", .data = NULL },
>>
>> I assume that by adding this to the list of supported devices we're essentially
>> freezing the existing uapi. This concerns me, as we've not yet started running
>> Vulkan conformance on any Series6XT GPUs and there's a chance we may need to
>> make some tweaks.
>>
>> I'm not really sure what the accepted approach is to hardware enablement /
>> experimental support. I'm not sure if it's sufficient to hide support behind a
>> Kconfig option and/or module parameter or whether we just have to hold this
>> patch back for the time being.
> 
> I guess this is more of a question for the DRM maintainers.
> Added a couple Panfrost/Panthor folks for ideas.

I'm not sure quite what scale of "tweaks" you are expecting. Obviously
adding new uAPI is possible at any time - the only requirement is "don't
break user space" - i.e. don't remove old uAPI. Although obviously you
want to be careful about adding it because that means supporting it
forever more.

Panfrost has had an "unstable_ioctls" module parameter that we've hidden
performance counters behind. (Performance counters are hard from a uAPI
perspective - Panthor has similar issues).

We've also added support for GPUs in a deliberately "crippled" manner
(e.g. only one core group - see panfrost_get_core_mask()). I think we're
mostly just hoping those 'awkward' GPUs are not interesting enough and
we'll never implement full support for them - but if we did I expect
we'd implement support by providing a new uAPI for enabling the second
core group so old user space can continue working with just the single
core group.

Of course if the support for this platform is actually 'broken' (the
talk of GPU resets makes me think so - on Mali requiring a reset is a
"should never happen" situation, but we do have errata...) then it's
probably best holding off merging this until you've got something which
is minimally functional and then add support as necessary. For Vulkan
you can always have user space require a particular DRM kernel version
if you discover extra uAPI is needed.

Steve


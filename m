Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F5E880AFB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 07:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB73E10EC85;
	Wed, 20 Mar 2024 06:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="uYZSuycr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FF010EC85
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 06:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=a0P5TIt0Qos8BCXptSUzVUPMQQILLLRWlv1q937+UBw=; b=uYZSuycr4Wa58UZ4VTstiJx2ef
 g63HNwxpSn1M2h3gPOt45Gg3bIwWAV7eeSjyUIqnnYsQl4XWPM5CBYMikreSH+CqyyruNy+eFAFhQ
 /FlMCjg6Cb9DtdMGmWkSIGls4YCicYq68eKaLLEsEobjldb2LVcqQPiNyZdcQA8iqAe4yE1VGlOHo
 T6EsAfLyV7P7Yku/0l8Q0LGw/6QTsWSSFkF9wz0N/gt36dWOzD+8g8AAQvpSIZahxC5V8CJKTI4JO
 gEwg9lbSIrNXxb4Ot/JioOP19f05u6eoTm5yFflvMoRDY+7mPbk6Kncm/92Lyi3IY2CiUyQSE8Bjy
 FDLTxhXA==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rmp4c-0000000Fbdo-1xoi; Wed, 20 Mar 2024 06:05:14 +0000
Message-ID: <d4072aa1-47e4-45d3-9e04-2cd9d782b593@infradead.org>
Date: Tue, 19 Mar 2024 23:05:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] drm: xlnx: Fix kerneldoc
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sean Anderson <sean.anderson@linux.dev>
Cc: Michal Simek <michal.simek@amd.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20240319225122.3048400-1-sean.anderson@linux.dev>
 <20240319225122.3048400-2-sean.anderson@linux.dev>
 <e2eba421-cba1-4dd5-837c-6be5f07ed402@ideasonboard.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <e2eba421-cba1-4dd5-837c-6be5f07ed402@ideasonboard.com>
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



On 3/19/24 22:42, Tomi Valkeinen wrote:
> On 20/03/2024 00:51, Sean Anderson wrote:
>> Fix a few errors in the kerneldoc. Mostly this addresses missing/renamed
>> members.
>>
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>>
>> Changes in v2:
>> - New
>>
>>   drivers/gpu/drm/xlnx/zynqmp_disp.c  | 6 +++---
>>   drivers/gpu/drm/xlnx/zynqmp_dpsub.h | 1 +
>>   drivers/gpu/drm/xlnx/zynqmp_kms.h   | 4 ++--
>>   3 files changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> index 407bc07cec69..f79bf3fb8110 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> @@ -128,9 +128,9 @@ struct zynqmp_disp_layer {
>>    * struct zynqmp_disp - Display controller
>>    * @dev: Device structure
>>    * @dpsub: Display subsystem
>> - * @blend.base: Register I/O base address for the blender
>> - * @avbuf.base: Register I/O base address for the audio/video buffer manager
>> - * @audio.base: Registers I/O base address for the audio mixer
>> + * @blend: Register I/O base address for the blender
>> + * @avbuf: Register I/O base address for the audio/video buffer manager
>> + * @audio: Registers I/O base address for the audio mixer
> 
> Afaics, the kernel doc guide:
> 
> https://docs.kernel.org/doc-guide/kernel-doc.html#nested-structs-unions
> 
> says that the current version is correct. Or is the issue that while, say, 'base' is documented, 'blend' was not?

Hi,

I would do it more like so:

---
 drivers/gpu/drm/xlnx/zynqmp_disp.c |    3 +++
 1 file changed, 3 insertions(+)

diff -- a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -128,8 +128,11 @@ struct zynqmp_disp_layer {
  * struct zynqmp_disp - Display controller
  * @dev: Device structure
  * @dpsub: Display subsystem
+ * @blend: blender iomem info
  * @blend.base: Register I/O base address for the blender
+ * @avbuf: audio/video buffer iomem info
  * @avbuf.base: Register I/O base address for the audio/video buffer manager
+ * @audio: audio mixer iomem info
  * @audio.base: Registers I/O base address for the audio mixer
  * @layers: Layers (planes)
  */


but in my testing, Sean's way or my way result in no warning/errors.

-- 
#Randy

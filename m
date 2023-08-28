Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CB878B86D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 21:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543F610E097;
	Mon, 28 Aug 2023 19:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E321110E097
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 19:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=TCF3DZiwR+LciBxZwfgdUqWJse7HG6vOTEu+dxJAD1U=; b=JGoFgqKfEib4b2UaNztNP71dIw
 jQebNGkTa+ApDy0rLU9MuQNeTacjMcwUE8TEijZyAvchRJd20Zr3WBmvpXwqh1jc2vnRxwn3DSpmX
 RzvAs8ruV1f5AD0mH4JwHfDE2EwW8wDqw/5mL1I3XmmCWzeFbIXUrWFclkGOQdxuHTBe/SBijZsMI
 bA2ZQd/eHmBDqN0s75ylSBhsw1yhdAbEYz9nloq5obRxoc+XEdaTQjsojN5bwO4uNxFufUwQQUW2c
 2Rk2qdaL3li0NtcuLQVbkyibG811fXCJOtxLyI09FVIAp/49l1XiX7Nz1VFKLCczFKSpxRDL3NtJa
 swsn2Jxw==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qahzC-00AA1F-1u; Mon, 28 Aug 2023 19:33:18 +0000
Message-ID: <05e511c7-596d-c9c6-51d8-8883c6a62599@infradead.org>
Date: Mon, 28 Aug 2023 12:33:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 01/20] drm/xlnx/zynqmp_disp: Use correct kerneldoc
 formatting in zynqmp_disp
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-2-lee@kernel.org>
 <20230828163925.GU14596@pendragon.ideasonboard.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230828163925.GU14596@pendragon.ideasonboard.com>
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Simek <michal.simek@xilinx.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi--

On 8/28/23 09:39, Laurent Pinchart wrote:
> Hi Lee,
> 
> Thank you for the patch.
> 
> On Thu, Aug 24, 2023 at 08:36:46AM +0100, Lee Jones wrote:
>> Fixes the following W=1 kernel build warning(s):
>>
>>  drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'blend' not described in 'zynqmp_disp'
>>  drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'avbuf' not described in 'zynqmp_disp'
>>  drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'audio' not described in 'zynqmp_disp'
>>
>> Signed-off-by: Lee Jones <lee@kernel.org>
>> ---
>> Cc: Hyun Kwon <hyun.kwon@xilinx.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Michal Simek <michal.simek@xilinx.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> index 407bc07cec69a..7c64ab11fe2b0 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> @@ -128,9 +128,9 @@ struct zynqmp_disp_layer {
>>   * struct zynqmp_disp - Display controller
>>   * @dev: Device structure
>>   * @dpsub: Display subsystem
>> - * @blend.base: Register I/O base address for the blender
>> - * @avbuf.base: Register I/O base address for the audio/video buffer manager
>> - * @audio.base: Registers I/O base address for the audio mixer
>> + * @blend: .base: Register I/O base address for the blender
>> + * @avbuf: .base: Register I/O base address for the audio/video buffer manager
>> + * @audio: .base: Registers I/O base address for the audio mixer
> 
> This is really a hack to work around the warning, and not a clean fix.
> kerneldoc is still today unable, as far as I understand, to document
> nested structures. That's annoying, and the warning is a good way to

kernel-doc for nested structs/unions is documented in Documentation/doc-guide/kernel-doc.rst.

This isn't pretty, but this fixes the warnings for me: (massage the
descriptions as you see fit)


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
+ * @blend: blender struct
  * @blend.base: Register I/O base address for the blender
+ * @avbuf: audio/video buffer manager struct
  * @avbuf.base: Register I/O base address for the audio/video buffer manager
+ * @audio: audio mixer struct
  * @audio.base: Registers I/O base address for the audio mixer
  * @layers: Layers (planes)
  */


> remind us that it needs to be fixed. I'd be tempted to keep the warning
> for that reason.
> 
>>   * @layers: Layers (planes)
>>   */
>>  struct zynqmp_disp {
> 

-- 
~Randy

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DD932B5D1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 08:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC336E8D0;
	Wed,  3 Mar 2021 07:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net
 [194.109.24.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C296E8D3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 07:51:34 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id HMI4lRaOXOruFHMI8lBqgK; Wed, 03 Mar 2021 08:51:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1614757892; bh=BEM3CACPJM7ofFI6RVOnnROC7C6JWyliYyP1layUNnc=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=O5JqxmWOE5bK8Bm/KWrZq+HBfY2QL4B9l4r+gLiiiudulq1myWV/k/KSfXzikqPNG
 3WljAs0x5R0HXx4ryjqAyXF7s3xXf5inng/P9KvLmGnfN4qnlEHyG6GhQxG4I8bnF2
 sqRQtCGIL2pnWjQ2LGHDbETHTDoHh68vmpof1negWaqBdF+iwzoh61w77CYrLSvNRz
 SoAhQKdHffji0yG5MHEFI5xpP3ds1CJrd3KhRVjZ6OsOZwKDG6o3hZFgpqM7wreRcY
 dI9TYANl/w8fPNUTb638e5iMVoD4FVCzrBErLCVEJQDNK+UNrCWHB/TbNwWsosgNmo
 3EXg8YwdmccdQ==
Subject: Re: [PATCHv2 6/6] drm/omapdrm/dss/hdmi5: add CEC support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
 <20210302162403.983585-7-hverkuil-cisco@xs4all.nl>
 <fe8eefe2-16d0-5d15-8a88-508d71a1f505@ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <95ec6807-49d1-d9e0-005b-25c65e85ea9b@xs4all.nl>
Date: Wed, 3 Mar 2021 08:51:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <fe8eefe2-16d0-5d15-8a88-508d71a1f505@ideasonboard.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfLUrwz930kT5vBzlfMrsNAetN3XNEhJmBylu1ob6RTqJFIHTHfIgSVEySKEAQ/1hlWi+WOHlIJudAVlm5OPj1ZDLQ3U3rs8oqHj/khWmTT7OC7OZS/Kk
 b/a0lpf7MDdYMbD07IuSgV7t8CKYi+DaBbIHP050VPfRzacNOqL1LaLZ/DfJuqUEkvcxJXRzXqi3UgFBGVhcuGNV5BG+2+KjUsDNCS4yrEZsfwhTrnv4DnMI
 kQqdMkh09T6a1KM6Be7GwowfkMHaLNKXfiJr62s6fjQXtm22DPV1k9IVn64YFpF0udpryh6Sm0O232O8QpTPIrKuHksr/vrRUij2QS/obQUrjR5ElfQC7hDN
 /jNZE20YyqesmqZl4P9aEF9j+QSP3mO4tBacfdHvlmWeYdk+ioNbjAj6PuEnqBPpFhvgrnsmriEj8pqhFDO5HT9nmwZggxn0LS2XjCmJzGRhsKlAx+FcvqK5
 Pp6o07OoLYD4ceM7
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/03/2021 08:47, Tomi Valkeinen wrote:
> On 02/03/2021 18:24, Hans Verkuil wrote:
>> Add HDMI CEC support for OMAP5.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>   drivers/gpu/drm/omapdrm/Kconfig          |   8 +
>>   drivers/gpu/drm/omapdrm/Makefile         |   1 +
>>   drivers/gpu/drm/omapdrm/dss/hdmi.h       |   1 +
>>   drivers/gpu/drm/omapdrm/dss/hdmi5.c      |  63 +++++--
>>   drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c  | 209 +++++++++++++++++++++++
>>   drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h  |  42 +++++
>>   drivers/gpu/drm/omapdrm/dss/hdmi5_core.c |  35 +++-
>>   drivers/gpu/drm/omapdrm/dss/hdmi5_core.h |  33 +++-
>>   8 files changed, 373 insertions(+), 19 deletions(-)
>>   create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
>>   create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h
> 
> <snip>
> 
>> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
>> index 070cbf5fb57d..a83b634f6011 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
>> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
>> @@ -30,8 +30,18 @@
>>   #define HDMI_CORE_IH_PHY_STAT0			0x00410
>>   #define HDMI_CORE_IH_I2CM_STAT0			0x00414
>>   #define HDMI_CORE_IH_CEC_STAT0			0x00418
>> +#define CEC_STAT_DONE				BIT(0)
>> +#define CEC_STAT_EOM				BIT(1)
>> +#define CEC_STAT_NACK				BIT(2)
>> +#define CEC_STAT_ARBLOST			BIT(3)
>> +#define CEC_STAT_ERROR_INIT			BIT(4)
>> +#define CEC_STAT_ERROR_FOLL			BIT(5)
>> +#define CEC_STAT_WAKEUP				BIT(6)
>> +
>>   #define HDMI_CORE_IH_VP_STAT0			0x0041C
>>   #define HDMI_CORE_IH_I2CMPHY_STAT0		0x00420
>> +#define HDMI_CORE_IH_MUTE_I2CM_STAT0            0x00614
> 
> The line above has indentation in spaces, but everything else uses tabs.

Well spotted!

I've fixed that in my tree.

> 
> Other than that:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks!

	Hans

> 
>   Tomi
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 794986A09E6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 14:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DF110E1FC;
	Thu, 23 Feb 2023 13:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085BB10E1FC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 13:10:53 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2DE52E4;
 Thu, 23 Feb 2023 14:10:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1677157852;
 bh=WYy+JIwjACK0ewwdjromDn+ooNvg12hqZ611KgIZSg4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=DAYm/15WuaNLA/s+g6H/W878t69F1Wig+J58dDyvzoEWL26lQLsmwQ8ZG/vf32NzZ
 Qa1FAXZot+Yyc1o6MzOc14UDNNFtx4v2ltkZgFsAET9UCkT4bghaa4zjc0NA/65CW0
 MemuTKzhEFi9YV7HF3uI/PRrQ5Jl0L69TSJadiz0=
Message-ID: <029a92fa-d1e0-54da-76b9-a6e1dd65298e@ideasonboard.com>
Date: Thu, 23 Feb 2023 15:10:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/7] media: Add Y210, Y212 and Y216 formats
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ming Qian <ming.qian@nxp.com>
References: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221221092448.741294-3-tomi.valkeinen+renesas@ideasonboard.com>
 <691e89bd57907c96cbb8e922cb12b1264b31d471.camel@ndufresne.ca>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <691e89bd57907c96cbb8e922cb12b1264b31d471.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

On 22/02/2023 17:28, Nicolas Dufresne wrote:
> Hi Tomi,
> 
> Le mercredi 21 décembre 2022 à 11:24 +0200, Tomi Valkeinen a écrit :
>> Add Y210, Y212 and Y216 formats.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   .../media/v4l/pixfmt-packed-yuv.rst           | 49 ++++++++++++++++++-
>>   drivers/media/v4l2-core/v4l2-ioctl.c          |  3 ++
>>   include/uapi/linux/videodev2.h                |  8 +++
>>   3 files changed, 58 insertions(+), 2 deletions(-)
> 
> It seems you omitted to update v4l2-common.c, Ming Qian had made a suplicated
> commit for this, I'll ask him if he can keep the -common changes you forgot.

Ah, I wasn't aware of the format list in that file.

I think you refer to the "media: imx-jpeg: Add support for 12 bit 
extended jpeg" series. Yes, I'm fine if he can add the -common changes 
there, but I can also send a separate patch. In fact, maybe a separate 
fix patch is better, so that we can have it merged in the early 6.3 rcs.

  Tomi


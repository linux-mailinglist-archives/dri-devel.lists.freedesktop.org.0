Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B72F651F0C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27A610E38C;
	Tue, 20 Dec 2022 10:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CA110E2A0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 13:48:34 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 762E9825;
 Mon, 19 Dec 2022 14:48:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671457708;
 bh=RpSn2vOqEZukIs1Pbj5MNpVE4yelT/wFEM48zH0mQiE=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=smFGbW9csXC9jki4qEM/zJUwAwbaavuZPlODPPwtfi4tdWVAay3acGF1uNfT4XEp2
 Ys0BGJ9E4di+H2IwpHgg99757y7z2sWBCYwv0m54gwhcCVIJ/v9jLEzWRCyrikixHB
 v5JHPuOAHHxERUMQ12LNeiVfeUUSA88yafZO4O38=
Message-ID: <6fad0920-0a66-8273-6bd3-2db20fa9c4d7@ideasonboard.com>
Date: Mon, 19 Dec 2022 15:48:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/7] media: Add 2-10-10-10 RGB formats
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20221206133954.397098-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221206133954.397098-2-tomi.valkeinen+renesas@ideasonboard.com>
 <228a5a9416a891895ce0e108719ba0badbbd0ad8.camel@ndufresne.ca>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <228a5a9416a891895ce0e108719ba0badbbd0ad8.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Dec 2022 10:39:50 +0000
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

On 06/12/2022 19:39, Nicolas Dufresne wrote:
> Hi,
> 
> Le mardi 06 décembre 2022 à 15:39 +0200, Tomi Valkeinen a écrit :
>> Add XBGR2101010, ABGR2101010 and BGRA1010102 formats.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> This patch is simply missing an update to
> 
> Documentation/userspace-api/media/v4l/pixfmt-rgb.rst

Right, I missed the doc change for this and for the next patch. I'll add 
docs for the next version.

  Tomi


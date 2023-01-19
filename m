Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BBC674F0B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D3810EA6D;
	Fri, 20 Jan 2023 08:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3E510E8F5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 09:27:58 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 634167EC;
 Thu, 19 Jan 2023 10:27:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674120476;
 bh=zqFSO9XGFqeDiP1z3zfWG793JP/D7D+zoJzSnIe9AVY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZwvNMZaNCL1OrCSQxvhRhl8Gze9BPyLhDX+/NZU6PhVojjlgLVndl1Y+2NhHK5RAt
 UOE56HQJJVrcFe/RM7K9zxsDAgrqtpJdf2tVmRWyOgKsI81PA5VP901Z9FYRrBL2Wq
 /eOw3f9Ow+SCj/1YN7w66TdCAuFPmStI2NWKmlTA=
Message-ID: <cb6100eb-a64f-953e-b62f-e384e634800a@ideasonboard.com>
Date: Thu, 19 Jan 2023 11:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 6/6] drm: rcar-du: Stop accessing non-existant registers
 on gen4
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-7-tomi.valkeinen+renesas@ideasonboard.com>
 <Y8hqka17Sz8lK/Yq@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y8hqka17Sz8lK/Yq@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 20 Jan 2023 08:07:34 +0000
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/01/2023 23:54, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Jan 17, 2023 at 03:51:54PM +0200, Tomi Valkeinen wrote:
>> The following registers do not exist on gen4, so we should not write
>> them: DEF6Rm, DEF8Rm, ESCRn, OTARn.
> 
> I think DEF7Rm should also be skipped. With that,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Yep, makes sense.

  Tomi


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941E34C6B3F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 12:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E89510E60B;
	Mon, 28 Feb 2022 11:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E7010E61C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 11:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=udd09eFqadeejKNI+SSdE71bPbfoQ042eXd2ldYPGZY=; b=lvZafW5tuWIFwxGWEStnV17ZiA
 QPk/ZJEjkcWY+2TgKbb8StSPNp27aByS/vq4BLVV3Rxs9IfsY0Zy11GhqN5PGHOQQxAOo+WENYYCL
 N4FlNUeAijQONF6lSRtvznWYothf1ZZoVrZq/DEM9yF8HoiwzhxL5Wy5/8f/0HhbQ4h7TayvoR58r
 Ete8ECAAi1w+K9dxQ20QQ2Yar7KQeklvfHX4YDsMaE9whGqcsBhg+Egf1MAVf4YeNvUzVz5cGHCX7
 yBn4NRx8ZnlMM+gYLk9JozPVd9J2QBosRWhgN/U4sC4R2yRGbqjEDVcxNC7tIBs1+W+4LNyxg6eem
 L5DUAjtg==;
Received: from [2a01:799:95e:a400:cca0:57ac:c55d:a485] (port=62627)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nOeXU-0008WB-CA; Mon, 28 Feb 2022 12:50:04 +0100
Message-ID: <165743e0-c661-9f23-a6dd-08f4aaef7659@tronnes.org>
Date: Mon, 28 Feb 2022 12:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v6 0/5] drm/tiny: Add MIPI DBI compatible SPI driver
To: Maxime Ripard <maxime@cerno.tech>
References: <20220227124713.39766-1-noralf@tronnes.org>
 <20220228083138.bl7vbj6scpxrgmdr@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220228083138.bl7vbj6scpxrgmdr@houat>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 28.02.2022 09.31, skrev Maxime Ripard:
> Hi,
> 
> On Sun, Feb 27, 2022 at 01:47:08PM +0100, Noralf Trønnes wrote:
>> Hi,
>>
>> This patchset adds a driver that will work with most MIPI DBI compatible
>> SPI panels out there.
>>
>> One change this time: Fix indentation in the DT binding.
>>
>> All patches are reviewed now so I will apply this after Rob's bot have
>> looked at the binding.
>>
>> Thanks for reviewing!
> 
> I just merged it in drm-misc-next.
> 

Thanks.

> Thanks a lot for being persistent enough to get through this, it will
> massively improve the situation for those displays :)
> 

Some times it's good not knowing how long it will take to do a project,
I wouldn't have done it if I knew, but then again I'm now glad there's a
future proof solution for this :) I did it for the maker community which
continues to facinate me with its ingenuity and energy.

Thanks Maxime for the idea that made it possible to do a generic driver
in mainline!

Noralf.

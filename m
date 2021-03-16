Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C1833D562
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 15:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D82F6E3F2;
	Tue, 16 Mar 2021 14:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303B76E3F2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 14:03:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FED564F9D;
 Tue, 16 Mar 2021 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615903435;
 bh=ho8VK/nwBd5H2y4bKi45p7YEcMtEVUmmuah52IEH4i4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qfBlXzqOKN8+OZvXkcSig6NsWRFQ09BsPvxD0eTyC3mDElfi3qpbcjT/puy5EdIBX
 Uo8/Lz/Vk4fLgYowCsw+dxO1JF9ZLRbW88SjX6JdLQBs/EkZG4Ozp93/3t0yg0s/kh
 xty6RA9AlV/Ce2yAkox6W6hG2Rykt0TdEYguHOm38Nc0StjP4SnP2oimyEMNzd3kfW
 vllR0K0GOk0nibk1GLeZ4L0NZAMCvFHIM249/weo6mX3igAPnoqjGXVuPfTi8inhNI
 sigi/vc8KYEbiZed4fXaNYXmTCD7GwQ5zXe0xRw126ptZxfBbMeO+pjrlLwB5MzU0x
 aFEng6GGMMPSg==
Subject: Re: [PATCH] drm/omap: dsi: fix unsigned expression compared with zero
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 angkery <angkery@163.com>
References: <20210312071445.1721-1-angkery@163.com>
 <YE1xsg0gm0nNR8hy@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomba@kernel.org>
Message-ID: <dd0578a1-9726-4be2-f8a1-b164675b1b02@kernel.org>
Date: Tue, 16 Mar 2021 16:03:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YE1xsg0gm0nNR8hy@pendragon.ideasonboard.com>
Content-Language: en-US
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
Cc: Junlin Yang <yangjunlin@yulong.com>, airlied@linux.ie,
 sebastian.reichel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/03/2021 04:15, Laurent Pinchart wrote:
> Hi Junlin,
> 
> Thank you for the patch.
> 
> On Fri, Mar 12, 2021 at 03:14:45PM +0800, angkery wrote:
>> From: Junlin Yang <yangjunlin@yulong.com>
>>
>> r is "u32" always >= 0,mipi_dsi_create_packet may return little than zero.
>> so r < 0 condition is never accessible.
>>
>> Fixes coccicheck warnings:
>> ./drivers/gpu/drm/omapdrm/dss/dsi.c:2155:5-6:
>> WARNING: Unsigned expression compared with zero: r < 0
>>
>> Signed-off-by: Junlin Yang <yangjunlin@yulong.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Tomi, will you take this in your tree ?

Thanks. Yes, I'll pick this up.

  Tomi

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

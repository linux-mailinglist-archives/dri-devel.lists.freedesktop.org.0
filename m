Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C8234A27C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 08:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE606EEB8;
	Fri, 26 Mar 2021 07:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458866EEB8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 07:24:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3010461935;
 Fri, 26 Mar 2021 07:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616743494;
 bh=tVARFWteZzvz4340tigTJdsmCz/hOh5guz5vK9EB7N8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OLF3MBwLj84Vusn4dUtIPFGvdkvSREo/iqg5H1tjH+U6U+5jfcILgmMyTtx2Vt0gg
 HvOzHlOJjeedI31Nlt7UAbpeTSjZ3PQ7VsDWdUCHZ9ffxgM/CIonSjs1kAYwG5DLTU
 9+zw9fe74CorqDws7EcmQ6lldigXz8U81blDU4M8fvuDEZo5+271VwUDnUO2XvGghs
 z2/JU1XYh4VEZMvyNRpnc7n+zqsfyk9Dc+3I5sPVBcjFFWewcYzNQFMoLRJrdvFCwL
 lqYtJ6DoDMLiRZQEsH4jC7zBBswgcFXGsUijbOD/x6v7BedeUvuMhDkGf9mDjHSiup
 w7GFnyWzxUJJw==
Subject: Re: [PATCH] [v2] drivers: gpu: drm: Remove duplicate declaration
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Wan Jiabing <wanjiabing@vivo.com>
References: <20210325111028.864628-1-wanjiabing@vivo.com>
 <YFyKriqHBgtWiX2q@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomba@kernel.org>
Message-ID: <78a234fe-1149-24c4-8318-9c78c63fbbc7@kernel.org>
Date: Fri, 26 Mar 2021 09:24:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFyKriqHBgtWiX2q@pendragon.ideasonboard.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, kael_w@yeah.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/03/2021 15:05, Laurent Pinchart wrote:
> Hi Wan,
> 
> Thank you for the patch.
> 
> On Thu, Mar 25, 2021 at 07:10:24PM +0800, Wan Jiabing wrote:
>> struct dss_device has been declared. Remove the duplicate.
>> And sort these forward declarations alphabetically.
>>
>> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Tomi, I assume you'll handle this patch, please let me know if you don't
> plan to do so.

Yep, picked this up. Thanks!

  Tomi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

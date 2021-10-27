Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB4943C530
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 10:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CB76E4AD;
	Wed, 27 Oct 2021 08:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0EC6E4AD
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 08:30:56 +0000 (UTC)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BD9A596;
 Wed, 27 Oct 2021 10:30:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1635323454;
 bh=V2brccML3+QxKykFo706VWpR5RyEZhjwMfXQLBLZpwc=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=I8PsZUe4ZzGQSagSPxAVtt2OXiMVu7VGOn7XWv0c7HKXYDedfuVlfaBOpcO/IrkRj
 pw+2GMlb4gjX2u61Aj0ZrnRxSqCyXI+JakgmJvmFdzgv4FNbtXD/kOMkNI2tYnav1M
 laWYH5bh/qJtut9Iringv3k5gPSdalYLqT/xxog0=
Subject: Re: [PATCH v6 1/9] drm/omap: add sanity plane state check
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Benoit Parrot <bparrot@ti.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
 <20211018142842.2511200-2-narmstrong@baylibre.com>
 <ea3d01fd-b723-b245-90cc-c5874f95122c@ideasonboard.com>
Message-ID: <d4985027-e448-4220-a558-f1063dc9691f@ideasonboard.com>
Date: Wed, 27 Oct 2021 11:30:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ea3d01fd-b723-b245-90cc-c5874f95122c@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/10/2021 11:29, Tomi Valkeinen wrote:
> On 18/10/2021 17:28, Neil Armstrong wrote:
>> Call drm_atomic_helper_check_plane_state() from the plane
>> atomic_check() callback in order to add plane state sanity
>> checking.
>>
>> It will permit filtering out totally bad scaling factors, even
>> if the real check are done later in the atomic commit.
> 
> I think there's more to it: the function sets plane_state->visible, 
> which is used in later patches.

Maybe that could be mentioned in a comment. But otherwise:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

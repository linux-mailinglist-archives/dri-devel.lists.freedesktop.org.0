Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7DA423E15
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 14:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2586E49D;
	Wed,  6 Oct 2021 12:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35D36E49D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 12:48:58 +0000 (UTC)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA3B9581;
 Wed,  6 Oct 2021 14:48:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1633524537;
 bh=7By+evsO+V8pvOVSMoqS/pELwTwJg63ZEEVqwo6GCQY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=i8m8iA7JLynPglqq11ooqSUemGKd3myJBU3tGvOuvrmHuuVM3Rkk0TNP5KPM/nD4R
 Xh4IuttgosirCVxsFN4XTkBqwtMiEmfccRLicw6+qr7VsNQfU6On7g+NgcPnNQ7XSq
 gexDRxLZorZFVXJbZwdWLqWrdHUT1c5ilPEXTivc=
Subject: Re: [PATCH v5 0/8] drm/omap: Add virtual-planes support
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com
References: <20210923070701.145377-1-narmstrong@baylibre.com>
 <5e60b305-dda2-ab9a-0954-f2d2b441667e@baylibre.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <de447fe0-69dd-9b1b-6ed9-d1b75a7665a3@ideasonboard.com>
Date: Wed, 6 Oct 2021 15:48:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5e60b305-dda2-ab9a-0954-f2d2b441667e@baylibre.com>
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

Hi Neil,

On 06/10/2021 11:17, Neil Armstrong wrote:
> Hi,
> 
> On 23/09/2021 09:06, Neil Armstrong wrote:
>> This patchset is the follow-up the v4 patchset from Benoit Parrot at [1].
>>
>> This patch series adds virtual-plane support to omapdrm driver to allow the use
>> of display wider than 2048 pixels.
>>
>> In order to do so we introduce the concept of hw_overlay which can then be
>> dynamically allocated to a plane. When the requested output width exceed what
>> be supported by one overlay a second is then allocated if possible to handle
>> display wider then 2048.
>>
>> This series replaces an earlier series which was DT based and using statically
>> allocated resources.
>>
>> This implementation is inspired from the work done in msm/disp/mdp5
>> driver.
> 
> Gentle ping, who is supposed reviewing those patches ?

I think that would be me. I'll try to find time in the nearby future to 
do the review.

  Tomi

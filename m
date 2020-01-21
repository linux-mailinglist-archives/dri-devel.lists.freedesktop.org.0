Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C66CB144D80
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56CD6FAE7;
	Wed, 22 Jan 2020 08:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from olimex.com (olimex.com [184.105.72.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773636EC7D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 11:37:18 +0000 (UTC)
Received: from 94.155.250.134 ([94.155.250.134]) by olimex.com with ESMTPSA
 (ECDHE-RSA-AES128-GCM-SHA256:TLSv1.2:Kx=ECDH:Au=RSA:Enc=AESGCM(128):Mac=AEAD)
 (SMTP-AUTH username stefan@olimex.com, mechanism PLAIN)
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 03:37:12 -0800
Subject: Re: [PATCH 1/2] dmaengine: sun4i: Add support for cyclic requests
 with dedicated DMA
To: Vinod Koul <vkoul@kernel.org>, Maxime Ripard <mripard@kernel.org>
References: <20200110141140.28527-1-stefan@olimex.com>
 <20200110141140.28527-2-stefan@olimex.com> <20200115123137.GJ2818@vkoul-mobl>
 <20200115170731.vt6twfhvuwjrbbup@gilmour.lan>
 <20200121083514.GE2841@vkoul-mobl>
From: Stefan Mavrodiev <stefan@olimex.com>
Message-ID: <54b1a38f-3903-49b7-d20b-f97824a528ba@olimex.com>
Date: Tue, 21 Jan 2020 13:37:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200121083514.GE2841@vkoul-mobl>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Cc: Stefan Mavrodiev <stefan@olimex.com>, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/21/20 10:35 AM, Vinod Koul wrote:
> On 15-01-20, 18:07, Maxime Ripard wrote:
>> On Wed, Jan 15, 2020 at 06:01:37PM +0530, Vinod Koul wrote:
>>> On 10-01-20, 16:11, Stefan Mavrodiev wrote:
>>>> Currently the cyclic transfers can be used only with normal DMAs. They
>>>> can be used by pcm_dmaengine module, which is required for implementing
>>>> sound with sun4i-hdmi encoder. This is so because the controller can
>>>> accept audio only from a dedicated DMA.
>>>>
>>>> This patch enables them, following the existing style for the
>>>> scatter/gather type transfers.
>>> I presume you want this to go with drm tree (if not let me know) so:
>>>
>>> Acked-by: Vinod Koul <vkoul@kernel.org>
>> There's no need for it to go through DRM, it can go through your tree :)
> okay in that case I have applied now :), thanks
>
Hi,

Should I keep this patch in the future series or drop it?

Best regards,
Stefan Mavrodiev

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

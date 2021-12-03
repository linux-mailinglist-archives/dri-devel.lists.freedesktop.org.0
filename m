Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6881046765F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 12:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0EB72D15;
	Fri,  3 Dec 2021 11:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6621D72D15
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 11:31:39 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DADBDA59;
 Fri,  3 Dec 2021 12:31:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638531097;
 bh=g8VewkLNxgeqY0smuXrNzqSj4mXm3H/LbBl7zwaAQYU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fRElAeNUoBPHNS2iI77y5XbCquTnFJoiWQpcWqzZxUrproMCVbG5oA3aMAUFLE9Sq
 Gv2tEwqkydBYu7dd925D1IqImSiAHEDMsah2CmDw0FegLtiKNHTsOZV1mi/UmeO1bc
 PXPnd6znk9vzIPuUaTk8gY7IWPFbFu3eyDIAleHU=
Subject: Re: [PATCH v7 0/9] drm/omap: Add virtual-planes support
To: Neil Armstrong <narmstrong@baylibre.com>
References: <20211117141928.771082-1-narmstrong@baylibre.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <bab2b84a-ebef-ec69-187f-745e739079eb@ideasonboard.com>
Date: Fri, 3 Dec 2021 13:31:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211117141928.771082-1-narmstrong@baylibre.com>
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
Cc: khilman@baylibre.com, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/11/2021 16:19, Neil Armstrong wrote:
> This patchset is the follow-up the v4 patchset from Benoit Parrot at [1].
> 
> This patch series adds virtual-plane support to omapdrm driver to allow the use
> of display wider than 2048 pixels.
> 
> In order to do so we introduce the concept of hw_overlay which can then be
> dynamically allocated to a plane. When the requested output width exceed what
> be supported by one overlay a second is then allocated if possible to handle
> display wider then 2048.
> 
> This series replaces an earlier series which was DT based and using statically
> allocated resources.
> 
> This implementation is inspired from the work done in msm/disp/mdp5
> driver.

I think this looks good. I'll apply this to my work tree to see if I see 
any issues during my daily work, and if not, I'll push to drm-misc-next.

Have you tested this with other platforms than x15? I'm mostly thinking 
about omap3/4, as the DSS is somewhat different on those platforms.

  Tomi

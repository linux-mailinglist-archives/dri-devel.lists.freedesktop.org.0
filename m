Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECE52B306E
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 20:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B6A6E91F;
	Sat, 14 Nov 2020 19:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944366E91F
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 19:58:47 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 2DE2F8054C;
 Sat, 14 Nov 2020 20:58:45 +0100 (CET)
Date: Sat, 14 Nov 2020 20:58:43 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 1/5] drm/panel/samsung-sofef00: Add panel for OnePlus 6/T
 devices
Message-ID: <20201114195843.GA3900471@ravnborg.org>
References: <20201112161920.2671430-1-caleb@connolly.tech>
 <20201112161920.2671430-2-caleb@connolly.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112161920.2671430-2-caleb@connolly.tech>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=OPaO7OcAVtVQApmh9Q0A:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Caleb,
On Thu, Nov 12, 2020 at 04:21:13PM +0000, Caleb Connolly wrote:
> The OnePlus 6/T devices use different panels however they are
> functionally identical with the only differences being the resolution.
> The panels also don't seem to be used by any other devices, just combine
> them into one driver.
> 
> The panels are: samsung,sofef00
> and             samsung,s6e3fc2x01
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>

Thanks, applied to drm-misc-next.
Fixed a few checkpatch --strict warnings when applying.
Please check with --strict in the future.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

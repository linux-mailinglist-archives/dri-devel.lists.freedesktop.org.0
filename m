Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A0F2C7B9A
	for <lists+dri-devel@lfdr.de>; Sun, 29 Nov 2020 23:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7136E027;
	Sun, 29 Nov 2020 22:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FE16E027
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 22:12:01 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A968320031;
 Sun, 29 Nov 2020 23:11:59 +0100 (CET)
Date: Sun, 29 Nov 2020 23:11:58 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 3/5] drm: panel: simple: Allow specifying the delay
 from prepare to enable
Message-ID: <20201129221158.GJ1162850@ravnborg.org>
References: <20201109170018.v4.1.Icaa86f0a4ca45a9a7184da4bc63386b29792d613@changeid>
 <20201109170018.v4.3.Ib9ce3c6482f464bf594161581521ced46bbd54ed@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109170018.v4.3.Ib9ce3c6482f464bf594161581521ced46bbd54ed@changeid>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8 a=4Av5kLI2NlvhjzHu5tUA:9
 a=CjuIK1q_8ugA:10 a=xmb-EsYY8bH0VWELuYED:22
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Douglas,

On Mon, Nov 09, 2020 at 05:00:57PM -0800, Douglas Anderson wrote:
> On the panel I'm looking at, there's an 80 ms minimum time between HPD
> being asserted by the panel and setting the backlight enable GPIO.
> While we could just add an 80 ms "enable" delay, this is not ideal.
> Link training is allowed to happen in parallel with this delay so the
> fixed 80 ms delay over-delays.
> 
> We'll support this by logging the time at the end of prepare and then
> delaying in enable if enough time hasn't passed.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
Applied too.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15F71E594A
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD8B6E421;
	Thu, 28 May 2020 07:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 323 seconds by postgrey-1.36 at gabe;
 Wed, 27 May 2020 07:21:31 UTC
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BFB6E297
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 07:21:31 +0000 (UTC)
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id E73953C0579;
 Wed, 27 May 2020 09:16:05 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aUYj8-iqg8eh; Wed, 27 May 2020 09:16:00 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id B81673C0022;
 Wed, 27 May 2020 09:16:00 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.38) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 27 May
 2020 09:16:00 +0200
Date: Wed, 27 May 2020 09:15:55 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20200527071555.GA23912@lxhi-065.adit-jv.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
X-Originating-IP: [10.72.94.38]
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: muroya@ksk.co.jp, airlied@linux.ie, mrodin@de.adit-jv.com,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 Eugeniu Rosca <erosca@de.adit-jv.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 gotthard.voellmeke@renesas.com, koji.matsuoka.xm@renesas.com,
 horms@verge.net.au, seanpaul@chromium.org, michael.dege@renesas.com,
 Harsha.ManjulaMallikarjun@in.bosch.com, ezequiel@collabora.com,
 efriedrich@de.adit-jv.com, ChaitanyaKumar.Borah@in.bosch.com,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 VenkataRajesh.Kalakodima@in.bosch.com, uli+renesas@fpond.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jacopo,

On Tue, Oct 15, 2019 at 12:46:13PM +0200, Jacopo Mondi wrote:
 ----8<---

> * Testing
> I have tested by injecting a color inversion LUT table and enabling/disabling it
> every 50 displayed frames:
> https://jmondi.org/cgit/kmsxx/log/?h=gamma_lut

Could you kindly share the cross compilation steps for your kmsxx fork?

Just out of curiosity, have you ever tried to pull the display's HDMI
cable while reading from CM2_LUT_TBL?

At least with the out-of-tree CMM implementation [*], this sends the
R-Car3 reference targets into an unrecoverable freeze, with no lockup
reported by the kernel (i.e. looks like an serious HW issue).

> 
> CMM functionalities are retained between suspend/resume cycles (tested with
> suspend-to-idle) without requiring a re-programming of the LUT tables.

Hmm. Is this backed up by any statement in the HW User's manual?
This comes in contrast with the original Renesas CMM implementation [**]
which does make use of suspend (where the freeze actually happens).

Can we infer, based on your statement, that we could also get rid of
the suspend callback in [**]?

[*] https://github.com/renesas-rcar/du_cmm
[**] https://github.com/renesas-rcar/du_cmm/blob/c393ed49834bdbc/meta-rcar-gen3/recipes-kernel/linux/linux-renesas/0001-drm-rcar-du-Add-DU-CMM-support.patch#L1912

-- 
Best regards,
Eugeniu Rosca
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

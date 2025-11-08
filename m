Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352E9C42EAB
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 15:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4825210E02C;
	Sat,  8 Nov 2025 14:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="X3+/1ntP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E9D10E02C
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 14:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=dCqeDCHVTC0aJCIbqAO3XCT0AXxUyonF5z42GFLUBzk=; b=X3+/1ntPtv5AqOsrrJKVPTy2/w
 91S4tWzHAZp4/UdZhK/V82I1cqfw1A8X9dT3SiWcGVQZFF7Jial6nQDHjIRw8G1+bd6rMmgx0eJWy
 +/MOLLoInivmDPnQEzhRx/KcqkI7iQKVaKDr/i/wOuV/cmk7fkR0McvpF0knev2A7Jg0=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:32796
 helo=debian-lenovo) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1vHkNk-0006C6-Ry; Sat, 08 Nov 2025 09:57:37 -0500
Date: Sat, 8 Nov 2025 09:57:35 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Message-Id: <20251108095735.fbd3db3e3d24f3f7baacb1b6@hugovil.com>
In-Reply-To: <TYCPR01MB832759A2410465D46E7095DC8AC3A@TYCPR01MB8327.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
 <20251105222530.979537-2-chris.brandt@renesas.com>
 <20251107113058.f334957151d1a8dd94dd740b@hugovil.com>
 <OS3PR01MB83195AF3F1964548E1512FBE8AC3A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <20251107140750.00bf68e4b2f5354015e65ad4@hugovil.com>
 <OS3PR01MB8319E496A32EDBF5719BAB478AC3A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <20251107171809.6033526ffe5e57ec72bd4f96@hugovil.com>
 <TYCPR01MB832759A2410465D46E7095DC8AC3A@TYCPR01MB8327.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -1.8 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-2.8 required=5.0 tests=ALL_TRUSTED,NICE_REPLY_A
 autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
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

On Fri, 7 Nov 2025 23:25:40 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

> Hi Hugo,
> 
> On Fri, Nov 7, 2025 5:18 PM, Hugo Villeneuve wrote:
> 
> > > > +				if (params->pl5_intin < PLL5_INTIN_MIN ||
> > > > +				    params->pl5_intin > PLL5_INTIN_MAX)
> > >
> > >
> > > And if you want the same behavior as before, shouldn't the comparison be with "<=" and ">=" ?
> 
> > I didn't see an answer to my question/comment about comparison with "<=" and ">=" ?
> 
> The hardware manual says:
> 
> INTIN		20 to 320
> 
> So, both 20 and 320 are valid values.
> 
> Meaning I only want to 'continue' (ie, skip)   if ( x <=19 || x >= 321 )
> 
> or rather
> 
> if ( x < 20 || x > 320 )
> 
> So the original code of...
> 
> +				params->pl5_intin = (foutvco_rate * params->pl5_refdiv) /
> +						    (EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> +				if (params->pl5_intin < PLL5_INTIN_MIN + 1 ||
> +				    params->pl5_intin > PLL5_INTIN_MAX - 1)
> +					continue;
> 
> ....was wrong.
> 
> I forgot to mention that in the patch.     :)

Hi Chris,
thank you, that is clearer now.

Hugo.

> 
> Thanks,
> Chris
> 
> 


-- 
Hugo Villeneuve <hugo@hugovil.com>

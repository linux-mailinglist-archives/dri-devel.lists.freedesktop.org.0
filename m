Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B36345D9B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 13:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA1A6E8D6;
	Tue, 23 Mar 2021 12:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692156E8D6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 12:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kTDRd9zfjfWlZO3tHtMdx+hS2YN0gHdMTk7iiOS/mIg=; b=sQ8zIji8VssD74x9oEgyE8zgxC
 ZEDjCKo4eORExUTikYJiHBnU+oSV/3qmeGbhdvimvM8UTQm5BdwjODDLO1qiNdI0VEqW59yCqjOnB
 ysW1nF0KimyjzMyDKoX5s4DwTYy/cOknsjqODA+NY+oJ7eDxh4NmAPDL+Z0sn21GViQ40x4uSklAh
 U1+873PocB64BfgpAM3HIpXOAdWn6sZ+8Yv86yRk1tKuqdcZ+B0uMhI891+wKDMtcofI0u8EHwut0
 QRrsYuUDRApvW+uNwgKfx+5tIcpFB1cjOW3W+RUbAu/UprlScKghT4KBsvw8iPMBw/+jLylD1I6Sb
 Zs2lh/sw==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=roundcube.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jyri.sarha@iki.fi>)
 id 1lOfnO-0007tU-DR; Tue, 23 Mar 2021 14:06:02 +0200
MIME-Version: 1.0
Date: Tue, 23 Mar 2021 14:05:59 +0200
From: Jyri Sarha <jyri.sarha@iki.fi>
To: Dario Binacchi <dariobin@libero.it>
Subject: Re: [PATCH v3 0/3] drm/tilcdc: fix LCD pixel clock setting
In-Reply-To: <20210322213337.26667-1-dariobin@libero.it>
References: <20210322213337.26667-1-dariobin@libero.it>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ea8c24d101444baf61cdaae62a320d9e@iki.fi>
X-Sender: jyri.sarha@iki.fi
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomba@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks,

Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
for the series.

I'll merge these later today.

Best regards,
Jyri

On 2021-03-22 23:33, Dario Binacchi wrote:
> The series was born from a patch to fix the LCD pixel clock setting.
> Two additional patches have been added to this. One renames a 
> misleading
> variable name that was probably the cause of the bug and the other 
> fixes
> a warning message.
> 
> 
> Changes in v3:
> - Replace calculated with requested in the warning message.
> - Swap the positions of the real_pclk_rate, and pclk_rate parameters
>   in the warning message.
> 
> Changes in v2:
> - The patch has been added in version 2.
> - Rename clk_div_rate to real_pclk_rate.
> - Provide pixel clock rate to tilcdc_pclk_diff().
> - The patch has been added in version 2.
> 
> Dario Binacchi (3):
>   drm/tilcdc: rename req_rate to pclk_rate
>   drm/tilcdc: fix LCD pixel clock setting
>   drm/tilcdc: fix pixel clock setting warning message
> 
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

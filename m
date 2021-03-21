Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCCA34344A
	for <lists+dri-devel@lfdr.de>; Sun, 21 Mar 2021 20:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D2C89A8C;
	Sun, 21 Mar 2021 19:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828D689A8C
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 19:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2Pp7qpuZ6cKqb7wAYzrualgiKhChWZWPFLKK8Goj1ZY=; b=kVlH3yZ0miDeLQKd15LeAMkT8M
 +X96G2dZO9qNm0QYv/XeJZnb6k8Y3XbfCMaXP5u1BA5zZkmKBrW0yFQ99U0+7MVuuN9L4Am+/jOm3
 jnlebYZI446PE6/wg7PuGQQMUhsQgWmPzFKYK7yUVyUOL2Kf3zsj9uyu63oiTn0I2BLBSY4J80QCz
 w+m3I7PZHhZQfIraH45xVshnsq9ytRXNs8MEDa2urNWPme8lFbdM2NXtB3FLoCeNlzJIeCcyjfzgH
 yO68rCIHsqh/uncAcOPV90zBdD1As6dgIoWRpa4juxFhYyxF6StMPzLQ61vjDCUQvmcA25Q6ZHC5h
 vf+EgStw==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=roundcube.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jyri.sarha@iki.fi>)
 id 1lO3Qk-0005yW-BH; Sun, 21 Mar 2021 21:08:06 +0200
MIME-Version: 1.0
Date: Sun, 21 Mar 2021 21:08:03 +0200
From: Jyri Sarha <jyri.sarha@iki.fi>
To: Dario Binacchi <dariobin@libero.it>
Subject: Re: [PATCH v2 0/3] drm/tilcdc: fix LCD pixel clock setting
In-Reply-To: <20210321083153.2810-1-dariobin@libero.it>
References: <20210321083153.2810-1-dariobin@libero.it>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <87d9ed919351d46ba914e16fc24ee77e@iki.fi>
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

On 2021-03-21 10:31, Dario Binacchi wrote:
> The series was born from a patch to fix the LCD pixel clock setting.
> Two additional patches have been added to this. One renames a 
> misleading
> variable name that was probably the cause of the bug and the other 
> fixes
> a warning message.
> 

Thanks you,

I think this looks good now.

Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>

For the series.

I'll wait a day or two if Tomi has something more to say and merge this 
to drm-misc-next.

Best regards,
Jyri

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
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

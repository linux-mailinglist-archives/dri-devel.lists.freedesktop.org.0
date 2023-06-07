Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F590726284
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 16:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BCB10E030;
	Wed,  7 Jun 2023 14:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Wed, 07 Jun 2023 14:15:49 UTC
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279EE10E030
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 14:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1686147332; x=1686752132; i=markus.elfring@web.de;
 bh=RQuo8dyog3mYW6in/LTmEgS3V88U2/IL0mn3Tu4TrUc=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=BnttttpueKgFrGICongOfAtCn8H2tHIKdk1vzZlfpWaq5WbpCeDkedBaCybL+JXGBxujga4
 r2sM27MWgkhoZVPWMq55riSmNk4AX8QUIsWH6+pWVK+/t1ekPrCgd1M5+g6zjHv5ueIw/vd7/
 hNokkN0zrZ35iafY3644B79vasxUWKi9C/1+PgevNJrrWZOgj4+kK3E4WDWR6BsYKIVRksVlr
 h6Es52hpOlj8IG/smNR3bpicD7LWo0MsDNolxV0kDziZmY4GLw5dKKNa+Uxnie9JRvqqay+BU
 JrRgy3k6t0PkgmsP9KaAcDquKnFmr7WZZSUFofvuGHzs5J/KBvPA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M3Ez1-1qASbT06rV-003Sx5; Wed, 07
 Jun 2023 16:08:30 +0200
Message-ID: <64ec9964-c22c-f299-6d92-46050659be06@web.de>
Date: Wed, 7 Jun 2023 16:08:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 00/30] fbdev: Make userspace interfaces optional
To: Thomas Zimmermann <tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <16a8f34a-d4f9-2e1d-02cf-e4c53f89c006@web.de>
 <8c2db8a0-048c-af17-85f6-ac0946ce0f0f@suse.de>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <8c2db8a0-048c-af17-85f6-ac0946ce0f0f@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:fJm+G94cMiRl/h+VYW8PlU00Ki7hpzXkivVYmv8yENERx3uKp5K
 GaeSzOe8BlOFdIuvU3bSKI8NSbO7rv+gBdupT5CmsPPmxqjhinsZAeZZLDAoZehhoa8ensS
 QSDUJwMJpJAaJ3c5P8Z1FoE2wtvGjjJwoYoXkQPXmgMjiLm4eP6pJVgbCIc5EZmAWAMMkRn
 CQm/Ipz/C6erBejE4kJng==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aFA2o3+0FPw=;FpP0denXJFCkdr6X58ckT2ivVKe
 5OWMrTNnFdyav4OC5/RWCh+/X6T5YBnNDtmc9uGYbGom9Lq0ehCHM5R52ewkegnuciu4yyCKc
 xnB/zI0FBKBnYZm+j5p3liiMnFj3HzBZwRlRMQ3qRz3GKXev/YsoacF1BnQShmWChl5BzSTAt
 pmPEKSBgoJMihRzRk5cyVFkN8j/Cvcp/WlZpaoRE+SbQvGY6tb2DguaB9Ed4dJOBaScrHC+8z
 oKotGKqs4oYejVaBYU4ITfnN4xgD704NSnlTH/7fv7iyY1m+O7sU/zd18NmIK9Uhtjgu3JQzb
 G6zK337DpJJJrpLI9pfvZY6QL3XhMZ3prr8Rg7TCVxqWAz9F6lnRtAIc3zpsXJinjdh4k0grw
 JgWC11RVeLMtTRsDFSOWIofPItp4z9obi5WAQn2tMu2nVyUJenhAZVNU+mYGagxU5lx5xYRff
 xwlFswzQRzdd7J/kZRDDmmIl8bbXm4/tPfQBh0dzD9CvrlMzRk6a8MSWFv0o6z2znW2j8wz3b
 nnwE3uw4WV+PGFvL3bh+/Nw6RiTCsONkqsjUhH1egHFL0sWmXPmCRK4pzV7qHbxp1dTx3PaXV
 dIAQSI+yiJM8lF99zxm079Zp5Ro8DY0+q0pOjFJ1pYSCoyQLmwao1ZD0rAUOFZAl+xy3YVy0V
 1C37o/OdT/XM7fE5oiOQ/b7IK6hpDuehUuhMPylLfkXRyNUCD7d9edEvGrLrOZRHByzNHGqWw
 rBV0dB7w7eiV9OfhVXbDChX0aLqH6ugB9FVTM3S79ejkL+8YFJQn/+Kotn/l401aKiwe93w1x
 54tbzgfMw9eEBQymWdZjNWLlJYFyEWwvRpvOtKHjBCxYGDNiBI2Yl/1G+KLZK1H0G+73OWOAa
 eni1nprlK7WkWe+EssGRLlktQNVkrv/HcO8tuDnhG52icOd79Pm4+YiZlGVAcZbKGwP5k8Ifa
 DOpkzA==
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
Cc: linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Ha! It says 'distrobutions'.

Do you tend to prefer any distributions?

Regards,
Markus

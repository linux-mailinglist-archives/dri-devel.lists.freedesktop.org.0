Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25E1660634
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 19:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910E410E8AD;
	Fri,  6 Jan 2023 18:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4459 seconds by postgrey-1.36 at gabe;
 Fri, 06 Jan 2023 18:11:48 UTC
Received: from 7.mo583.mail-out.ovh.net (7.mo583.mail-out.ovh.net
 [178.32.124.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D5210E8AD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 18:11:48 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.138.143])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 92EFE21458
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 16:51:55 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-mgz66 (unknown [10.110.171.20])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4EA361FEE3;
 Fri,  6 Jan 2023 16:51:55 +0000 (UTC)
Received: from RCM-web10.webmail.mail.ovh.net ([151.80.29.18])
 by ghost-submission-6684bf9d7b-mgz66 with ESMTPSA
 id a5ObEKtRuGNCwgYAts80MA
 (envelope-from <steve@sk2.org>); Fri, 06 Jan 2023 16:51:55 +0000
MIME-Version: 1.0
Date: Fri, 06 Jan 2023 17:51:54 +0100
From: Stephen Kitt <steve@sk2.org>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RESEND 0/4] video/backlight: Use backlight helpers
In-Reply-To: <20230106164856.1453819-1-steve@sk2.org>
References: <20230106164856.1453819-1-steve@sk2.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <991730cc3a5688ada96258e4834a9304@sk2.org>
X-Sender: steve@sk2.org
X-Originating-IP: 82.65.25.201
X-Webmail-UserID: steve@sk2.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5884797339128530566
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkedtgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigihgtgfesthekjhdttderjeenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepkeehgfekjeeijefgveejudevjeekgeffvddtjefhhfetheevtddvjeejvdeuieeknecukfhppeduvdejrddtrddtrddupdekvddrieehrddvhedrvddtuddpudehuddrkedtrddvledrudeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshhtvghvvgesshhkvddrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not sure why git send-email didn't thread this, I can resend if 
necessary.

Le 06/01/2023 17:48, Stephen Kitt a écrit :
> This started with work on the removal of backlight_properties'
> deprecated fb_blank field, much of which can be taken care of by using
> helper functions provided by backlight.h instead of directly accessing
> fields in backlight_properties. This patch series doesn't involve
> fb_blank, but it still seems useful to use helper functions where
> appropriate.
> 
> Stephen Kitt (4):
>   backlight: aat2870: Use backlight helper
>   backlight: arcxcnn: Use backlight helper
>   backlight: ipaq_micro: Use backlight helper
>   backlight: tosa: Use backlight helper
> 
>  drivers/video/backlight/aat2870_bl.c    | 7 +------
>  drivers/video/backlight/arcxcnn_bl.c    | 5 +----
>  drivers/video/backlight/ipaq_micro_bl.c | 7 +------
>  drivers/video/backlight/tosa_bl.c       | 7 +------
>  4 files changed, 4 insertions(+), 22 deletions(-)

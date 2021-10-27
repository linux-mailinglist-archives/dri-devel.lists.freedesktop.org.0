Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 417C243BE77
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 02:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14586E200;
	Wed, 27 Oct 2021 00:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 406 seconds by postgrey-1.36 at gabe;
 Wed, 27 Oct 2021 00:25:55 UTC
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7036E200
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 00:25:55 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4620E3201DDB
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 20:19:09 -0400 (EDT)
Received: from imap45 ([10.202.2.95])
 by compute3.internal (MEProxy); Tue, 26 Oct 2021 20:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noisetron.com;
 h=mime-version:message-id:date:from:to:subject:content-type; s=
 fm1; bh=8JmQGBsxlXRxb6yekttaOEn2GBkFkGGHmdw3O3e8Srs=; b=3fbZfh6Q
 /JiJH276+kdKYxTuQMeH3SpE2hrVD597VZaFVN1AtmmdinwHjZmLmtdWldtSD9eB
 ONvEvmCEAIvBeP/o6UMUgQa4PBlkCAF9dPg1UurJZ//z0YB+JQbSim6mTe04Mc4U
 Jvm9js4iuhTkSKOFUbWykCK7EgPUsUqMMPN6UmWBKtCd34mJKQDnwVm4h3VWFjG2
 mEouVngrXOFZsydpUkQn+9+SUqOh5m/BNF18ZE3oJwNYLTcLCOt8GPN+Pfc82nL3
 EyKxv0TzsFM7XXkkgqiASx+cAkjH/iwcIAdZMITcwsDSVTanBdt9adY5mWC0uw5H
 Di2Nlb+Q7lNAYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=8JmQGBsxlXRxb6yekttaOEn2GBkFk
 GGHmdw3O3e8Srs=; b=B22nCTCP5BTNjZpKX+gemoiD695lLfmsRZ5NXGvBcMQ6E
 i+rmV0cT3JKov3Nshf/SxHX+oZ2gcVkUIjSfQ0JGNWr32rwjH0gS1oQkQsvEvMn1
 wSVfQpUfoVPThDZc+4FFty42+pllUbLxU1UMvwTXbLs53DEGg5HN/yIHejLQCKd6
 Sg2tjj1ZXbXNkc39TcGmecDt3ZsqGGrkOOOssLch7DnJcydibp+68qIpUderJsTJ
 KkOcsoY2Bgldbl2kPxvEsMl/9BNhjzILC8WGrUPqGZb0td2WL15e9de1MC9B6GkD
 vWeILa9HQTsbNrFKhxC49bcOJO6O3yQpqGiH+gh0Q==
X-ME-Sender: <xms:_Jp4YZ3Jx5n3VWtR_1twowqcH6fGbv4TjLiNIjbxh00G1UM_u8bxmQ>
 <xme:_Jp4YQEC5kPuUl9DadNHLSGz48nGGshnp29TV_97hF7jXkjwLWvEWTnE1MeL-yYiM
 0YLnLoLfdE-yGcX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefledgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
 erredtnecuhfhrohhmpedfuegvrhhtucfutghhihgvthhtvggtrghtthgvfdcuoegsvghr
 thesnhhoihhsvghtrhhonhdrtghomheqnecuggftrfgrthhtvghrnhepkeffveekudffle
 eludehhffhleelkedthedufeeljeehhfelieegveegieefgeffnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsggvrhhtsehnohhishgvthhroh
 hnrdgtohhm
X-ME-Proxy: <xmx:_Jp4YZ4YCD0BDW5ILNC-0pNn5Nrgwk4wC3oODARaQB_7k0kIvXamoA>
 <xmx:_Jp4YW3bGz1SxVkVdi9bbqt1lRTR8n9h_MOxjwDNSVWzGQBZRqcTvQ>
 <xmx:_Jp4YcEfwBbU8kKQwidMhgMqaMZd-1O3zYxUEhMfDedWRj5WneECjw>
 <xmx:_Jp4YQTr-huLd42p8tNAYjYnmgJkymZ8QGq7iRCjUqCtH_NvQIPlpg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id ABD8424A006F; Tue, 26 Oct 2021 20:19:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
x-forwarded-message-id: <4f4bc108-1c2a-4f12-a1ad-336dcff1ddea@www.fastmail.com>
Message-Id: <e9e2bbf8-daa3-48f0-b875-f7487b64d57c@www.fastmail.com>
Date: Tue, 26 Oct 2021 17:18:47 -0700
From: "Bert Schiettecatte" <bert@noisetron.com>
To: dri-devel@lists.freedesktop.org
Subject: dri/drm/kms question with regards to minor faults 
Content-Type: text/plain
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

Hi All,

I have an application I'm working on where I'm using OpenGLES / EGL and dri/drm/kms. The main loop of my application looks like the code below. When running htop, I see that the number of minor faults (memory) are increasing over time at a rate of about 500 per second, due to the code below. Is this normal and something to worry about, and is there a way to get rid of the minor faults? I'm on the rockchip rk3288 platform. The faults do not come from my OpenGLES code. 

      while (true) {
                 struct gbm_bo *next_bo;
                 int waiting_for_flip = 1;
          
                 // do OpenGLES stuff ... 

                 eglSwapBuffers(gl.display, gl.surface);
                 next_bo = gbm_surface_lock_front_buffer(gbm.surface);
                 g_fb = drm_fb_get_from_bo(next_bo);

                 ret = drmModePageFlip(drm.fd, drm.crtc_id, g_fb->fb_id,
                                 DRM_MODE_PAGE_FLIP_EVENT, &waiting_for_flip);
                 if (ret) {
                         printf("failed to queue page flip: %s\n", strerror(errno));
                         return -1;
                 }

                 while (waiting_for_flip) {
                         ret = select(drm.fd + 1, &fds, NULL, NULL, NULL);
                         if (ret < 0) {
                                 printf("select err: %s\n", strerror(errno));
                                 return ret;
                         } else if (ret == 0) {
                                 printf("select timeout!\n");
                                 return -1;
                         } else if (FD_ISSET(0, &fds)) {
                                 printf("user interrupted!\n");
                                 break;
                         }
                         drmHandleEvent(drm.fd, &evctx);
                 }
                 gbm_surface_release_buffer(gbm.surface, g_bo);
                 g_bo = next_bo;
        }

Thanks!
Bert

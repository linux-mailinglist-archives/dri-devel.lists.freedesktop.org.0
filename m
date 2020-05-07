Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BB31C8329
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 09:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574FF6E951;
	Thu,  7 May 2020 07:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m176150.mail.qiye.163.com (m176150.mail.qiye.163.com
 [59.111.176.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAB26E040
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 03:09:53 +0000 (UTC)
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
 by m176150.mail.qiye.163.com (Hmail) with ESMTP id E210C1A30A3;
 Thu,  7 May 2020 11:09:15 +0800 (CST)
Message-ID: <AAsA8gAQCF1C9rDJm0RSQaqC.3.1588820955909.Hmail.bernard@vivo.com>
To: Bernard Zhao <bernard@vivo.com>
Subject: =?UTF-8?B?UmU6W1BBVENIXSBkcm0vbWVzb246IHBtIHJlc3VtZSBhZGQgcmV0dXJuIGVycm5vIGJyYW5jaA==?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 157.0.31.122
In-Reply-To: <20200428131747.2099-1-bernard@vivo.com>
MIME-Version: 1.0
Received: from bernard@vivo.com( [157.0.31.122) ] by ajax-webmail (
 [127.0.0.1] ) ; Thu, 7 May 2020 11:09:15 +0800 (GMT+08:00)
From: Bernard <bernard@vivo.com>
Date: Thu, 7 May 2020 11:09:15 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZSFVNQ0lLS0tKTUtJSkxJQllXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kJHlYWEh9ZQUhMTktISU9MQk5JN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6Ogg6Qxw6Kjg9SjhCCT8xFkspKCoaCjhVSFVKTkNDQ0lLQk5NS0hIVTMWGhIXVRkeCRUaCR87
 DRINFFUYFBZFWVdZEgtZQVlKTkxVS1VISlVKSUlZV1kIAVlBT0tOSDcG
X-HM-Tid: 0a71ed1bd32393b4kuwse210c1a30a3
X-Mailman-Approved-At: Thu, 07 May 2020 07:05:09 +0000
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
Cc: opensource.kernel@vivo.com, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


From: Bernard Zhao <bernard@vivo.com>
Date: 2020-04-28 21:17:47
To:  Neil Armstrong <narmstrong@baylibre.com>,David Airlie <airlied@linux.ie>,Daniel Vetter <daniel@ffwll.ch>,Kevin Hilman <khilman@baylibre.com>,dri-devel@lists.freedesktop.org,linux-amlogic@lists.infradead.org,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org
Cc:  opensource.kernel@vivo.com,Bernard Zhao <bernard@vivo.com>
Subject: [PATCH] drm/meson: pm resume add return errno branch>pm_resump api did not handle drm_mode_config_helper_resume error.
>This change add handle to return drm_mode_config_helper_resume`s
>error number. This code logic is aligned with api pm_suspend.
>After this change, the code maybe a bit readable.
>
>Signed-off-by: Bernard Zhao <bernard@vivo.com>
>---
> drivers/gpu/drm/meson/meson_drv.c | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
>index b5f5eb7b4bb9..8c2e1b47e81a 100644
>--- a/drivers/gpu/drm/meson/meson_drv.c
>+++ b/drivers/gpu/drm/meson/meson_drv.c
>@@ -412,9 +412,7 @@ static int __maybe_unused meson_drv_pm_resume(struct device *dev)
> 	if (priv->afbcd.ops)
> 		priv->afbcd.ops->init(priv);
> 
>-	drm_mode_config_helper_resume(priv->drm);
>-
>-	return 0;
>+	return drm_mode_config_helper_resume(priv->drm);
> }
> 
> static int compare_of(struct device *dev, void *data)
>-- 
>2.26.2
>


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

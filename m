Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5668970E64A
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 22:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2570510E4BF;
	Tue, 23 May 2023 20:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC47810E4C4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 20:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1684872704; i=markus.elfring@web.de;
 bh=2UBgmsE0lRTC4ZZw+6pft99nQduDiYt00H6BWryB1fA=;
 h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
 b=KbwmiGqCtUYZn2aFTU1etm4r+bTxyrdpEPkct7b0gAsPUrAXG73nD+OBquqU3rttb
 H0BbHCDb5EdCy9ESKeH6wVimnkukBd2oCoHnPaz3bMWeKoeXMMpjLDy18kADCRgR/q
 lxkyvG3xyvlA2LiyxUdqCvSN8zlr7NZTJz8jtOVmuNkC4Xdz+CFD8j37vQkTg2dSMj
 UPs8atKCLpy9p8E7WA4s92otN7OvRIm5T9UtJmbjdhD5p0SJ30LrTsBmIlEwpfjqde
 QG7k46yBbo1082+8QUZgP6UdHs8T2eHbGPh7bv1CeL/PX8epouwGqcgU85yBURtNRo
 +wO7LDS1/AH+Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MsrdM-1qH9Oy1d4y-00tFb5; Tue, 23
 May 2023 22:11:44 +0200
Message-ID: <8f0bcb48-7677-340d-282e-27f6fe063c6b@web.de>
Date: Tue, 23 May 2023 22:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH 0/2] fbdev: Adjustments for fb_alloc_cmap_gfp()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:13H8L4N2THdC6lDo4SsbF7dg+eEyup1yxyOJ/lNpE3HOJu35xcu
 G5YwtBEwwHOILFjqlqRUiNiSpgLWXA/9lfGvkyuddv8GEd1lOa3eBo+lTpsynRvPncFa0Da
 rCnaX9lNPpwZqWonDQBrte+lIs59xgokwAfpeSdGSeRhCh+M1VaC1s+BO7NI5GBTPG0djWm
 YgV+q3LOw5OT0hh/xr0cg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lStSMXX01mA=;iFegeRwYjnKoA43MAWuIE53moSB
 13QR9/zkKdQW8nJEsXECaKa6Xqy1PVVPxrwmvAKa6jLlPWBqi+gQiOtTpFnhUx+1ckp+OlQ6K
 vWdAtmNuTTBiJ03loxBLJuWsW+Kg8do5A8tJoV+eTZzF6EMqki2yufpjUM4Bkk0FySG880ie2
 6RvBx/Co68PHSe8kY/6Qkfb0N+hS+gdAe/evKFnb22WfVtIYPudjrz2kmEnbVSVIaVz2FpdQk
 SswTpUzKxXAdHX2EykKgR7ooIwF33GYc/VYm7Q8MsVhCAZ2DMco9Xtgq73CKnetBC7jJeekGb
 VEwOzG5XtmE+QMNXZQmEr44aX4gf45a/gkVymnW9VriNsAwnZlNe9dy3eahy2P8C9mPZpOdoO
 KB0R2MYOLmR0febDMLPdnAFn1M4Czl5x1o/SCJBYAv5N21/1yfWn0VSsjFB4PsP2NMyVB2dRX
 e8dyskr2V53eWusbnMKGPJv5ggSwboP/LC98BVOe71iSN//jvolrh79Sj6glmZ2lsRy4qHSso
 M/WRk1bc9tkoBcKU7DDVyl/LZ+Uf4RbdJxhDxNfZeo5Fs9/9hWChQbAg2HY0V0ueuRzTWpd+K
 mWtj7FQGRUiu+JMzUx9Abvzfv0/7iqti7+DMq3kz51SOXLO1ydO+u88PINuL7jiJcoJY6AfHC
 ZQCSk8dSR/l2+hWj9edhhEAfeeuLagVefSIJQ25K7/ot6ZgRzVkgNe7ESzJ0Ncgar/iIcdAS2
 sAozOct1u/BrSWfHIPlopljZb1pdS/NJ1tiZWpitXnhAXSNW4hyYhzNLOuaPmPyK7gNZMAt9C
 MWcxKXdqeE7LV9bDth5x0vNHQbtkWEWbx+56lMTSCF1/bm0fpmJ27WmqKQv6pQAlwZ6wrV3VF
 3BVVpqhH//EzhXeWK1IWIXFEz6RZbakGx6thMr/ANaHzVF1YGctLUMQ2cmpYBU+EpYsjxi+Bj
 hzk52A==
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2023 22:04:33 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Move two variable assignments
  Convert a variable initialisation into a later assignment

 drivers/video/fbdev/core/fbcmap.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

=2D-
2.40.1


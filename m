Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4940E70E2CA
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 19:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A8210E487;
	Tue, 23 May 2023 17:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CB810E491
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 17:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1684863289; i=markus.elfring@web.de;
 bh=wJpJJu08NC9W/k/YAUF8KLFobfpz5YG6WTqizHg1J5k=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=otDHEHHapj7uwwJg+dVI6/hJz+BuuTPOmGd0qB0Un0FKVIQW39UmntkQ/bJuTytmn
 4s8hPsF4iVDQYmr5n87IPbj5cCbamKs4FAB/pwsAx/ZozjU2kE0YTyRJwHNFXpdpRF
 srO1ktfJCcHEsUjOFmmwQ7Kzv4jIMNghof53PT37WJ7WAI1LiWKD1s6+38iOdgErPm
 7uZTQsc3FCOQD6/vui9Rbj7bAZMYBJZCiucj/J+NoNCxiGJLVHgkjKP+w5hnMazt0C
 IF1+pXUvvKF1IoQOw/oS5rKedLAv0cmxWx80PzfUIRjSjOLUFVZP2mHLJcgjCJQJbi
 vS+ZijaSxZgxw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MS17v-1pZd7C0XzX-00TVIV; Tue, 23
 May 2023 19:34:49 +0200
Message-ID: <97807a2d-ccf2-1fbf-06f7-085bb1bdf451@web.de>
Date: Tue, 23 May 2023 19:34:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zheng Wang <zyytlz.wz@163.com>
References: <069f2f78-01f3-9476-d860-2b695c122649@gmx.de>
Subject: [PATCH 0/4] fbdev: imsttfb: Adjustments for two function
 implementations
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <069f2f78-01f3-9476-d860-2b695c122649@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Yfbik6BQpZ+MONAWALyDRbDEMSz810xElohRN9hj6/dJvWKt0ek
 myy0bwDc2Br9jy9e+jhvtZh+dCx8ZLtlWK+Po0sAZwqopg7oSXxjGG1ppRmSkfnae4MIRfq
 NX9VIwjZxuS02MPks3//BvrHIJ4veC8Hllm+gUmTozkI4ULYW9Pi5vzPDybfEjME6+4hp9U
 foFYhfPZCafuP1+JVxhUw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DBa4qva029E=;BWu4v7/2mzJkPrsye4yzrar5f2J
 b7ZVEd7+zBkliYkYQCCu7fyi6O8zlfkqP1Qpag3bJ9AhrwJIQoWuE1oxNDr/PmB0TYg3EYI0g
 xZJ3JJbpM8vorGqRehgARul4Nj0900oVc5VSUS+ZdIlPCf1RwBS7MeP9AjKNfTkaDwTLGZ/MG
 ybsLWVMZ6IiVagxnDk0yF/si+yXdXZQxyym7H1+AZzaV79NzXP+ArHsmTNbxI8xeFcjQYoKOa
 PlfeDq7yW0P8sxxU4CU7UNWKmXBfPRoZqRopfqWbcf3FvG7r3tU/KehGR2mqbDEVRXwQhoDJd
 Nq8wuDv7HWMvsd7Zzlttq1mW2QyV6PDqgNQdM+/2R+kmtCJ9Bcr/iIpT/h3qKpJl2R4W6ORo5
 96bmcFeImWifdY3GKYdP9hLBAs0iJL84zg43pDjw74X3qEvRbjwL2l7+80YwqAZQuJXicIED4
 XoP4MQYX+uU7ogDIjKmN5DfdY2tv5SP1zGptXYTSofopqchH3YolhfQavoRKPBFQIhyeJLHHt
 /HktOx63U5RAho04kiOasHd7MGsPgFUc7LHc+anqTuhaYwSdYLCifWPMgKCoe8IWFM2udPOo7
 3E0u0L/D9zEbHO+a34oABQfThL6CmZ5HHeQX+pr0GWiT7nQgqHjZGkOeSHbHlbkbUD2hEr3T6
 LITLOnIVvoW7faInlWMLu3QeNgD39IjJnKoRb1xLQ9f6ECeEpvpR0CsnI+C6JCnzwmWefzL56
 SBjwn0vdbn2XDsN4xATPZcK5koorfE7GsNkP1fre7F4lm2poSQUKJi8LtBYg0cu8aT6IOsJcH
 tmtVBlwTMns2fP6UouF+L2eX8uIZhw4FUfh+mqZ1BvPuxlUreYyQeY38YQ0JksJsEoyJrxA5u
 IVGE6yV/vYxY0u65GY4gorWUS9PSmiCeg86SABFiZUaCbelC9pdLWcH9cBJo2slDvHL8wv10t
 V3IzWg==
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
Cc: 1395428693sheep@gmail.com, hackerzheng666@gmail.com,
 LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr, alex000young@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2023 19:07:19 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Fix error handling in init_imstt()
  Fix exception handling in imsttfb_probe()
  Move a variable assignment for an error code in imsttfb_probe()
  Improve a size determination in imsttfb_probe()

 drivers/video/fbdev/imsttfb.c | 56 ++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 20 deletions(-)

=2D-
2.40.1


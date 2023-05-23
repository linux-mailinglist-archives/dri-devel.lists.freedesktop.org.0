Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A2F70E2D8
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 19:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8ECA10E491;
	Tue, 23 May 2023 17:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DCF10E491
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 17:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1684863744; i=markus.elfring@web.de;
 bh=lKBfTptu9Yk0RQSj++IPm6JAi+bwbGuVxyt0o9ceU4k=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=lgZTLp8kl9zRaRvchrcTf3KHvKGb4a400uR4X10G81FxNZVvc8kMFT7gi+zx+oaXS
 wu+qHUUzkchh1vo3+IW1992v1jvYXzd6ZBs3h99uXoZPncVgvkpc8P3/Ntgi2ITIDz
 LU6b2y/tWqpdTsxnzFD/OgtN2Q5X9WwejL0oU1yzBpkIhWSHT2kU2y/aZw+6lBjgsB
 JjFYge+R8Cl193g8RPQbId50ZMMptHHIXYhpF6snf71ItPSsPBZGqNgcdUhk5+bT8e
 rahZAVr/nZMbsb6ivk5NVTr6pbDorudLc969YFaKEvE/JwrbPbrRuLRyTomGuUB53M
 tptkR0Jax09Ng==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWQud-1pe0i31eOJ-00Xctg; Tue, 23
 May 2023 19:42:24 +0200
Message-ID: <38cd2e4b-3df4-6c69-b790-5762d24e2c29@web.de>
Date: Tue, 23 May 2023 19:42:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH 3/4] fbdev: imsttfb: Move a variable assignment for an error
 code in imsttfb_probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zheng Wang <zyytlz.wz@163.com>
References: <069f2f78-01f3-9476-d860-2b695c122649@gmx.de>
 <97807a2d-ccf2-1fbf-06f7-085bb1bdf451@web.de>
In-Reply-To: <97807a2d-ccf2-1fbf-06f7-085bb1bdf451@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cIiD/3rphgcPVqhe67vJf8y6VoJI/n/QR2GFc1c9K5abaHhowmJ
 sppU53ZnhqnqHBkTPjF/q/4Ma9/csQfLzdkPCs/4SbAPjEMIoxSi95YlYv+xy0yUccc00c+
 b7BVJsnZ2AlwU3MSGnPD5w6ySQOZueGp+1Tz/ewlnJuydCQJformWJA1m66VEsM3w2lgm3X
 vnnVCZFZWpIFOfoPxm4QQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YwI6WV7bh40=;7PZ1ie+t6oU9R9z/HAP67KK71vU
 Hc/pMcNxMuEcHbx1sM9IBfF3GFAlnxjNN3sKX9BKRWrTpwtrnjJxiWj12q33yMP/dZp1YWQGM
 JROTGmn/heJzzh9R3ocYQPJmROQjKPLaYlCT7wapaYOQ/oimg92dZgjhBGqiMUgGDCqxbbbLy
 d14G8D1c7G8+LXmyrsteArat/BV9id5N1UfNt++fGojuIw3phOoftmFSokj3rFXHApFntb7rB
 OdF9Kv/mIUWUtixDhekHM7U+Slhq0MhtOFwnpiSUzfwLTF7CpYqnJLPcmyFhGUZFrdGTcKyyr
 zbVxIuBwOF05eo1x3NRBTRqBkXVcqpukRlB2fEvdDAci376bKNWCoV1t8pOLNIoUtHtLfdN18
 QjiJ6rBvOyGmOvxabivF7TKrUjYce4k3KxSYgjPvVJCYcdo0kmdACvw7YjYxHUbqEnj3FBTwQ
 On3nBolXVJgbc5f9HTyba3xLkaoqPYqvcN5gnGxOfGDT335wKt8XSqx68FRl39emppg960p45
 ElEGl2BE1+7W/JQWnr+2Bn7sslboiPVfR2YGvtsZFykvkD+KSidQA1DLYzBgbMSP9ILX3fNHt
 iY6BnbebQWsBvqhyTI8eKJZB7mG5bdbtwIyrSypQCJu6X4gKZOW8K/fRZJ3XCs3YxLWjVtAI4
 8LTcp6yQ8fZ5JeS6+PDZK/bKR6GAI/pLWUzzWB77nwHCTs8w/WGgGHmkwT3PPiJe7Xa7nGV9k
 VkijTVNOKsMUEzCr3G+R74jgFBJtrrOmeIa247Ck057XjQXQk90HxGEfSPlY5vXpmHCvkhirk
 KZs3L869sKJRGGSpMPfx0URvU31UccZJWMwULbRFospEpqW2OPqb5ewgftqOHKW/eZWQ+AIeQ
 iNQWLZjc5gA5fgHajmAV6xdsKf4hyCe6Dg7emJJpjfoSoW0QPlf2Ai+Otl9ezMyQPy6nooY29
 4j1HOA==
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
Date: Tue, 23 May 2023 18:30:26 +0200

The value =E2=80=9C-ENOMEM=E2=80=9D was assigned to the variable =E2=80=9C=
ret=E2=80=9D
at the beginning.
Move this statement directly before the first ioremap() call.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/video/fbdev/imsttfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index 6490f544f8eb..90c72428e8d7 100644
=2D-- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1484,7 +1484,6 @@ static int imsttfb_probe(struct pci_dev *pdev, const=
 struct pci_device_id *ent)
 	ret =3D aperture_remove_conflicting_pci_devices(pdev, "imsttfb");
 	if (ret)
 		return ret;
-	ret =3D -ENOMEM;

 	dp =3D pci_device_to_OF_node(pdev);
 	if(dp)
@@ -1525,6 +1524,7 @@ static int imsttfb_probe(struct pci_dev *pdev, const=
 struct pci_device_id *ent)
 	}

 	info->fix.smem_start =3D addr;
+	ret =3D -ENOMEM;
 	info->screen_base =3D (__u8 *)ioremap(addr, par->ramdac =3D=3D IBM ?
 					    0x400000 : 0x800000);
 	if (!info->screen_base)
=2D-
2.40.1


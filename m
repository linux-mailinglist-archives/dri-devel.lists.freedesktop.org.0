Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA2C1BBE18
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A529B6E3D8;
	Tue, 28 Apr 2020 12:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3516E0E8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1587976569;
 bh=s/tAtys+eztFEfxlNS2hN3NLFPw8kpgcny2dkub47zQ=;
 h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
 b=Ge1n7HvdOTPuWACR57IdP1i//roAhCBBJOq3GV00TPoA7aJ5oipMm2d6VHLkN0Dg4
 sDWclVE5i3XXoRlTlkRUNMgPTlVuHgqxRS5Uiru+pc2310jnROdnYpJNT7rbG5/6dT
 GMZT9GtLlVjyFURbzuJz3tGDCPLZkPUL/0RsiGuY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.190.48]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lu4uA-1j0uXH0vSw-011OLO; Mon, 27
 Apr 2020 10:36:09 +0200
Subject: Re: [PATCH] drivers/video: cleanup coding style in video a bit
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To: Bernard Zhao <bernard@vivo.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Message-ID: <9ffb6645-5802-3163-2107-435392a777f6@web.de>
Date: Mon, 27 Apr 2020 10:36:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:Tm/WLiArMSAcc240FtcTgGfiSo8WShdR0q9BrpepCzYrsfmLmUN
 X7bOEqYUn83mdu+JCLCKwq7Jht4juKifkcE0cU0w8pF9HsQ6Lct5UShC8an+jUOAmGCNQVT
 60QNZtOVjUUE1fFf5Uhr3jdKEvaJ6uxkLiTjT4+q9VrOtR81uz/vlP2dl3QipqQ2pCc9hbA
 oqpyvvYoM1AZI3pPqC7sg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:m/Yq0fm1/64=:ERBg3z99BlmrUxekshVz0A
 K1DVkI0C4rboJVIUuGg5coXDgz8YdtwDxoygwH6gljNp4VDFzzVWrHNTG8SyiNmPxQl3ysQ6q
 ZckvttSmBzBxEFpCV1RKG2lQiLjMh+5XzcPruIDmgM4v2mce+7TQpxKYCteFDGGf893JvcdIt
 i14StQbNOLiQkKK/hD14TVWLb51Lhbd7S1pUAhU5uTbUnnMx5iY1mXJEd7+Mrh2dOd4YTseoa
 vUI4tpA8ilPBlO/BmxHN55IKYYSdK5QECoDqoIJDyddrLSzi5HNOzsL06JQquqG8zosDfxQI3
 nViJk23RRP5iwgU6QDrKzupXP/iAuuj3KkWAvJXgKLXFFhnXuHW8Erv3APeDGhQNSv4JV7fJs
 FiV6Kts+ZLka9biLf2k66odpMo6+Rxe0NyNKDUxXS5LimzGvXaGlYV5oa2ENiBftxL3vgVAbk
 M2oga3RxZG/lk4DuePVrNRMxLss0CMabkeGM4KDjr6vY5Oj4z6pVl3NZ2eqyK6Q6WJ+/gPPfT
 OEh7hPJrupBZ2G0eJTe+oo4J1IWtadj1v2AQQ+KCkBNdRmpn8YCUObVfnx1ePXHlKH+e9pm2t
 s7mQIq/Zkb6zcQNHsuR7vEunAC8xfrS4b/jhgoaFkXkrlQk0XOnxFQ2cjd7ZPotNy74QcPphF
 xzVteH2arkXCA1Z/gzUUl3IQzYnQjd9e7n/ia/7DJjmFAR39gndm3UpPOdrnrAHOEZB4ILRuN
 HLYLvUU/9r/Th7GefF8FCnUhF7y+JqW+1XyaovHwldB5nWdhlbxq5REgsrDhjaj5Z+WGO8mx1
 DLXOf7CJljmxYILBZe+nnuq7/4EG0rUEnK2XA8fQ4QeOn9SCZ+qGj+JnqOGbt51LI6lzAZz2p
 FVldcm0HJt1ZrkFotA3CD0gO+MS43lLlACeFLEaOJ7xU5Dv7IXkngr3xqO9B04iKg7KevruhK
 GmGsntzJ9gZWe7tRyw6IZmIc9sTBUEZDHhqYIW/izxti7BXtp5QGwt7xytaJ7HrpJ1wIURtoK
 X4MIVMSTaKbXYmbdej9MmBNVCWK4ku9hoAROSD6DugXSFIJ6qM966ej7B9lowXyKnC0W1QeZm
 zifsyIM1GBXEqu2TT8Ca4Y7ZUZCtMZxqnIaOaK40HGgh9aRGPrgw6txrtCDcJcgYMq7LLqrC1
 9261LB+NV5Plb7sLLd2kjTyZJfMAV4bpYKm+27cWeWVl99OhSldQYDobGpAs5/bZlLDdS+BlG
 5/MKKHhHem8MqbS9h
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: opensource.kernel@vivo.com,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Uma Shankar <uma.shankar@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shashank Sharma <shashank.sharma@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBFbGltaW5hdGUgdGhlIG1hZ2ljIG51bWJlcnMsIGFkZCB2ZW5kZXIgaW5mb2ZyYW1lIHNpemUg
bWFjcm8KPiBsaWtlIG90aGVyIGhkbWkgbW9kdWxlcy4KCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQg
YSB3b3JkaW5nIHZhcmlhbnQgbGlrZSB0aGUgZm9sbG93aW5nPwoKICAgU3ViamVjdDoKICAgW1BB
VENIIHYyXSB2aWRlby9oZG1pOiBVc2Ug4oCcSERNSV9WRU5ET1JfSU5GT0ZSQU1FX1NJWkXigJ0g
aW4gaGRtaV92ZW5kb3JfaW5mb2ZyYW1lX2luaXQoKQoKICAgQ2hhbmdlIGRlc2NyaXB0aW9uOgog
ICBBZGp1c3QgdGhlIHVzYWdlIG9mIGEg4oCcbWFnaWPigJ0gbnVtYmVyIGhlcmUgYnkgYWRkaW5n
IGEgbWFjcm8gZm9yCiAgIHRoZSB2ZW5kb3IgaW5mbyBmcmFtZSBzaXplIChzaW1pbGFyIHRvIG90
aGVyIHZpZGVvIG1vZHVsZXMpLgoKClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8583653DF05
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 01:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6FA11ADF0;
	Sun,  5 Jun 2022 23:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB9E11ADF0
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 23:57:29 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.155]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MryGj-1nS1Pp1O9l-00nvpx; Mon, 06 Jun 2022 01:57:20 +0200
Message-ID: <3f2b686d-f92d-5cb5-1cd3-07f4e3d6df94@i2se.com>
Date: Mon, 6 Jun 2022 01:57:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Peter Mattern <pmattern@arcor.de>
From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: drm/vc4: module dysfunctional on Raspberry Pi 3B as of 5.18.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:HLDc28bkKiq5K7HhY3atyVW1GKaWXUY70YoLFcchrq6ZHcCK9X3
 VbRUQlQOzP9Wc2cOOuoYZ8cE6K5oAPArwckngh8fa4ZifjXXORToXb3FUjU6KcH+9mQSNRv
 cMpT1NZKgbm96/wb331+JKEKLJtYPlD4IEE65S4NvO2hLwKnjgFriA0RiA5VRu387/Kjdyb
 QnBG/baYKglFgHAj815pg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UmJ43Ns0SNw=:Sibl/Lg/8Thuxf8q23Ckg+
 3yP4kGom88tg6Z3SYR1LumAsj806lZV5282mQ1o/CspIdsxNBxkGLoL7WBIikRrMenBsuSDk8
 7J7AmgjuHWJovD0q5FX8tFi8WVnFEW/wSUKHqOtoLfd6vUlgH08AtbLarEMW6eR0dn8UM/1bK
 0UZX/VFue81q8/jYcSRGY6pEBpPBmTGS7fZi/gWb51muhviVBdPELt6uXzq801u++dgSfjTmP
 odKOtBWnQCbNpNMiVkR/WN6A3qa9Og+WV8EXeZ9WnQHKdLpqtk4yiFJ+JVX+PYxwJ7liAviqz
 tTxSj3vXB1yROMGcZpSncvDoFwWYVWuUTnhla52K8uZ0Ub4Cueq6JQLGPjDIdMYv29I0XOXDB
 0k9o6ebVIS+1ltuYQm42IhITVyO5G9aCdYfNM0GDc4cobAEwNJUhNQL+PblY/h/rHh5fVtCT/
 atUD4W6VQbPsKhai93Jx3esKHD/m83Tdxy0v4gY80TeAThfwIiW/l/sX6BbXdlpft7s3p5zcg
 iE7VvkW4xz6nYAXH2k9S7g5wMs5LLR9GZq6aaPAUJKUuDqbKcsEdJTLq5wIKqkYf+BkUrnQi/
 4sAruskKR6yUJBwxZLJhN9NqMrv/fm0RgYllr8uO3ypJ9sX/LzPfXfGPlY2Yl1rujli7eNPdp
 OiujXpwBQl7Imgomx19Nzw7uHcSQEYWnHLBuzvpmNbluP7+tW81gMacrQWrP2xpJlVxLxsVV0
 h81xHQW59SSvGJxtEgDbz9DjLg3rcFhJsWHXIsUiFjR0dtf/vh33+Z6uxyk=
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
Cc: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Peter,

i didn't subscribe to dri-devel, but i noticed your bug report.

Could you please provide more information:

Which kernel config do you use (is it a defconfig)?
Do you use the mainline device tree blob or the Raspberry Pi DTB?
Please provide the version/date of the GPU firmware?
Do you have any KMS related setting in the config.txt?
Can you provide a full dmesg for the bad case?

Best regards


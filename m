Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 262954B3A6E
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 10:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF28510F3B8;
	Sun, 13 Feb 2022 09:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 910 seconds by postgrey-1.36 at gabe;
 Sat, 12 Feb 2022 02:45:15 UTC
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by gabe.freedesktop.org (Postfix) with ESMTP id A62B110EB98
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 02:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:From:Subject; bh=hnD6/
 MAj8dW+YkPvw4z+qYD8VxUZ1mt7MjT1Dw6did4=; b=iD+2qv9JC7RSbzjac3GYo
 0wib5N9B6lJk8Rdf2OZXIxyIeJF6FZ7V9eW2oYHizfQN1Oalpb/f8/0ZI5JIQNXM
 +kmEsZegagb0Xh/0D5+vyjOB3uktQyz753hIf+5ysCMrmQvjffH3/k0amLnyRdtW
 iSjjLjpBdAN6IcPn5j4fRs=
Received: from [192.168.3.109] (unknown [218.201.129.19])
 by smtp7 (Coremail) with SMTP id C8CowAC37hqpGwdifV9fCg--.37742S2;
 Sat, 12 Feb 2022 10:30:02 +0800 (CST)
Message-ID: <11b64eb6-d0bb-6cfb-776f-5e6623dd984e@163.com>
Date: Sat, 12 Feb 2022 10:29:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
From: qianfan <qianfanguijin@163.com>
Subject: fbtft gpio backlight
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: C8CowAC37hqpGwdifV9fCg--.37742S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUoWlvUUUUU
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbB2AKl7WBHIrLMcgAAsb
X-Mailman-Approved-At: Sun, 13 Feb 2022 09:00:38 +0000
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

Hi:

fbtft_register_backlight assume backlight is off, get polarity from 
current state of pin. but the led gpio is requested by GPIOD_OUT_LOW 
flag, which means the gpio state when fbtft_register_backlight is always 
low.

Is it a bug?

Thanks


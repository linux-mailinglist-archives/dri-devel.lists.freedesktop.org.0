Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BC37564F5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 15:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6126D10E254;
	Mon, 17 Jul 2023 13:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2C4BB10E253
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 13:28:39 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Dx_+sEQrVkY_MFAA--.14767S3;
 Mon, 17 Jul 2023 21:28:36 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxWM3yQbVkiocxAA--.7283S3; 
 Mon, 17 Jul 2023 21:28:35 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------ddngy1F05fABszs8vR3Im0O4"
Message-ID: <8a329c90-140b-f7a1-3715-6ac826e2ff49@loongson.cn>
Date: Mon, 17 Jul 2023 21:28:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/6] PCI/VGA: Deal with PCI VGA compatible devices only
Content-Language: en-US
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas
 <bhelgaas@google.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230711134354.755966-1-sui.jingfeng@linux.dev>
 <20230711134354.755966-3-sui.jingfeng@linux.dev>
 <6b4ff3d5-293e-7bf3-f5df-babc14661c44@loongson.cn>
 <ddd6430c-86c1-7aae-fd46-0f33399e0067@linux.dev>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <ddd6430c-86c1-7aae-fd46-0f33399e0067@linux.dev>
X-CM-TRANSID: AQAAf8CxWM3yQbVkiocxAA--.7283S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJUUUBSb4IE77IF
 4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4
 kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8I
 cVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87
 Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkE
 cVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1lYx0E2Ix0cI8IcVAFwI0_JF
 0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxG
 rwCjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwI
 xGrwCF54CYxVAaw2AFwI0_Jrv_JF1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAF
 wI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
 AF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
 IxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
 CI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
 WIevJa73UjIFyTuYvjxU7ZXoUUUUU
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
Cc: loongson-kernel@lists.loongnix.cn, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------ddngy1F05fABszs8vR3Im0O4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2023/7/17 21:17, Sui Jingfeng wrote:
> So without we can craft something new easily without significant change.

Therefore, We can *NOT* craft something new easily without significant 
change.

Especially userspace changes.

So my current patch choose to keep the original behavior.

At the same time, it optimize and cleanup the vgaarb.c a lot.

Thanks.

--------------ddngy1F05fABszs8vR3Im0O4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/7/17 21:17, Sui Jingfeng wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ddd6430c-86c1-7aae-fd46-0f33399e0067@linux.dev">
      <pre id="b">So without we can craft something new easily without significant change.</pre>
    </blockquote>
    <p>Therefore, We can *NOT* craft something new easily without
      significant change.</p>
    <p>Especially userspace changes.<br>
    </p>
    <p>So my current patch choose to keep the original behavior.</p>
    <p>At the same time, it optimize and cleanup the vgaarb.c a lot.</p>
    <p>Thanks.<br>
    </p>
  </body>
</html>

--------------ddngy1F05fABszs8vR3Im0O4--


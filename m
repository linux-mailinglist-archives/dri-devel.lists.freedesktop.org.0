Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CA873AEBB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 04:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF0C10E0AA;
	Fri, 23 Jun 2023 02:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 553 seconds by postgrey-1.36 at gabe;
 Fri, 23 Jun 2023 02:47:32 UTC
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3723E10E0AA
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 02:47:31 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230623023814epoutp04de23b5e1a8ba5f9c4269bb23c7b70169~rKUzACAwl2733127331epoutp04l
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 02:38:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230623023814epoutp04de23b5e1a8ba5f9c4269bb23c7b70169~rKUzACAwl2733127331epoutp04l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1687487895;
 bh=t6bz5/WMl+attlJ8z2J/K3Hx7jIpIjvIzKJ3RR2SDbc=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=LXyI+CEWeH68zyeJsJcUCOtmt82JvmyAUdIbvCbGPVUELhVJ+dMRDC5IW1hqFePti
 bslzr0W/oqstEBjyTsTKSLD6gB0TWwxUeDUQZMdfFYod76ly4zeOO5qVpm7uCb+nZK
 /n/zYLK80R/2aWeM2ECRCQmu2Y/fjAgbf5wO2Ad4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20230623023814epcas1p4cb284261016d405ad44336e518892860~rKUyWjCIR1742617426epcas1p4X;
 Fri, 23 Jun 2023 02:38:14 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.36.134]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4QnLyF2JmYz4x9Q0; Fri, 23 Jun
 2023 02:38:13 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 70.F9.27561.59505946; Fri, 23 Jun 2023 11:38:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230623023812epcas1p13b3db03a36582821bfdf72870e47f5ce~rKUw-TnNm0338703387epcas1p1v;
 Fri, 23 Jun 2023 02:38:12 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230623023812epsmtrp2c8c5af59f24308e920e343fce4e34f4d~rKUw9plJ92501025010epsmtrp2X;
 Fri, 23 Jun 2023 02:38:12 +0000 (GMT)
X-AuditID: b6c32a37-f96e8a8000006ba9-eb-64950595f04f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 25.55.30535.49505946; Fri, 23 Jun 2023 11:38:12 +0900 (KST)
Received: from hoegeunkwon02 (unknown [10.113.111.147]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230623023812epsmtip27867c91e630842aff751872889868b60~rKUwlTJ562584825848epsmtip2U;
 Fri, 23 Jun 2023 02:38:12 +0000 (GMT)
From: "Hoegeun Kwon" <hoegeun.kwon@samsung.com>
To: "'Keith Zhao'" <keith.zhao@starfivetech.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
In-Reply-To: <20230602074043.33872-10-keith.zhao@starfivetech.com>
Subject: RE: [PATCH 9/9] drm/verisilicon: Add starfive hdmi driver
Date: Fri, 23 Jun 2023 11:38:12 +0900
Message-ID: <003a01d9a57b$c140f340$43c2d9c0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQHK7J7EDNi28QL/fafUThSYAJZYqAE+oOKkAhkAlx6vmlxLAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02TeUyTZxzH9/R9+7Zgyl6gjmeIW/fGseDkKOfDBLMoyis7JOD+cIuyjr7c
 lNoWAy6TRpFwlMtj2IoBDM6kY0O5xjlnIdyiQTcCqAhlCAv3NVwZWcvLNv77/L7P737y42N2
 JTxHfqxMxShkkgSKsMbrWl1cXa9yr0o9jGM2qC4zANWadDxUrD+MZkaauKiipY+DStr6uOjJ
 yhyB5m5nE6grPRNH35vKcGS8RqDxCi1AeZOjGFp+MspBjxuLCaS5U8tFdUvpBMrMV3PR1GMN
 hjJ0r6OLLW08NFnjgArvjxGo+9kSD9VMF3I/fJO+2P83QU9PTeF0k3EOp1szl3l0Zt4GThs1
 vQRdpc8i6Ke/NRP0SE4Hh64uT6OHN4wYnVejB3T/hQEePfxAQFf3fE0vVb0VSn4eHxDDSKSM
 QsTIIpOksbLoQOqj8IhDET6+HmJXsT/yo0QySSITSAV9HOp6JDbBvA9KdEaSkGyWQiVKJeV+
 IECRlKxiRDFJSlUgxcilCXIfuZtSkqhMlkW7yRjVB2IPD08fs+OX8TE5/THy7j0pa/1VuBos
 784GVnxIesOKhWFONrDm25H1AC5qftwyFgEsGP0LY41VAG/M5HOzAX8zRNsQyOotAG4MFAHW
 mAZw/aGJsOQlSHdYUdnHtTwISROAjet5m14YeY2A49MG3JLKijwIO1+GWdDejD1ruyyxOPku
 bOsycS0sIP1h83A9wbIt7NKO4xbGyLfhTzPFGDuDCL76/Tsuqwvh9ayMTV1oTjmZM4RbykJy
 zApmNeQSbEAQ7Bno4bJsD//oqOGx7AiXZlu2fOLh886BLVbBF12vAMte8N6tyxxLzxjpAisb
 3Vn5HdhgugHYHmzg7Ipma1kCmJlhx7o4wwn1L1tVnWB37m1OAaB02ybTbZtMt20a3f/FSgGu
 B28wcmViNKMUy73+++vIpMQqsHkpe/3qwbcz824GwOEDA4B8jBIKdlddktoJpJLUs4wiKUKR
 nMAoDcDHvOtCzHFnZJL51GSqCLG3v4e3r6eXNxL7iikHwdBErtSOjJaomHiGkTOKf+M4fCtH
 NeeC5qzn8zPR5cXyS25x5I6M9pcnonYFaI6cbnMRGd8bPHrI+e7so+tR5KhR2G644nTOb3+J
 ZqdN9BAtTu/tSHk/7qGupKyrs3dPaWpIs/v0n2mhrx2fwniqYOHlu7H7Kmc/KVcVjvh+4xK2
 r+jXsmDn8FMxacfS2w/6Op2sHSxUl5GiQBd9XZrHyYnzD3R38JJ7/abwuOPqCr3R69T+1dim
 WylDAUencoNu7pB3hK2lEucPnBONrM+X/Vx+ulLwwpBavHJsvKh6dLF1cL5TmxJy/7OFDWvP
 w8OPhqpuZlCrtp4LISe0rt7DpfbqqB9ic/ILEpje4E+fUbZfaUtr855+4TAxT+HKGIl4L6ZQ
 Sv4BzpYLR7IEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleLIzCtJLcpLzFFi42LZdlhJXncK69QUgxmH1S22ddhYbP09i91i
 zipXi7f3d7NarNl7jsli/pFzrBZXvr5ns3i/vIvN4mRLB4vF6t8LWSwez2CzeLJmJqNF34uH
 zBZfrjxksri8aw6bRc+GrawW2z63sFl09DewWry83MNs0TaL36J17xF2ixdbxC0mHnzEZnHq
 7md2iy1vJrI6SHq0XvrL5vHm5UsWj92P37N4HO74wu7R0fePxeNxzxk2j02rOtk87lzbw+Zx
 v/s4k8fmJfUet/89Zvbo27KK0eNS83V2j9tneT02n672+LxJLkAgissmJTUnsyy1SN8ugSuj
 +1JGwSmVih+XNrE0MH6R7WLk4JAQMJGYudO2i5GLQ0hgN6PElqObmboYOYHiMhKr+rewQtQI
 Sxw+XAxR84pRonPxDUaQGjYBfYk168+xgtgiAo1MEpumVYAUMQssYZM4cv0wE0THCUaJg9/u
 M4NM4hRwkjjxPAjEFAYyT/+QBullEVCVOHLyN9gcXgFLiT23d7BB2IISJ2c+YQGxmQX0JNav
 n8MIYctLbH87hxniTgWJn0+XsULERSRmd7YxQ9zjJPGi+xbLBEbhWUhGzUIyahaSUbOQtC9g
 ZFnFKJlaUJybnltsWGCUl1quV5yYW1yal66XnJ+7iRGcWrS0djDuWfVB7xAjEwfjIUYJDmYl
 EV7ZTZNShHhTEiurUovy44tKc1KLDzFKc7AoifN+e92bIiSQnliSmp2aWpBaBJNl4uCUamDK
 e95waAvbRuVGUancplrtjAtGUxbePzd75d39IpP1XE4mSDD9XBlwYu+S5IZPHcUa23qK370P
 kL0v76J54t3dc/9m/P9j+lU/p2dBsMIKIYflG5hlzRmvF54vW7JJbY5tcneuhN/UvRpLbrf9
 6GjzCE9+88v+uqVNWrFMlGS4/EJ/4er/K16/u/X4ro61NNPDGVPlW0wEl8V/36XDb7XARvey
 +56j0luCV2rI2R/8u/Bts9YMFb3+ktDbOjcMnqYvfDnDN/7O7bjQy/YO0wRsvkzKl3Hxu7q1
 RvhuDLvms0OPjKbPiTz6a/dmMSHJQq5teiq+z73tJqdnbOQ9WGXnJC11JngXG8/bfY+eP4pT
 YinOSDTUYi4qTgQAsXTsDpwDAAA=
X-CMS-MailID: 20230623023812epcas1p13b3db03a36582821bfdf72870e47f5ce
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230602081437epcas1p36b7961b1d3f01dbed3fe2672a92e9d92
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <CGME20230602081437epcas1p36b7961b1d3f01dbed3fe2672a92e9d92@epcas1p3.samsung.com>
 <20230602074043.33872-10-keith.zhao@starfivetech.com>
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
Cc: 'Conor Dooley' <conor+dt@kernel.org>, 'Albert Ou' <aou@eecs.berkeley.edu>,
 'Emil Renner Berthing' <kernel@esmil.dk>, christian.koenig@amd.com,
 'Thomas Zimmermann' <tzimmermann@suse.de>,
 'Bjorn Andersson' <andersson@kernel.org>,
 'Chris	Morgan' <macromorgan@hotmail.com>, hoegeun.kwon@samsung.com,
 'Changhuang Liang' <changhuang.liang@starfivetech.com>,
 'Jagan Teki' <jagan@edgeble.ai>, 'Jack Zhu' <jack.zhu@starfivetech.com>,
 'Rob Herring' <robh+dt@kernel.org>, 'Palmer Dabbelt' <palmer@dabbelt.com>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>,
 'Paul Walmsley' <paul.walmsley@sifive.com>,
 'Shengyang	Chen' <shengyang.chen@starfivetech.com>,
 'Shawn Guo' <shawnguo@kernel.org>, 'Sumit Semwal' <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Keith,

There is a problem with stopping when changing modes.

Below test log

root:~> modetest -Mstarfive -c
Connectors:
id      encoder status          name            size (mm)       modes
encoders
116     115     connected       HDMI-A-1        320x180         51      115
  modes:
        index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot
  #0 1280x800 59.91 1280 1328 1360 1440 800 803 809 823 71000 flags: phsync,
pvsync; type: preferred, driver
  #1 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500 flags:
phsync, pvsync; type: driver
[...]

root:~> modetest -Mstarfive -s 116:#0 -v
setting mode 1280x800-59.91Hz on connectors 116, crtc 31
freq: 60.65Hz
freq: 59.91Hz
freq: 59.91Hz

root:~> modetest -Mstarfive -s 116:#1 -v
setting mode 1920x1080-60.00Hz on connectors 116, crtc 31
[   94.535626] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[   94.560985] rcu:     1-...0: (20 ticks this GP)
idle=c9bc/1/0x4000000000000000 softirq=3869/3871 fqs=1120
[   94.589532] rcu:     (detected by 3, t=5264 jiffies, g=4645, q=63
ncpus=4)
[   94.615335] Task dump for CPU 1:
[   94.637723] task:modetest        state:R  running task     stack:0
pid:407   ppid:397    flags:0x00000008
[   94.667299] Call Trace:
[   94.689297] [<ffffffff80d1e8fc>] __schedule+0x2a8/0xa52
[   94.714221] [<ffffffff80d1f100>] schedule+0x5a/0xdc
[   94.738626] [<ffffffff80d25a14>] schedule_timeout+0x220/0x2a6
[   94.763762] [<ffffffff80d2037a>] wait_for_completion+0xfe/0x126
[   94.789073] [<ffffffff8002ffe4>] kthread_flush_worker+0x82/0xa0


> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> Keith Zhao
> Sent: Friday, June 2, 2023 4:41 PM
> To: dri-devel@lists.freedesktop.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org; linux-
> media@vger.kernel.org; linaro-mm-sig@lists.linaro.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Sumit Semwal
> <sumit.semwal@linaro.org>; Emil Renner Berthing <kernel@esmil.dk>;
> Shengyang Chen <shengyang.chen@starfivetech.com>; Conor Dooley
> <conor+dt@kernel.org>; Albert Ou <aou@eecs.berkeley.edu>; Thomas
> Zimmermann <tzimmermann@suse.de>; Jagan Teki <jagan@edgeble.ai>; Rob
> Herring <robh+dt@kernel.org>; Chris Morgan <macromorgan@hotmail.com>; Paul
> Walmsley <paul.walmsley@sifive.com>; Keith Zhao
> <keith.zhao@starfivetech.com>; Bjorn Andersson <andersson@kernel.org>;
> Changhuang Liang <changhuang.liang@starfivetech.com>; Jack Zhu
> <jack.zhu@starfivetech.com>; Palmer Dabbelt <palmer@dabbelt.com>; Shawn
> Guo <shawnguo@kernel.org>; christian.koenig@amd.com
> Subject: [PATCH 9/9] drm/verisilicon: Add starfive hdmi driver
> 
> Add HDMI dirver for StarFive SoC JH7110.
> 
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  drivers/gpu/drm/verisilicon/Kconfig         |  11 +
>  drivers/gpu/drm/verisilicon/Makefile        |   1 +
>  drivers/gpu/drm/verisilicon/starfive_hdmi.c | 928 ++++++++++++++++++++
> drivers/gpu/drm/verisilicon/starfive_hdmi.h | 296 +++++++
>  drivers/gpu/drm/verisilicon/vs_drv.c        |   6 +
>  drivers/gpu/drm/verisilicon/vs_drv.h        |   4 +
>  6 files changed, 1246 insertions(+)
>  create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.c
>  create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.h

[...]

> diff --git a/drivers/gpu/drm/verisilicon/starfive_hdmi.c
> b/drivers/gpu/drm/verisilicon/starfive_hdmi.c
> new file mode 100644
> index 000000000000..128ecca03309
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/starfive_hdmi.c
> @@ -0,0 +1,928 @@

[...]

> +static int starfive_hdmi_setup(struct starfive_hdmi *hdmi,
> +			       struct drm_display_mode *mode) {

[...]

> +	return 0;
> +}
> +
> +static void starfive_hdmi_encoder_mode_set(struct drm_encoder *encoder,
> +					   struct drm_display_mode *mode,
> +					   struct drm_display_mode
*adj_mode) {
> +	struct starfive_hdmi *hdmi = encoder_to_hdmi(encoder);
> +
> +	starfive_hdmi_setup(hdmi, adj_mode);

When starfive_hdmi_setup runs here,
when changing the mode, a problem occurs because try to write a value to reg
in a state that is not resumed after suspend.

> +
> +	memcpy(&hdmi->previous_mode, adj_mode, sizeof(hdmi-
> >previous_mode)); }
> +
> +static void starfive_hdmi_encoder_enable(struct drm_encoder *encoder) {
> +	struct starfive_hdmi *hdmi = encoder_to_hdmi(encoder);
> +
> +	pm_runtime_get_sync(hdmi->dev);

So if move the call point of starfive_hdmi_setup here, it works normally.

> +}

Best regards,
Hoegeun



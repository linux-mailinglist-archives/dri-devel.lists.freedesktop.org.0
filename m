Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A32526EE81D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 21:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F0210E086;
	Tue, 25 Apr 2023 19:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6985910E086
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 19:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1682450268; i=deller@gmx.de;
 bh=YZTXGD6FzTSq+OduEPk9TQoYc+8PPyDXkEDQr097ZTY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=bZPLFsEGD3knDGOX+/wHedGvUIpGw6emBaHGKdfJcWiwVtOtsdRIiRCpN1rCwKTZh
 feh/x9d9Y0b4pIk/u3cRCYUXIM2PO2ejqhHStIuOD9PZ5ft33AymOWy0PXoBe5yctC
 cu8MpFAFJY3DEnb9caWOofUMhT5U+SgJJawFFIs6eS59d7iGK4OJtd348zsi0yHdF6
 qQGlHeNLiThXNQXH4ap1/tKLtrHiQ5AHlM+j8kh68RtAB7jNEtogCBrLoKN7K0Kjl2
 mxrY/UAsjCU6eTmbAZfUe1e/siBwbHP7QJzMmmMQnpwfZ2xZL3gWyZa76Oa+IOH1bB
 0cp8vCkXA7D3Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.147.194]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mof5H-1qbzOf0iCX-00p7k3; Tue, 25
 Apr 2023 21:17:48 +0200
Message-ID: <1231a974-a1d7-4226-c225-bc8ef2092d0f@gmx.de>
Date: Tue, 25 Apr 2023 21:17:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/6] drm,fbdev: Use fbdev's I/O helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
References: <20230425142846.730-1-tzimmermann@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230425142846.730-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9VLfaJAG6NWP/mvARw5exkEz6oRb75+oQe9tqtfVzgEnuX2HYdh
 mw8mL+3pyTLG8V16+7kMKXksFviOKPl0nk+xvOaUi2gObhHmebyY4hFM/jVi7ck32nYh1Dl
 kUyy1Ek9TLS267KJiqIHOYum1HQNI7Ox0H6Qid9XXcsSdH/ZE7004N/NVHTzj8vJDA08ObC
 OlkWrGHN6LME6H2K1zEMQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PeS6ZhxiAX0=;CkZ8QpZCnhW4ccnlH4tVo/5EhVC
 +7kSUt6q9CQA6SLkCQbwLbyCv9Vpy32bCQQSXs/L/MC6JkDY3CJlTRSE3fAO3yIAXc4IQbF0V
 x3r4fl4EB0KzdsiC5NQGlbo5BxqDNd1XmC8lez+6KUuTQi0neIY4H7gVwGKKOujM89pw5EOF7
 tSiG3tjTNEvwikeZ7ERbMzG7+69le8fOCH6/AB687CZoRKBBn3ynzlcfip4EOaXUrACUtPosJ
 +yUVDVnHCtsVdIzLhfPpWAWsWQZkOld+zx5lnh/oWLPjYuYpjYwzzNrqivyWJK+MAuEoB0R8W
 xX/SvgQK/351DNdRNu4TigwmWl6hzSUm98ErvfemFuGOKWdh98l/xweL7iWIzZYFHMZsjKxGQ
 fuJXaZ8YKS3qrsRPA1yb/sVTeqnfvChfPBt3UiNYxKdVTcFZZiaw34M61ItZ/+qMepp4l7+Zc
 v/HHyFMhiUSFw8b3tmuuZr2zdTE6pNOZ4kEN93omtqXhE2/YFA8NaS6zIZjMH8cihR9NT431l
 G0SWHqky/ZqGENPIZwp9zTBgq+CoO4KerO7tSHb30lFDQ2wx+5bMJY04cccnNBAf9hdbVzL03
 p83TscYCot/6AlvzXJNzz9mvETzVquQ6Oor0QckC/j8BmIjdoVv2ZuZgGK2pdfiEseKD50MyY
 UIvzvR4KML1y/k2Vm5WMIcoJxmRuXzEOD/MPOj4QkG0ucB0zpd03faAtLKy2wKkdp8VLFCPUy
 +pjlSLhmwPOqwYYrWqlL1wS/eFfr3nwHSSvSy+ZjX4rlK9Vw04Dg6xEK4vg4KV+NkuJm/eBba
 UJub07vckmLw18+Qw/8kdhPVP1se5WZzoDkxbFoZEXAdoPMNUICrs6nkI+AYmXfZ122b1wa+a
 WkuS6XiSCc51ChNHi12OXM1E6UQN4gxHIMpTDbVApoMzoKq17B0utCuqNvXuA/QOgt6SdyZCq
 bmiDY96Gz26u/siSHay5Y1GGGbw=
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/25/23 16:28, Thomas Zimmermann wrote:
> Make fbdev's built-in helpers for reading and writing I/O and system
> memory available to DRM. Replace DRM's internal helpers.
>
> The first patch resolves a bug that's been in the fbdev code for
> more than 15 years. Makes the read/write helpers work successfully
> with the IGT tests.
>
> Patches 2 to 4 streamline fbdev's file-I/O code and remove a few
> duplicate checks.
>
> Patch 5 moves the default-I/O code into the new helpers fb_cfb_read()
> and fb_cfb_write(); patch 6 uses them in DRM. This allows us to remove
> quite a bit of code from DRM's internal fbdev helpers.
>
> Tested with i915 and simpledrm.
>
> The next step here is to remove the drm_fb_helper_{cfb,sys}_*()
> entirely. They where mostly introduced because fbdev doesn't protect
> it's public interfaces with an CONFIG_FB preprocessor guards. But all
> of DRM driver's fbdev emulation won't be build without CONFIG_FB, so
> this is not an issue in practice. Removing the DRM wrappers will
> further simplify the DRM code.

This series does a very nice cleanup!

You may add:
Acked-by: Helge Deller <deller@gmx.de>

Thanks!
Helge

>
> Thomas Zimmermann (6):
>    fbdev: Return number of bytes read or written
>    fbdev: Use screen_buffer in fb_sys_{read,write}()
>    fbdev: Don't re-validate info->state in fb_ops implementations
>    fbdev: Validate info->screen_{base,buffer} in fb_ops implementations
>    fbdev: Move CFB read and write code into helper functions
>    drm/fb-helper: Use fb_{cfb,sys}_{read, write}()
>
>   drivers/gpu/drm/drm_fb_helper.c        | 174 +------------------------
>   drivers/video/fbdev/cobalt_lcdfb.c     |   6 +
>   drivers/video/fbdev/core/Makefile      |   2 +-
>   drivers/video/fbdev/core/fb_cfb_fops.c | 126 ++++++++++++++++++
>   drivers/video/fbdev/core/fb_sys_fops.c |  36 ++---
>   drivers/video/fbdev/core/fbmem.c       | 111 +---------------
>   drivers/video/fbdev/sm712fb.c          |  10 +-
>   include/linux/fb.h                     |  10 ++
>   8 files changed, 173 insertions(+), 302 deletions(-)
>   create mode 100644 drivers/video/fbdev/core/fb_cfb_fops.c
>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2965D7F8AB5
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 13:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BABA895EE;
	Sat, 25 Nov 2023 12:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C757C895EE
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 12:22:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1700914934; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=GQL7ywTel+nzsRDFW4JHygI05M178NNaqHk0W/JKtg5aViV7PwIsfwR9qp5YO9r+lv
 oJqEGnEJ85+ZfZ5OVB5dIR9GbAxr1LbmDTRFXNFFrAeZ6ivASOlqLE8aIEi4nIM7VRQx
 bnoOzQMsqtFaluOaQrRPrswJ0igQo7Suhbprs3imppstPdtIlJMdoDIpr2RYZYtQ8PE4
 2C+vhAEgzXwcchjwtLIbvM89jYHikCrNZItDKsiMl0DKYyVonM9KE8DJ4+zqRgEL5Rp+
 2kwg3Rqk+zf1AOUWKyMAgU2m04NCd7i800+D5DJ7CzqZMoJEGcv2NU8GrkglCQYLfpbQ
 KR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1700914934;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=3fZtsTQSV8kT7cZkiE/joYbwN8JR/QKtTngzzR42yPo=;
 b=MHEBAZHKXrtkbGgi6MVBMJ8J8bERYJZ67qs5+LeWHPdoxEJjOUxVGWKf8YrRsDXvk/
 8T04yM++QDq99/4DklF8RrjvStkHxN8NCnuxbcNa6kbQbH+cvnjDoPvGjZtfjepgLIVl
 56l5sztJEq22QfgnuOyhES5JuBtMWgVXro6fMm6mYbC+A1lZ+PAK4qdoSw9VKoZYaNLY
 tpJZhTdSYpaT7xLi4kweWSOgCOlg5XwldPN1AtwyWyRx+sVrC/FpMW26srlYTAKz8QUi
 1750dCR8HbC8Y5XGx6+Sz7XmE/TQB4ToF2HmSZkiXajzWzHWdoYqRz+wt6YDtBsqJ7rM
 YASA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1700914934;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=3fZtsTQSV8kT7cZkiE/joYbwN8JR/QKtTngzzR42yPo=;
 b=Muw2Qz4KzH03Vmzw+LfQB0IxkjgCNpx1aIYqekfuu/ocix4a8OxAQIJLXL4ddCpv+X
 WXEIDCNBnCLYQINX+PsFbi07EgQdLZpG0F1VZzbytqgne7Zrq4TKnCRXmOYKlDQu2mti
 b/LE7j4VB4//dpnsTh58mH+AYVFq2LxRW8eog6HjorMMmfIEZcEONedLGgGmZDDfvjHE
 MNyPufhkm0o87ZcQ8jy2K9MsDdaUZyf6fwEY/pB9jJhR31Pv3kHiHizK4B3V02K0ddsk
 eIz43cyJL/0QPgmMYSxA9ua6+5W6pmZyLOTegobOXLxwbBlVtXI9EyBRAfJAG0hA0PUK
 1Zsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1700914934;
 s=strato-dkim-0003; d=xenosoft.de;
 h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=3fZtsTQSV8kT7cZkiE/joYbwN8JR/QKtTngzzR42yPo=;
 b=DJFBJkKy1eS1IXVkgAlbM8B2kyxFO7ebFGSWVjrxTaeASXFFWeWgxpbn6/DSyrvxlI
 ZYzZIbo9bwbrX/riJTAA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfi4XXBswJY0hynIKqjaeYiGT1rE/QhtjOKJAIg=="
Received: from [IPV6:2a02:8109:8984:5d00:bc44:680c:952a:1673]
 by smtp.strato.de (RZmta 49.9.1 AUTH) with ESMTPSA id U060a4zAPCMDnqZ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 25 Nov 2023 13:22:13 +0100 (CET)
Message-ID: <9e8d2abd-94a1-4fb6-b30a-c6e4c52af011@xenosoft.de>
Date: Sat, 25 Nov 2023 13:22:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/virtio: Add suppport for non-native buffer formats
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <47a81d2e0e47b1715718779b6978a8b595cc7c5d.1700140609.git.geert@linux-m68k.org>
 <77c6gkquzq4sdtmrlko3lkxvcnipm2zfjem3kvhgslcellkefh@man7pbbzud47>
 <a9ade305-f90e-4250-a795-49ef4e29e0ac@xenosoft.de>
 <CAMuHMdXtUYJmEharJhBXx7D=fA3mQxg6uMP2=4Qgi==2a+kVQw@mail.gmail.com>
 <37b9e5ab-e170-4071-a912-f3fec0d59d5c@xenosoft.de>
 <ee75377ad22a3d07f272e17f53cabead7b43afcb.camel@physik.fu-berlin.de>
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <ee75377ad22a3d07f272e17f53cabead7b43afcb.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Vivier <lvivier@redhat.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 linux-kernel@vger.kernel.org, mad skateman <madskateman@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, linux-m68k@lists.linux-m68k.org,
 Christian Zigotzky <info@xenosoft.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25 November 2023 at 12:09 pm, John Paul Adrian Glaubitz wrote:
> On Sat, 2023-11-25 at 11:06 +0100, Christian Zigotzky wrote:
>> Could you please revert the v2 patch because of the issue with the
>> virtio-mouse-pci cursor? I will try to use the v1 patch for the RC3 of
>> kernel 6.7.
> I don't understand why the v2 patch should yield any different results as
> the only change compared to v1 is the fixed patch subject. There are no
> functional differences, I just diffed the patches against each other:
>
> --- geert-patch-v1.patch        2023-11-25 12:09:19.122936658 +0100
> +++ geert-patch-v2.patch        2023-11-25 12:09:36.313039085 +0100
> @@ -34,6 +34,9 @@
>   Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
>   Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>   ---
> +v2:
> +  - Fix truncated one-line summary.
> +---
>    drivers/gpu/drm/virtio/virtgpu_display.c | 11 +++++++++--
>    drivers/gpu/drm/virtio/virtgpu_plane.c   |  6 ++++--
>    2 files changed, 13 insertions(+), 4 deletions(-)
>
> Adrian
>
Hi Adrian,

Thank you for the hint. I think you are right. I use the the following 
patch.

--- a/drivers/gpu/drm/drm_client.c    2023-11-13 01:19:07.000000000 +0100
+++ b/drivers/gpu/drm/drm_client.c    2023-11-14 09:45:44.964199272 +0100
@@ -400,6 +400,16 @@ static int drm_client_buffer_addfb(struc

      fb_req.width = width;
      fb_req.height = height;
+           if 
(client->dev->mode_config.quirk_addfb_prefer_host_byte_order) {
+               if (format == DRM_FORMAT_XRGB8888)
+                       format = DRM_FORMAT_HOST_XRGB8888;
+               if (format == DRM_FORMAT_ARGB8888)
+                       format = DRM_FORMAT_HOST_ARGB8888;
+               if (format == DRM_FORMAT_RGB565)
+                       format = DRM_FORMAT_HOST_RGB565;
+               if (format == DRM_FORMAT_XRGB1555)
+                       format = DRM_FORMAT_HOST_XRGB1555;
+        }
      fb_req.pixel_format = format;
      fb_req.handles[0] = handle;
      fb_req.pitches[0] = buffer->pitch;

This patch solved the issue.

Christian

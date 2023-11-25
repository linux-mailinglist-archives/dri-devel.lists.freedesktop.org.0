Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5877F89E1
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 11:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1B210E15C;
	Sat, 25 Nov 2023 10:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264FC10E170
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 10:06:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1700906797; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=XNinLICU1K7MCbYNTs1mT1llCrKfO2gujtQ1R7N0JwFH3UDsbasdO9DoWmzNqgqAXD
 f0nQYqL8h9oXfGKBiJ9TOI4NGgdjMTSPXX/rMDCaBdo5997rAn1jE+UV3Yxl7ppJ0VKf
 b907vKF1Ws86xhphDdkpexUZGUhdALMalv577SxGTtPPOBnM8t4oZq6Koc0+SlJs3AxT
 YHVrZdQs/oXvjga8kwALiYv4DVktGMrsp1B6DdA49g+TpdDZ6wVhpfomjR2bNTzrZr9K
 wn7wzaq6548cOeRuRF/xWPOQ/C21OB6cW0qRcg9vfP6+mRUmphnaVd4zdI2rv0OqdCwe
 R60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1700906797;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=QJUXeT/G7oE/8Y0b39Zjpc2uXnqV72pbi/a6a1IQmzk=;
 b=G5b4/6ZAG4Dwc0aFPW2/AVb+0tt73qAwgMT6VaHuSjs8Vh6z4ZtVMYBfw89SjxlM1j
 EEzTY9FslyH1ljx+OMw59GczCtztMN/6GMYL/HbmwVrf3Lj4bodSbRT8Wg5eLs4ioB38
 +j2blh9a/ayCY1Dkoj7d0YinEPhwwiS+OxzByFWSNmWN2HXnIa1dZ3V1O/2r6X9MaJrc
 t12oEGdzBH0jZJgeTQQfzyMGyK748gK1c+pmZvBp10pR2BGtdhaAE4pZQYfW0tRDyYaL
 yZsdlBNGayw5UcKxvbeldIZlRFFYno+vSxR8xBdE/Ma1NiuFU52DsWTH+AGzN38FeH7t
 LNVg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1700906797;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=QJUXeT/G7oE/8Y0b39Zjpc2uXnqV72pbi/a6a1IQmzk=;
 b=FdX64lTng3LTaWf4XPfAjfd1TdbKv60M9Gs2ra/KrT3hTMf9C4t1T4dd7dIpTdaRDx
 HK/CUN9KM7EAI7E1pn5bp/7mNOpbAkP7P/uCmMWSJ6nIQ4l5j4XVUKY+7WfaOWFz/+oy
 QZsFp+hpe4xpLkZEoovPlt4RqRU6Guo1s7uxxy1hQDtUixA//ofjfHcn372CpsI/EVwc
 S892waIsyB9oK1MYCtpq93b1j4VUjoem40u9LegbF0OSu3PFYzooyQn6BDZ+137VggRG
 Ei47jhRocHknkGe0HqBRRmcU+p2gTsJ13jO0ecA2zodMs86Z5cb+hwNyWUIw8qixiFJU
 bVPA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1700906797;
 s=strato-dkim-0003; d=xenosoft.de;
 h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=QJUXeT/G7oE/8Y0b39Zjpc2uXnqV72pbi/a6a1IQmzk=;
 b=TIm1Lfc+h2PjpmWRcoxeMAC+lCs5+dzw4/1RvzuylweJEm1FmWWcZyTAfmi7CjkU1t
 Bp3AS1ewxD1h/zmuRTCA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfi4XXBswJY1ymSyVTj2wKONxQss4byztTU3log=="
Received: from [IPV6:2a02:8109:8984:5d00:1007:45f9:3fd1:2db6]
 by smtp.strato.de (RZmta 49.9.1 AUTH) with ESMTPSA id U060a4zAPA6anW8
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 25 Nov 2023 11:06:36 +0100 (CET)
Message-ID: <37b9e5ab-e170-4071-a912-f3fec0d59d5c@xenosoft.de>
Date: Sat, 25 Nov 2023 11:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/virtio: Add suppport for non-native buffer formats
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <47a81d2e0e47b1715718779b6978a8b595cc7c5d.1700140609.git.geert@linux-m68k.org>
 <77c6gkquzq4sdtmrlko3lkxvcnipm2zfjem3kvhgslcellkefh@man7pbbzud47>
 <a9ade305-f90e-4250-a795-49ef4e29e0ac@xenosoft.de>
 <CAMuHMdXtUYJmEharJhBXx7D=fA3mQxg6uMP2=4Qgi==2a+kVQw@mail.gmail.com>
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <CAMuHMdXtUYJmEharJhBXx7D=fA3mQxg6uMP2=4Qgi==2a+kVQw@mail.gmail.com>
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

On 19 November 2023 at 07:33 pm, Geert Uytterhoeven wrote:
> Hi Christian,
>
> On Sun, Nov 19, 2023 at 5:28 PM Christian Zigotzky
> <chzigotzky@xenosoft.de> wrote:
>> On 16 November 2023 at 03:44 pm, Gerd Hoffmann wrote:
>>> On Thu, Nov 16, 2023 at 02:16:54PM +0100, Geert Uytterhoeven wrote:
>>>> When using virtgpu on a big-endian machine, e.g. powerpc QEMU:
>>>>
>>>>       virtio-pci 0000:00:02.0: [drm] *ERROR* fbdev: Failed to setup generic emulation (ret=-2)
>>>>
>>>> or m68k/virt:
>>>>
>>>>       virtio-mmio virtio-mmio.125: [drm] *ERROR* fbdev: Failed to setup generic emulation (ret=-2)
>>>>
>>>> and the graphical display fails to come up.
>>>>
>>>> Before, the call to drm_mode_addfb() caused a translation from a fourcc
>>>> format (XR24) to a bpp/depth pair (32/24) to a potentially different fourcc
>>>> format (BX24 on big-endian), due to the quirk processing in
>>>> drm_driver_legacy_fb_format().  After, the original fourcc format (XR24)
>>>> is passed unmodified.
>>>>
>>>> However, the virtgpu DRM driver supports only a single format for its
>>>> main plane: DRM_FORMAT_HOST_XRGB8888, which is XR24 on little-endian,
>>>> and BX24 on big-endian.  I.e. on big-endian, virtgpu does not support
>>>> XR24, which is the default DRM format, and must be supported by all
>>>> drivers.  Before, this was reported, but didn't lead to a failure:
>>>>
>>>>       virtio-mmio virtio-mmio.125: [drm] bpp/depth value of 32/24 not supported
>>>>       virtio-mmio virtio-mmio.125: [drm] No compatible format found
>>>>
>>>> As the core virtgpu driver and device support both XR24 and BX24 on both
>>>> little-endian and big-endian just fine, fix this extending the list of
>>>> supported formats for main plane and cursor plane to XR24/BX24 resp.
>>>> AR24/BA24.
>>>>
>>>> Fixes: 6ae2ff23aa43a0c4 ("drm/client: Convert drm_client_buffer_addfb() to drm_mode_addfb2()")
>>>> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
>>>> Closes: https://lore.kernel.org/r/c47fba21-3ae9-4021-9f4a-09c2670ebdbc@xenosoft.de
>>>> Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
>>>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
>> The new patch works but I don't see the virtio-mouse-pci pointer
>> anymore. I see the pointer with -device usb-tablet. Please check the
>> second patch. I will use the first patch for the RC2 of kernel 6.7.
> That's probably partially explained by commit 99748ab64fcc8578 ("drm:
> virtio: fix virtio_gpu_cursor_formats"), which forced BA24 for the
> cursor plane on big-endian, but unfortunately linked thread doesn't
> contain the full picture.
>
> Where is the default cursor format defined?
> I see virtio_gpu_mode_dumb_create() still defaults to
> DRM_FORMAT_HOST_XRGB8888.  However, that can't be the cause, as the
> cursor formats require an alpha channel.
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
Hi Geert,

Could you please revert the v2 patch because of the issue with the 
virtio-mouse-pci cursor? I will try to use the v1 patch for the RC3 of 
kernel 6.7.

Thanks,
Christian

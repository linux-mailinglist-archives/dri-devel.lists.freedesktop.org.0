Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE087F8AD4
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 13:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A2A10E239;
	Sat, 25 Nov 2023 12:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40AB10E239
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 12:42:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1700915755; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=SFKxXYcw0DY3Pria634pawBeRWKRRXxfi3Y+vZy3WNv45FpWK/MWewg+Q9uDwBgqzI
 /enXQtyu8P0uCilVQzhbepudj37ZOQqPVn4cO1RFUpLOCKBnO1zvmQejji715ys188zj
 AjVvUpMyLetKI4UTsvbfe/i5IhLivgg44eJ674X2trdM8yjSHYYeoaBbZ4JxltAyqwKN
 r+erA/DaoJU1phKMA7mPq5RTonRAsnyHYtbte+vU+bpUqgfEPye1b7oMqioGbMC8ywii
 SRId6NU0uC0/5ZcBHzZ7eC0ZvWya/G8vErIwBg5aFCLZ3WUiMkvDkHdAVq7nN//76cet
 +IEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1700915755;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=p56uFgR+2L+joFqVsz4BnJljMfmRwlsgQch0B8qQcmg=;
 b=eFC0fcFKW3P+unvRT3QqxSRGvpZ9SH9UOuwCV+Rc6Va4K9TWHT20eVhsawLbSlIpbg
 hBl06jmhofsu3QD+zymhTfFk5BCj2v5yoN8COAmOMHILpObKwO6wpJX6Oi84LBxFiv4E
 91PHUaCKTdb69jrcuNI5M1DWfdQlDMqMezqT3NAfDH6iObt2ucLfwxDDlhvNwC5SUPOI
 ZaO79AQoYxorZMyW4umhQXXlGKDlrMRcL4p9gm0oRo3j0zI1rHX7V+eev/HEASrWF/2T
 0RqNQmiFPoxEG4xIKHiNMUCpwz1sK84/6Kie651p5gNJr5yzvypj8icmhQcQ4u0l++hr
 AUHg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1700915755;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=p56uFgR+2L+joFqVsz4BnJljMfmRwlsgQch0B8qQcmg=;
 b=dLAAAh8H4MwhFrYhPbikzmad1Zr2xapLpe8gQGIyVsZ2Arj6oelgy6usS7zAe05GZN
 q3HQNoQz4rkHUlz4EmW6Fi7VfzTLxqpdQ4LFXgnZ7CqaTVhNv2d6Ph22UaAYyy6PHxkQ
 A4AN9TrM5CmVA/Gk0xG2zPqmTKCJJDm9C2oAkUNJuL/KzARBwAiCpwRNbZzY+YT36TbQ
 IDqJj95yYaFVoz1nImVmbBZR0hFt5qY3N1BDtxjrZZweP+HU6NSO/KakLn0WRJ/I1Dd3
 FrtMN2b4VQ8x7cvU7SjvPh4cI3J1wAEZxPVps2bA3pk1hFJt+becOQHIytMRrxyDdIi3
 JTNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1700915755;
 s=strato-dkim-0003; d=xenosoft.de;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=p56uFgR+2L+joFqVsz4BnJljMfmRwlsgQch0B8qQcmg=;
 b=k/xUVoLQGPkzgFFsbDRKOt43eEzMiKXYPTVTsswpE0W9NOsGK5/u1O1OaIFSJBcsdH
 iNvaDZ/6UeVxT6krLgCg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfi4XXBswJY0hynIKqjaeYiGT1rE/QhtjOKJAIg=="
Received: from [IPV6:2a02:8109:8984:5d00:bc44:680c:952a:1673]
 by smtp.strato.de (RZmta 49.9.1 AUTH) with ESMTPSA id U060a4zAPCZsnsU
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 25 Nov 2023 13:35:54 +0100 (CET)
Message-ID: <1bd6d2c8-007b-46f7-85b4-9793ec650f94@xenosoft.de>
Date: Sat, 25 Nov 2023 13:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/virtio: Add suppport for non-native buffer formats
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <47a81d2e0e47b1715718779b6978a8b595cc7c5d.1700140609.git.geert@linux-m68k.org>
 <77c6gkquzq4sdtmrlko3lkxvcnipm2zfjem3kvhgslcellkefh@man7pbbzud47>
 <a9ade305-f90e-4250-a795-49ef4e29e0ac@xenosoft.de>
 <CAMuHMdXtUYJmEharJhBXx7D=fA3mQxg6uMP2=4Qgi==2a+kVQw@mail.gmail.com>
 <37b9e5ab-e170-4071-a912-f3fec0d59d5c@xenosoft.de>
 <ee75377ad22a3d07f272e17f53cabead7b43afcb.camel@physik.fu-berlin.de>
 <9e8d2abd-94a1-4fb6-b30a-c6e4c52af011@xenosoft.de>
In-Reply-To: <9e8d2abd-94a1-4fb6-b30a-c6e4c52af011@xenosoft.de>
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

On 25 November 2023 at 01:22 pm, Christian Zigotzky wrote:
> On 25 November 2023 at 12:09 pm, John Paul Adrian Glaubitz wrote:
>> On Sat, 2023-11-25 at 11:06 +0100, Christian Zigotzky wrote:
>>> Could you please revert the v2 patch because of the issue with the
>>> virtio-mouse-pci cursor? I will try to use the v1 patch for the RC3 of
>>> kernel 6.7.
>> I don't understand why the v2 patch should yield any different 
>> results as
>> the only change compared to v1 is the fixed patch subject. There are no
>> functional differences, I just diffed the patches against each other:
>>
>> --- geert-patch-v1.patch        2023-11-25 12:09:19.122936658 +0100
>> +++ geert-patch-v2.patch        2023-11-25 12:09:36.313039085 +0100
>> @@ -34,6 +34,9 @@
>>   Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
>>   Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>   ---
>> +v2:
>> +  - Fix truncated one-line summary.
>> +---
>>    drivers/gpu/drm/virtio/virtgpu_display.c | 11 +++++++++--
>>    drivers/gpu/drm/virtio/virtgpu_plane.c   |  6 ++++--
>>    2 files changed, 13 insertions(+), 4 deletions(-)
>>
>> Adrian
>>
> Hi Adrian,
>
> Thank you for the hint. I think you are right. I use the following patch.
>
> --- a/drivers/gpu/drm/drm_client.c    2023-11-13 01:19:07.000000000 +0100
> +++ b/drivers/gpu/drm/drm_client.c    2023-11-14 09:45:44.964199272 +0100
> @@ -400,6 +400,16 @@ static int drm_client_buffer_addfb(struc
>
>      fb_req.width = width;
>      fb_req.height = height;
> +           if 
> (client->dev->mode_config.quirk_addfb_prefer_host_byte_order) {
> +               if (format == DRM_FORMAT_XRGB8888)
> +                       format = DRM_FORMAT_HOST_XRGB8888;
> +               if (format == DRM_FORMAT_ARGB8888)
> +                       format = DRM_FORMAT_HOST_ARGB8888;
> +               if (format == DRM_FORMAT_RGB565)
> +                       format = DRM_FORMAT_HOST_RGB565;
> +               if (format == DRM_FORMAT_XRGB1555)
> +                       format = DRM_FORMAT_HOST_XRGB1555;
> +        }
>      fb_req.pixel_format = format;
>      fb_req.handles[0] = handle;
>      fb_req.pitches[0] = buffer->pitch;
>
> This patch solved the issue.
>
> Christian
This was the first solution and it works without any problems.

Christian

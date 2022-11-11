Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CFD6258B0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 11:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D001A10E7F3;
	Fri, 11 Nov 2022 10:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D972E10E7F3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 10:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1668163793; bh=TVVaXc4g6GTT1yFQeK38icswCRKjgAN5+Unyzwo73vM=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=LuYvuF2Dd/vv8mQu3DliLLVui5LwrjToWEDrQiUaGr9R+UkFkKffY28ThSr+FmD70
 ZN36E1lbSUJxchg/3qg4uOkzfOMUIRMGu3HsADucBRuSQHNr6Oujq2LtDQpZW2nlXt
 Bl5LyrNfjEN+EL8KUU9k9ibqTb5GYeFu7KclDqRlG8yk5twe64kZTeknrZz/TECuVj
 BhKpnHFItQ91y8qI6os9XoVen3OENAN3OdopcW/ot7iWvWKBsv6dWPlXhCP4m4FECB
 YYB4tPhPzYPxtRTGLhmwvbbJ/6YnFiEALfDWQYm/pedG+npGcFTNWvVsRwQziZ463+
 WcyhtbdYxDK0g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.140.172]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1OXZ-1ozw0w2nXv-012rIv; Fri, 11
 Nov 2022 11:49:53 +0100
Message-ID: <3b3d0af7-0ad2-bd45-26ec-bd00eebfa905@gmx.de>
Date: Fri, 11 Nov 2022 11:49:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] fbdev: Add support for the nomodeset kernel parameter
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-3-tzimmermann@suse.de>
 <2e2d23f3-9c2d-e75e-f390-4651a4da730f@gmx.de>
 <6547fba2-a002-f339-2997-5b28df794095@suse.de>
 <d21a0a0d-22fb-99bf-0d29-75b1fe1db677@gmx.de>
 <dfa83c75-4062-93ee-380c-3e0e4f41c448@suse.de>
 <73c7243d-b1b7-ac3c-7b17-1f0084821aa4@redhat.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <73c7243d-b1b7-ac3c-7b17-1f0084821aa4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:j8xjehE/ZM132UoLdDCvfwx6M9xwAKJ2vUxAiIHCHc3723nNu1F
 OTt1W00iax6Bk3n3ClBGre+cHrT3SKHbiHSRE2mO3v/Ph+gj7z82SlUMKvi6D9ERhAzUpF+
 miAxRTAB8cejChSCUZNU4RI1JJGuhwxOygFAXfri9OmagN/Id0VUCJvNYs+xsY7B5jBJIrA
 WqTnx6NlVICx5p2YA9WXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:X7CRMHdMORk=;CmHL/JUPTU/IgC4sqqWnPGWs1ay
 9OIXVV1Y+DLqP+FzQ4SOYPFQWjwFaZrghsQPNv6hwMRhnJ5aiG1z88O9DU16QYv4qQecp3ceJ
 nbKNvqQx6K+nevlcxhVOEqa9gyDqIVJ/oXzihSeVHi+a0B9/OJDKrqWSpkzQjG2gEVo1Bblyp
 jhfTAonn1ypo4IAuQBHL2AMkaawsCay757fBIvsyB8UfySC3CWZVjGnA9J9ZKIwxP1MpGJfIK
 ryvmypWydtQp27gwX28+C7DszXTiN/PBUjN4IhseKN64+Dpra7g/ej7WP1Bqy9V7t1645s2Xh
 lXE9NCsT3f1x1cf2kVoMie37p1gOtO7q1r0x4ptJE7nqFcwOH4PqhnHJzNe4TSsCZ+XtPe3Tb
 VaBxhCT2ZkbJbHFw/7QJNxbxC1M4qA6hQW3Rd2zwCJ6P7X/po5P2WKTns4PJRd5yp5pVANmzn
 zeN4W2iL/XkR48ntJDLoeAkQSXzgcQ0R85MPFeWwOZ6KDzI3G2cYB+fodM7AF+jLsMV7i6uYJ
 3bnQ6V6id/yJq3VDJHhGoni4/FHe/0rA3dWWYK3eMiOg9MSk/UWlsCarqmPp961SRjSVGLyb4
 QYU4JxPQQSUMwtk2FhDmvXkd4m1l9xdlkgC482A8xiOhwYjn7bbJ0e++z+JNlcSSRKtxZiHUn
 JHnaRCHBtCenlVQUHv/p7HnGT4q5ThVUpQJghVA5fHMJ4jWR5gfMSS3pOFLy8hnKWV8JzT5jH
 fiIMuXR+jko727kyRctdz3Fvp4ouLbGDNn91W5AmpdJQMh9GGuOK/h+V85VDVrbgGY3AnsvsT
 tbENLZwezJkk0bA7lxw0KQhPEL9coXPNvUHIYOl5ipFX8hegadlPKt+SdUT0V8QaWGET1/Pzh
 EiHwsAhJ4sL3JtacdsO+2dJmJi4wtYLUS6FzJOsvi1zYq5OrkOuCHFQuMT8sDGG3oge0b4I8s
 xLCYqw==
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

On 11/11/22 10:49, Javier Martinez Canillas wrote:
> On 11/8/22 09:16, Thomas Zimmermann wrote:
>> Hi
>
> [...]
>
>>
>> My proposal would be to add a little helper to fbdev that includes your
>> suggestions:
>>
>>     bool fb_modesetting_disabled(const char *drvname)
>>     {
>>        fwonly =3D video_firmware_drivers_only()
>>        if (fbonly && drvname)
>> 	pr_warn("")
>>        return fbonly;
>>     }

I'm still wondering why you can't simply merge it with what is printed in
  [1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_n=
omodeset.c#L18

Other than that, your the proposal is okay, if you adjust your patches to
call this new function "fb_modesetting_disabled()" instead of
calling video_firmware_drivers_only() like this:

> +    if (video_firmware_drivers_only())
> +        return -ENODEV;

Helge

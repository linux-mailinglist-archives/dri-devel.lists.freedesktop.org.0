Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A83D55AD5F
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 01:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3492D10E63A;
	Sat, 25 Jun 2022 23:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09F110E63A
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 23:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656198769;
 bh=5UYWzrP+bEr+wagKkthKI/ljIq00yx7Ahimu3/Fs5m4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=aXiPVD4H3vgr78o7cLOvgLZXYsZs2c5gf0X9T5UkFyZPb2uMoVWQMNi1vV4Ksl9RC
 wi11w2mXhBMN1Gmr/eKkJKqQjk/FCKXwn8cqBVXnr5TdfXPSFDYq0mWmWGEIvWjX1o
 3xp40jeaowrYODvMh9M/yZWCvVsRRpWRjYwdz8uM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.162.44]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZCbB-1o9S3U0xph-00VAy0; Sun, 26
 Jun 2022 01:12:49 +0200
Message-ID: <5e03d6c5-e254-f5f6-9e02-bc996d41718d@gmx.de>
Date: Sun, 26 Jun 2022 01:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/4] fbmem: Check screen resolution change against font
 size
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220625220630.333705-1-deller@gmx.de>
 <20220625220630.333705-4-deller@gmx.de> <YreNUfv8d9QeJT8C@phenom.ffwll.local>
 <YreODaSXhAhipJKa@phenom.ffwll.local>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <YreODaSXhAhipJKa@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Z8c5zxfyMfNyRCY1bO8f73mXVMZjlU8Evrucx7pcuBNZkLE0V6G
 dYwsd56nMs/0ffbIZu58Dp2GskTfb5MGn9ON6BrYgrC6nVOAuvuiIvkN+kubOPgaLw3/mFP
 LPJ+KM4/W0Zat85TZL/lrXeNmPEPU1pLW1V6o46DSPTUu57V5kx7Vy+k+KVO1+3Mu9aRwsI
 rBGxrJXhxVs2sJBeYxvgA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/dHnEfaeyCU=:nQIGxSMYosg4yZLkn/MGKl
 qp72nOrD5PmO55BZZMf3tw6CY2lraHR2qvp1gSUIB95s/P0ETvYHqKAjyuWdClxXD16RS3MIt
 VHgIi0x0lNOI+TmL8h/x/xQcSChSHURCMGyhWgZTgYaQCpYPN7SJb5r6LvNbX1DlR+LSRMA9d
 idASDbtwMr7Kea3DhEK7jegcqJZ+7J9qntzSENqcRdmHEyg7u4/ywwc8fmn+qGF+3GV93Rsfo
 Zzt2TwrM+RqShDQZzMSyk8ykWi6jipq/S9Dr43S58FkgNZ4BS9f8gdjghWWDmqusxjkhmAYqA
 vOloix80NjZaqkNSqFh+MQulSWAbvXhQMasP2HAPyKU93MNbdoFzNzo4/5cb3xXJgirAClgFk
 x/ErwEdkINkW0j+2AyZaZ2Kg8yuHbCN47wXOQw13HjF6yq/mjQRyPrArfMcf+gXRK7DwwK4+v
 iYLm4a00coWHY8PVDJ+3dlMqDHe0Ie+dFlT/VIY3pXQEwZj8BHn+zwqg4y6XbqQRKiXaKlaLk
 M6OlmOOJ8/9ZY2vV4f94WMXslknOf79k7fsmp2iXtrWvfC0hjYxj6K+AEA21vypcb9YPM2LtN
 fVsUrRFnnXa8B2YDNlMlJdNdEGwwiReeO04SI8zSFP9da2doOVs40TnKf9ZnPvbxp+nkFObhP
 QyL8ngCfcwnO5Oa//u3XiAVHbsQh9cecuMpSMcTmh/bmuWvPT/z3M+ZsFIqBOLqEb2ORrnjdk
 fiz64QGArO8keavFmKU8ejoZKZ3a0V1Zf2RN9Q0yzi3IjjDRNK1Nu+3gBRCAp+zf1J22EvRCg
 6sQCRXwJ1wgNWIQ5lHTi7bUAAK/fbGkMDyuynHwxDzDUalf53YPQ4qgkHYrHVbrcLMruSI12/
 WJ8w+FXFg7I3e2SjwnNExNspvhEWw0W8BocSwTZ9kCyy9xmw4agIL1hl2fmjmYbaxtT4hVbUM
 bsFclcwGsnudIv3qr3PPSK2SQgH5tOEbeVg85zxMaBCcA/mwlNOG2BYeA7OPuuXIYXeVWLk7H
 qMQIN3gj41HCSo9ajTYrGsoboT6HgnE0HugG77VduZhaTIRjTWb+Tl2VdjmEzKYE26WJ2hNXM
 RwJTTANKloDcaTorcI4r8DdlK6OscxUUj0wPSyzaeH69BWpdEZt16tW0g==
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
Cc: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/26/22 00:37, Daniel Vetter wrote:
> On Sun, Jun 26, 2022 at 12:33:53AM +0200, Daniel Vetter wrote:
>> On Sun, Jun 26, 2022 at 12:06:29AM +0200, Helge Deller wrote:
>>> Enhance the check in the FBIOPUT_VSCREENINFO ioctl handler to verify i=
f the
>>> user-provided new screen size is bigger than the current font size.
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>> Cc: stable@vger.kernel.org # v5.4+
>>
>> Please squash with previous patch. You might also want to add a note th=
ere
>> that on older kernels backporters need to open-code
>> fbcon_info_from_console instead, since it only exists since
>> 409d6c95f9c6 ("fbcon: Introduce wrapper for console->fb_info lookup")
>
> Maybe easier would be to include that patch in the backports instead of
> open coding.

I was afraid that WARN_CONSOLE_UNLOCKED() hadn't been backported.
But it seems it's in v4.19+ (from patch 56e6c104e4f15), so that's ok.

So, yes, it seems pushing 409d6c95f9c6 backwards is probably best.

Will try that approach now.

Helge

 I think that's what Greg generally prefers at least, less
> divergence between stable kernels.
> -Daniel
>
>>
>> With these two nits: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch=
>
>>
>>> ---
>>>  drivers/video/fbdev/core/fbmem.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/co=
re/fbmem.c
>>> index afa2863670f3..160389365a36 100644
>>> --- a/drivers/video/fbdev/core/fbmem.c
>>> +++ b/drivers/video/fbdev/core/fbmem.c
>>> @@ -1106,7 +1106,9 @@ static long do_fb_ioctl(struct fb_info *info, un=
signed int cmd,
>>>  			return -EFAULT;
>>>  		console_lock();
>>>  		lock_fb_info(info);
>>> -		ret =3D fb_set_var(info, &var);
>>> +		ret =3D fbcon_modechange_possible(info, &var);
>>> +		if (!ret)
>>> +			ret =3D fb_set_var(info, &var);
>>>  		if (!ret)
>>>  			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
>>>  		unlock_fb_info(info);
>>> --
>>> 2.35.3
>>>
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
>


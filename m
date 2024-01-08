Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E44DF826ADA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3976710E1D5;
	Mon,  8 Jan 2024 09:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B3910E1D5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1704706734; x=1705311534; i=deller@gmx.de;
 bh=B91dkGZkhI5I6MrAdfx6C1xz2e+7x2w4wYdu9BniE20=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=kJ07zZP0X/HB4DieBoot7kjQBp/Gxqroma/fHdHajPk2FTFpyLqFOV4TeXkDN7U3
 an7kUGsd73KJNg1n40dbF6MHFRG314yunjsIHdTiYgX2ik4Ulnvg++MpoKZ9SrkQl
 95qnFadIm1vkiSvZBa/z991yTgz4N3+Vryfsdvjid3g3089BV8dMH0R1G+Es9qX24
 ZbH2h1bfqnHhFQC/+Zb/3PtK7/0+od/4u3Eb/QfZlmfgTX1kF9qLtAVy3Qwxfh6yY
 FvFZSlhmxehxXhhWIRVdjcBNxN6gOmAffyTCvZcIq1Sv0NVBFWDuS7Z2pI91xQm8t
 a9gvxwl3eoGekgg2mg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.148.84]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6sn7-1r7Vbi0EFb-018K1U; Mon, 08
 Jan 2024 10:33:29 +0100
Message-ID: <4095003c-20a5-45af-8765-d772cd054f0b@gmx.de>
Date: Mon, 8 Jan 2024 10:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/hyperv: Remove firmware framebuffers with
 aperture helper
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, drawat.floss@gmail.com,
 decui@microsoft.com, wei.liu@kernel.org, haiyangz@microsoft.com,
 kys@microsoft.com, daniel@ffwll.ch, airlied@gmail.com
References: <20240103102640.31751-1-tzimmermann@suse.de>
 <20240103102640.31751-2-tzimmermann@suse.de>
 <87a5pgdvll.fsf@minerva.mail-host-address-is-not-set>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <87a5pgdvll.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ovg2O8J5M3AOSM/vZFPHDgtkX3D/xvyImfjoBYLjdx916W4W8Gl
 E/KT40SX52KPnbKk3aA23DYEZpEsrM+uvIyHA398GbZdRstiM2Fsd2myhG36BK8IrSF/8zq
 EPvldWvRJ/WMu6nDXBh0BngdX7/LQmAtHDQniKlLMTUDSWd/VxfcycmINF0495JEGE4ZoaR
 uAwIUOP54ZHopc6eanqfQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LdOmzpZ3aec=;lvQl05TJNgTSSZqNsQVK/p2dfEF
 fi7BEEETKjUXZg8l29/KskGsgT5ySQ4f9lFTFIKimJuAoL/qnrrtuQLyjrDusFf7d5fRj4ejq
 8TAE32tSfcCzf7S5R/YT1w8BC4Jlmsa8OtLeZu/jqpQcBjFj6Uc1j69ylswWQ1XDgR0VpFDma
 cFKdaQ2d59hjOBX3uRBKGZGo4URQCe/juhFgc8ir5eJAjz6G39RWBiBIEq31z5fIX+Wmv4YMi
 cwO1OEJBusvEU+hVj1esnb2AIPPkTnixXRfQwqHkVBljcd98KQHBlfHA9zyUH0A+OeKOpdHz4
 JRaJfjs3Asx2uAoIrnAyD5UsPPp3PQnZEGCUEI/+wzSxENLqqyWuHB73ITj7BsY1ObWLEl+Yr
 1+lwHoZ7skJF9+RTxeAWvwNIE5QvD9S7glUXgFvXUqXLJ7SaO5/E4g+3SLyOtnaeA8lLx07Vo
 6ObDCuVOtLR1RbsKgdOhWH1pe60cqKrr/YXm3XHbhYtfK11Qe9rsLYMO66Fm3lQAQvOuW4B8D
 BdrkcVEr07RYVHWcwoe0UjQs+DUxjwib7FFSIXgE/FCInSnp0TcyPiOChFrKXRw7gN2b5Ia5s
 NNaDKHw/SA3Uw/PeVQK6iZKm/awwGv/5Ut+WpWCVMvWc92xsPwKwTFJH3Xefc5BTf3/qUCi2s
 qQLSnT6TwqedxnzdDMaTiw3Xljfs0WZ+k2Ydei4L7sRE39jcI7kPsRlTUgsAJKO9Fhk4EBQ1p
 5uSS1PEwEMgzLzgYUp1ABcaU9hnTZamNEZUcZGXQNwLfBhFI9D06ffqXzdnhNln1I/5L+jPHf
 G4j0AQyVkrIKpxMJ1bmybi1+lV3fsqRwcMHd+qZqk2pWUtnxw3Eg6AEjxzUtiJ30J4oRLNr3F
 OQll0wQGy0/kIq7XUaivu4ljdm5bGftzdTn0iTv1WfdMGRVRy4V31MBOHfpPWvPNyqliqRMVX
 bJ25hg==
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
Cc: linux-hyperv@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/8/24 10:26, Javier Martinez Canillas wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>
> Hello Thomas,
>
>> Replace use of screen_info state with the correct interface from
>> the aperture helpers. The state is only for architecture and firmware
>> code. It is not guaranteed to contain valid data. Drivers are thus
>> not allowed to use it.
>>
>> For removing conflicting firmware framebuffers, there are aperture
>> helpers. Hence replace screen_info with the correct function that will
>> remove conflicting framebuffers for the hyperv-drm driver. Also
>> move the call to the correct place within the driver.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Series applied to fbdev git tree.

Thanks,
Helge


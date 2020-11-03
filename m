Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000DF2A41A3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 11:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106B26EC0D;
	Tue,  3 Nov 2020 10:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3196D6EC16
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:23:40 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20201103102338epoutp03ade4c1dcdc0f89f03554c0373c0a7338~D_GgU_N6K2367223672epoutp03r
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:23:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20201103102338epoutp03ade4c1dcdc0f89f03554c0373c0a7338~D_GgU_N6K2367223672epoutp03r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604399018;
 bh=yNLUz3jizowRTL7wf4IGq96hb2BwdVZKZgn7GTUJYXg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=uqE7nDUtn86immrJVe4/sqJ2sZA0+o+QIzEVdjH/A8gcVYp0MlKkVJfj5Re9kogRW
 L3jFTT8U8mX4lp9bpz1+bJ0R6sFoOl+rlqER30rLKrAoj4Zo0XcU3B4ZwgGS6Jrf1d
 +Xta5Z8N2tDH06erGskK3osyUBQLUmI17o/9EWdo=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201103102337epcas1p15072d25469b65e9ffb91e29d9d44fcdb~D_GfhA_0B1444314443epcas1p1X;
 Tue,  3 Nov 2020 10:23:37 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.156]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4CQQqC0Y1szMqYkY; Tue,  3 Nov
 2020 10:23:35 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 82.E9.09582.6AF21AF5; Tue,  3 Nov 2020 19:23:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20201103102334epcas1p30384668d332edd34996621c926bb2156~D_GccntK11025510255epcas1p37;
 Tue,  3 Nov 2020 10:23:34 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201103102334epsmtrp191fe0a26389ee27d162477b8c1012545~D_Gcbq0bk0607306073epsmtrp1P;
 Tue,  3 Nov 2020 10:23:34 +0000 (GMT)
X-AuditID: b6c32a37-899ff7000000256e-77-5fa12fa604ec
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 98.4A.13470.5AF21AF5; Tue,  3 Nov 2020 19:23:33 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201103102333epsmtip14c24f37990d3c1bed96130a3743c384f~D_GcGu6cX3010030100epsmtip1L;
 Tue,  3 Nov 2020 10:23:33 +0000 (GMT)
Subject: Re: [PATCH v7 0/6] Exynos: Simple QoS for exynos-bus using
 interconnect
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Georgi Djakov
 <georgi.djakov@linaro.org>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <d036412f-4a5a-3f30-1ede-ba191f4f0dd6@samsung.com>
Date: Tue, 3 Nov 2020 19:37:31 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <fae047dd-2564-61be-a185-ceb6f89d3e07@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAJsWRmVeSWpSXmKPExsWy7bCmnu4y/YXxBp/321jcn9fKaLFxxnpW
 i/lHzrFaXPn6ns1i+t5NbBaT7k9gsTh/fgO7xeVdc9gsPvceYbSYcX4fk8XaI3fZLW43rmCz
 aN17hN3i8Jt2VosZk1+yOfB7bFrVyeZx59oeNo/73ceZPPq2rGL0+LxJLoA1KtsmIzUxJbVI
 ITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hcJYWyxJxSoFBAYnGx
 kr6dTVF+aUmqQkZ+cYmtUmpBSk6BZYFecWJucWleul5yfq6VoYGBkSlQYUJ2xocFs5kK7olV
 TF/cwtbAOF2oi5GTQ0LARGLNhFPsILaQwA5GiSWNsl2MXED2J0aJj1e2M0IkvjFKLNxnBdOw
 d9oxdoiivYwSN162skA47xklJnybyApSJSwQJLF2YjtYt4hAtETHuaesIEXMAjeZJB6tuscG
 kmAT0JLY/+IGmM0voChx9cdjsAZeATuJ3++ug9ksAioSF/r+MIPYogJhEie3tUDVCEqcnPmE
 BcTmFLCXOH5sD1icWUBc4taT+UwQtrzE9rdzmEEWSwhc4ZDoXfGGGeIHF4nXa78xQdjCEq+O
 b2GHsKUkXva3QdnVEitPHmGDaO5glNiy/wIrRMJYYv/SyUDNHEAbNCXW79KHCCtK7Pw9F+oI
 Pol3X3tYQUokBHglOtqgYa0scfnBXai1khKL2zvZJjAqzULyziwkL8xC8sIshGULGFlWMYql
 FhTnpqcWGxYYI8f2JkZwUtYy38E47e0HvUOMTByMhxglOJiVRHhrIufFC/GmJFZWpRblxxeV
 5qQWH2I0BQbwRGYp0eR8YF7IK4k3NDUyNja2MDE0MzU0VBLn/aPdES8kkJ5YkpqdmlqQWgTT
 x8TBKdXANNUxsjbef/uc9m2rUiPn/libvmrKff1nnjdfNNqv6Yz8qskrPeOOc6r06dOFirPV
 axz9I3Uczsw/w92+lfvS8dU18x0aorZ2HI7ilDffPFvoffNT6RPstk0B+yNXBGtNed9/UMTp
 C/PHJ4+ebs0O5r14kicyINO8snLJy2VNb7bI7dfNOrV9yt4F1r82bfOb6eh/iDcl7mzPsaOz
 8idd13OZI3qEJawlg5v1X2D/DJYr7u6nZB5+T4zYcGVFQ09UxLGVaybsNPy+ufFExIPt3yqM
 frou7Fpln1j+Mdlg2s+7ETf28xzaKdkkfXR9I0fAW+03DbeubGksTG3uY+QXuXtR6fKlh5vW
 b3Vxs3GqOqrEUpyRaKjFXFScCADJ9x1fUwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsWy7bCSnO5S/YXxBk86zSzuz2tltNg4Yz2r
 xfwj51gtrnx9z2Yxfe8mNotJ9yewWJw/v4Hd4vKuOWwWn3uPMFrMOL+PyWLtkbvsFrcbV7BZ
 tO49wm5x+E07q8WMyS/ZHPg9Nq3qZPO4c20Pm8f97uNMHn1bVjF6fN4kF8AaxWWTkpqTWZZa
 pG+XwJXxYcFspoJ7YhXTF7ewNTBOF+pi5OSQEDCR2DvtGHsXIxeHkMBuRomzS36xQyQkJaZd
 PMrcxcgBZAtLHD5cDFHzllFi5tPnjCA1wgJBEmsntoPZIgLREgvOrWcGsZkFbjJJXNziAdHw
 kEniz5+/YAk2AS2J/S9usIHY/AKKEld/PAZr5hWwk/j97jqYzSKgInGh7w9YvahAmMTOJY+Z
 IGoEJU7OfMICYnMK2EscP7aHEWKZusSfeZegFotL3HoynwnClpfY/nYO8wRG4VlI2mchaZmF
 pGUWkpYFjCyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1kvNzNzGC41NLcwfj9lUf9A4xMnEw
 HmKU4GBWEuGtiZwXL8SbklhZlVqUH19UmpNafIhRmoNFSZz3RuHCOCGB9MSS1OzU1ILUIpgs
 EwenVAOT2o6Vmx+2nlPc+v3m+vVXD89iMyp5e9gkgik4fc+Xz7laNxY4svZ56v22lcyetc+h
 7vhNDS/mGpa7S3XWLnR/vkAk5WAb176UrgMLqpk+ht8O3sNXPFX9qMJ392rBwAYvfbZDy3Ul
 tGdlqcm7KXYV/Y1+rZZXLHjjlsy+qC/vrKOv2zPxXk3r4pVeY7mW04NVNUj/2c2ji9OZm3un
 L+d6svezbEpTeLi3bISw93U5JyN1r7BuwabbnD7Hnuxz0bh67txGpce1Suf41/yLXNkYbit3
 VjbonkO23ME/pjL1Uk/K7Ay3PX96gy+y4DKnvsyd3YsLD2V4y22RvqexZ3uK4PIdKTu3s978
 OvnPsvVKLMUZiYZazEXFiQDb11UlPgMAAA==
X-CMS-MailID: 20201103102334epcas1p30384668d332edd34996621c926bb2156
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201030125221eucas1p14e525f75c4b8dadae04144ce7684d776
References: <CGME20201030125221eucas1p14e525f75c4b8dadae04144ce7684d776@eucas1p1.samsung.com>
 <20201030125149.8227-1-s.nawrocki@samsung.com>
 <b586c2b7-9ca1-e641-b70c-27493ffd05e0@samsung.com>
 <9285e2d4-f2fa-92f2-ba25-832f32f77d78@linaro.org>
 <3e3038da-d5de-7ea9-9cb9-082ce63af91d@samsung.com>
 <fae047dd-2564-61be-a185-ceb6f89d3e07@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org, sw0312.kim@samsung.com, a.swigon@samsung.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, myungjoo.ham@samsung.com,
 krzk@kernel.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sylwester,

On 11/3/20 7:12 PM, Sylwester Nawrocki wrote:
> Hi Chanwoo, Georgi
> 
> On 03.11.2020 09:53, Chanwoo Choi wrote:
>> On 11/3/20 5:29 PM, Georgi Djakov wrote:
>>> On 11/3/20 09:54, Chanwoo Choi wrote:
> 
>>>> When I tested this patchset on Odroid-U3,
>>>> After setting 0 bps by interconnect[1][2],
>>>> the frequency of devfreq devs sustain the high frequency
>>>> according to the pm qos request.
>>>>
>>>> So, I try to find the cause of this situation.
>>>> In result, it seems that interconnect exynos driver
>>>> updates the pm qos request to devfreq device
>>>> during the kernel booting. Do you know why the exynos
>>>> interconnect driver request the pm qos during probe
>>>> without the mixer request?
>>>
>>> That's probably because of the sync_state support, that was introduced
>>> recently. The icc_sync_state callback needs to be added to the driver
>>> (i just left a comment on that patch), and then check again if it works.
>>>
>>> The idea of the sync_state is that there could be multiple users of a
>>> path and we must wait for all consumers to tell their bandwidth needs.
>>> Otherwise the first consumer may lower the bandwidth or disable a path
>>> needed for another consumer (driver), which has not probed yet. So we
>>> maintain a floor bandwidth until everyone has probed. By default the floor
>>> bandwidth is INT_MAX, but can be overridden by implementing the get_bw()
>>> callback.
> 
> Thanks for detailed explanation Georgi.
> 
>> Thanks for guide. I tested it with your comment of patch2.
>> It is well working without problem as I mentioned previously.
>>
>> I caught the reset operation of PM QoS requested from interconnect
>> on kernel log. In result, after completed the kernel booting,
>> there is no pm qos request if hdmi cable is not connected.
> 
> Thanks for the bug report Chanwoo, it's related to the sync_state
> feature as you guys already figured out.  I had to reorder some code 
> in the interconnect driver probe() to avoid some issues, 
> i.e. to register PM QoS request before icc_node_add() call but 
> I forgot to check initial state of the bus frequencies.
> 
> I thought the get_bw implementation might be needed but the default
> behaviour seems fine, the PM QoS derived bus frequencies will be 
> clamped in the devfreq to valid OPP values.
> 
> Chanwoo, in order to set the bandwidth to 0 we could also just blank 
> the display. Below are some of the commands I use for testing.
> 
> # blank display (disable the mixer entirely)
> echo 4 > /sys/devices/platform/exynos-drm/graphics/fb0/blank
> 
> # unblank display
> echo 0 > /sys/devices/platform/exynos-drm/graphics/fb0/blank
> 
> # modetest with 2 planes (higher bandwidth test)
> ./modetest -s 47:1920x1080 -P 45:1920x1080 -v
> 

Thanks for the test guide.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

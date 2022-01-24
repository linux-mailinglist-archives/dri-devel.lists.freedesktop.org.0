Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED4649815F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 14:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5730A10E749;
	Mon, 24 Jan 2022 13:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B44F10E749
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 13:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643032205;
 bh=u6MPuRG8w20At+22/EV/JwHIFBA05kw/+W1B4GWGYSM=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=HsfSM4HT9oFFqK3KDOdLvrrfu2fDUGadcN/HMOn5BewRp7ZE1gC1zVqK9bPAa0f4G
 14T8gi84bGtsVjFnG+eyxIzN2tKQIGaljGROiZH7vMFQgicKMSjX1KYJUrXNPfY4Y0
 gAHpm/z6o6F9CfpyvXeNUITt6HH0+ZAO8V2AiNxM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.165.96]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUosT-1mluJA2gqn-00QnjL; Mon, 24
 Jan 2022 14:50:05 +0100
Message-ID: <cb4323b6-99f0-c813-502a-2fbe107353ee@gmx.de>
Date: Mon, 24 Jan 2022 14:48:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/1] video: hyperv_fb: Fix validation of screen resolution
Content-Language: en-US
To: Wei Liu <wei.liu@kernel.org>
References: <1642360711-2335-1-git-send-email-mikelley@microsoft.com>
 <MN2PR21MB1295CE3BD15D4EB257A158DCCA569@MN2PR21MB1295.namprd21.prod.outlook.com>
 <20220123215606.fzycryooluavtar4@liuwe-devbox-debian-v2>
 <MWHPR21MB1593ED650DA82BC3009F66CED75D9@MWHPR21MB1593.namprd21.prod.outlook.com>
 <20220123223030.ijdzrunduww76jiq@liuwe-devbox-debian-v2>
 <e396a22d-7e0e-73a4-d831-f69dc854bfa8@gmx.de>
 <20220124133119.3yxfr7ypmmdotm6h@liuwe-devbox-debian-v2>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220124133119.3yxfr7ypmmdotm6h@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7hhzpZHkF0R/9ndEJOKmMCZI6q1JhRlydqXic/iJUhXN+6ITg0C
 7T63RrUJS5kh8xHRYh0rm6ybrg/mvs2WW17GOnir3U3RW8PLsQGZpZHvebMB78RrgaM1eIY
 GJdjl3nANaoxpK0LSzfD0iM/1NXK2ETjrrw3CaZXO/MWylUu1U3q4cOeGG2b7E9HFN7HesZ
 +RLbp3pcoqocFb4rbV35A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:udTipb9oxpo=:rXQsJugIhdKVGb7qsOOZrB
 ZVNfYMDX3ca4OUCR2N4mkGtsGRcmlFzInBc9j/oSMUSS9v8F0TC7f15ipYw2YgtyoFzlccN9m
 JCUekVGrbC/M3jAyysFj6zsqGLXKt49GrBdYQH2+cZ5ngC8AarVjmiPbadUQToOGCYf10pIG3
 N+PfgsqHuqnPGTEV5IjZugMSCYCKfULHy6gHTsaW9WrsOGbI675NqyO4g1f8Y31tLhSIYdFzk
 04yd6Q/zTvWqmAWpZM9IwrkXtT90991ES1TpUzTYAHOeIaJm3Kemt8XF19m3Dlrn5IHSBsyvl
 QAN7koOxdoMx/QpgJQ5p/fvBRRX5kA1esALUUgOnOz2db/ttWFCqNVwAptLxJApignbjP5bpU
 YxcUv2PMwrcw7fEbQgn8lKDYGyuxxLu2zc8IjPwTa80F2PBF4Hf8Ntru2DbcFhvEtNC/THj+t
 Mc4i3PsuWnpdA57irjCeTafN360wiLv+F/wsOfeK7s2Okj++ipAG+hhpQ8+5hE4yFkUg9bCQs
 vTKN2KvzZ0/jMROB4+aYmqzV2CnV6DGJf4/to/XPUWPp4bNg40Q4dfy3mTop0EMuZIhZ0UExm
 zZWbA4UpaTC7uhvoDfOrw+Msg/BeylQYUzXPBgrHUZ1W0KCwnOwOjcF8Qvbu/Ehu5wjOtYvf5
 G3CG/HREnrPmH6UxQtu3Ah0Hw4Eb1eQPWlQ4twcb+e+MpUrBoRFOudFBiAjSmyWeYUrl2z6j3
 ndYajLyk8T6LpT0HaLRK1TAu5xvaX9GiTxOdSatE+WxejOLND22SnGzqE765CL5LJB6j/H6S3
 Tne/leZFR4zGiRg3rWHt8jzLj/WQrFCDCipZMcRyizzJVxzs97nvIetyZCR2aQDixc980Snw5
 +p4Yhd+C9VO0jr2DNnh6gGxuFC8AioicDWx376v6qe1vaeK0yjNr0LTGtmzRBkgnr/5P8BCOP
 Mc6ZQ/JUWu1dpvWH6WApLaDxP9GgxJdqySjjubmVYqcXKdtRYrWjIdv1SI5UTVZMlwlpqBf4m
 +UXDYJ1BTPCAyAu9G1ed9IyDU549n478oypn4xJPAlxrLGu+eh4KT5/goZV/KnBIgIpP6S3HW
 OzIMatkm6C+l+Y=
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Wei Hu <weh@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>, hhei <hhei@redhat.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/22 14:31, Wei Liu wrote:
> On Mon, Jan 24, 2022 at 10:52:22AM +0100, Helge Deller wrote:
>> On 1/23/22 23:30, Wei Liu wrote:
>>> On Sun, Jan 23, 2022 at 10:27:56PM +0000, Michael Kelley (LINUX) wrote=
:
>>>> From: Wei Liu <wei.liu@kernel.org> Sent: Sunday, January 23, 2022 1:5=
6 PM
>>>>>
>>>>> On Sun, Jan 16, 2022 at 09:53:06PM +0000, Haiyang Zhang wrote:
>>>>>>
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Michael Kelley (LINUX) <mikelley@microsoft.com>
>>>>>>> Sent: Sunday, January 16, 2022 2:19 PM
>>>>>>> To: KY Srinivasan <kys@microsoft.com>; Haiyang Zhang
>>>>> <haiyangz@microsoft.com>; Stephen
>>>>>>> Hemminger <sthemmin@microsoft.com>; wei.liu@kernel.org; Wei Hu
>>>>> <weh@microsoft.com>; Dexuan
>>>>>>> Cui <decui@microsoft.com>; drawat.floss@gmail.com; hhei <hhei@redh=
at.com>;
>>>>> linux-
>>>>>>> kernel@vger.kernel.org; linux-hyperv@vger.kernel.org; linux-
>>>>> fbdev@vger.kernel.org; dri-
>>>>>>> devel@lists.freedesktop.org
>>>>>>> Cc: Michael Kelley (LINUX) <mikelley@microsoft.com>
>>>>>>> Subject: [PATCH 1/1] video: hyperv_fb: Fix validation of screen re=
solution
>>>>>>>
>>>>>>> In the WIN10 version of the Synthetic Video protocol with Hyper-V,
>>>>>>> Hyper-V reports a list of supported resolutions as part of the pro=
tocol
>>>>>>> negotiation. The driver calculates the maximum width and height fr=
om
>>>>>>> the list of resolutions, and uses those maximums to validate any s=
creen
>>>>>>> resolution specified in the video=3D option on the kernel boot lin=
e.
>>>>>>>
>>>>>>> This method of validation is incorrect. For example, the list of
>>>>>>> supported resolutions could contain 1600x1200 and 1920x1080, both =
of
>>>>>>> which fit in an 8 Mbyte frame buffer.  But calculating the max wid=
th
>>>>>>> and height yields 1920 and 1200, and 1920x1200 resolution does not=
 fit
>>>>>>> in an 8 Mbyte frame buffer.  Unfortunately, this resolution is acc=
epted,
>>>>>>> causing a kernel fault when the driver accesses memory outside the
>>>>>>> frame buffer.
>>>>>>>
>>>>>>> Instead, validate the specified screen resolution by calculating
>>>>>>> its size, and comparing against the frame buffer size.  Delete the
>>>>>>> code for calculating the max width and height from the list of
>>>>>>> resolutions, since these max values have no use.  Also add the
>>>>>>> frame buffer size to the info message to aid in understanding why
>>>>>>> a resolution might be rejected.
>>>>>>>
>>>>>>> Fixes: 67e7cdb4829d ("video: hyperv: hyperv_fb: Obtain screen reso=
lution from Hyper-V
>>>>>>> host")
>>>>>>> Signed-off-by: Michael Kelley <mikelley@microsoft.com>
>>>>> [...]
>>>>>>
>>>>>> Reviewed-by: Haiyang Zhang <haiyangz@microsoft.com>
>>>>>>
>>>>>
>>>>> Applied to hyperv-fixes. Thanks.
>>>>
>>>> This fix got pulled into the fbdev/for-next tree by a new maintainer,=
 Helge Deller.
>>>> See https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbde=
v.git/commit/?h=3Dfor-next&id=3Dbcc48f8d980b12e66a3d59dfa1041667db971d86
>>>
>>> OK. I will drop it from hyperv-fixes. Thanks for letting me know!
>>
>> Linus hasn't pulled my tree yet, and he will probably not before the
>> next merge window. So, if this is an urgent bugfix for you, I can offer
>> to drop it from the fbdev tree and that you take it through the hyperv-=
fixes tree.
>> In that case you may add an Acked-by: Helge Deller <deller@gmx.de>.
>> Just let me know what you prefer.
>
> Hi Helge
>
> Yes, I would like to upstream it as soon as possible so that it can
> propagate to stable trees and be backported by downstream vendors.
>
> I will pick it up in hyperv-fixes. Please drop it from your for-next
> tree.

Dropped now from fbdev tree.

Thanks!
Helge

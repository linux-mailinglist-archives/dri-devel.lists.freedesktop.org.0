Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5E6497C72
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 10:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A5F10E14B;
	Mon, 24 Jan 2022 09:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3336010E14B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 09:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643018010;
 bh=7GRuR4CdBklw+80hinRUsLWHhq5nCs//cKIeWVCaoqg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=GZyAHG3E9jZWM0nzRpZJIjg07DZpmXxMSLp8+9KEZ/5YIw5rVumFqsOYQRQWf1rVu
 DJPNsoiUuRxr+cHSfNazWd6oBqIubhBk1Q7Fn4swOHseviDFnJbuRdjR3AStDJOTN+
 YACQgafNXvyv/zL5QTQwr4uWt75bRjyytEZLKayk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.165.96]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPogF-1myN7x2WSR-00MtRZ; Mon, 24
 Jan 2022 10:53:30 +0100
Message-ID: <e396a22d-7e0e-73a4-d831-f69dc854bfa8@gmx.de>
Date: Mon, 24 Jan 2022 10:52:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/1] video: hyperv_fb: Fix validation of screen resolution
Content-Language: en-US
To: Wei Liu <wei.liu@kernel.org>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>
References: <1642360711-2335-1-git-send-email-mikelley@microsoft.com>
 <MN2PR21MB1295CE3BD15D4EB257A158DCCA569@MN2PR21MB1295.namprd21.prod.outlook.com>
 <20220123215606.fzycryooluavtar4@liuwe-devbox-debian-v2>
 <MWHPR21MB1593ED650DA82BC3009F66CED75D9@MWHPR21MB1593.namprd21.prod.outlook.com>
 <20220123223030.ijdzrunduww76jiq@liuwe-devbox-debian-v2>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220123223030.ijdzrunduww76jiq@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ABKFW8SXczh7qFlTtEX++kFQL50OzKJREIhmItUxYzfJFmK2V3s
 klErNU1W8xTevxbISZhl50sq2KD2jXUghY6dRpH+sNMai00TX5A8ZSGC6Paf9RddJ/LEV9b
 zG84pz/qrxWV3lxnh/CbTZXatG9QKx3bL2JE4w2eVRzmUzYA+HbJXRUFuJuW4H8/mb4jEvd
 sg0z+buxAtxOQANVKFwUw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eCugNLxSkNg=:2IjquIkMdLILVBhj1wpYWa
 J6Wdiju0grn5NRgsJaFCnz4YJO7QdOOqzNZuBiUtITc3Tzely8mp2VW0+KmIu4FooDc8Hg90U
 FXWQ4+iXikWP+7HOwnEvE2K0dtEoIRfu8hWZf1ZqMkWs6VMd24i9qBb52r772OB0DtAUmbddh
 st1PGe8Un/xZgkXrBHRlXOdqkbdRG885KEcbJos3qHfN5+vDqrBKS7541/eJWVtxjQ6I8hZEP
 bsyUeWY/YN4bw815tkJSiqstGQ9bou9wF0VtEfSDxcuds8syFrd+STaR98Z3Bqic/gqHNQaed
 RIzP61bPPk1ob4UIqK5hjPsPMYKECN5i73e6bSPvm7/B0Velb6ovLrKxVljvK8I5SF5xtYMWA
 0XNB2YtRjOF013RTrnhv2nLuhB60hIJ88q2gL0RXQGaDRrYUa378/+VgvUSz/J/gR0QMYrGw1
 CxnSs4p0d0+namGoR7IZBczbhaCoPgruVQ0P6u7guUV1Xy3mIBuvqpEW2kT/OEV01sSYE5qd4
 wavnYgPOVuIWzkjobDt+YDrIqHb6OVYOJDmYTa/J1DVksTUCyh7ZxKAvfSWPsXx35IbaFnBHw
 pJSdsJeEZYEyFg52aqPXRy9fFGmuGqJfcr0I11qwpeBBsFjgVUTypyfrNvkLWnYN608uqWDKI
 3B9z5kxa2VMLxd/BTEpKXeFkcr4FWoV1vaSuGsBtuUwm8SP3JIEZRLdF1hT7iFx33X8udbUvT
 xK/I3buChrvbgdV0BMDXcdWo5LVqP1Dd4NcveWnuAEo6xda3avmgHi1k+BHV8EoPfha4AkgkD
 ilRbElUqlpY9nDror+ECUvrp54A6YcZYJb9D5py7mQlc/bwy5vOnQf/QzFh6q5NDFNK35m/Iq
 1Bj0Xb6PkNkHTEQaOepJwxpLEEiqNqUTlJeohRHcyuwCrChGQF4pxJKzUo4/h0yHxie/BraXD
 xcbEiiNxc6IwKfx2EkTfAby1itmW1enIsb3qqeLMvfMBSyGOfO1k+LQQKQI9RjF3PvUgwi2iX
 KPqRcisYiWkqeijG7uHYZ/XkuVbJesChdfJyBrfOkZb/aDYwUbo66jOyo2P4LmuSdfKoHs6YR
 o66AzqhZ8s1QBU=
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
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>, hhei <hhei@redhat.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/23/22 23:30, Wei Liu wrote:
> On Sun, Jan 23, 2022 at 10:27:56PM +0000, Michael Kelley (LINUX) wrote:
>> From: Wei Liu <wei.liu@kernel.org> Sent: Sunday, January 23, 2022 1:56 =
PM
>>>
>>> On Sun, Jan 16, 2022 at 09:53:06PM +0000, Haiyang Zhang wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Michael Kelley (LINUX) <mikelley@microsoft.com>
>>>>> Sent: Sunday, January 16, 2022 2:19 PM
>>>>> To: KY Srinivasan <kys@microsoft.com>; Haiyang Zhang
>>> <haiyangz@microsoft.com>; Stephen
>>>>> Hemminger <sthemmin@microsoft.com>; wei.liu@kernel.org; Wei Hu
>>> <weh@microsoft.com>; Dexuan
>>>>> Cui <decui@microsoft.com>; drawat.floss@gmail.com; hhei <hhei@redhat=
.com>;
>>> linux-
>>>>> kernel@vger.kernel.org; linux-hyperv@vger.kernel.org; linux-
>>> fbdev@vger.kernel.org; dri-
>>>>> devel@lists.freedesktop.org
>>>>> Cc: Michael Kelley (LINUX) <mikelley@microsoft.com>
>>>>> Subject: [PATCH 1/1] video: hyperv_fb: Fix validation of screen reso=
lution
>>>>>
>>>>> In the WIN10 version of the Synthetic Video protocol with Hyper-V,
>>>>> Hyper-V reports a list of supported resolutions as part of the proto=
col
>>>>> negotiation. The driver calculates the maximum width and height from
>>>>> the list of resolutions, and uses those maximums to validate any scr=
een
>>>>> resolution specified in the video=3D option on the kernel boot line.
>>>>>
>>>>> This method of validation is incorrect. For example, the list of
>>>>> supported resolutions could contain 1600x1200 and 1920x1080, both of
>>>>> which fit in an 8 Mbyte frame buffer.  But calculating the max width
>>>>> and height yields 1920 and 1200, and 1920x1200 resolution does not f=
it
>>>>> in an 8 Mbyte frame buffer.  Unfortunately, this resolution is accep=
ted,
>>>>> causing a kernel fault when the driver accesses memory outside the
>>>>> frame buffer.
>>>>>
>>>>> Instead, validate the specified screen resolution by calculating
>>>>> its size, and comparing against the frame buffer size.  Delete the
>>>>> code for calculating the max width and height from the list of
>>>>> resolutions, since these max values have no use.  Also add the
>>>>> frame buffer size to the info message to aid in understanding why
>>>>> a resolution might be rejected.
>>>>>
>>>>> Fixes: 67e7cdb4829d ("video: hyperv: hyperv_fb: Obtain screen resolu=
tion from Hyper-V
>>>>> host")
>>>>> Signed-off-by: Michael Kelley <mikelley@microsoft.com>
>>> [...]
>>>>
>>>> Reviewed-by: Haiyang Zhang <haiyangz@microsoft.com>
>>>>
>>>
>>> Applied to hyperv-fixes. Thanks.
>>
>> This fix got pulled into the fbdev/for-next tree by a new maintainer, H=
elge Deller.
>> See https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.=
git/commit/?h=3Dfor-next&id=3Dbcc48f8d980b12e66a3d59dfa1041667db971d86
>
> OK. I will drop it from hyperv-fixes. Thanks for letting me know!

Linus hasn't pulled my tree yet, and he will probably not before the
next merge window. So, if this is an urgent bugfix for you, I can offer
to drop it from the fbdev tree and that you take it through the hyperv-fix=
es tree.
In that case you may add an Acked-by: Helge Deller <deller@gmx.de>.
Just let me know what you prefer.

Helge

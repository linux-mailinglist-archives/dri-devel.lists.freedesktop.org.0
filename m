Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723159255E8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 10:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A3010E121;
	Wed,  3 Jul 2024 08:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="FGJZ1QIb";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="EyUOib+U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow6-smtp.messagingengine.com (flow6-smtp.messagingengine.com
 [103.168.172.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB11C10E14F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 08:52:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailflow.nyi.internal (Postfix) with ESMTP id 1918520022A;
 Wed,  3 Jul 2024 04:52:51 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
 by compute3.internal (MEProxy); Wed, 03 Jul 2024 04:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1719996771;
 x=1720003971; bh=ZS0CdGRiwS5/cWLhb6TU/G+nrrQXxwzq+A/eCbPuVL0=; b=
 FGJZ1QIbpPKEgX9nZat8dtI48F8mVpDPldPo61k+ca4+CVDiSN8pEXG7oePiyadK
 ieinW2pEaoXvko361PEyTWr5QXFnVslzimUn6oPXjS9XwKDBJeoAkEsdJnHZTX+R
 ZXTlzMM5ceVdgr6enNsKaoaI5J4ZBpLCxiw6RlCnXJVZsGRLfyIxkz+VMkhUsG6n
 ZU4UC3AZi72wKHsIfvg7fvaNf619wscRxtthmaF7yprhF6Y8b2BclJUDS3aIHq/f
 NSATQzy6Al89CxJNJH6EM52mNfM8GrX80EsOyfTgghhYy3ZB0dDgZmqWH1IWB+KQ
 an4mvlf6cPAyg4sIhhuHvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=ifd894703.fm2; t=
 1719996771; x=1720003971; bh=ZS0CdGRiwS5/cWLhb6TU/G+nrrQXxwzq+A/
 eCbPuVL0=; b=EyUOib+UQryuML8z5r4Y42KeD1j36Wkf3XyHTT0az9lfj5s/Gy+
 TQFVc/6t7NKuB/1exy7fP6R7zASna6dajHeDQhWdCwl80abu3i4MO/h8zD49sS5c
 PMvwUnUEb+tJVbs5h1iSD/R2wUiD8j/WGuO9JdI3Yikw/cjVgAavdz8+qr5+qMjy
 yM5AE0MBmX8zq0dMwI4ctkYHLlYARCNLQbJZPQGJB8gy5/A/mcEnN+P61OigV53j
 NVwrgkV+E0wLraUw4Bezm8VQ0ld7hVuVA9h3icdM5lylm8KlHAMfBGTQ/UCzppq3
 ceKmpqci26GYPu0zTOY1ywVLKnqcoGvDl2Q==
X-ME-Sender: <xms:YhGFZjB5AUpivuEIo67la95hkywUMUtqfUBF0LawsVdkDUhnXVKHmg>
 <xme:YhGFZpjVt3VNMpKy-uWHcE3flwunNhihCH1L-9LEs2031WYWlx0tskYiONiDg4W2E
 jMTPq8Sf0WnPIvbp30>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
 rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
 eqnecuggftrfgrthhtvghrnhepkeelveffhedtiefgkeefhffftdduffdvueevtdffteeh
 ueeihffgteelkeelkeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:YhGFZunZrPjNP9WSewJwUjJFmjCIBVm7ztrw8ETwiO4PETSEeDF0oA>
 <xmx:YxGFZlyKD2MILeApajFdA-aApi1vdaOsy5ehjjcqELgDUSVxQmQ7mg>
 <xmx:YxGFZoRVALX8OV-2Ve9xKNkjGcJDCAvSr7_sIP7fhzIhhBzuaZC_7w>
 <xmx:YxGFZoadjyzY_onpM7oXtVmmKJ9Z7ogSy2uzS_HWmSEDGXAN3qLkdw>
 <xmx:YxGFZpQH0t7RIvClohnSB2KuX_i3Yw4zcXylM4rGJTM62wSYIy4L43og>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D2EC036A0074; Wed,  3 Jul 2024 04:52:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-566-g3812ddbbc-fm-20240627.001-g3812ddbb
MIME-Version: 1.0
Message-Id: <4c5e0f77-b24d-47dd-86d2-31cb8e44b42a@app.fastmail.com>
In-Reply-To: <fd1d0a97-7075-4936-b58b-e99bab9afc58@app.fastmail.com>
References: <20240629052247.2653363-1-uwu@icenowy.me>
 <20240629052247.2653363-3-uwu@icenowy.me>
 <a143a2c3-c6f0-4537-acc6-94f229f14639@app.fastmail.com>
 <2760BA02-8FF8-4B29-BFE2-1322B5BFB6EC@icenowy.me>
 <7e30177b-ff13-4fed-aa51-47a9cbd5d572@amd.com>
 <6303afecce2dff9e7d30f67e0a74205256e0a524.camel@icenowy.me>
 <ff1bf596-83cb-4b3e-a33a-621ac2c8171c@amd.com>
 <b9189c97f7efbaa895198113ee5b47012bd8b4dc.camel@icenowy.me>
 <ae7085fd-3bca-4a4a-b465-5e4941011877@amd.com>
 <fd1d0a97-7075-4936-b58b-e99bab9afc58@app.fastmail.com>
Date: Wed, 03 Jul 2024 16:52:30 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Icenowy Zheng" <uwu@icenowy.me>, "Huang Rui" <ray.huang@amd.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 bhelgaas@google.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: PCIe coherency in spec (was: [RFC PATCH 2/2] drm/ttm: downgrade
 cached to write_combined when snooping not available)
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



=E5=9C=A82024=E5=B9=B47=E6=9C=882=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=E5=
=8D=886:03=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> =E5=9C=A82024=E5=B9=B47=E6=9C=882=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=
=E5=8D=885:27=EF=BC=8CChristian K=C3=B6nig=E5=86=99=E9=81=93=EF=BC=9A
>> Am 02.07.24 um 11:06 schrieb Icenowy Zheng:
>>> [SNIP] However I don't think the definition of the AGP spec could ap=
ply on all
>>> PCI(e) implementations. The AGP spec itself don't apply on
>>> implementations that do not implement AGP (which is the most PCI(e)
>>> implementations today), and it's not in the reference list of the PC=
Ie
>>> spec, so it does no help on this context.=20
>> No, exactly that is not correct.
>>
>> See as I explained the No-Snoop extension to PCIe was created to help=20
>> with AGP support and later merged into the base PCIe specification.
>>
>> So the AGP spec is now part of the PCIe spec.

Hi Bjorn & linux-pci folks,

It seems like we have some disputes on interpretation pf PCIe specificat=
ion.

We are seeking your expertise on the question: Does PCIe specification m=
andate Cache
coherency via snoop?

There are some further context in this thread [1].

[1]:  https://lore.kernel.org/all/0db974d40cd8c5dcc723d43c328bac923e0fe3=
3a.camel@icenowy.me/
Thanks
- Jiaxun

>
> We don't really buy this theory.
>
> Keyword "AGP" doesn't appear in "PCI Express Base 4.0 Base Specificati=
on" even
> once.
>
> If PCIe is a predecessor of AGP, where does AGP specific software inte=
rface like
>  AGP aperture goes? PCIe GPUs are only borrowing software concepts fro=
m AGP,
> but they didn't inherit any hardware properties.
>
> [...]
>> We seem to have a misunderstanding here, this is not a software issue=
.=20
>> The hardware platform is considered broken by the hardware vendor!
>
> It's up to the specification text to define compliance means. So far a=
s=20
> per analysis
> from Icenowy of PCIe specification text itself it's not prohibited.
>
>>
>> In other words people have stitched together hardware in a way which =
is=20
>> not supported by the creator of that hardware.
>>
>> So as long as you can't convince anybody from ARM or the RISC-V team =
or=20
>> whoever created that hardware to confirm that the hardware actually=20
>> works you won't get any support for that.
>
> Well we are trying to support them on our own in mainline, we are not =
asking
> for any support.
>
> Thanks
> - Jiaxun
>>
>> Regards,
>> Christian.
>
> --=20
> - Jiaxun

--=20
- Jiaxun

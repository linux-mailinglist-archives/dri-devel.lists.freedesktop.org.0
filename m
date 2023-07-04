Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05711747541
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 17:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B417F10E2CD;
	Tue,  4 Jul 2023 15:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E523310E2CD;
 Tue,  4 Jul 2023 15:25:11 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0CD3B5C0249;
 Tue,  4 Jul 2023 11:25:11 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Tue, 04 Jul 2023 11:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1688484311; x=1688570711; bh=FXe15dxw2eFgPSPM36BqwI66nkQYl/9quUw
 AMMjIMFE=; b=JvFLQMO5JNMwLSZ/OQFor6bgUfFIJX9OqLmR8ixESZDtO77uACV
 oOerV31F+dAq7gzTumYj1kctdHh5EAkN5+g0T9BSUXQt7g3/eQ97jwONwtcOq0ex
 fQbEcjXwLvyS6oD/yZ6gSIqEJT3nOA6eFx+B7ThNgORgQ2VyJU1RtF8+M7xRUrXQ
 K5W/s/KV8CD4BYEIID/j5ZXrvy28TAksnIU0TBeQ4uiYKeGEbv/DnHcddmF+oOo9
 LwtX/PDSL83az+09o3c57dNul83+nDBezRS0/HMsaHAwJcP4tOQIeWkKf4/xwm3t
 kaMbmXeu4init/ytdnmt7RPj+qZ4Rfsrppg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1688484311; x=1688570711; bh=FXe15dxw2eFgPSPM36BqwI66nkQYl/9quUw
 AMMjIMFE=; b=Czaof1ivS+YXaRXgZUUOXVXVw0pvLLS7gie8KOAZGkreqkin56f
 IhV0gueOTbxKn8BJGhjzndv0Ou7Tc2poh7PlXltQfDJ95sfaOVb3NsMaH/8zCUtI
 ErdQbV7/cOmJuBTzEcTLt1DQD7W/PI18Lxh61fbIEumLhO/nbfJcDMZpZn0YGvzw
 oMbZ1amym4RgQ4NPpzyqsvt7CR4oOZ01tEWhFVRz9bk+iQY1mGPLMc4xo5/4sQxa
 e3JPIv3TJeJyO2IqiiRpDlGcok9mdZ4UwnykbSCsANLXFC4qKR5A3audgoM1fHp+
 m4ML/ID2e/T2it5ylh4lFY83h7jciYvaejQ==
X-ME-Sender: <xms:1jmkZIXzLiWbNhi7lNE_bt6_4633lOU6FyPcIY54IFXtTk-oHGTINg>
 <xme:1jmkZMlJWSDP7T4jFWjJEtJce53kWajG2SJbKpT2X3sFWtvKuuxY5cCjliH5DSpqc
 b9nr0vqW2tWgz2RMj4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeggdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:1jmkZMZY-0gUqmNAwQWxCJaaKujGupPxcKARgQtZj2gkK7hEjXwl4g>
 <xmx:1jmkZHUcMrSC3vG_7ulWPPMhpTQsr2XjE_W1P2ThcBWBfBXdfIJVGw>
 <xmx:1jmkZCkAB62nYF3d4dz6rmsIQli_ObkTEgCpUDro_x7_d3iRMlsniQ>
 <xmx:1zmkZH9mHebHs5kceqG08Jt-G5MHETQ31zyBH8LisgUO3n1XlyryRw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C33BCB60089; Tue,  4 Jul 2023 11:25:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-527-gee7b8d90aa-fm-20230629.001-gee7b8d90
Mime-Version: 1.0
Message-Id: <2dff4d81-9b45-4d69-9e30-972f2c9318d9@app.fastmail.com>
In-Reply-To: <7b55040f-f2d2-372e-cf8a-5ac4a456fdb1@amd.com>
References: <20230703123557.3355657-1-arnd@kernel.org>
 <f4bc3739-3ff1-6fa7-5d7d-890f451315bf@amd.com>
 <788147c6-defd-496a-8174-1571b73d1a71@app.fastmail.com>
 <f1b190cb-3af7-178b-baeb-b59363868779@amd.com>
 <9b03246d-b46e-4b91-968a-e9ffc2fc26db@app.fastmail.com>
 <7b55040f-f2d2-372e-cf8a-5ac4a456fdb1@amd.com>
Date: Tue, 04 Jul 2023 17:24:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Dave Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/amdgpu: avoid integer overflow warning in
 amdgpu_device_resize_fb_bar()
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
Cc: amd-gfx@lists.freedesktop.org,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, dri-devel@lists.freedesktop.org,
 Lijo Lazar <lijo.lazar@amd.com>, linux-kernel@vger.kernel.org,
 Shiwu Zhang <shiwu.zhang@amd.com>, Le Ma <le.ma@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 4, 2023, at 16:51, Christian K=C3=B6nig wrote:
> Am 04.07.23 um 16:31 schrieb Arnd Bergmann:
>> On Tue, Jul 4, 2023, at 14:33, Christian K=C3=B6nig wrote:
>>>
>>> Modern AMD GPUs have 16GiB of local memory (VRAM), making those
>>> accessible to a CPU which can only handle 32bit addresses by resizing
>>> the BAR is impossible to begin with.
>>>
>>> But going a step further even without resizing it is pretty hard to =
get
>>> that hardware working on such an architecture.
>> I'd still like to understand this part better, as we have a lot of
>> arm64 chips with somewhat flawed PCIe implementations, often with
>> a tiny 64-bit memory space, but otherwise probably capable of
>> using a GPU.
>
> Yeah, those are unfortunately very well known to us :(
>
>> What exactly do you expect to happen here?
>>
>> a) Use only part of the VRAM but otherwise work as expected
>> b) Access all of the VRAM, but at a performance cost for
>>     bank switching?
>
> We have tons of x86 systems where we can't resize the BAR (because of=20
> lack of BIOS setup of the root PCIe windows). So bank switching is sti=
ll=20
> perfectly supported.

Ok, good.

> After investigating (which sometimes even includes involving engineers=20
> from ARM) we usually find that those boards doesn't even remotely comp=
ly=20
> to the PCIe specification, both regarding power as well as functional=20
> things like DMA coherency.

Makes sense, the power usage is clearly going to make this
impossible on a lot of boards. I would have expected noncoherent
DMA to be a solvable problem, since that generally works with
all drivers that use the dma-mapping interfaces correctly,
but I understand that drivers/gpu/* often does its own thing
here, which may make that harder.

     Arnd

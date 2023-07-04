Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 196BB747146
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 14:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3CF10E148;
	Tue,  4 Jul 2023 12:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6436110E148;
 Tue,  4 Jul 2023 12:26:34 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id B5DCF5C035D;
 Tue,  4 Jul 2023 08:26:32 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Tue, 04 Jul 2023 08:26:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1688473592; x=1688559992; bh=PyQ6plTYSpz3qzON9fE4kLUBzehylHzFdDq
 XyOgLcvE=; b=W77S1TQLBvy4PGVojukXY3qROfvcIqKfpp/nBKGH7ekWnnc3mac
 GXslhBK60I6NKAMd8sOg2loMZJyYKa5TDtel7hJQv16/1Ue9uuR3oZT5ypG3IoZO
 Q9s9N44TMrGD/mvjXafzgFrFHimoi/WYU7i3cEnqN5qp6FA0oiAiK4khkbzpNdjk
 7tBQ0e2YlV9aGPRlu1OOfvqE54RRqNIdvE7d4V716wCqwjeidPYnXlZM7eZFLXfD
 pua2W+yosiXEx9NkeljVm+f8spE1HBI2XL/aJa5h1PoGxwifAiGCZ7NlxwGHekUu
 mQEjtn+YvQCHl4B7DOOhPWv7aGBeDTaiZEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1688473592; x=1688559992; bh=PyQ6plTYSpz3qzON9fE4kLUBzehylHzFdDq
 XyOgLcvE=; b=IPocYXY7TnafTvok9h1lETy4GCn/FhjYgMijmoCjvkOE3UfIZTk
 UiSNhMXXS3BigYlIwW6RIFE1CpOEphaB1sStCz8s20dG3gRzbZg6UYPdOFi2rAnm
 0Z0mTeJ7zZgj/SKuZbMOA509ImEpZ73TE+W66RENpRF6g0hRInbaoXaCVejO1EY9
 Nw/c2JK+j0yyNyPFEpFx0f2hKv+d6ASTfvg6AduwmwzZ41oG/hN+rXTe58SVvO3q
 svEEAdmR2ON6GaX0y5KkawBi4XdgYS0BT8pGOytMZXdZN0OQaDtUH80Wzjo6CDGh
 aT5J94WDzrb0Jmr0NU1KEzo3LNND+hZxUTw==
X-ME-Sender: <xms:-A-kZAGiH5z4tS9ps_N9F_yGho1DcFLpTElwHhvdo51Y3EHTQaVt6Q>
 <xme:-A-kZJX85mPqrG1j_i6mLFZ6vat0SF_TcP0AsWxh541mujfZ8v2QgXEYVB4OcUOGz
 8L1S-sGYi26NTFXGL4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeggdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:-A-kZKLBAxdDoaIjkb9VkHBZXUaDP5GSWs9DJW0RlYDnzLhw_g-_dQ>
 <xmx:-A-kZCFqzG5BZfZGEk72aIsC9mV8qyyuq2WHqf7kofy3mJGwpCEc3w>
 <xmx:-A-kZGWaEoWiFM3DVnE_pIRVNfvOdunOcWzm3pKBMekHEvvTH1GgSg>
 <xmx:-A-kZHtfA1FxCKncC-yJ6kkYFO3ldXBwf5BNX1MJdRwGbYbVs9hnSg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7578FB60086; Tue,  4 Jul 2023 08:26:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-527-gee7b8d90aa-fm-20230629.001-gee7b8d90
Mime-Version: 1.0
Message-Id: <788147c6-defd-496a-8174-1571b73d1a71@app.fastmail.com>
In-Reply-To: <f4bc3739-3ff1-6fa7-5d7d-890f451315bf@amd.com>
References: <20230703123557.3355657-1-arnd@kernel.org>
 <f4bc3739-3ff1-6fa7-5d7d-890f451315bf@amd.com>
Date: Tue, 04 Jul 2023 14:24:09 +0200
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

On Tue, Jul 4, 2023, at 08:54, Christian K=C3=B6nig wrote:
> Am 03.07.23 um 14:35 schrieb Arnd Bergmann:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> On 32-bit architectures comparing a resource against a value larger t=
han
>> U32_MAX can cause a warning:
>>
>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1344:18: error: result of =
comparison of constant 4294967296 with expression of type 'resource_size=
_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constan=
t-out-of-range-compare]
>>                      res->start > 0x100000000ull)
>>                      ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
>>
>> The compiler is right that this cannot happen in this configuration, =
which
>> is ok, so just add a cast to shut up the warning.
>
> Well it doesn't make sense to compile that driver on systems with only=20
> 32bit phys_addr_t in the first place.

Not sure I understand the specific requirement. Do you mean the entire
amdgpu driver requires 64-bit BAR addressing, or just the bits that
resize the BARs?

> It might be cleaner to just not build the whole driver on such systems=20
> or at least leave out this function.

How about this version? This also addresses the build failure, but
I don't know if this makes any sense:

--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1325,6 +1325,9 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_devi=
ce *adev)
        u16 cmd;
        int r;
=20
+       if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
+               return 0;
+
        /* Bypass for VF */
        if (amdgpu_sriov_vf(adev))
                return 0;

     Arnd

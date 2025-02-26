Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43807A45776
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 09:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2B210E872;
	Wed, 26 Feb 2025 08:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="O/tkTSbO";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Qpxup3rq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 332 seconds by postgrey-1.36 at gabe;
 Wed, 26 Feb 2025 08:01:08 UTC
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9316A10E872
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 08:01:08 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id CF6542540195;
 Wed, 26 Feb 2025 02:55:35 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-11.internal (MEProxy); Wed, 26 Feb 2025 02:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1740556535;
 x=1740642935; bh=0lfVMDjZo5CB8ddhotjizAXW5wzmIW+8vVGHFlSkNxI=; b=
 O/tkTSbOvJV94Iaf6WoPjb4B9fGynObugRnGl0gk773eFW7URrcxdHxm9btKC7nu
 XKHsEXsSqu6oxzkrOyYBG4ZidF/hxSoMi5v2AwYQSEPvXTkI2XtCXj7W6+WiUHxN
 q6lalbT2k5r0tZRiZ1q5Cd6UM6lLLVBSMo+O0uK9Ohvb6NXc7FaE6QY6G/TAhqR4
 1ON31VDxMsDwzfbDyvhc473GfigyWaIK3XkwZAAagUHSGQ1gXxyugbWvdRXMcvEO
 BNldS+9H1PPEJsLhybgJZ/AZJ1lEWv6BBGrm9OouWIn0gMAdueVq73RfeJgzVC7f
 dxYREDp/4nAWdIVvi8kK3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740556535; x=
 1740642935; bh=0lfVMDjZo5CB8ddhotjizAXW5wzmIW+8vVGHFlSkNxI=; b=Q
 pxup3rqqWswG31LJz6phFx5YfQya2XhCculULTr3Vw1mJZI/IgaHzEv4WS1N23m4
 R1W4YGYkg8qIzhdAKkrZxCpLMd16gxh41DeTknNK9d6Oft6v5zbDjHe+n/JBPoX5
 QffjUSDZoUE0dNe5uJ64cLaUR4jlCoftwjseYd+FOMjbLerLrjvE+Vtx//PS/ReH
 zuZcqY8aN5K8tTnBRa5kVBiTecUbFpUwRD+649xFe0FAFXiAtDFJXbFbzT6QbbnO
 yqpOFa7LwBIDhv87QzlmcAMPfRmfNdWUMPQbY4UmiEPtE33edAvHoqa/OWjVwJ+6
 L5gQxNGCramAsOLNdDWSA==
X-ME-Sender: <xms:98i-Z5gp7UUrLdqU8dwrQX3Z2o3uGAYSYhruiGvNtgpc1OW39ryehA>
 <xme:98i-Z-Bhb0nCCncAtPOwR-R9aQMMVOWE-wGzSs99gGHE1esXrBHlwlpmLcj2sfV_g
 wP9VDlTOxnPog1PlPk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgedtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
 tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
 druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
 gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeej
 pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghllhgvrhesghhmgidruggvpd
 hrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhk
 hheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegurhhiqdguvg
 hvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepthii
 ihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehlihhnuhigqdhfsgguvg
 hvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
 vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:98i-Z5FEPMgvJmA8Kh9Pc9mZjD2JMgOwNwChq2VaHhUZ_AlqT14Ttg>
 <xmx:98i-Z-Tj0p_rWAd9G8OsoBIii3ZmSFGy6xgLUI_5X7J7G9byZ7lU_A>
 <xmx:98i-Z2yk_Y9gdeJmWud_qNcV0K64B40UJ_6MhYVZWpbrDVoliIXmwA>
 <xmx:98i-Z06mLu0UM5St6S9XU5ZWOLF7fv7JjZY5ncoZ9EYcZagm2HIo3w>
 <xmx:98i-Z9kk2B_X7E519FNYh5mtDir_cDTr5xUw_srlvnh1X03_63eW3xVy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 409FB2220072; Wed, 26 Feb 2025 02:55:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 26 Feb 2025 08:55:14 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Helge Deller" <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-Id: <a2c0e681-2cdf-4dc9-82fc-be35f54ff795@app.fastmail.com>
In-Reply-To: <4d047af3-fd30-4fa4-aa3d-c0359856d750@suse.de>
References: <20250225164436.56654-1-arnd@kernel.org>
 <4d047af3-fd30-4fa4-aa3d-c0359856d750@suse.de>
Subject: Re: [PATCH 1/3] dummycon: only build module if there are users
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Wed, Feb 26, 2025, at 08:48, Thomas Zimmermann wrote:
> Am 25.02.25 um 17:44 schrieb Arnd Bergmann:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> Dummycon is used as a fallback conswitchp for vgacon and fbcon
>> in the VT code, and there are no references to it if all three
>> are disabled, so just leave it out of the kernel image for
>> configurations without those.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   drivers/video/console/Kconfig | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
>> index bc31db6ef7d2..1c4263c164ce 100644
>> --- a/drivers/video/console/Kconfig
>> +++ b/drivers/video/console/Kconfig
>> @@ -47,8 +47,7 @@ config SGI_NEWPORT_CONSOLE
>>   	  card of your Indy.  Most people say Y here.
>>   
>>   config DUMMY_CONSOLE
>> -	bool
>> -	default y
>> +	def_bool VT || VGA_CONSOLE || FRAMEBUFFER_CONSOLE
>
> What about MDA_CONSOLE and STI_CONSOLE. Don't they require this as fallback?
>

MDA_CONSOLE clearly does not, because that is only the second
console when VGA_CONSOLE is the main one.

For sti_console, I don't see how it would do use it: when CONFIG_VT
is enabled, the line above turns on DUMMY_CONSOLE, but without
CONFIG_VT there seems to be no reference to it after
58a5c67aadde ("parisc/sticon: Always register sticon console
driver"). I also see that CONFIG_STI_CONSOLE is a 'bool' symbol,
so there is no dynamic loading/unloading of the driver.

    Arnd

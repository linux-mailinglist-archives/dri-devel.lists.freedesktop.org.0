Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 535F1A80775
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 14:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9364410E226;
	Tue,  8 Apr 2025 12:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="hA88t/vO";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="favHyVHy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a4-smtp.messagingengine.com
 (flow-a4-smtp.messagingengine.com [103.168.172.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7BA10E226
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 12:37:42 +0000 (UTC)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailflow.phl.internal (Postfix) with ESMTP id 17DEF20014C;
 Tue,  8 Apr 2025 08:37:42 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-12.internal (MEProxy); Tue, 08 Apr 2025 08:37:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1744115862;
 x=1744123062; bh=zFcPiZ2dymYdvLOyrug0agUR+Yq1LwHn6b82n9khMg4=; b=
 hA88t/vObgZNfV8F5NhyBQDmfCG2RNVd3x2W8Zufg5dKOllZq0HmIBVOcD6R36zJ
 dUCUywkMJxl7olxwesgdwzLHVYZfXbO7TxVrBr34ZEZpUkerU1xvSRbkkDSZQ/9n
 ti95kDMNS1ircDu6txuTKq8Hh8VUCvlxep8/3cOOvCP7Q63L2FogRGZ33xdZokde
 PdfcEjksnqVG17B652nC+IhEmQNrFc3YibLlR/x90pUo9x9m0Ts21QdVCVpX/j7U
 636ZLGawOhOkDuGc7S8W9Zmc4MYzQXDQHycgj5wwS0FmTIfNN0KNwgm4ro6pUeZX
 LsT22uPqc5Q1CNOHypTk1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744115862; x=
 1744123062; bh=zFcPiZ2dymYdvLOyrug0agUR+Yq1LwHn6b82n9khMg4=; b=f
 avHyVHyAljzCU9WCVJ7GlxybwygLxx2202W3vZyzfM1hE0yjRO840WBBo4hP3JK2
 r1jKrH5EIHGvxEKWXY4Ig+qnPSSqpTtVGTfy9AGbDze5O8/y/6+v1I/xl+CLdYrK
 aEQf8yAGMssi1yqPB8HPMx1ia4cNhlshdMv9ijgMlpEo2WgQBksdXe5hArDFuaIw
 esnV/cUFAWWwKm4cSMr+F5MisAl5eaHMhTJGxYfxNiE4JMziwW8LaIobdf5PtJYo
 muj3hPmZ1/VVn9ARm6FTGVJN9+VdUdIcK1pYNOfzSn2jD1pfDE2TgwwauKx7EWmd
 RBPRlx9lcMiaCjPpvyLng==
X-ME-Sender: <xms:lBj1Z37JAzdSNf8RJrNISVcmekNoGYtUdhdE1QR9UEGc2QW4tGNGOg>
 <xme:lBj1Z84awh_MckpPiLeuycHQNakSdVuimpyB1mLs-zmVBFHbzFvyCubtMH4eHE4JS
 akJYYWs_HT1xQkMCP4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefuddtucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
 tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
 gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
 fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
 hedtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhgvgigrnhguvghrrdguvg
 hutghhvghrsegrmhgurdgtohhmpdhrtghpthhtoheptghhrhhishhtihgrnhdrkhhovghn
 ihhgsegrmhgurdgtohhmpdhrtghpthhtoheplhhijhhordhlrgiirghrsegrmhgurdgtoh
 hmpdhrtghpthhtohepmhgrrhhiohdrlhhimhhonhgtihgvlhhlohesrghmugdrtghomhdp
 rhgtphhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghroh
 gruggtohhmrdgtohhmpdhrtghpthhtohepiigrtghkrdhruhhsihhnsegsrhhorggutgho
 mhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtg
 hpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehgvggvrhhtodhr
 vghnvghsrghssehglhhiuggvrhdrsggv
X-ME-Proxy: <xmx:lBj1Z-fVAjsZ2IIW4CR__HAOTrryAbYjqVMOrlOZgaW86YnkED3CFw>
 <xmx:lBj1Z4IJOnTETXjr4ynY7WjdTH_esquf0Z5UMtrXw7IIvLP8bg1uYg>
 <xmx:lBj1Z7KcXF2sCvdK7Ff6e9FiI3KbzMJNGznflf86a2Xe4P-8mJ791g>
 <xmx:lBj1ZxxANUYN7ozS0kgUp28zlepO11cm_xgpJdfD8viEjBQpcHAVAQ>
 <xmx:lhj1Z5h2PSWgYdsFLsX0gpRa4lpt3LVHr5UE24EGmNNdcmE4PFSdJj4t>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 5F2962220073; Tue,  8 Apr 2025 08:37:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T702257fbe5397c0b
Date: Tue, 08 Apr 2025 14:37:07 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Bjorn Helgaas" <bhelgaas@google.com>,
 "Jeff Hugo" <jeff.hugo@oss.qualcomm.com>,
 "Carl Vanderlip" <quic_carlv@quicinc.com>,
 "Oded Gabbay" <ogabbay@kernel.org>,
 "Takashi Sakamoto" <o-takashi@sakamocchi.jp>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Dave Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Dave Airlie" <airlied@redhat.com>,
 "Jocelyn Falempe" <jfalempe@redhat.com>,
 "Patrik Jakobsson" <patrik.r.jakobsson@gmail.com>,
 "Xinliang Liu" <xinliang.liu@linaro.org>,
 "Tian Tao" <tiantao6@hisilicon.com>,
 "Xinwei Kong" <kong.kongxinwei@hisilicon.com>,
 "Sumit Semwal" <sumit.semwal@linaro.org>,
 "Yongqin Liu" <yongqin.liu@linaro.org>, "John Stultz" <jstultz@google.com>,
 "Sui Jingfeng" <suijingfeng@loongson.cn>,
 "Lyude Paul" <lyude@redhat.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Gerd Hoffmann" <kraxel@redhat.com>,
 "Zack Rusin" <zack.rusin@broadcom.com>,
 "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>,
 "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Saurav Kashyap" <skashyap@marvell.com>,
 "Javed Hasan" <jhasan@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Nilesh Javali" <njavali@marvell.com>,
 "Manish Rangankar" <mrangankar@marvell.com>,
 "Alex Williamson" <alex.williamson@redhat.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Jani Nikula" <jani.nikula@intel.com>,
 "Mario Limonciello" <mario.limonciello@amd.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Lijo Lazar" <lijo.lazar@amd.com>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, amd-gfx@lists.freedesktop.org,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Netdev <netdev@vger.kernel.org>,
 linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org,
 kvm@vger.kernel.org, "Greg Ungerer" <gerg@linux-m68k.org>
Message-Id: <9abf582c-ea8e-42ca-a6d5-34c1e1932f95@app.fastmail.com>
In-Reply-To: <CAMuHMdWN=wurw7qz0t2ovMkUNu0BJRAMv_0U63Lqs2MGxkVnHw@mail.gmail.com>
References: <20250407104025.3421624-1-arnd@kernel.org>
 <CAMuHMdWN=wurw7qz0t2ovMkUNu0BJRAMv_0U63Lqs2MGxkVnHw@mail.gmail.com>
Subject: Re: [RFC] PCI: add CONFIG_MMU dependency
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

On Tue, Apr 8, 2025, at 12:22, Geert Uytterhoeven wrote:
> On Mon, 7 Apr 2025 at 12:40, Arnd Bergmann <arnd@kernel.org> wrote:
>
>> --- a/drivers/pci/Kconfig
>> +++ b/drivers/pci/Kconfig
>> @@ -21,6 +21,7 @@ config GENERIC_PCI_IOMAP
>>  menuconfig PCI
>>         bool "PCI support"
>>         depends on HAVE_PCI
>> +       depends on MMU
>>         help
>>           This option enables support for the PCI local bus, including
>>           support for PCI-X and the foundations for PCI Express support.
>
> While having an MMU is a hardware feature, I consider disabling MMU
> support software configuration.  So this change prevents people from
> disabling MMU support on a system that has both a PCI bus and an MMU.
> But other people may not agree, or care?

I created this patch after Greg said that the coldfire-v4 chips
that have an MMU are not really used without it any more, and
I had accidentally only build tested a patch without CONFIG_MMU.

On ARM, CONFIG_MMU can no longer be disabled on CPUs that have
one, this was a side-effect of the ARCH_MULTIPLATFORM conversion.

I just tried building an SH7751 kernel with MMU disabled but PCI
enable. This produces build errors in several files, clearly nobody
has tried this in a long time.

I'm not entirely sure about xtensa, but it seems that PCI is
only supported on the "virt" platform, which in turn cannot
turn off MMU, even if there are other platforms that can build
with out without MMU enabled.

     Arnd

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6159F56E5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 20:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0075C10E1E9;
	Tue, 17 Dec 2024 19:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="oHs+EN/w";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="PriIJ7/U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEAB10E1E9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 19:29:23 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.stl.internal (Postfix) with ESMTP id B90281140144;
 Tue, 17 Dec 2024 14:29:21 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-10.internal (MEProxy); Tue, 17 Dec 2024 14:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1734463761;
 x=1734550161; bh=gMseNZNPSKFxJaH52MhNYv4Q86NGs0EvCbKI1ygQlgY=; b=
 oHs+EN/wnTYz/zdS/P6Pux4B8C9UP65fzT5Pbqi7X9a/zcWNnAWP1hFo7ML8vvAK
 +Cgk7jWCYKIeGo4vejGNkFYMRXzfVsDgZWFq62W1ZR162SnpXDoX0OgjIHAZpA2W
 upw9bk5xcn2drcep6aedlqYH5zXWnpw8yLBiTe8YNS3sCcHAILaQOpr/ndapU/gD
 UYVo/pDTsXeuLgqEa5FASxQNJT0puwY05V78Qs+iffdAwzSZs4gz/aVeiLCld5or
 TJ4V9Iz8G9wvt2c2y8xOce/3UKbXttgBVKKhe7TLWfDPm2A31p0yzSWtMQJALSPK
 HlGJoTd95P6a9P476xijkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734463761; x=
 1734550161; bh=gMseNZNPSKFxJaH52MhNYv4Q86NGs0EvCbKI1ygQlgY=; b=P
 riIJ7/UZmyuEFA9ydNuYx1yFt9E1F/4cFXu2i81IPqLz/EYnmRSNn7ZyNWAvgWZR
 O3Wj4O1N/yXMS3K34vUOET1pJUQNVts7l+seT81Aq6OXfQhWmEENRq5x7SoQt4sh
 0bdnQq07WArGMPAdkUArW7L9RBNIUFZ2MNu8Pxe0LcgjhXNf3nOVyGV9UqPClVdO
 B4JhOGPR3WSmavYsGDQ1CaY2grQQAcvuozuvFAhLUUig2ghksZ8phSIWNdp9b8/q
 l3PQq0aswcToufFHkY0UN2nXEcHY8yAHF578sa815qoEZAiquG0U9wVpMe2O4/GJ
 KixbEXBNVhNX4no98O28A==
X-ME-Sender: <xms:ENFhZwCzv-JHsn0OW2ib4yCWpVX_fYbAw5MIQq80dWJQjEsf6WHNZg>
 <xme:ENFhZyhTZxJ2e5x0DiFgh9I-qYwMfmjzP5vmzATaNUtc8OLKj6y3gBxJwIAHqFxoP
 PvPy7Fd-V2xPtAuxEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleehgdduvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
 necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
 guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
 gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddt
 pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtg
 hhpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgt
 phhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgrnhhird
 hnihhkuhhlrgesihhnthgvlhdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghr
 tghhihesihhnthgvlhdrtghomhdprhgtphhtthhopehmihgthhgrvghlrdhjrdhruhhhlh
 esihhnthgvlhdrtghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgv
 lhdrtghomhdprhgtphhtthhopehtvghjrghsrdhuphgrughhhigrhiesihhnthgvlhdrtg
 homhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ENFhZzmw9Pp46Nd_HH2uwK9xCMypIWcFdv3fitDg0jd3c27AFtrIQw>
 <xmx:ENFhZ2yq8dc_JJEpWDE6gziITRCWW6AzBwdh7Q3PmbTe8cVx3jnOSQ>
 <xmx:ENFhZ1Rc1hChuGmVnqlrbX38-ER01oKy_i0y9MP03HgMqAWxDKBIMA>
 <xmx:ENFhZxZkjzizL7h40UVjN63QaCMNh3v8v67CvqrTcNl3bC7BKGwxVw>
 <xmx:EdFhZ3nu5wOgHKY_SknrnHMuL7OFl3l_8F9lCCNBzx7oVDMMnAKTu4Nu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 9BE372220073; Tue, 17 Dec 2024 14:29:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 17 Dec 2024 20:28:59 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>, michael.j.ruhl@intel.com,
 "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>, 
 "Simona Vetter" <simona@ffwll.ch>,
 "David E. Box" <david.e.box@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Jani Nikula" <jani.nikula@intel.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Tejas Upadhyay" <tejas.upadhyay@intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-Id: <36bae0e6-9153-4cb4-9c85-8a582a47044b@app.fastmail.com>
In-Reply-To: <Z2HIW4c-S_IA9bWb@intel.com>
References: <20241217071852.2261858-1-arnd@kernel.org>
 <Z2HIW4c-S_IA9bWb@intel.com>
Subject: Re: [PATCH] drm/xe/vsec: enforce CONFIG_INTEL_VSEC dependency
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

On Tue, Dec 17, 2024, at 19:52, Rodrigo Vivi wrote:
> On Tue, Dec 17, 2024 at 08:18:44AM +0100, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> When INTEL_VSEC is in a loadable module, XE cannot be built-in any more:
>> 
>> x86_64-linux-ld: vmlinux.o: in function `xe_vsec_init':
>> (.text+0x19861bf): undefined reference to `intel_vsec_register'
>> 
>> This could be enforced using a 'depends on INTEL_VSEC || !INTEL_VSEC'
>> style dependency to allow building with VSEC completely disabled.
>> My impression here is that this was not actually intended, and that
>> continuing to support that combination would lead to more build bugs.
>> 
>> Instead, make it a hard dependency as all other INTEL_VSEC users are,
>> and remove the inline stub alternative. This leads to a dependency
>> on CONFIG_X86_PLATFORM_DEVICES, so the 'select' has to be removed
>> to avoid a circular dependency.
>> 
>
> I really don't want us to hard lock this X86 dependency here.
> What if we add a new DRM_XE_DGFX_PMT_SUPPORT and that
> depends on INTEL_VSEC ?

Yes, that should work if it gets phrased correctly.
Something like

config DRM_XE_DGFX_PMT_SUPPORT
       bool "X86 PMT support"
       depends on DRM_XE && INTEL_VSEC
       depends on DRM_XE=m || INTEL_VSEC=y
       depends on X86 || COMPILE_TEST



     Arnd

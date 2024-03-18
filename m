Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB17B87EBD6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 16:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94BE10F946;
	Mon, 18 Mar 2024 15:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dev-mail.net header.i=@dev-mail.net header.b="P00QPqRh";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="eKp1ngIM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 371 seconds by postgrey-1.36 at gabe;
 Mon, 18 Mar 2024 15:16:21 UTC
Received: from fhigh8-smtp.messagingengine.com
 (fhigh8-smtp.messagingengine.com [103.168.172.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE54210F946
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 15:16:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 57D3C114013B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 11:10:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Mar 2024 11:10:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dev-mail.net; h=
 cc:content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:reply-to
 :subject:subject:to:to; s=fm1; t=1710774609; x=1710861009; bh=uz
 6Ymu/YKfn5J8N2BdpVvlonBqObOR6ZXdVp14vF/bk=; b=P00QPqRhRYUthSh5zd
 6wgtg46bT+1vl4TLhiQJfahqYOU7XvvPLt0PIdZGy5QGfiOiYPDFsapyRweCii8B
 PFjOYf6H7pklJqLiyRGVN7QYY2mk0TAb53Jm/tuu21G/UBuXjSWo2AxH/YbdX7HL
 teub9Oto1Fl0uwA/iOCeIRXjGIqpmL+EoiobNyS1xYgNEszx6tHK7kwotqRokq6B
 Iya05OuUie1k7hA2MfPC11zgjw/s1k1KNcUq9JC8KGuPAIDahHa32Of6513b59fN
 CfpF5JYNqXm2wOwkNbKMpxZCNqswhwEZvoitW9oFTHfuU+u7MViNW/td3X7vJnPB
 bT/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1710774609; x=1710861009; bh=uz6Ymu/YKfn5J
 8N2BdpVvlonBqObOR6ZXdVp14vF/bk=; b=eKp1ngIMEIBAk7yHfyN5HlRy56vaT
 cP/DPhKfMuGcw9n4U8h8ON6VLJeO+zSILaLkJqCL4DrekRAf/seKOUyfdcw2QfRC
 JepyWfjeB1dZtyIvLk4GzY1gJKR1JN13+lEJ3YWf7/MebDRtxmPaOKY6AsZcYOko
 nBcuAlPRZrln3deTLjUNqYRGc/+0HF+eK5xEd12Y0NeZQC40uysYAwjTwGpWy+wU
 KlvhUnxkUN34FyySM42vIf5n5p+JgVwE7MPWO5fXExaYOB01kjHTKYCT6zppvTtg
 rLp8Cqj77r6ex5JVX1Bd0H0/CmpwitHPf71dqVLSnPJb7OPMwzpUugqKQ==
X-ME-Sender: <xms:UVn4ZRT2Cwb1VVh-nO-dMqQa34VTiFsdKRGPdEk-rFyhDIhQIoofFg>
 <xme:UVn4Zazak8xqayCmrVN_QSvyHs1p9yf4UHuZVTgztTO514273kK1e5SfzOUH0qzNA
 D9WSZ_P2CDf_kz->
X-ME-Received: <xmr:UVn4ZW37Wqc3LK2YtaPtHGBo-JDf6ce0cAy0eS06-LfPDxuY3idn9Rq_sNhroQWpvVIL-lMoW7p5sGvP4PHnr59WTKkO1Mc2OmJ4cw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrkeejgdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepkfffgggfrhfhvffutgfgsehtjeertd
 dtvdejnecuhfhrohhmpehpghhnugcuoehpghhnugesuggvvhdqmhgrihhlrdhnvghtqeen
 ucggtffrrghtthgvrhhnpeelffekkeefudeigeegvedvgeeifffhvdduvedtieehtefhgf
 dtueejgfeffeeuudenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphhgnhguseguvghvqdhmrg
 hilhdrnhgvth
X-ME-Proxy: <xmx:UVn4ZZBnAJM2Zuv9HnFJwUR6DzGpRqKEy8KlYdPFy8i67N0rBFIzrg>
 <xmx:UVn4Zag8O4k1WGctCAodveBsBChtW8FvvOtxM-DJNFYKD2bZYsNM-A>
 <xmx:UVn4ZdpffsJNX3rJluIF7BXMKibpbfJCYzDMEl4PFp-8BXGklWekdQ>
 <xmx:UVn4ZVg9gjWbsncCLekZF9yJYwvjh9KMEN3oBF5jlYVDKUHpKRlb1w>
 <xmx:UVn4ZcZDUJh3tFtJfrvwLrrNplBqSYsRLWhDCxhoyYjNNy7AKJI1lw>
Feedback-ID: if6e94526:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <dri-devel@lists.freedesktop.org>; Mon,
 18 Mar 2024 11:10:08 -0400 (EDT)
Message-ID: <bfd797f5-7078-4834-90e4-784c7dc2beea@dev-mail.net>
Date: Mon, 18 Mar 2024 11:10:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: pgnd <pgnd@dev-mail.net>
Content-Language: en-US, fr, de-DE, pl, es-ES
To: dri-devel@lists.freedesktop.org
Subject: vga hang on post, ok after 'reset', with kernel 6.7.9 + intel i915 +
 wayland drm . bug?
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: pgnd@dev-mail.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi,

i run release

	Fedora 39
	KDE 5x / wayland drm

with kernel

	6.7.9-200.fc39.x86_64 x86_64

on

	ASUS PRIME X570-PRO motherboard, BIOS v5003
	AMD Ryzen 7 3700X 8-Core Processor

i've a

	DELL U2722D monitor
		BIOS vMT3102
		connector is card1-HDMI-A-2
		DDC/CI is enabled

i've installed

	Intel Arc A380

from clean BIOS install, it boots fine -- gfxcard's identified, no apparent errors in system boot, & all appears to function on desktop.

on system reboot -- via e.g., `shutdown -r now` -- the system reboots, with no logged errors.
the Monitor displays "No HDMI signal detected", and drops into "Standby" mode.

on BIOS post, the system hangs
the white q-led (vga) is on; boot proceeds no further.

simply hitting 'reset' button re-posts, and the system boots. no hang, no errors.

this is 100% reproducible.

i've done the usual dance of,

	replace the video card
	swap video slots
	reinstall both current & previous BIOS versions
	reset CMOS
	remove/reseat all cards, RAM

nothing, so far, fixes the hang on post, with immediate success after 'reset' behavior
	
without any solid proof yet, i suspect power management (DPMS?) is involved ...

here's the current dump of (lots) system info, etc.

	https://gist.github.com/pgnd/9209983f5ca478b06bd5055188567f19

what further diagnostics/fixes are helpful/relevant here?

if this isn't the right forum, kindly point?

thx o/

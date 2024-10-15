Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A6999F151
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 17:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A34010E5AC;
	Tue, 15 Oct 2024 15:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="kK96T0r8";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="QsDLUsDZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDB210E5AC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 15:35:02 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.phl.internal (Postfix) with ESMTP id 98CA31380211;
 Tue, 15 Oct 2024 11:35:01 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-10.internal (MEProxy); Tue, 15 Oct 2024 11:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1729006501;
 x=1729092901; bh=4HXXXPsyaxavdVR1EisJ5bQc5ynj0wcNlMTAGsD4Pzs=; b=
 kK96T0r8kqYicTw4W6qvfBT+cYlWKFhwrCTSGpYLAFeFZ4xgj/odr878U0jZhJQL
 v8PhAirirnS7LSvhGjUfp+310XH1MuSPE8RdsnkTAVXo/xTRLBTtHPhlS/3QZ64B
 kkeky0owSOoZ5jfAU/mTrRs2NMr3YIBRROmBrvkNFNUd7CiHRTp3PTvz/KwBMyYe
 YQSYj5L0FEeZuPJclczW1y9S4I7Uh0oqTqtXGgnhwvsLQM7WJDhZzWl4HPHAPurM
 RHyNcVI1CSlopi0gO8hqA5+Iyd2M/bN2xIJOXu8aFCWRX9zB7kCY9eaanLK8dx2K
 tBgvrOSunpQmC/E5j6UKOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1729006501; x=
 1729092901; bh=4HXXXPsyaxavdVR1EisJ5bQc5ynj0wcNlMTAGsD4Pzs=; b=Q
 sDLUsDZ/1dZcyBaMtC7CzfyWnMI5JW4UhI2ExqdkFsFMRf+jzJE2o59l71C/B/qq
 PGTVbtIGSwG9czYbDUxBi/fj9ilHQWt8Oh3tX5ma7mQccM+cAWRCDhG2GGzkp5ay
 bGWGAw0ObUY6duqy8w7W4mnhGSHwCxHZVj7lyLbSQjMdOgm39AEpg4hxRQMysHWS
 H86rUVd1pvaK5cZDcki7BpUIJ5t1+l76GBMMmB56+E1L1WF2r4qNZPxibqi5IJ8C
 1U+0qi6+PahsUuuNqK0nibEMLUTm6DJcxWsPG8uCJQFsdudzRyYWrCtqJhbcXPCV
 vp6eWKm/E9s6dRhLAoRag==
X-ME-Sender: <xms:pYsOZ74lvLtGr8eX9g6L2YUAKtVeSmf0mydMIbCOY_xPAPziZAjlXA>
 <xme:pYsOZw7iItAymH8EGDPGR-cT5TNNnD83_tUBHBeDpZTci62UW58EnyqrCejY3HZIZ
 LlT5znIbDU5m6sPQis>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegjedgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
 necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
 guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
 gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudef
 pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtg
 hhpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegu
 shgrnhhkohhushhkihesghhmrghilhdrtghomhdprhgtphhtthhopehruhgrnhhjihhnjh
 hivgeshhhurgifvghirdgtohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhr
 ghdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhope
 gumhhithhrhidrsggrrhihshhhkhhovheslhhinhgrrhhordhorhhgpdhrtghpthhtohep
 nhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehmrg
 grrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:pYsOZycsO3ZPxkZi2C2FwqGgcVPjgDDwF94nyLs4VbwdOOTFh5VQUQ>
 <xmx:pYsOZ8JCtEsR14EiSLGYaiYXp5rrab0NFh3zfD8WSL9AufKn-AfLTg>
 <xmx:pYsOZ_J81jJSUQdO8yQZByfnEDJYJoW_4UWNshb6Tc4YbhMZe-ocfw>
 <xmx:pYsOZ1w7k-VOU39qI6ny1j2wjYfv9bcaNbyF3F6Ok8S4BRzymPT0Xg>
 <xmx:pYsOZ5DQZb_4JJ6OenA6-Xntac46Eii2WHJYO-0aKyoSNcfU-87a_ZfW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id E3CAF2220071; Tue, 15 Oct 2024 11:35:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 15 Oct 2024 15:34:33 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ruan Jinjie" <ruanjinjie@huawei.com>, "Arnd Bergmann" <arnd@kernel.org>, 
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>, 
 "Simona Vetter" <simona@ffwll.ch>, "Dzmitry Sankouski" <dsankouski@gmail.com>
Cc: "Jessica Zhang" <quic_jesszhan@quicinc.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-Id: <b0b7a36e-0327-4ee0-ac03-7aef6b4f4e87@app.fastmail.com>
In-Reply-To: <d32b15fa-3b4b-d0ef-ade3-dda44e4abc4d@huawei.com>
References: <20241015073115.4128727-1-arnd@kernel.org>
 <d32b15fa-3b4b-d0ef-ade3-dda44e4abc4d@huawei.com>
Subject: Re: [PATCH] drm/panel: s6e3ha8: select CONFIG_DRM_DISPLAY_DSC_HELPER
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

On Tue, Oct 15, 2024, at 07:52, Jinjie Ruan wrote:
> On 2024/10/15 15:30, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The new driver needs the dsc helper code to be available:
>> 
>> x86_64-linux-ld: vmlinux.o: in function `s6e3ha8_amb577px01_wqhd_prepare':
>> panel-samsung-s6e3ha8.c:(.text+0x16b1e65): undefined reference to `drm_dsc_pps_payload_pack'
>> 
>> Select it from Kconfig as we do for other similar drivers.
>> 
>> Fixes: 779679d3c164 ("drm/panel: Add support for S6E3HA8 panel driver")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  drivers/gpu/drm/panel/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
>> index ddfaa99ea9dd..ffe7eff71496 100644
>> --- a/drivers/gpu/drm/panel/Kconfig
>> +++ b/drivers/gpu/drm/panel/Kconfig
>> @@ -626,6 +626,7 @@ config DRM_PANEL_SAMSUNG_AMS639RQ08
>>  config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
>>  	tristate "Samsung AMS452EF01 panel with S6E88A0 DSI video mode controller"
>>  	depends on OF
>> +	select DRM_DISPLAY_DSC_HELPER
>
> It seems that it uses DRM_DISPLAY_DP_HELPER in mainline but use
> DRM_DISPLAY_DSC_HELPER in next.
>

I think I made a mistake during rebasing and ended up having
the 'select' under the wrong Kconfig symbol.

The new driver DRM_PANEL_SAMSUNG_S6E3HA8 was only added in
linux-next and does not exist in mainline yet.

Sending a new version now.

      Arnd

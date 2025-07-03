Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811EFAF7D64
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 18:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E259710E8A0;
	Thu,  3 Jul 2025 16:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SqNYAzL+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8556310E8A0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 16:09:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9994941C7B;
 Thu,  3 Jul 2025 16:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751558979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4nSERSeA7C0DLENpf6HUi5tGEKPv7HPliI4tgs5ohhg=;
 b=SqNYAzL+Q7AM3d+vcwsFu0JIBYCvQm4WsN5x4lq5U4t3eeToTDHnfqRsSsbTD7/U40uizF
 vCjiHpTrHt9GuHxJZTdfMyil/F5xrANR3NH1v3eTxZwdEQTzRSPpt6ps4bTA+0Htjc5GsU
 KjudJiPXw1xL+litVuonQYF3hiZfQ8C+JuowYqq/Nvfbqsuw+oc0FW01Mk8qy7/ry7E4Pv
 CET/6KpZ7u9h/2n1W+QVRteBAEtTrTRljbFtGkjL5RqCvE0CoaDIZi7lHvIt3UlS71X8NW
 2OP/Aicwy91bKkqlft3KfvcnZoQx6J2HSkWYbbUmJnWS37ZEm/Khd5jk906/zQ==
Date: Thu, 3 Jul 2025 18:09:24 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Colin King (gmail)" <colin.i.king@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API
Message-ID: <20250703180924.55aa0fb0@booty>
In-Reply-To: <056b34c3-c1ea-4b8c-9672-c98903ffd012@gmail.com>
References: <056b34c3-c1ea-4b8c-9672-c98903ffd012@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphephedurddujeelrddutdefrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeehuddrudejledruddtfedrheehpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheptgholhhinhdrihdrkhhinhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughmihhtrhihrdgsrghrhihshhhkohhvsehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvr
 hdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Colin,

sorry for the late reply (vacation time).

On Wed, 2 Jul 2025 10:41:52 +0100
"Colin King (gmail)" <colin.i.king@gmail.com> wrote:

> Hi,
> 
> I believe there is a regression in linux-next caused by the following 
> commit:
> 
> commit a59a271769149f0b8258507276f3d2a24370cbdb
> Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Date:   Wed May 28 11:29:36 2025 +0200
> 
>      drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API
> 
> 
> the issue is as follows:
> 
> static int tc_probe_bridge_endpoint(struct tc_data *tc, enum tc_mode mode)
> {
>          struct device *dev = tc->dev;
>          struct of_endpoint endpoint;
>          struct device_node *node = NULL;
> 
>          for_each_endpoint_of_node(dev->of_node, node) {

Well spotted! I wonder why this was not caught by my spatch runs.

I think there should be an extra line here:

   of_graph_parse_endpoint(node, &endpoint);

>                  if (endpoint.port == 2) {
> 			...
> 			...
> 
> The check for endpoint.port == 2 is checking an uninitialized field in 
> the uninitialized structure endpoint. The code before this commit called 
>   of_graph_parse_endpoint(node, &endpoint) to fetch endpoint and now 
> this seems to be missing.

As the commit message states, with this patch we are iterating over the
endpoints twice. However when iterating twice we need to parse the
endpoints twice as well.

I'm double checking this before sending a fix.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3310EA231B4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 17:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD79610E372;
	Thu, 30 Jan 2025 16:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ANNQz8Ag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A8F10E9B9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 16:24:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38D744429C;
 Thu, 30 Jan 2025 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738254262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/ZqZ36OzhJ4i8+pmOxeF05UNwEx+qzzzPorR3nI48rY=;
 b=ANNQz8AglqwVDRFfCOC73xXWmVx6iGFIY69HO2/NAVW25DoLjlEu8bRdiIDXsrHuW8KV4z
 GhQcSEgcEEKLNkyW8Lqa/gpUzcnN8vU1n3n+jRTY7m697FmMQtf3yKfz3wxVvUc8J3NbqR
 /aZ4qdJRxJ9g0J239LchQ9qOuLkO7Vf6ZiUkKUH4qw6BvthOeyPigxOwlHHjjugsIYGWCK
 Y1IXInYsrGwdp8x9Tk50WT+q+j7MgxiCEnkuvtoQCnvntLNrHuDd5RVdGo/WB2Ax0T6KlO
 CWHWUcfF2/bG9otxOoxdiFesJjYWZ0Nd3/XhMwC2/C0JIH4IJQTPxz+v2wzeZg==
Date: Thu, 30 Jan 2025 17:24:19 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Paz Zcharya <pazz@chromium.org>
Cc: David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Sean Paul <seanpaul@google.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Drew Davenport <ddavenport@google.com>,
 linux-kernel@vger.kernel.org, Paz Zcharya <pazz@google.com>
Subject: Re: [PATCH v2] drm/vkms: Add support for ABGR8888 pixel format
Message-ID: <Z5uns4Fi0ucdZXi-@louis-chauvet-laptop>
Mail-Followup-To: Paz Zcharya <pazz@chromium.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sean Paul <seanpaul@google.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Drew Davenport <ddavenport@google.com>,
 linux-kernel@vger.kernel.org, Paz Zcharya <pazz@google.com>
References: <20250129142238.562999-1-pazz@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129142238.562999-1-pazz@google.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeivdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfefhffggfefleevkedvjeefudefgeffvdekieelueehtdfhgeejieekheehueeknecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehprgiiiiestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgm
 hgrihhlrdgtohhmpdhrtghpthhtohepshgvrghnphgruhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthh
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 29/01/25 - 14:20, Paz Zcharya wrote:
> From: Paz Zcharya <pazz@chromium.org>
> 
> Add support for pixel format ABGR8888, which is the default format
> on Android devices. This will allow us to use VKMS as the default
> display driver in Android Emulator (Cuttlefish) and increase VKMS
> adoption.
> 
> Signed-off-by: Paz Zcharya <pazz@chromium.org>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

Thanks,
Louis Chauvet

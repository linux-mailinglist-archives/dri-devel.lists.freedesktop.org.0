Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416A7A273BC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64E210E34A;
	Tue,  4 Feb 2025 14:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kk6lWmFr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9235710E34A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 14:01:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40C7444354;
 Tue,  4 Feb 2025 14:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738677699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iV4HY43D8YBDInRkLNtBLtXbejuJfcBIR7X4fw6b3qQ=;
 b=kk6lWmFrL6INz6asbRE7U5HpPN8DccYIWFuLRhxJQoF/2gqmvYqCvHf9D9JvuPpJc767k+
 JEROg1nvKqhM7Dn7I+j9ok8C3DqBrVub+VPhilWGZP+7tslQ4mhX4JVsY7OAwXcugkMxBt
 9QshQhPDtlyZmz246kVi/bDUARsaRZLurjcQxn3TXvFo9MiHHpPuRufwlWBFRczgWJWLTP
 Eth3FKOmZQvfp9ysta8BQHLQaXKpWHR2N+bZzA1qmXWdEi+nAngWSY/ybezlu6Qw6j1Al+
 YoaG0YT1URtGK8CnesgnhDk4fsqlAX1M0yFpsqbP9V7DC2EMPYTQAvtesji7aQ==
Date: Tue, 4 Feb 2025 15:01:36 +0100
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
Message-ID: <Z6IdwJmRDKD8TUiT@louis-chauvet-laptop>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhfefhgffgfeelveekvdejfedufeegffdvkeeileeuhedthfegjeeikeehheeukeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepphgriiiisegthhhrohhmihhumhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesg
 hhmrghilhdrtghomhdprhgtphhtthhopehsvggrnhhprghulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghh
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

Applied on drm-misc-next, thanks.

Louis Chauvet

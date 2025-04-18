Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4BFA9407A
	for <lists+dri-devel@lfdr.de>; Sat, 19 Apr 2025 01:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CABE10E438;
	Fri, 18 Apr 2025 23:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J8D7Ijsy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1B610E437;
 Fri, 18 Apr 2025 23:52:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6D446A4B659;
 Fri, 18 Apr 2025 23:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77690C4CEE2;
 Fri, 18 Apr 2025 23:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745020318;
 bh=wLPohTXGJoWF6jYaqWx8ve/2ZkRtBlSg3hR6/76xmgQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J8D7Ijsy0qGDz3jclp8CIAWOAySfgRsIfiJV8hl6byKyn8/wmiDBAUt56cga94/KY
 bVC6ZLpkjUyF7VVbwVaMxUvVuw5oNJpxM60tAWGd8j7mbDM3To16egN2ZvBE5J3Sxj
 u2nJe1b/Ig1SFrBzkfXIX8B0L6cXJBXDoRRbi30AO8FG6Tsjs2061GjMpjJyvgNc+R
 pgGOnkAtychBl+BNoda9QGbmO+xOsB0R2OEY+CmSTrafq9aXaUlnavl4NH56S4Vzmv
 eAfg9P/IKwQiEASwUshViSDppakdmJzlYaPUXaIUOm8QLmQm3HMjh2KUSkFQPfsbB9
 9H9zgZAQl+79A==
Date: Sat, 19 Apr 2025 07:51:41 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, David Airlie
 <airlied@gmail.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <20250419075141.720970a8@sal.lan>
In-Reply-To: <Z_97SbBwVp29MNzL@smile.fi.intel.com>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
 <4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
 <87tt6opks7.fsf@intel.com> <20250416171917.0985c0eb@sal.lan>
 <20250416172901.60104103@sal.lan> <20250416173811.71c3c345@sal.lan>
 <Z_97SbBwVp29MNzL@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Hi Andy,

Em Wed, 16 Apr 2025 12:41:29 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> escreveu:

> On Wed, Apr 16, 2025 at 05:38:11PM +0800, Mauro Carvalho Chehab wrote:
> > Em Wed, 16 Apr 2025 17:29:01 +0800
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:  
> 
> ...
> 
> > Heh, trying to quickly write a patch before calling it a day is
> > usually not a good idea ;-)
> > 
> > I'll send a fix tomorrow.  
> 
> Take your time, we still have a couple or so weeks to address this.

Sent a v3. Please check.

Regards,
Mauro

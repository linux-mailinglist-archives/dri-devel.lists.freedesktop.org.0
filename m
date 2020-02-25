Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3991016BBCE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102D26EA07;
	Tue, 25 Feb 2020 08:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 398 seconds by postgrey-1.36 at gabe;
 Tue, 25 Feb 2020 08:24:52 UTC
Received: from mx.blih.net (mx.blih.net [212.83.155.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB526EA07
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 08:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bidouilliste.com;
 s=mx; t=1582618691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C0tcNFyVSsvx4uBxNJ3TEZd+6Xexrm+/hZD6rEjDx54=;
 b=O2bTX0JNfY45haLEpKC8/F3DIkMGLDTYBe/RcW0POYHl+h+maQ8bCqBeDPIrFCD1YUQYeQ
 DCX/9dT0oiOxiWL6fmcofK8pJ4R+hzW/RvA59osWcks6awF07oxBWm2cWEUitxK3tH5rdp
 dfmTukNqQCSoyrGJCHLIr9Lr4l09ON0=
Received: from tails.home (lfbn-idf2-1-900-181.w86-238.abo.wanadoo.fr
 [86.238.131.181]) by mx.blih.net (OpenSMTPD) with ESMTPSA id d2c06a04
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 25 Feb 2020 08:18:11 +0000 (UTC)
Date: Tue, 25 Feb 2020 09:18:10 +0100
From: Emmanuel Vadot <manu@bidouilliste.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH v2 1/2] drm/client: Dual licence the file in GPL-2 and MIT
Message-Id: <20200225091810.1de39ea4e0d578d363420412@bidouilliste.com>
In-Reply-To: <158254443806.15220.5582277260130009235@skylake-alporthouse-com>
References: <20200215180911.18299-1-manu@FreeBSD.org>
 <20200215180911.18299-2-manu@FreeBSD.org>
 <877e0n66qi.fsf@intel.com>
 <158254443806.15220.5582277260130009235@skylake-alporthouse-com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; amd64-portbld-freebsd13.0)
Mime-Version: 1.0
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
Cc: tzimmermann@suse.de, Jani Nikula <jani.nikula@intel.com>,
 linux-kernel@vger.kernel.org, efremov@linux.com,
 Emmanuel Vadot <manu@FreeBSD.Org>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org, kraxel@redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 Feb 2020 11:40:38 +0000
Chris Wilson <chris@chris-wilson.co.uk> wrote:

> Quoting Jani Nikula (2020-02-15 18:33:09)
> > On Sat, 15 Feb 2020, Emmanuel Vadot <manu@FreeBSD.org> wrote:
> > > From: Emmanuel Vadot <manu@FreeBSD.Org>
> > >
> > > Contributors for this file are :
> > > Chris Wilson <chris@chris-wilson.co.uk>
> > > Denis Efremov <efremov@linux.com>
> > > Jani Nikula <jani.nikula@intel.com>
> > > Maxime Ripard <mripard@kernel.org>
> > > Noralf Tr=F8nnes <noralf@tronnes.org>
> > > Sam Ravnborg <sam@ravnborg.org>
> > > Thomas Zimmermann <tzimmermann@suse.de>
> > >
> > > Signed-off-by: Emmanuel Vadot <manu@FreeBSD.org>
> > =

> > I've only converted some logging.
> > =

> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> =

> Bonus ack from another Intel employee to cover all Intel copyright in
> this file,
> Acked-by: Chris Wilson <chris@chris-wilson.co.uk>
> -Chris

 Thanks Chris,

 Daniel, if I'm counting right this was the last ack needed.

-- =

Emmanuel Vadot <manu@bidouilliste.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

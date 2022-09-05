Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25435ACFB2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD41910E160;
	Mon,  5 Sep 2022 10:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 346 seconds by postgrey-1.36 at gabe;
 Mon, 05 Sep 2022 10:11:10 UTC
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com
 [216.40.44.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402A110E160
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 10:11:10 +0000 (UTC)
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay05.hostedemail.com (Postfix) with ESMTP id A354C413D5;
 Mon,  5 Sep 2022 10:05:22 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf08.hostedemail.com (Postfix) with ESMTPA id 0270E2002B; 
 Mon,  5 Sep 2022 10:05:20 +0000 (UTC)
Message-ID: <4675b119b6eafbe377711530cb55bd638b0077b5.camel@perches.com>
Subject: Re: [PATCH] drm/print: cleanup coding style in drm_print.h
From: Joe Perches <joe@perches.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Jingyu Wang
 <jingyuwang_vip@163.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org,  tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Date: Mon, 05 Sep 2022 03:05:19 -0700
In-Reply-To: <87sfl6b3zb.fsf@intel.com>
References: <20220904203818.16775-1-jingyuwang_vip@163.com>
 <87wnaib45t.fsf@intel.com> <87sfl6b3zb.fsf@intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 0270E2002B
X-Spam-Status: No, score=3.60
X-Stat-Signature: cpg13saw4t9ky9idep3d5zibos8uaptq
X-Rspamd-Server: rspamout05
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+IQgrovGfGS21oh82wDTPVfuzC1VIMDyY=
X-HE-Tag: 1662372320-471312
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-09-05 at 11:49 +0300, Jani Nikula wrote:
> On Mon, 05 Sep 2022, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Mon, 05 Sep 2022, Jingyu Wang <jingyuwang_vip@163.com> wrote:
> > > Fix everything checkpatch.pl complained about in drm_print.h
>=20
> [...]
>=20
> > >  static inline void
> > > -drm_vprintf(struct drm_printer *p, const char *fmt, va_list *va)
> > > +drm_vprintf(struct drm_printer *p, const char *fmt, va_list * va)
> >=20
> > Checkpatch is just confused here. Look at all the other params, why
> > would you add an extra space here?
>=20
> Joe, can you help me out here please, I can't figure out why checkpatch
> is complaining here:
>=20
> include/drm/drm_print.h:106: CHECK:SPACING: spaces preferred around that =
'*' (ctx:WxV)
> #106: FILE: include/drm/drm_print.h:106:
> +drm_vprintf(struct drm_printer *p, const char *fmt, va_list *va)

checkpatch doesn't know what a va_list is.

It's similar to the FILE typedef that also causes this output.

A recent link to add an exception for 'FILE' to checkpatch:

https://lore.kernel.org/all/20220902111923.1488671-1-mic@digikod.net/



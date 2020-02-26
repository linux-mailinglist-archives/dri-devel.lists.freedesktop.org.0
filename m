Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D24E17120C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E0D6EC07;
	Thu, 27 Feb 2020 08:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 407 seconds by postgrey-1.36 at gabe;
 Wed, 26 Feb 2020 17:31:28 UTC
Received: from mx.sdf.org (mx.sdf.org [205.166.94.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C016EB2E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 17:31:28 +0000 (UTC)
Received: from sdf.org (IDENT:coypu@sdf.lonestar.org [205.166.94.16])
 by mx.sdf.org (8.15.2/8.14.5) with ESMTPS id 01QHObwQ029983
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits) verified NO);
 Wed, 26 Feb 2020 17:24:38 GMT
Received: (from coypu@localhost)
 by sdf.org (8.15.2/8.12.8/Submit) id 01QHObEj021344;
 Wed, 26 Feb 2020 17:24:37 GMT
Date: Wed, 26 Feb 2020 17:24:37 +0000
From: coypu@sdf.org
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH 3/3] drm/vmwgfx: Correct typo in comment
Message-ID: <20200226172437.GA15271@SDF.ORG>
References: <20200223204041.GA27186@homeworld.netbsd.org>
 <3c5e7beb-a3e0-ed01-550f-2ce90faf628a@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c5e7beb-a3e0-ed01-550f-2ce90faf628a@shipmail.org>
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 04:07:39PM +0100, Thomas Hellstr=F6m (VMware) wrote:
> On 2/23/20 9:40 PM, Maya Rashish wrote:
> > Signed-off-by: Maya Rashish <coypu@sdf.org>
> > Signed-off-by: Thomas Klausner <wiz@NetBSD.org>
> > Co-authored-by: Thomas Klausner <wiz@NetBSD.org>
> > ---
> >   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_kms.c
> > index f47d5710cc95..5195c19d25a4 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> > @@ -2016,7 +2016,7 @@ void vmw_disable_vblank(struct drm_device *dev, u=
nsigned int pipe)
> >    * plugin and generate DRM uevent
> >    * @dev_priv: device private
> >    * @num_rects: number of drm_rect in rects
> > - * @rects: toplogy to update
> > + * @rects: topology to update
> >    */
> >   static int vmw_du_update_layout(struct vmw_private *dev_priv,
> >   				unsigned int num_rects, struct drm_rect *rects)
> =

> Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>
> =

> I'll include in the next vmwgfx-next pull request.
> =

> Out of curiosity, how was this patch co-authored :-) ?
> =

> Thanks,
> =

> Thomas
> =


Hi Thomas,

We have a local fork of the drm subsystem & drivers. I went over the
local diffs to see if any of them are of interest to upstream.
The commit was done to the fork by someone who immediately forgot about
it and didn't send a patch upstream himself.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

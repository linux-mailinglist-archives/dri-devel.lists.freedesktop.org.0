Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDxTIe+NqWng/gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:06:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2132213037
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C62A10EB9B;
	Thu,  5 Mar 2026 14:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="im8C0R8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF8010EB9B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 14:06:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772719592; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dXsgdQSx92GFNmzKfD67J10nywBGsoj9Y44YRGyOMr9suWM8rydKjrC6cl7k/IfRs8s3uaaGzan4fo3FWsDWTse4CohqZwW+QdlmJhMTPbDGPHWkpB27KUmqyRDfHsCVym0C+c34RCnDrG/yBxiXXtPByaxtN9sNOVtJ+e9QKUY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772719592;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=scpSi2bAKu+ULKCloMgI6Hn4EbLUQJNxPzFSOAj/gP8=; 
 b=EbC93SheeYQ2dTlnLMp97zhOuYKj+QerEH+8GYP2xSf3qD3hwnlWL6V4Y34hqk6kWjE75xrQobvR7HAUrvKcg+mKjgocgD+IXmGZwwqO8f3DvdLDpqz4YLCnyt8iFL2ABxqvZfO8J/E0/UnC7hYl60CJXc8kMuo4khpx3RpjTjI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772719592; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=scpSi2bAKu+ULKCloMgI6Hn4EbLUQJNxPzFSOAj/gP8=;
 b=im8C0R8oEeDPhorhZao/T0l7h6aqpgZqOYQjVJJgWVC4AvNt/GLv8l9jdM2GJC5x
 eGKS86D9zlRl1BQtdNyshK95xu2K/b9LQmKSDUn4+ATVrEQrBvfY3UtVQmcnpS+fntL
 2tif0fuoKUFqjhKAoMB5rD2TK5lhNSB/s0bZwtAwnm+mVJrdjj43uQoF09KR/FEeqcj
 wL/6dpA5JKynXpBB1axDjsGkRkUuaf2Yprzl7dVlV1X3wvISFabmj8VCg98RS4aqROC
 DZQqYqhi3jFhzhP+gI7eSYsBt4/Xx7vr4u7FYX4Qs4kK5/pOTginwgppMerXDm+YEZP
 6JaaIFMUDg==
Received: by mx.zohomail.com with SMTPS id 1772719588607468.19267532961976;
 Thu, 5 Mar 2026 06:06:28 -0800 (PST)
Message-ID: <b7a49810a21fbc847dff5ec620386ae2c2d1f2a0.camel@icenowy.me>
Subject: Re: [PATCH drm-misc-next v2 2/3] drm: verisilicon: subclass
 drm_plane_state
From: Icenowy Zheng <uwu@icenowy.me>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Thu, 05 Mar 2026 22:06:21 +0800
In-Reply-To: <09840bc3-ccd8-439b-bf44-b61abab672b4@suse.de>
References: <20260305075926.3642501-1-zhengxingda@iscas.ac.cn>
 <20260305075926.3642501-3-zhengxingda@iscas.ac.cn>
 <09840bc3-ccd8-439b-bf44-b61abab672b4@suse.de>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
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
X-Rspamd-Queue-Id: D2132213037
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[icenowy.me,none];
	R_DKIM_ALLOW(-0.20)[icenowy.me:s=zmail2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[uwu@icenowy.me,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[uwu@icenowy.me,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[icenowy.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,iscas.ac.cn:email]
X-Rspamd-Action: no action

=E5=9C=A8 2026-03-05=E5=9B=9B=E7=9A=84 11:34 +0100=EF=BC=8CThomas Zimmerman=
n=E5=86=99=E9=81=93=EF=BC=9A
> Hi
>=20
> Am 05.03.26 um 08:59 schrieb Icenowy Zheng:
> > Create a subclass of drm_plane_state to store hardware-specific
> > state
> > information (e.g. hardware plane format settings) in the future.
> >=20
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > ---
> > Changes in v2:
> > - Add the #include clause for atomic state helpers, which was
> > wrongly
> > =C2=A0=C2=A0 placed in the previous patch in v1.
> > - Switch to kzalloc_obj helper for allocating the state.
> >=20
> > =C2=A0 drivers/gpu/drm/verisilicon/vs_plane.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 41
> > +++++++++++++++++++
> > =C2=A0 drivers/gpu/drm/verisilicon/vs_plane.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 14 +++++++
> > =C2=A0 .../gpu/drm/verisilicon/vs_primary_plane.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 6 +--
> > =C2=A0 3 files changed, 58 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/verisilicon/vs_plane.c
> > b/drivers/gpu/drm/verisilicon/vs_plane.c
> > index fa88ed14e41d7..2fd4fb2a9591c 100644
> > --- a/drivers/gpu/drm/verisilicon/vs_plane.c
> > +++ b/drivers/gpu/drm/verisilicon/vs_plane.c
> > @@ -6,6 +6,7 @@
> > =C2=A0 #include <linux/errno.h>
> > =C2=A0 #include <linux/printk.h>
> > =C2=A0=20
> > +#include <drm/drm_atomic_state_helper.h>
> > =C2=A0 #include <drm/drm_fb_dma_helper.h>
> > =C2=A0 #include <drm/drm_fourcc.h>
> > =C2=A0 #include <drm/drm_gem_dma_helper.h>
> > @@ -124,3 +125,43 @@ dma_addr_t vs_fb_get_dma_addr(struct
> > drm_framebuffer *fb,
> > =C2=A0=20
> > =C2=A0=C2=A0	return dma_addr;
> > =C2=A0 }
> > +
> > +struct drm_plane_state *vs_plane_duplicate_state(struct drm_plane
> > *plane)
> > +{
> > +	struct vs_plane_state *vs_state;
> > +
> > +	if (WARN_ON(!plane->state))
>=20
> drm_WARN_ON() here. You can use plane->dev for the first argument.

Sounds right.

>=20
> > +		return NULL;
> > +
> > +	vs_state =3D kmemdup(plane->state, sizeof(*vs_state),
> > GFP_KERNEL);
>=20
> Not wrong, but I'd advise against memdup() because it doesn't
> understand=20
> copy-ing semantics of the data structures. And some fields should
> maybe=20
> not be copied.
>=20
> I'd rather use kzalloc_obj() and then ...
>=20
> > +	if (!vs_state)
> > +		return NULL;
> > +
> > +	__drm_atomic_helper_plane_duplicate_state(plane,
> > &vs_state->base);
>=20
> ... assign the fields manually after this call. That makes is clear=20
> what's copied and sets the remaining bits to zero.

Okay. The AST demo you showed me in PATCH 3 seems to be quite
followable.

> > +
> > +	return &vs_state->base;
> > +}
> > +
> > +void vs_plane_destroy_state(struct drm_plane *plane,
> > +			=C2=A0=C2=A0=C2=A0 struct drm_plane_state *state)
> > +{
> > +	__drm_atomic_helper_plane_destroy_state(state);
> > +	kfree(state);
> > +}
> > +
> > +/* Called during init to allocate the plane's atomic state. */
> > +void vs_plane_reset(struct drm_plane *plane)
> > +{
> > +	struct vs_plane_state *vs_state;
> > +
> > +	if (plane->state)
> > +		__drm_atomic_helper_plane_destroy_state(plane-
> > >state);
> > +
> > +	kfree(plane->state);
>=20
> You can move this line into the conditional branch.

Yes, this sounds more natural (although I followed what vc4 driver does
here).

>=20
> > +
> > +	vs_state =3D kzalloc_obj(*vs_state, GFP_KERNEL);
> > +	if (!vs_state)
> > +		return;
> > +
> > +	__drm_atomic_helper_plane_reset(plane, &vs_state->base);
> > +}
> > diff --git a/drivers/gpu/drm/verisilicon/vs_plane.h
> > b/drivers/gpu/drm/verisilicon/vs_plane.h
> > index a88cc19f2202e..12848a72af576 100644
> > --- a/drivers/gpu/drm/verisilicon/vs_plane.h
> > +++ b/drivers/gpu/drm/verisilicon/vs_plane.h
> > @@ -63,10 +63,24 @@ struct vs_format {
> > =C2=A0=C2=A0	bool uv_swizzle;
> > =C2=A0 };
> > =C2=A0=20
> > +struct vs_plane_state {
> > +	struct drm_plane_state base;
> > +};
> > +
> > +static inline struct vs_plane_state
> > *state_to_vs_plane_state(struct drm_plane_state *state)
>=20
> Maybe 'plane_state_to_vs_plane_state' oj just 'to_vs_plane_state'.

I will pick the latter. I think I removed `plane_` because of the
function name being too long.

Thanks,
Icenowy

>=20
> Best regards
> Thomas

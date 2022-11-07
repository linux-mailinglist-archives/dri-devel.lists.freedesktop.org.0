Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EC461ECDA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 09:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506AE10E26C;
	Mon,  7 Nov 2022 08:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398DF10E05D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 08:26:38 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2832D3200930;
 Mon,  7 Nov 2022 03:26:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 07 Nov 2022 03:26:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667809594; x=
 1667895994; bh=AMFmSDbfoi+g257DIcHWURYqpQsU+fk5FVNcvUts1PI=; b=C
 0fYiZElKgzsizJiInh3BG1lRdsj3Oi3hMmnjP+SxfsNDIe8cvWvrl2+d30OvGVlH
 JsI7yZLB+uxP1e/buDEr/V89mRouz9Sc2U5P/uUFrZWlLdQSp7DPILBntshjxenM
 9Byxlh5DbMbxwmjbiqz86pOeDhnS3E6goORf7okO2ln3b9bshgSePD5zi2Hxwnld
 h0OSzy+td7dPA4zuZ9fmhcYL8DlZOeMRDJg1YZoJMIoclVXEnBuhJQvdLNhSiFc7
 95WzoYxhf1nG+GvkeEDhdpEVVbD59yD9bxglkEifBy2oppGKmn2W1AEgUMZZnUV5
 vtBM6WXqe/o7ASekSi3rQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667809594; x=
 1667895994; bh=AMFmSDbfoi+g257DIcHWURYqpQsU+fk5FVNcvUts1PI=; b=u
 4hmxmrE+vzZCPq40xS9bH2ywaqulLPOgAowLcF+gmhKKE8Ots9qiohgkMY14sKy8
 n42S88XdRcSO/ft9zue21FLLVhiF2p4xUxFhCUHpWckVLJ7uxwzp47LUryxBEMbP
 YFmkyNZcNh+od8RRADtl96sPqd5Mly8RavJihuqulX8BYRyw5GWvVDQI2a5yA/8y
 CGzwAv5/5dc50DnIuoUN2TQErM+hBv59N4XsZnGmoRpyjKueNOrZiTkxfOeeNTCY
 DOqZorAE7vXMEs6l7oSMn37b4MazfE8L7t9ZGBP5atgL/Y58YmIhYeEtGsgYYA76
 VYm5oFplWykzTmdJW5qWw==
X-ME-Sender: <xms:OsFoY9Zn2nZ6KwkG3W2Jq13cKIlv0o5RGhhvnSkHeicHgIZtX82Owg>
 <xme:OsFoY0aWhmm1wp6ynAD58NSiq5pSsG04MJL9faTHBRhvF-ZqTSK0up4sztLrQybDJ
 RSwgzKO5w4NvKIXpsc>
X-ME-Received: <xmr:OsFoY_83OQ0ufDTedAxMjvz_KOoa-ko-Amm6ylnSZq5hWVqGl8QcJTPcmAJ9cRGAUYZrPjpLWCyy9vf-b1ndDcB2eecG6AATpKZ4dnnvN7OJdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdejgdduvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddunecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleelfeeileelteetfedvieekfeefffevhfdtvefgheevudevheejvddv
 ieeltdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OsFoY7pdow_8txrv47_8saudJahZPVQkjMKyKDQBSz6OQCmW0-cO6w>
 <xmx:OsFoY4rIf16Iy2spECFQTS-Yr-CgpVfm2aYEhMZUlMPzh5jH2hW4hA>
 <xmx:OsFoYxT7shYW7dw4zz0xKxm3TH-6mpZkqohtHwAPa_tLDtxP5F0lHg>
 <xmx:OsFoY1iR8SxFf71nHgIXS5H2kaEEKGf_jBPEDj6NhMzr8IAaL_4emw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 03:26:34 -0500 (EST)
Date: Mon, 7 Nov 2022 09:26:30 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH] drm/vc4: hdmi: Fix pointer dereference before check
Message-ID: <20221107082630.tjebvwt4hevhdsos@houat>
References: <20221029093413.546103-1-jose.exposito89@gmail.com>
 <20221102090153.tujblkvd3jlhdtxr@houat>
 <20221102111003.GA3233@elementary>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221102111003.GA3233@elementary>
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
Cc: dri-devel@lists.freedesktop.org, emma@anholt.net,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 12:10:03PM +0100, Jos=E9 Exp=F3sito wrote:
> Hi Maxime,
>=20
> Thanks a lot for looking into the patch.
>=20
> On Wed, Nov 02, 2022 at 10:01:53AM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Sat, Oct 29, 2022 at 11:34:13AM +0200, Jos=E9 Exp=F3sito wrote:
> > > Commit 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug") introduc=
ed
> > > the vc4_hdmi_reset_link() function. This function dereferences the
> > > "connector" pointer before checking whether it is NULL or not.
> > >=20
> > > Rework variable assignment to avoid this issue.
> > >=20
> > > Fixes: 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug")
> > > Signed-off-by: Jos=E9 Exp=F3sito <jose.exposito89@gmail.com>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4=
_hdmi.c
> > > index 4a73fafca51b..07d058b6afb7 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -319,9 +319,9 @@ static int reset_pipe(struct drm_crtc *crtc,
> > >  static int vc4_hdmi_reset_link(struct drm_connector *connector,
> > >  			       struct drm_modeset_acquire_ctx *ctx)
> > >  {
> > > -	struct drm_device *drm =3D connector->dev;
> > > -	struct vc4_hdmi *vc4_hdmi =3D connector_to_vc4_hdmi(connector);
> > > -	struct drm_encoder *encoder =3D &vc4_hdmi->encoder.base;
> > > +	struct drm_device *drm;
> > > +	struct vc4_hdmi *vc4_hdmi;
> > > +	struct drm_encoder *encoder;
> > >  	struct drm_connector_state *conn_state;
> > >  	struct drm_crtc_state *crtc_state;
> > >  	struct drm_crtc *crtc;
> > > @@ -332,6 +332,10 @@ static int vc4_hdmi_reset_link(struct drm_connec=
tor *connector,
> > >  	if (!connector)
> > >  		return 0;
> > > =20
> > > +	drm =3D connector->dev;
> > > +	vc4_hdmi =3D connector_to_vc4_hdmi(connector);
> > > +	encoder =3D &vc4_hdmi->encoder.base;
> > > +
> >=20
> > I don't think that's right. Connector shouldn't be NULL to begin with,
> > how did you notice this?
> >=20
> > Maxime
>=20
> This issue was reported by Coverity. At the moment this function is not
> invoked with a NULL connector by any code path. However, since the NULL
> check is present, in my opinion, it makes sense to either remove it or
> make it usefull just in case the preconditions change in the future.

Yeah, it makes sense

I'd ask for a small cosmetic change then, could you add the assignments
where they are actually needed instead of at the top of the function?

Something like

 if (!connector)
 	return 0;

+drm =3D connector->dev;
 ret =3D drm_modeset_lock(&drm->mode_config.connection_mutex, ctx);

=2E..

+vc4_hdmi =3D connector_to_vc4_hdmi(connector);
 if (!vc4_hdmi_supports_scrambling(vc4_hdmi))

=2E..

Changing the prototype of vc4_hdmi_supports_scrambling to take a struct
vc4_hdmi pointer would also help, it's much more convenient.

Maxime

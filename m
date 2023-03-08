Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2036B0E72
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9243810E62F;
	Wed,  8 Mar 2023 16:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A311C10E62F;
 Wed,  8 Mar 2023 16:19:49 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A816E5C01A4;
 Wed,  8 Mar 2023 11:19:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 08 Mar 2023 11:19:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1678292388; x=1678378788; bh=4BGPsBHltNIepRB4bBznr59yu4gvz8M0IJw
 0ynw0Iaw=; b=a3fwyrNt5xzn9xwDsz0zHVY6faNC8rNq9CHUlVCQJ/twVEUGvyv
 8QYABRLNNGeNUjolCQ/E/JYUs6UxrwOtAvpA9iK2bAVZO0Ecd+ZsDeL8790dliTH
 Svb61cPNyCPrzmWGZEjl9Y04XRau7KRuujwHDsmQ9E0UoZMXuoXRE7ZGRxUxPH6e
 M4LBPlYXhwkUZHKhxhh35evXSxvYdqT1PFbQ17UtvCAH+HFt8DSpERNAMRpko1uF
 yc5a3pKK2G9OD56tTkn1SaZdotIB3U4veGmyElwt8gX42z/hR8ZEir7UXsB0DmKy
 TbrC81OaZxVDcgJHyOxF/LO26XBIVxK+w8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1678292388; x=1678378788; bh=4BGPsBHltNIepRB4bBznr59yu4gvz8M0IJw
 0ynw0Iaw=; b=UQY5goGX+E12D4QZ2nn2jiIN9d3yDTYNmNyyP1RnGdIdauYYKxb
 unp+4XclTj8NMPNc3QVFCvQBObM5UG1Mmv+wd/d4Z9NhaBij6pSfMsRmGzrS/a5W
 bL48eLXShNVeq9VQLQ2pB77EI5LyFGnsMmgImY2mSxxxmLk2kNdSAibpiwakBVvQ
 P4TsIG5k5nD7up37s1NqIo2L25IGvZg8HRW+ajLnE+tMJuLW4kRLEmrm4NI+JSji
 xX4bF8JRjf0zHNymSAmPz/VFb/+7RSP1gTTvrDjc8k75jCBU7G+BpBgbw1dHpLKE
 gQdg1UPkCaoqPFUL/L0cbYVRjQo4MflrdlQ==
X-ME-Sender: <xms:pLUIZEPM2lTYLRgflEsCuij5iGkbGau0Xetzdjss0wruCqhDMWjF8g>
 <xme:pLUIZK9GZ2S2-Uhr1Cw9cGIBOjAXkuAo5R3YQ8sAgE8znkm-Kurgd6T4jb6L9ik7g
 GTeqNBbBOQoXRUuDy4>
X-ME-Received: <xmr:pLUIZLSqLmwvi_GCUt60sHdZNNqSavmSWBVO2w8EEmdtJfmMLdaLwZ9W8DvUrmm4CfnX7my2UI4W_uNom390zJ6l8_x69y0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddufedgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepffdttdeufefgffegtdejffevuddvudfhudegjeegkeetuefgfefhheek
 udfhvdfhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:pLUIZMvSD7g1gHN4N0QufVJY-jGSmbwQeqk47L5BLKTZfg0Mh9Qxxg>
 <xmx:pLUIZMfmhi_a-yI02T84zQg43DmQOansYKrSeCiTUP31mQB3-p10sQ>
 <xmx:pLUIZA2pIUIUSWk-VAa88tX2RsgGmAi40FFMY37Fm9isedsSlxylcA>
 <xmx:pLUIZH30EUI72BLHCdVyKRviMTDlvhCF05y_Tid1lgG7R3mWXB8fxw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Mar 2023 11:19:47 -0500 (EST)
Date: Wed, 8 Mar 2023 17:19:45 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: Re: [PATCH 1/2] drm/vc4: Fix build error with undefined label
Message-ID: <20230308161945.svooztnablyvm75e@houat>
References: <20230308093408.239331-1-qingqing.zhuo@amd.com>
 <ac8fed53-6f05-6ec7-9ef5-61110cd83c0b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ac8fed53-6f05-6ec7-9ef5-61110cd83c0b@amd.com>
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
Cc: Emma Anholt <emma@anholt.net>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 08, 2023 at 11:11:22AM -0500, Hamza Mahfooz wrote:
> + vc4 maintainers
>=20
> On 3/8/23 04:34, Qingqing Zhuo wrote:
> > [Why]
> > drivers/gpu/drm/vc4/vc4_hdmi.c: In function =E2=80=98vc4_hdmi_bind=E2=
=80=99:
> > drivers/gpu/drm/vc4/vc4_hdmi.c:3448:17: error: label =E2=80=98err_disab=
le_runtime_pm=E2=80=99 used but not defined
> >=20
> > [How]
> > update err_disable_runtime_pm to err_put_runtime_pm.
> >=20
> > Signed-off-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
> > ---
> >   drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> > index 9e145690c480..edf882360d24 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -3445,7 +3445,7 @@ static int vc4_hdmi_bind(struct device *dev, stru=
ct device *master, void *data)
> >   	 */
> >   	ret =3D pm_runtime_resume_and_get(dev);
> >   	if (ret)
> > -		goto err_disable_runtime_pm;
> > +		goto err_put_runtime_pm;
> >   	if ((of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi0") ||
> >   	     of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi1")) &&

The current drm-misc-next branch doesn't have that context at all. What
tree is this based on?

Maxime

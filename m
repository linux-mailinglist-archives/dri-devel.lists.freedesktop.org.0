Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0601CDAD86
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 00:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AC910E2DA;
	Tue, 23 Dec 2025 23:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="GX+ZQova";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="DICYizRA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3E510E2DA;
 Tue, 23 Dec 2025 23:41:22 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id C813C140009B;
 Tue, 23 Dec 2025 18:41:21 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Tue, 23 Dec 2025 18:41:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1766533281;
 x=1766619681; bh=o7r3ytA43pUHLpxhqQjH44Xiv52OWQmH6R3NnII+EP4=; b=
 GX+ZQova6lZqkDWMYmpWS5aCahyMU94ZXaEK3jExCmhCnKqDgAobmK/m9vASsY2P
 ietqr33vUaSYIrzmF8e8xw6pgZgw0s+OjVCjtzGH5oYHoCQeWk5Y2t35l2DuZ9CK
 iWfxFZKQfK1JTKiWWy91w1vlPEa+wEAgKHIz9KRPm+fA9ROGMD3ungzOUy9qStor
 0SzJacNT5Jcb7PU3BM5bOZORbZXnMayazYoIGMq/qXtVsJ1wx5aEVkkuHzBHKaIj
 3lBsr5tbbb3OiBxls26F7ooHj4IOXX7sP7EmsjbfE4MKLh360v+gXpkAR4F/Ox9B
 UXAeXohzpt4G5Pb9UzWhSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766533281; x=
 1766619681; bh=o7r3ytA43pUHLpxhqQjH44Xiv52OWQmH6R3NnII+EP4=; b=D
 ICYizRAIrbr1MlCjTUM80wI4OwsS7KP5pS+uqDbTmmo8s0eabbqfgsHRoJgKyXW7
 VdUq1VgEARTfsvbQf1Bf1hwFgKRFzSkGU3Pu5bdUaKac6ng3s3+Kt/6BGfjjA3ie
 rgs6E0DcAzwz17OpU+L+qecW2gPmBPfiIVYbSbDuGN1kKlPqJ5CS2Loz9awEobC1
 WsWKJZ5W0UYLOwWqbKhygLhH82nh/SIyhB54J0m7ofcQqk6bsMt/GSd3GRbrkj0t
 HPLmoniZixBwN94wK6KDG0JwYFOopqSGONM2CVRgKHAlB8EfBeWSSKU03M1MkOd6
 Ww0Sp+Zo6kHBBUDaCq+6g==
X-ME-Sender: <xms:oShLacVd2iBEaXhrv7RhenKrFK-IU2Qw2be-7ri_4O3QVkN8Dzegxw>
 <xme:oShLaYu805_he9l-E8JU9enfoK3-azTbQL331FfuHIp9-MWRYAr3XkTeXZTw6dVNc
 jyNsslaxjFE2UX9qlu7fwcWts6jsaAN9jyamLK_FQzQBQETWakdWQ>
X-ME-Received: <xmr:oShLaf42SWyA2b2sRN3xjkkg1tz1sI_iFuIm0U0JndNNUFBLccz7IlpD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeiuddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfgjfhggtgfgsehtqhertddttdejnecuhfhrohhmpeetlhgvgicuhghi
 lhhlihgrmhhsohhnuceorghlvgigsehshhgriigsohhtrdhorhhgqeenucggtffrrghtth
 gvrhhnpefgffdvfeejjeeuveefteduhfegteefueehteefkeejvdduvdeuhefftdegjeek
 teenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlh
 gvgiesshhhrgiisghothdrohhrghdpnhgspghrtghpthhtohepuddupdhmohguvgepshhm
 thhpohhuthdprhgtphhtthhopehmihgthhgrlhdrfigrjhguvggtiihkohesihhnthgvlh
 drtghomhdprhgtphhtthhopehinhhtvghlqdigvgeslhhishhtshdrfhhrvggvuggvshhk
 thhophdrohhrghdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinh
 hugidrihhnthgvlhdrtghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhn
 thgvlhdrtghomhdprhgtphhtthhopehjghhgsehnvhhiughirgdrtghomhdprhgtphhtth
 hopehkvghvihhnrdhtihgrnhesihhnthgvlhdrtghomhdprhgtphhtthhopehmihgthhgr
 lhdrfihinhhirghrshhkihesihhnthgvlhdrtghomhdprhgtphhtthhopehmrghrtghinh
 drsggvrhhnrghtohifihgtiieslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthho
 pegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:oShLabQcJyvg4BYOLxgkYUX8NR1A58Kwhv5wUl6zyqQEAraxSYVoaQ>
 <xmx:oShLaSsSUY70OC4oI5Ki3yJChGxxmAm3iLQ6qZmRcAPo3BZZzJoOXw>
 <xmx:oShLad_96N17njXwotxK2aWd_lUleX60ecQ9-HGUqyMA7b3vQUjH5w>
 <xmx:oShLabx8yNQn8lev4KAXHFaGgfifbjbRJ-xWTHkAn3guC80Y9XnfiQ>
 <xmx:oShLact6WF0x3PF3aMyJkU2bCY95btX-y2FJ4OZYx9YPeLYc3yfY2vz4>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Dec 2025 18:41:20 -0500 (EST)
Date: Tue, 23 Dec 2025 16:41:19 -0700
From: Alex Williamson <alex@shazbot.org>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?B?TWljaGHFgg==?= Winiarski <michal.winiarski@intel.com>, Marcin
 Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
Subject: Re: [PATCH] vfio/xe: Add default handler for .get_region_info_caps
Message-ID: <20251223164119.5b9bb979.alex@shazbot.org>
In-Reply-To: <20251218205106.4578-1-michal.wajdeczko@intel.com>
References: <20251218205106.4578-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 18 Dec 2025 21:51:06 +0100
Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:

> New requirement for the vfio drivers was added by the commit
> f97859503859 ("vfio: Require drivers to implement get_region_info")
> followed by commit 1b0ecb5baf4a ("vfio/pci: Convert all PCI drivers
> to get_region_info_caps") that was missed by the new vfio/xe driver.
>=20
> Add handler for .get_region_info_caps to avoid -EINVAL errors.
>=20
> Fixes: 2e38c50ae492 ("vfio/xe: Add device specific vfio_pci driver varian=
t for Intel graphics")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Alex Williamson <alex@shazbot.org>
> Cc: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kvm@vger.kernel.org
> ---
>  drivers/vfio/pci/xe/main.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
> index 0156b53c678b..719ab4660085 100644
> --- a/drivers/vfio/pci/xe/main.c
> +++ b/drivers/vfio/pci/xe/main.c
> @@ -504,6 +504,7 @@ static const struct vfio_device_ops xe_vfio_pci_ops =
=3D {
>  	.open_device =3D xe_vfio_pci_open_device,
>  	.close_device =3D xe_vfio_pci_close_device,
>  	.ioctl =3D vfio_pci_core_ioctl,
> +	.get_region_info_caps =3D vfio_pci_ioctl_get_region_info,
>  	.device_feature =3D vfio_pci_core_ioctl_feature,
>  	.read =3D vfio_pci_core_read,
>  	.write =3D vfio_pci_core_write,

Applied to vfio for-linus branch for v6.19.  Thanks,

Alex

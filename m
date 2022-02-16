Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F37584B8B11
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 15:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457D910F10F;
	Wed, 16 Feb 2022 14:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D67910F10F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 14:08:41 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id E6D66580D4C;
 Wed, 16 Feb 2022 09:08:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 16 Feb 2022 09:08:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=+CTAbyp7J9OtBNbSg8NLHrnn3vzq7WAIhYg9am
 QN21U=; b=FAa4L7fcMPJMQ1wSP5bI+j4RglQwzDWAcOxtFcItBOQ+HFmcoKgsal
 31SvetJ7cmEIGqIhf5n+AkhTZxw5CjQsPpiRhC1za+t1FdUOcUE4ljolv/X2+bZp
 8W6+rxSyWaI6bfvVa+RmVDtOkpjaQrCos/qX9EjlXVTgToAx2T7Ny7/a94yTWh2d
 /auOGkz4DPB+QzEFwVdL2aouvyg8Jt3vqxyXlasHOnXX0XFW1vUigXqZr17PYxvF
 PpP+63OYIrrLrNOtWjbLkHiJeXcTje46IQU/fmuQCC6dur6m0yOQD25jfJRBA8sw
 UYoj6rp3qFn16gB3jCTGoh0IO7wruCWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+CTAbyp7J9OtBNbSg
 8NLHrnn3vzq7WAIhYg9amQN21U=; b=KdhlXG12JmWiFuitWLL5rmUuME5pGaI5f
 oVifjxRoT3GrdHshVgvm68/yKrXFzTVNi+XKGPqdmVmSSv8jkvqar4VDBky+k1s7
 eVsIY2phPnCfTPlzBPzk/4taD7GH1BvjSlwblDDVZfxJrGYoP8j7/PRRwJzARJd7
 7vlhq2UNwvwicFSLK5UhgmIozF0B/+Ygcis89jz63ppuu03Uu1/qGqGg9G2DrnvS
 VQ/UTQCRAAfeJsOgYn658VetoT8LyeNRTaGvAzv7uHtHUMJFolL9ZRCZH9/VJ1ks
 xz3+WWt53ilcs2SSmnvMN/aLgkdVNmDaFGF/AiCuw6VYhOZgfHWLw==
X-ME-Sender: <xms:YgUNYi0RCgevubuW-PpbEIkEp_USMwlC05EZ5ej8XFDpsSs72WHtEA>
 <xme:YgUNYlHaKS7vDDiV4Af8LEYE4K-DNOjDgB1EZDbXXqYo3_jjdfh1agUUxJsOZHMjg
 qR_1AXUJew9SE0XeUw>
X-ME-Received: <xmr:YgUNYq4SA7psVXv5M1fJqZy6suNHnt2eUgQU9YHrOVWQOu9a86vsbkdYR3m1yBUUpHmhDTtCRg-dWbRAdtUIPxf5TeyEJbzErrdBMao>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeigdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YgUNYj20Ylc1h_PSRWLUQTeUo08HBzuL411IKxvo-XVjhekBPkphgg>
 <xmx:YgUNYlFQdS1flJVOBTGHkQmCdX19iE6E8Qh63l9ZC4jNJMGvSDo_mw>
 <xmx:YgUNYs-UropbZYh1yDUMeLbVmm-bUoT-5GNapKILHOo8ZHhsyUC2Zg>
 <xmx:ZQUNYuJBOYnqqUZ9683Jfw1431nbEUB2s8YhFkJSo4_JjXicb-Y8ww>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Feb 2022 09:08:33 -0500 (EST)
Date: Wed, 16 Feb 2022 15:08:31 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <20220216140831.gnevfwudj7635lj5@houat>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
 <11ac5696-29e3-fefa-31c0-b7b86c88bbdc@189.cn>
 <20220209084908.kub4bs64rzhvpvon@houat>
 <84bfb2fc-595c-3bae-e8a0-c19ccbcfcfd8@189.cn>
 <20220209161624.42ijbnhanaaari46@houat>
 <8b7bcb57-4450-ed67-bd5f-d8e8f2e74510@189.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5po5qlzkqgek6g72"
Content-Disposition: inline
In-Reply-To: <8b7bcb57-4450-ed67-bd5f-d8e8f2e74510@189.cn>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5po5qlzkqgek6g72
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 13, 2022 at 02:11:30AM +0800, Sui Jingfeng wrote:
>=20
> On 2022/2/10 00:16, Maxime Ripard wrote:
> > On Wed, Feb 09, 2022 at 10:38:41PM +0800, Sui Jingfeng wrote:
> > > On 2022/2/9 16:49, Maxime Ripard wrote:
> > > > On Fri, Feb 04, 2022 at 12:04:19AM +0800, Sui Jingfeng wrote:
> > > > > > > +/* Get the simple EDID data from the device tree
> > > > > > > + * the length must be EDID_LENGTH, since it is simple.
> > > > > > > + *
> > > > > > > + * @np: device node contain edid data
> > > > > > > + * @edid_data: where the edid data to store to
> > > > > > > + */
> > > > > > > +static bool lsdc_get_edid_from_dtb(struct device_node *np,
> > > > > > > +				   unsigned char *edid_data)
> > > > > > > +{
> > > > > > > +	int length;
> > > > > > > +	const void *prop;
> > > > > > > +
> > > > > > > +	if (np =3D=3D NULL)
> > > > > > > +		return false;
> > > > > > > +
> > > > > > > +	prop =3D of_get_property(np, "edid", &length);
> > > > > > > +	if (prop && (length =3D=3D EDID_LENGTH)) {
> > > > > > > +		memcpy(edid_data, prop, EDID_LENGTH);
> > > > > > > +		return true;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	return false;
> > > > > > > +}
> > > > > > You don't have a device tree binding for that driver, this is s=
omething
> > > > > > that is required. And it's not clear to me why you'd want EDID =
in the
> > > > > > DTB?
> > > > > 1) It is left to the end user of this driver.
> > > > >=20
> > > > > The downstream motherboard maker may use a dpi(XRGB888) or LVDS p=
anel
> > > > > which don't have DDC support either, doing this way allow them pu=
t a
> > > > > EDID property into the dc device node in the DTS. Then the entire=
 system works.
> > > > > Note those panel usually support only one display mode.
> > > > I guess it depends on what we mean exactly by the user, but the DTB
> > > > usually isn't under the (end) user control. And the drm.edid_firmwa=
re is
> > > > here already to address exactly this issue.
> > > >=20
> > > > On the other end, if the board has a static panel without any DDC l=
ines,
> > > > then just put the timings in the device tree, there's no need for an
> > > > EDID blob.
> > > Loongson have a long history of using PMON firmware, The PMON firmware
> > > support flush the dtb into the the firmware before grub loading the k=
ernel.
> > > You press 'c' key, then the PMON will give you a shell. it is much li=
ke a
> > > UEFI shell. Suppose foo.dtb is what you want to pass to the vmlinuz.
> > > Then type the follow single command can flush the dtb into the PMON f=
irmware.
> > >=20
> > > |load_dtb /dev/fs/fat@usb0/foo.dtb|
> > >=20
> > > For our PMON firmware, it**is**  totally under developer/pc board mak=
er's control.
> > > You can flush whatever dtb every time you bootup until you satisfied.
> > > It(the pmon firmware) is designed to let downstream motherboard maker=
 and/or
> > > customers to play easily.
> > >=20
> > > Support of reading EDID from the dtb is really a feature which downst=
ream
> > > motherboard maker or customer wanted. They sometimes using eDP also w=
hose
> > > resolution is not 1024x768. This is out of control for a graphic driv=
er
> > > developer like me.
> > And, to reinstate, we already have a mechanism to set an EDID, and if it
> > wasn't an option, the DT is not the place to store an EDID blob.
>=20
> I know, put edid blob in the dts maybe abuse, but i am not push dts
> with edid blob either.
>=20
> It is left to other people, and the
> ./arch/powerpc/boot/dts/ac14xx.dts=A0already have edid blob.

There's one example across the entire tree, and that's not either
documented or used by any driver. I'm not sure it was really the point
you were trying to make, but the only thing it proves from my point of
view is that you don't need it.

> > > And drm.edid_firmware have only a few limited resolution which is wea=
k.
> > You're wrong. There's no limitation, it's just as limited as your
> > solution. You put the same thing, you get the same thing out of it. The
> > only difference is where the data are coming from.
>=20
> It is extremely difficult to use, it have difficulty to specify which
> firmware edid is for which connector. because we have a 1024x600 panel
> and a 1920x1080 monitor.
>=20
> It require you to know the connector's name at first, it is not as
> intuitive as my method. I am exhausted by it.

Then you always have the option to implement DDC support, or get your
firmware to patch the DT at boot time with the proper display timing
node. Even more so if you have a single timing to provide.

Maxime

--5po5qlzkqgek6g72
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYg0FXwAKCRDj7w1vZxhR
xfmBAQCrXZ3zzbaw3jHLn6vYrzlJ3K3ueudXqrU+n5s+nh1g8wD+M2JQezLoWbiT
5VUHgMDoAk2PZM6gdsOAgZM6nCofhA8=
=yuvU
-----END PGP SIGNATURE-----

--5po5qlzkqgek6g72--

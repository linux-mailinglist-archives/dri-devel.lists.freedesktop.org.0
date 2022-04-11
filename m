Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 437BC4FB505
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 09:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADE210E380;
	Mon, 11 Apr 2022 07:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9441110E478
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 07:35:19 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 22FD23202095;
 Mon, 11 Apr 2022 03:35:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 11 Apr 2022 03:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1649662514; x=
 1649748914; bh=7mX0hp8W8WjcCgt2VvHXJPldY3sQXNr0xGDpWvXJOMc=; b=T
 XDfl6BlbWDEMUEaSaiuHfzqN37fb/2fBQyOnkvpewoh1SvXMIBiOu7UGxOjE+uw+
 2erg0xn7Qw9uFAB6esv4hVMzih75n6BKZ96f9o7CZHLKLwJhAeo9cNZvH1CWgMGi
 kAXFbzLrJ4z9+uWZLi9D9dWdK0WCVRnLulPGC5xy/5lxrzw/yAZyzHn06tW62iTw
 1Gbukb/5hzpgdfasqRU0wxkDQ3P7ySaN+WVwNvh46dMPbPvNqZAPJr2LyuV6iK3D
 SNQ2SQEJiFsywBZ9JfgkmSEta3nZ/W/YlVUYiPsdgN+ijzzly43oZRPlMsaXM6le
 Wx6S6UthTia5+Coznt8ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1649662514; x=1649748914; bh=7mX0hp8W8WjcC
 gt2VvHXJPldY3sQXNr0xGDpWvXJOMc=; b=l6oT4nDAklTe5/VJcs0PSufqUHRe6
 xhyBvn7DHRu4XnAXgNNSIx3nUn2NUuK+skYT8t9/CO1vTv9VKFRcDB5fHl0hwJ21
 kpVSwqdcJvheAl7cZaDUlT00AZ4UK0aVEpu5QTEYfc8euD0LWf+jz1+8C9FriqRr
 rQuqRrxw7t9Rsm3xF/av5m0eucRT8UNjaL3dXBHammzNlVLk+cCaK7f67a65vrw0
 SlL92z16GgGboATppocmbGcT/IM9ndSM2aCJr8m+iGyFht3irEGH22QMoC6Z2b31
 mVjm4kcBxnOkEQr9xsxXKpk2R1QsoC1Q1SfBqSmyiNbzzjawdo+bTsr8w==
X-ME-Sender: <xms:MtpTYhQKEX7O5pQ7ag931UlixdM3Iqkab-hZO8FgSgLYD7WbfbULsQ>
 <xme:MtpTYqxeteaVoi837PhXnq7OhQlHEAQjL_itRZiO1iKNZfHn9-Ls_3nnE9ZCsv8Jy
 7RKR20tsfD4nYQOcl4>
X-ME-Received: <xmr:MtpTYm0vOJQsyeyHhct-PF_woxx09uu7Nne2t_Eu2rBM2Z0QZhxEGSpxCQNJuKUs89qsBTVvQGi_cf1d48uDjNVFYDntbyJ5HSPiPis>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddunecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepheelvdfhkeelgfevleekleduvefftefhudekvdffhffhgeefuefgheeg
 feejvedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MtpTYpCL5xmoF-IGN6BFxCtOPzI5ayK2lf_YmYIxud8RK4zqkNA3yA>
 <xmx:MtpTYqiQ_dNptAQ4G0UQKq35Ycft8Pd-_3AJBHTSwARJYYhHxk5I2w>
 <xmx:MtpTYtojtJ6UgPFKntoXnyZzFZqM6fUzBXx8dcMiolLD0mqmnMr-3w>
 <xmx:MtpTYlUc5eBOeM5hjLrZ4HTY_i5FeAxPvmHmfOb1b9SbePxDy6AG_w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Apr 2022 03:35:13 -0400 (EDT)
Date: Mon, 11 Apr 2022 09:35:11 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: vc4: Couldn't stop firmware display driver during boot
Message-ID: <20220411073511.l5v7aqwbg6sdedjf@houat>
References: <69c4f25d-7b48-081b-f609-8e1fd5f950cb@i2se.com>
 <df9d739d-7dff-4e2b-d1cd-66a5c5887cab@i2se.com>
 <42f24a68-391a-e6c8-25a7-511e91a5c7f9@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <42f24a68-391a-e6c8-25a7-511e91a5c7f9@i2se.com>
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

On Sun, Apr 10, 2022 at 02:32:02AM +0200, Stefan Wahren wrote:
> Am 09.04.22 um 21:25 schrieb Stefan Wahren:
> > Hi,
> >=20
> > today i tested Linux 5.18-rc1 on my Raspberry Pi 400 connected to my
> > HDMI display (multi_v7_defconfig + CONFIG_ARM_LPAE, firmware:
> > 2021-01-08T14:31:16) and i'm getting these strange errors from
> > raspberrypi-firmware driver / vc4 during boot:
> >=20
> > [=A0=A0 13.094733] fb0: switching to vc4 from simple
> > [=A0=A0 13.110759] Console: switching to colour dummy device 80x30
> > [=A0=A0 13.120691] raspberrypi-firmware soc:firmware: Request 0x00030066
> > returned status 0x80000001
> > [=A0=A0 13.120715] vc4-drm gpu: [drm] Couldn't stop firmware display dr=
iver:
> > -22
>
> This is a new error which was introduced with Linux 5.18-rc1 (c406ad5e4a85
> "drm/vc4: Notify the firmware when DRM is in charge"). 0x00030066 stands =
for
> the new firmware property RPI_FIRMWARE_NOTIFY_DISPLAY_DONE. And i guess t=
he
> firmware from January 2021 doesn't support it?

If I remember well, this was added some time in the middle of last year,
so it wouldn't surprise me that your firmware doesn't support it.

It's not really harmful, but it might still be a good idea to upgrade
your firmware. The display pipeline has an unflushable FIFO between
devices and if we don't take special care when disabling all the devices
in that pipeline, we end up with a shift of one pixel for the rest of
the system's life.

We have some code to deal with the transition between the firmware and
the kernel, but we couldn't make it work reliably so we ended up asking
the firmware instead.

So.. Yeah, it's bad if you want to use the displays output, but it not
critical either.

Maxime

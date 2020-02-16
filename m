Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55048160D17
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B226E8E6;
	Mon, 17 Feb 2020 08:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E18E89CCB
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 16:47:18 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 7151260D;
 Sun, 16 Feb 2020 11:47:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 16 Feb 2020 11:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=C
 01lFxl1GFMcSv5cefuEeBOMVDvom61jdNMnjNqbQ2o=; b=mebHs6o9vERf3Q0XV
 YIPFIlZiISgf8QHQ3ctVXBLSY/VIYaEsH6mqg+ipc4bnl1/boY1H+dyt0SvRhL7/
 h3wWHgLs3uXbO6epN4t0U1aqqqil+B1lZMewpcqrvuWJbv3AjJumpUk0it76MxCx
 HAGCFmnW8aAeIrp3yWl+ceGDzzpCxe7wXcqpxJ4DdKq5xth7uDYP71stI+JRhi7v
 vRhSNfo1CxpqbCmzju3HRe3UDjR4m0OAWINRIVeN5BwT0NUUhoKHJPdGD7K4tD36
 d34x77V8MV7ASM9Q+4O/fFvR+LRYZXk/eK2xLeQPTLYbfCergevCGPN4Eiq0veUx
 kmTqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=C01lFxl1GFMcSv5cefuEeBOMVDvom61jdNMnjNqbQ
 2o=; b=0uFhh9denE4qDbBb7mI1Dcuu5NEI6Ufk74lwOELpDi39EbI3yPeiMVeYK
 VU/GlxWlFgPIhjT3YXtd66q1USf5tE27NhZiqzMu4+YXPFOn7wjgW3A7sPif9/WH
 +lWWlwQbWpBIa20gyTcHAamOjxoa6eVuNt7CjPGbJ+9KnFr0D6KSJ+SAhrkMZuhz
 OyfM8pWdpc+R8VkMQ1v4HQbYG9rGA2t8RftQn1nFnZCov75G26myXlSzjos0Nu3/
 zD+BETLwX/Bh9kIPkxiGhq/XLBG8DPNEQpix0r27c8GrmVvcVTQTKn6m0NghmEMT
 SEUm7ff6sKflX707ROC4GrTk9Yz6A==
X-ME-Sender: <xms:EHJJXqMkQ04PdbTgQmpQ59GV00Iek9BzDQe8Tod7Q-kd3CRdNaAfXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeeggdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtugfgjgesthhqre
 dttddtudenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvgestggv
 rhhnohdrthgvtghhqeenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:EHJJXmigSrlPzAPQRgasnCgjzlVoRd6Vmpoey-fqqDK__eoi87XfvQ>
 <xmx:EHJJXqS0Jc6yjg4MNT-mLx8YpyMUEPl73VhT5fEjzPCNwUEd_F1QgQ>
 <xmx:EHJJXlkerOnDEIh1II0cHuDlUThkOrD_O6g0dqa7aKGS7hFwFzw1rw>
 <xmx:EnJJXu5u02RPDVQEBxLYqYn4ut8dWvyq8Tz7PHbA4Lo930pmP7R7w9HRADU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CFB65328005D;
 Sun, 16 Feb 2020 11:47:11 -0500 (EST)
Date: Sun, 16 Feb 2020 17:47:09 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Emmanuel Vadot <manu@freebsd.org>
Subject: Re: [PATCH v2 0/2] Dual licence some files in GPL-2.0 and MIT
Message-ID: <20200216164709.jswwc2sqeu3ppsyj@gilmour.lan>
References: <20200215180911.18299-1-manu@FreeBSD.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200215180911.18299-1-manu@FreeBSD.org>
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: tzimmermann@suse.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, efremov@linux.com, jani.nikula@intel.com,
 kraxel@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 15, 2020 at 07:09:09PM +0100, Emmanuel Vadot wrote:
> Hello all,
>
> We had a discussion a while back with Noralf where he said that he wouldn=
't
> mind dual licence his work under GPL-2 and MIT.
> Those files are a problem with BSDs as we cannot include them.
> For drm_client.c the main contributors are Noralf Tr=F8nnes and Thomas
> Zimmermann, the other commits are just catch ups from changes elsewhere
> (return values, struct member names, function renames etc ...).
> For drm_format_helper the main contributors are Noralf Tr=F8nnes and
> Gerd Hoffmann. Same comment as for drm_client.c for the other commits.
>
> Emmanuel Vadot (2):
>   drm/client: Dual licence the file in GPL-2 and MIT
>   drm/format_helper: Dual licence the file in GPL 2 and MIT

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

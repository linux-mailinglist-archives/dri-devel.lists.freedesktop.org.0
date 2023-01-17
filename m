Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C7266E46B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 18:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A1910E2F4;
	Tue, 17 Jan 2023 17:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2A910E0CE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 17:06:57 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 40AA85C00E9;
 Tue, 17 Jan 2023 12:06:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 17 Jan 2023 12:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673975217; x=
 1674061617; bh=5twsoyv0qz1wdF1I0/t62yW7R14KJeFgf9Xg4PfxoZ4=; b=S
 olC2TVycv/tQMriQnoieTz3TW2i13RVapLg3CzBd4bb0THbERf1B4vmIlJlfTs7r
 k2ymDH+xl6QSdhThe/ramB49bj4z1sYNk/EdgMq3J/eVvTUnP/TvBUPUZZE+F9Ys
 zl5tLhKSdiY17eeHcfNSz2qYpu6HSbuEiRnXsSpj406rm+X4WU2bNjGgXj/kn8tT
 TDN60I/yojLa2QxsBcDqyNQlsRKnN5VCeH8xU5qeHUEdou9vmm4YHS+/kcjw7SRC
 cPtPGPD4jstxRzhr+5mntJ+Xdx2BbLae5aS3lAfPwwKIqV01r6RiUxWMiLZ+Qp2h
 upgHGRNj/EUb/ruaCLitA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673975217; x=
 1674061617; bh=5twsoyv0qz1wdF1I0/t62yW7R14KJeFgf9Xg4PfxoZ4=; b=Q
 AB8IpdD8cRO95rpIUVqJov9OoWh5HbL54VGhVIqW1Oe5SsqkZr/NhXxjlVG1gr5V
 DC4saxNtVv29b4lOKcnGwGdVHW0CNovajih+InQ4CJirglk1e7NOK9URwVmc4e6U
 CHerD0hWd09x/vfRkah3UI5TZvErXHwYLl6CKsj7gkGHeqEwDIHLcQJhx9PUyArZ
 vhVackt+4wAdwKaKmx2PwA+8y9+pRZeq2yvWXmCgKQjdK6bKC+c5M9Jt7h7ZLQyc
 AI0Mbxqcp6LRgQtuhFhSGxpY+aJtGoqMHAyDWMD6P+4MimiIt7utwkCbFePEG22L
 a7BmkbGfx0Dq1GUmQAiBg==
X-ME-Sender: <xms:sdXGY7GZBRRui_qZQDUXkgnsrbxgXXqUNkWbM_wwHRIjQXY_Kosfmg>
 <xme:sdXGY4WSmQOg915M-hNRBar9MhlfIInR_ZRTXNLAGd5eAspWrBSY9o6YM7fEhIylS
 hxVPaziXVuKCZIijoI>
X-ME-Received: <xmr:sdXGY9I4A-IaGZ-uPOz91LayrCDlpJ1S5vIWaBM_LIA4dFMStgIZx1O9zZBw90kG29zrcCEobsmBoUIJ26dbozqicoYwLHvy9Hj43Rg0cjIZug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleeifffgvdetjeejueejieehuedvteeigeehtefhhfeifeegleekudek
 teegueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sdXGY5FJ5-JIgrbUdRt88grx7OBW9i5c2QCmcPkfS0pjQa_bn8Lozg>
 <xmx:sdXGYxVdgjQDcFQ4egmEzD1VH-LiLuxApPPAcF8qy3dzX7PjU8U9kQ>
 <xmx:sdXGY0McZQHVrlwbOWQra6pc4uBGJvfUzRJ5zi_Xsw5yFEJpPqMdvQ>
 <xmx:sdXGY6vprSBxBG7L8FcO0dLyxXgd_w8LlOftv0lqbmPDY8m0FFPvUg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 12:06:56 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230117070224.30751-1-rdunlap@infradead.org>
References: <20230117070224.30751-1-rdunlap@infradead.org>
Subject: Re: (subset) [PATCH] drm/connector: fix a kernel-doc bad line warning
Message-Id: <167397519378.2619750.18386619390759216407.b4-ty@cerno.tech>
Date: Tue, 17 Jan 2023 18:06:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.2
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 Jan 2023 23:02:24 -0800, Randy Dunlap wrote:
> Building the kernel documentation causes this warning 7 times.
> Fix it by adding a " *" line instead of a blank line.
> 
> drivers/gpu/drm/drm_connector.c:1849: warning: bad line:
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

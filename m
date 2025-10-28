Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D5CC16598
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B61310E64B;
	Tue, 28 Oct 2025 17:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DWsbCydV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0EE10E64B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:59:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 625714E413A1;
 Tue, 28 Oct 2025 17:59:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 317B860692;
 Tue, 28 Oct 2025 17:59:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5BF2A102F12E3; Tue, 28 Oct 2025 18:59:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761674385; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5NrAtnDMjFJ5Ghvd4YzRYA7Yl9j9ybNfKvOu24MzvDY=;
 b=DWsbCydV//xvHJDzeBuKG+WnZG/edBwN8WM2T9lhTpTinwkZ0dIA2UZjyoX14KfXZp5A+L
 6yMwepOhql+aaE6JDeDrZ0EkwWn+ZxHeml10mbFfmmD13E+s8mjiqKcU0M97nBX73UzWLN
 BChe1d7SvfH6cinPba30dyagwWao6+OzFRhWx8huv/FYdeRLnV7o86wnuvqYDKG0YYWn+4
 QGMv7SyPDnzCpT0vivKdNDoa7R7uZ/QonZ1SmGW0IbNzV67hjVN/wI/KjhEd7tWvm7OIpW
 hFqkFFciyjrLYjfMEBIhI9DaTrqZqLbBT4CR+3wepCvI3BKcXwIXPJWwlyH2Yw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Oct 2025 18:59:36 +0100
Message-Id: <DDU5G3UHOYM7.2WNR6PPEK6ST1@bootlin.com>
Cc: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v5 00/23] tegra-video: add CSI support for Tegra20 and
 Tegra30
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Svyatoslav Ryhel" <clamor95@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Thierry Reding" <thierry.reding@gmail.com>,
 "Jonathan Hunter" <jonathanh@nvidia.com>, "Sowjanya Komatineni"
 <skomatineni@nvidia.com>, "Prashant Gaikwad" <pgaikwad@nvidia.com>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Mikko Perttunen" <mperttunen@nvidia.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Jonas_Schw=C3=B6bel?=
 <jonasschwoebel@yahoo.de>, "Dmitry Osipenko" <digetx@gmail.com>, "Charan
 Pedumuru" <charan.pedumuru@gmail.com>, "Diogo Ivo"
 <diogo.ivo@tecnico.ulisboa.pt>, "Aaron Kling" <webgeek1234@gmail.com>,
 "Arnd Bergmann" <arnd@arndb.de>
X-Mailer: aerc 0.20.1
References: <20251022142051.70400-1-clamor95@gmail.com>
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Svyatoslav,

On Wed Oct 22, 2025 at 4:20 PM CEST, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.

Whole v5 series (including patches 21-23):
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel ca=
mera

As you seem to have issues with sending a long series over e-mail, I may
suggest looking at b4 [0] for the future. It automates many boring and
repetitive tasks in handling a patch series, and also offers a way to send
e-mails when an SMTP server is problematic e.g. due to limitations in
e-mails per hour.

[0] https://b4.docs.kernel.org

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

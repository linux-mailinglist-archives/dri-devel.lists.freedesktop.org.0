Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F473D7830
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 16:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B7B6E087;
	Tue, 27 Jul 2021 14:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AAD6E087
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:11:25 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1m8Nnn-0002Bs-Ad; Tue, 27 Jul 2021 16:11:23 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1m8Nnn-0007HT-1E; Tue, 27 Jul 2021 16:11:23 +0200
Message-ID: <f21f46d95972a14e67fa3429e3d464d5762cce34.camel@pengutronix.de>
Subject: Re: [PATCH v2] gpu: ipu-v3: use swap()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Salah Triki <salah.triki@gmail.com>, festevam@gmail.com, 
 alexdeucher@gmail.com
Date: Tue, 27 Jul 2021 16:11:22 +0200
In-Reply-To: <20210713140521.GA1873885@pc>
References: <20210713140521.GA1873885@pc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-07-13 at 15:05 +0100, Salah Triki wrote:
> Use swap() instead of implementing it since it makes code cleaner.
>=20
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>=20
> Changes since v1:
> 	- Remove the declaration of tmp
> 	- Fix typo in the description

Thank you, I've changed the subject to "gpu: ipu-v3: image-convert: use
swap()" and applied to imx-drm/next.

regards
Philipp

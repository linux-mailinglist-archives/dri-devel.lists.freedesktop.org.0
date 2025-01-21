Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AD9A179D0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 10:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7605B10E4F1;
	Tue, 21 Jan 2025 09:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1AE10E4F1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 09:04:57 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1taA9j-0007aq-08; Tue, 21 Jan 2025 10:02:43 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1taA9h-0014vV-0u;
 Tue, 21 Jan 2025 10:02:41 +0100
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1taA9h-0002UQ-0d;
 Tue, 21 Jan 2025 10:02:41 +0100
Message-ID: <4549479c7066c44943ffaae011e54c546b50df74.camel@pengutronix.de>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, Marek =?UTF-8?Q?Ol=C5=A1=C3=A1k?=
 <maraeo@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Daniel Stone <daniel@fooishbar.org>, James Jones <jajones@nvidia.com>, 
 Brian Starkey <brian.starkey@arm.com>, Michel =?ISO-8859-1?Q?D=E4nzer?=
 <michel.daenzer@mailbox.org>,  dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,  ML Mesa-dev
 <mesa-dev@lists.freedesktop.org>, nd@arm.com, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>
Date: Tue, 21 Jan 2025 10:02:41 +0100
In-Reply-To: <0e9aee49-aa69-4fb6-bab8-4624143f5267@suse.de>
References: <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
 <Z2Rf7mpSuzZ0ObmT@phenom.ffwll.local>
 <07d08a42-c44a-477e-8057-721b270310cf@nvidia.com>
 <CAAxE2A6N0xtgZmzTR9FXMN79xxy3T8zfhh1sz73h1h8=0ycJ2g@mail.gmail.com>
 <CAPj87rP4r4q-wBx1dHsEkZ7=S2c2XsbA1Pz4Skw1ETt_2yD2Ag@mail.gmail.com>
 <CAAxE2A6ghBK2VTLkNXgk1c61UG1ZQAzWQ4q=wO-OShAUC9eRmQ@mail.gmail.com>
 <CAPj87rNFy7GLAjjxDYGLN-f8M0F7yMX6PED94O4kBJ=pwtPVyA@mail.gmail.com>
 <Z4pmnTy1NYD3rLwS@phenom.ffwll.local>
 <CAAxE2A6iDsN=YKW2F7WyyZxn4Sw4Dr5CxZminQGwf8awBivovQ@mail.gmail.com>
 <0e9aee49-aa69-4fb6-bab8-4624143f5267@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mo, 2025-01-20 at 08:58 +0100, Thomas Zimmermann wrote:
> Hi
>=20
>=20
> Am 18.01.25 um 03:37 schrieb Marek Ol=C5=A1=C3=A1k:
> [...]
> >=20
> > 3) Implementing DRM_FORMAT_MOD_LINEAR as having 256B pitch and offset=
=20
> > alignment. This is what we do today. Even if Intel and some AMD chips=
=20
> > can do 64B or 128B alignment, they overalign to 256B. With so many=20
> > AMD+NV laptops out there, NV is probably next, unless they already do=
=20
> > this in the closed source driver.
>=20
> The dumb-buffer series currently being discussed on dri-devel also=20
> touches handling of scanline pitches. THe actual value varies with each=
=20
> driver.=C2=A0 Should dumb buffers use a default pitch alignment of 256 on=
 al=20
> hardware?

Not all, mxsfb for example doesn't support pitch alignment.

regards
Philipp

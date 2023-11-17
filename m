Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78867EF2EC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 13:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984D010E757;
	Fri, 17 Nov 2023 12:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 349 seconds by postgrey-1.36 at gabe;
 Fri, 17 Nov 2023 08:57:20 UTC
Received: from hygieia.sysophe.eu (hygieia.sysophe.eu [138.201.91.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1113B10E730
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 08:57:20 +0000 (UTC)
Received: from hemera.lan.sysophe.eu (unknown
 [IPv6:2001:a18:2b8:5601:a2ce:c8ff:fe62:fc79])
 by smtp.sysophe.eu (Postfix) with ESMTPSA id EDF5B2EFE640;
 Fri, 17 Nov 2023 09:51:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sysophe.eu; s=201205;
 t=1700211086; x=1700297486;
 bh=fMBEIY/I0ZwbjKiENDJG9iKUcVAo08IudR8MdNSDghw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=etuTZSobrmlvW/ZJCuoWJ1VPShCDf5ncnq/1rFg786RFzzfwgPpF7JVx+mr6rYfhF
 NyS9rLOhH3yZvIh+8+cbyKJRFPg8VbZMAfDddbp9NKxXdHTH1TeiNl8VI7vp7V/Zek
 OQpXriosJQvDLqxPgaK/4Jx37HzLElAjy/nTUCWg=
Date: Fri, 17 Nov 2023 09:51:04 +0100
From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@sysophe.eu>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 11/32] hid/picolcd_fb: Set FBINFO_VIRTFB flag
Message-ID: <20231117095104.4b317a73@hemera.lan.sysophe.eu>
In-Reply-To: <87o7fu3sd0.fsf@minerva.mail-host-address-is-not-set>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-12-tzimmermann@suse.de>
 <87o7fu3sd0.fsf@minerva.mail-host-address-is-not-set>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 17 Nov 2023 12:46:25 +0000
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, Jiri Kosina <jikos@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Nov 2023 11:27:55 +0100 Javier Martinez Canillas wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>=20
> > The picolcd_fb driver operates on system memory. Mark the framebuffer
> > accordingly. Helpers operating on the framebuffer memory will test
> > for the presence of this flag.
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: "Bruno Pr=C3=A9mont" <bonbons@linux-vserver.org>
> > Cc: Jiri Kosina <jikos@kernel.org>
> > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > Cc: linux-input@vger.kernel.org
> > ---
> >  drivers/hid/hid-picolcd_fb.c | 1 +
> >  1 file changed, 1 insertion(+)
> > =20
>=20
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Acked-by: Bruno Pr=C3=A9mont  <bonbons@linux-vserver.org>

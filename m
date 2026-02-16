Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJk8GvKmk2ln7QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0421480B7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FED10E3FE;
	Mon, 16 Feb 2026 23:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K/oBpoQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com
 [74.125.224.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9888010E3B5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 15:35:17 +0000 (UTC)
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-64ae5f0777dso3088769d50.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 07:35:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771256116; cv=none;
 d=google.com; s=arc-20240605;
 b=PaOff4lq5tgvCsTt1XJcBJreHM4GoNMTxlRhNeULQko2bAHRE4BZKB3FMZJjUbPmTD
 aLU/El3BVw69UJsGLVJYpqnjoyaUhBUF0UkY5En5yHEl+EM1AZKcfOEobFZBAwcvAlvJ
 iE6RAOSfsxVMsfVW++jYEtN8UpC3bfdTyOLl+ZR0OUIqJgedeETtqg95LgpgDnPTVeUX
 xAjs1gYlEBB8css7vly7MAeeImex3Yp72broSyzB2GXgWYR9/QZ+K4GxzsuHO6+lXYhA
 XXfZGJxNLMLCtFvVYRkN7qsq2p2XCoxQbI7lsTYwqGWq82/dOoCTZ0vpuv76fT2JXAOM
 GYxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=m7Zin8SCAGhBM2qXa/UxtLNL7lsiswaHfzlLDmlaKAM=;
 fh=ZYITwNoeEx8XZFGeQmtUeMgbuBfZ3GtGJnRyla0MdW4=;
 b=j2qYPczpIsmIydjDbMEJF+JkrhCphsuiVlUfaWWi3oCAHROVzzvQ6ws8FawiE0Csg7
 YrAr7u/qDmNZ68d/YmtSikalEVZaqhLIXElkNqfbWRe7jitLBQng0Z5uaN/UFvIEKMB/
 6bJCoFqPm58FMl4dsytN1S4GXltsAwM/Bn+93mpuOJDoo94VBlLlpIyNFKM7qq1PmbJa
 bbrfrnWtrmfy5iZ2duid7nHM4uPI5UaNU66Tw2BBQSjSVgklDa6mLETAF7btSCCTqFbI
 gyuTsDY5SyHy/et9zDjx5PklVK69WE+52M9CPwM2XrIh0Z6qxyJu2WSovKU4Dvw7JIl3
 YSAA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771256116; x=1771860916; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m7Zin8SCAGhBM2qXa/UxtLNL7lsiswaHfzlLDmlaKAM=;
 b=K/oBpoQFNwPi7hdrqTxqya9mRcQZijCzBwYURKHEK80YPvH/K3ZAmHEMEAkMVV1pMA
 Yg+A4Y8mrHew7UNWYia6TnhSaKJbu9v8SZN5nH4corh+31bqqgHmVJHHtFaGPaU2v3w2
 SS/H3ZUMHPExbqnukNmCsU/ciG43P9YOflL8fZdCN8ivGWk1KoqeuYlpVQMRxH3z5kUR
 VVmnDB0nib32ldcigiaRCvv5ifeOandvaiuT8KkxGLWA1M8gW7SSl3mtpweP61e4EAVR
 vz0KQ9tPz5gl2EughE7HWUzXRkcd3/W7fAs+qnXGGUV0cQwN1tcRZNOgOj0oaIU1QUbZ
 QUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771256116; x=1771860916;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=m7Zin8SCAGhBM2qXa/UxtLNL7lsiswaHfzlLDmlaKAM=;
 b=derPF2GKGGtYHHGRIhV1b1XFWaqjNYuSVQvHZ9h9s6XL16FM91tqcIrE7LDE/+oCOq
 +QNh0vHLvIwghjW34MKJGgimn90H+llJ17y6aVhuezl3DxfcQ7lUNJqUOG9d5pSv2FVG
 vpw0O21M1xwRSpiPhRHi/dd0Njv6fHSgg1J0tap8Nbw520U9KpWn5iR2sv09Y+IRBgsf
 vufURgIfOkLCPXSqjiVwiT8daPhG/ls80vTtnYV7/ibPMOw+dxS12lv3uQeZ99gdCbqf
 AEptQrNPzDy6zNbHdOZdvNccfzftja0QTMX/urGX6danv87oPBjfOSPNoBlbKP/tYqLo
 K5VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRu/mBiHtDecNw2LDqhu57EruwaibzVD2r/mFYjpyhkF+nhxMf5z0AOziGbeJw7u3CS3w699U5xRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLTM4Te9rihxIwBKF9aF50WEodbuEv7ktBD6b0zLU+7wNNJBR6
 EYXaeH20CVYnHeI/Hk8hDDMP6XYe089DxqOsyUWFQcvPcRPgbIvlvTX0R9FijNLfw7uI7xMATDv
 3PGo7AkOJafEchEb5UdjQGevs7PjICTg=
X-Gm-Gg: AZuq6aIOTR8usSsI3NR5JR8nWkaPjdrqpdeLDIk+oQrpJvhVQK8PuUpNUSyzBiF5/rb
 EsmXDFpPXbw3nkSvWGNzaedXjfbytbedgbgadbXKN/OlyxinMQkyhWT+v6O6hCykQIWym1M4Bdk
 4FeVgoehEeX1UjkflC9vTWv87RqXdRtzFHNp9coz5fPO1fK1T8skoBjPQMMlOtZax9TqV37VkV7
 97g3G1KZrGgbxMiyBu5K6KdAkKHnDt8jO4q0U05V5OLUp5nIHrFFlRkjLa2m7JBwRIwA4DhlZ66
 lMW2EfN+9v6fF/v7tkzLtBDTC0Ea+yS/j0bYiCqUYGJ+tWVDbPJa
X-Received: by 2002:a05:690c:368e:b0:795:294c:fd3d with SMTP id
 00721157ae682-797a0cca6c4mr183176837b3.50.1771256116367; Mon, 16 Feb 2026
 07:35:16 -0800 (PST)
MIME-Version: 1.0
References: <20260214070123.41374-1-architanant5@gmail.com>
 <3bb62aa4-d3b5-4dba-b3bf-fc1a82264274@lechnology.com>
 <CADJHxWDgARMDXCKJ+F+z2mOooqxptPfjbYk2dVG38scZ7hNSaA@mail.gmail.com>
 <dc0b7b09-d6a2-4e14-904a-d26396998529@lechnology.com>
In-Reply-To: <dc0b7b09-d6a2-4e14-904a-d26396998529@lechnology.com>
From: Archit Anant <architanant5@gmail.com>
Date: Mon, 16 Feb 2026 21:05:05 +0530
X-Gm-Features: AZwV_QgKPeVb6e3ZGS3zNZ2N5kL9uh9wKDlTC5A9Kf7xgSu5YQQQeXfzjHaqUOo
Message-ID: <CADJHxWA2N8x853A3LjCZkip5-Lp6jWWUBTgN8MZWajHFU7o4tA@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/sitronix: add ST7789V panel driver
To: David Lechner <david@lechnology.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, javierm@redhat.com, nathan@kernel.org, 
 geert+renesas@glider.be, marcus.folkesson@gmail.com, noralf@tronnes.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 16 Feb 2026 23:23:19 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:david@lechnology.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:javierm@redhat.com,m:nathan@kernel.org,m:geert+renesas@glider.be,m:marcus.folkesson@gmail.com,m:noralf@tronnes.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:marcusfolkesson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,redhat.com,glider.be,tronnes.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lechnology.com:email]
X-Rspamd-Queue-Id: 9E0421480B7
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 4:15=E2=80=AFAM David Lechner <david@lechnology.com=
> wrote:

Hi David,

>
> On 2/14/26 11:21 PM, Archit Anant wrote:
> > Hi David,
> >
> >> Do we actually need a custom driver for these or can we use
> >> drivers/gpu/drm/tiny/panel-mipi-dbi.c with a firmware file for
> >> init?
> >
> > That was my initial thought as well, but looking at the staging driver
> > (fb_st7789v.c), there is conditional logic in the initialization sequen=
ce.
> >
> > The HSD20_IPS panel requires different PORCTRL (0xB2), GCTRL (0xB7), an=
d
> > Gamma (0xE0/E1) settings compared to the standard panel. A static
> > firmware blob via panel-mipi-dbi would not allow selecting between
> > these configurations based on the compatible string, so a dedicated
> > driver seemed necessary to preserve this support.
> >
> > Best regards,
> > Archit
>
> If two different panels are not 100% compatible with each other, they
> should not have the same compatible string.
>
> It seems like it would be much more efficient to fix the existing
> devicetree/driver if needed rather than writing an entire new driver.

Agreed. ChenYu Tsai mentioned he is working on refactoring the existing
panel-sitronix-st7789v driver to use mipi_dbi.

Once that is ready, I can add the HSD20-IPS panel support to that driver
using a distinct compatible string and associated configuration data,
rather than forking a new driver.

I will drop this standalone driver patch and wait for Chen-Yu's series.

--=20
Sincerely,
Archit Anant

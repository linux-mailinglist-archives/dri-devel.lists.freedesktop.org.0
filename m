Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F78B39696
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 10:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4649710E86E;
	Thu, 28 Aug 2025 08:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Br6pP9j+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151D210E860
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 08:15:54 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cCDjx5c4cz9syn;
 Thu, 28 Aug 2025 10:15:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1756368949; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g6BFsh8A6GJ9PUMZxt3nxah5ekgd0ZK8W1eentIhHKI=;
 b=Br6pP9j+HVeHhjZtjfHowQnOU6GxI1VUQGxLdeSaRyvO1wj452x8vZXOmFZobjey9yYyje
 x9/PclajEwk6t9OQ7s+ozevwV1r6zJ42kNhkLfsoPQvZMnM2bQqyPaImEVx6jJewf1zo5g
 l1b66KLhJOCjbUoZMw4MeUPHBBTXDkZOy8fFRL0DWxNL0AeNJLVi9Pn1OAHld9hrK9Rr+d
 1CfMU83HD51KjFL2d2wsbuwUOlwDPG0kQf7m3GiMPFfgZJffBIW0PA7P+fdSKCznGNTI2r
 h9LZqe0TBhRHECkqD21yfC2vWIr9fhFzYg+nCPjI9yOgbVHfxai7rFBerMX0vA==
Message-ID: <698ebb7319fbdb405dd7f9ddf96d82a7fdd5e023.camel@mailbox.org>
Subject: Re: drm/sched/tests: Remove redundant header files
From: Philipp Stanner <phasta@mailbox.org>
To: Markus Elfring <Markus.Elfring@web.de>, Philipp Stanner
 <phasta@kernel.org>,  Liao Yuanhong <liaoyuanhong@vivo.com>,
 dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, Matthew Brost <matthew.brost@intel.com>, Maxime Ripard
 <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date: Thu, 28 Aug 2025 10:15:44 +0200
In-Reply-To: <697bb91b-24ea-4830-8794-373f709aa37e@web.de>
References: <20250819142630.368796-1-liaoyuanhong@vivo.com>
 <acb4e709-a42f-4591-a406-7745bcd0422f@web.de>
 <119cb44579d745ad3e47d649e6ee6fea9fd9d146.camel@mailbox.org>
 <697bb91b-24ea-4830-8794-373f709aa37e@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: hma6xr6w5t7dfcyo4unzmohy6gz1s15w
X-MBO-RS-ID: dc140174502893cec38
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2025-08-25 at 12:48 +0200, Markus Elfring wrote:
> > > > The header file <linux/atomic.h> is already included on line 8. Rem=
ove the
> > > > redundant include.
> > >=20
> > > You would like to omit a duplicate #include directive, don't you?
>=20
> The change intention is probably clear.
>=20
>=20
> > > Will a corresponding refinement become helpful for the summary phrase
> > > and change description?
> >=20
> > I don't understand what you mean. Can you elaborate?
> >=20
> > Both patch content and description are completely fine as far as I'm co=
ncerned.
>=20
> How do you think about to distinguish better between the deletion of head=
er files
> and an adjustment for a repeated preprocessor directive?

The patch is very trivial and the commit message is perfectly fine.


Applied it to drm-misc-next

Thx
P.


>=20
> Regards,
> Markus


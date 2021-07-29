Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEB23D9DCD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 08:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F426E0DA;
	Thu, 29 Jul 2021 06:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764CF6E0DA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 06:46:25 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E1B22201D4;
 Thu, 29 Jul 2021 06:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627541183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1nf827K+1Yxm+C3xVbLZk7yaLUh//30Nx2C8n7Dp48=;
 b=zBU9jMncLpusagb0BjBqHfYquw6la0I4SD6OqXKoWqZ3d7DwdqLaIQ4z0vSK95csb0EyLH
 GC8qg2OJLYKmcUNzkaolLXRRQSqz8V6iPSeQZuH6vAF6kt+eTuv8W293wUsGGVJFJ55R5+
 WcdavFpfrenePNvdsTfllG14wPGApu8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627541183;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1nf827K+1Yxm+C3xVbLZk7yaLUh//30Nx2C8n7Dp48=;
 b=NqxgM2YLu5Ru1kqP2Jd3brCGYNif0gzTp1C3SBGQQpgRfK17wzeOuDQyPitFwj/+FS1GTv
 8kwk8KlG5bsPjaCw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B9E6B13AB3;
 Thu, 29 Jul 2021 06:46:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 19H1LL9OAmE+WQAAGKfGzw
 (envelope-from <iivanov@suse.de>); Thu, 29 Jul 2021 06:46:23 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210728115419.kt3tdhx5jmmk42u2@gilmour>
References: <20210723072414.17590-1-iivanov@suse.de>
 <20210728115419.kt3tdhx5jmmk42u2@gilmour>
From: Ivan T. Ivanov <iivanov@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/vc4: hdmi: Add debugfs prefix
Date: Thu, 29 Jul 2021 09:46:23 +0300
Message-ID: <162754118323.22367.3766747345834573441@localhost>
User-Agent: alot/0.9.1
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2021-07-28 14:54:19)
> Hi,
>=20
> On Fri, Jul 23, 2021 at 09:24:14AM +0200, Ivan T. Ivanov wrote:
> > Without prefix debugfs can't properly create component
> > debug information tree when driver register more than
> > one component per device, in this case two. Fix this.
> >=20
> > debugfs: Directory 'fef00700.hdmi' with parent 'vc4-hdmi-0' already pre=
sent!
> >=20
> > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
>=20
> Thanks for your patch.
>=20
> However, that part changed fairly significantly recently so you'll need
> to rebase it on top of the drm-misc-next (or linux-next)
>=20

Thanks, will do.

Regards,
Ivan

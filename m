Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 780FC3DA342
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 14:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C696ED8E;
	Thu, 29 Jul 2021 12:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0106C6ED8E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 12:38:21 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5D89722296;
 Thu, 29 Jul 2021 12:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627562300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DuKG1Hw6+LWY5rC96vAG57cCXXHD158grqFN/MFqgd0=;
 b=CKlmRScEALWTzuyWTqAMOJdmIk+HpIAVBwyMcmA1U9uyZRnZ3LB3y9rdRUusdVJWHfpThY
 x8SqYUoDOFmSaDIWaRVtqGsabbx+VGjDdLFTzPq6JbougnEQYjVX8e/Ahp+lT2urh42gx2
 BGZMlBn9sjvGkbYfvMeTVHuZl2jyKso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627562300;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DuKG1Hw6+LWY5rC96vAG57cCXXHD158grqFN/MFqgd0=;
 b=zjk2OTGnwf/8glhYQMgSOuD/J+ZGbCSoihd+ycd7jTXFBadfDKhhgYVbeXZ7lld7SU1ixs
 /UVQ3gKyJWmU4pDg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3F04512FF9;
 Thu, 29 Jul 2021 12:38:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id GDHhDjyhAmFZdwAAGKfGzw
 (envelope-from <iivanov@suse.de>); Thu, 29 Jul 2021 12:38:20 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <162754118323.22367.3766747345834573441@localhost>
References: <20210723072414.17590-1-iivanov@suse.de>
 <20210728115419.kt3tdhx5jmmk42u2@gilmour>
 <162754118323.22367.3766747345834573441@localhost>
From: Ivan T. Ivanov <iivanov@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/vc4: hdmi: Add debugfs prefix
Date: Thu, 29 Jul 2021 15:38:19 +0300
Message-ID: <162756229967.27869.17983896381993823317@localhost>
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

Hi,

Quoting Ivan T. Ivanov (2021-07-29 09:46:23)
> Quoting Maxime Ripard (2021-07-28 14:54:19)
> > Hi,
> >=20
> > On Fri, Jul 23, 2021 at 09:24:14AM +0200, Ivan T. Ivanov wrote:
> > > Without prefix debugfs can't properly create component
> > > debug information tree when driver register more than
> > > one component per device, in this case two. Fix this.
> > >=20
> > > debugfs: Directory 'fef00700.hdmi' with parent 'vc4-hdmi-0' already p=
resent!
> > >=20
> > > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> >=20
> > Thanks for your patch.
> >=20
> > However, that part changed fairly significantly recently so you'll need
> > to rebase it on top of the drm-misc-next (or linux-next)
> >=20
>=20
> Thanks, will do.
>=20

It looks like this patch is not relevant anymore.

Side note: vc4_hdmi_audio_component_drv and related definitions
seems unused.

Regards,
Ivan

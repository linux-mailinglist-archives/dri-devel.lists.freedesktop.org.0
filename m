Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F86970BC1A
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 13:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD7910E2DF;
	Mon, 22 May 2023 11:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEF810E2DF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:44:36 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 2645C1FE83;
 Mon, 22 May 2023 11:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684755872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RXgpxboI1bw9eXRQKxoN/Zr/TelBo2erFp+oCAN6jQ4=;
 b=xshnHi/ZPGtf5PnerhW07I/ZJ3gtuXaQXOMW1lqWJPHulL6JCwemBTdT6hrFHwIIHSed4v
 ea2F1eVZy8EXq+1FsNxVQTtwHaY1yz1Ptq/ScwtUkJim3RYiBlETvetX0UbmO4Ety9M0ni
 hwzOSYQrMj/LOTJYuPl9EjduENWCBiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684755872;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RXgpxboI1bw9eXRQKxoN/Zr/TelBo2erFp+oCAN6jQ4=;
 b=VCaQEPWIJMQFKfvjU2QqgEyFocOltgb1T0Aku6lMo9jnDOFeFltWYrRg398m5sQNJb9NTE
 E4mo0IqKd9uklYBQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id D0A092C141;
 Mon, 22 May 2023 11:44:31 +0000 (UTC)
Date: Mon, 22 May 2023 13:44:30 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/ofdrm: Update expected device name
Message-ID: <20230522114430.GA15906@kitsune.suse.cz>
References: <20230412095509.2196162-1-cyril@debamax.com>
 <20230412095509.2196162-3-cyril@debamax.com>
 <CAMuHMdW4rZn4p=gQZRWQQSEbQPmzZUd5eN+kP_Yr7bLgTHyvig@mail.gmail.com>
 <5694a9ab-d474-c101-9398-eea55aab29df@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5694a9ab-d474-c101-9398-eea55aab29df@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Cyril Brulebois <cyril@debamax.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 11:07:45AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 24.04.23 um 09:33 schrieb Geert Uytterhoeven:
> > Hi Cyril,
> > 
> > CC DT
> > 
> > On Wed, Apr 12, 2023 at 12:05 PM Cyril Brulebois <cyril@debamax.com> wrote:
> > > Since commit 241d2fb56a18 ("of: Make OF framebuffer device names unique"),
> > > as spotted by Frédéric Bonnard, the historical "of-display" device is
> > > gone: the updated logic creates "of-display.0" instead, then as many
> > > "of-display.N" as required.
> > > 
> > > This means that offb no longer finds the expected device, which prevents
> > > the Debian Installer from setting up its interface, at least on ppc64el.
> > > 
> > > Given the code similarity it is likely to affect ofdrm in the same way.
> > > 
> > > It might be better to iterate on all possible nodes, but updating the
> > > hardcoded device from "of-display" to "of-display.0" is likely to help
> > > as a first step.
> > > 
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=217328
> > > Link: https://bugs.debian.org/1033058
> > > Fixes: 241d2fb56a18 ("of: Make OF framebuffer device names unique")
> > > Cc: stable@vger.kernel.org # v6.2+
> > > Signed-off-by: Cyril Brulebois <cyril@debamax.com>
> > 
> > Thanks for your patch, which is now commit 3a9d8ea2539ebebd
> > ("drm/ofdrm: Update expected device name") in fbdev/for-next.
> > 
> > > --- a/drivers/gpu/drm/tiny/ofdrm.c
> > > +++ b/drivers/gpu/drm/tiny/ofdrm.c
> > > @@ -1390,7 +1390,7 @@ MODULE_DEVICE_TABLE(of, ofdrm_of_match_display);
> > > 
> > >   static struct platform_driver ofdrm_platform_driver = {
> > >          .driver = {
> > > -               .name = "of-display",
> > > +               .name = "of-display.0",
> > >                  .of_match_table = ofdrm_of_match_display,
> > >          },
> > >          .probe = ofdrm_probe,
> > 
> > Same comment as for "[PATCH 1/2] fbdev/offb: Update expected device
> > name".
> > 
> > https://lore.kernel.org/r/CAMuHMdVGEeAsmb4tAuuqqGJ-4+BBETwEwYJA+M9NyJv0BJ_hNg@mail.gmail.com
> 
> Sorry that I missed this patch. I agree that it's probably not correct. At
> least in ofdrm, we want to be able to use multiple framebuffers at the same
> time; a feature that has been broken by this change.

How did it work before, though?

We did not have this device name clash, then we did, and it was solved
by renaming the devices to numnered.

Now matching the first device should restore the previously available
functionality, mathing any of the numbered devices would potentially
allow to use multiple devices.

Or am I missing something?

Thanks

Michal

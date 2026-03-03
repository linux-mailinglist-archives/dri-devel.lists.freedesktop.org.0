Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB8bJ0TmpmnjZAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:46:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF51F0A0A
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7CA10E80D;
	Tue,  3 Mar 2026 13:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="J4/2zGuw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322F210E818
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 13:46:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AE3C61A2357;
 Tue,  3 Mar 2026 13:46:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 822595FF87;
 Tue,  3 Mar 2026 13:46:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 70C2C103695E2; Tue,  3 Mar 2026 14:46:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1772545594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=XDRpvBtYzC34KJ2LgpsbI01brcrkDd6rfNwNv6anEv4=;
 b=J4/2zGuwaWqYyv4I21zejYDFYxBN3Fgy20I5xGwVPpjl9rTCySOIPU1yAmxpx6GO2LYyWo
 YvuF9uPEme6AhEz0Vvi8qsfc7T5TRUg8upSniC3XxWz8DnQKwwQUrof8aF2+ZU1w3bpPbV
 2nVnd1EW0elrOOUtsDxqCyrm6DpShSOORtOfYxT/MLmeYWuOPn0iHWFbAlTyHX1xVu0IIz
 C3DAtx3GG3LpKZE5RycUx0GGBSTf4Uyg9X9Q+Ky9LayNVrIEn6q/ZlRH++TuCsDvlFcw78
 pfCLugJLBnJN1lcYW8pM5ADAEKGqzx/tA2xPrDKkIwTesFYKPtRA8kDO81dBfw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 14:46:31 +0100
Message-Id: <DGT6YZGAMK2M.1NLHXMQI54ZW5@bootlin.com>
Cc: "Marek Vasut" <marek.vasut+renesas@mailbox.org>,
 <dri-devel@lists.freedesktop.org>, "David Airlie" <airlied@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>, "Geert Uytterhoeven"
 <geert@linux-m68k.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
X-Mailer: aerc 0.20.1
References: <20260115024610.661624-1-marek.vasut+renesas@mailbox.org>
 <20260303-uppish-finicky-mustang-cd135f@houat>
 <CAMuHMdW4HwgwiBJFkA43MpYWOScG8n7p4p3_KBL+Cg3_P_a18w@mail.gmail.com>
 <20260303-delectable-just-clam-d25e08@houat>
In-Reply-To: <20260303-delectable-just-clam-d25e08@houat>
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
X-Rspamd-Queue-Id: 56FF51F0A0A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:airlied@gmail.com,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:mripard@kernel.org,m:geert@linux-m68k.org,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,lists.freedesktop.org,gmail.com,linux.intel.com,ffwll.ch,suse.de,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:url,bootlin.com:mid,mailbox.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,glider.be:email]
X-Rspamd-Action: no action

Hello,

On Tue Mar 3, 2026 at 9:39 AM CET, Maxime Ripard wrote:
> On Tue, Mar 03, 2026 at 09:14:53AM +0100, Geert Uytterhoeven wrote:
>> Hi Maxime,
>>
>> On Tue, 3 Mar 2026 at 09:07, Maxime Ripard <mripard@kernel.org> wrote:
>> > On Thu, Jan 15, 2026 at 03:45:53AM +0100, Marek Vasut wrote:
>> > > Update drm_of_get_data_lanes_count_ep() return value documentation
>> > > to match the drm_of_get_data_lanes_count() return value documentatio=
n.
>> > > The drm_of_get_data_lanes_count_ep() is only a wrapper around the
>> > > drm_of_get_data_lanes_count() and therefore returns the same error
>> > > codes.
>> > >
>> > > Fixes: fc801750b197 ("drm: of: Add drm_of_get_data_lanes_count and d=
rm_of_get_data_lanes_ep")
>> > > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>
>> > > --- a/drivers/gpu/drm/drm_of.c
>> > > +++ b/drivers/gpu/drm/drm_of.c
>> > > @@ -539,8 +539,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count);
>> > >   *
>> > >   * Return:
>> > >   * * min..max - positive integer count of "data-lanes" elements
>> > > - * * -EINVAL - the "data-mapping" property is unsupported
>> > > - * * -ENODEV - the "data-mapping" property is missing
>> > > + * * -ve - the "data-lanes" property is missing or invalid
>> >
>> > I have no idea what "ve" means in that context. We should rephrase or
>> > pick something more obvious.
>>
>> "-ve" =3D negative, "+ve" =3D positive.
>
> Thanks!
>
> My point still stands though.

I also stared at "-ve" cluelessly, so I vote for plain English too.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

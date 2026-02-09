Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J3gFUJSimmmJQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 22:31:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63BD114D1D
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 22:31:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C8110E475;
	Mon,  9 Feb 2026 21:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="g1FdAFIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7518910E475
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 21:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1770672694; x=1771277494; i=deller@gmx.de;
 bh=tB45TqH/dtbtLnOhTFVSoU1kv/1AALDk9LvseHdKOkc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=g1FdAFIvISnaxj7cpgJGJmJgml5aEAB+XOdmShqKxfh4Te66S60WwTsn7ZsfdXqA
 6fCYoFr7hcarLb/I+uVAjRDV7LKLnVuftF9O/8AvbYUcYV4TiRVIxO9jIKw2q85hP
 VQevGNP6mpsD47ZksXpkvwcAkmz0hjtzooZ/WYjZCIeEtjCocsTjvi2mlOyqvt6V0
 GpU7lBgqwiXuvKF6Vki10AY9i6PaGbEEoUeG76Kc3NpSvf3pkQQVfEFiOQu5EvQy9
 ejdb/xHWZK7diSc4NDcsE035MoBNEEFv8vzBH/HIyT8k5aULKh4BcQ9r3HyeL41Bu
 RdAouozALbxy5lOvXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.172]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5mGH-1vimSr2cIN-00vohM; Mon, 09
 Feb 2026 22:31:34 +0100
Message-ID: <3e70bea8-aa35-4cfd-9e54-eaeaa7b5267a@gmx.de>
Date: Mon, 9 Feb 2026 22:31:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbcon: Remove struct fbcon_display.inverse
To: Thomas Zimmermann <tzimmermann@suse.de>, geert@linux-m68k.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
References: <20260209161609.251510-1-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260209161609.251510-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tCc6HKhDHE/WUmSsIlsyp2EdntdgFbx8OxdNhHsjLWOH/n0wiaP
 oSiTThLzVyVZ9xHS6imlxz5SrIxDGV/NVcmlykKPy1GK1Hv38maXj8cqWZQZgQtCHq5tNFY
 gZxRQdzc+rx6lUi6qhWjzhQpAyncwfUzm3y40eWWoh2PdbsC/MDGmsohpf6QhLrqVyU4htu
 g1Z4OXB6Fo3w1l0cig/8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Rr+K/nXgW2Q=;pFnQHP/omtYhUoorcPhrWEvaK5t
 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
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:geert@linux-m68k.org,m:linux-fbdev@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim,gmx.de:email,suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A63BD114D1D
X-Rspamd-Action: no action

On 2/9/26 17:15, Thomas Zimmermann wrote:
> The field inverse in struct fbcon_display is unused. Remove it.

Indeed, seems to be unused.
 =20
> The field apparently never did anything. Commit c7ef5e285c84 ("video:
> fbdev: atari: Fix inverse handling") converted its final user to call
> fb_invert_cmaps() instead.

That commit seems not to be related, as it touches a static
inverse variable inside the atafb driver only.
Commit e4fc27618b75 (from 2005) touched it last time, but it seems even ol=
der.

Patch applied to fbdev, but I dropped the wrong commit reference in the
commit message.

Thanks!
Helge

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: c7ef5e285c84 ("video: fbdev: atari: Fix inverse handling")
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: <stable@vger.kernel.org> # v6.0+
> ---
>   drivers/video/fbdev/core/fbcon.h | 1 -
>   1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core=
/fbcon.h
> index 1cd10a7faab0..fca14e9b729b 100644
> --- a/drivers/video/fbdev/core/fbcon.h
> +++ b/drivers/video/fbdev/core/fbcon.h
> @@ -30,7 +30,6 @@ struct fbcon_display {
>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>       u_short scrollmode;             /* Scroll Method, use fb_scrollmod=
e() */
>   #endif
> -    u_short inverse;                /* !=3D 0 text black on white as de=
fault */
>       short yscroll;                  /* Hardware scrolling */
>       int vrows;                      /* number of virtual rows */
>       int cursor_shape;


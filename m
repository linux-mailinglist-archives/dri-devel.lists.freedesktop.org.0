Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKHkB42dqmlLUgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:25:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EE221DDDD
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5492C10ECB7;
	Fri,  6 Mar 2026 09:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Raw2qJuY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 314 seconds by postgrey-1.36 at gabe;
 Fri, 06 Mar 2026 09:25:28 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2918A10ECB8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 09:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772789125; x=1773393925; i=deller@gmx.de;
 bh=El5PeZN58Jvu2IRJ97MzEZy0kMI5BWE/U2IdQNuwxLc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Raw2qJuY3oBZFnYnTLk10393Pf0cqB5BgJ1/kZ9qmQ8hlqLTI4b3ZGYGyBtjpOY3
 4ynXSjMz1k2xYOxo5TzSomwcoEfqadcXI9QsYQYnLHH/hCcRhI5rzmDBJRFpM1Zt6
 x7foRw+W7Ct5qILrImgRU4j93olanbYwcbzoyOrugmTbBVZO4+4zBcI5QT1haf6T0
 qfoo/4Hp3lJwmHl5CmTQv2DXbTjk35d5pvnnayRSDcJ09O4p10KRmjupUIUp1ZYsk
 sCadFyjoYY1Eg/7oXQiQrLjSPWgyXxtOHOOSfydphjijlWLhQKDoqGzNql6Au0cJb
 LljYJh+giWKcHOi9vg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1HZo-1vvgSf42jy-00AwZ6; Fri, 06
 Mar 2026 10:20:12 +0100
Message-ID: <2c1ed16c-a456-422e-846b-525b84f54efe@gmx.de>
Date: Fri, 6 Mar 2026 10:20:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: macfb: Replace deprecated strcpy with strscpy
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260305103919.158067-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260305103919.158067-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:x/95cAcBJk27tEaOnKvYoIEJmdEx3gIWIFNQLDOOpj+BY1qS3kT
 QARn2MswYCCCOW+UQLUW7SxT9WMJEhFeDCx9XTZa8rQLe2AwL8jCuu9HsrQn56cDOKWOiTy
 ewDeKZQCUkVZyEFw+9Kq0QcrwDM6onwHhcieSTq6leSmP4JrlmjX0S7qg87sfir+Rkg0fcF
 e7SVeh8VnrBjdHuM2EiHg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xnhxPsbnm1o=;+lyamEyGTwLZUlNWBscI5bummwB
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
X-Rspamd-Queue-Id: 65EE221DDDD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thorsten.blum@linux.dev,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,gmx.de:dkim,gmx.de:mid]
X-Rspamd-Action: no action

On 3/5/26 11:39, Thorsten Blum wrote:
> strcpy() has been deprecated [1] because it performs no bounds checking
> on the destination buffer, which can lead to buffer overflows. Replace
> it with the safer strscpy().  No functional changes.
>=20
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#str=
cpy [1]
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   drivers/video/fbdev/macfb.c | 38 ++++++++++++++++++-------------------
>   1 file changed, 19 insertions(+), 19 deletions(-)

applied.

Thanks!
Helge

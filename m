Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA0GBhDPhWlBGwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 12:22:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B778FD2CC
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 12:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD9910E047;
	Fri,  6 Feb 2026 11:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="r4RbZrga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F5D10E047
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1770376960; x=1770981760; i=deller@gmx.de;
 bh=8DAXiq19GWC6LUmKQanD+++Is0pDsVxfDZIickGqEtU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=r4RbZrgaMNlVG3H19y0U2bl1FW4Mb4M5QYSpPi30EiX4C72Ixann9wbjOWcaudE4
 67LkMojcqFIrxkaPxBv3W6/iz4JwLZ9UyapRQr7vmP+mecnWaKmmJ9vRVb4rMxDr2
 Oc3V4RyzvPoNeW5kghJsDfOCwSu0+0tV3XaFOFcqOmDhPKN32rgiY3Id5rl0yGVEl
 Xad2Hp3dA5FAeahreXrF9QIQj9VK2mg+jLKnLkGp0UZzcWnoAqd7aSm3xnrFkZX0I
 cDMpyrDP+rzGM/mXT85invqZTUjMLE7bP+UC2jpHofAuT5GoHOq0F8mwHK7B+lwIp
 p+KmCMniQgTqYTIkqQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.105]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNbkp-1wCjMp22Yd-00SyMa; Fri, 06
 Feb 2026 12:22:40 +0100
Message-ID: <28affc45-7f41-40a5-82bf-308a6e34d956@gmx.de>
Date: Fri, 6 Feb 2026 12:22:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] fbdev: au1100fb: Mark several local functions as
 static
From: Helge Deller <deller@gmx.de>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <cover.1770196161.git.u.kleine-koenig@baylibre.com>
 <ceb08e29f6a07075b5ca63e4ed30c5051fddcdfd.1770196161.git.u.kleine-koenig@baylibre.com>
 <cf0433eb-e22d-498b-93a2-04b461aaa6e2@gmx.de>
Content-Language: en-US
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <cf0433eb-e22d-498b-93a2-04b461aaa6e2@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XuuMjbkwwcX00krKo8n+gAafhEHcovVdUjQkP98fHp9nk0xBK5b
 f6Xigtdhg+xG0VzTBb/vsecbGYyASFpI68sqvDk/Z4bWuj6SYV0blbmVJM9GA4qcjjLP1YZ
 C8D/W5mz4p/YeAW6E+ctXidzY5l4piE1Fe6+1+Kn0s4t5PRHhYq0rr/1YG8exeWnNaAXdTu
 I3ucZqrOBhlDGCm1y+Bpg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JqpdemcuzwY=;LUnBvcEs+1Fw20Ux5wwulocdnl1
 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
 sV/uklEg=
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,baylibre.com:email]
X-Rspamd-Queue-Id: 3B778FD2CC
X-Rspamd-Action: no action

On 2/6/26 12:06, Helge Deller wrote:
> Hi Uwe,
>=20
> On 2/4/26 10:15, Uwe Kleine-K=C3=B6nig wrote:
>> This fixes several (fatal) compiler warnings =C3=A0 la
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0drivers/video/fbdev/au1100fb.c:530:6: error: no=
 previous prototype for =E2=80=98au1100fb_drv_remove=E2=80=99 [-Werror=3Dm=
issing-prototypes]
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 523 | void au1100fb_drv_remove(struct pl=
atform_device *dev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
>>
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
>=20
> I've applied patches #1 and #3 of this series to the fbdev git tree.
>=20
> Patch #2 needs fixing, as it breaks build on s390x.

I fixed up patch #2 manually for now by excluding s390x as test platform.
If you have a better patch, I'm happy to take it.

Thanks!
Helge

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ0GEEzLhWlWGgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 12:06:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A6AFD03B
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 12:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5922010E739;
	Fri,  6 Feb 2026 11:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Sjdr3/RQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0B110E739
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 11:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1770375997; x=1770980797; i=deller@gmx.de;
 bh=d8A+0zPm4TBfo+NKAfx3v7hEe848gR8wtCEr4PFiIgM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Sjdr3/RQL1ZAyEar/QN8PIl8ASmkNrWXw7uVB19DMnoooY76cVehd+aMtwGiHv8l
 ohv8uhsm23qAX1TrO2HzyygpSvsGhWdilpFF7bSDBsRENgjWdYf4zWvFjh88af+hw
 qtx6QpTT6NaKK7oarltpFb2N5wPcdJuPrS1RTHuX/91mAK1YHRH9QQ9v23ul9cLc3
 zMsJ78f77uLwhqkwFE66Z0BVtinZJb7fF0NDGvNkDU2qtIl6PkYrGZSmJCG7QqiO/
 d/qXNYed0u87jGeXSDUonIjJWFsIO6gndgOK5LgoKTmvay0yL2VPd3k2Vd6L8kfMr
 JCZwlWRrr9GNvEmzpw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.105]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwQTF-1vV8ky1xiv-01682f; Fri, 06
 Feb 2026 12:06:37 +0100
Message-ID: <cf0433eb-e22d-498b-93a2-04b461aaa6e2@gmx.de>
Date: Fri, 6 Feb 2026 12:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] fbdev: au1100fb: Mark several local functions as
 static
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <cover.1770196161.git.u.kleine-koenig@baylibre.com>
 <ceb08e29f6a07075b5ca63e4ed30c5051fddcdfd.1770196161.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <ceb08e29f6a07075b5ca63e4ed30c5051fddcdfd.1770196161.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wAAyznsmj26QWB6Jofu4YZiNMx3XGinITV8BJVRiOOKtJ1lLLxl
 j+CB5LUzYLHazzI/xIoFX1/JYO8mPE+Y16D7lafrIaNT45KUyega2SGe8IPSvCn9rvpncBR
 EoX/kHXkBjqHdjzsFID3ysMN1tYDBtNIrtulqEk7HaFaKcRv6uwgJMiy/zuPFPwAn2rLuTp
 qKziA1EvoLUoQQJ5gph/Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:43v8frRuscY=;qk2vBonjMu3JhS9lQ3xKj+aLZ+Z
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 92A6AFD03B
X-Rspamd-Action: no action

Hi Uwe,

On 2/4/26 10:15, Uwe Kleine-K=C3=B6nig wrote:
> This fixes several (fatal) compiler warnings =C3=A0 la
>=20
> 	drivers/video/fbdev/au1100fb.c:530:6: error: no previous prototype for =
=E2=80=98au1100fb_drv_remove=E2=80=99 [-Werror=3Dmissing-prototypes]
> 	  523 | void au1100fb_drv_remove(struct platform_device *dev)
> 	      |      ^~~~~~~~~~~~~~~~~~~
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

I've applied patches #1 and #3 of this series to the fbdev git tree.

Patch #2 needs fixing, as it breaks build on s390x.

Helge

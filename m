Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIfMAO2jgGkgAAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 14:17:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54514CCA6E
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 14:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D7210E2B0;
	Mon,  2 Feb 2026 13:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="lm0iNSVY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92A310E2B0
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 13:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1770038246; x=1770643046; i=deller@gmx.de;
 bh=NXNGVNeaQW2R9iV8yw1vl2YmrfhaAxYLr0oO9y1gOjw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lm0iNSVY+XIAzEDWi9EmzXiYv29DkNKHM62+i4PFDAPoyShWavj2eAooJTbvDngL
 SkD0J0Oe07yKdqjxRb0OtbI72Mo0Owb6tFEmHrPu8lucsRACVXNfOZjb0XUaXpyTU
 7zZ/eQBi119jV8+09xXWYR8vrPtson744mydmGJuOR23B6az8VX+ECKU4KlQ2n9ZO
 UxKKZQAJrzV6NNWcraZfpWUzVyI1JtuJ9q3yI3pO2LJ4e+ey/iUV1nep4399URi9E
 puDdQcoiRozTOv/eFPWhytNAKZQOM4LtGdIQ+my5ovyeKe30YSrid6Sv62ODl1Zju
 p5t8KeU/cUhYiUJyGQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N79u8-1vlizG3HS8-015Uox; Mon, 02
 Feb 2026 14:11:30 +0100
Message-ID: <9de86cc9-a72a-4f84-9cc6-127fc0dbe006@gmx.de>
Date: Mon, 2 Feb 2026 14:11:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: fbtft: fix dev_info() device arguments
To: Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Noralf Tronnes <notro@tronnes.org>, Chintan Patel <chintanlike@gmail.com>
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Matthew Wilcox <willy@infradead.org>, Jianglei Nie
 <niejianglei2021@163.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260202095743.1309162-1-arnd@kernel.org>
 <6580aa60-5f9d-49c7-8482-83bed12dfb0c@suse.de>
 <3384db41-0ddb-4c00-9af1-f194ec5dccc4@app.fastmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <3384db41-0ddb-4c00-9af1-f194ec5dccc4@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lGRH+XTnruJqSGJPZa5rcBjADxslExrtZH4P75SjFTEP5LC4wrT
 yqoKIbEgnIcohq6x037zpRq2jp2ocoSJEB0Z+q8EqvpXknZatSFaqQ8c4YlQcP4WBr1kClr
 Ms8kL0YynQdPyFoAkWmb/pajd8N1XQChH2wlDdNurYlsSGYAuETayV7KwViWpilPkyJ7Nh2
 PPGeuhRG9+w8WLxTpkEiA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SYtlHvnuA3I=;HY/1GPKCjqJpX/MgC8haFYtytUp
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:tzimmermann@suse.de,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:thomas.petazzoni@free-electrons.com,m:notro@tronnes.org,m:chintanlike@gmail.com,m:abdun.nihaal@gmail.com,m:dan.carpenter@linaro.org,m:willy@infradead.org,m:niejianglei2021@163.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:abdunnihaal@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	FREEMAIL_TO(0.00)[arndb.de,suse.de,kernel.org,linuxfoundation.org,free-electrons.com,tronnes.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,infradead.org,163.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,patchwork.freedesktop.org:url]
X-Rspamd-Queue-Id: 54514CCA6E
X-Rspamd-Action: no action

On 2/2/26 13:12, Arnd Bergmann wrote:
> On Mon, Feb 2, 2026, at 12:32, Thomas Zimmermann wrote:
>> Hi,
>>
>> there's already
>>
>> https://patchwork.freedesktop.org/series/160468/
>>
>> which no one picked up yet. This needs to go into the fbdev tree, but I
>> can also take into drm-misc-fixes.
>=20
> Ok, that looks fine as well. The output is of course
> different, but I don't think that matters either way.

I picked it up into fbdev now.
There might have been some conflicts with staging tree, which I haven't
done so earlier. Let's see...

Helge

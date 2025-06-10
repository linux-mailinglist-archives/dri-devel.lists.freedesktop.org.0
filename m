Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F7FAD41BE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 20:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B543589D4D;
	Tue, 10 Jun 2025 18:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="GCRJidNf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637E389D4D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 18:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1749579180; x=1750183980; i=deller@gmx.de;
 bh=f1X+AO6h0JCkfXlVYWeqqMQFiaIhQ7oWX6CcoziL1qA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=GCRJidNfE0aQuW5SKpw1Q+QsHKWRIgebH9nuoZOeB6EQnWyAFb7XeefzbtpQxGBU
 l1iT6nNO+Fqukxmdt5mhYUW8tFgDUJnougjerZyCbuFIDUd33cdcRKAHobDib94N6
 toabDciZRVKzPKkmwLUDnDi9/pb2+hCUNeiAURgwrioAoJwvYSK7dpd2yazK7PoNJ
 1TCW917hv/SCLuKYl22djiFPoRE0Fr0OsLYwbEi8Dwk4eSiBe03vkjmhKoPAUWGSL
 DhL0FH408SN0qm4oGVb7wbiR8yzzatBDdgD4xzjqxLwWSzmq7m3HSqNhfJrg2mmTo
 e2DNSIbZvMZGDjEhag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVNAr-1uI4ey3TCZ-00Thpo; Tue, 10
 Jun 2025 20:12:59 +0200
Message-ID: <c9ef633b-4d78-4aa5-91eb-d290cbbae17e@gmx.de>
Date: Tue, 10 Jun 2025 21:59:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] fbdev/c2p: Include <linux/export.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250610105948.384540-1-tzimmermann@suse.de>
 <20250610105948.384540-4-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250610105948.384540-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XTmGzcZJjLShiB3SLo6s7XBcuAaOPAJ0J+Tzseqz/sqrq/KgYww
 OAU4qkhO/MUu6F06IuTVgXkHQg8Og39g9xKaxPQ0+jNvZN16SV3ofGCK2q49BDDOHisxpe/
 w11REs3V9ohf+eRSDBjI9fB8IKfMyGGTSWLz/Fqq9DANRS2bp19j3il0jQ994SCx95upSXc
 NfHmV0ttNibxehgviiR8w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:StcGF6Nd8eA=;5yz/iJDXv59zjnbb2fXL2iNbZTr
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

On 6/10/25 12:56, Thomas Zimmermann wrote:
> Fix the compile-time warnings
>=20
>    drivers/video/fbdev/c2p_iplan2.c: warning: EXPORT_SYMBOL() is used, b=
ut #include <linux/export.h> is missing
>    drivers/video/fbdev/c2p_planar.c: warning: EXPORT_SYMBOL() is used, b=
ut #include <linux/export.h> is missing
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/c2p_iplan2.c | 1 +
>   drivers/video/fbdev/c2p_planar.c | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Helge Deller <deller@gmx.de>

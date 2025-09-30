Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8701BAE782
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 21:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BAC10E2CC;
	Tue, 30 Sep 2025 19:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="edF7VNvQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44F310E2CC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 19:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1759261045; x=1759865845; i=deller@gmx.de;
 bh=cxtBT/iXt8cTP10Rf0ZQp4BYCZj+hm9vWCpTn4qinF4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=edF7VNvQrB6jzoDp+hIcmcv0wlu7fO3Y2EzZHJskLYOCNHsI+QvJNbotZwZPYDNu
 99L+cdgg5R0VBxIDQ+LxsT5oEki/jLs82LW6IYYr4dNV/f1vcwXFm3eO4gv93wTFl
 VtYg5d2s8LnYu1fPBrQRYyYUwWNni7DRrzHkQd6/hT62fuquxt9Yj4g5hTtMpr0pM
 xDJF3n9azH0sXMY/yLfJ4FXPjpHJ4Pf1vi/RbUNxDWUwQuR3T/i9LBHh77IwsWMMR
 JTeY/EOnel1HCIwpNSMYwtCiKAuQcVt4TlZiNxn4XA5Zxx/e6oh1RDr0r2xmOTnpn
 1QgZaIFmwDYJM1vCyg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.4]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McH9i-1uRKfo3qv6-00hIsU; Tue, 30
 Sep 2025 21:37:25 +0200
Message-ID: <8aa612a4-146c-4980-96b1-d975c69451f2@gmx.de>
Date: Tue, 30 Sep 2025 21:37:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] Documentation: fb: ep93xx: Demote section headings
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20250922103615.42925-2-bagasdotme@gmail.com>
 <20250922103615.42925-3-bagasdotme@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250922103615.42925-3-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Z53wr6XZRHSDoXlIzRtqs+0RrXPqRG2kAPWXF5qs6lbK1IMIXOV
 nnySmmw7uV5gjeIRwxvAO9dgW0sgsIuEreR6HhDtpkuURTuxMkeZs8DTJ31eYDT4Z5Tg93U
 VdzXTTZvW9R3H6BZX6QTQ740NwEbQaYGg/hdXDKYZqCyxJs7DKj+8hoB7kp5A+ihUrT9Pmg
 Zgy4YmlQv0LKBV1BTXfBg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:o39w7Hjl384=;c46eIWwsQf8ZMfKzRIgWSYNaPRR
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

On 9/22/25 12:36, Bagas Sanjaya wrote:
> Section headings are formatted the same as title heading, thus
> increasing number of entries in framebuffer toctree. Demote them.
>=20
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>   Documentation/fb/ep93xx-fb.rst | 4 ----
>   1 file changed, 4 deletions(-)

Patch series applied to fbdev git tree.

Thanks a lot!
Helge

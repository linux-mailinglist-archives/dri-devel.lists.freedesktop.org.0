Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE83799D868
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 22:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D08010E4CF;
	Mon, 14 Oct 2024 20:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="t1ByILJu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 345 seconds by postgrey-1.36 at gabe;
 Mon, 14 Oct 2024 20:38:01 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDD210E4CF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 20:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1728938279; x=1729543079; i=deller@gmx.de;
 bh=8iK/lwusazoVmWDx14MxRKCz0zzqnH40q8KQDzTJg8k=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=t1ByILJuGD/c0ag/vQkQyUGAeutpYETZ4XwPFUha3aI5qdZI3i0A4duFteNZTyZV
 BQnJw6Dscyu+XafoPIuYoDYJzFglIk5jxJrhOSRXZg5YghKUxaatufNV25DFopD3j
 Fn4doWYEdfzvpu5QzqN5YrvdDrK7TKsslsW3ihhXA1h7e5XXUr0L2qpEORteEKigD
 OelQeSSCeCluxpufJ3iCfq+762gUiMrgju4OHrJOZzd2RtO2Oru8qGFflB9Ez4hf0
 RaGj8b5l5nVjjOqRjY2XqSuqeEA0RmZ/5XktSKzzdGqvrPxiOYKUFINqbg4iTUHMI
 G55GlpHNLNQtA3a9dg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZkpb-1tUI7g1XCJ-00QS0r; Mon, 14
 Oct 2024 22:32:51 +0200
Message-ID: <fab752c8-0193-4d97-bbe5-40c426ede668@gmx.de>
Date: Mon, 14 Oct 2024 22:32:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: fix inconsistent indentation warning
To: SurajSonawane2415 <surajsonawane0215@gmail.com>, adaplas@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241006071514.5577-1-surajsonawane0215@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241006071514.5577-1-surajsonawane0215@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mNj/a86cD8apEWRxcMjWatukRifswok09XShWf9Q7PfLVTiUZ2G
 5bV5pTEgV7HclerciNJVDVklKnQKE6J/4jqeNQsA8wOv0190uLu1EJXDUeXPh+IjBO+XRNd
 KQt6Wz5Q1O3O9qNIIKpjwHxhflpNkta8AD7YxyF0zroGSPODBeH3dhdMYMowW1xeOTcElJ5
 4WcvEM25c/vzdPoZpKN8g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9wb3bacMI/w=;mEwcxF1IuGJuQkYK3xGiHEs+BcO
 tAOb+0ratVX59hyIHwnQIZQYtDR+HE6BO7Y3RzHW4L6oiGniQfoKWOJl87jPym2C10FKJ2eDu
 MM7y3o87SKwtSn8AG+KB3cpGIt9D/qpD/3GohL4GID0TvaLWcUfqQEpwvEhZY2H4pF0RAO4ce
 BevvWdJj9jHrys4gwDnRgdo5S1IrWm1VoS4X/Gf6bii9sBOB92WIzfDfk3W5mVwDV4GRuqq+O
 fwrn9fJLkGiUD7X3h89ituQMBTCbwoCcskbskRqDbMuXdkNlgGVdbOUF8wccYFpKn03dfaSTu
 uJcxVUl/Ble8CXkB8gouGMRADP/BfRg8SnF9yVmyPBOSl3uTCGvTIYHvzMVrszTpAMluAFBZ7
 xpGhqIlgIefb/H1/6ipdZdAIf7jzMD6AS5kOr0Og0IrjbCEG4e1kofC5tX499zHsW81cpXEoJ
 bcflxKsXEPXaCnVDqWSZRHgGrkI8RdUT4OcNBnk9PdTUufo9W0wPnyUvi84T/Risa8LIWNZ6g
 N9bTof9SbKeXysRokVPk6u7n+Ybu7RqcX7ebCemaxBAD9GnTsllb037PwjYdEFH5DEkAj7JjQ
 wkTLWiu2ARtC6hOkpeA9+27gn/0Wy8NWo/0QHnHjrNDz3TewtM5NtpdhMXCU/spk0K9YMnCZ8
 b09xl7ggpkylAmu+3Ctb3FXWmhO1KbDxYJ4q5ovw2j7ZkJllPvSKxLmmlxTielE4QnvbfogEK
 CjB5wb37UddCAU4z5FRLrm97dgYzQqMZohzSFwxGJC8ZT5u7/CyUtRSrJ8STFZVmSNuG/avpv
 1KRzVo82v2JvmlBkwLxWJqqg==
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

On 10/6/24 09:15, SurajSonawane2415 wrote:
> Fix the indentation to ensure consistent code style and improve
> readability, and to fix this warning:
> drivers/video/fbdev/nvidia/nv_hw.c:1512 NVLoadStateExt() warn:
> inconsistent indenting
>
> Signed-off-by: SurajSonawane2415 <surajsonawane0215@gmail.com>
> ---
>   drivers/video/fbdev/nvidia/nv_hw.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

applied.

Thanks!
Helge


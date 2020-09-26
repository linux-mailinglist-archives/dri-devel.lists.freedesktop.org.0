Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFB327A842
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F015D6E3F5;
	Mon, 28 Sep 2020 07:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D556E22B
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 19:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1601149964; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bbvZ4S5ZsNKQOCsIjc6o3syVQHMaJOxJwAZvYkhk8XU=;
 b=uPuoqs/mPao1mGuotGA/RYR4hP30E8X739I2hgihzUNJqhGqBpGaai+KPrycPEb2E+Ha+L
 9pXCAoXGwYBAd0AU7Z6ivUTvLFKTdEmqGzesSOKlfhtfI8OeHl9Is8Z95M2BR7AcRw7VzM
 WqyJqXfEgRXNJgEVaG1vE9MKRYAe6hQ=
Date: Sat, 26 Sep 2020 21:52:33 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 0/7] Ingenic-drm improvements + new pixel formats
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <L77AHQ.S2E32L5HRQOA1@crapouillou.net>
In-Reply-To: <20200926182548.GB91317@ravnborg.org>
References: <20200926170501.1109197-1-paul@crapouillou.net>
 <20200926182548.GB91317@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: David Airlie <airlied@linux.ie>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le sam. 26 sept. 2020 =E0 20:25, Sam Ravnborg <sam@ravnborg.org> a =

=E9crit :
> Hi Paul.
> =

> On Sat, Sep 26, 2020 at 07:04:54PM +0200, Paul Cercueil wrote:
>>  Hi,
>> =

>>  This is a V2 of my small patchset "Small improvements to =

>> ingenic-drm"
>>  that I sent about two weeks ago. In that time, I worked on new
>>  improvements, so I thought I'd just add them to the patchset, since
>>  I needed a V2 anyway.
>> =

>>  Sam: the patches you acked have been all slightly modified, I kept =

>> your
>>  acked-by on them, please tell me if that's OK.
> =

> All patches except "Add support for paletted 8bpp" are:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Alright, I'll push the other ones, and keep the 8bpp one for a V3.

-Paul

> =

> =

> =

> 	sam
>> =

>>  Cheers,
>>  -Paul
>> =

>>  Paul Cercueil (7):
>>    drm/ingenic: Reset pixclock rate when parent clock rate changes
>>    drm/ingenic: Add support for reserved memory
>>    drm/ingenic: Alloc F0 and F1 DMA descriptors at once
>>    drm/ingenic: Support handling different pixel formats in F0/F1 =

>> planes
>>    drm/ingenic: Add support for paletted 8bpp
>>    drm/ingenic: Add support for 30-bit modes
>>    drm/ingenic: Add support for 24-bit modes
>> =

>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 262 =

>> +++++++++++++++++++---
>>   drivers/gpu/drm/ingenic/ingenic-drm.h     |   3 +
>>   2 files changed, 228 insertions(+), 37 deletions(-)
>> =

>>  --
>>  2.28.0


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

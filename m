Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC1399D85F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 22:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10D110E4C6;
	Mon, 14 Oct 2024 20:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="f3EpZmFk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F66110E4C6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 20:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1728938245; x=1729543045; i=deller@gmx.de;
 bh=ouPa/eowB9jLl4VY4WQM/q/N495B53tdPkxq+TDntcM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=f3EpZmFkFE2Xu/JYI3Xxy0jygVuLDi/0K7X82Khulr4H/GCjdHSWdL8RTWid5Fmt
 /kMODK8s26KmQ/mAyYxpoX3UDKCLO6Jp0MUkYtgzHXN00dlVk8xowbAETGPvLpxWU
 J/Wt7APGIeO4SIAKoQT4gl6FerVsTEDQqAJHTzLyLJQESqUMNVJ7wzHU9NO70gw9I
 +AhVXIN8dW9bOlZCSGfd20+M4cNeEhQ7jFv9qXFSxrm1iTqPtez9GJkLwohAWvZ2B
 VI3J69uhZFMv3DkyrcX4ALvPGqNK+fCT+XCiFVSImgGwwd8xDXxJKFT6DfoyasdBX
 7NpWuyVt77g8hboP9Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MG9kC-1tAHVi05PQ-00Bx96; Mon, 14
 Oct 2024 22:32:14 +0200
Message-ID: <aa4bf800-1bd9-4af4-8403-aa9ff6d30ae1@gmx.de>
Date: Mon, 14 Oct 2024 22:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Constify struct sbus_mmap_map
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <67883bfad5c2c395438bfcef7a319394caca4155.1728820047.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <67883bfad5c2c395438bfcef7a319394caca4155.1728820047.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QV9ejFkm+fuf9o/1WeaP3AyqUgGmGSyP+CHW6qaUC2nAhVB0Skj
 Gye27Ca9JUvAhLeU+OwapNp4WvKKE7gS5dhhOIHDq564iXDHBoTHX4fkVKSHEzpnplqY6IH
 4eVf1Q1tDLfxRQ6XxZxBn6oWR40Pax4NLcHFZAeLjVTqDcDMJX5IvRrbEclhMK+mNeSBkbD
 XHtm2TfEFQdjnhaob/sVw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gkfhBfQBFCs=;sXBIrOGT27NxbWail3pZ0ULoTYA
 4Xd9pzdngH5FjvZX1U4mIQkBqWle6M3gkGua26zeAN9bzJHzCkKTUOdNoYejBChDh8HPVuiJo
 E1gVKikclGGQTk5DuAGyW4U/snilb8Cytfyok9vbGmH9m3ZWgBdcjEsVsbQxzogI6zyuV8MoX
 ectB/ufQkYWedHccuVI2xuJOKQlicjTf9OI8k5bEQZuY9NrWvPhFoemPPHXDNovtMI7B3lqOS
 k1JOiGVqBoerlhd3TQ7Lsxs4C1FiY5nMTL6QdrfZ+w6MMcj6pv8mWOS4KD7PjkEqRM/lJM4AL
 xabvYEhJj3oB9vt9QuUuDfHiDmVnp+wxek7tkqkE8O3lsnA3GghgmFZQtOvzF4KzIjme/x/au
 wIDBM5Tn4fc0cewd2sBNSiayxT0ZOi5IOj3Ed38eMoM786vnWGwXdJqc2inPsHHCabgaIyYsa
 2QjOpbUqoN8IErEHWCQOmLyxa9uJRAsYBpPkx7jGwWzinQsVinJA3cFIetLhCUQvaEFVrMHKV
 00ToTupEzr098seUDCS0k6JUPRGKDI3cxwT1lo8xIFhdW84MeiidJqsn8r8693aRtA2Gqx25y
 tSizV+LgS+rN+Uzdqnv5sC1u6xXWZRGvREliB7XChLPeYJIBdeM8O++hKN54dYEsksIiAqZ+R
 /BY+nKFGnItnBGBoWE3CIfeaX6cswDrOyg/4zZpyWaeY/1A+4bcqVPhneseEzdfWAy2vH/MrP
 zbvw8RRpd64KlFAP+NHVgi1EugKPpI7sXzfYe+Hpqq3k1bkXp6k2SoYVfgihw0pgjzpRcRP5Q
 JButsNoI+RO9RLWzFsMtGA5w==
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

On 10/13/24 13:48, Christophe JAILLET wrote:
> 'struct sbus_mmap_map' are not modified in these drivers.
>
> Constifying this structure moves some data to a read-only section, so
> increases overall security.
>
> Update sbusfb_mmap_helper() accordingly.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> =3D=3D=3D=3D=3D=3D
>     text	   data	    bss	    dec	    hex	filename
>     2452	    536	     16	   3004	    bbc	drivers/video/fbdev/bw2.o
>
> After:
> =3D=3D=3D=3D=3D
>     text	   data	    bss	    dec	    hex	filename
>     2500	    483	     16	   2999	    bb7	drivers/video/fbdev/bw2.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only with a cross compiler for sparc.
> ---
>   drivers/video/fbdev/bw2.c     | 2 +-
>   drivers/video/fbdev/cg14.c    | 2 +-
>   drivers/video/fbdev/cg3.c     | 2 +-
>   drivers/video/fbdev/cg6.c     | 2 +-
>   drivers/video/fbdev/ffb.c     | 2 +-
>   drivers/video/fbdev/leo.c     | 2 +-
>   drivers/video/fbdev/p9100.c   | 2 +-
>   drivers/video/fbdev/sbuslib.c | 2 +-
>   drivers/video/fbdev/sbuslib.h | 2 +-
>   drivers/video/fbdev/tcx.c     | 2 +-
>   10 files changed, 10 insertions(+), 10 deletions(-)

applied.

Thanks!
Helge


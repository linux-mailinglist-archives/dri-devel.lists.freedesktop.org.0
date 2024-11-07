Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77489BFFD5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 09:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACBAC10E02B;
	Thu,  7 Nov 2024 08:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VqScTgeL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6C610E02B;
 Thu,  7 Nov 2024 08:21:34 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so81878566b.0; 
 Thu, 07 Nov 2024 00:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730967693; x=1731572493; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5VOR5CG5z5tJAz08GO5kOR/f1vtcXPoi8DLyImsNBw4=;
 b=VqScTgeL8JxMFGywNHC6z+TuRhmQe+FMfAcgQiWZnn2733UGnhy1PrYsRw7cu7Voyt
 d9dDHycUSIjgE1ZSdbgulaVWPR4NRxDjbxKn+hLZ/FR5sB5tQPEogJGCK9ZlVamn7TtX
 qn/BpEcBwTgCymMtALY/6UZ5j+OoTm+FeyBj3Ydo9MZTpbjsq8Zjn3M9CCkwNXBB9ZsH
 O5e/sQlL5xSa3QKHfNwlscP+er9tiTdGBMFYAu34OM1PSGIGH5Josr974JkB1io/8Wp3
 hGKE/DCdzI6/bY8O34Xlqll5T3JZdrRs5Z02lA5iKztyYKbsQvHNnNIn1jNWoAD/mFpS
 RJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730967693; x=1731572493;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5VOR5CG5z5tJAz08GO5kOR/f1vtcXPoi8DLyImsNBw4=;
 b=IUzOBQjlE9xm+5P3uAKPdYTGp2UHFrvDZcSXT/XPpK7v8n86hUSZTvTBtofEGuIFA5
 fbYzrHbqguKSfiqBn3l5GiGjUCK5GJczeZSFcxDWxhae1tbByraV/wmVP7FTr9U8k3Zd
 iSCGsML8R7OZ5XMAYMP5PNyO1PpuCtpuy7SmUFMsY7/pZ7F1gcGsmpSHzzqwzRbv0pik
 +lD99Cy16SIz782qelFzrLouIiMNA3JQJ/Fh7SY+lWd8uMkQKD9mzViIpHh64rVrUvgL
 7FPTN6uBD3zvlQKI72hjnAEbB/Kgv3IIRXmeo1rodOfZK6ApnQ6BWJqV5crSCmRTtZp0
 M7CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+b+WNZCmcbuKIKJ3nAKuU/5RQzEI8hlrX/qaFdrXkN9XPnTo0jDX4IPWGrQnyCN+d440qlPrNX4E=@lists.freedesktop.org,
 AJvYcCWpTyOouBMUTNmyaKRPmYhTH6TulEmYMrPnpyoCGJ/3ZT6tAREGoGhK/rlsTjF3wplO9M6rwyBP0f8=@lists.freedesktop.org,
 AJvYcCXi4q90dqeheo0FHR7Cyf2X6zqI3I9r+Kah+p2qoDQiP5eQ56etTk31AeWoyGqEziP0jaKC4uRN2X+Q@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5pX2jzdm7BWGwq0OBoRADZGJi81ezZjYYOlQSjsIggv77OYUD
 plSKV146f51borJFTCyWgHi5g+mWOz2Qbw35aFoRTG+1R5SRohvHu3JQkiCGhBNcTnlxmbCohTl
 X9P6JlUD0l+d5GOJxX3nkKhnJa28=
X-Google-Smtp-Source: AGHT+IGzp4ZhM15P5BuZqJNwFlSO7u7lx6xlY6hASCP8GFqOKEug7q8+mJvAPBHNOu1UYfSi3ksydcl56G/UnZhJGfY=
X-Received: by 2002:a17:907:9622:b0:a99:5234:c56c with SMTP id
 a640c23a62f3a-a9ee74cae8amr8688466b.33.1730967692918; Thu, 07 Nov 2024
 00:21:32 -0800 (PST)
MIME-Version: 1.0
References: <20241017075725.207384-1-giedriuswork@gmail.com>
 <CALt+6nqxMZjuZuOKaj8Cx4dcNZx0n-0F9aa97d-vZoMWeN=bOw@mail.gmail.com>
 <Zyk8dFthM0EA2A_K@intel.com>
In-Reply-To: <Zyk8dFthM0EA2A_K@intel.com>
From: =?UTF-8?Q?Giedrius_Statkevi=C4=8Dius?= <giedriuswork@gmail.com>
Date: Thu, 7 Nov 2024 10:21:21 +0200
Message-ID: <CALt+6nrS2aRHYCyrba5uBUXsHdPntELdj0MYPbv69PupHBKMtA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915/lspcon: do not hardcode settle timeout
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hello,

On Mon, 4 Nov 2024 at 23:28, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> On Mon, Nov 04, 2024 at 02:09:46PM +0200, Giedrius Statkevi=C4=8Dius wrot=
e:
> > Hello,
> >
> > Kind ping.
>
> There was a pipe underun in CI... I honestly don't believe this patch is
> causing it, but anyway I decided to trigger a retest there before I push =
this.
>
> Thanks for the patch and review.

I don't see that on my laptop. Resuming sometimes still doesn't work but
this helps a little from my testing. I will continue the investigation.

Best regards,
Giedrius

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C3EC7BBD6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 22:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061C410E904;
	Fri, 21 Nov 2025 21:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cywJ2fjk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7709410E904
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 21:24:51 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8b28f983333so242871885a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 13:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763760290; x=1764365090; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=29bJm6/5q4zOMf3+fzBQek2+I2cqEdboXlRXK8AzxF0=;
 b=cywJ2fjkmTBeWYSVTnMhiwrZod/5zdO5BOqzfASAfpME0IulD80eX1vhR1y3Yfk0w6
 EgTFhEQeM2TTjDNr7Du8hL8eqRimNQuZwix0ic+04FSxleWXUZHDzXTBbVMeoEz02Tiq
 zIxm0g6F/OvdufewI72PeFnmC/IzZRB4Oh/X+xQlirflMdbcF6wHana4h0oTSD/IgWYR
 UIK2UyuvF/+SwEb9sfGPuAAa8DurOBP8coeBi+E7OuIUGtxGYJg9qo1nZB6oSWq+ziOE
 IJTbFRmgATDu60EIMb6xeInCz9pTZ7WuEfS8HSs4T0xJx8DrqZfvsgAnkjrrMfe+1Y5d
 3KPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763760290; x=1764365090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=29bJm6/5q4zOMf3+fzBQek2+I2cqEdboXlRXK8AzxF0=;
 b=wycweCjaRxfYJnJ/yyi3AVnLIKTDMl2rmwf8a7Xge5xCySAFnf6XqKO9ixoPpn20V4
 MswBjA4VYgWLGkUaU5YeHMj8jhOZ4dofgb2frXNgaEe2aSgyRzRQZb1VSnXl04fbzyrP
 LwsrexSpF9ZfmM/2b4QylkzLkULvuzVMCChAGs2GSs39obN7cTIwyF01V7Q1WU8NEvMn
 YQ51Ll7h3nOgcrhpp1d3u5Hv315p/vVQQ+cSnFV/zPEhc6Azi6qdfof3mL1lEHPWJ9Lq
 aEGVpWHtIk98z1xaQQ+wHkTjr9E5eRTfCR+ANUURDI24aPC63mlgM0OYnB5okQv1sEci
 pHhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwsm1c7GyLCCyFvcV8DXbP8Ufaeogvq3Tlb9UO9h63w81El8QW1yo/koMQxFqLtX5KllFjHGaPR0A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydfY3e1jAb3+zVBQjHqPfW8XEGNE28FEf1Pw8jpQJarVRmkV67
 yu2CfG616TBdgj72Pij+LObDgYa+GEer0ovn4Vmr8QuAYO/1Sy+wWwjmrzroaqPJCRadmuPmi2U
 BopuvJwQqMaktpz0KTk2De9hLipHavL8=
X-Gm-Gg: ASbGncv/8/JmItwsKmS4uVrRo/f/5zqi7lCAw8b6eHlfgWRd2nMJ6QQCQ9cwgpxRPbm
 0gPgqx37iSOVCtW7LTjLy9UD0N72WMF8W3mjz1pfPUkjRwdsJa8uZWOlPT6Gd8KHHLC65Of0uA9
 ox2NCOEICHV+3aU88v2gTdFkp44F1+Wxfs7ivDvinX+IABXogfhieJjB/e/OJdi75nTfHksiod7
 EHUqUULHe9thGDdaQCrve4G7SZ7CWyMqncN4irG4zlycO/qFmAnxYDatMPy3EMvAlBwBw==
X-Google-Smtp-Source: AGHT+IG6hKiKEc8UWha458UfGseB3rZJ/0PS+EUthAHPA9pEKofK90w20ejUTRas4B1v69XI7Xd8Ryvg3u82+mAjhQc=
X-Received: by 2002:a05:620a:404f:b0:8b1:c1d3:8e90 with SMTP id
 af79cd13be357-8b33d475a19mr499427185a.60.1763760290180; Fri, 21 Nov 2025
 13:24:50 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tz19=6NpVyQ0T4m_V1GGUZ9u7-6AQ7=OxSuZWkX3bU7Dg@mail.gmail.com>
 <CAHk-=wiBCPL+zeKVF7zYVSiymjFRmgunCeyryUhoZNBR06sR-g@mail.gmail.com>
In-Reply-To: <CAHk-=wiBCPL+zeKVF7zYVSiymjFRmgunCeyryUhoZNBR06sR-g@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 22 Nov 2025 07:24:37 +1000
X-Gm-Features: AWmQ_bl4gdvvnqQs9Xi2Yk3nMeNXJ0fmE1TqQ3ZKPGg577VEmd98q4HALXVevvE
Message-ID: <CAPM=9twe8tCZM57YarzoAcgV-hWDVpbBsnZiYCMTk5YtVfJjeA@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.18-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 22 Nov 2025 at 04:07, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, 21 Nov 2025 at 01:07, Dave Airlie <airlied@gmail.com> wrote:
> >
> > A range of small fixes across the board, the i915 display
> > disambiguation is probably the biggest otherwise amdgpu and xe as
> > usual with tegra, nouveau, radeon and a core atomic fix.
>
> Pulled, but my sanity checking complains about your key having expired.
>
> And a "gpg --refresh" doesn't find it on the keyservers I use, nor do
> you maintain a key in the kernel.org pgp key repo.
>
> So I have no idea where your keys are. Mind pushing it out to all the
> common key servers (which still work sporadically)? Or at least point
> to whatever keyserver you do use...
>

gpg2 appears to be sending it to keyserver.ubuntu.com

but I sent it to at least one of the others,

Dave.

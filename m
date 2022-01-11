Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF07048B8E2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 21:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C771110EF44;
	Tue, 11 Jan 2022 20:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19ADE10EF47
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 20:51:43 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id c71so1233908edf.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 12:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PJOwhp3ym4DBH3RV0e5Fa2srd2TuQC5f+y1GIJOJymg=;
 b=Poqh7tlps0nmydJNHuTFFz+1v91n9FBjuZDF9S/cEn3/lSPJU4mRgLKzcVJ9y2szxK
 w3QHdSzWPsF4aFUX1EWxGT3ZSvos+xqomNwyXjbgIrXwlEUEiTBA8POYMyy8nXDbHfJe
 utQNYyrqtWyiR/ZNc+DKBtuKMA5VAvLH46Wag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PJOwhp3ym4DBH3RV0e5Fa2srd2TuQC5f+y1GIJOJymg=;
 b=R8OtdqLMF1JRqBPC1e0MWZqV1epvYuBHnxHz01BVt5K9LkIakDcxJxlE/1L6DyDokc
 yTDMfxdkskYwoLYHisjthBMVHQ2MtoNnnCQscxLDV+UKjgn/G+qyZRJqxk0al+heSyZV
 2cRPUqmm19KI233rpmsYWZ6WBKn42IT/KXJTWtJR6xaT2Y+3u08OLznvb7J6zgnx0+6/
 T3R8iwuonNlXt5tKLpcX8EJtNv8IM0PSVNmrZxna8C8xhz/JH3PuuBKOgmhkY7HYIO35
 ZD+MpJEXGY21uVzvgx6zwsBiRzs0pNJFW89BiI5bkfZlBlIqnoG+tjfRPC10DqipZxXL
 pZ6g==
X-Gm-Message-State: AOAM530Btii2lA172brC7yiFfq2P0hXpfWUH15HKpwO5s/1RvSiGnWdr
 uVdCkdWj2RzGOofMHGp8Md6V4ejd1bDDH45Fjoc=
X-Google-Smtp-Source: ABdhPJyERyDU1eVCSTlhGYbGUjMU1wdrG9joEa11UFkx4OoopjE3+S28pY+7EX0T0m73vFqdyZBr3w==
X-Received: by 2002:a17:906:4fd6:: with SMTP id
 i22mr4991859ejw.484.1641934301476; 
 Tue, 11 Jan 2022 12:51:41 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54])
 by smtp.gmail.com with ESMTPSA id g9sm5376924edb.53.2022.01.11.12.51.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 12:51:38 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id a5so480317wrh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 12:51:35 -0800 (PST)
X-Received: by 2002:a5d:6083:: with SMTP id w3mr1799927wrt.281.1641934295380; 
 Tue, 11 Jan 2022 12:51:35 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tz=_hRpQV1V3M-=KmVVEbr1K166qeb-ne64PHk9Sn-ozg@mail.gmail.com>
 <CAHk-=wg9hDde_L3bK9tAfdJ4N=TJJ+SjO3ZDONqH5=bVoy_Mzg@mail.gmail.com>
 <CAKMK7uEag=v-g6ygHPcT-uQJJx+5KOh2ZRzC2QtM-MCjjW67TA@mail.gmail.com>
 <CADnq5_P9n39RQ5+Nm8O=YKXXvXh1CEzwC2fOEzEJuS2zQLUWEw@mail.gmail.com>
 <CAHk-=wgDGcaRxUwRCR6p-rxDVO78Yj4YyM6ZsPRGiT2JOCoQ6A@mail.gmail.com>
 <CADnq5_OYO7kq+9DBnDvbSfpouFvdLB0LPSL6+f1ZPRBsV=qEqA@mail.gmail.com>
 <CAHk-=wiCCRG9Lwzr+Cur=K1V2GJ9ab_ket7EnG4RZhJ8jJM7xQ@mail.gmail.com>
 <CAHk-=wi8b-YKHeNfwyYHMcgR2vJh4xpSZ0qjkv8E8Y9V8Sv2Tg@mail.gmail.com>
 <CAHk-=whnWnB9yjVaqWNKjavSJxDOEbTAPwef=O7qjL8nKZgV6A@mail.gmail.com>
 <CAHk-=whSAYiO_TkKut6XckdQigFj39ft1Kcs2qJe5niHWPGdwg@mail.gmail.com>
 <CADnq5_OZR9Ft=WVVbpM_WUpFZurni4yVxGPpa4nDkhupmod_ag@mail.gmail.com>
 <6490ec74-7de2-c3a3-d852-31b8594110d8@amd.com>
In-Reply-To: <6490ec74-7de2-c3a3-d852-31b8594110d8@amd.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 11 Jan 2022 12:51:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whZW+Cy++vucKQd6Lrj7B1bhd1-pKkgV8xxPJr35Dh2UA@mail.gmail.com>
Message-ID: <CAHk-=whZW+Cy++vucKQd6Lrj7B1bhd1-pKkgV8xxPJr35Dh2UA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.17-rc1 (pre-merge window pull)
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 meenakshikumar somasundaram <meenakshikumar.somasundaram@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, "Koenig,
 Christian" <christian.koenig@amd.com>,
 Mustapha Ghaddar <mustapha.ghaddar@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 11, 2022 at 7:38 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
> Attached is a v2 of the buggy patch that should get this right.
> If you have a chance to try it out let us know

I can confirm that I do not see the horribly flickering behavior with
this patch.

I didn't look at what the actual differences were from the one I
reverted, but at least on my machine this version works.

                Linus

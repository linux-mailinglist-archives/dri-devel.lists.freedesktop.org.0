Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACAC6330D9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 00:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D25310E34A;
	Mon, 21 Nov 2022 23:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0655C10E349;
 Mon, 21 Nov 2022 23:42:45 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id j6so9064982qvn.12;
 Mon, 21 Nov 2022 15:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+pYR24VCwPA7AIcvoR94d6JtpexQw+IZN3CkB502KDg=;
 b=fZkk+oVmbf0toRdLyZO/a2Vqyu7zPC5hbwzbdhegfUfHoQexX+N+hkDX4sQM0OCHRk
 Y0gNS5TOJa3tiTk3HHKfeTZt5UQ0VmqEtXW8/7SId7HHllqDRRe06CAV+VOtgEeuXzz7
 pYU4A81NLT0zvrAbwwFjNHP7vAmgQ+F2pEK4qcedxxY2c0ozZdgrxJOWgizdyHXsdb78
 EJ2WwlfX3Vs9uaeFKMmr31+AHkeFdeWSqejMJtppDKGIZoYXYzFB/8iUqI7bbt4eqZ71
 HtqWYKKG6pwZ3BAtua/jkHsBxNsWN3jD3YzFUW2qkS3OYp/BvqmYM3xwctWO8rRuE4X4
 uLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+pYR24VCwPA7AIcvoR94d6JtpexQw+IZN3CkB502KDg=;
 b=4BpE6PtEdhvFm75U6+2Z1lajcfcK+6wS9NpXO9LNb67ci2Yq/+JUrHVqrKv+UbQwD3
 nPVtyI+HHbP0KYFgtLckAAzJldmskk3ZyjPL7yJINJLe11Rg6GSnk0Jg0RRGaKw+JjpE
 v3S/bLqXAm9AnJfihNAvhbdZCzVe2Tu6I9ZJ9UFSke2fvqypEj2Pm5jfXLXtfIWtJ96H
 wJOTqQNz8ex1TaXlL5AQHwsj78P740mSl1tBy6D5wImDbjAu0llaEcM6h6GuPWOCtHlt
 YzYk/10ewJZeKEm0WuhH5UjPYpjcnwuptHMlgEFufvJiho9EbU4/NuX8fOabLkO0CdKy
 5ckg==
X-Gm-Message-State: ANoB5pmYHkX0qboViu+PS5NHkkrXgdVtEwLV7PJyowiFgBBtOHqMylK/
 RgaG9kYFPg7nc2Xvt3oC6v4cgguR9f6gLlCb+TA=
X-Google-Smtp-Source: AA0mqf43tEb5jANC0zvF+IaYxYkwO7C35fEV4QbTHtpg4O+7kC+EYsvgLl/Oz2mQvPbL2ggpT9f5jGJRzAU9xoUgILQ=
X-Received: by 2002:a0c:e8cc:0:b0:4c6:a094:9f22 with SMTP id
 m12-20020a0ce8cc000000b004c6a0949f22mr3545112qvo.62.1669074164740; Mon, 21
 Nov 2022 15:42:44 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsOeQ7VYm98jRVaYp6KaNsFVsAnSb33ZT8JvZxcTcEGW0w@mail.gmail.com>
 <a67598e8-c826-2740-03bb-33d37c8c8e4b@amd.com>
 <CABXGCsNvFvJz4=N=JKYSGVcd=dKfQ3Nv_zOssMb0Z6oK79xZ7g@mail.gmail.com>
 <a537212d-4b42-4ba4-7707-1e397234c8b7@amd.com>
 <CABXGCsMCfACsJRDPqZDYQGMpaA_6LKhQ0XqAmDN04GSMeetXnA@mail.gmail.com>
 <ca6c98eb-fdb0-5fee-3925-5b697e3e6b50@gmail.com>
 <CABXGCsPJFvNXfbdR=_sb4gLdd2E30aRN9usSiZc2XYmZNSKBcQ@mail.gmail.com>
 <dc802bd0-ed77-d268-25e2-1cf162202912@gmail.com>
 <c5c4f572-4720-04ff-3c70-30bba9c37202@amd.com>
In-Reply-To: <c5c4f572-4720-04ff-3c70-30bba9c37202@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 22 Nov 2022 04:42:33 +0500
Message-ID: <CABXGCsMW7+dWU0S8ePUygWkkvmLBiHU8gSBKZcSMsBCE_gv4Ew@mail.gmail.com>
Subject: Re: [6.1][regression] after commit
 dd80d9c8eecac8c516da5b240d01a35660ba6cb6
 some games (Cyberpunk 2077, Forza Horizon 4/5) hang at start
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 14, 2022 at 6:22 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> I've found and fixed a few problems around the userptr handling which
> might explain what you see here.
>
> A series of four patches starting with "drm/amdgpu: always register an
> MMU notifier for userptr" is under review now.
>
> Going to give that a bit cleanup later today and will CC you when I send
> that out. Would be nice if you could give that some testing.
>
> Thanks,
> Christian.
>

Christian, I tested all four patches around week and can say that this
issue is completely gone.
All known broken games working.
Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

The only thing I don't like is the flood in the kernel logs of the
message "WARNING message at drivers/gpu/drm/drm_modeset_lock.c:276
drm_modeset_drop_locks+0x63/0x70", but this is not related to the
patches being checked.
All kernel logs uploaded to pastebin [1][2][3][4][5][6][7][8]

I wrote a separate bug report about "drm_modeset_lock" [9], it's a
pity that no one paid attention to it. I even found the first bad
commit. It is b261509952bc19d1012cf732f853659be6ebc61e.

[1] https://pastebin.com/WZWczupk
[2] https://pastebin.com/f4i9pvjS
[3] https://pastebin.com/rsDWaMR1
[4] https://pastebin.com/tDNEYJq0
[5] https://pastebin.com/xfZVbm1f
[6] https://pastebin.com/Vx9gDyKt
[7] https://pastebin.com/XvRkLckV
[8] https://pastebin.com/pd8WBkgx
[9] https://www.spinics.net/lists/dri-devel/msg367543.html

Thanks.

--=20
Best Regards,
Mike Gavrilov.

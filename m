Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA2B56A60
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 15:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5C16E42A;
	Wed, 26 Jun 2019 13:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2207A6E42A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 13:26:42 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id q26so1582188lfc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 06:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0KQNsn2fCmYitiDv9gkNd7pWrAY8HVNXqrIMAFIYMEU=;
 b=ldMmgIyk7rtyXGIbnKQCxqS3fftR24WNFgt6Z042M3TKkzQcdMF6jaFnEwmDaZ8RsL
 v3UDI/JdnMwF6PzLOxNPLmRYv00XeuReXNeCWY6uGhpCyyt8VyMlCgqVfaW5jprAcIiu
 fwd2ZGX20fF/u3v0u3fOI13J8BeYLQwBJvA4cd6IG4OxB5mROnqOh7Zgx6jBC/Dp9yLl
 Crpoi3Evu56uEB/fTE4c4DHhtraYfG5d0srhRLtAis55jI7EkR/ZsARhzMCBSJH94iuA
 qGGxavaGhozuhsTc2fRqQGh2tB7Fb8RUJuJKB9MJJ5b7oqr3ijtUPrMwKZglQ6gi8wfr
 wHJA==
X-Gm-Message-State: APjAAAUlKKUJhyCpSQJHZLhJAbpoOcT5GubQgfcWRG9NxYEta0qirRLe
 Pki7zca3+uL/eMZupQNLzpj3s/LUHHx8nEiPaduqEA==
X-Google-Smtp-Source: APXvYqybuKo1OFuGMvZFtMATVhgvwQ0TaQVnkAkxGJ6JbLBBP+WfwR/5MF8aidBvBHtvBRNzwMnOhbAikP47ncpNnJ4=
X-Received: by 2002:ac2:495e:: with SMTP id o30mr2678993lfi.140.1561555600322; 
 Wed, 26 Jun 2019 06:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190626132427.12615-1-colin.king@canonical.com>
In-Reply-To: <20190626132427.12615-1-colin.king@canonical.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 Jun 2019 14:25:34 +0100
Message-ID: <CAPj87rM9y5Zen5A5KkiCqqUF5m+vAwwtLj-iJrcwFfzMev+Mrw@mail.gmail.com>
Subject: Re: [PATCH][next[ drm/amd/display: fix a couple of spelling mistakes
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0KQNsn2fCmYitiDv9gkNd7pWrAY8HVNXqrIMAFIYMEU=;
 b=NjgJOZQI/OY7TPBgoHm3D6Ry2QJNB0nWXc0QO3Y/AkulA6b6x+4s07J6po52HkDEYI
 9J/z9rxXHc8JWuQbQsoWS1T9uOphoAQrhpC0dfhmfm0UgaGuTeiOaJaD3mPn+hEaAvPi
 1gT+zh2HDcwd2D880J4ulsETR5gWrqkvu5b5ufYiWntVh9jp8BN2fTnpAQZJW5cJBnDR
 zxujoB0IlUBTZgJ1Zg4DctC6+uuN1b4IxwlDSrI1Roeq3t2hdUendNPOgFMnQynDC9Nm
 4rTSCrqxrqWiCQV7Zse2njjzpojDiJ7nxY5eRW+cmjAv/5nnnPheoK1E2NENiZtEt68s
 l7kg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
 Wenjing Liu <Wenjing.Liu@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ29saW4sCgpPbiBXZWQsIDI2IEp1biAyMDE5IGF0IDE0OjI0LCBDb2xpbiBLaW5nIDxjb2xp
bi5raW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+IFRoZXJlIGFyZSBhIGNvdXBsZSBvZiBzcGVs
bGluZyBtaXN0YWtlcyBpbiBkbV9lcnJvciBtZXNzYWdlcyBhbmQKPiBhIGNvbW1lbnQuIEZpeCB0
aGVzZS4KCldoaWxzdCB0aGVyZSwgeW91IG1pZ2h0IGZpeCB0aGUgJ1tuZXh0WycgdHlwbyBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UuCgpDaGVlcnMsCkRhbmllbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

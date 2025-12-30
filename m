Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35657CEACB6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 23:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A24510E624;
	Tue, 30 Dec 2025 22:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QPvU+yG+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C21410E624
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 22:43:17 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-64951939e1eso16686314a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 14:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767134596; x=1767739396; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9mEi6OrHM82M1e0Eu4BKfGlCSswhhgbyi6wTYu1Esdo=;
 b=QPvU+yG+yAaQQbSo9JKuZIV26B9igFPirqvQWjYrUB8m7vxOlLJ0i5f0/4UymqvZfR
 FRouXMdv3EY3myEVfSMrw4kf1B8GVhKwsBBCyj/IY2Pi3PUjxEZL40crMkuIY0z91vEe
 ogpgZQEnbl9qz3Mnc433BnzWZYtBrQFLaK8iAyzL1yAUGRC4CL4A5gF3+fiNjWRQd+Uk
 1XjQjqJOrFnz21JkQucZm+RYjf+KoLj8KE63D87ECnL/4lr/ZQFW8vz4zsxOYns4Dw6f
 WmMGaTR2+9WvRsjU8rvgElVVXWiFgzxURPTtF7ugjgBqMSuLrkYgDFeE2y9lXOmLfbpR
 TaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767134596; x=1767739396;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9mEi6OrHM82M1e0Eu4BKfGlCSswhhgbyi6wTYu1Esdo=;
 b=DuKE6Exaz9i5IqaDuc7X2eKJLVJ03MKrJGdmrtSyYF5Oq/R7OuzS1f+X3jL4klUp0p
 ecLe98bN/IIGDx+h9wWzGYO9rUsgtnhQJSG6nfIe3KAvDISOKItcoc0Frg1TlH+WNVjr
 J5xFEE0YRnDGZw3GfUC7OfRbyHojYu4e+sqpTp7iPQDB9FwkP+MVaJNdF0VRgHpmU3ad
 3JH9hF/ci8F0YJzNSIdGZlFjR+lR14wPACirleeBVarXHHjfS4sUBjJYR/IikLrXKVSz
 YNAUzTAwd5DXE3r8z3LLEmpFg2Ll/6BX78flfiD2SBA0ln2zo3VTax+w5qJOW+K8DgR4
 P7BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWksQwwXJAZ61y87L07SjV1qD28oKQtiTBsao+72URw8mdVNBBQPhqHenDkNRlV8dMYC8Cnz9juJ3g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKv6jiXE7JDfvFj0E3h9Zg8uGUVQABHjIgxVm9c4iYdOHbN8c0
 qLvpJGIrXJ0cwO0MwB0CIIeIpJtfG0W4eJr5aoXP5HuwlYBivrMtqvz9g5GkSrTQpFOSvbbaZlA
 4IETnqDsJr3wPDXscRQ7fZeNYJYteETw=
X-Gm-Gg: AY/fxX5R1sMEyt/mv4On+4TSZ8J059WX6Keh7TFrHHJ1GUIdAvCnvt9UbnZKJi+x+ny
 a9HumxNlzldWOKsxG5eo1j+LVG6k/Bi185myRpon93vOZFd6gYn1KFP1+uzQ5GHCbC7ypV8nYNK
 eeIBnUeufeWtSjDYD9jE5VQzwBAFO5OOcX3PwtCp/41AlomwxTeo6W/NU6bQdAzqzefcRDhVcnn
 FcEZN26UjH3OaV+EDyt+0g4ebacrGiZcxMIoyq09onmoiQemvJOtQgoGcZBqev2F0a7wLz5nwxf
 /noUUCw9qvzxctcL4k6bzHBOv9PnClZKta3yj6hXLFwaAgy5nDUrlhQgbqTwXYkuPdGCVPSZcIt
 2oiNF7I8=
X-Google-Smtp-Source: AGHT+IFQWfQKkPBeY8y1lW4UgnrOAAMI40g1X5cdWEdu84v+wi5zQgy4ZIJWy0xewaTSwh16p/etDzIVCFjsFTSA5bA=
X-Received: by 2002:a17:907:9408:b0:b73:6998:7bce with SMTP id
 a640c23a62f3a-b8037152a19mr3578554666b.33.1767134595488; Tue, 30 Dec 2025
 14:43:15 -0800 (PST)
MIME-Version: 1.0
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-4-chintanlike@gmail.com>
 <aVO5X0NKSdkH6Ab5@smile.fi.intel.com>
 <081b59e8-e74b-4af6-bd31-00ebb4e12e5c@gmail.com>
In-Reply-To: <081b59e8-e74b-4af6-bd31-00ebb4e12e5c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 31 Dec 2025 00:42:39 +0200
X-Gm-Features: AQt7F2qWtePPexAYMwq8dRDWvuDOrmxY5lQaE1jMdbfoOaWp8Hbs7ajPSCcSepQ
Message-ID: <CAHp75Vf0n2wQAEt_kfvZKKyjS7VqU3_SvF0vYbYBGikP=7dQmg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
To: Chintan Patel <chintanlike@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de, 
 gregkh@linuxfoundation.org
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

On Tue, Dec 30, 2025 at 8:01=E2=80=AFPM Chintan Patel <chintanlike@gmail.co=
m> wrote:
> On 12/30/25 03:37, Andy Shevchenko wrote:
> > On Mon, Dec 29, 2025 at 09:28:21PM -0800, Chintan Patel wrote:

...

> > Still the same issue I pointed out in v2 review.

> Sorry about that. I had actually made your suggested changes but somehow
> I mistakenly send old patches instead of updated one. I will send
> updated one. Should I send v4 or v3 is fine?

v4 needs to be sent.

--=20
With Best Regards,
Andy Shevchenko

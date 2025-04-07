Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3B6A7E0F6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 16:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B9010E482;
	Mon,  7 Apr 2025 14:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="IO3BRrge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2A010E482;
 Mon,  7 Apr 2025 14:21:31 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id DDB4A32851C;
 Mon,  7 Apr 2025 15:21:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1744035690; bh=rL5Kq/8Vnhgtbfk+mfM98iBpmaumiBMyogIjinqRYa8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IO3BRrgeVAcGE7VNzgFBqU/7nf+YlC43s24tbAdEWuqESiYMBzajaU3AHO23N5TFO
 UIoOm/TDrgk9j8l/m8u96ocrcvZIB/PM2WyhNgkt9+rI9MFNUWg33Fu0FhdnsNRdsd
 Fx0yPbpL92NtzT+Fmbqts50mYMvgkcFin5NsOX+7uBvOl+TtQlUmpUU8XvtRCPRca9
 CilsOiH9HzS3KfEnX6mqHNiGoMLy2rJ5FuJZW/g0a/rg/BTovwqHdU9po+GdPlvUTO
 nRM6mTKGsLTaLqZERQVjouaumSoVB2+zrEnjh8szFvT8CkztpUS3Cma2bFoStsGRwo
 ebzviK7zNoYmw==
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-ac3fcf5ab0dso746017266b.3; 
 Mon, 07 Apr 2025 07:21:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVlnctUWEOUrEOYyDgBnRicWEcow3CzVjWGrP2EngDN96Dh6V06+F+qTtY6tnN3akE0lALXbPi6W5c=@lists.freedesktop.org,
 AJvYcCWJKqp2++e1++rTf5w0OA4xP35vnms0DULj+Wyg1voOylQdsdPlCVjZs9J+v3SQp9EHQqnK0RAqg2I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn8If6++rnOcety9ceFL9yA6gw59rQ0MKduiEblP5h/6sI9Sx7
 GDIaHpkDZGxgVwOgB4s9xYf0t2qxKCsCTgi/1J9RyEJm4vl/kYhOflME9yKpMMG+ckMzEA7evt3
 7iozX5ghEGFaLn8bQIeUvJSmEMI4=
X-Google-Smtp-Source: AGHT+IH7HiDsscO1rmoHwUzWFYHo9BKaTCnGgPq3dnUBfIzeKNrVjd4JIOyVFI74kyMMGCnXRVH4HQNWzWk5wi3OlhU=
X-Received: by 2002:a17:907:94cf:b0:ac3:436e:12ad with SMTP id
 a640c23a62f3a-ac7e745c18dmr701762666b.36.1744035690507; Mon, 07 Apr 2025
 07:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250328-asyn-v11-0-a50d13bfea0d@intel.com>
 <CAFZQkGzKbpNHnhrC9NyeGG2_Ky_hn-KuDozYmxAHvT7ggZxLXQ@mail.gmail.com>
 <IA0PR11MB7307BDABFF7240506458F172BAAA2@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7307BDABFF7240506458F172BAAA2@IA0PR11MB7307.namprd11.prod.outlook.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Mon, 7 Apr 2025 16:21:19 +0200
X-Gmail-Original-Message-ID: <CAFZQkGx=jbgZ=jWpJTJFoMjHJ9aLi=3nGEb7G8G-SFv-T6Ookw@mail.gmail.com>
X-Gm-Features: ATxdqUE_pXQMxgfafnVX31DOCkOahupB5z7AfX4C5bQriKkw1RU5iwC1EWjZkIU
Message-ID: <CAFZQkGx=jbgZ=jWpJTJFoMjHJ9aLi=3nGEb7G8G-SFv-T6Ookw@mail.gmail.com>
Subject: Re: [PATCH v11 0/5] Expose modifiers/formats supported by async flips
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
 "Syrjala, Ville" <ville.syrjala@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 "Kumar, Naveen1" <naveen1.kumar@intel.com>
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

> Can I have your Acked-by: for this series?

Yes, consider it
Acked-by: Xaver Hugl <xaver.hugl@kde.org>

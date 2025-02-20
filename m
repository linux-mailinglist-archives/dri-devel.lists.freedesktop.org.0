Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04253A3EF2C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 09:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF20E10E136;
	Fri, 21 Feb 2025 08:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B1710E0FE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 18:35:27 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-abb8d63b447so171763266b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:35:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740076525; x=1740681325;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lc4tYVIXad/mhyoDCTa+KlzbPNoPTYdJb9IQsP+eoT4=;
 b=C99cFuKC47/y6BjuihudBeawSjOaWYr6Ev4J7wHJChGT3JbxCUAfI/if7gE5h86kSI
 8UbeFmdYGW29Vc3/G/iavnNrKXPN26/70Th9aE0JTqZuo9Bi2s+PjF90QnG7HTQet4ya
 XEzmq0yxcSFA59TLzXwirHRvRBXWedujs35gdenRmz/mafGf0gE7fp0MY16NlurBGU0a
 9q2KZYYISYu7DuzK7pXBOz/u8NlWSyV7lCW56QOEZtvyU4+DbkD6tBRyhTS23j2ioded
 hMkPh7A2LqsjBubkkOm/knfEqTphkq+PF6box0kLwY1tUkOFj/tCXrjukRCFOqCALgBO
 eKnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMlYsGoaQw3P6bCPGfIwrzv0Xiun2DXdqLAI5kirQz4iZH9GWR3XlmOq2xJa/NeowBmze8exZINDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywwtz89P1IS0E/X+RNuOjFXGvoZqhe0rW5r0FWuje+LNxk6Hu4R
 PXeaPGxB5rZgzqPqYjhh124Famlv1p71rVjOPSWKYcHUAu41NAMj37dDjOicAxw=
X-Gm-Gg: ASbGnctv/nYrGP7uzT3gcnLoSvCzmW8XMa4I8HnVIwHhkClLHVvWSv7nGfgo8b0/FkT
 D5w4hitw4BSJhEaIRSQLzoFPqb2Eh//mcg5n+jLiV50aB/KcVLuGaG8kkj2DrP8Vqh4e8+y3vyB
 A3HTcFHfjFllLcEKBfi4p/9YYGJdFLevrx/fKbsGoZ+c0L5FaJ/pvEV2qCn9D2HsvWh7BoegB7J
 UYS+mA7Mt8fZsSRedvdgOa3C/yEgD4dwZVDsXRy0iUXM+bEkcQQsJg6IsNa/AvfNt0nYNSgkKBx
 MoxXHyXoBbUMTBgKblrVRZ6+eQnkZMP/Nv5v0JOVBqcBHg==
X-Google-Smtp-Source: AGHT+IGp+P29mhTy3boVDAndr9ZJYziLUY1mjE6s77Bd77PQF/3wO+lLunaULVHP0Hqn87QL0NPwKA==
X-Received: by 2002:a17:907:7ea8:b0:ab7:eaf7:2bd6 with SMTP id
 a640c23a62f3a-abc09c26eb8mr40194266b.49.1740076525203; 
 Thu, 20 Feb 2025 10:35:25 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb9f8442c0sm782790166b.150.2025.02.20.10.35.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 10:35:22 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-abb8045c3f3so163800166b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:35:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVRD2kEGqxoGJBZ1z4gNYfPyOw6B8cLVZX+H664LmeVzYq8tHLgBLPTIKtUW88HsjFzeEeFSfnm0X8=@lists.freedesktop.org
X-Received: by 2002:a17:907:7845:b0:abb:b322:2c4e with SMTP id
 a640c23a62f3a-abc099b3857mr45311166b.3.1740076521525; Thu, 20 Feb 2025
 10:35:21 -0800 (PST)
MIME-Version: 1.0
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <1EFD4096-FB85-47BB-9952-E014E463DB1B@live.com>
In-Reply-To: <1EFD4096-FB85-47BB-9952-E014E463DB1B@live.com>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 20 Feb 2025 13:34:44 -0500
X-Gmail-Original-Message-ID: <CAEg-Je8VaMGxztdu9+Uk5dFJeYaru=nFSZhpVczM79GaCYURkw@mail.gmail.com>
X-Gm-Features: AWEUYZmbr-UkiwBE7upLCEsKo9jbPsLOn6oegnKRI3ia0qci58WpHW4Q4ye6O0M
Message-ID: <CAEg-Je8VaMGxztdu9+Uk5dFJeYaru=nFSZhpVczM79GaCYURkw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, 
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>, 
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 "corbet@lwn.net" <corbet@lwn.net>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>, 
 "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>, 
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, 
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "kekrby@gmail.com" <kekrby@gmail.com>, 
 "admin@kodeit.net" <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>, 
 "evepolonium@gmail.com" <evepolonium@gmail.com>, 
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Hector Martin <marcan@marcan.st>, 
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>, 
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 21 Feb 2025 08:53:47 +0000
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

On Thu, Feb 20, 2025 at 11:47=E2=80=AFAM Aditya Garg <gargaditya08@live.com=
> wrote:
>
> From: Kerem Karabay <kekrby@gmail.com>
>
> The Touch Bars found on x86 Macs support two USB configurations: one
> where the device presents itself as a HID keyboard and can display
> predefined sets of keys, and one where the operating system has full
> control over what is displayed.
>
> This commit adds support for the display functionality of the second
> configuration. Functionality for the first configuration has been
> merged in the HID tree.
>
> Note that this driver has only been tested on T2 Macs, and only includes
> the USB device ID for these devices. Testing on T1 Macs would be
> appreciated.
>
> Credit goes to @imbushuo on GitHub for reverse engineering most of the
> protocol.
>

Can we credit them as "Ben (Bingxing) Wang" instead? That's the name
on their GitHub profile.


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C3FBADA27
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 17:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC26F10E5FE;
	Tue, 30 Sep 2025 15:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g01p2VEM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5890C10E5F7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 15:14:52 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-3307e8979f2so1050867a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 08:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759245292; x=1759850092; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sqQp7CJ0/ZUkBsxNzFP0LcZLdH18lJsedYddrwxvvpk=;
 b=g01p2VEMjqNv1jLShYNEN+MDF9mWBu+G7+eGoKW7T1beOPyEUflDEtcYaKkeVkHoSC
 ztBX/LapGM8TRmyg89OB6JoMz4VM8nsDq0qdzkvAX1HCgP4/UiFv4fkRbWZnvZzUsmqO
 r+RUrNfwD3MHpa40MW14aYhvnG0IlHwXsa4SWRx32fxazrH/8d8h34pEQ93dE+DL12PA
 91YArajCuVjllbnabExBo67xP9+S4/5sKSnjXEBhEkldgTJ3HX7Ed2E6WaXdEMBeBB75
 gWtz96322qoaSvay1tfg2oF4I/S/7VVbzJyxe6jH7bmvixA5In7f/YLXQOYIR9zN5izn
 FPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759245292; x=1759850092;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sqQp7CJ0/ZUkBsxNzFP0LcZLdH18lJsedYddrwxvvpk=;
 b=MF7Uqv6qYM6vpOnqcL4jz1GFGW2rWyNTYdh5g3er5oP1OvYuXvq6VkVB/slAB91SMa
 8k3WqHjlNa5ER1L7c8qBjVFFkqd/v3OhAPpRQN5jAT+v3lanPRlJAfwRe2eGCrjEOGCR
 nTGcRG8b8USvEdrys2q6sptbDBKuCysxX47kdzn+IozGe1YyTicktvJBqD67B8Qr9Laa
 vRqpSWWMKNJUa82B4a4wS2MVEGVFfCTfNFdkb8QNmwK5Rul1Has1j3qaq+B+qnw65vhI
 1jn0r2DJD07v3MCSB6YO3wkQRlvO3AOPsswFVKr4221OWKAEGvpwe0EosOUvWZZU8eFf
 SaGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWLyE+WHZgDUiB2+0Fej/VvQ6ENZdHT5hIwM9KCTywHfcatiR0+J12uLT9E/De5TV02x0rmLopYws=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqyFr3Gn4y1JSyfW8csHyyo8suqInUfwJcq9aqbtnuNxx+iIN7
 1a+jNMIl9k7A9oizIKkmXz6TePbFGX6EqqTJwgBaC5bYfsW52lfL3Z91AWZTyWO6nIZMA9Jc8sp
 UzE1eleQ98BEKfSm5p5ZaAJSyq1sHaLI=
X-Gm-Gg: ASbGncuA0J+zn2vjIz9zgGj9se7kMKOeFJ3RKWJ3lpU4HETJaxC0rb1Y09TH5pgM1ST
 k74kXqZcl/+kOi8/kOf+c9xyMH3KevPzY16yY663yMFy7zlK0+Rht0iSa97oMgljyqg8m5903ju
 f+K+DU966m+ajoS+u+/LKxrzI/taoi1qfuRWJlb+raS8vnxE7i3jyX7zvZWIhIrtPJ0NaH9rJxc
 LLyv//d/G3RqrqsdCFOIvG/76JgBqGHQ2HMjhm3ROE=
X-Google-Smtp-Source: AGHT+IExoZXRGA9mlKSnNf+W/ZNX3bZkUMtUXmlXaqFzDSzAGWgOOtRwh4IW/Lva8s/pV6iOzxj6lm0qRAbLvvk3MsE=
X-Received: by 2002:a17:90b:1c04:b0:330:7a07:edb5 with SMTP id
 98e67ed59e1d1-3342a22a7d9mr11752276a91.2.1759245291691; Tue, 30 Sep 2025
 08:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAGfirffPy5biFVLtSNEW60UCXa6_=-=NrQbU7iLQ8+BXnFQ=1A@mail.gmail.com>
 <175922381867.30706.10351894191632562572@jlahtine-mobl>
In-Reply-To: <175922381867.30706.10351894191632562572@jlahtine-mobl>
From: =?UTF-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>
Date: Wed, 1 Oct 2025 00:14:41 +0900
X-Gm-Features: AS18NWAxKWtkalxkS1HEf0Xmhu8rrPNzm3u1MnhkYOFR4UIYsfyEiR54fm4Pd-8
Message-ID: <CAGfirfdDe879wFzABVZkTV7grEimpnc0XrrKpj2SX1w_TLtgNg@mail.gmail.com>
Subject: Re: BUG: unable to handle kernel NULL pointer dereference in
 eb_release_vmas
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, 
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com, 
 simona@ffwll.ch, andi.shyti@linux.intel.com, ville.syrjala@linux.intel.com, 
 nitin.r.gote@intel.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
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

Ok, I will do it.

Best Regards,
GangMin Kim.

2025=EB=85=84 9=EC=9B=94 30=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:17, J=
oonas Lahtinen
<joonas.lahtinen@linux.intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi,
>
> Can you please open a bug as per the instructions in:
>
> https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html
>
> Thanks in advance!
>
> Regards, Joonas

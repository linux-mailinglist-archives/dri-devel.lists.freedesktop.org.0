Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6989B0242C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 20:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B355C10E3B5;
	Fri, 11 Jul 2025 18:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AkmzeH6p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA22E10E3B5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 18:54:33 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-608acb0a27fso3424877a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 11:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1752260072; x=1752864872;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h8DF3TN4LDXw2ml6xO8e2jD+Euu91yv1fKkxI9RSJ/c=;
 b=AkmzeH6pey6w1EbAEwZ7wMoapMfZx1RijqqjAOEa4Y+d2C3+BrusXwfL7s0BNXrwcE
 SLc0mL3X2zYp/I4bdDfTHeeEcuQ8VXP1G52o+p0sxA6Pz3jmDw50K4/Tv5Ks9kAYbk3O
 LQZ3RoYjG/xaeC/pLeHtOz49s+mllPZ/ucbdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752260072; x=1752864872;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h8DF3TN4LDXw2ml6xO8e2jD+Euu91yv1fKkxI9RSJ/c=;
 b=Z32ij7WymDWxaDH/dC+MsGtZ5fH372oGm5GELIr06yjCWvobqJW7bMi7iMr9TpRyL4
 N4+B/dozvxac9PyC53Olk0X//Rax+YlFA9Eha/pdxS36tfbqmWgkREBZ2QxaqVeEj6u3
 8kBlLWkOMDtLryuQeLUOQMPMm3htQozFSlUA2UzJPeIxoKGPr+hRgy0WomXUn1ROiMPA
 hR+pdB9QY3DCnnEWV7wTjETuuqA25CB7+gVejbrxTrnrQzmlcL3cbs416wL+8IPCA9pZ
 /o+yH8B3YgRBfcZGNZjHwSJmzK0Z/quZphg5Bj09eK1eWg9bubTfUie/BdvnqqTqg56x
 mI4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwOTUKKTKAQTvdNErQKPh0XC+GboKTAs1jrJen8osOGW7100RpGwqlnpPmNXL0Ctl3dBu4UTa4jgU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUBHUq235HXfHaSMlCVSqB4Y5nBDSwgSf7MPJB0F3eN6cyKn4Z
 ehK/WemJ4vQ0QSyMKDYGu72w/2OVZCeY1kimb2CDNaBI3/ZGAkb8w32KGx+r2ArqWDJToXq1GEe
 BlvUZTTiz6A==
X-Gm-Gg: ASbGnct1t1880g0juABbhW1T8+JejHLBtHCSiNLpP88mfMzv/GRkJypFG7N2w9ZR1cL
 9Qf+hmLxdGcWAxblrcUE2RJsirgnPFdsa3uB2ySZBrCvPpDwSPJ4Siw01Rca+Q04gGSK23prggy
 E6BRoQy5DNBXJkxZfv8vzHZIWxbes1KS+MWunmqek6eDfmNxLPecSEsbUB18ma5Ln7tJXUAA6HN
 L4xHr6ceZ1MnOQ5fi+wMg6ESsat/QosfWaDthDK0gdhDzH+l3fM9SUueNRCUg/UFleelkgjnFPK
 yYW/m2ofV8iAdLQO3spZSnzIaYli9KgBfDQvuwwl1HsJctR40A8904eYDRtXNb8ECDw5++1rk5w
 GjNZd78mTIsfCkn5GhoVq+PtybGQv/hVo2V/fjSTDqW+O86Y0YvGjgt2devIndmWx3Luuloe+
X-Google-Smtp-Source: AGHT+IHU9P4uYT7+F5UKWyTw+KXKNYwR93YeRslquM1B8s++GvlzFRU8m+76UlGTHvDP2HgPLiLa6g==
X-Received: by 2002:a17:907:720e:b0:ae3:24c:6a21 with SMTP id
 a640c23a62f3a-ae6fc0f50fdmr502043766b.26.1752260071922; 
 Fri, 11 Jul 2025 11:54:31 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611c973360bsm2570735a12.45.2025.07.11.11.54.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 11:54:31 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-60dffae17f3so3571410a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 11:54:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUgUlIP13IbNeLfxQwjk0JbNMV/D+HTaBDxQ7zEglOHpZq7kphljbVfaTx2woAQcY5WzQagdKTVSyg=@lists.freedesktop.org
X-Received: by 2002:a05:6402:909:b0:609:9115:60f8 with SMTP id
 4fb4d7f45d1cf-611e847f9e0mr3480426a12.21.1752260070618; Fri, 11 Jul 2025
 11:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250711151002.3228710-1-kuba@kernel.org>
 <CAHk-=wj1Y3LfREoHvT4baucVJ5jvy0cMydcPVQNXhprdhuE2AA@mail.gmail.com>
 <20250711114642.2664f28a@kernel.org>
In-Reply-To: <20250711114642.2664f28a@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jul 2025 11:54:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjb_8B85uKhr1xuQSei_85u=UzejphRGk2QFiByP+8Brw@mail.gmail.com>
X-Gm-Features: Ac12FXz6F4j9YIJKyGAUwYcgpVBje1DHMNB65HFrbPl9F9fpay_RiZxgMldk13w
Message-ID: <CAHk-=wjb_8B85uKhr1xuQSei_85u=UzejphRGk2QFiByP+8Brw@mail.gmail.com>
Subject: Re: [GIT PULL] Networking for v6.16-rc6 (follow up)
To: Jakub Kicinski <kuba@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@gmail.com>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Fri, 11 Jul 2025 at 11:46, Jakub Kicinski <kuba@kernel.org> wrote:
>
> Hm. I'm definitely okay with reverting. So if you revert these three:
>
> a3c4a125ec72 ("netlink: Fix rmem check in netlink_broadcast_deliver().")
> a3c4a125ec72 ("netlink: Fix rmem check in netlink_broadcast_deliver().")
> ae8f160e7eb2 ("netlink: Fix wraparounds of sk->sk_rmem_alloc.")
>
> everything is just fine?

I'm assuming you mean

  a215b5723922 netlink: make sure we allow at least one dump skb
  a3c4a125ec72 netlink: Fix rmem check in netlink_broadcast_deliver().
  ae8f160e7eb2 netlink: Fix wraparounds of sk->sk_rmem_alloc.

Will do more testing.

             Linus

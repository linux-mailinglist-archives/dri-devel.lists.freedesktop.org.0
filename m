Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D5188AE92
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 19:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C2F10E758;
	Mon, 25 Mar 2024 18:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AXHRxjp0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406FC10E758
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 18:39:14 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-29fb12a22afso3119504a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 11:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711391954; x=1711996754; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nFwzYKXU3PDENa5lkJ8uYCOEicrv86o7Knmj0aH6USo=;
 b=AXHRxjp0d608i78AueRulxorQNdZzPW3MxC9KXI5wLoYv67BS+kld6j4dEFqwAFlha
 7XmmLWMwsHYa/zFuE7SGw99neo3s57vZeXE2/V0gDhkTd9ovMfgmHXRlD3UeV53sBlwe
 IKUDjjIs0kK0WR0hB0GOaEKDj/gEC5psJ9zpvAqMJbZiPIDE6x+Z5jeEI7L0QDeLkKPH
 kwryYM1zwhs03d5TN+r1NX9QG6BTg1scDsy4+TTC7EqSfUEnm2bjnKLMMlvzjPo3Y2B2
 mQ3qS656Z9Acl56syHYCEX+F5PAM4JUZ5Jaq7hcbRpn29tyyhpZkHDnfonHRGC5Y3ZyY
 tZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711391954; x=1711996754;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nFwzYKXU3PDENa5lkJ8uYCOEicrv86o7Knmj0aH6USo=;
 b=i39WhHD2VKsqGFSVrTr2fm4n8xgRLBmlaZHMSLXPgQGo7beHo/JuPX5jAdy0h787j3
 56SQzOj3pLXrLP+ygimg0hSIf0ubzjRBa8kmcY6MJUdMk8Y/UEggZgQ9WP4vv6rhlnPh
 xgtEY6EbEvz8EPaHETFgW5kB2zuckQPcBmAy1swMX4zv2PRZvxntbEH64wlJg5DKGRJB
 J06D1ODBtfMFfSzcih5/fKzcWsqe5BAAO6qKf0dODk44csLXdNLMZoXI11wNwlpL0Quu
 K1ekvCHbsHlhnVqRZitS4PfjY4BbRVy8XCpjsVWrBwwhRX60TmJSA/IdHryxKWFJSJ3f
 ekOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDK7AnIcQvvzOSPac7gHD4URFITahZm5UGIVp1OQPaEKbg3vbRF/XCBzCmzfw8tVY3Fe8i5Z418Bqp1Zu5ED1vHtTtQJlcojvmkBNmRTyA
X-Gm-Message-State: AOJu0Yy1VyfohAqEYLRlgQgPceO3/iC57lDX71i9wFnPsuGe0sBQDWCB
 3ybuZck3q1ZkNMOQnYxxBSs/GmHpFjJ+h11r+iEJogHfdQGv9+9KFelysw6uMV4tgA9GNytIlqq
 rS1dFhbX9rh22e2JqAxCyJZf3BMo=
X-Google-Smtp-Source: AGHT+IHB8Kf1FiMvd2QhpeI+M3oeri4uBSNnj55Ko8tFwUgHv4S6Z6z6cTiW6P4RuVTjs9xt/tzUaKUsVOQZ+M6sbfQ=
X-Received: by 2002:a17:90a:16c2:b0:29a:3c70:1525 with SMTP id
 y2-20020a17090a16c200b0029a3c701525mr4879792pje.45.1711391953686; Mon, 25 Mar
 2024 11:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
 <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
 <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
 <adbfdf6c-fb59-4fae-a472-17b04dd8a3f6@tuxedocomputers.com>
 <1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com>
 <aec1d22d-9e59-4dfc-b108-5ba339b0e76a@redhat.com>
In-Reply-To: <aec1d22d-9e59-4dfc-b108-5ba339b0e76a@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Mar 2024 19:38:46 +0100
Message-ID: <CANiq72kPXsTjzptK7tSC=RygEpWHJHz1-QXuZv8qPHfGLyzrDw@mail.gmail.com>
Subject: Re: In kernel virtual HID devices (was Future handling of complex RGB
 devices on Linux v3)
To: Hans de Goede <hdegoede@redhat.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, 
 ojeda@kernel.org, linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, 
 Gregor Riepl <onitake@gmail.com>, Benjamin Tissoires <bentiss@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
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

On Mon, Mar 25, 2024 at 3:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> +Cc: Bentiss, Jiri

Cc'ing Andy and Geert as well who recently became the
maintainers/reviewers of auxdisplay, in case they are interested in
these threads (one of the initial solutions discussed in a past thread
a while ago was to extend auxdisplay).

Cheers,
Miguel

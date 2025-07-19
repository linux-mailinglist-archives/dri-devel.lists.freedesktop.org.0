Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD9AB0ACB5
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 02:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A9E10EA52;
	Sat, 19 Jul 2025 00:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="nQ0ttqPs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3176610E1A1;
 Sat, 19 Jul 2025 00:16:36 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 207843362D3;
 Sat, 19 Jul 2025 01:16:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1752884195; bh=+SW9HKAN+z+hmirv9JgSELxzYFSbDm/NwFJH2k9B8zA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nQ0ttqPstIDTEiLaHDO4dixvQa0bBA8ZSH5ISzMDpIqG1+mAu9D/UGIy9dk/AxMGz
 f2buMQp49Bt5YjRTf1KgCtInHYemRNx2mx14hbsMIZjtFoZ1Oerg7P6c+0K764gqHg
 ShGceN1Kw4hSiuJaaR5GvjXaBN6s8qYnUEWwCzNlHVoubiFE3kIJyCLMaVq0ziXmFq
 kzjBmRzkoqa0nLRErdcGyVQMnXjcQRX+hT8JFThR93MB8Mu+kKPsKfWm76vAJ0GK22
 hnWzmUUH6jWqvTYMagi+OyzDe1EQcCLBPPzOMbLI2pIf3eFIZwFW33nGXU3l/DgANj
 rFX+lmQSzXM9g==
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ae0dffaa8b2so518751766b.0; 
 Fri, 18 Jul 2025 17:16:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV9K6FJMTVgTULTbiEbQEHB4dnc4hQuqd3VPZJccXuVEBF43X6Y8+Ur8CbOAg0OHYhI+senYHA2vf4=@lists.freedesktop.org,
 AJvYcCVYypBVfSzyxCp33OCxl/JYWb5Oe5y1UU4tI04SjD64ns6S8+poapM4qmFOptTka7lSOelEw+SIJhFb@lists.freedesktop.org,
 AJvYcCWr3VHnH+s3HvLdQM6XKj6wtEoL7JisK+dY049JrcAodbliUS/1+nN4DfTpWGnxj82KUXXU/vTiqyk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaL8XgWJ9yHwGFI0nCxLkWLUjGKIII0dVmU1rXU0kB1E+n9u3V
 dw0X5s8QLGNO9VC1NYtxqHuhoPuWSQyCvkVvoTLfMWwARoi867RwyjUt8bd+QtZa+0WZUbdv8+g
 BXjrGx+Q2lNwBJhPdb8ShzMdrYzDm6ww=
X-Google-Smtp-Source: AGHT+IFdsE/69SmzE/BWE5sc+VReyctRtLa/1LXkR+TtIyVDiKX/GkzMAFRs8paJb3qOD9toooIaxLsmNzScdR1Z5Ko=
X-Received: by 2002:a17:907:9487:b0:ae3:cac0:f47c with SMTP id
 a640c23a62f3a-aec4fb095a4mr885116966b.26.1752884194755; Fri, 18 Jul 2025
 17:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250707154121.74969-1-naveen1.kumar@intel.com>
 <aHAg2J-uFLLWINqp@intel.com>
In-Reply-To: <aHAg2J-uFLLWINqp@intel.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Sat, 19 Jul 2025 02:16:22 +0200
X-Gmail-Original-Message-ID: <CAFZQkGwKs04zJ0y2VuwVJkiKH6Z00dZoYGroWS6R=Qux_n0iJQ@mail.gmail.com>
X-Gm-Features: Ac12FXwCXv2lHE_qFnOiezjLx5BrVIPAX5K9YLoWXHNffYddQkVrk0cbVaZq91A
Message-ID: <CAFZQkGwKs04zJ0y2VuwVJkiKH6Z00dZoYGroWS6R=Qux_n0iJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/display: Allow async flips on planes with no
 framebuffer changes
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Naveen Kumar <naveen1.kumar@intel.com>, intel-xe@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mdaenzer@redhat.com, sebastian.wick@redhat.com, jadahl@gmail.com
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

Am Do., 10. Juli 2025 um 22:21 Uhr schrieb Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com>:
>
> On Mon, Jul 07, 2025 at 03:41:20PM +0000, Naveen Kumar wrote:
> > Allow asynchronous page flips on planes that either lack a framebuffer =
or
> > retain the same framebuffer, as long as no plane properties are modifie=
d.
> >
> > This avoids unnecessary failures in async flip paths when the update is
> > effectively a no-op, improving compatibility with some compositors.
>
> IMO what we want to do is make the drm core filter out all the garbage
> from the commit. That way the driver would only see the planes that are
> supposed to actually participate in the async flip.

That sounds like a good goal, but I think it'll need some extra care
to avoid regressions. For example, "no-op" pageflips must still
trigger pageflip events, and affect the refresh rate with adaptive
sync.

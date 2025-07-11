Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FE6B01527
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 09:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD6F10E9BF;
	Fri, 11 Jul 2025 07:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="YhY7PVxl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133CA10E9BF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 07:49:17 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-60c6fea6742so3464750a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 00:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1752220155; x=1752824955; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vuj2RXHOOyKDpGAVts46ctP8tG8E0kUzK0aOC3W5/W4=;
 b=YhY7PVxlhv/0wcssLFatfGcEMpoxEhz7alFkUQ5kajzcELQe5eulMYTHIE+7uw+MTV
 ckuL4jHj8ulNq1GIQO5FV9uTbGtfWjHkSxb9QkZSTQw/VkzuuuWSedT8NxYlnLkGso4E
 f0q5WMlnT3K2FwRx5CkY7pmimY6KzsYJrv5hDBSxj9jLLtr7oKOOFr1Q6aVH/vFRkm0v
 lIAYMVORM2OyMk8/S0LOgQU6owJYZ4SZRyQuXHzAB864ODuY6M9vwlfiuP4xXL2WHn45
 UrCBo3eCfepUFKmtsUVokasO0sZcgvg0o/MwJjGqrxDfPnlbMkiB93lkX5QcRevxZcdK
 aunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752220155; x=1752824955;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vuj2RXHOOyKDpGAVts46ctP8tG8E0kUzK0aOC3W5/W4=;
 b=SeWGbgwbqa1ritRlIpBmq7NVsXYBZf4jJgn20DcEpc3FC5/Tff4Jif+8bTLj6p93su
 vLtV60GrjnFyVhJa45MBrSdqvluF59Qng2e15xcKlttRtwicYjxGA3XDrreSxX1hWMJn
 rxbAGk6vKebzXC5BEiP3CQfAPcbKjo6Ivl70rtO8fvTOezHD0LjS20FAAP9kWGxcnaHC
 ss7KrI2E+aSfXjbq+KzZADqJbMZ6upHFaxExMSuDgKO4FAieKpFXX5kapDF/29Mbwk+i
 QBdD+2cuilUtDx137H9XbibunFikJ0iVDarNbZ0aGZGYS0h9yRsYYseqvXrkX6LKirFw
 3WrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFcPtHjhq5C9njx5CsK3QRedMxiEkN/XoFR4mC0apLc/iHxSWyvLJTxr3olik4QHcClM88VGQO/Tw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyFDzMzIfXHn73QyMBgxeITqItJJLFYEUdE7Yo2WeEfYLxPUKK
 medsFE+ZZFMQsTtLkoMs74bBVknD2Js6rTnZEZw+6S9XfzjZSPbGr4t1PBuwWythcUw=
X-Gm-Gg: ASbGncti0Y3xH7xAItdRRGS4QbKkicYHPsEHfQaZo9QF1xqUb8blnVH9BqZRWktnPdU
 Y5TphViOon1lZ0Zmmc8uaFb+XLYdeLfz5mDwKxabU/in35pn680VlsopPV5zx/UaIdOn88dNFxH
 8YN4kGUxg+SV9LM6Ll+kr1qB3oHzcHNQq449xI/DCdlMp5oxoTgmgYeaDAfhgJhxzd2VkMS+R78
 NBbs6u0BOz+XKIJKLISJsltLqVtYeoh8XTWzwIDCdZUDgVvSK+AdX94DrHZqgusSMY28KlzHmrG
 CtFUqMprGQXQkloz3OVtQKlJvbXHQuP+/ujKTR90zGNX2YQykcjlsl2BQQXFG7qc7FjTtB6dU/r
 4mBk2ICVWsmh2xgxqN7ECPWpb+q6Xf2C4yLFzv5RxrCSuGZzwdJmFKElj3TBaA3eaRkE=
X-Google-Smtp-Source: AGHT+IHF+UIT8lzRUG+Gi81dR379CZsNGMp8TAA1jLven/3EV99Cld3+kcRl0ivBgJtQ89/Q0wzV/w==
X-Received: by 2002:a17:907:e984:b0:ad8:9466:3344 with SMTP id
 a640c23a62f3a-ae6fc10858fmr222387766b.43.1752220155539; 
 Fri, 11 Jul 2025 00:49:15 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl.
 [144.178.202.139]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e8264fa0sm248855466b.88.2025.07.11.00.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 00:49:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 09:49:14 +0200
Message-Id: <DB927EJAGV63.1RSRM7JK907VL@fairphone.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Javier Martinez Canillas"
 <javierm@redhat.com>, "Helge Deller" <deller@gmx.de>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
 <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
 <1129bc60-f9cb-40be-9869-8ffa3b3c9748@kernel.org>
 <8a3ad930-bfb1-4531-9d34-fdf7d437f352@redhat.com>
 <85521ded-734d-48e8-8f76-c57739102ded@kernel.org>
 <e534d496-6ce0-46c8-835d-94b3346446a7@redhat.com>
 <6e4253dd-cd73-4302-b9df-44c8c311eb22@kernel.org>
 <vk7xshncx3vj66ykbt3cfdjwdsx5uewfzlqmfsdbjfgju4awwk@lz76hnenxq2u>
In-Reply-To: <vk7xshncx3vj66ykbt3cfdjwdsx5uewfzlqmfsdbjfgju4awwk@lz76hnenxq2u>
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

Hi Krzysztof,

On Sun Jul 6, 2025 at 1:24 PM CEST, Dmitry Baryshkov wrote:
> On Wed, Jul 02, 2025 at 10:43:27PM +0200, Krzysztof Kozlowski wrote:
>> On 30/06/2025 10:40, Hans de Goede wrote:
>> >>
>> >> No one asks to drop them from the driver. I only want specific front
>> >> compatible which will list and constrain the properties. It is not
>> >> contradictory to your statements, U-boot support, driver support. I
>> >> really do not see ANY argument why this cannot follow standard DT rul=
es.
>> >=20
>> > So what you are saying is that you want something like:
>> >=20
>> > framebuffer0: framebuffer@1d385000 {
>> > 	compatible =3D "qcom.simple-framebuffer-sm8650-mdss", "simple-framebu=
ffer";
>> > }
>> >=20
>> > and that the binding for qcom.simple-framebuffer-sm8650-mdss
>> > can then list interconnects ?
>> IMO yes (after adjusting above to coding style), but as mentioned in
>> other response you can just get an ack or opinion from Rob or Conor.
>
> But, this way we end up describing MDSS hardware block twice: once with
> the proper device structure and once more in the simple-framebuffer
> definition. I think this is a bit strange.
>
> I understand your point of having a device-specific compatible string
> and also having a verifiable schema, but I think it's an overkill here.
>
> Consider regulator supplies of this simple-framebuffer. Obviously some
> of them supply the panel and not the SoC parts. Should we also include
> the panel into the respective compat string? What about describing the
> device with two different DSI panels?
>
> I think this explodes too quickly to be useful. I'd cast my (small) vote
> into continuing using the simple-framebuffer as is, without additional
> compatible strings and extend the bindings allowing unbound number of
> interconnects.

How do we continue on this?

If the current solution is not acceptable, can you suggest one that is?

I'd like to keep this moving to not block the dts upstreaming
unnecessarily - or otherwise I need to drop simple-framebuffer from the
dts patch and keep this out-of-tree along with a patch like this.

Regards
Luca

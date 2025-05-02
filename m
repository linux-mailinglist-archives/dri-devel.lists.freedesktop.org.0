Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A52AA6B16
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 08:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A0110E15F;
	Fri,  2 May 2025 06:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=braiins.cz header.i=@braiins.cz header.b="jC2Q2ymy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CE410E8B3
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 06:56:57 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-af589091049so1281891a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 May 2025 23:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braiins.cz; s=google; t=1746169017; x=1746773817; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEiHu1TfGrVTdojwbzEMrJ4xzRHxuxbkk9QPIQtp3e4=;
 b=jC2Q2ymyJBi5FEriYnpQYqJtmJq7ZOvScGguUvBiW2JtY2ZhnEhvYeiteEdfJgoY/H
 hbXF1dePObSM+YLbpWUcm0JKhwpAfjX38L9SXiWkGRg/ZU5LWS8zdzW+ueWrgM7Z8LCc
 rcU6sQoLvj9irudKgKyWZPAeJpsUJN6ulWnRj3stkdzJUx7FH1Uz2TmSYd7Hv/K7kFAU
 6xumgrOVMe2YqymMdrh7bOyRrJaSdSguJ+oG9yzl9rLGtMJDl+Utm5UyQHgT3gb+JA99
 nZu19bT1KpNowMxmnAxvmK/F0SQfn7nxbpRrnDCOwchLi0zmIxIkN9GK/e69uRaSVT2l
 3Fpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746169017; x=1746773817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NEiHu1TfGrVTdojwbzEMrJ4xzRHxuxbkk9QPIQtp3e4=;
 b=XZ81xJQkeZjSNEecY+9QyQTLq5V4n+/AwaWFEiU1iDT3o97eTOFujpKwfj+T8pUVMe
 ht0AXkVe3O2RJycbz+ZfbCtS7uKkMuxxE9T8RSUANWfVOf62q62xZ0gSkEfhuEY4RwIn
 ri1Za12BhhOyWYV+mjywUxmJymdD4s9buAm1BEs4zfZJxXWzBbFXelydPtnry7/N6xDu
 atQsxL9MJYxeiP6NvGhpr9BpOKOQh9aEL3PpYX1RgCVAjU5V9y3MX9P6iey7Wme7Z2ts
 JvQlxT50KXBFpVC88ZoQa4E2h6sDkS9XRWN9AcSTfWZ06h/eOfU7oY9+sly/vZVW+13d
 7r/A==
X-Gm-Message-State: AOJu0YxGPmxzKAe4GHOdXNOb2UB0NMJkPiQuiiWqllggryKU5rogRRBn
 IS+AaftrQCMVgSImeStblZ6xQV5rtS3SRuJ8YVL+Z6l8/8kiEMAAfUaJJay+EZid+PIJiOTVklu
 ooRsQLGd7L31coXnpzIo7e3jZ+APiLLUX/4fcwQ==
X-Gm-Gg: ASbGncvib671m8zu1/9ojXdGVZsKjYETle4vN/p7KJXhkVNn2fNn6DujLrnTFkcBj/3
 BMxxCdIat1oLamqE+qLbPC4a+1jGQZhxiP7ps+4CwgoDKxM9JYhlNVmnEqH+gOO/TbEIuPY+rhL
 ncdXEHXfxE0jlfZqLpzvd2
X-Google-Smtp-Source: AGHT+IGyvHdqX7x460ABQDGqsskkGkltPSVuUtVjoCFYy0JrKY1EbI5sU2a1Yg+NmwIZ/r9UiZiKiuNwIHxkr4kIdpo=
X-Received: by 2002:a17:90b:5252:b0:301:9f62:a944 with SMTP id
 98e67ed59e1d1-30a4e6949a3mr3253264a91.33.1746169017300; Thu, 01 May 2025
 23:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250430131758.13535-1-josef.lusticky@braiins.cz>
 <e8780653-dd7a-4a30-b675-3f41068ee0d0@lechnology.com>
In-Reply-To: <e8780653-dd7a-4a30-b675-3f41068ee0d0@lechnology.com>
From: =?UTF-8?B?Sm9zZWYgTHXFoXRpY2vDvQ==?= <josef.lusticky@braiins.cz>
Date: Fri, 2 May 2025 08:56:46 +0200
X-Gm-Features: ATxdqUH5Zzs-tJZanWxsWJRPT5XrgmxsGgjmZyCs33_NUVpKLFv4bKZv0t5cc7g
Message-ID: <CACnTymb4=8Zw=XLV80s0N_71Bbb9AXs1hAPy1CHNe2x2zjw-OA@mail.gmail.com>
Subject: Re: [PATCH] drm/tiny: Add driver for displays with ST7365P controller
To: David Lechner <david@lechnology.com>
Cc: dri-devel@lists.freedesktop.org, lanzano.alex@gmail.com
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

On Wed, Apr 30, 2025 at 3:53=E2=80=AFPM David Lechner <david@lechnology.com=
> wrote:
>
> On 4/30/25 8:17 AM, Josef Lusticky wrote:
> > The driver supports 3.5" Kingway HW-035P0Z002 display found
> > on Braiins Mini Miner BMM 101 product.
> >
> > Signed-off-by: Josef Lusticky <josef.lusticky@braiins.cz>
> > ---
>
> I haven't really looked at the patch yet, but what about this display mak=
es it
> not compatible with "panel-mipi-dbi-spi" so that it requires it's own dri=
ver?
>
I actually ported the driver from an older kernel version, where
"panel-mipi-dbi-spi" wasn't available,
but after looking at it, it seems it should work.
I'll test it and let you know if it doesn't.
Thank you

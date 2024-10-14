Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1239199D805
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 22:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4495210E06A;
	Mon, 14 Oct 2024 20:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AcmdeERr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CC810E06A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 20:15:12 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7b111e086e0so374957185a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 13:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728936911; x=1729541711; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dpw2WNuTyCqysTkudvUql0camhRiNDGOcryatLTQ+dk=;
 b=AcmdeERrgejoH2si9gN4de0Skg8/FCRF8LsniD6JgHb2s09/FCpwQnbWCEylgvwOzc
 YHzOWs98dGYLmXyjXtFyPCgloCczaZUH8tADwG6b79uv6OAGNyx1VKXITii+qDH+AZDQ
 8PVvbxiq7r/FmAU0GB6HELl9N7X+2rTGU7EMej5hDhHk/xCHhZ7w3I1h6xibUL98Yucv
 RRH3ALA281ACsJkH6Ft6630tLygZeniAyHV5NfJLqV7j/A501GYOCrOu7UnJ+qQLm92H
 pPyrXW9pEUpmjAZVFjnr47w/EljPkTk4ncx9bmkBEcLbtBvuVo3IkWcJ3s3TRY209oN6
 ByZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728936911; x=1729541711;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dpw2WNuTyCqysTkudvUql0camhRiNDGOcryatLTQ+dk=;
 b=I/73TwWLvy5KHY79xvg0njAkWfRUQ192hUxj/hFqYMsmJU80lYIc+gaWuWNKLHxkk9
 bA77Mc1yCQkZBjlOjibolpSTmmIJvIdmh6g/zxkPK77SRXu0y7Mflxl+yPTjUMb+2t5x
 PwadUjEoFsR729TDflb8+M3uJVD8Ag7iHnTTIgqd0PfxY3nvmtWFTleJDYbH5WeCwsf6
 Fx9lVqJ8ggjCf9WsC/gOPOrnyXlfEixECTi5KMepLetUgVArnC5qUfcs/sPudCMvpg3G
 0Tm4pzGgzNt/X8hJlHZlnZuw4veEmhupj9Mk4VZeN9VbEJTiGny+AmGoOVqjMpxla/4C
 TNyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/brerLxO8EbvSNTP9SiY8n9aPoTfW1CjaduEw0byBSglT66TneBHH/zv+asAULBrrhqFNyCYiK5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjXt75swhxjCunUPWThZzRezX8yAnCCfVsiC898ldDYgDcm9K1
 cvsEiP4MVv30vKS1JEcgGo127aybXjDPDGp5JXO94NJsMUXmebPR
X-Google-Smtp-Source: AGHT+IFcMk5820x03/AY7v0duvIy0JMNHUd1BnYfTeb0HIwZnlUhGZf9L7CFpFzNKinLIdNqMfdDrQ==
X-Received: by 2002:a05:620a:28cc:b0:7a9:a883:e22b with SMTP id
 af79cd13be357-7b11a34b9dcmr2292551885a.7.1728936911258; 
 Mon, 14 Oct 2024 13:15:11 -0700 (PDT)
Received: from VM-Arch ([2600:1001:b148:c0ba:c7c4:edb8:1e9:3521])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b11497a931sm451280085a.110.2024.10.14.13.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 13:15:10 -0700 (PDT)
Date: Mon, 14 Oct 2024 16:15:02 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: u.kleine-koenig@baylibre.com, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Mehdi Djait <mehdi.djait@bootlin.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, 
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v10 0/2] Add driver for Sharp Memory LCD
Message-ID: <sxxpdm66dukbef27nnvnxa5igglepkcer6qtgv2hdfaim2jmqy@5xd3zwu2ta5f>
References: <20241008030341.329241-1-lanzano.alex@gmail.com>
 <hfpq35cxext6vd7shppa4ovtszywzqkc5gqo3t7p77uldasxts@gyfrypofijmd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hfpq35cxext6vd7shppa4ovtszywzqkc5gqo3t7p77uldasxts@gyfrypofijmd>
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

On Mon, Oct 14, 2024 at 10:35:03AM GMT, Dmitry Baryshkov wrote:
> On Mon, Oct 07, 2024 at 11:03:09PM -0400, Alex Lanzano wrote:
> > This patch series add support for the monochrome Sharp Memory LCD
> > panels. This series is based off of the work done by Mehdi Djait.
> > 
> > References:
> > https://lore.kernel.org/dri-devel/71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com/
> > https://www.sharpsde.com/fileadmin/products/Displays/2016_SDE_App_Note_for_Memory_LCD_programming_V1.3.pdf
> > 
> > Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> > Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> > Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> > ---
> > Changes in v10:
> > - Address comments from from Uwe
> >     - Replaced -EINVAL with PTR_ERR
> >     - Error check pwm_apply_might_sleep function
> >     - Remove redundant error message
> 
> Let's wait for an Ack from Uwe's side. If there are no further issues,
> the series seems to be ready.

Looks like I'll need to make one more version to accommodate the new
client setup by Thomas Zimmermann.

https://lore.kernel.org/all/20240924071734.98201-1-tzimmermann@suse.de/

Best regards,
Alex

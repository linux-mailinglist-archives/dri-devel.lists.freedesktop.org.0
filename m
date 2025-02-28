Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688ABA48E8C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 03:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601B310EBD5;
	Fri, 28 Feb 2025 02:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dXjqAb8Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3860310E0CB;
 Fri, 28 Feb 2025 02:25:04 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5deb956aa5eso2415641a12.2; 
 Thu, 27 Feb 2025 18:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740709502; x=1741314302; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HOiFb2uaZTM/Hc5eDFna0HdsQUy4+S1apmiGNsTq08Y=;
 b=dXjqAb8QpbHwRHlakkPuV0YRqkWowkMg9HFLAoU1MwC3LhBgwDAIzMlDVWH1yQmx+S
 HtDvNVyGChX4frRnRBh9N/xL9qFpAsyXrWjqMz64wHD/2AqSVlUXbLXDaQbUIf+J59Vo
 PtNkobe7rw65lFsAg12RRp0fVxm1Etp6ISQ7UcoHDmbcWuVibezQOhzaX9KDrvFCil/v
 mzRbunvlqMm45G0eRCgDFR+DjYXUus9k6lNIgORG5GVlt8kzrgAUyZBCJ/rF6WAbVpnw
 KwAgZ1jDVgYdlY8HxzPjtVInFVMIMT2w194/YFMQipGLOn7yIT2LXsRNksXGhrlAYRaj
 lccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740709502; x=1741314302;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HOiFb2uaZTM/Hc5eDFna0HdsQUy4+S1apmiGNsTq08Y=;
 b=BLUe4g2aOqHlJ7Gw8YDxpfIFQliNjXsp+ayXJD/sXnnbi+faAhftbre26WxUcpopjx
 okiNhP2YYcdrMBg8VAwm7IexJbAvVVZ+DprO1DFXHGEpl3RGhfr1pR5egbkfOqE3p3Av
 WtDlW2gmX9a1stUc9o6Zo7GjYuEoTdbayp1/rC3nSETy37m4p+ZM0ld3bnqf4ZEKu74D
 YPdwLzOS2lFbEENdUyac/URByLTCEZ9qV7ds7APEw9SC37fv8EZG9KxNZKLuf/mpfUUX
 zguiP2n4h2UTJR+4zOES0CamCJ7pWypoGYI5HWxpqvsswIB4Ksqf4zqskd6unqI1Edaq
 dD+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4SHagRnedBAXar/tL9H8LwmuYaGl18PIMvA4zfmwvjwDznSSyr6a/khafvQl8MGoELs72VrFdgKBdJV5spWWu@lists.freedesktop.org,
 AJvYcCWD4ODjQcxxfcCdA2dN5BEESjszvEg7BpVB7lAVjofAlK1W+uwKSp2FVC3bXLLqFhY1ndF9C0HcYg==@lists.freedesktop.org,
 AJvYcCWqTrJUdcUSaIZ521sFmDNfXsnZC4cbYXzrFv/dJKGAM0rTHMlcignitJqZfJgs7vUjT2ozusUtRqc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVkXy1bBvHrqVRJaOJsNnarwqq+PbrB492ZdNEiXjis4C1AAhl
 4JPcFfrjRRGD95a2iVn4+Ph4O1hN/Zf/BcdHWZ8uDE5n05H8/FzSMEg+v8YzIdb8z0UfnRTUDIr
 EgenzpVF7nnzFgP8mFas1ZI/U/mg=
X-Gm-Gg: ASbGncup+Falvr+rItDW97PQSfIzS2UW8DuENOdPHy+0K1K9dSMEma8FndMG+uW/AYY
 hV3lOhsigrzXTa/bG8IiSDlXZ+l8Murfl+MG/fVuBPRrwRXW0JleLps1dQXlhdfUxP8+NjaQ4Vf
 QLV3jc2Q==
X-Google-Smtp-Source: AGHT+IG8P/Rf7Nhp6ubr6y0mJxpSoaHQ23pNLudbTvjrOGOm94lBjX0PH2uiYGY5ebcGSTw2itPEiP8WYWZIYVpcOo8=
X-Received: by 2002:a05:6402:1ecf:b0:5e4:ce6e:388b with SMTP id
 4fb4d7f45d1cf-5e4d6ac54a7mr3056695a12.6.1740709502364; Thu, 27 Feb 2025
 18:25:02 -0800 (PST)
MIME-Version: 1.0
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
 <D81L5PE1SPWC.O56MB6SRS0XK@nvidia.com>
 <CAPM=9tw=8WtR9093EThr0aY6yTYtef9SBgjN5S1xZUXaWN8aWQ@mail.gmail.com>
 <d9c7e8ff4b32f06650b2ad4e3b993d217b286aa9.camel@nvidia.com>
In-Reply-To: <d9c7e8ff4b32f06650b2ad4e3b993d217b286aa9.camel@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 28 Feb 2025 12:24:50 +1000
X-Gm-Features: AQ5f1Jo9MDruhrTr2qymJBq8i--oaJMjPPjA2VFHO726289NAQO1EfWzdBHtnOI
Message-ID: <CAPM=9txa5Uo0qC-5OqNOcrWaGNjJEr8+J+ug0C3e6fMk9t18Zg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
To: Timur Tabi <ttabi@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
 "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>, John Hubbard <jhubbard@nvidia.com>, 
 "gary@garyguo.net" <gary@garyguo.net>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "dakr@kernel.org" <dakr@kernel.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, 
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Ben Skeggs <bskeggs@nvidia.com>
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

On Fri, 28 Feb 2025 at 11:49, Timur Tabi <ttabi@nvidia.com> wrote:
>
> On Fri, 2025-02-28 at 07:37 +1000, Dave Airlie wrote:
> > I've tried to retrofit checking 0xffffffff to drivers a lot, I'd
> > prefer not to. Drivers getting stuck in wait for clear bits for ever.
>
> That's what read_poll_timeout() is for.  I'm surprised Nouveau doesn't use it.

That doesn't handle the PCIE returns 0xffffffff case at all, which is
the thing we most want to handle, it also uses the CPU timer whereas
nouveau's wait infrastructure uses the GPU timer usually (though that
could be changed).

Dave.

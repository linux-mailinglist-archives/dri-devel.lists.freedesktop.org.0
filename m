Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F22B950BC4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B74210E39C;
	Tue, 13 Aug 2024 17:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="QvulzKBP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30B610E39C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:56:00 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e0857a11862so5772624276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723571760; x=1724176560;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0pMTC13umCQde5/8BsElILG59mfNSD3ETOHB+YLFOX0=;
 b=QvulzKBPrArOhhwNpJRo1HnQldGn8HNL7uuRo3LVLEpAVh4zdEfCaMoW8q5VkXgF6h
 7p6Ce4OP8tvOVw4q4K61eGdBHu/hjg4YsfKKC08LWaf/m38YvcjleziCyCemIlMbZnNS
 23EC36sEFCxTlOXUFuT6C3FWcuODnPu2wN3qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723571760; x=1724176560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0pMTC13umCQde5/8BsElILG59mfNSD3ETOHB+YLFOX0=;
 b=pNhe2pApu+T0gColcGzVMu8OU7E2tN8G0BpJw81G21Y2Dur61sR9m4mt/b3OptYuAZ
 RsOmPqsIg6ZavKkghxjgyqFORR8v1+7wYw5KhqjRuj86YwqL03sjAjQ6uPqpQR1HQkCA
 BnKQ4R/pdPavAKFpZd+Ggj3EUe8hefyqkQPmR4ad/b8ALwG/5sPsDbhHx7/fHnL1dTT3
 aq705PKaQjpVQgIgD005LmSEnlh1+2h4WSLoQLWYB67WBoUGqLa9Bj9oXubQQd8cbbij
 BhjtSHR3b1YfufGAyvu4X5YHc7Uj4JjfZXMrRXzxIO7c4VnP6vMv+FaIFMbHAMpRgHHX
 MliA==
X-Gm-Message-State: AOJu0YyWYDND8KUv522/fLeiG8jQdnVQq5+qGwmQf/rJG6t+OW9UuzZP
 H3QdkSSCq7s4w6Nxy3JpSqpQ9QCu2/QXHfdXNctjx4AUY/T8VBFkKD9gVDbIcLJx2RnnGtsumcJ
 LP+JpTJYH8YP6vSUtRjG4YUYS5lC8wdi+vesjdl9KDOrrtlYlcQ==
X-Google-Smtp-Source: AGHT+IFVctapDgQvFIPIC5lpDGBtMq09KW3nfv7r62tQ7bEpP825JQ5/54fY0AsGtMDXVLNDZU3VTLEzdiToTOIsj+k=
X-Received: by 2002:a05:6902:2305:b0:e0b:2fd0:6d34 with SMTP id
 3f1490d57ef6-e1155a46d13mr326697276.6.1723571759712; Tue, 13 Aug 2024
 10:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240801175548.17185-1-zack.rusin@broadcom.com>
 <CAO6MGtg7MJ8fujgkA5vEk5gU9vdxV3pzO9X2jrraqHcAnOJOZA@mail.gmail.com>
 <CABQX2QOeWoVcJJxyQOhgO5XrsLRiUMko+Q6yUMhQbCYHY44LYQ@mail.gmail.com>
In-Reply-To: <CABQX2QOeWoVcJJxyQOhgO5XrsLRiUMko+Q6yUMhQbCYHY44LYQ@mail.gmail.com>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Tue, 13 Aug 2024 12:55:50 -0500
Message-ID: <CAO6MGtjVd4M_93QUuZrLXoSz9_6ZYswiH7ApUTo-mRybs1UJFQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vmwgfx: Prevent unmapping active read buffers
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 martin.krastev@broadcom.com, 
 maaz.mombasawala@broadcom.com, stable@vger.kernel.org
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

In that case move `map_count` above `map` which should move it to a
separate cache line and update the doc strings as needed.

Reviewed-by: Ian Forbes <ian.forbes@broadcom.com>

On Tue, Aug 13, 2024 at 12:40=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> On Tue, Aug 13, 2024 at 1:29=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.c=
om> wrote:
> >
> > Remove `busy_places` now that it's unused. There's also probably a
> > better place to put `map_count` in the struct layout to avoid false
> > sharing with `cpu_writers`. I'd repack the whole struct if we're going
> > to be adding and removing fields.
>
> Those are not related to this change. They'd be two seperate changes.
> One to remove other unused members and third to relayout the struct.
>
> z

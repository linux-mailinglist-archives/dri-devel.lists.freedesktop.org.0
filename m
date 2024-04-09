Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7845389D0C4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 05:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6944B112A85;
	Tue,  9 Apr 2024 03:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LuKd96JV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A9C112A7F;
 Tue,  9 Apr 2024 03:12:17 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a51e368c6dcso103452166b.3; 
 Mon, 08 Apr 2024 20:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712632335; x=1713237135; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HfIc3j5LNpDb58SAiElVvB8ifg5oy/Xtc2rHJbWd48c=;
 b=LuKd96JVbDJ9kN8AO3bNQNW62RFE8/Po/bfi6Ux1fNeJTS/TSprsN7tdFfXgy51/i7
 kpo+AEAJjIzADEilm2aBBAg+ttYSdhn+mGMR2ZCRKOn0dyXC2atY2nfvrN7KmEkQ+isO
 emjg6NEKfc18EQE6ZlDvCAi2WMPkJ0z8OXW4BAVx3xTvLabjwoWWrEyxKbSElW65g0bX
 mywGsu75I/hqAFG20r/J8aOUxGeiDuoxALekQKB7H49nb5+I218uM7SymOokXtk/hUsm
 JFe9DUgFbri+QjW/LIawLyxm7WdiUcw2XvAruprHEjT1CcqVmrDXK0dTumOaATfOZKRu
 dCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712632335; x=1713237135;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HfIc3j5LNpDb58SAiElVvB8ifg5oy/Xtc2rHJbWd48c=;
 b=DWtL1riV0l4ab/0pm6v3xP3KoBwGwjm/GgUaq8MfsSskTrZJnMRDdNuPKnS1q/sOLi
 85CK5q8vHu2Diiwv427W+xeYH01epV8OrLAVfRxoioo1o2q4TsoQv81b6kdLtdVlOOXy
 c4vFH8l3Jd+5socVqLZ+hbTMjAF5yBBhJKtwhf1PurPNCoSCnZRSwvM5OxpU6+YJKf8O
 USkdt6ciAEJaxNbfkJc1pfOI/kuzbUXXj/cF3Go8Zb4qRrlULET0/3z9dBVO/q+Fwo9f
 2ypN2M8+vX7wGHy/CcoxgFocGPo5Toj+eQxsoN7LwwexOmmieSJZB/DhhNzJibi+a3yI
 K59Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZck5RcDpmRKIHi+7+qsU/h3gCVxZAKFMsLcy0dqgfAtpQi4CidTSESmuaLbFtTUUDIpH0OSebmXY062iGyaPZFoq5c6boeUemtzRUlg==
X-Gm-Message-State: AOJu0Yy8Fe7mijRaXxYlS8z31hixqpxgdCwWUUN1b6DnuZPr7Zan1979
 Z6iiLiBKMaq//YNdJV0RB7QIOTGEZbUb06wAsT3h6eFucm3H9QziKuthy4rqX0j/uHKOJoH0U7y
 18JakgLN6AoktZeOeVHlRA3ugLXM=
X-Google-Smtp-Source: AGHT+IH4cKNUlITRUeh3HVMEyRrubMDaM2MkzDKh2Lgrqv7hGyNqSd2/5RCB3H4qXgr1+eGArZaHPg2VpWILE4MUNxI=
X-Received: by 2002:a17:907:96a8:b0:a51:8656:326f with SMTP id
 hd40-20020a17090796a800b00a518656326fmr9180108ejc.74.1712632335225; Mon, 08
 Apr 2024 20:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240408064243.2219527-1-airlied@gmail.com>
 <b7f005a5bc22cff08509ce75f8eee7925047e8ae.camel@nvidia.com>
In-Reply-To: <b7f005a5bc22cff08509ce75f8eee7925047e8ae.camel@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 9 Apr 2024 13:12:02 +1000
Message-ID: <CAPM=9twzNqHeLKXaQL8RtSWD-Z1zvsyrqCgNhsd35cVFB38qFQ@mail.gmail.com>
Subject: Re: [PATCH] nouveau: fix devinit paths to only handle display on GSP.
To: Timur Tabi <ttabi@nvidia.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
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

On Mon, 8 Apr 2024 at 23:05, Timur Tabi <ttabi@nvidia.com> wrote:
>
> On Mon, 2024-04-08 at 16:42 +1000, Dave Airlie wrote:
> > This reverts:
> > nouveau/gsp: don't check devinit disable on GSP.
> > and applies a further fix.
> >
> > It turns out the open gpu driver, checks this register, but only for
> > display.
> >
> > Match that behaviour and only disable displays on turings.
>
> Why only on Turings?

The only is for disabling displays, not for the turings. The ampere
devinit path only handle displays, it never tries to disable other
engines so should be fine.

Dave.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E799542F0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 09:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB2B10E5C3;
	Fri, 16 Aug 2024 07:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=grsecurity.net header.i=@grsecurity.net header.b="g3b76lMY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E2C10E4CB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 17:51:35 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-5d5b986a806so1237551eaf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 10:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grsecurity.net; s=grsec; t=1723744294; x=1724349094;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cHk85tyT4WA9zUGQ8DCybEejXHfLNg19pRozx9IMQK0=;
 b=g3b76lMYCIO3J1TQxdwWpNQbOOc46365kGVmb5WS8HY4MTWVYsKIRrz+/oiO+ihiH5
 C+yoeTQTsLObnh+JA6AeKhJorDWP/3L4UXws3QvC6aE03M5MDyPtbVf7q3BKMzIZ+swb
 ka+uX9PQeYSM084tk0AxxmVtLR+psxvhN/Vja4gbUAZAIhp3qLYYKiM2nNvgv9b/UD58
 Ge45zWIP7fUQYN604xB0RAEhPF5r0L7+Wf6fph9TmkRyeSqXYQppeC0oWTgfCy3VE4za
 O1dQDRL0IqXvpbtJdxLtpdmBtaDPVw6Kcd06JG74ciE7G5Y2wgGYTcxTXhE6w24d4+M6
 MZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723744294; x=1724349094;
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cHk85tyT4WA9zUGQ8DCybEejXHfLNg19pRozx9IMQK0=;
 b=dRxEKFg1kV0kmQ3oh5br2y9R3ZNDnthWox5S/Cz+W07UOCUJ9WSParAYykQGIWeQVs
 E0nqX5gSSrjZrxOA8L3aX7DumP+nkvI/YbXbBOqN4Phq6Rk1Rx+5EeC52sUE/w3jgMCp
 xMgKU+R1gWjLBp8pexl0mMkKUHxRDCQneEDajVVaz9hMxEE+kVwafIxEskZiy0p1RfM1
 ifwjixec9CKWf2CqR+dKFg+fgsDdx8pwxieSIDOjVG193tzSpGowtUgZ5TB8c/MadXX2
 IY/UhL3dCRbL7kO3wpsSXadMnISkJ4xcVJhvoHnyHjaxxHU1K45qeInXQmLPZ9FBuyvV
 aZ1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5foeiZfLq3pV8WwSyYjTeC3ZatdA7Z45OX+dKyT/w8R3nVVHZUhD/s5wUiIkK2YB6Utc6P0MhKTCXNDXajEm7PbRHwwXl40lnxGkgsdWi
X-Gm-Message-State: AOJu0YwCpyrZS5JK+MD7ZgRG/kd6oTCQPsHahoeOEvjIyZSBh0leiQO2
 yc3NbvcJVq6OspZdWwC2w28c3oRoAo00FymsUAdEAk6izQIIo6mxUPpx2o53UjuXTRbVcwgzr6R
 EMx+QNx+Gf1i4EVGo1HwrHWBjcUMKQJVIKiJugA==
X-Google-Smtp-Source: AGHT+IG50L+pt6CMEi8/UvxulV9JQjtG8Tp+1SY2FYA7cK6hMg11Oau24F83MwbxIf/cYbxTOhn+EKgTCyilqSQtlLo=
X-Received: by 2002:a05:6870:9346:b0:261:900:b222 with SMTP id
 586e51a60fabf-26fff648042mr1529797fac.20.1723744294324; Thu, 15 Aug 2024
 10:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <0d0330f3-2ac0-4cd5-8075-7f1cbaf72a8e@heusel.eu>
In-Reply-To: <0d0330f3-2ac0-4cd5-8075-7f1cbaf72a8e@heusel.eu>
From: Brad Spengler <spender@grsecurity.net>
Date: Thu, 15 Aug 2024 13:51:22 -0400
Message-ID: <CAKnqPui5XSBgxPA0Jh9UEv72aVr1uvFqoNeON6RB-YZUj+Fr=g@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] vmwgfx crashes with command buffer error
 after update
To: Christian Heusel <christian@heusel.eu>
Cc: Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Martin Krastev <martin.krastev@broadcom.com>, 
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 dri-devel@lists.freedesktop.org, 
 rdkehn@gmail.com, linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 16 Aug 2024 07:39:16 +0000
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
Reply-To: spender@grsecurity.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

> While we were still debugging the issue Brad (also CC'ed) messaged me
> that they were seeing similar failures in their ESXi based test
> pipelines except for one box that was running on legacy BIOS (so maybe
> that is relevant). They noticed this because they had set panic_on_warn.

Just to clarify, it was actually the inverse: all the legacy
BIOS-booting systems triggered the warning, and the UEFI one did not.

Thanks for the report!

-Brad

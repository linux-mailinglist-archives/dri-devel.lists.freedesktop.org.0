Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B8B1F47F0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 22:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CFA89CC4;
	Tue,  9 Jun 2020 20:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2386589E15
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 20:17:59 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 9so17073931ljv.5
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 13:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mggLRhO6jV+80x85AIwbQKfAsdh+EvbfaEBrzUoF754=;
 b=A0He62nniIxI+L1AbHk3rE/VXClOAjqfDgCzp1WHM1n/EZXSsg9v78RosIK0D61xsS
 ZYKlq1DqgEfEXDdlhkm59HdRiBFK6LdyoaGLJvX9CdbMTkENFvrZ7hC74dcsHPxaSRDH
 /KSfFGClu/jrFSfutcREkx7xys3KkhNId+5LCdiAdqBUyrW71bytWH0r5JN+dmfs0ux6
 pyo/GMthib2jqyTuXnMikf9NdHJcoq+B1icAgmZ6/bei6J/10Zlmn+CWRCoHfYWoFmKg
 fHLSt7oRnFJxPymARXiRwnAWOzKoM2Id2uJ9/8mCEZ7a32GxF6lHDAnB5w/zrpdam/b8
 T+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mggLRhO6jV+80x85AIwbQKfAsdh+EvbfaEBrzUoF754=;
 b=YzeF7rAuOOnmnxNC+Hg4BVawd6GVG8i0JIUk0N5QakKpeBAX/KXRltHHvxd5tDtBoz
 U+t7GgruuSvrVdNpttIhQOV6qUaMLkriIcnkS/FTH1MNdFxnw4TGmPEV8Oo+qrMzybNI
 zF8bB9EYw6YSKIEG6TORZyS9hzlC8BULi4VzTPH4iscV8AgyMm7VaPoOe4L/SOHsHb7r
 PgbWhrdISgzdzq/XftC/H83S8xM1Ak/nG0s94EI0guv7IuuLjUrrEEORsojxtLIBNaCj
 eVqTv0aNbgoHeNBBiHi9z/pWJtjUwjSFUp440XMatrjw1TzrFSZqjMWBb7pX+5V1cp78
 A6nA==
X-Gm-Message-State: AOAM530cT+duuCUjIT7TfvtolT7uGE3zncr58Xa4pOL5a8cZFmfpXEXv
 XyaH59n+ddMon/U5H8SploPJlILXOsdhpW+SRV3pHw==
X-Google-Smtp-Source: ABdhPJx2JZxpBTnplr7BzxaE0lgmN1ukFVtWGan+ErNICCKV3KzvNkJgmWsN0z+/QfxCYPIeA2p/0hov9iJAP1U2vnw=
X-Received: by 2002:a2e:974a:: with SMTP id f10mr1695ljj.283.1591733877567;
 Tue, 09 Jun 2020 13:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200609200446.153209-1-linus.walleij@linaro.org>
 <20200609200446.153209-4-linus.walleij@linaro.org>
 <CADaigPX_9mBqr3hKA0-aC-TOY3hEnXnQremMiPopw8DUcGCzgQ@mail.gmail.com>
In-Reply-To: <CADaigPX_9mBqr3hKA0-aC-TOY3hEnXnQremMiPopw8DUcGCzgQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Jun 2020 22:17:46 +0200
Message-ID: <CACRpkdbY=ALou98n6uW8C5Wwup1-qyaNZhqTSwC8B5FydjbgQA@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: pl111: Update documentation
To: Eric Anholt <eric@anholt.net>
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
Cc: Russell King <linux@armlinux.org.uk>,
 DRI Development <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 9, 2020 at 10:11 PM Eric Anholt <eric@anholt.net> wrote:

> FWIW, series is Reviewed-by: Eric Anholt <eric@anholt.net>

Thanks Eric, do I remember correct that you were using this
driver for something like a clock display? Are you still using it
for that?

Nowadays the biggest user is arguably the ARM FVP emulator
which is running a full Android stack using this driver.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

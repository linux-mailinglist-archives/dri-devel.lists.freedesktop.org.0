Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2342BBA4193
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 16:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C65B10E318;
	Fri, 26 Sep 2025 14:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RBDK3pED";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4585010E318
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 14:19:53 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b30ead58e0cso398744866b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758896392; x=1759501192; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=86iRJ8e36ImxQCzEA56CnuV+ng/ksGsCGujBj+l8tTU=;
 b=RBDK3pEDWK9Vf8nv8xHHNYAG5BG9n0wjxCUpbhTZ49rZMQxVKcLQb0CGupZHsaE6t8
 IpgLJwX6YEgQ3JwWTh/BL6nn1CZlnLh1timZOvUhPa+dF3yyZtaYNcvVfj2/LhlpV0ho
 ucgyOWFpKnfwX3C8NWbS9fh7mx+p3NNLblEGHBeTrhuDgACY/4C+EqCdIM+uOMqF/Np8
 wl0/Bk97WDygtflCAHHEOf04pPsYtQOhVrNT6sAi0C883pKWmXHSifpKTE7+2XJIQA2q
 syeF0Eh7EraFsfuh/HuFUJBIQ1LsOZhGLm9ovK7YVjfGFcZCrtZgcMJBnHt/eEBvXrPz
 TePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758896392; x=1759501192;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=86iRJ8e36ImxQCzEA56CnuV+ng/ksGsCGujBj+l8tTU=;
 b=e3A/XIWUywK2SR1xii57NtmRC7iLz6cgHukSmDep4JJ84ikaE5klhi9lEdYZZv6AL5
 lXDVAtoI/0EWa86kTrD9xIG6No1hXsPU9Ihev82PtTCmgG53MItJrAAbQx76VJOlDSqL
 7iHb980iM7jRgwb3OAmOyoSTqfl2+vUFpeDrkJD+wJfnl+alyS1FtSM/18uuahpAULE4
 oH3ItevyS9707TwT3zSSgjcCC6rjVwo9AWxuPCmxQwbxVSjU5tYhG6GBGTmCikr/Pnrj
 w/OAeSMi0zt0UJ1SMgkzdZHnjLn38E/Rh7ZOUGsuWLOtDj8a0SiLM2jZwO9H+gGgpTRr
 697w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2fES3C6SlxxwT3bvdwxnao/OpbDdegM19h1F9F+ZDZU3Ib3kXKUAWB37RJWFlRyzLbinG/hRGNbo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDDOBmQ7nEbiaoxVXaAOhg+5JSRcBr6NDvsavqBsriFtcJpp9C
 /wDpB9KJVSNGwS9g8Ov9knnOLGETomPEjXeTspe5DbOwVYclJY6qnH6o23KIzcYaOyhAnUiHbzO
 jTxYO+feHW0BKEKRvugJFBkOUBk3+mxE=
X-Gm-Gg: ASbGncshGY4JriSzy5UC7D6PAeagzXFR0R5fIWQX7Pzd5HlS/loLJ1+TjkojRW+Di6B
 0nZpmkrHlvsAMnFrKfBQk2lpalTpE2IeSgtfkqWnc4/GQ8PiRnqiFwyn7DeFOdYoRC4LzVvF+13
 9RxU345WpKq60BhkMK3Aq+vRhi4SC8lHf2X1aqnWeK4mD5V4dsLLqMRwvl+yVzAoxzoFxDbc/XI
 qoAEaoQ5T4v9F/CsPmpIkidnYRQ48leF8VZmJha9g==
X-Google-Smtp-Source: AGHT+IH1vdKi/qJcvuqmDt6cu2R6nTCg/7+gcpxAQLZ6zVKR0F/UbglOKmyQorlZMm7UHskrImByEbJ1RIAZvMsjzdY=
X-Received: by 2002:a17:906:f816:b0:b39:7302:52e6 with SMTP id
 a640c23a62f3a-b397302534bmr88256966b.48.1758896391514; Fri, 26 Sep 2025
 07:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
 <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
 <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
 <58a6e042-1890-4d1c-88cc-29f500b0a407@mailbox.org>
 <1b09ec41-0f82-49c2-9adf-66f4fd537b9f@amd.com>
In-Reply-To: <1b09ec41-0f82-49c2-9adf-66f4fd537b9f@amd.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Fri, 26 Sep 2025 16:19:39 +0200
X-Gm-Features: AS18NWCGiftXNaB6rd-EiZltA5kTEJUDsUrqVF2MTF-ntMh6t5SJtZlBWIXp4mo
Message-ID: <CAFZQkGx-OFbfFyV3-bB4ufOMSMtSAXd=E4Vkgg5sQjEe=wbRWw@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
To: Leo Li <sunpeng.li@amd.com>
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 Derek Foreman <derek.foreman@collabora.com>,
 Chuanyu Tseng <Chuanyu.Tseng@amd.com>, 
 harry.wentland@amd.com, Mario.Limonciello@amd.com, victoria@system76.com, 
 seanpaul@google.com, dri-devel@lists.freedesktop.org
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

> 2) Kernel does LFC/ramping

I don't think that would be a good idea. The kernel doing ramping
would mean the user can't (easily) configure it, and it would
complicate the compositor doing ramping with a different strategy
(like reducing the allowed change at lower refresh rates).

Min and max refresh rate / duration is enough for compositors to
implement the features we need, let's not make it more complicated
than necessary please.

> It's possible that compositor set the value which is not acceptable to sink vrr range. It would be better to clamp the false value.
From time to time a user asks about how to override the EDID-provided
VRR range, without having to resort to manually patching an EDID and
overriding it. I think it would be best if the kernel just applies the
value the compositor sets, so that we can allow the user to configure
the minimum refresh rate without having to jump through so many hoops.

If a compositor wants to make sure it adheres to the limits, it can
clamp the value itself very easily.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB698289AB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 17:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA7F10E473;
	Tue,  9 Jan 2024 16:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64E310E482
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 16:06:44 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id B885233F0DC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 16:06:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1704816402; bh=ru1F+gvXQPdLCGtyOWXmFNvrh3kslmu4/qMSucCsEK0=;
 h=From:Date:Subject:To:Cc:From;
 b=Ncb4JLtM4u/Szhi53FVMYygCdkF2ITnMwBKnPwKCU6ZnkRM/E1+N/Vuq8upXGCSIV
 BjfDz0tz1Eeu+r8i4e5+ffgsjCvFsHu745TRRDsk3k4TNybuYBCsioReXJHo2YNY8/
 BWuBqeWTjycNu4Iaf2WxxVXN6P7OkQrw1gP+hJYYLM85mMYgxXppnbtR0KfCOoiTLC
 cPMN6s0XjxY0Kt+Fa0vnkxFeViIH7F5vqPEHhfpVu0cSyw7t6ex0CyKPpH6KhglLhh
 BcwsXP8UQ7OcXhiWUHJ50vXJCbIpZ/OKUKn/+ExxUbWapVqrfRTFkB0160VoL4Cwe6
 244BuCyA90sLA==
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-55590da560dso3741224a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 08:06:42 -0800 (PST)
X-Gm-Message-State: AOJu0YwDLmbLkvtjsCU97qlrXT4vlGuqy6LCxN9rC24r5Ua+50+NZRtK
 mzEAq9RqPvbz2ML+mwrpsfbIRAXfQKAWzoFo0Tw=
X-Google-Smtp-Source: AGHT+IH2HXYZoc2m6630S7Vvof1B8is+dzbELOZwqKi61KVDh5DkQ+Tf+EgT+7tN2MqbHWWXQG0aoEdPA5kkZs8FqhQ=
X-Received: by 2002:a17:906:7007:b0:a28:4bf8:a16f with SMTP id
 n7-20020a170906700700b00a284bf8a16fmr565486ejj.136.1704816402282; Tue, 09 Jan
 2024 08:06:42 -0800 (PST)
MIME-Version: 1.0
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Tue, 9 Jan 2024 17:06:31 +0100
X-Gmail-Original-Message-ID: <CAFZQkGxgdeXb82kEsVuC72kGos385YX=GD4QNKfAsM9TyTqoAw@mail.gmail.com>
Message-ID: <CAFZQkGxgdeXb82kEsVuC72kGos385YX=GD4QNKfAsM9TyTqoAw@mail.gmail.com>
Subject: Re: BUG / design challenge: vmwgfx + PRIME handle free == clobbering
 errno
To: zack.rusin@broadcom.com
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
Cc: linux-graphics-maintainer@vmware.com, stefan.hoffmeister@econos.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

KWin does use DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT. Tying the check to
DRM_CLIENT_CAP_ATOMIC instead would IMO make more sense though (even if it's
still weird) and would work with older versions of KWin and other compositors.

Greetings,
Xaver Hugl

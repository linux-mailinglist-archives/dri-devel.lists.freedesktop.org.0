Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4918A5A66E4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 17:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2FD10E0B4;
	Tue, 30 Aug 2022 15:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 8760 seconds by postgrey-1.36 at gabe;
 Tue, 30 Aug 2022 15:06:39 UTC
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8869510E021;
 Tue, 30 Aug 2022 15:06:39 +0000 (UTC)
Date: Tue, 30 Aug 2022 15:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661871997; x=1662131197;
 bh=8AQwiCIAenxRlj/c3Rixyd96I6Y4TGavbp9UzpD9XLI=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=hvBm3SPwGI0P5kB0PPAb/C3Y8UrLvIFIJPIgFRcO9SY6pITpy+tLY8sNRVLWPOFEf
 m9cctZK9csGqkRHDqqts5FgQ3puHRerKhK+OXA9OsRi59NoHwHWWhT6jNP/D7FqTAo
 PfEFksAvyQCzgq4CZRjCWuvS3fHP4W0cbyRwAw7F3AglLgN7WN/MfFbcdqVsoeemvS
 2zpq1Fh1EXMlBm0WH/3x2H98KZzkM8sQv65mEwz7oirU9UphTLw2Qd35DhwjVMhpbJ
 J8C4uB0sjuOfItI9TDFBGApAjHuNvZlWl2Gh/pfzGXocynz9abVcCll1AyjF5de6H+
 8DIj+y00kPDlg==
To: Alex Deucher <alexdeucher@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 4/4] amd/display: indicate support for atomic async
 page-flips on DCN
Message-ID: <UO8QRzj4r7_jNUlgRiyj3jyY90LwVlaZgnWUxE608qOZYwMfKO-tZ0SPqPCfZikGvmRB0N9wFZfwg3VwNoYboTFupsiGvRzcPQmPWQlnJ5U=@emersion.fr>
In-Reply-To: <CADnq5_NEL6sUm_9qretTzQ=yH84byfjo3fXPForGGXMGediYhQ@mail.gmail.com>
References: <20220824150834.427572-1-contact@emersion.fr>
 <20220824150834.427572-5-contact@emersion.fr>
 <CADnq5_MX0Qh7v-Wy1nBhMEWT9bhmQn4W-2Wo97CZgKcby1Xc+w@mail.gmail.com>
 <A_ZL55UlxqGGQnHrxTxvFZMCn1HkWbIuaZvtrOnir7mO6YCY8hhyYwjwKjv79SEEBLqbosVtxx0rVeCTso1RktRjY3ECNyLssw77of_D2sM=@emersion.fr>
 <CADnq5_NMHWGOdW5Gfr4wK6o5j7PnYKW57Gg6UbbUJfnONdHY1w@mail.gmail.com>
 <2uZ8U_CJxQ9zlnv1lIRhMtwKYU-uuOuhzef2hbvONDPGN-t9Pm4fSejJNLm3ThkJIj1ZkDZwizu49Xactvx-ykn-0Rc23CzsBUXe3Xg_-XI=@emersion.fr>
 <CADnq5_PX_d0hsoTSLsyZpEHg9hu33x8LhyLOGFMZRo0WWdKPvw@mail.gmail.com>
 <2ceFF1QUjpWpVaQxW7MgRgDlU-Ff3UPBZLRET1On9G_S5IxK-i4Ye2zGgx5KeEJVXwMCyaG2TIBG7RW4L5lciqbQhE-uitglBBgqTwhKCck=@emersion.fr>
 <CADnq5_NEL6sUm_9qretTzQ=yH84byfjo3fXPForGGXMGediYhQ@mail.gmail.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, hwentlan@amd.com,
 nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, August 30th, 2022 at 16:42, Alex Deucher <alexdeucher@gmail.com=
> wrote:

> > Hm, can you elaborate on the difference between "immediate flip" (as in
> > UNP_FLIP_CONTROL) and GRPH_SURFACE_UPDATE_H_RETRACE_EN? What are their
> > relationship with KMS's concept of "async flips"?
>=20
> The display surface registers are double buffered. The default is for
> the swap to take place during vblank. However, you can select
> different behavior via the GRPH_FLIP_CONTROL register. On DCE10 and
> older you can set GRPH_SURFACE_UPDATE_H_RETRACE_EN to select swapping
> at hsync. On DCE11 and newer, you can set
> GRPH_SURFACE_UPDATE_IMMEDIATE_EN which causes the swap to immediately
> (IIRC as soon as GRPH_PRIMARY_SURFACE_ADDRESS is written).
>=20
> > Also you said earlier:
> >=20
> > > We don't use hsync flips at all, even in non-atomic, as far as I reca=
ll.
> >=20
> > Is "hsync flip" controlled by GRPH_SURFACE_UPDATE_H_RETRACE_EN, or is i=
t
> > something else entirely?
>=20
> Yes, GRPH_SURFACE_UPDATE_H_RETRACE_EN. We use hsync swaps on older
> DCE parts that don't support immediate swaps.

Ah, that makes a lot of sense. Thanks for the explanation!

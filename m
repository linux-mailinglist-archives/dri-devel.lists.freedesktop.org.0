Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAD0CA3DF5
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 14:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DAB10E1D5;
	Thu,  4 Dec 2025 13:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="B+u8oFNS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com
 [136.143.184.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6874110E991
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 13:44:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764855887; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=No8Yo/YF/MefIEb5+dCdstkPtvw11xYDade2aITUtRonZcCqwzGTjgAfuUmII7QDEDbDO0rEl8Tb9tBzKcAnPqbskOynJV2qZkf6my+sNTntJZkYinGS1JSlx1igsVpo8S7hiZy51wiefaZpUmOHEEKqOTHbm6c/8mDUMW9SVNE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764855887;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=dgbf4oei5e6zNucy9HZA69AR3kbgaVaRTDW5N31hsbw=; 
 b=eJcW2vr58l2aKtHO7yAJ+Cgcvz7P/09KaNvkvEbaZ1cziwBOCJxjlOwHQiQy38NSM30i2uSgrve7gwYWt1fT+DUTW19eTlPEdQ0Yj4aSxpHrS1ebULTchTvdbdgHBuyo2wv2iWUU6YrRpwtvDeLY6hh2hTr6GqmSZl3KC0yn6CU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764855887; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=dgbf4oei5e6zNucy9HZA69AR3kbgaVaRTDW5N31hsbw=;
 b=B+u8oFNSX3GQyya9y6FSAJDxKJLMtckkrK2CnTjkUR+8MIMPnhZ1RwRl+JE4ciu1
 dlec8jazokaPfTzpteW0oYm6Hx61oxivjkMhdx8THk3Dut21PPPhjwPG4h8hdTK8Yb3
 PqIMs8mX+eMgjCVNaOkhcGvxH0KWhAclcWoKu/z0=
Received: by mx.zohomail.com with SMTPS id 1764855884888271.7652011467817;
 Thu, 4 Dec 2025 05:44:44 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: Guidance Request: Starting Contributions in GPU Drivers & Hybrid
 Graphics Support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAKFHAhauFF7JMUQ34v2_XFcd33vaYJy4hiMQEcynUsya5yz1nQ@mail.gmail.com>
Date: Thu, 4 Dec 2025 07:44:34 -0600
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <660E9D4F-1CD9-4DB8-BBAF-5BA54A32E9F4@collabora.com>
References: <CAKFHAhauFF7JMUQ34v2_XFcd33vaYJy4hiMQEcynUsya5yz1nQ@mail.gmail.com>
To: Zakaria talukdar <zakariatalukdar123@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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

Hi Zakaria,

> On 3 Dec 2025, at 10:10, Zakaria talukdar =
<zakariatalukdar123@gmail.com> wrote:
>=20
> Hi everyone,
> My name is A. R. Zakaria Talukdar. I=E2=80=99m a Computer Science and =
Engineering student pursuing B.Tech and aspiring kernel systems =
developer with some of the interests in Linux GPU architecture, driver =
stacks, and hardware enhancement. I=E2=80=99ve been studying kernel =
modules, DRM internals, device probing, and PCI subsystem interactions, =
and I would like to begin contributing in a structured way.
> My interest is (for the moment) improving the open-source GPU driver =
ecosystem=E2=80=94particularly around hybrid graphics (e.g., AMD CPU + =
NVIDIA GPU switching issues), GPU management, and understanding the =
modern DRM infrastructure. This is born from my own frustration =
regarding my devices and within a span of 1 year I lost 2 laptops due to =
this issue. As I'm keen on working with linux so I feel responsible that =
I should fix that and atleast help other people like me or even large =
industries and organizations to feel at home with this beloved system.
> Before diving in blindly, I would appreciate direction on:
>     =E2=80=A2 Where a newcomer should start within the DRM subsystem?

IMHO, your best bet is asking some driver maintainers if they need help.
Perhaps contact the folks from vkms, vgem, etc?

>     =E2=80=A2 Which documentation, beginner-friendly tasks, or open =
issues would best build prerequisite knowledge?
>     =E2=80=A2 Whether improvements around hybrid graphics (ACPI, =
PRIME, power management, muxless switching) are currently being designed =
or need help?
>     =E2=80=A2 Who the appropriate maintainers are for discussing =
hybrid GPU switching architecture?
> Any guidance or pointers would be extremely helpful. I want to make =
meaningful contributions and avoid redundant or misaligned work.
> Thank you,
> Zakaria
>=20


=E2=80=94 Daniel=

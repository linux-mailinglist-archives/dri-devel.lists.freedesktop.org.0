Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1003D19B675
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 21:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B586E995;
	Wed,  1 Apr 2020 19:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E5E6E995;
 Wed,  1 Apr 2020 19:39:14 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id f14so688671ybr.13;
 Wed, 01 Apr 2020 12:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ugubVclWLMihBDOBuKosV9QrlNJFj/wToi4e9mKRktA=;
 b=UN0aU6GtB5OSrETlhT5IL0DnR9LrvCRNuMzZoyZ0iQA0M9/CtaBYBoRRcdsECH+pqX
 XNZC/ETexeAL6VoTHRooKkXMtthaoOhjzbrcMYvWtN6XNsf9fk9Y/MxGAhfC6oPQ9x4/
 nP1NvBq8zlaytH6bYjtVDfM06W6Z/TL1g+82wn8H7BZ4n91cUAK7hXQUMZUe4GN+K+OZ
 V0Q7NSWJIEPi/eI9bEnwCgyxb+wxEc0ibL1kOOEQ1Y/+qSi7riNlEDtRo3yWu1zkMAHl
 5ZL4TKCrgK13xqeaqVK22SnsH4LDKy7NHd7OkkNAOGBs7w5aWWMi1hzfKmFjLRl3VsxR
 agLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ugubVclWLMihBDOBuKosV9QrlNJFj/wToi4e9mKRktA=;
 b=cXK4+o+tRxXppscWlvro/jDCYg0F0bGtryLtAC6TqGd7qqvtArWrspv08zKft2doAd
 IZNaMP+0ABKKVWA6aIgrvsSRJzgdaod1IvWp4vjmFmjw2kVc0UuaQ9A6QmtxnAX9R+g7
 toUbYVbAQLSI2DDER62Wwenab9uttDosrtllYGzOMfzBOhyxhPccvmuFkdPs4qMVK2T+
 qOC53clkFmZpy0oPVmYSP8mGU6ZG2PnNMALGHoHeK+ApbDO9yYuUYJBPCUUNKtV/qXPv
 ae4T4/wSY4aUNPTRIFK2n3PJjPHzXQwd9arSUx+DRsFIfqxbwlwT4qgKO1hSmqAEANvy
 yNfA==
X-Gm-Message-State: ANhLgQ1P1w/O1dTDPvCB9AL3o25PifqosMp9cgCrPIFd0Wzevi9hKE72
 5q82rSqLHqcVvyBEtZ4KsLF8hVCkn2CFccBNYljBig==
X-Google-Smtp-Source: ADFU+vucFWy8eMf1CjBj81Sbn/DkwYPjl78A95Pic9ljJF61It1bzzw3rntw9sU5qpCUUa7iOT55v5x+4py+ptWyWJc=
X-Received: by 2002:a5b:bd2:: with SMTP id c18mr37335051ybr.302.1585769953492; 
 Wed, 01 Apr 2020 12:39:13 -0700 (PDT)
MIME-Version: 1.0
From: Matt Hoosier <matt.hoosier@gmail.com>
Date: Wed, 1 Apr 2020 14:38:37 -0500
Message-ID: <CAJgxT3-11eZqvysgCQMCYtKEUVsNWWHd+7au91uNC7SWK1Fyug@mail.gmail.com>
Subject: Aliases for DRI connectors?
To: dri-devel@lists.freedesktop.org, 
 wayland mailing list <wayland-devel@lists.freedesktop.org>
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
Content-Type: multipart/mixed; boundary="===============0126433462=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0126433462==
Content-Type: multipart/alternative; boundary="000000000000c6066405a23fd691"

--000000000000c6066405a23fd691
Content-Type: text/plain; charset="UTF-8"

I'm searching for some sort of scheme that will let my DRI master query the
set of available connectors and select the one carrying a prearranged
designation. The problem I'm trying to solve is to allow deploying one
standardized userspace component across a fleet of devices that have
varying numbers of displays, with the use cases not always driven on the
same connector topologically.

I had a look around the properties available on my system's DRI connectors,
and nothing immediate jumped out at me. Is there a standard connector
property that (assuming I can find the right place in DeviceTree or similar
to) that would be a good fit for this?

-Matt

--000000000000c6066405a23fd691
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m searching for some sort of scheme that will let my=
 DRI master query the set of available connectors=C2=A0and select the one c=
arrying a prearranged designation. The problem I&#39;m trying to solve is t=
o allow deploying one standardized userspace component across a fleet of de=
vices that have varying numbers of displays, with the use cases not always =
driven on the same connector topologically.<div><br></div><div>I had a look=
 around the properties available=C2=A0on my system&#39;s DRI connectors, an=
d nothing immediate jumped out at me. Is there a standard connector propert=
y that (assuming I can find the right place in DeviceTree or similar to) th=
at would be a good fit for this?</div><div><br></div><div>-Matt</div></div>

--000000000000c6066405a23fd691--

--===============0126433462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0126433462==--

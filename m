Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B566D8703D2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 15:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93501121E6;
	Mon,  4 Mar 2024 14:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="CcsYx+xk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC501121E6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 14:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1709561757; x=1709820957;
 bh=xPUAuEydrJ7/9J6VQyNc22EhEn5rjlfS1t2075HRKFE=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=CcsYx+xklvZSt4UziT/XgiSNYF5VxjTgWmpcLMIczgzk95GcAfhHYQF1FtPrZvHWf
 H76gVcNeEMCAg23j0EO2cASde4YY7qnA4hus4EcEokC2Mkdg+0dro+6Vgz4gvEUTnN
 KqFZj9++9+o6c0qP/HmbZFMYRW+qaSNS9N3/ypfbX5ymxrGRzeSYyU1VLTJQqZH+41
 QNfTiqZ1Z7x81V0zKhIusasZ0VToGmcY1kvbfUUVfDFA+k0F7oNFnbztKLIbAgN2Dg
 bHTaA+Pgxlqjnu1PvC4ZNvKIFa/5AV/b2wCkAeBZxk8OJ//VYxCgrA15FJdWJkX+mU
 dU2yuzMsmMLtw==
Date: Mon, 04 Mar 2024 14:15:47 +0000
To: "Garg, Nemesa" <nemesa.garg@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "G M,
 Adarsh" <adarsh.g.m@intel.com>
Subject: RE: [RFC 0/5]  Introduce drm sharpening property
Message-ID: <uL84QKNtst1cp9uG3HqNAqEpJS2pT07qxwufONZx8Zq3t665BwY15fHRm3cZxMtiecQlPlNTs9srrmlIzRKmRYItWUv6cQbDEkms8eUT84Y=@emersion.fr>
In-Reply-To: <IA1PR11MB6467F801FFB564769E357EA9E3232@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20240214112457.3734871-1-nemesa.garg@intel.com>
 <8Ma-GlU3bFAuSPpFhGbYYuXQ8OeeDjMK9WiWO6KP-4pPO41fLnLrgABkRfhjHY6XlIh5u67vcEbD8ejDq7-zo5BXf-too0Pt7oTDhWCOPlU=@emersion.fr>
 <IA1PR11MB6467A91412978DE0FFCAB50FE34C2@IA1PR11MB6467.namprd11.prod.outlook.com>
 <20240216103620.33deabb1@eldfell>
 <IA1PR11MB6467F801FFB564769E357EA9E3232@IA1PR11MB6467.namprd11.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, March 4th, 2024 at 15:04, Garg, Nemesa <nemesa.garg@intel.com> w=
rote:

> This is generic as sharpness effect is applied post blending. Depending
> on the color gamut, pixel format and other inputs the image gets
> blended and once we get blended output it can be sharpened based on
> strength value provided by the user.

It would really help if you could provide the exact mathematical formula
applied by this KMS property.

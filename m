Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79486A58EDE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 10:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE9210E092;
	Mon, 10 Mar 2025 09:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="OHUvfT+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2391110E092
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 09:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1741597430; x=1742202230; i=deller@gmx.de;
 bh=Czvxju356HZYENQ2J0gEnKBzcp6Ln4JBJC3bEl8uWKQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=OHUvfT+F9MQ/ZVc+8lhIcKDCM8s54HfLQaJYotjpEuwyqVzW6JNJMDQFG4izBs9F
 tgwm+LvwEwjQcebkkLoyZGXQ4NbH7LG4fWbY2ric1dFMmW4lyn/ywdLm6xr5vzUL0
 a0luBRFM3+CVPGhVziW7dq1QvPNDbo3x46hekApDN/rpdoJzyb2PGP8H/Ec1C+G2f
 oxrELgUo+MBlJMZmWhd/JfaDNiyoBXEVly6xhyze0ehdUwysbYYTBnzqEuwaS889q
 e7a47AjVnZS9n/EMFo8ctD8fHM+uXROw7dF59JkH33VEvFkmZTreybkFk4fXUp9yD
 Vm329t15wF3KjeH2uw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3KPg-1t8uXc0VUY-00y24l; Mon, 10
 Mar 2025 10:03:50 +0100
Message-ID: <2f3f0c95-232f-4d87-8e40-cc76f00ab8d6@gmx.de>
Date: Mon, 10 Mar 2025 10:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Remove fb_draw.h includes
To: Zsolt Kajtar <soci@c64.rulez.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250310065745.17623-1-soci@c64.rulez.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250310065745.17623-1-soci@c64.rulez.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5nVRnc9/cCw7HPL/VmKO+Q9tLVGXHJbnBKY0YZYyvrVgmFyiS2O
 THsCpAL2TgKvHev2Yhh2J3smojf5b+59pr5UzcfMMYXqKAnDVvSU1wE1KvL5RwLy4D6Jw6A
 n76mOufP2dbYm95AMF0RjB/Klj92ccH7j3GSDri/lMPfWkfagidTugp+tuDoyGEh7vHNMLE
 bT7vuqthi18A5pQN03aQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TTy0/QMs+IQ=;baXGKCDVdNea+DtVjaUjspnLtMj
 3ox/2kfL5XVHIXLvY7T9DkeBv3nzWA+WC63WepD7gLQa6Yj1xvVXNF/N2DmM9Ah2ezFq5e65/
 5j1ueznQw6D6iTtgVxh2VFr9n/VL7zP4gdAdtdP5xUfgPnCTXIB9QjW5FRUMOGPFRtqydJTQa
 YH8L2I3eMUMm2pFu/azpqOFCgq9bAdNqKnJMWzPzScVcWsaAOcG74AgKUoa+AQxXZ1r2wDgNK
 7Fd73ndIUQrx0JwdpfoYkC00H5FnddSeDxV2fp6r01kPo3Fkj3YMEgAjEvWMSzrvY6ZxeBirj
 e7tBd2KmTNIiCmT7IHjMn125zIB5ArIrFYU2wCVf1tcdiE12Hw5fhkbDIzb3RcjLrYofbLUiN
 gv7cnhx5yZyO6bWV4Hg6S1oOcVVPQ463jgKqah8T/GsCmU9mG8MCfdxU8+oTd2DJAxoSnYMM/
 vvuZLmVaQg7ihYpiBrKvDuFPeTO9MIECbb+0aU3ILSpUc9jHf2SyidfMdm5BPvGviRMRXxRdx
 7FPKEDatWzE4Fp1jfk5S4L/NG7maT5b8bxCYN72v6KvWeIULXg3v0YN2wiCv4bj9RILBxAMAa
 CiuR9sE42MBdothklq4JK8SimdB8WJFlOr8msnATECy9ZiR5x3Bm1h62rFvKgE9+0aiq34NpO
 +xgnetucNC85crthe/7WRRGfUQjg30aGXKmJdIprARZm85ogiDcplMPWf+U3xejW9TbqD6RtO
 CGK9hGojVGsfSXEJlE1jukJwgY/YPfu8V5H7P96CQVR70joLT/rqrZMtf6O8kpWGF9bqQzSvm
 xg1fvZq3SslU0/cDrkfNwZpGv1TKYFCR7/QbFcc4+O1kvZxYFn31N3YvAtuLOcOpslFHPJ9f9
 WzzGOM+WJoxi2sqAAZ58fW+epVwIe7ywsfigi9+4al9j/CeQJg/PlWREEspvjchW6XOTit7oM
 DvkjmMFuSeEsv3r7sAcnGRlC57D4gh4nDBdwSWrcLoBBrOTQUVv0Qfr/khT+U7qWUvdWHivii
 9gGxSpgQi81mngPM4THCiNQ4coIb1QQPJAKK33Jxmy0Ayc9MIgSf3KEQxG/PX0dAS0YgsiGqe
 YboI4pgq3aF796E5vgjDihwaphl6B6kRsGzkaz79cdH7f2eTtHBGZgfNroSsk977xAMMayLSE
 tCiBexdCQlFk+L40/KCR363YA+SVi96Cj89wJaooO/z6pzuztdRni1ZRNvhBgpauXRygvI5EC
 GmODBVIdyx0+l4LRaDu53YeGVkon3zf3U0ICCCg1z6uYvx1h4fdbeuk4d6azR/vz2ZdrO23PN
 MDSJ7eLPlyJjTL8xruEpNu+++zm6w66S7Tp1wJOzi87dfo3oBHw1ZHd3sAwqRXG2U4npFrqXS
 s5kM7PMv+I1nYb4lA1DkZ4kGg2vleUgWfB3+fkb7zYOYux4c7AlREo95F4
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

On 3/10/25 07:57, Zsolt Kajtar wrote:
> This is related to the fbcon packed pixel drawing refactoring. There I
> missed that fb_draw.h was included from two unexpected places. That
> shouldn't be like that. This patch removes the dependency.
>
> Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>

splitted up into 2 patches and applied.

Helge

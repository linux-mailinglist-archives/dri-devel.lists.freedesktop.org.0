Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242D85351B2
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 17:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F0D10E341;
	Thu, 26 May 2022 15:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97CE10E341
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 15:53:22 +0000 (UTC)
Date: Thu, 26 May 2022 15:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1653580400; x=1653839600;
 bh=TyGsmX8YAAKi0XZl1MsEOZE6uNAvrQqM8w/+Ir76Ojw=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=ExOxrdXC0H2+XlP5D+5ag+f3AzN5jCirRJdqbi0i33kz5eHyaZfLEDo6iAjtx0C0r
 WY1VSYjrinw4QtBPpK3ZS827M0Hc33jPSV+uPTKnLSSjMchupqxkaQYhhIDxgOPnMj
 jzvgaLT9YZhy5gVcvpGzRSmYohN2V3LwIhA3Lt72kQwy2iXC9mpLNDhXTEb9Czo/48
 3AkltJXt7+GY08XxLejgbcQaoOf0gXKzYU+kDjd4Nx+hoWoNbSy76vRMYDIYmSP4vL
 PCZSJ3tvinxfh/m9KLU6GyRfRY+gKl0cpjkNIcjmcf1tDxN4sF/JxKz7sfHufVettz
 R3IF5KUvxsYIQ==
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/2] dma-buf: Add an API for exporting sync files (v14)
Message-ID: <ghrdxG-n_7IGDlRO32CKbt_lB4Fjiyivjnd_4LTpEXgmbDDVje81eohhRJ9TO8n4WMItwKbtzWzr_qR6-0UC8Smw55yD2IypRoFVwQnNufw=@emersion.fr>
In-Reply-To: <CAP+8YyGwEAbsYV_ieDj-vDJYCzhY52yw=iqERJ40PjsPUDHB-Q@mail.gmail.com>
References: <20220506180216.2095060-1-jason@jlekstrand.net>
 <CAPj87rPwx6tL5NtcmP=589wWCyKvZpFfLveaGtsd2wcyCh-1=A@mail.gmail.com>
 <CAOFGe95eEkhGRiDcSb4mvVry1zMYB36aNYm3XWOKb4NESh7wKQ@mail.gmail.com>
 <CAP+8YyGwEAbsYV_ieDj-vDJYCzhY52yw=iqERJ40PjsPUDHB-Q@mail.gmail.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The uAPI looks good to me as well, if that helps.

Acked-by: Simon Ser <contact@emersion.fr>

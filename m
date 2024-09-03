Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4215E96A4F6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 19:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC21310E315;
	Tue,  3 Sep 2024 17:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TTHVR5sL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B3710E096
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 17:02:52 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2f3f163e379so3352231fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 10:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725382970; x=1725987770; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q3YzhK8R11bkvUF8+DllZk6A0z430wy/iDWP4hGpx1g=;
 b=TTHVR5sLTorsLGACbwo51izfiRfdlPxfg5MoJr/1MaE8dU61q2GQhvnoQ23vLNW+DL
 WkugG2xtn0ittrD6blqUz79qGHynht09rFav9bs1x2Y2zHukYI3wDQ4mORd3NR10lE7H
 MPGUiVzSeaKAoswigDW0RnXZNF+LVlmiPLUxI+695xJuOjY9GJxLIqsKEZy1r5owXmsW
 2iH+nKneZQUZdCAg+hIAxfy6kVZ20OSDQF07+VKR7tOzxTdfUIrpAiLXs+5wDe/L08CU
 DA8P8SDBs+sK5AGOlVUNc2GUIoZcBwSIhnBkZ7frx1JXiV1bCorwwvsAWt8GLNHj+mVP
 ow6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725382970; x=1725987770;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q3YzhK8R11bkvUF8+DllZk6A0z430wy/iDWP4hGpx1g=;
 b=KnLmka7uKhsk7Dto9UCQRim8sQC1LGu1gbnWa8fr+bxXOEwmEx6Dqjk78GQSJKSuRQ
 YtvZJOPIbkTKx8irH2g/ZQlajqsREG0bwlqYZwA/f3TFYT8HxAUn5lzSdlQlmBiFTdIm
 MFSlaBgvqjKAF195ei1iQxKlwWdVkJFfvzo2NfP9xK5+DS/6QXn3PJ4xQdjytjLe7vQS
 9mKy14ClMmTrbFm5umgQm7+RFMoMX2DecHy1yBpWaZuC4IhdeqVHuwESvjsCzRA0vn+K
 Y+dqcZ+CeIARbvyF/4tMffwPZAVmG/TShDafFSc+tTDvzf/9fg2DrOs9SxxsN3MP8/Z0
 x+9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhzlaeVGvph7hGcJqfEQ3q+8TJs2tLIS1i1JPPH/bMet+h9Ll53Upd6ALvxvT+OLuFwimRIPbBwPQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA0DIOwl1Z9DIkWaGMCNbEJcuqmQrtj8c7NgVUxrmr2rzOPh/D
 mNR87Ftfv15ExY+WsWy/7F5Ur5HAZ0g3Ee2DMNrLlZS+k4x7lQ2AIb7mO2kdK7gi31UeigRrHVv
 kCDfo8/2y68ycAtB/Pz5lMs0vFCU=
X-Google-Smtp-Source: AGHT+IEzMBGRuqLEiLcO65zri6rKRHx9lCYrxdw3EN0gYO/mD+Tx4K5tZUtqqFzR0RMJZ0s8O33zOc9QJHxxisc+9l8=
X-Received: by 2002:a2e:819:0:b0:2f0:1a95:7106 with SMTP id
 38308e7fff4ca-2f61089392fmr114095061fa.39.1725382969868; Tue, 03 Sep 2024
 10:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240903162729.1151134-1-festevam@gmail.com>
 <0b97acc0-2720-4962-b3c3-bb444cf81e66@denx.de>
In-Reply-To: <0b97acc0-2720-4962-b3c3-bb444cf81e66@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 3 Sep 2024 14:02:38 -0300
Message-ID: <CAOMZO5CBLLO2sL6aJD346O721mRwPKBysRMPnXkq1KXNKo8axw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: lcdif: Document the dmas/dma-names properties
To: Marek Vasut <marex@denx.de>
Cc: mripard@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
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

Hi Marek,

On Tue, Sep 3, 2024 at 1:51=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

> This also applies to MX23 , that one also has the support for
> command-mode LCDs which are then driven by pumping commands via DMA. I
> don't think Linux actually supports this mode of operation, but I do
> recall using it some long time ago on MX23.

I checked the i.MX23 Reference Manual and no LCDIF DMA entry is listed in
either Table 10-1. APBH DMA Channel Assignments or Table 11-1. APBX
DMA Channel Assignments.

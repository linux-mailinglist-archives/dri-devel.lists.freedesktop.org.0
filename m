Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0F3677DAD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 15:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016C010E4A0;
	Mon, 23 Jan 2023 14:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4827810E49F;
 Mon, 23 Jan 2023 14:11:09 +0000 (UTC)
Date: Mon, 23 Jan 2023 14:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1674483067; x=1674742267;
 bh=HiBDKXELdKQw+DQiVPEEqoO2rezV7HYTNwUnPqn/CoU=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=V4gBdM6iuEhUhEPEaadl+/sUS5BuGRUG3zns8fFl4WvFwhGqLjH/A5/qzn07W8B9q
 K977Xz+TpN/25q3dZqMwUGv86aLOVftBnHj4gJFbIBDMaoRu6wRu9IhTbBvzdz+0BT
 Bn6H7wqeq7ZsOHRraE+4CtXDV49xUhUsIJx6DiGj4wlG/9Xy6DQlxLBN0Vf99kY7g3
 /fJ1sBSsm/5WoBGoQnHRsB3/QoRZUyFlX6/WpOwt4C32xIIeMfEdOthoIUROYPAMe3
 GqBkyz/yfwQGz5Ip9aOLHlFjiVqXf2PQLPV8oz8T/2C/FBuevqmWsSywoYGKAICBLM
 Hj7PlLj9wljMw==
To: wayland-devel <wayland-devel@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
From: Simon Ser <contact@emersion.fr>
Subject: [ANNOUNCE] pixfmtdb
Message-ID: <nn8qWh16AviRPuLVOg_I-Nn747ncRsuJsZU_VZHvKhxp2hoFBCFsAfezBDkiwM-yn-CXAW_Vos121VKtETNsSZU3EuCuVzcgHBnnWNnww-g=@emersion.fr>
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

Hi all,

In the last few days I've been working on a small new project, pixfmtdb [1]=
.
It's a Web database of pixel format guides, it can be useful to understand
how pixels are laid out in memory for a given format and which formats from
various APIs are compatible with each other.

pixfmtdb relies on the Khronos Data Format Specification [2] to describe
each format. This means that each format is described with a standardized
data blob, which can be re-used with other tools for other purposes.

My future plans include adding more formats and format families to pixfmtdb=
,
and make it easy to use the data for code generation, in particular for
automatically generating tables containing metadata about formats, as used
in Wayland compositors and other projects.

I hope some of you can find this work useful,

Simon

[1]: https://pixfmtdb.emersion.fr
[2]: https://www.khronos.org/dataformat

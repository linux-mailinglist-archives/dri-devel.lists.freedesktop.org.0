Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B923DD14B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 09:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A997889F85;
	Mon,  2 Aug 2021 07:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381A689F85
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 07:36:41 +0000 (UTC)
Date: Mon, 02 Aug 2021 07:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1627889798;
 bh=bjGffO3ZyKLdM/0/V0E+cpS4f8EA+Sr8NhZrFgsBfas=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=EiVi0SO5cR0KLiV0k3XsQkyqBrUOAnBZXLU44g3m5Lt2OSleOLOj20Pn3oEtY3CZQ
 vtvPVeI9/yUkLHoMkJb3LUTTk0mNYVrUbO7xzhuCevx5l9SVOa0GzxzESp5hG0MWYS
 dF1QUAw0QcyqF1vtAbis6q5TQSbruGnBPA7Kt8pYV+1ri2eG6jV2yQXyWfCydOvZzF
 Ttpio6064MyHDDm4uwWHd3S3DminXTyqiLV2cNAZZiC0j6C81B65twXUif8pShgBbZ
 QHTg8rBpDfmiMoNDXFDvDGBu+d3yZavPw53CJauqjtCZQRvYPiMADIVi+BrNT8IPLf
 feWBiYSkNwxNQ==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: harry.wentland@amd.com, alexander.deucher@amd.com, michel@daenzer.net,
 pekka.paalanen@collabora.com, daniel@fooishbar.org, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 7/7] drm/connector: add ref to drm_connector_get in
 iter docs
Message-ID: <TEH7vVN12SkH1d2BAwcP18Ho63wY_uGecogrNv7qEOs2fMGMmGyNpOsj5b_hZ3rW-s9XhLmM09ETMau1PQ3ifgDDCLqKZfPWzZcNrU1ohLE=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed this one doc patch with Daniel's R-b on IRC.

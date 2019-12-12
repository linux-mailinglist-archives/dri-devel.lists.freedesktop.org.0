Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E26B11C8AB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55706ECC9;
	Thu, 12 Dec 2019 08:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24D96EC38
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 03:13:27 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id u123so344331vkb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 19:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=qFy+H7kpLOQCi2bXrFGLfTS3hB32HkInVCl6xfT8dpg=;
 b=BPi+qOkGODhE0cNvUzOjQaweycsFkpXDHmymFbTaueMMX3gDMHO8dIC3k00b+tEPcW
 vG+bC3LF5EcCXwJKfIxxUBx8pZ0KNOe/S4VSxP9oPke2oqmWPbipH71esM1gkmfFdF6d
 ujEpmbLTv9X3H9LDkYw+j9fuMyhoJuDyHurh4FoXgtMVXY+tS71xKEkabVF2bz78MDnP
 OVh4IzC2XfdcNflyywxPKKNgJBZE6HLnVtPTk84VoInKT5Oim/NK5/TQK9yhocJUAKoO
 ZfTPWwMOUv/Zx5siKX1THnl9TekgRRO7W17mTO2d/GnunuvdiSe0FesvcL7kkeKccMv8
 qmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qFy+H7kpLOQCi2bXrFGLfTS3hB32HkInVCl6xfT8dpg=;
 b=WSxS7y9GWXRGRG0SnEC+XiFilaQZh1sWMRkkjKHtZXUhThqHoJkODbnbQxjM0MM5H3
 Bfo095pnOrIErKoO2oecsYEIiTlDOSAus325wMXUn+RNUHfWvZj8OZlq907IDVRa+rap
 rS9TNBHMTiLHvatSAlqXyTRiV19onqag45B9O1vPZR7MKwWiVcsavt2FpNXeMwbw/Dif
 Q1yoUTEIv1qP1Y2gYEUGiM0CCPJH1kB+vDjc0oyv3xNCVRLujdW+cg19AZ9+MvSmcG3L
 lrYSeULa6AjhXwQYpNNSW/OzWYlNumxP9CCtNBwVuxkKKMs0f+ZnPF3uMDQs45tbfEMt
 t5CA==
X-Gm-Message-State: APjAAAVYyqXjGkwXflTcYFHWT8DfPdzQLOLRI/9LB5jkD0sDVd3/FyRy
 5oz5ECIGiDJYIPC8Glsh9lGQnYi7lStmWYsfAXW1NmffJxs=
X-Google-Smtp-Source: APXvYqztRXenTCkhfdgpimpk/j4rio+pTrKQz0DcwWjyNrS5QTuFR3N0Y782dQ/bl1StpqtwB/v2cNAnO4asxc5H1Ew=
X-Received: by 2002:ac5:c15a:: with SMTP id e26mr6908986vkk.62.1576120406805; 
 Wed, 11 Dec 2019 19:13:26 -0800 (PST)
MIME-Version: 1.0
From: AceLan Kao <acelan@gmail.com>
Date: Thu, 12 Dec 2019 11:13:16 +0800
Message-ID: <CAMz9Wg_iXm1D+0S5n_Dc1_9u4KW3m8bJmLuwMUB=WZeOKD03Kw@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/i915: Auto detect DPCD backlight support by
 default
To: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series of patches works well on a new platform which has a panel
only controls by DPCD aux brightness.

Tested-by: AceLan Kao <acelan.kao@canonical.com>

-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

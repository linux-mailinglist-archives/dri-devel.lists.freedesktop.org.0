Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A854962D474
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 08:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BB110E56D;
	Thu, 17 Nov 2022 07:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DA010E56E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 07:56:17 +0000 (UTC)
Date: Thu, 17 Nov 2022 07:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1668671775; x=1668930975;
 bh=WYuRefUyKGr6lMweRSCbo3l2TIHxHgZBvU3a5FItoNs=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=MbZLgtY/j47Dw22xljN6e7r0bo46ItdP5YGdDrUUoDwx6Vnv8jDKfuXZnGrstuC3x
 MrHMiAlWFV7z1yHgl5Yjf+JQ+4oIv4TF3dGbHvnDY7uYS11pj/zEwCyfodhhPl8obV
 fClzkIiWGaUBDf4yB7/vFfMAsc7579C+XbsN3PecMDD9b04G7juRtBxeZGDHYYsHdR
 pj1GHcMKxAze5bslODwcSfFQCAJDdPSNFgzIePH8rGNj5gQ5RzKI50KsuPHSBnmvuE
 zX0rDm03ODf+NYZKwUAy7Wm3f9I/VZLVfeXcwptLOZ8AcDdrgZJb+TAWW08bHtO1wU
 zwCHQS9vdlR8Q==
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/amd/display: rewrite the check for mods
Message-ID: <rCi2ckxzcwtJsZr86hXMQnk3b1ARq6wXXoNiQe-6cQzinJ7CSzUABqf7k5GfIhKoLQ3wXGOQJPR0TjW2Ddn5sM5ht61w_NEHHeSPdGaIwc0=@emersion.fr>
In-Reply-To: <20221117073258.21214-1-jiasheng@iscas.ac.cn>
References: <20221117073258.21214-1-jiasheng@iscas.ac.cn>
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 Jerry.Zuo@amd.com, aurabindo.pillai@amd.com, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This breaks the "size" out-parameter.

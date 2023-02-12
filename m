Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8FC693949
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 19:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C48B10E41E;
	Sun, 12 Feb 2023 18:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FF110E074
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 12:17:34 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4PF6174MN6z9sTV;
 Sun, 12 Feb 2023 13:17:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1676204251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FczVmXhgWDsSvXajJY85Vq5BsU6XlO1BFQUzsdrxudM=;
 b=WucPbm5G8B8Qkm+q/L0sCsiMGv9lWAriCEH5diEETvW6CEv6A1+ueludFcH03aAQEFIDu3
 R7rH6N84zqgSwBRn2srsxFu4bxkRM18jp9KJSWMoTYogTY5xMlPy17dOdB7RfLbQx1PwSh
 b/DXKG9utMaotfX6xV/UowuZoK8QMezjAVZcCA7ehCL/+V5/9hQd1JdbVErb0TdWczrA+p
 HOJByxDGX8rpnuFtHmuZofP9JtPa/6aVVHrjiYgrSu/aQmg3Mhv7/zeAD8WT2jz9t3JWxu
 KAPlQQmWgS94tK2cwuuGqQ+zy/EfOyy4pzMaqjB5uc/QSg2WKAYeRLVINrbIcw==
From: Frank Oltmanns <frank@oltmanns.dev>
To: Guido =?utf-8?Q?G=C3=BCnther?= <guido.gunther@puri.sm>
Subject: Re: [PATCH 0/1] drm/panel: st7703: Fix initialization failures on
 Xingbangda XBD599
Date: Sun, 12 Feb 2023 13:09:33 +0100
References: <20230211171748.36692-1-frank@oltmanns.dev>
 <Y+jLzCUyno4A+SiD@qwark.sigxcpu.org>
In-reply-to: <Y+jLzCUyno4A+SiD@qwark.sigxcpu.org>
Message-ID: <877cwn13jv.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
X-Mailman-Approved-At: Sun, 12 Feb 2023 18:11:01 +0000
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
Cc: Ondrej Jirman <megous@megous.com>, Purism Kernel Team <kernel@puri.sm>,
 Sam Ravnborg <sam@ravnborg.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


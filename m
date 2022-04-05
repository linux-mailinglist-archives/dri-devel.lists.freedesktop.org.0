Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BF44F572A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 10:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C3110ECD4;
	Wed,  6 Apr 2022 08:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AFE10E90D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 14:22:02 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4KXqbG0VC6zDq89;
 Tue,  5 Apr 2022 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1649168522; bh=CLLs4htNCu9NXok+I5jU2PacFICgyLlDhP0EJR189Vs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jXLd8+Issv7T1ZcyrvmD0gUJA8/oI0nYnvi7fBBafjeaYi3Xbj4+n55odufqTHHCf
 xrwmRt2MxkN0K+8AW0Vi/Zaf0jTxPsbWWrfmUoP4SWShBrBQCh5tif/XdC0SuzrXEy
 78143zUENTTHYpbMJmiSNOQohTcvUuo0uZrIB67Y=
X-Riseup-User-ID: C6AAA16D6EA43AAAC54CD1FE5A8D13D2A212987C43949D043E5CFE534DC884D9
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4KXqbB5wxjz5vRF;
 Tue,  5 Apr 2022 07:21:58 -0700 (PDT)
Message-ID: <3a8413fd-d048-cffe-1600-a0af6544c9f2@riseup.net>
Date: Tue, 5 Apr 2022 11:21:57 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v5 4/9] drm: drm_atomic_helper: Add a new helper to deal
 with the writeback connector validation
Content-Language: en-US
To: Igor Torrente <igormtorrente@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-5-igormtorrente@gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@riseup.net>
In-Reply-To: <20220404204515.42144-5-igormtorrente@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Apr 2022 08:00:38 +0000
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 tales.aparecida@gmail.com, ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Às 17:45 de 04/04/22, Igor Torrente escreveu:
> Add a helper function to validate the connector configuration receive in

Maybe it should be "received"

> the encoder atomic_check by the drivers.
> 
> So the drivers don't need do these common validations themselves.

"don't need do" -> "don't need to do"

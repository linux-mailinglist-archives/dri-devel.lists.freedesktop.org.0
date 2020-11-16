Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB22C2B3FDF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 10:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6812289D60;
	Mon, 16 Nov 2020 09:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F29789D60
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:35:35 +0000 (UTC)
Date: Mon, 16 Nov 2020 09:35:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605519333;
 bh=dhwOahqEPL+WR5vz2OGNgjfAgyhUBTkuqshmZlxWbdk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=SDhqm2iYm3evOXG/H3pOzjlqSf/TqY8iN7Zb+724wR7+TOo84+GZ6K47bZj4y9rvA
 au4RW3pa/p7lxvtDEOjwBBuZYi2C0hJlkrcEWozdhdtu8/cmTxZarIZUugmzJCSdpN
 0d9AZ5AJzqnMTQpP4tQyUCTy5Z/KvuipeGSb9juU61uY1rJff+H01bqiFjxfAtzr7d
 24wAOKNiWBTA1Iuh/pR1r7PzzuSaztGaGxOhBH9QhprXgY6kD4/TtDjld8LMjJ26LA
 3dGBZ7PN9w6oOVJ76RPuG8gKs398AHa7c8DRCcyvBpqQhrhSlV8muHhCqcCfQiN5NN
 Q8UNtDeZMnLtw==
To: Dan Carpenter <dan.carpenter@oracle.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [drm-tip:drm-tip 1117/1129] drivers/gpu/drm/drm_atomic_uapi.c:342
 drm_atomic_set_crtc_for_connector() error: we previously assumed 'crtc' could
 be null (see line 326)
Message-ID: <2fwOpqTWf-nLfb3LIICb8wGICvPCGF0BBMVH2sA2YYNddUjKhFYSzHEq39p2WonBgP4LYE2wb3OnPc-_WtpWGUcgdB3lRy3UtjcsQUFdIY4=@emersion.fr>
In-Reply-To: <20201116093340.GW29398@kadam>
References: <20201116093340.GW29398@kadam>
MIME-Version: 1.0
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
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "lkp@intel.com" <lkp@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "kbuild@lists.01.org" <kbuild@lists.01.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Already fixed in 0003b687ee6d ("drm: fix oops in drm_atomic_set_crtc_for_connector"). Thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

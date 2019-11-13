Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C666FB3B2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 16:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194016ED5F;
	Wed, 13 Nov 2019 15:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106906ED5F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:27:02 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:58967
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iUuXs-0003OP-8a; Wed, 13 Nov 2019 16:27:00 +0100
Subject: Re: [PATCH v4 2/3] drm/fb-helper: Remove drm_fb_helper_unlink_fbi()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch, b.zolnierkie@samsung.com,
 kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
References: <20191113115233.18483-1-tzimmermann@suse.de>
 <20191113115233.18483-3-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <9a532541-9c5b-988c-b043-c7c3365aa49d@tronnes.org>
Date: Wed, 13 Nov 2019 16:26:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191113115233.18483-3-tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nGHgOJddUIpu+jP3QRyHjXyjurR1dZDN3bXLHEUAHtA=; b=eZGiolbm/NEogj0OT0HX5ydYLD
 f+yP8PXfwDjJ5bgwA8Ji2MW9eHe3HJiAhCA1Xk/akM/Gq96h4SGPolAtkr0hC8tML0HwHaPOuxgEG
 ebfjdq5CDUr1AS9jIMvwhHyGtUXE98RlWv2k2PsuJgp/5dTfj1m9UOEYPywCkdJTM8PTmu3+V/3ax
 wI2RIc/jq+JkIMAwbNiH6IWjvMQDge70lqKG5fpI8I+mduGafXiLwJIs+mOHpTplcOh6XrCagArvL
 9yN44q3c7zYxwXrDPAY260/PEcUeJR5ID0IOxyTRiMcuN+UYzAvVXElJ3BV9dXUv7/azjgApXRRKs
 NugHDfAg==;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTMuMTEuMjAxOSAxMi41Miwgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gVGhlcmUg
YXJlIG5vIGNhbGxlcnMgb2YgZHJtX2ZiX2hlbHBlcl91bmxpbmtfZmJpKCkgbGVmdC4gUmVtb3Zl
IHRoZQo+IGZ1bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8
bm9yYWxmQHRyb25uZXMub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
